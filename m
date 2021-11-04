Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C57C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:58:38 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.2906.1636055917139265339
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JGdowWPF;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id p17so5727794qkj.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5AJpmIFtnHx4C7II0Up7i2D6rfPYSiaa+mn9WeBPkfM=;
        b=JGdowWPFYcl2542QEXAaiYx92w8GUytxm8qLFI2adY/g+dacH1+dmO3JMllxpNO/CR
         WRdZ1bkhZUMcLwLGgQfk8XT6tAXPwLU7KhyDy4irwMGB/p1HKnqnUbRUhExln0Vxd3Wd
         5YORfY61PEvngemhn2Mia0RUw9YFo6A9LxpAaRajX7CL0mZTKEpOQQV2tB+BTShfiiDE
         IFA0Xwvfu/nQQS1ZUOvFE0F77Iq4U1HrXfofhUuYD0bfNNg/6q3kpWqkxCAt3boUTror
         Uld1NC2icd67XTYWwZGuaih0OzJAVkGb/p0gZUWH+ZG/LqO9M1MfMeXxY44q+S/1Nipg
         c5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5AJpmIFtnHx4C7II0Up7i2D6rfPYSiaa+mn9WeBPkfM=;
        b=YrNwE3TgD9Qk1RjcCwx590YpHBAtZ4YzAxwIhyhscqogGjG1HEPgmvHaDsufW4gYk2
         d+YNKR5tOw+vCHUmh/1/Z7KWyLrUCvSyK2cBAajuN7LCq43JoE9qScil0G2J60OPGnYi
         zyb07xRuqYO2wulEyeirE8XJQofPclJ4dj+Cwv1YbvpsC22gLdHfE6Vyk7aJTI397ugV
         7i/nawg13HbXQNDAJYHuYL+B0vvoPscgpd5XGnpjaWgklrlXh4gU4FP7pdvYIKGA9gcD
         kjLe9ZurDC1SpzPpJD6B/saAGDP8FAArUSyzdBeI6fmWWvOexj7ywJcjs/d9sX1F2VMM
         Werw==
X-Gm-Message-State: AOAM5302X+FIMs61VGRkohHwakl8otUdDLUxVyX4fA+dNYmTb+39dN/M
	tNiy4EGxq2OpmpOi7Jfpd7KdAaD5zjXGtg==
X-Google-Smtp-Source: 
 ABdhPJyMcpti0O3qVEQij/0LWGMG8z/bYIs42Zy9rmfWelLZShwZqKovuVMqpW23mXbVZpWgze16LA==
X-Received: by 2002:a05:620a:1031:: with SMTP id
 a17mr42904077qkk.339.1636055915964;
        Thu, 04 Nov 2021 12:58:35 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 y14sm4823497qtw.68.2021.11.04.12.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:58:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH][meta-oe] vboxguestdrivers: fix build against 5.15
 kernel/libc-headers headers
Date: Thu,  4 Nov 2021 15:58:34 -0400
Message-Id: <20211104195834.8322-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 19:58:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93824

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In kernel v5.15+ stdarg.h is part of the kernel source, and the
upstream project has a change to prefer that stdarg.h to the
c-library variant and hence includes it as <linux/stdarg.h>, which
leads to the following build error:

   | In file included from ../vboxsf/include/iprt/types.h:34,
   |                  from ../vboxsf/include/iprt/string.h:33,
   |                  from mount.vboxsf.c:53:
   | ../vboxsf/include/iprt/stdarg.h:49:13: fatal error: linux/stdarg.h: No such file or directory
   |    49 | #   include <linux/stdarg.h>
   |       |             ^~~~~~~~~~~~~~~~

