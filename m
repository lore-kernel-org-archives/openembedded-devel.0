Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.2962.1631905612852568552
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Sep 2021 12:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=V9j23eOn;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631905613;
  x=1663441613;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ANH/teEDN7CTKzNY0J2Vi5jXvMk4+0wh0NBJHIqHV6c=;
  b=V9j23eOnC/Ru6BktApI2KtN4X2HTyjUMUi1VsRsZwbIdjEEH0LGI3Rpv
   j4sBsMnmD/+rb30nCujNeKrSNqLiFMx9sZ3/+ZMCjqVDlGuXR2LItc5ET
   dPGcqevY0HJM7Q2EcxHpbgxbAXPVdZ9xXnMrVFIgUqdzfLzpN+v/PoVNQ
   PsTi58zGjEFxFu1l8lYTVU0/JFFGjy4bx9AZ0SCVOwO0QF21BhOZbyFZ2
   zt59uCBy2n1GLamQofDQQjSYCoZg4nywlpFD3vQPfGD8QV5oy076k+xcA
   c/6Hv4pjLlwIvXehzHEUObpvYCLeKL//gFypCZRcHtVFiD5COjiXcE6o3
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH] libiio: Make libiio-python3 depend on python3-core
Date: Fri, 17 Sep 2021 21:06:45 +0200
Message-ID: <20210917190645.18658-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Inheriting setuptools3 incorrectly adds the dependency on python3-core
to libiio instead of to libiio-python3 where it belongs.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 748633d9d..6ac534a28 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -38,7 +38,10 @@ PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
 
-RDEPENDS:${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
+# Inheriting setuptools3 incorrectly adds the dependency on ${PYTHON_PN}-core
+# to ${PN} instead of to ${PN}-${PYTHON_PN} where it belongs.
+RDEPENDS:${PN}:remove = "${PYTHON_PN}-core"
+RDEPENDS:${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-core ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
 
 FILES:${PN}-iiod = " \
     ${sbindir}/iiod \
