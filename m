Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 70252762B4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2015 19:10:34 +0000 (UTC)
Received: by ykdg206 with SMTP id g206so120622505ykd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2015 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8LHjXa/oYY11I56DIll0hHzVwTkfw9g0n5Z5YPlBAMU=;
	b=eSiOLb33Y3/82ZgWkp5t4TUpmAau8Av1qWOqucRc/OEgSnfMBZHbmeyOK24S+dB1xA
	sgH5KOxFAJb2HSEMl62dozgfA0LhWijOARMjVTdVfCvUkW7KDTCpScR4hCsviB2D/8uC
	I2H/LDK8+a7XiG8iHMTkwvoe/DIdaUZDOarExd0cVlky5LiLC7frCEd2Yq/BU/JsCLMy
	dnHi6Za376f1PACKNsq54aYlmDiDqkSzuKEurFFOZafmUJCMtGMcmwj0mpaKf3vYTY97
	OUWvhZnZVy5rKq0cKmdEl+PVhc8zoUkAIlAswjjPsiQV+0Vbc5kvsDNZkdyDRIxlXLTf
	wo7A==
X-Received: by 10.129.0.65 with SMTP id 62mr5460627ywa.14.1442085034198;
	Sat, 12 Sep 2015 12:10:34 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	d14sm4055094ywd.50.2015.09.12.12.10.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Sep 2015 12:10:33 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Sep 2015 12:09:39 -0700
Message-Id: <1442084979-24769-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCH] python-lxml: fix pkg-config for libxml2 and libxslt
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
X-List-Received-Date: Sat, 12 Sep 2015 19:10:37 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 9d1bfbc..8ca8f41 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -16,15 +16,19 @@ SRC_URI[sha256sum] = "b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 DISTUTILS_BUILD_ARGS += " \
-                     --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
-                     --with-xml2-config='${STAGING_BINDIR_CROSS}/pkg-config libxml2' \
+                     --with-xslt-config='pkg-config libxslt' \
+                     --with-xml2-config='pkg-config libxml-2.0' \
 "
 
 DISTUTILS_INSTALL_ARGS += " \
-                     --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
-                     --with-xml2-config='${STAGING_BINDIR_CROSS}/pkg-config libxml2' \
+                     --with-xslt-config='pkg-config libxslt' \
+                     --with-xml2-config='pkg-config libxml-2.0' \
 "
 
+do_configure_prepend() {
+    sed -i -e 's/--version/--modversion/' ${B}/setupinfo.py
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS_${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
-- 
2.1.0


