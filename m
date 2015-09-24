Return-Path: <andrea.adami@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3E476FED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 21:11:28 +0000 (UTC)
Received: by igxx6 with SMTP id x6so628931igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 14:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oQvf8u6IhNXcdzcw3YbNViCNFi7xRQkkCf1mHwomeeo=;
	b=hsfJDSEDRoTb5LAeZr8zi5TjgYx2NjWdvDuF7UdprFZw2RndiFJAWBgL3wyiZl5USu
	GEhBfav/T5ztt+yOK+DiQhsmS4KGOgDmtBREAVynE8Pi6KWXRkPDJ83LU2l8rhFfWuCh
	XtgwZF15l2KACw/lL04DkhJGVSLi74r/4rCHVQTzdNI74mI1/JkfXwCPv0Xv0yjXtVer
	ghKGc5k9OzR5uKaGoyv0YZQ/aIB6F2XbbJGeed2CroImcEEs6QlSdPRUY9oul8dAig0Z
	v/8kCsdhbOX/wNyfRCx8/84Y5srMkFvha38LJJuOYqH96K1hDjxLiIB75rbYUU1yVYw3
	y/jw==
MIME-Version: 1.0
X-Received: by 10.50.50.68 with SMTP id a4mr32385644igo.49.1443129084012; Thu,
	24 Sep 2015 14:11:24 -0700 (PDT)
Received: by 10.36.158.5 with HTTP; Thu, 24 Sep 2015 14:11:23 -0700 (PDT)
In-Reply-To: <CAMKF1srf0TeAhf_f0uNLOvr_Cyet9b5em-iiYrXygWPg+w6z4g@mail.gmail.com>
References: <1443047368-11176-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1srf0TeAhf_f0uNLOvr_Cyet9b5em-iiYrXygWPg+w6z4g@mail.gmail.com>
Date: Thu, 24 Sep 2015 23:11:23 +0200
Message-ID: <CAAQYJAuUpnCC8zapvzs7DM5t+v6xNDjz0TrKgJ5rSZWRsxsbHw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-initramfs][PATCH] kexecboot_0.6: fix build with gcc 5
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
X-List-Received-Date: Thu, 24 Sep 2015 21:11:30 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 24, 2015 at 6:55 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Sep 23, 2015 at 3:29 PM, Andrea Adami <andrea.adami@gmail.com>
> wrote:
> > +-inline void
> > ++extern inline void
>
> would it be better to make it static inline ?
>

Apparently not...

rgba2comp is used in rgb.c and fb.c.
Making it static inline leads to the following error:

| In file included from
/tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/fb.h:39:0,
|                  from
/tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/gui.h:25,
|                  from
/tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/kexecboot.c:43:
|
/tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/rgb.h:55:1:
warning: 'rgba2comp' declared 'static' but never defined [-Wunused-function]
|  rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
|  ^
| arm-oe-linux-gnueabi-gcc  -march=armv5e -marm  -mthumb-interwork
--sysroot=/tmp/build/tmp-glibc/sysroots/poodle -Wall -O2 -pipe -g
-feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed -o kexecboot util.o cfgparser.o devicescan.o evdevs.o fb.o
gui.o menu.o xpm.o rgb.o tui.o kexecboot.o fstype/fstype.o machine/zaurus.o
| fb.o: In function `compose_color':
|
/tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/fb.c:34:
undefined reference to `rgba2comp'
| collect2: error: ld returned 1 exit status

BTW, I didn't test that patch compiling with gcc 4 yet. It is just meant as
a fix for gcc 5 w/out  touching much code.
Thanks for your review, suggestions are appreciated!

Cheers
Andrea

