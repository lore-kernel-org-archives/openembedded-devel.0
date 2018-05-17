Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1684D745F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 20:44:42 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id j4-v6so10756470wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 13:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dFDV71sOTUm6ZEvbWncf9WkwxjL7ulp602s5bpBK35I=;
	b=RoxPZMXr/t/Gx0KOaXxtW/1dRm+P02S7v4Zscv2AXcK/kd/JHNvrgVSplmC8/gvPR6
	LZ83QGFa84OKSZPT00LUpPioontpQiAw1tDE4V736Tyq60EZy64oh8SpVe6q6g6G96CI
	plR/MsWNa0+aLcTLBiwLBR30snKET7tL07/l4nZFz+KuhU1C95uPwGPoHSAB9QEL0BjD
	9GLEamIxGA3YeSzin+7QKBH+QktqCZCGjLIx7eU6UGSNTySlPd6BorXeA2oo2CRdNxxd
	O/VnEOX0ODK59MKNajQYoSbGIVjrHDP7HFGh/fmHDwgmXdp28kDKg/zOy5yRe2z28X29
	fRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dFDV71sOTUm6ZEvbWncf9WkwxjL7ulp602s5bpBK35I=;
	b=ZTeLgJcRTQLRSqJ5DyXgasqUmw+h9sek25CdUoYAk+XKiDxiBEEUL1ePfVV7c4mcLV
	JHdaKTmo3ZUExeWbaRIO9e2cVSvqqsRPNO2KmPchcpVO7oB9rYMgqVUeIrcap2AVoSYY
	nP5kZXmuGaWL32Wlz0LACxYrl9U8HCnW9EPXOB9eW0y3BS9x0PFSZFEenDMkh1994EBE
	oerKpC0mc1L78qpgAPrxhNvG52N2KqRtQXWiekBws80RrPESh0MF43AWN2oQ9VzjXERR
	D3ggKh2tDYGKYBjpueLVyq08JObFqQMkwUOFHL50qzWL8A+9ebUYlHWu0EJne9OkcVra
	ToTw==
X-Gm-Message-State: ALKqPwd37P2M/psmfOeBMv9RGM2Eeg1sczL5h+fzZNIGweR+8pqXNccr
	H15IWFeXl9bWGCSLYU7ljcHQ54XdWcf7oAg4ogQxew==
X-Google-Smtp-Source: AB8JxZoxuKzSCJzOazeyzdzQ/xUtNXceby1Tty9Va22YS8hPpghvmrHxMr/qW3FGqn48it39WUD/IGAgdh6Q8rIUL88=
X-Received: by 2002:a50:8d59:: with SMTP id
	t25-v6mr8592922edt.238.1526589883396; 
	Thu, 17 May 2018 13:44:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.72 with HTTP; Thu, 17 May 2018 13:44:43 -0700 (PDT)
In-Reply-To: <CAAQYJAvrQ9G0=+-4oDGsLX_HVFv_jPDAOiuPy+g9gSZvL5E9JQ@mail.gmail.com>
References: <1526249791-5375-1-git-send-email-andrea.adami@gmail.com>
	<0bb5eeb2-a597-38bd-bfd6-99dbf8c786e9@gmail.com>
	<CAAQYJAvAyuatyYg6xn3Xw5-uLdY5NcCM8qCTz0D+KTRUAY745w@mail.gmail.com>
	<CAAQYJAvrQ9G0=+-4oDGsLX_HVFv_jPDAOiuPy+g9gSZvL5E9JQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 17 May 2018 22:44:43 +0200
Message-ID: <CAAQYJAsjrDxCzB7rd_9Dcg6MF5i1Q29oe5rNY8u3XnDV7qgjJA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] ubi-utils-klibc: update from v. 1.5.2 to 2.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2018 20:44:43 -0000
Content-Type: text/plain; charset="UTF-8"

</cut>

>> This fails on qemuarm with the following error.
>
> >>
> >> | ../git/include/libmissing.h:7:10: fatal error: execinfo.h: No such
> >> file or directory
> >> |  #include <execinfo.h>
> >> |           ^~~~~~~~~~~~
> >> | compilation terminated.
> >> | Makefile:2452: recipe for target 'ubi-utils/ubimkvol.o' failed
> >> | make: *** [ubi-utils/ubimkvol.o] Error 1
> >> | Makefile:2452: recipe for target 'ubi-utils/ubicrc32.o' failed
> >> | make: *** [ubi-utils/ubicrc32.o] Error 1
> >> | In file included from ../git/include/common.h:38:0,
> >> |                  from ../git/ubi-utils/ubiupdatevol.c:40:
> >> | ../git/include/libmissing.h:7:10: fatal error: execinfo.h: No such
> >> file or directory
> >> |  #include <execinfo.h>
> >> |           ^~~~~~~~~~~~
> >> | compilation terminated.
> >> | Makefile:2452: recipe for target 'ubi-utils/ubiupdatevol.o' failed
> >> | make: *** [ubi-utils/ubiupdatevol.o] Error 1
> >> | ERROR: oe_runmake failed
> >>
> >> http://errors.yoctoproject.org/Errors/Build/60410/
> >>
> >> - Armin
> >
> >
> > Hi Armin,
> > thanks for testing.
> >
> > Strange, I did cross-build for all archs, maybe some oe-core change.
> > I'll compare with my log (attached the quemuarm).
> >
> > Cheers
> > Andrea
> >
>
> I see the issue is with execinfo.h.
> As of last week ...musl did not have backtrace/execinfo so I think musl has been updated and now the HAVE_EXECINFO_H check fails.
> I'll try to fix this in the recipe.
>
>
> Cheers
> Andrea
>
Armin,

I can't reproduce this even after git-pull:

Build Configuration:
BB_VERSION           = "1.37.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-16.04"
TARGET_SYS           = "arm-oe-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "nodistro"
DISTRO_VERSION       = "nodistro.0"
TUNE_FEATURES        = "arm armv5 thumb dsp"
TARGET_FPU           = "soft"
meta                 = "master:9611485bba03ef77ff31121e3b1da7cd57990c3e"
meta-handheld        = "master:891fefa796ff3a12e4d9470f44597a375818acb6"
meta-initramfs
meta-oe              = "master:61576573e70f8c1d338ddb23d7b76044f68d1cd9"

here logs of tosa (armv5te) and qemuarm (armv5e):

https://pastebin.com/vNx4D14z
https://pastebin.com/gw8vZvCf


Please send me full configure and build logs.
Andrea

