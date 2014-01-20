Return-Path: <jacques.guillou@pelagicore.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9C56B678
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 16:28:18 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id va2so3811044obc.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 08:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=BdqDHeUxir55dTz0SHTGF8ibwlW01LF3o23oQLkX2cQ=;
	b=K+7AZfa7O+ks72PZQSUjRJtn9dNKBDbDauQjDN1Pht9Cv6Mn5C9NFMTuY7L8z7Y0ua
	VdlHgtLFhqmJxU7WeNAOynMALcV4rFkS28WqozQERiMF98/gq+dFliY9gVRSrYySNAJk
	p604keI8jfPaqN3TSfp+mkaHIreOjlBiN9+apZ1O8cQ9lWE2RLMEZHNI9b3bfV7jwc40
	V/0XbIbSjP+87DmA8D1pZ+Jvf1AujqC5y+irsE0D1+tBWs7B2rtQwB99W6ewN+8U2J95
	/bshmqtwqrUv52O/PUCK8EF3L/CS9df+MJ1S+AoyW6rhrO5h7N0OTfIKtJObDIcRsggV
	biPw==
X-Gm-Message-State: ALoCoQm2xNrqjVVTmn5p/Gg+NJ2PE2JUYY8rGwEW7cSbnl2X2+s++w81SL8iDtZmGFZyXIWYyTSO
MIME-Version: 1.0
X-Received: by 10.60.98.40 with SMTP id ef8mr16347507oeb.13.1390235298918;
	Mon, 20 Jan 2014 08:28:18 -0800 (PST)
Received: by 10.76.92.65 with HTTP; Mon, 20 Jan 2014 08:28:18 -0800 (PST)
In-Reply-To: <1506569.WRZEAJxoig@peggleto-mobl5.ger.corp.intel.com>
References: <CAAfCovAgZXFnAJa+OsFUUOAiJ=t13ZuzEn-Y0AR-TXdkjTta+A@mail.gmail.com>
	<1506569.WRZEAJxoig@peggleto-mobl5.ger.corp.intel.com>
Date: Mon, 20 Jan 2014 17:28:18 +0100
Message-ID: <CAAfCovAVrxamEtAz0ZyNJ5Eu6D71gydM-UGnN=pnL3MFb8FdNQ@mail.gmail.com>
From: Jacques Guillou <jacques.guillou@pelagicore.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Bitbake command to clean dependees ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jan 2014 16:28:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Thank you for your answer.

What I would like to do is to be able to trigger the build of a
complete image whenever a new commit has been pushed into a specific
GIT repository. I understand that the normal way to proceed is to
update the corresponding recipe so that it points to the new commit.
Since the recipe would have been updated, the packages which have a
dependency to the updated packages would be rebuilt as well, but I
would really prefer a solution where I don't have to update any
recipe. Please note that what I am trying to do would only be good for
internal testing. I understand that it is a much better practice to
use well defined commit-ID as soon as some kind of delivery, since it
is the only way to properly identify a version.

I am currently testing using a recipe which contains the following lines:

SRC_URI = "git://git@git.mycompany.com/mycomponent.git;protocol=ssh;branch=master"
SRCREV = "master"
PV = "1.0${SRCREV}"

Using that recipe, if I first clean the package with "bitbake -c
cleanall mypackage" and trigger a complete image build, bitbake always
retrieves the head of the master branch when the package is to be
fetched, and compiles the package, which is the result I expect.
Unfortunately, after that package is rebuilt, bitbake seems to
consider that the dependees of that package do not have to be rebuilt,
since no change has been done to any recipe.

Is there any way to get this to work properly ? Maybe there is a way
to tell bitbake to dynamically generate the value of the "PV"
attribute based on the GIT commit-ID which is actually used ?

Thank you

Best regards
Jacques



On 20 January 2014 16:34, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> Hi Jacques,
>
> On Monday 20 January 2014 15:57:39 Jacques Guillou wrote:
>> By default (at least with Yocto), it seems like forcing the rebuild of a
>> specific package (via "bitbake -c cleanall MyPackage") does not mark
>> dependees as "to be rebuilt", which is a problem for me. Is there a way to
>> change that behavior ? Maybe there is a specific command or parameters to
>> be passed to bitbake so that performing a "cleanall" on a given package
>> also performs a "cleanall" on all dependees ?
>
> OpenEmbedded uses signatures for each task (derived from the task's
> dependencies, both in terms of variable values and other tasks) to determine
> whether tasks need re-executing; so, for example if you changed SRC_URI in a
> recipe then the system knows that do_fetch depends upon the value of SRC_URI,
> so the signature of do_fetch changes and it will re-execute followed by items
> it depends upon such as do_unpack, do_patch etc. for the same recipe. Just
> forcing a recipe to rebuild by cleaning it with -c cleanall and then building
> it again doesn't change any of its task signatures, so BitBake will assume no
> dependees need rebuilding.
>
> The correct way to force a task and all of its dependencies to re-execute is
> to use bitbake -c <command> -f or bitbake -C <command>, where <command> is the
> task name without the do_ prefix. However, under most circumstances the build
> system is already capable of determining itself when tasks need re-executing,
> e.g. if you change a variable value or edit a local file mentioned in SRC_URI.
> The question is why do you want to do this forcing, i.e. what change(s) have
> you made that the build system otherwise would not be picking up?
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

