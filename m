Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2FECD4F21
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 14:56:17 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24824.1779029769219854743
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 07:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wt3CqAKF;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: toertel@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso30596656d6.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 07:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779029768; cv=none;
        d=google.com; s=arc-20240605;
        b=BvTvH0/KmV+uxPrOW4HmePzbiciF9cZEN0n+oGQ6DiXgtq+VS2Q8+7w33W9D21CgBM
         ZzRTk0fShG54uXmEi8eLXyZhwKzHaweAubFdo+iXK/CTtGtOi09vkLAC4oJ1B1mj+Hdx
         pUDYZ1mWFA/yJFkHPp4GnGPhyoWxORLwkj4WD+LlK31dJoUW48P3i7Cner4g3m2qcGZm
         hMONcUB+k5+ktLJqvZf/Y/t5gwqeK1t/K5jKB6UmJjP4d6e5skyrWbVnrCXKjqy4NuYr
         S0ZKX3XqPHzHhuKXMxQIQi8yxtsButPiaxV+reW7u55Ipb/rDjpZMLv5PaTreaiLDQJ7
         hzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YnZVdhhhtorSPaSq5W4r1M+t//FHn+Av4g1M5di8eVw=;
        fh=ppDu5lENFy+wt7sBClt9ToB0e70L62hmebRnJUoy2lI=;
        b=JlmF06tfbkOuk3xTG9XEqhbMtjFVgNR6+VJgeyUxCSFzXHZF6QaziOBdPFb0Zu2fMc
         nsnoDbjMAFkhRCfQ+c2PSPkgp3fQCfMihWQqyXpe0eukvxjUiXQ+857MTSGBI/sl7QG/
         tnrB1mUSOPBSbAXuo/g5XOiFldVP2l/bWSofwujj20ixGP4K5mY9wxHpLr4YSVcEuV3b
         IbXy67jmMmY5GdWW8CNsn19ILgzMgBX5Z08pX053AIehHDD/G8/hSksDlUGtl/9kZ/IZ
         gzX71xUipZn6FjAT3JkJFLho2b44MBDx9dd/Q4kp7pg1KswwRpWJcXIZCBvGZT8giDES
         P6mA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779029768; x=1779634568; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YnZVdhhhtorSPaSq5W4r1M+t//FHn+Av4g1M5di8eVw=;
        b=Wt3CqAKFB11UboX2r1aLejbla7eAQKSoHP/9JFQGts/3wWfVN0PJL0RepJwAQMMb9i
         qUlLHjHzCFfPiXuxEtxzdyKhPe51yxJuJZbXYLzW0kbIN6NCec5qxHiLBp7v1A6qR51P
         iMYNhKxUfNBXjVz4E2Pufvc5Rnp4Sc2L472FXHxbQB2egCG4Sz1Vh/5CpF93nKjEo89u
         w2fCiAMFlBo7lXhP8AkDvpdIiyZ9TAe5hSykzAlElZn6RHBArAueQgvsvWNMr6e+AMIq
         M30WfZHIJxIvxQsV/ZILndKu4CHa9guyiSr33Am9tgIrSoPwciXKSJiAlVP5fd4Mrsy8
         YdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029768; x=1779634568;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YnZVdhhhtorSPaSq5W4r1M+t//FHn+Av4g1M5di8eVw=;
        b=U+VuufiAma1MOjKK/QyPWzQ9+QKaNHgPdWRhd5/MimiXuYTpKj24krAyU7bphyaAdM
         8RcGOzIQzhcPVnecmqouhyib1v/CNCS5ea/ERRgUlSZtWWyuzezz/s+oxpmjSFqlzwTN
         6Y1oo7Jv2KvzO826oRfcvNQtI39SvgHsIjyW+wtkDip/VShAi7a6yxMD9V1fCs4Tkp+W
         kOxM1Embm9bHMPD2KWYxW/kbnfX9hp6yHQjuLIfmRWL09fZVG76jYZQpyitBImKsEMtO
         MHFcqheMWC6bBSzZDUiU2QP0gRf68ZG6wPnR6fnZ5eP6BAG1FlpUO1RvQcGfBL6Yv+Y4
         rRkQ==
X-Gm-Message-State: AOJu0Yx1YK/A6GETB0OGnJe8PjhTzHKTWlzzCdXIewmgf+2DHD0ueOCS
	3PDy9expfDER1/OirUBmFvUXwNr3s1RspIEHFrScuoqJTI1lE4j7Nol6F8MbyPLJNSw3S6wS7M/
	JvJ6MAelMR7DHmHwNKth/GrDrhudvbwSvJGsF
