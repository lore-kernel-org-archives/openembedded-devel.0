Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.17264.1593432772872950043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpseY-0001kP-Nu; Mon, 29 Jun 2020 15:12:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-yappi: Upgrade 1.0 -> 1.2.5
Date: Mon, 29 Jun 2020 15:12:31 +0300
Message-Id: <20200629121233.27026-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Fix HOMEPAGE. Use file LICENSE for LIC_FILES_CHKSUM. Upgrade
to release 1.2.5:

- Fix tag/ctx_id filtering on get_func_stats
- Add filter_callback to get_func_stats() for filtering
  function/module descriptors
- FIX: issues related to invalid conversion from long->ptr in
  Win32
- Optimize tstate->dict retrieval
- Various other fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-yappi_1.0.bb => python3-yappi_1.2.5.bb}   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.0.bb => python3-yappi_1.2.5.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-yappi_1.0.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
index 75de4dfbe..366dec3dc 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.2.5.bb
@@ -1,11 +1,11 @@
 SUMMARY  = "Yet Another Python Profiler"
-HOMEPAGE = "http://yappi.googlecode.com/"
+HOMEPAGE = "https://github.com/sumerc/yappi"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
-SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
+SRC_URI[md5sum] = "83237494e7d22df2a31935a1e6650fa6"
+SRC_URI[sha256sum] = "ad5fa4caf2859e480ffc4ec3e85615a6f7dea852c8f035f2db723f824ed4ba11"
 
 SRC_URI += " \
     file://run-ptest \
@@ -28,5 +28,5 @@ RDEPENDS_${PN}-ptest += " \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    cp -f ${S}/yappi.py ${D}/${PTEST_PATH}/
+    cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/
 }
-- 
2.17.1

