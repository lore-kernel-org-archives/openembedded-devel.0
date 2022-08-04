Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D64FC25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:50:55 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.625.1659653435974843279
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QyJbU8TV;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id v1so719261qkg.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=Vv3D6m8UrzLQTBjJEyk5JRjVUMk7/glMIW8hR4x9Zuk=;
        b=QyJbU8TV4ZxaLhWXYoq6VHZ4wdyZZCBs58hDgtsi+gnmEX7igP4Y60HXvz5yERoPyD
         g3e934m9D/LfPDxZWGxyTVzBrgfUEor+/A7VSYBnVkhClrZV+HiZHt/mF3GwH/gNHTwL
         AvyeZSXrC4HTAK2N7SfaMnltPWUGFmPIjRx5SHIRYn/2D9JzRgCkgjY/GF0V4Z71RQZl
         71FtT6RED7Ij79VFh7j/x6JtlkXXSo+12o2DmmaskGmvwO0ur8B3ZAMSatrbD3ETLFWT
         1H5HeV6k2Nm4F0RZR5l6Zp5fjWFC6/nINSAexYLmGPWZxkf6q3JTj1MTVLZp5bg0yZ9h
         x1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=Vv3D6m8UrzLQTBjJEyk5JRjVUMk7/glMIW8hR4x9Zuk=;
        b=ljN7tuH/Eriqc3SAqsC4HTyea2fN2Zn8EWRS4F0x5EJAJ7qcHb2oZYCLsWyvh7hX2F
         KJHUkoDJ8P/Aywwf5MVe6C1sUiVFKpSk6R2lYw0njRmoQ2IY04YMkUbViurbE97FWNlX
         nx28DVC2Dggma2lRH88pcVnIjt9a+fKKlsNYgQ+ycA+UsxX+36iYKakgHTQjYB7oQOJd
         ++wBkxTKgN4zhd1tX9WlaiFT/OjLqBrVBJQiBKYKWg0BYDAmxNj4DNsk/xhlYJgEQpfa
         6MZs+QlPguGdLDVXXzv8BdAOmsx2tqlnYuY/q8dlx4u2Rd6XEm3FgdMeZJzDWKV6A6Vz
         GNWQ==
X-Gm-Message-State: ACgBeo0OlwqisIN86Nr6hvKnd6eBm5nw7wPgYgIciJRHl4pR7HjsDiWn
	h6Ly0UcBEmM5JcEGafB3BFRz63ZT2qexgw==
X-Google-Smtp-Source: 
 AA6agR7FG0fFOKmh0KFB23rmtrm+Yw6bNJ7FNTz6+jjRG7tiMsXSIiPvmWbmLtm4+8aZaVu0jDp+YQ==
X-Received: by 2002:ae9:e901:0:b0:6b6:ad9:c9c1 with SMTP id
 x1-20020ae9e901000000b006b60ad9c9c1mr3146553qkf.313.1659653434255;
        Thu, 04 Aug 2022 15:50:34 -0700 (PDT)
Received: from localhost.localdomain ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 j11-20020ac84c8b000000b0031ea4c4afa7sm1445710qtv.2.2022.08.04.15.50.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:50:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-oe] vboxguestdrivers: fix build against 5.19 kernel /
 libc-headers
Date: Thu,  4 Aug 2022 18:50:32 -0400
Message-Id: <20220804225032.2548994-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 22:50:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98133

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We've bounced back and forth with the mixed libc/kernel module structure of
these drivers. In particular the location and content of stdarg.h has caused
compile problems, or can't be located.

In particular kernel versions have issues with stdarg.h and compatibility
with the sysroot and libc-headers/uapi. If we include the file directly from
the kernel source (STAGING_KERNEL_DIR) we get conflicting types on many
structures, due to kernel .h files being found before libc .h files.  if we
grab just this one file from the source, and put it into our file structure,
everything holds together.

Plus, we get to drop a patch we are carrying to change the include of
stdarg.h

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Hi all,

I ran into this same problem with working through the 5.19 kernel
integration.

The build of the vbox guest drivers is sufficiently mixed (versus
say lttng-modules) that I just can't see a really clean way to
pick up stdarg.h from the kernel source tree .. while picking up
none of the other headers (chaos and madness ensues with redefined
types, etc).

