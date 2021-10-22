Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFACC4332F
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 19:55:01 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.2539.1634932500382021242
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 12:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fbsu6INy;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id w15so567096edc.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g+36n2vtGZxR1DvQKuSbwjhOrJEG/IGUi/ylOktS+5k=;
        b=Fbsu6INyBQdxLh1db/GFf19j69W+lzG1EdyNVm0ROc5MX2LWUV8F2aC16vNkKzQ4nv
         ohEv5AaYX+Ublz226sEZVTLe9rVpDbCrg+wS6T/233gwLQ6EE57ckUw2fHwUxMJt4dfq
         JkOKIpX5W9eq7FAVFs7xULoW4x0HpsUC3KDMGHhABpZvqPC0HQsHZNtuK6JXrRSAKwXA
         XugD8a3OC3H9WZFT88TvvgRw3aJ0S6VEUkfkKiBvIBkK/8I+IDa47NC7AJ2VPyhP6quf
         oOqPHWVrYHwykoo7tdmBCdy4tgICzxkWOOzsXpDQoAjRrSXf9Z75sAMm0hqOf3KrlH7G
         R2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g+36n2vtGZxR1DvQKuSbwjhOrJEG/IGUi/ylOktS+5k=;
        b=Z3tmxgSfcU8n3nLuG317Od2f7MXL/zgfU8gKqSmQrq+xRCTYY2/J6V8P/L5/HuBHV7
         LrW29pNouTRG2XfGAMmIJedQ2HH3NYjFKIXltaxftH1u71Uzz9i1+mkj6gj3Yiz32dKb
         JmUpTM1WMZe4BkfeATHvbpa8I0OQ/J+3w2261mP4pBskypn0VZgmS2DX4vtt7ot5xwNc
         yhDyf6GhjE1snyrNO70eDGK2LmC4NWJTt2npG+JdpGzXEQANUKNsLXevCiNbzdhSERVI
         ATG6lX3hqSL0T0Vu1qw+rEBgJgyAcTtizUd0XNPYnPOP7vmfQazCcjFacg3oeL/D3K1N
         5c9A==
X-Gm-Message-State: AOAM532HHp5dYnOLh87Ozp6e6Yk27ONpfY5/qt6ipSHS/H/xln6gGrb9
	yShAKzrBQK/ecE7xhwUddT9dkZ39if0=
X-Google-Smtp-Source: 
 ABdhPJz4RzTXwQz1XBvCRhyzvgycOVZ0n8ZoUIWvTxtM7eAWkgsx6UNydfjLX9Qn83Kpg2bqocEXXQ==
X-Received: by 2002:a05:6402:40cd:: with SMTP id
 z13mr2649089edb.220.1634932498769;
        Fri, 22 Oct 2021 12:54:58 -0700 (PDT)
Received: from Unimatrix08-Focal.lan ([2.198.125.226])
        by smtp.gmail.com with ESMTPSA id
 go33sm1257249ejc.120.2021.10.22.12.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 12:54:58 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] vboxguestdrivers: Fix build failure due to the
 last update.
Date: Fri, 22 Oct 2021 21:54:54 +0200
Message-Id: <20211022195454.569232-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022195454.569232-1-costamagnagianfranco@yahoo.it>
References: <20211022195454.569232-1-costamagnagianfranco@yahoo.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 19:55:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93540

the utsrelease.h is not included in the STAGING_KERNEL_DIR, but in STAGING_KERNEL_BUILDDIR

So, adding a hacky symlink into the source directory fixes the issue for now.
This can be re-evaluated if poky maintainers start shipping such file into another directory or patch module*.bbclass to take account
of this additional dir into *FLAGS

https://errors.yoctoproject.org/Errors/Details/613563/

make: Entering directory 'TOPDIR/build/tmp/work/qemux86-yoe-linux/vboxguestdrivers/6.1.28-r0/vboxguestdrivers-6.1.28/utils'
i686-yoe-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=TOPDIR/build/tmp/work/qemux86-yoe-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot  -I. -I../vboxsf -I../vboxsf/include -DRT_OS_LINUX -DIN_RING0 -DIN_RT_R0 -DIN_SUP_R0 -DVBOX -DVBOX_WITH_HGCM -DIN_MODULE -DIN_GUEST_R0 -c -o mount.vboxsf.o mount.vboxsf.c
i686-yoe-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=TOPDIR/build/tmp/work/qemux86-yoe-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot  -I. -I../vboxsf -I../vboxsf/include -DRT_OS_LINUX -DIN_RING0 -DIN_RT_R0 -DIN_SUP_R0 -DVBOX -DVBOX_WITH_HGCM -DIN_MODULE -DIN_GUEST_R0 -c -o vbsfmount.o vbsfmount.c
In file included from ../vboxsf/include/iprt/stdarg.h:47,
                 from ../vboxsf/include/iprt/types.h:34,
                 from ../vboxsf/include/iprt/string.h:33,
                 from mount.vboxsf.c:53:
../vboxsf/include/iprt/linux/version.h:40:11: fatal error: generated/utsrelease.h: No such file or directory
   40 | # include <generated/utsrelease.h>
      |           ^~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
Makefile:39: recipe for target 'mount.vboxsf.o' failed
---
 .../vboxguestdrivers/vboxguestdrivers/Makefile.utils            | 2 +-
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils
index 495601f08..5982e2d08 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/Makefile.utils
@@ -13,7 +13,7 @@
 INCLUDES = -I. -I../vboxsf -I../vboxsf/include
 MOD_DEFS = -DRT_OS_LINUX -DIN_RING0 -DIN_RT_R0 \
            -DIN_SUP_R0 -DVBOX -DVBOX_WITH_HGCM -DIN_MODULE -DIN_GUEST_R0
-CFLAGS	 = ${INCLUDES} ${MOD_DEFS}
+CFLAGS	 = ${INCLUDES} ${MOD_DEFS} ${EXTRA_CFLAGS}
 LDFLAGS	 =
 
 SRCS     = mount.vboxsf.c \
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
index c7e73b222..0265e38f5 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
@@ -54,7 +54,7 @@ do_configure:prepend() {
 # compile and install mount utility
 do_compile() {
     oe_runmake all
-    oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
+    oe_runmake 'LD=${CC}' 'EXTRA_CFLAGS=-I${STAGING_KERNEL_BUILDDIR}/include/' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
     if ! [ -e vboxguest.ko -a -e vboxsf.ko -a -e vboxvideo.ko ] ; then
         echo "ERROR: One of vbox*.ko modules wasn't built"
         exit 1
-- 
2.25.1


