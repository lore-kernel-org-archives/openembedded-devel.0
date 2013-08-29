Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id CCAFE6BE6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:34:04 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so429092eak.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Bca82acpr3k9cLSwV7D+x2ncynKX2a0ibFo57PCssvQ=;
	b=yg8SXlZzeAEEqyTk2PcUoOoOBdI9McVSGd9EZErckHaPsuwCDN7hl+0xoDDTztnxbX
	I2io9x38ZgBQphelKg67mmiYE3ao78yEzqVctSrus8a2VuOC4PTbuU+RY1I61vg+NPzz
	qNRknB0STsM95sAMFfXH5e78+qv9HmdfiSPhNb+XGVDBYYl6n2D2x0idFaNvEPqcm5AN
	87w1OoUCVWTTh0iBV/icZCFXEOXSSHw+5auW+4FqIQO4H67sB/J6z7CxmgQtGEI12RNM
	0vcRldzg17TRs94AkUMQtqV8xrxmEBrf/liOnYC/Hs1YsR+yF4Q79ned3FKVmjutBt5s
	OG8A==
X-Received: by 10.14.205.9 with SMTP id i9mr5086981eeo.72.1377801244926;
	Thu, 29 Aug 2013 11:34:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm48311580eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:34:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 20:35:07 +0200
Message-Id: <1377801307-30128-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-browser][PATCH] firefox: add nss libraries to PRIVATE_LIBS and add dependency on external nss, nspr
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
X-List-Received-Date: Thu, 29 Aug 2013 18:34:05 -0000

* fixes following warnings and makes shlibs providers for nss libs
  more deterministic
  WARNING: firefox-10.0.11esr is already registered as shlib provider for libfreebl3.so, ignoring nss-3.13.3 trying to register the same
  WARNING: firefox-10.0.11esr is already registered as shlib provider for libnss3.so, ignoring nss-3.13.3 trying to register the same
  WARNING: firefox-10.0.11esr is already registered as shlib provider for libnssckbi.so, ignoring nss-3.13.3 trying to register the same
  WARNING: firefox-10.0.11esr is already registered as shlib provider for libsmime3.so, ignoring nss-3.13.3 trying to register the same
  WARNING: firefox-10.0.11esr is already registered as shlib provider for libnssutil3.so, ignoring nss-3.13.3 trying to register the same
  WARNING: firefox-10.0.11esr is already registered as shlib provider for libnssdbm3.so, ignoring nss-3.13.3 trying to register the same
  WARNING: firefox-10.0.11esr is already registered as shlib provider for libssl3.so, ignoring nss-3.13.3 trying to register the same
  WARNING: firefox-10.0.11esr is already registered as shlib provider for libsoftokn3.so, ignoring nss-3.13.3 trying to register the same

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox/firefox_10.0.11esr.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index 0774bb7..1a1178c 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see packages/COPYING)
 
 DESCRIPTION ?= "Browser made by mozilla"
-DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx virtual/libgl"
+DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx virtual/libgl nss nspr"
 
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
@@ -138,3 +138,15 @@ PRIVATE_LIBS = "libmozjs.so \
                 libmozalloc.so \
                 libplc4.so \
                 libplds4.so"
+
+# mark libraries also provided by nss as private too
+PRIVATE_LIBS += " \
+    libfreebl3.so \
+    libnss3.so \
+    libnssckbi.so \
+    libsmime3.so \
+    libnssutil3.so \
+    libnssdbm3.so \
+    libssl3.so \
+    libsoftokn3.so \
+"
-- 
1.8.3.2


