Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kousiklinux@gmail.com>) id 1OkyB7-0002t5-90
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 13:48:36 +0200
Received: by qwi2 with SMTP id 2so90421qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 04:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=c0GZSm6dXX47ZIIHp/bHRkH24OrTdkYRhgrgstOfPNs=;
	b=qLjLvs1DGVkHbzzkoEQ2jsMumet5A/W/V7+plwnZwRo8SQF+8q3x7CKLesHD2/gEBA
	t6yrjI4sUhI8SSYCXeM+yx09TT1H/SY+S0unC/JO4vQGFzHWq2CCAFB71IjT7H1VL9V6
	1iBqOPxORai9kL6Ma2kTrJqKI/zbhYY+X4jvk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=veKkWc0ZR/Brpo/2OLoRDLbgcNQt37F4cQXJNUARCwbM9aMhFWXwI6W9QiOz0mVxAW
	34zxMqGd+F7jvp8Di5X5/Et5NX1xTwUvaBLJHl6cXE/AersNP8ZM/45ZB55EFh37uCKC
	7GrhCeTpxJyhGbD3JIug6j5JYbonXMMRuXL3E=
MIME-Version: 1.0
Received: by 10.229.37.76 with SMTP id w12mr107614qcd.188.1281959290967; Mon,
	16 Aug 2010 04:48:10 -0700 (PDT)
Received: by 10.229.240.66 with HTTP; Mon, 16 Aug 2010 04:48:10 -0700 (PDT)
In-Reply-To: <AANLkTimLboPPcFegwhZJswLr2cpYayryZMS6zu0SVn9E@mail.gmail.com>
References: <AANLkTi=immHiyS5p0WWmCYaii-5xBruCuBi3_jC_s5Pw@mail.gmail.com>
	<AANLkTimLboPPcFegwhZJswLr2cpYayryZMS6zu0SVn9E@mail.gmail.com>
Date: Mon, 16 Aug 2010 17:18:10 +0530
Message-ID: <AANLkTi=xMwTUONg0ugaR29hnJr8-tGcMUsd6JsQb0aat@mail.gmail.com>
From: Kousik Maiti <kousiklinux@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: kousiklinux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Unable to build system
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
X-List-Received-Date: Mon, 16 Aug 2010 11:48:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Frans.

But now I am facing another problem.

bitbake task-base
/var/lib/python-support/python2.6/bb/COW.py:30: DeprecationWarning: the sets
module is deprecated
  import os, types, sets
ERROR: no files to build.

NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
NOTE: Cache is clean, not saving.
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 143, in <module>
    main()
  File "/usr/bin/bitbake", line 140, in main
    cooker.cook()
  File "/var/lib/python-support/python2.6/bb/cooker.py", line 643, in cook
    return self.buildTargets(pkgs_to_build)
  File "/var/lib/python-support/python2.6/bb/cooker.py", line 530, in
buildTargets
    bb.event.fire(bb.event.BuildStarted(buildname, targets,
self.configuration.event_data))
  File "/var/lib/python-support/python2.6/bb/event.py", line 67, in fire
    if tmpHandler(event) == Handled:
  File "tmpHandler(e)", line 3, in tmpHandler
  File "<bb>", line 19, in check_sanity
NameError: global name 'os' is not defined

I have changed into /usr/share/bitbake/conf/bitbake.conf according to
http://forums.xkcd.com/viewtopic.php?f=20&t=50227

Can anybody help???

Thanks in advanced.

With regards,
Kousik

On Mon, Aug 16, 2010 at 1:29 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/8/16 Kousik Maiti <kousiklinux@gmail.com>:
> > Hi List,
> > I am new to openembeded.
> > I read the usermanual of openembeded. I configured my system as given in
> the
> > manual. But when I run
> > $ bitbake -b /home/kousikm/work/oe/openembedded/recipes/linux/
> > linux_2.6.34.bb
> >
> Don't use bitbake -b. If you are doing that packages that are needed
> to build the package are not build.
> If you're new start with
> bitbake helloworld
> if you are daring then you can do
> bitbake virtual/kernel
> and/or
> bitbake console-image
>
> don't use -b.
>
> Have fun! Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

