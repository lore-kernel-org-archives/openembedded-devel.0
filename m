Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.3026.1631905907320046425
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Sep 2021 12:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=TMKCu+HG;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631905908;
  x=1663441908;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/TbDWDy5rpHSuUVKePNszLqKCf6OfCPDvtjTahmkFG4=;
  b=TMKCu+HGcFFqh7egQYfMYjgG0MRHD3G6zzQbt3U70r1bH/6NKFseKMck
   af0gr/GvM51QgScUmUaRCwuXlKpcNB9gzzY71zNr1xKPEtbuIekRkM5MX
   l2I/Q7A7t4fgmJYUsHdkAJ23MZj/sV3DdLchMOSAkEMsRkugF08VZ0pOZ
   BXgs8nryWrOfSKU1I2ombLVcznfcOD9QAoaxGA3gFsDWhlPbskqpIsQRh
   fRRVQnFzh6oAlorNO8o57aZxvmYXhvtfxlLKl3CJDHMFRN3u4hKuFZN5g
   gjj5y+TFFzZ4eoxaOHoMfemQg5hGXeeJYB0R7+ifC1kgUdG5NSLduQBVm
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][hardknott][PATCH] libiio: Make libiio-python3 depend on python3-core
Date: Fri, 17 Sep 2021 21:11:40 +0200
Message-ID: <20210917191140.19563-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Inheriting setuptools3 incorrectly adds the dependency on python3-core
to libiio instead of to libiio-python3 where it belongs.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index d7e4cc60a..cfd9746bd 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -37,7 +37,10 @@ PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
 
-RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
+# Inheriting setuptools3 incorrectly adds the dependency on ${PYTHON_PN}-core
+# to ${PN} instead of to ${PN}-${PYTHON_PN} where it belongs.
+RDEPENDS_${PN}_remove = "${PYTHON_PN}-core"
+RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-core ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
 
 FILES_${PN}-iiod = " \
     ${sbindir}/iiod \
