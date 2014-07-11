Return-Path: <cliff.brake@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDBE7024B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 13:11:48 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id x13so894632qcv.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=/t2TMYTWEMpqEbhhO36T7R3LyvRA9iHKrMTEBGMdjc8=;
	b=ER683qsja+4RaC5iH/WCXEWySPKOqZo9lCn0ab1AC66BtLW27QTPSLif9EJcVTwd9B
	a6bjavgLsxhoQvKSvcclGGNt34sUEZXPs2O6oz7UZT+5bLDs/gzdaG0V/13wvmW3h3RW
	3ewytH6gAaqhRIGNOpGnjLwvLyvO3NjrKS6G/1903Hrmb0otY1c8pgCQ9DNjG/qmTXmj
	/ys+FfJXH6ZFuObU2KH7F+eZHNqIcUFZWNuiXLoGVUkjVXwPsl1HZICoegHV5r55grxM
	Jtjij2Esg4t0r6t8h0iPk2kTv4jK5vYL4QSV4YPES3Ck7fqmuawoG5vKsn2Cpmtw2D+k
	F1WA==
MIME-Version: 1.0
X-Received: by 10.140.102.37 with SMTP id v34mr24881523qge.115.1405084309239; 
	Fri, 11 Jul 2014 06:11:49 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.17.19 with HTTP; Fri, 11 Jul 2014 06:11:49 -0700 (PDT)
In-Reply-To: <CAD2C2VTnHrLsfhRXcUxpcpXgWK+LzxxD87XrvrN6wiiMK+CMUw@mail.gmail.com>
References: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
	<53BC1835.90204@balister.org>
	<CAD2C2VTnHrLsfhRXcUxpcpXgWK+LzxxD87XrvrN6wiiMK+CMUw@mail.gmail.com>
Date: Fri, 11 Jul 2014 09:11:49 -0400
X-Google-Sender-Auth: 7P-VWmotuLgioziEkxuppYmo-0U
Message-ID: <CAOd_LFwfKC5PxsEWQfoKx+aLpnLoUtehC_XRezFFBCN5dYFUbQ@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: open embedded build issues with beagle board
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
X-List-Received-Date: Fri, 11 Jul 2014 13:11:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 11, 2014 at 2:00 AM, Bryan <just4tech83@gmail.com> wrote:
> Hi,
>      As per your suggestion we took oe-core and other packages from
> followinf link:
> -> http://git.openembedded.org/meta-openembedded
>
> We are using bitbake version 1.23.1.
>
> We have to build image for beagleboard so we find following to build image:
>
> ->
> http://www.crashcourse.ca/wiki/index.php/Building_for_BBB_using_OpenEmbedded


I have never used exactly the method you described, so I can't comment
on it.  I would advise you to use standard OE distro (Angstrom or
Poky), and stick with the dora or daisy releases.  There are a number
of ways to do this:

https://github.com/Angstrom-distribution/setup-scripts (use the
anstrom-v2012.06-yocto1.6 branch)

https://github.com/cbrake/oe-build (use the bec1.5-dora branch)

http://git.yoctoproject.org/cgit/cgit.cgi/poky/ (perhaps try daisy branch)

Cliff