I also can't justify picking stdarg.h out of the kernel source and
putting it in the build artifacts, since that breaks our separation
of source and outputs, and this is the only package that requires it.

This is a middle ground approach that worked both against 5.19 and
older kernels for me.

Cheers,

Bruce

 ...ld-against-5.15-libc-headers-headers.patch | 62 -------------------
 .../vboxguestdrivers_6.1.36.bb                |  9 ++-
 2 files changed, 8 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch
deleted file mode 100644
index 203eec6ee..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 7213a5bfa3bd9f360d6be01e6dbd59d91095a0fd Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Thu, 4 Nov 2021 14:53:46 -0400
-Subject: [PATCH] utils: fix build against 5.15 libc-headers headers
-
-In kernel v5.15+ stdarg.h is part of the kernel source, and the
-upstream project has a change to prefer that stdarg.h to the
-c-library variant and hence includes it as <linux/stdarg.h>, which
-leads to the following build error:
-
-   | In file included from ../vboxsf/include/iprt/types.h:34,
-   |                  from ../vboxsf/include/iprt/string.h:33,
-   |                  from mount.vboxsf.c:53:
-   | ../vboxsf/include/iprt/stdarg.h:49:13: fatal error: linux/stdarg.h: No such file or directory
-   |    49 | #   include <linux/stdarg.h>
-   |       |             ^~~~~~~~~~~~~~~~
-
-If we modify our build of the vboxdrivers to have the kernel source
-directory on the include path (to find linux/stdarg.h, that leads
-to the following errors:
-
-   In file included from build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot/usr/include/stdlib.h:394,
-   |                  from mount.vboxsf.c:36:
-   | build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot/usr/include/sys/types.h:192:20: note: previous declaration of 'blkcnt_t' with type 'blkcnt_t' {aka 'long int'}
-   |   192 | typedef __blkcnt_t blkcnt_t;     /* Type to count number of disk blocks.  */
-   |       |                    ^~~~~~~~
-   | In file included from build/tmp/work-shared/qemux86-64/kernel-source/include/linux/time.h:5,
-   |                  from poky/build/tmp/work-shared/qemux86-64/kernel-source/include/linux/stat.h:19,
-   |                  from build/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.28-r0/recipe-sysroot/usr/include/bits/statx.h:31,
-
-Our libc-headers are safe and don't lead to the potential conflicing
-information that the upstream commit is guarding against. The easiest
-solution is to revert the upstream change and trust our headers.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- vboxsf/include/iprt/stdarg.h | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/include/iprt/stdarg.h b/include/iprt/stdarg.h
-index c73093c..7bffde5 100644
---- a/include/iprt/stdarg.h
-+++ b/include/iprt/stdarg.h
-@@ -44,12 +44,7 @@
- #   define __builtin_stdarg_start __builtin_va_start
- #  endif
- # elif defined(RT_OS_LINUX) && defined(IN_RING0)
--#  include "linux/version.h"
--#  if RTLNX_VER_MIN(5,15,0) || RTLNX_RHEL_MAJ_PREREQ(9,1)
--#   include <linux/stdarg.h>
--#  else
--#   include <stdarg.h>
--#  endif
-+#  include <stdarg.h>
- # else
- #  include <stdarg.h>
- # endif
--- 
-2.19.1
-
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
index 37dd0224d..06dc8a4c8 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
@@ -13,7 +13,6 @@ VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
-    file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
 "
 
 SRC_URI[sha256sum] = "e47942e42892c13c621869865e2b7b320340154f0fa74ecbdaf18fdaf70ef047"
@@ -42,6 +41,14 @@ do_export_sources() {
     install ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/sharedfolders/vbsfmount.c ${S}/utils
     install ${S}/../Makefile.utils ${S}/utils/Makefile
 
+    # some kernel versions have issues with stdarg.h and compatibility with
+    # the sysroot and libc-headers/uapi. If we include the file directly from
+    # the kernel source (STAGING_KERNEL_DIR) we get conflicting types on many
+    # structures, due to kernel .h files being found before libc .h files.
+    # if we grab just this one file from the source, and put it into our
+    # file structure, everything holds together
+    mkdir -p ${S}/vboxsf/include/linux
+    install ${STAGING_KERNEL_DIR}/include/linux/stdarg.h  ${S}/vboxsf/include/linux
 }
 
 do_configure:prepend() {
-- 
2.25.1


