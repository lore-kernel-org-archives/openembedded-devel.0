Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 16E3678200
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 17:01:32 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id p13so34276640qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 09:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hIVijzV52d5X8maE3dNjBgFSFegMbGCUT5DAVJsV86s=;
	b=BtNdb9ba4Z+S88uCm9ttMoYpVDwh3nAvIg1KK3VhcX+k14gh9J9BLY7eFvPdcPZZhg
	QGLL/YAg/r0zKkTUbPUnaUgtGReCROQRuuAy7Peqv6FP06ICR9a8Mbnb0GVoACSQ9TdR
	kUi3yNfEDEKUcMv7Lk3PHOoEfyZJKQ0maI9JQZtbaKspsw9AIT3kQjvqINdOwZ0OrOpx
	niIfI7OODLAWCMKHStY5hZN+aJDTfLqLZ8dXOAB7der03Vg48YNMHuxKa3lJ+vRJ5ZrI
	QSptXkUqSVDFunN7n5SvMYla9BxK7BPdjZxL9rqxNgMcv4IqEoK804+oxQYnmraI9qw0
	KZjQ==
X-Gm-Message-State: AKGB3mLsRVpzfIQhRHSKWP5Xuq/bfb14/DQFPggtPf/AvvjJAKlpDgua
	QpFeGgQIzYOSwl7ozPh3ctuGbwNa
X-Google-Smtp-Source: ACJfBotQa1wmjQMTCR1BARj7H1EYPpGvpNGE6f6mQjvFOYimUYwF+MYErBm1Tu7K8KeRYIBLjrLRrQ==
X-Received: by 10.55.73.143 with SMTP id w137mr1737601qka.17.1514480493800;
	Thu, 28 Dec 2017 09:01:33 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	z40sm22729027qtj.30.2017.12.28.09.01.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Dec 2017 09:01:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Dec 2017 12:01:24 -0500
Message-Id: <1514480484-23282-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyserial: reorganize packaging and update RDEPENDS
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
X-List-Received-Date: Thu, 28 Dec 2017 17:01:33 -0000

Added packages for OSX, Win32, and java items that are not supports
Updated RDEPENDS to work on a minimal python install

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyserial.inc    | 44 +++++++++++++++-------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index 99c6fc4..8fe3f2c 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -2,26 +2,42 @@ SUMMARY = "Serial Port Support for Python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d476d94926db6e0008a5b3860d1f5c0d"
 
-# FIXME might stop packaging serialwin32 and serialjava files
+SRC_URI[md5sum] = "ed6183b15519a0ae96675e9c3330c69b"
+SRC_URI[sha256sum] = "6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627"
+
+inherit pypi
+
+PACKAGES =+ "${PN}-java ${PN}-osx ${PN}-win32 ${PN}-tools"
+
+FILES_${PN}-java = " \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/*java* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*java* \
+"
+
+FILES_${PN}-osx = " \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/*osx* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/*osx* \
+"
+
+FILES_${PN}-win32 = " \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/*serialcli* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*serialcli* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/*win32* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/__pycache__/*win32* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/miniterm* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/miniterm* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/*windows* \
+    ${PYTHON_SITEPACKAGES_DIR}/serial/tools/__pycache__/*windows* \
+"
 
 RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-fcntl \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-shell \
     ${PYTHON_PN}-stringold \
     ${PYTHON_PN}-threading \
 "
-
-SRC_URI[md5sum] = "ed6183b15519a0ae96675e9c3330c69b"
-SRC_URI[sha256sum] = "6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627"
-
-inherit pypi
-
-do_install_append() {
-	# We don't support jpython now.
-	if [ -e ${D}${PYTHON_SITEPACKAGES_DIR}/serial/serialjava.py ]; then
-		rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/serial/serialjava.py
-		rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/serial/serialjava.pyc
-	fi
-}
-- 
2.7.4


