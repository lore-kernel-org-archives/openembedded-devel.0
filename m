Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OdT9b-0000j1-GB
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 21:16:02 +0200
Received: by bwz10 with SMTP id 10so3165654bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 12:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zXyXpJ6FV0x3hTAhXRmkKpBSvkS5iHOXgcRaDwinxZg=;
	b=LLYEfe8qsVQBr82LVIJV2wNCcwLFiP8c0jTDEYMYNuGdlqUvaNQHRmev59kY2rkPMu
	KoT37KuDRPxKA0r9RIp6TAyCNFUVr7TmPC3Rd3C3Rgdq6YoZqX0lGfZA5X6KFcrk+knU
	kxuFRozDLgsE+jy3W92nh72P7dBRlJe9Sfu4Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JCKidTj4CnTHsmhdgYckJQ1NziihgewG3/rsbWKUydjvfdZpEQmNH6XHfR4OwYCU+s
	9Vb0LGpT6p8md5pp50nn4fdqQCAQfQoyCmpwwq+86UKiUzDp3R2kFTq7dSMfBmEfJA7h
	kYrZ8v1+WErTexw0VOCQaKyVCkhCW2ilV4rMg=
MIME-Version: 1.0
Received: by 10.204.152.4 with SMTP id e4mr5761849bkw.120.1280171743942; Mon, 
	26 Jul 2010 12:15:43 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Mon, 26 Jul 2010 12:15:43 -0700 (PDT)
In-Reply-To: <4C4DD663.1070902@gmx.net>
References: <4C4C9AD7.7010603@gmx.net>
	<AANLkTinQG5SA2sGRj1xapuhfDCxQF4Sss7BHeS=nLesA@mail.gmail.com>
	<4C4DD663.1070902@gmx.net>
Date: Mon, 26 Jul 2010 21:15:43 +0200
Message-ID: <AANLkTi=0VygaJwKNMTYj_HfxNj=zKDPNzmaCQNiU_bhN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: could not include bb file even though it exists and directory included in BBPATH
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
X-List-Received-Date: Mon, 26 Jul 2010 19:16:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/26 Ossy <ossy1980@gmx.net>

> Am 25.07.2010 22:26, schrieb Frans Meulenbroeks:
>
>> 2010/7/25 Ossy<ossy1980@gmx.net>
>>
>>  I used kom to setup a new overlay project. Since listing the images gives
>>> all images in oe, I'm sure that bitbake has access to those bb-files. The
>>> conf/bbplayers.conf includes BBFILES to oe, too.
>>>
>>> Where may I misconfigured the setup?
>>>
>>> ossy@debian-virtual:~/buildroot/kom-dockstar$ echo $BBPATH
>>>
>>>
>>> /home/ossy/kom/openembedded/:/home/ossy/buildroot/kom-dockstar/build:/home/ossy/buildroot/kom-dockstar
>>>
>>>
>> Why do you have the last two paths ?
>>
> I used kom to setup an overlay. My current understanding is, that I can
> start up with an "empty" overlay which initially links to oe. In the future
> I will overwrite some settings and package defintions with "local" (user
> defined overlay) definitions.
>

I don't know kom so can't say anything about that.

>
> Correct me if I'm completly wrong. After reading some tutorials and
> discovering the mailinglist. I thought, defining OE_BBDIR+MYSPECIAL_BBDIR is
> a valid way.
>

The BBPATH itself isok, but your tmp dir should not be inside your overlay
dir.
I would expect TMPDIR to be something like /home/ossy/kom/tmp


>
>  ossy@debian-virtual:~/buildroot/kom-dockstar$ bitbake minimal-image
>>> NOTE: Handling BitBake files: \ (8414/8416) [99 %]ERROR: Could not
>>> include
>>> required file console-base-image.bb while parsing
>>>
>>> /home/ossy/buildroot/kom-dockstar/build/tmp/deploy/glibc/sources/MIT/console-image/
>>> console-image.bb
>>>
>>>
>> This suggests hat it is parsing a console-image.bb file which resides in
>> your tmp/deploy dir.
>> (and not the one in recipes/images).
>> No idea how it ended up there. I suggest to clean at least that file, but
>> preferably the whole tmp dir and build from scratch
>>
> Yepp. That helped: rm -r build/tmp
>
>
> Unfortunatly I'm still not able to create a minimal-image:
> ERROR: Task 306 (/home/ossy/kom/openembedded/recipes/stage-manager/
> stagemanager-native_0.0.1.bb, do_unpack) failed
>
> I guess the stagemanager is an essential tool and should be well tested. So
> were can I find some output which action went wrong?
> (unpacking seems not that difficult to fail...)
>

If stagemanager cannot unpack something is probably wrong in your source
tree.
My recipes/stage-manager has:

rans@linux-suse:~/oe/openembedded/recipes/stage-manager> ls -lR
.:
total 8
drwxr-xr-x 2 frans users 4096 Jul 21 22:13 files
-rw-r--r-- 1 frans users  626 Jul  9 15:26 stagemanager-native_0.0.1.bb

./files:
total 48
-rwxr-xr-x 1 frans users  5215 Aug 23  2009 stage-manager
-rwxr-xr-x 1 frans users 28781 Jul 21 22:13 stage-manager-ipkg
-rwxr-xr-x 1 frans users  6217 Aug 23  2009 stage-manager-ipkg-build

You should have these as well. If not that is the root of your problem.
If you have these, then probably your TMPDIR points to a nonexisting place
(e.g. if it still points to .../build/tmp and you also removed build)

The TMPDIR itself will be created if needed, but the parent dir must exist
as far as I know.



>
> Thanks for the help anyway!
>

No problem.
We all once had to start with this and face issues like the one you have.

Frans.

>
> Kind regards,
> Marcus
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

