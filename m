Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 57F68605BE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 15:16:21 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f4so16232311qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 07:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VWSEmGgXohLVTHyrd73bHD3eqo/eD6TSivkRce9D23g=;
	b=AmVglM6qcfypjHYRTSdMyFyUopUYpGPmIVIwj2ng5xKBLtsuiR40/dMlMqSHD/TFDX
	3HJeW5Zy09On7BZW8nkzGtmxsEUlUMw70eqQMnibCX982ZQTAXqKz9K3Og7XbC/3kxjh
	9afAAqrOWEQufrjM3T2hKhb6JBVRiO8q0Lqugm0W4PXQKKyRSBJkqoUaXo7vOLzhiyVe
	7/iRYBePIIqBZm62B9A3Ns2XLZOE7ftPRiB7bH/5TB9HfVpGEa6yba3dYTWuNUBkJ4gO
	dmkcCenN3P5cFYoxnt05Mhy/h/a18UdNeJG7l0KinTIFwpd9HgcTbhPu/R9VXnRmZ56g
	XDLw==
X-Gm-Message-State: APf1xPCK/JHkWVDh9ydXonz+iq0nsBbyRv2rRuCSslS4uoYBFQU7KuCj
	drPbRERm3pF64NR0IHnOuHxZRf5m
X-Google-Smtp-Source: AH8x224mpoI+vvb/ngD3qOJFF8RuKbNNguwN+f2pnUqOQ3ixFDD2l6aS1GOmoD68HDTueoPFf9QGRQ==
X-Received: by 10.237.58.67 with SMTP id n61mr14437205qte.31.1518362182919;
	Sun, 11 Feb 2018 07:16:22 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id y9sm3293155qti.20.2018.02.11.07.16.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Feb 2018 07:16:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Feb 2018 10:15:54 -0500
Message-Id: <1518362154-21864-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pycryptodome: update to version 3.4.11
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
X-List-Received-Date: Sun, 11 Feb 2018 15:16:22 -0000

Update RDEPENDS to work on minimal python distribution
Create a test package for unit tests

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pycryptodome.inc  | 20 ++++++++++++++++++--
 ...todome_3.4.8.bb => python-pycryptodome_3.4.11.bb} |  0
 ...odome_3.4.8.bb => python3-pycryptodome_3.4.11.bb} |  0
 3 files changed, 18 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pycryptodome_3.4.8.bb => python-pycryptodome_3.4.11.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pycryptodome_3.4.8.bb => python3-pycryptodome_3.4.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pycryptodome.inc b/meta-python/recipes-devtools/python/python-pycryptodome.inc
index 1efe1eb..c4969f9 100644
--- a/meta-python/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta-python/recipes-devtools/python/python-pycryptodome.inc
@@ -5,9 +5,25 @@ HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=775fe77831c03bf82f35abc0e230d4c1"
 
-SRC_URI[md5sum] = "030c40da6377bbc82deef8e884fa22cd"
-SRC_URI[sha256sum] = "ede7f1f44b0895feb8ddbf882d1a7eb504deb3fa34fcc4860d6065c25cbdf175"
+SRC_URI[md5sum] = "a2587b6381b0ef4eb960cea1e7507d04"
+SRC_URI[sha256sum] = "c5dd29e9f1b733e74311bf95d0e544e91bd1d14bc0366e8f443562d8d9920b7d"
 
 inherit pypi
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-math \
+"
+
+RDEPENDS_${PN}-tests += " \
+    ${PYTHON_PN}-unittest \
+"
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests += " \
+    ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/ \
+    ${PYTHON_SITEPACKAGES_DIR}/Crypto/SelfTest/__pycache__/ \
+"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pycryptodome_3.4.8.bb b/meta-python/recipes-devtools/python/python-pycryptodome_3.4.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pycryptodome_3.4.8.bb
rename to meta-python/recipes-devtools/python/python-pycryptodome_3.4.11.bb
diff --git a/meta-python/recipes-devtools/python/python3-pycryptodome_3.4.8.bb b/meta-python/recipes-devtools/python/python3-pycryptodome_3.4.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pycryptodome_3.4.8.bb
rename to meta-python/recipes-devtools/python/python3-pycryptodome_3.4.11.bb
-- 
2.7.4