If we modify our build of the vboxdrivers to have the kernel source
directory on the include path (to find linux/stdarg.h, that leads
to the following errors:

   In file included from build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot/usr/include/stdlib.h:394,
   |                  from mount.vboxsf.c:36:
   | build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot/usr/include/sys/types.h:192:20: note: previous declaration of 'blkcnt_t' with type 'blkcnt_t' {aka 'long int'}
   |   192 | typedef __blkcnt_t blkcnt_t;     /* Type to count number of disk blocks.  */
   |       |                    ^~~~~~~~
   | In file included from build/tmp/work-shared/qemux86-64/kernel-source/include/linux/time.h:5,
   |                  from poky/build/tmp/work-shared/qemux86-64/kernel-source/include/linux/stat.h:19,
   |                  from build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot/usr/include/bits/statx.h:31,

Our libc-headers are safe and don't lead to the potential conflicing
information that the upstream commit is guarding against. The easiest
solution is to revert the upstream change and trust our headers.

Upstream-Status: Inappropriate [OE specific]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Khem,

As part of my expanded libc-headers and kernel testing, I'm making
sure to build the vbox guest drivers. As you can see, they had some
trouble with 5.15

This solution is consistent with other kernel userspace utilities,
I'll watch for the next release of the package and see where the
upstream finally lands.

Bruce


 ...ld-against-5.15-libc-headers-headers.patch | 62 +++++++++++++++++++
 .../vboxguestdrivers_6.1.28.bb                |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch
new file mode 100644
index 000000000..6c11f1d4c
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch
@@ -0,0 +1,62 @@
+From 7213a5bfa3bd9f360d6be01e6dbd59d91095a0fd Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Thu, 4 Nov 2021 14:53:46 -0400
+Subject: [PATCH] utils: fix build against 5.15 libc-headers headers
+
+In kernel v5.15+ stdarg.h is part of the kernel source, and the
+upstream project has a change to prefer that stdarg.h to the
+c-library variant and hence includes it as <linux/stdarg.h>, which
+leads to the following build error:
+
+   | In file included from ../vboxsf/include/iprt/types.h:34,
+   |                  from ../vboxsf/include/iprt/string.h:33,
+   |                  from mount.vboxsf.c:53:
+   | ../vboxsf/include/iprt/stdarg.h:49:13: fatal error: linux/stdarg.h: No such file or directory
+   |    49 | #   include <linux/stdarg.h>
+   |       |             ^~~~~~~~~~~~~~~~
+
+If we modify our build of the vboxdrivers to have the kernel source
+directory on the include path (to find linux/stdarg.h, that leads
+to the following errors:
+
+   In file included from build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot/usr/include/stdlib.h:394,
+   |                  from mount.vboxsf.c:36:
+   | build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot/usr/include/sys/types.h:192:20: note: previous declaration of 'blkcnt_t' with type 'blkcnt_t' {aka 'long int'}
+   |   192 | typedef __blkcnt_t blkcnt_t;     /* Type to count number of disk blocks.  */
+   |       |                    ^~~~~~~~
+   | In file included from build/tmp/work-shared/qemux86-64/kernel-source/include/linux/time.h:5,
+   |                  from poky/build/tmp/work-shared/qemux86-64/kernel-source/include/linux/stat.h:19,
+   |                  from build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot/usr/include/bits/statx.h:31,
+
+Our libc-headers are safe and don't lead to the potential conflicing
+information that the upstream commit is guarding against. The easiest
+solution is to revert the upstream change and trust our headers.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ vboxsf/include/iprt/stdarg.h | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/include/iprt/stdarg.h b/include/iprt/stdarg.h
+index c73093c..7bffde5 100644
+--- a/include/iprt/stdarg.h
++++ b/include/iprt/stdarg.h
+@@ -44,12 +44,7 @@
+ #   define __builtin_stdarg_start __builtin_va_start
+ #  endif
+ # elif defined(RT_OS_LINUX) && defined(IN_RING0)
+-#  include "linux/version.h"
+-#  if RTLNX_VER_MIN(5,15,0)
+-#   include <linux/stdarg.h>
+-#  else
+-#   include <stdarg.h>
+-#  endif
++#  include <stdarg.h>
+ # else
+ #  include <stdarg.h>
+ # endif
+-- 
+2.19.1
+
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
index 0265e38f5..014fe30bb 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.28.bb
@@ -13,6 +13,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
+    file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
 "
 
 SRC_URI[md5sum] = "c6efae8dc115b90c6124e13126794c4f"
-- 
2.19.1


