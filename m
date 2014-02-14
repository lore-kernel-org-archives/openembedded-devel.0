Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 82A986E99E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 07:41:16 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id jt11so12011352pbb.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 23:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2oFn83mvU54u4KpsqM0mGjUO0yK0KHsUHL2D0lUig8U=;
	b=evlO/0wf8+BdvwYCWpjb3We3/UBrIngD0fydGo6YatMe0mATBnwe3Itw2hVheBHkj+
	RH4F0U06xEYxWmB4nBgRTo35niXgjIlwm02P2qc8l5xhtFhZxQ6jTnhl2KyCqoRruNj7
	XArehe3tasnDsVk4R2kcWs9NZAr48elLLbI5/DlYsihKhONt3gZgBfA/bw7hjT+1iWmy
	kFaDJkvGnIZ3PPkfl6lcd0WW6B4N7z3WY3MpbaHGgNrVd806JYgy4cjoua6Yp8JaJFnI
	TEvdCcWENu13csWQgOxqRx+VR9qUjJI9ho/OShBqVAN1xrwsuNBI/jx/VV272JrPe1yL
	962g==
X-Received: by 10.66.138.40 with SMTP id qn8mr7362599pab.154.1392363677556;
	Thu, 13 Feb 2014 23:41:17 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id de1sm14124436pbc.7.2014.02.13.23.41.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Feb 2014 23:41:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Feb 2014 23:41:40 -0800
Message-Id: <1392363700-22933-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH V2] libmicrohttpd: upgrade to 0.9.33
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2014 07:41:17 -0000

libmicrohttpd is needed by systemd-journald-gatewayd
Remove older recipes and move to recipes-support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libmicrohttpd/libmicrohttpd_0.4.6.bb           |   16 ----------------
 .../libmicrohttpd/libmicrohttpd_0.9.33.bb}         |   20 ++++++++++++--------
 2 files changed, 12 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
 rename meta-oe/{recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb => recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb} (23%)

diff --git a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
deleted file mode 100644
index ebaa485..0000000
--- a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application."
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
-
-DEPENDS = "libgcrypt curl"
-
-# ftp://ftp.nluug.nl/pub/gnu/${PN}/ has only 0.9.* and newer now
-SRC_URI = "http://mirrors.usc.edu/pub/gnu/${PN}/${P}.tar.gz"
-SRC_URI[md5sum] = "61698da6aa04744ea076c327f66fc05a"
-SRC_URI[sha256sum] = "0cb09e26678d1531a4fd40a748abff5142bfdad3ae11cfe3bb7ad7317a99e371"
-
-inherit autotools lib_package
-
-do_compile_append() {
-    sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
-}
diff --git a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
similarity index 23%
rename from meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
index 802ae40..2c738c9 100644
--- a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb
@@ -1,16 +1,20 @@
-DESCRIPTION = "GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application."
-LICENSE = "LGPLv2.1"
+DESCRIPTION = "A small C library that is supposed to make it easy to run an HTTP server as part of another application"
+HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+SECTION = "net"
+DEPENDS = "gnutls libgcrypt curl"
 
-DEPENDS = "libgcrypt curl"
-
-SRC_URI = "ftp://ftp.nluug.nl/pub/gnu/libmicrohttpd//libmicrohttpd-${PV}.tar.gz"
-SRC_URI[md5sum] = "a10496b7f1b495aaf6897584da52f51b"
-SRC_URI[sha256sum] = "d532edf64c3a9da472114c2d10fc94606e3b31f21b883ec2e796ab8478f7e9cb"
-
+SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "013b10f9de1cda5448b29c81305354a3"
+SRC_URI[sha256sum] = "d9587e8497548f820650cd607daf3615ea3272435779378983032c570f1cd559"
 
 inherit autotools lib_package
 
+EXTRA_OECONF += "--disable-dependency-tracking --enable-largefile \
+                 --enable-curl --enable-messages --with-pic"
+
 do_compile_append() {
 	sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
 }
+
-- 
1.7.10.4