X-Gm-Gg: Acq92OGBdy6gSGF1HC6reihDbqx5c3TAjJ/Tf0T8+/HbGtk2w+/O5awCbmwOhfkR0TB
	vWph7ssN0MV4mdu4BNMs5yNX3miHl3nqI3xNDxKwbT7ldShBgwNARwvEessAyyiMs/rDZ9nKB4W
	DWfrzk4xqwkiqjpZAnPVCNJoOYNhmK6+7s9gG9s2s/neCHCs+qWvs53hzCH8dXTh67WYNHCjRPk
	X3m8dUWOtGsEgoRYs1Zna6r8Xqwjhx16TDovj2Xus31ZNcuL5PkE7VkAbBBbS1OxGl/jalpvzT9
	054y8G2YEbmvQqNaOyAd1/TBUbXUo0Kiz5GfbhBF7v1cj8fXe+RhCKYwRUSk
X-Received: by 2002:a05:6214:5a05:b0:8b1:f784:7ec8 with SMTP id
 6a1803df08f44-8ca0f6fcd58mr215466636d6.47.1779029768135; Sun, 17 May 2026
 07:56:08 -0700 (PDT)
MIME-Version: 1.0
From: Mark Jonas <toertel@gmail.com>
Date: Sun, 17 May 2026 16:55:57 +0200
X-Gm-Features: AVHnY4JLKdAQnMholgj0JK2ArhY2QV0bLZe86HqXLxIrwhfkCHz39sGcZW6TiR0
Message-ID: <CAEE5dN3ncGanaEu4WyawkC_mQTXeR4GaehTKFJTuK33tvKOuhA@mail.gmail.com>
Subject: libsdl2 and libsdl2-net regressions on Wrynose
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: f_l_k@t-online.de, Khem Raj <raj.khem@gmail.com>, 
	Ricardo Ungerer <ungerer.ricardo@gmail.com>, jester@theyoctojester.info
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 14:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127043

Hi,

While updating my meta-doom layer for Wrynose I stumbled over two
libsdl2 and one libsdl2-net regression. I'm not sending patches yet
because I am struggling with my QEMU setup. Still, I would like to
give early feedback and potentially collect some feedback.

For reasons I still have to investigate I cannot boot my images on
QEMU. The booting starts but I never get to a login prompt. It freezes
somewhere in the boot process after printing "Booting the kernel
(entry offset: 0x000...ba0).".

### 1 ###

Between Kirkstone / Scarthgap and Wrynose the libsdl2 directfb
renderer was broken by forgetting to adapt it to internal API changes.
I hotfixed the problem using a coding assistant. It compiles now but I
still need to verify that it also runs properly.

libsdl2: Patch directfb compilation error
https://gitlab.com/toertel/meta-doom/-/commit/3b75e8692e41e4a6bd47ad8616a725a469caf41c

### 2 ###

Another libsdl2 regression (worked in Kirkstone and Scarthgap) is that
/usr/lib/pkgconfig/sdl2.pc now contains a buildpath of DirectFB. I
fixed that by mending sdl2.pc after do_install.

ERROR: libsdl2-2.32.10-r0 do_package_qa: QA Issue: File
/usr/lib/pkgconfig/sdl2.pc in package libsdl2-dev contains reference
to TMPDIR [buildpaths]
ERROR: libsdl2-2.32.10-r0 do_package_qa: Fatal QA errors were found,
failing task.

Before:
Cflags: -I${includedir} -I${includedir}/SDL2
-I/home/toertel/projects/yocto/build_wrynose/tmp/work/x86-64-v3-poky-linux/libsdl2/2.32.10/recipe-sysroot/usr/include/directfb
-D_REENTRANT -D_REENTRANT

After:
Cflags: -I${includedir} -I${includedir}/SDL2  -I${includedir}/directfb
-D_REENTRANT -D_REENTRANT

libsdl2: Fix packaging QA issue in sdl2.pc
https://gitlab.com/toertel/meta-doom/-/commit/2dc01101a9e5d050ee7330631012de21719f813b

### 3 ###

Finally, when doing the build configuration (chocolate-doom) I ran
into the problem that SDL2_net.pc is not installed by libsdl-net.
Again, this regression came in between Kirkstone / Scarthgap and
Wrynose. I fixed that by backporting a patch from libsdl2-net 2.4.0.

| checking for SDL2_net >= 2.0.0... no
| configure: error: Package requirements (SDL2_net >= 2.0.0) were not met:
|
| Package 'SDL2_net' not found

libsdl2-net: Ensure that SDL2_net.pc is always installed
https://gitlab.com/toertel/meta-doom/-/commit/5699206aec5b360c96266921f4427b596e44cdea

Cheers,
Mark

