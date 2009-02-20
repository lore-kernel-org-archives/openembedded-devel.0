Received: from [209.85.162.183] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LaJHA-00057e-Nb
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Feb 2009 01:30:04 +0100
Received: by el-out-1112.google.com with SMTP id v27so563519ele.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 16:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=ea5YOk52GoKiOONCRrrHjliqoCdfuP2JQY9M5q6VpHU=;
	b=ZkBoEVTie/Z0JSZCGmE4pFNQDfMHLMpDX2srPWc+XWDzyKh1uRo7e+4rn/Q2FOZKgx
	5z+mtH3UjoR0AmedY5H5XD/+1Wqu3n7DfYqewQHpX1V2xiexSKtCvBW3Ck+fHBIORBqW
	//puE5Ij2yggjlVDFulIzF48UjW3AOUIKxN/g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=QTmxJ73VH8tnbIJ5jwsF3IdSeTDWtJJmCpQZmzNGoi/knYIwytJFgf1jIBRW2u7AW1
	/s3Z0LWyuooda55PUTh3b6JeI5HAfXh91YCqrAEUo1PImdmCrnSY5SGWGdD7x6XWC3aO
	MAw1SvJEpOAKBOgVKBv5v6caI+RGiVVw/zmv0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.147.10 with SMTP id z10mr1491747ybn.29.1235089654799; Thu, 
	19 Feb 2009 16:27:34 -0800 (PST)
In-Reply-To: <20090219234114.GD22652@denix.org>
References: <1235086132-21843-1-git-send-email-clarson@kergoth.com>
	<20090219234114.GD22652@denix.org>
Date: Thu, 19 Feb 2009 17:27:34 -0700
X-Google-Sender-Auth: 6d8d9502bf327dd0
Message-ID: <b6ebd0a50902191627x48e60175o8f3e20e0a0bf2104@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <clarson@mvista.com>
Subject: Re: [PATCH] bitbake.conf: rework FILESPATH generation.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Feb 2009 00:30:25 -0000
X-List-Received-Date: Fri, 20 Feb 2009 00:30:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Heh, already sent this reply out, but from the wrong email address.
This time it should actually hit the list...

On Thu, Feb 19, 2009 at 4:41 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Feb 19, 2009 at 04:28:52PM -0700, Chris Larson wrote:
>> From: Chris Larson <clarson@mvista.com>
>>
>> Rework FILESPATH generation to be done in bitbake.conf, avoiding the
>> confusion about it being in multiple places.  Adds FILESPATHBASE and
>> FILESPATHPKG which can be manipulated rather than manipulating FILESPATH
>> directly.
>>
>> One usage possibility:
>>
>> FILESPATHBASE =. "${TOPDIR}/files:"
>>
>> Which would let me provide a custom busybox config for this build by
>> copying the defconfig from the openembedded metadata into my
>> build/files/busybox-1.0/ directory, for example.
>
> Can you please provide more details on this example? Thanks.

Normally, all paths in FILESPATH are relative to FILE_DIRNAME, the
location of the recipe being operated against.  With this change, you
can place files which are in SRC_URI as file:// urls in paths relative
to other locations.

You can do package customizations via changes to file:// files without
mucking up the local clone of the openembedded repository.

My intent is to create a class to facilitate running make menuconfig
on your kernel and busybox, and retain those changes.  Today, people
either go into workdir and customize it there, but those changes are
lost when you clean the package, or they overwrite files in the
metadata repository, which can lead to conflicts, and is just all
around more annoying to work with.  It's better to be able to have per
build or site wide overrides of those files.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


