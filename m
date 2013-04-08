Received: from mail-we0-f174.google.com ([74.125.82.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPBRr-0008KM-AF
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Apr 2013 14:45:24 +0200
Received: by mail-we0-f174.google.com with SMTP id u12so4454507wey.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2013 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=7EOz4ge4/YDUsCKS3Ft8rO/px+2obgZo8vOnKn4fVRU=;
	b=HwAXyYBDqkyvv9AnOXE+z1OPSxtTbMSLjyh93b4PMAxg4gW1X+UAFccbNBQOvJhG0f
	RFpXIMMpgwgzwePZcEbOxc0KtleWjggA5RhyrNj1DZ6CLgucD/5Prb73QTlvi6DYwXI/
	cNwMDQKKBCEyw8yTXO6NUIWcXGWbulXlo5+Vr8PYZ/ySyJK/jjWqhSxCMq9tJ8ESOLRj
	wW7acGjlBXtV1lSj3x3cw5u21F5390tf+k/MKjyDFW0rePj2mUnyc6VbMRO3IXGR9LWC
	zjtP2UIPpN6TwHV7y4Z1Hs/r2zFaG98OvFx6oFdA+sx3HibL7hckJNvSL5lBV24zvf6/
	zn4A==
X-Received: by 10.194.104.68 with SMTP id gc4mr30671448wjb.34.1365424084756;
	Mon, 08 Apr 2013 05:28:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gl11sm19376377wic.8.2013.04.08.05.28.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 05:28:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Apr 2013 14:28:03 +0200
Message-Id: <1365424084-20122-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-efl][PATCH 1/2] evas: upgrade to 1.7.6.1 and drop applied patch
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
X-List-Received-Date: Mon, 08 Apr 2013 12:45:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...evas-common_16-add-missing-FRIBIDI_CFLAGS.patch | 39 ----------------------
 meta-efl/recipes-efl/efl/evas_1.7.6.1.bb           | 10 ++++++
 meta-efl/recipes-efl/efl/evas_1.7.6.bb             | 11 ------
 3 files changed, 10 insertions(+), 50 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/evas/0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.6.bb

diff --git a/meta-efl/recipes-efl/efl/evas/0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch b/meta-efl/recipes-efl/efl/evas/0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch
deleted file mode 100644
index 36bbf4a..0000000
--- a/meta-efl/recipes-efl/efl/evas/0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a7ffaed7a67a8cad8bff1134926668f6d01a5ad6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 5 Apr 2013 11:43:53 +0200
-Subject: [PATCH] evas: common_16: add missing FRIBIDI_CFLAGS
-
-Now with including fribidi.h instead of fribidi/fribidi.h we need
-FRIBIDI_CFLAGS to pass -I/usr/include/fribidi, fixes build issue:
-
-| make[5]: *** [evas_soft16_image_scaled_sampled.lo] Error 1
-| In file included from ../../../../src/lib/include/../engines/common/evas_text_utils.h:15:0,
-|                  from ../../../../src/lib/include/../engines/common/evas_font_ot.h:37,
-|                  from ../../../../src/lib/include/evas_common.h:940,
-|                  from ../../../../src/lib/include/evas_common_soft16.h:4,
-|                  from evas_soft16_rectangle.c:1:
-| ../../../../src/lib/include/../engines/common/language/evas_bidi_utils.h:31:22: fatal error: fribidi.h: No such file or directory
-| compilation terminated.
-| make[5]: *** [evas_soft16_rectangle.lo] Error 1
-| make[5]: Leaving directory `/OE/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/evas/2_1.7.6-r1.0/evas-1.7.6/src/lib/engines/common_16'
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/lib/engines/common_16/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/lib/engines/common_16/Makefile.am b/src/lib/engines/common_16/Makefile.am
-index cfa1347..7f630a9 100644
---- a/src/lib/engines/common_16/Makefile.am
-+++ b/src/lib/engines/common_16/Makefile.am
-@@ -7,6 +7,7 @@ AM_CPPFLAGS = \
- -I$(top_srcdir)/src/lib/include \
- @FREETYPE_CFLAGS@ \
- @PIXMAN_CFLAGS@ \
-+@FRIBIDI_CFLAGS@ \
- @VALGRIND_CFLAGS@ \
- @EVAS_GENERAL_CFLAGS@ \
- @EET_CFLAGS@ \
--- 
-1.8.1.5
-
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb b/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
new file mode 100644
index 0000000..189ad17
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.7.6.1.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "3ca69922c4291c933243f7f358930522"
+SRC_URI[sha256sum] = "446434074747e53de01e609882ddd72987ba5708cf66750e4335d31a3045986a"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.6.bb b/meta-efl/recipes-efl/efl/evas_1.7.6.bb
deleted file mode 100644
index d151eb6..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-  file://0001-evas-common_16-add-missing-FRIBIDI_CFLAGS.patch \
-"
-
-SRC_URI[md5sum] = "4bcd5a4721f565bc7dd974973001ef73"
-SRC_URI[sha256sum] = "793b5bc4795cd26e2c10475e1f1647bbc5e052170f6212936b7eb95b87782608"
-- 
1.8.1.5



