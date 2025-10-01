Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DD1CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:49:47 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.18542.1759326580818723470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=BmxGQDuC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202510011349338851cdd4e400020717-hsuykm@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202510011349338851cdd4e400020717
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 01 Oct 2025 15:49:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Haq527yiktUnJZsZOQsSO8SjxpzrSYF3fHefVyCu9fc=;
 b=BmxGQDuCvu625DGWwJLhawLbBeULtNnWihSUwaS1p7BVLu6QbBSAgjnCJbfuRxDZ3xY2Ib
 PdQ9O2Q3NH/GGUZLpbIiNkScQP2/bGB/xYjRZX8fVCMdcT7x5H3aM8FYFxEW/6rrXzRNUuOl
 ORPtF4abz+jLxlv+0yAJqKrLfSCXlJC2KdmNZTYTDHroqpFHohfLbnHPo9aP7W+0FFjja0uZ
 cyIY09XRlltoKkHhOh5F2MhOht9Do6UOCkHBUuXbN+1kmuTxaK10RUyshM/8MjqDt2BmJubN
 v3fOEIJJ4f1/C7GsEFcloCCQgXqjDsqX8TlVBOfbGqnDfVtncKbtX4IA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>,
	Khem Raj <raj.khem@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] srecord: fix build failure with gcc-15
Date: Wed,  1 Oct 2025 15:49:07 +0200
Message-ID: <20251001134907.152769-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120113

From: "mark.yang" <mark.yang@lge.com>

srecord/input/file/hp64k.h:82:21: error: ‘uint16_t’ has not been declared
   82 |     bool read_u16be(uint16_t *dest);
      |                     ^~~~~~~~
/home/abuild/rpmbuild/BUILD/srecord-1.65.0-build/srecord-1.65.0-Source/./srecord/input/file/hp64k.h:1:1: note: ‘uint16_t’ is defined in header ‘<cstdint>’; this is probably fixable by adding ‘#include <cstdint>’
  +++ |+#include <cstdint>
    1 | //
make[2]: *** [srecord/CMakeFiles/lib_srecord.dir/build.make:222: srecord/CMakeFiles/lib_srecord.dir/arglex/tool/input.cc.o] Error 1

    * From gcc 13, cstdint header must be explicitly included for uint_X data types.
    * See also: https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes

Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...e-with-gcc-15-by-adding-cstdint-head.patch | 36 +++++++++++++++++++
 .../recipes-support/srecord/srecord_1.65.0.bb |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/srecord/files/0001-fix-build-failure-with-gcc-15-by-adding-cstdint-head.patch

diff --git a/meta-oe/recipes-support/srecord/files/0001-fix-build-failure-with-gcc-15-by-adding-cstdint-head.patch b/meta-oe/recipes-support/srecord/files/0001-fix-build-failure-with-gcc-15-by-adding-cstdint-head.patch
new file mode 100644
index 0000000000..fe55fc5c87
--- /dev/null
+++ b/meta-oe/recipes-support/srecord/files/0001-fix-build-failure-with-gcc-15-by-adding-cstdint-head.patch
@@ -0,0 +1,36 @@
+From 69290e4d727492a63a2a4424368a476b86ef8183 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Mon, 7 Apr 2025 17:18:34 +0900
+Subject: [PATCH] fix build failure with gcc 15 by adding cstdint header
+
+Fixes #79
+
+srecord/input/file/hp64k.h:82:21: error: ‘uint16_t’ has not been declared
+   82 |     bool read_u16be(uint16_t *dest);
+      |                     ^~~~~~~~
+/home/abuild/rpmbuild/BUILD/srecord-1.65.0-build/srecord-1.65.0-Source/./srecord/input/file/hp64k.h:1:1: note: ‘uint16_t’ is defined in header ‘<cstdint>’; this is probably fixable by adding ‘#include <cstdint>’
+  +++ |+#include <cstdint>
+    1 | //
+make[2]: *** [srecord/CMakeFiles/lib_srecord.dir/build.make:222: srecord/CMakeFiles/lib_srecord.dir/arglex/tool/input.cc.o] Error 1
+
+    * From gcc 13, cstdint header must be explicitly included for uint_X data types.
+    * See also: https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/sierrafoxtrot/srecord/pull/80]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ srecord/input/file/hp64k.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/srecord/input/file/hp64k.h b/srecord/input/file/hp64k.h
+index a3f8a6d..205e1e4 100644
+--- a/srecord/input/file/hp64k.h
++++ b/srecord/input/file/hp64k.h
+@@ -21,6 +21,7 @@
+ #define LIB_INPUT_FILE_HP64K
+ 
+ #include <srecord/input/file.h>
++#include <cstdint>
+ 
+ namespace srecord {
+ 
diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
index 3e8a87d07f..b4294975bd 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
@@ -7,7 +7,9 @@ SRC_URI = " \
     https://sourceforge.net/projects/${BPN}/files/srecord/${@oe.utils.trim_version('${PV}', 2)}/${BP}-Source.tar.gz \
     file://0001-Disable-doxygen.patch \
     file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch \
-    file://0001-cmake-respect-explicit-install-prefix.patch"
+    file://0001-cmake-respect-explicit-install-prefix.patch \
+    file://0001-fix-build-failure-with-gcc-15-by-adding-cstdint-head.patch \
+"
 SRC_URI[sha256sum] = "81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc41bd2311d1337644"
 S = "${WORKDIR}/${BP}-Source"
 
-- 
2.51.0


