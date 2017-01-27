Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 60683606A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:11:47 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so57104768wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=djNTgZFiBqYjkL7MQQihgbSkSe5E/YaiBPAlm530TmU=;
	b=ll7/GkKrjr9yjTR56/WnwuRApkbImm4SDvJyP8Knu2UWDgJaQaX24/58vzs9Crxr2q
	t/3UEUbLLYbney1ipY3evb6iZYV38iMYRuJ94X0eHt3DwRPj95on4EKE9RcOBAIrgm3d
	YKrJ099bpdxA8BawoD9ivcuEtHSoX9Pom/p78rwEKXp3BUYN+n6Sv6PcH3ewR5fhuQY0
	qCBG5qzgpjLqO8G/ZV+IVNR5yBBcnw+Ti28Sy4IuYuisCGFi5lVPXItIeaYMUnPpplXg
	1AJ/S1nHW3JOlgXmcjypmHttrt6mDtNvK0G3EB595N7Uv84O7LvqkL//NHBAynNzWk0Q
	LsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=djNTgZFiBqYjkL7MQQihgbSkSe5E/YaiBPAlm530TmU=;
	b=saxaqryxAbBBgsLxRMHTAkjKUou9mrFsffMVyNYD90umEbAJMza5j5QEcPbASqmd8/
	nCUXByO1NHTwU7M0DbP0+xbFCMH4RNlvgcg4SHQq4tGLRqXJA8LzKbj/Tj0mf8PI/PgQ
	wreY2oy2zW1i3uXnhUyqV00FC9u/IuVV3MBEkWS8VqZC0j/MxL7O//TzfO8oaQprTO2Y
	4cYl4N5M3B5lUzjzOf59H9twGmBYo5JAu3ZMwPnqL3rOyZbbPsjV1qjfA2MEd0Zsnms2
	yh9lc8cnoOyoDCsM2AWTW5d3iBBxLyZS9YlRfkiJpBgPUayKo7GYFY4XY5+BZG8+1uOU
	5yPA==
X-Gm-Message-State: AIkVDXKhal5GneWNPhGrzRGugGmR/Btl+iR//RDAh8JY1p2mviUXrJ5mcvLePE6plg8JooPpdcT3KWY09+RWrA==
X-Received: by 10.28.189.134 with SMTP id n128mr2207304wmf.77.1485511907648;
	Fri, 27 Jan 2017 02:11:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.152.19 with HTTP; Fri, 27 Jan 2017 02:11:47 -0800 (PST)
In-Reply-To: <fe240a61-4206-750d-c913-9073d79c1245@gmail.com>
References: <1485160227-29998-1-git-send-email-samuli.piippo@qt.io>
	<20170125160207.GF3260@jama>
	<CAHvQdo3_+YfdZN_MYmZQLOW7uDnE-=LuXUwL8SR7sXLCG8VVyA@mail.gmail.com>
	<20170126125414.GA3016@jama>
	<CAHvQdo1SNOuWuyeAQU_sC88cU_vMbd=PRWt4fVSaQAq3OhM7jw@mail.gmail.com>
	<fe240a61-4206-750d-c913-9073d79c1245@gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Fri, 27 Jan 2017 11:11:47 +0100
Message-ID: <CAHvQdo2064s02qfdg0_hn8nwF6urBuuSNSw8ro7fDhKCfqdyCQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v5] Upgrade to Qt 5.8
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
X-List-Received-Date: Fri, 27 Jan 2017 10:11:49 -0000
Content-Type: text/plain; charset=UTF-8

I'm building for i.MX6. The problem is that the build is failing
because the egl CFLAGS are not set:

| In file included from
/mnt/raid/yocto_env/poky/morty/ppt50/build/tmp/sysroots/ppt50/usr/include/EGL/eglplatform.h:38:0,
|                  from
/mnt/raid/yocto_env/poky/morty/ppt50/build/tmp/sysroots/ppt50/usr/include/EGL/egl.h:39,
|                  from
../../../include/QtEglSupport/5.8.0/QtEglSupport/private/../../../../../../git/src/platformsupport/eglconvenience/qt_egl_p.h:63,
|                  from
../../../include/QtEglSupport/5.8.0/QtEglSupport/private/qt_egl_p.h:1,
|                  from
/mnt/raid/yocto_env/poky/morty/ppt50/build/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/git/src/platformsupport/eglconvenience/qeglstreamconvenience_p.h:55,
|                  from
/mnt/raid/yocto_env/poky/morty/ppt50/build/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/git/src/platformsupport/eglconvenience/qeglstreamconvenience.cpp:40:
| /mnt/raid/yocto_env/poky/morty/ppt50/build/tmp/sysroots/ppt50/usr/include/EGL/eglvivante.h:266:2:
error: #error "Platform not recognized"
|  #error "Platform not recognized"

This flags are used inside the eglvivante.h to get the correct
platform. There is a pkconfig file which defines them: Cflags:
-I${includedir} -DLINUX -DEGL_API_FB -DWL_EGL_PLATFORM

Before the update to Qt5.8 there were a patch for the configure file
to set these variables:

+ if [ -n "$PKG_CONFIG" ] && $PKG_CONFIG --exists egl 2>/dev/null; then
+ QMAKE_INCDIR_EGL=`$PKG_CONFIG --cflags-only-I egl 2>/dev/null | sed
-e 's,^-I,,g' -e 's, -I, ,g'`
+ QMAKE_LIBS_EGL=`$PKG_CONFIG --libs egl 2>/dev/null`
+ QMAKE_CFLAGS_EGL=`$PKG_CONFIG --cflags egl 2>/dev/null`
+ QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
+ QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
+ QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " | sed -e
's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
+ fi

This patch was removed, so my question is how should this work now?
A workaround is to set this variables in the linux-oe-g++.
I also tried to use the device option: -device linux-imx6-g++ but this
failed with the following error even if the path was correct.

| Project ERROR: CROSS_COMPILE needs to be set via -device-option
CROSS_COMPILE=<path>
| Could not read qmake configuration file
/mnt/raid/yocto_env/poky/morty/ppt50/build/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/git/mkspecs/devices/linux-imx6-g++/qmake.conf.



2017-01-27 10:06 GMT+01:00 Samuli Piippo <samuli.piippo@gmail.com>:
> On 01/26/2017 05:22 PM, Johannes Pointner wrote:
>>
>> Did you also see the issue with the QMAKE_INCDIR_EGL, QMAKE_LIBS_EGL
>> and QMAKE_CFLAGS_EGL variables?
>
>
> What's the target and configuration you using for the build and what's the
> actual error you are seeing?
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

