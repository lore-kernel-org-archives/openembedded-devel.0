Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA0BC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 09:59:07 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.6228.1634896746162569135
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 02:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IwD+y9Ne;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 5so290554edw.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Oct 2021 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KNm3q8l5ho21iCCOXf2GF1jHeIaCei6gcOJ4qqu4z+I=;
        b=IwD+y9NeesUwmP4FNqZCbKsfSLlPEoSlM7/PFnY6JKX4BPl60GSQzqNrEgdw8t2Ca7
         0iVjv6dN0CEbRcegF570aHYuQeUYzHuGww9xNP28dhjx9aAS9CBIvCgWyfrasZneK3BQ
         Q8/j3IWZ8VXoHTx/MLASlJHRD3BL19srKIu1ljVOndWJ31xhLdgrAHVgncF8suabw10M
         m3gc7gNXAY1NS+7j8gAHcQJf50+zJcvsigC4zpl9bcdT02Z2+01C0dhqpu6P4X0K4PG2
         LZZGh8FBKO0oIYSi8RkKuHMReL3KT8Yezhz3Uk61KtRUg9XArk6G+HrNlFMXZFdQ2l5p
         e6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KNm3q8l5ho21iCCOXf2GF1jHeIaCei6gcOJ4qqu4z+I=;
        b=8R8LV74fnLPHFZoPpMMQg9BDS5uu3KTV07DoCCsN3pY89GFrAnHm20pfLNevcQAtO8
         curXuEHwRJ4a3TbId92fwWq1BV4JQ2TSYWHrQy12zAYmXorCYqRroK3/8lYFo/yJAzAd
         J9UMT+cqtFKWYpGFy9gr1wUhnDLeaJ5tSrsNDkChWSWMS4jg8zAd02E3+RrePCKo9j/y
         mX3R8hKLzWy5jXGgXuOIwT8dhEkgOtbVTzELvXxhRqh13gGbz9U3ykpwWJ3cYg2N5aXA
         cj8O8PMvADgCgrVBEwsxApBe5B9ZmGBN22R8PrQ0VcoF13z8q8utT2iA7Y9ic3zBHT6Z
         H1eQ==
X-Gm-Message-State: AOAM533D+gXl1T8IQAJ1Ygp8Vxtx5l7GFL9dzCkLvFR2a2QrvdBV7Las
	7k/lO1XLl0Yp+zeY/TxS2VfDYkQjzFU=
X-Google-Smtp-Source: 
 ABdhPJzFjW1WpHgkHdQXD+Bwd/Qilczi9rL4j3cKmV0f+j3A2ssKYnUlh26gBNzXwqZZT2KecCi13g==
X-Received: by 2002:a05:6402:26d1:: with SMTP id
 x17mr15967978edd.367.1634896743881;
        Fri, 22 Oct 2021 02:59:03 -0700 (PDT)
Received: from Unimatrix08-Focal.lan ([2.198.125.226])
        by smtp.gmail.com with ESMTPSA id
 b26sm3587457ejl.82.2021.10.22.02.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 02:59:03 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH 2/2] vboxguestdrivers: Fix build failure due to the
 last update.
Date: Fri, 22 Oct 2021 11:58:57 +0200
Message-Id: <20211022095857.542113-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022095857.542113-1-costamagnagianfranco@yahoo.it>
References: <20211022095857.542113-1-costamagnagianfranco@yahoo.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Oct 2021 09:59:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93533

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
 .../vboxguestdrivers/vboxguestdrivers_6.1.28.bb               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
index c7e73b222..b76204ae2 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
@@ -49,6 +49,10 @@ do_configure:prepend() {
     # vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:108: *** The kernel build folder path must end in <version>/build, or the variable KERN_VER must be set.  Stop.
     mkdir -p ${WORKDIR}/${KERNEL_VERSION}
     ln -snf ${STAGING_KERNEL_DIR} ${WORKDIR}/${KERNEL_VERSION}/build
+
+    # hack to include in the source directory the utsrelease.h file, making the build succeed.
+    # this might be removed in future releases if the kernel starts shipping this generated file into ${STAGING_KERNEL_DIR} and not ${STAGING_KERNEL_BUILDDIR}
+    ln -snf ${STAGING_KERNEL_BUILDDIR}/include/* ${S}/vboxsf/include
 }
 
 # compile and install mount utility
-- 
2.25.1


