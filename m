Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.2264.1610708087641542257
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jan 2021 02:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0Mkf-0006Rz-GX; Fri, 15 Jan 2021 12:54:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1l0Mkf-0008ED-F5; Fri, 15 Jan 2021 12:54:45 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [PATCH][meta-oe][dunfell][gatesgarth][master] giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT
Date: Fri, 15 Jan 2021 12:54:37 +0200
Message-Id: <20210115105437.31051-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20210115105437.31051-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Backport upstream patch for CVE-2019-15133.
Set CVE_PRODUCT to "giflib_project:giflib" which is used
in NVD. https://nvd.nist.gov/vuln/detail/CVE-2019-15133

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 .../giflib/files/CVE-2019-15133.patch         | 23 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.1.4.bb   |  7 +++++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch

diff --git a/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch b/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
new file mode 100644
index 000000000..9957be82f
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
@@ -0,0 +1,23 @@
+From 799eb6a3af8a3dd81e2429bf11a72a57e541f908 Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Sun, 17 Mar 2019 12:37:21 -0400
+Subject: [PATCH] Address SF bug #119: MemorySanitizer: FPE on unknown address
+
+---
+ dgif_lib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-status: Backport [https://sourceforge.net/p/giflib/code/ci/799eb6a3af8a3dd81e2429bf11a72a57e541f908/]
+CVE: CVE-2019-15133
+
+--- a/lib/dgif_lib.c	2021-01-13 19:28:18.923493586 +0100
++++ b/lib/dgif_lib.c	2021-01-13 19:28:55.245863085 +0100
+@@ -1099,7 +1099,7 @@ DGifSlurp(GifFileType *GifFile)
+ 
+               sp = &GifFile->SavedImages[GifFile->ImageCount - 1];
+               /* Allocate memory for the image */
+-              if (sp->ImageDesc.Width < 0 && sp->ImageDesc.Height < 0 &&
++              if (sp->ImageDesc.Width <= 0 && sp->ImageDesc.Height <= 0 &&
+                       sp->ImageDesc.Width > (INT_MAX / sp->ImageDesc.Height)) {
+                   return GIF_ERROR;
+               }
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
index 21fa352cd..1871bab46 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
@@ -3,7 +3,12 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2 \
+    file://CVE-2019-15133.patch \
+"
+
+CVE_PRODUCT = "giflib_project:giflib"
 
 inherit autotools
 
-- 
2.20.1

