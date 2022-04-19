Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21F9C4332F
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:05 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.965.1650406148493880637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 15:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=CqRXv8jx;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650406148;
  x=1681942148;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7hV2kEIkAHSJISYeGXc0Vn7FqlTbjC97SQ6M6BO9WMo=;
  b=CqRXv8jxCcwcZ3KNcpLN1ss/Nautv8icNHfVKk6jIbZuQrBeRoCSRDJj
   G20auZKtVedypMV6G+EAGWkFibGwMxPW4p1/C29Jufw/3St6UNL+Yjp6Z
   Yrx6SvFdxcYhe9rN6XYvw4KQ/RN5hn0wWzrh0UGXa6uXH397GmsnojNDo
   o2FSfuxCZDcfByQiEFFM6vHSqFiTMLmeq/zXbzUcxVF4hZDPwn+lb21c4
   d9KVGWqt+P5OIfDOjeOV8y7FVAKLWYZQGz0uU/JcRTnt0fFFWl2Fl1bMh
   knJJnjhJSiIf1JsTkXwnYSg/PbrjZoBqiSHGNHy+YPrxxpL45uXW/7PEw
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gpsd: Only copy the Python files if they are created
Date: Wed, 20 Apr 2022 00:09:03 +0200
Message-ID: <20220419220903.23827-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96704

If one adds some configuration that disables the creation of the Python
files, e.g., minimal=yes, then the installation fails when it tries to
copy the non-existent files. Avoid this by checking for their existence
before copying them.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
index c11d4c76d..22706f097 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -73,8 +73,10 @@ do_install:append() {
     install -m 0644 ${S}/packaging/deb/etc_default_gpsd ${D}${sysconfdir}/default/gpsd.default
 
     # Support for python
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/gps
-    install -m 755 ${D}${libdir}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
+    if [ -d ${D}${libdir}/gps ]; then
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}/gps
+        install -m 755 ${D}${libdir}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
+    fi
 }
 
 PACKAGES =+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"

