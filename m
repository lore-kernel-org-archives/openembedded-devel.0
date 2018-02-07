Return-Path: <tomasz.meresinski@comarch.pl>
X-Greylist: delayed 1590 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Feb 2018 12:48:32 UTC
Received: from odzwierny3.comarch.com (odzwierny3.comarch.com [217.74.69.18])
	by mail.openembedded.org (Postfix) with ESMTP id E221A77FED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Feb 2018 12:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	authenticated as tomasz.meresinski@comarch.com
	by odzwierny3.comarch.com with esmtpsa (TLSv1:AES128-SHA:128)(ComArch
	ESMTP) id 1ejOji-000J25-Py; Wed, 07 Feb 2018 13:22:02 +0100
From: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Feb 2018 13:21:58 +0100
Message-Id: <1518006118-26628-1-git-send-email-tomasz.meresinski@comarch.pl>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CA-Antivirus: Scanned by ComArch Antivirus on odzwierny3.comarch.com
X-CA-Is-Spam: No
Cc: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.com>,
	=?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
Subject: [rocko][meta-python][PATCH] python-cryptography: fix dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 12:48:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

python-cryptography changed dependency from python-pyasn1 to python-asn1crypto (e6a129724b707ebf79149376251e85fad550414).
This patch fixes it in RDEPENDS.
It should be applied with d808282ff3ff9c91a11d3912843d8e40022b9d08 from master which adds python3-asn1crypto package.

Signed-off-by: Tomasz Meresiński<tomasz.meresinski@comarch.com>
---
 meta-python/recipes-devtools/python/python-cryptography.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 87ff16c..4ba3e32 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d5ede125ed08d4fd14ec44d334bdb388"
 DEPENDS += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-cffi-native \
-    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-six \
 "
 
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "d04bb2425086c3fe86f7bc48915290b13e798497839fbb18ab7f6dffcf
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-pycparser \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
@@ -26,7 +26,7 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-idna \
     ${PYTHON_PN}-numbers \
-    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-pycparser \
     ${PYTHON_PN}-subprocess \
     ${PYTHON_PN}-setuptools \
-- 
2.7.4


