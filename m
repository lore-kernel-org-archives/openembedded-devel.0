Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.4034.1614549279859539523
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 13:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ER5jtGuG;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614549280;
  x=1646085280;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VPQuu8hLaVehs3jiKCT5JD6VQPKgdCUdVb4/1rR0DV4=;
  b=ER5jtGuGR7AzVdQRiSun1eWZul7fVlN5xAqB295ifsRo29hp2M/hqVFI
   o5IMmNNI4vhnCzdEscd1t83h2IsVAWavhVU+B8sAMdPF5yl12llvv/W0U
   Lya3PAp9QwKIILBZI5cVs3KK6gE2AEMJt+BX0TxhGctNF54xZgk0tQD9H
   tkRagb3lT7B4KRrUgSEcT8JbrFIAvp3f+RITMAaFVXa6XJIaymECOypui
   6pNaDd2gCO+fMqDgbrECXJPrG1AUw+6OFB4BbLJ2oqqu7wPNb6EJBfAmq
   u4H+8aTvP1b8DVX+dnp0SybuhH9pCwlnlvbKnYeyGk6RDMgClNVF9HkwO
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] librcereal: A couple of improvements
Date: Sun, 28 Feb 2021 22:54:34 +0100
Message-ID: <20210228215434.4084-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

* Add "+git${SRCPV}" to PV to indicate that a non-released version is
  used.
* Do not redefine FILES_${PN}-dev; the default will work just fine.
* Move PROVIDES to better match the style guide.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
index 55fb3ebcf..dc5050969 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
@@ -12,6 +12,9 @@ LIC_FILES_CHKSUM = "\
     file://include/cereal/external/rapidjson/msinttypes/LICENSE;md5=dffce65b98c773976de2e338bd130f46 \
 "
 
+PROVIDES += "${PN}-dev"
+
+PV .= "+git${SRCPV}"
 SRCREV = "64f50dbd5cecdaba785217e2b0aeea3a4f1cdfab"
 SRC_URI = "git://github.com/USCiLab/cereal.git"
 
@@ -25,11 +28,4 @@ ALLOW_EMPTY_${PN} = "1"
 
 RDEPENDS_${PN}-dev = ""
 
-PROVIDES += "${PN}-dev"
-
-FILES_${PN}-dev = " \
-    ${includedir} \
-    ${libdir} \
-"
-
 BBCLASSEXTEND = "native nativesdk"
