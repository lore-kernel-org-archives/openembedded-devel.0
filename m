Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SMJnb-0002nb-OI
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 15:59:27 +0200
Received: by wibhj13 with SMTP id hj13so2485562wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2012 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=W6vWldVMn2fGygrQULxKA6ygecNRptEzoCZU9oau7uY=;
	b=nNT3arLpR6vM0bdOLX0JASpjidf4U+R6JKyPHZVe8Kocg2FqFYZfiMk1RyWPYFcVeG
	hyxu4CAW4m5Y/qNt2sol0k1o0tALyCqrKksmqe4laOEEtkad847S4L4sYdiHQKjjnaxK
	zTW4uRRLTWUrdfVAx8CAaqhzJFnY9sD9HzjXYend877k2gnpBGnkcYYt6kcQXEteXScX
	lUAnPZqx8m6/C7PxW517Gh1LMoj/5pN0EbR4cBLFax6slmnA6C4FmlS6tnrZn8D0Sogq
	sBbhfSPCDMo1xGIzM/NND09SV4j4ynbY41MwY5FJXrB0grcibx5ZjUqZ4h1cEpC2nhmd
	QzcQ==
MIME-Version: 1.0
Received: by 10.180.92.71 with SMTP id ck7mr21724212wib.2.1335188994006; Mon,
	23 Apr 2012 06:49:54 -0700 (PDT)
Received: by 10.223.159.15 with HTTP; Mon, 23 Apr 2012 06:49:53 -0700 (PDT)
In-Reply-To: <jn3j0k$1h7$1@dough.gmane.org>
References: <CAGiJk9c8ThXrLqsrgYQb03hShObTJynt+fxsRxG9VzYOkOsyUg@mail.gmail.com>
	<jmmst9$r5o$1@dough.gmane.org>
	<CAGiJk9e4vZoO1d1cCbh8Lq26m6h3M5rrOOe40CS1ov2VHqh9eQ@mail.gmail.com>
	<jmomha$co7$1@dough.gmane.org>
	<CAGiJk9fy3p550fUxadQUYmahhx4DVRYeEt_GDYgjBhMVpHzBMw@mail.gmail.com>
	<jmpg5o$52s$1@dough.gmane.org> <jmqsdv$ic7$1@dough.gmane.org>
	<CAGiJk9eh0KqA-qE96uc5BwHOu9n7VmGuZzgWcAisa+HhjGagzQ@mail.gmail.com>
	<jmrdgc$cq4$1@dough.gmane.org>
	<CAGiJk9cexZwA0SY5gSfpbMctg4wzjxZ6BAUxZgkY6ApR93SuAg@mail.gmail.com>
	<jmrfan$q6g$1@dough.gmane.org>
	<CAGiJk9eBf_d5pOZtL_Vrmb7aisGBadSzA36yohZJbO7MTPPnFw@mail.gmail.com>
	<jms02o$577$1@dough.gmane.org>
	<CAGiJk9c8ZuD_+BpcJXDo2-f9Ra4NKeoGk-Mvm+VAGA5=w1payw@mail.gmail.com>
	<jn3j0k$1h7$1@dough.gmane.org>
Date: Mon, 23 Apr 2012 15:49:53 +0200
Message-ID: <CAGiJk9e+V8jZWaDR092pTYcC2FJWxKcOsoGzXX5F777gC3yW=g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-kde] Test images (was: Re: [OE-core] RFC: Porting KDE Plasma Active (WIP))
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
X-List-Received-Date: Mon, 23 Apr 2012 13:59:27 -0000
Content-Type: text/plain; charset=UTF-8

2012/4/23 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 23-04-12 09:17, Samuel Stirtzel schreef:
>> 2012/4/20 Koen Kooi <koen@dominion.thruhere.net>:
>
>> And do you have a bbappend for qt to enable GLES?
>>
>>> The "recipes-misc-support/qt4-x11-free_4.8.0.bbappend" [1] enables GLES
>>> for Qt on the soc family omap3.
>
> Actually it doesn't :) That enables EGL mode, but 'desktop GL' as Qt calls it:
>
> OpenGL support ......... yes (Desktop OpenGL)
>
> So I did:
>
> +++ b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
> @@ -1,7 +1,7 @@
> - -QT_GLFLAGS_omap3 = "-egl"
> +QT_GLFLAGS_omap3 = "-opengl es2 "
>
> And I get:
>
> [koen@Angstrom-F16-vm-rpm qt4-x11-free-4.8.0-r43.1]$ grep OpenGL
> temp/log.do_configure
> OpenGL ES 2.x auto-detection... ()
> OpenGL ES 2.x enabled.
> OpenGL support ......... yes (OpenGL ES 2.x)

Interesting,
seems like I have been fooled by Qt:

OpenGL support ......... yes (Desktop OpenGL)
EGL support ............ yes <EGL/egl.h>

For me this sounded as if it was configured right, so "EGL support" is
a bit misleading..

>
> I'm going to see if that actually builds. If so, I'll send a patch to fix it
> and add more TI opengl platforms. And I'll poke my ex coworkers about having
> a bbappend in meta-ti to enable opengl for the respective platforms, doing
> it in meta-kde feels wrong, but works for me at the moment.

TBH it wasn't properly tested yet.
On my Overo every time I start any EGL application all I get is just
EGL_BAD_ALLOC 0x3003 ...
There was a thread about this on the meta-ti mailing list [1], but it
seems to be low priority.
Also with your patch [2] nothing seems to change for me.


[1] https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000798.html
[2] https://lists.yoctoproject.org/pipermail/meta-ti/2012-April/000947.html

-- 
Regards
Samuel


