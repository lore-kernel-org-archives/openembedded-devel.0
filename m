Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id EDEF5606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 14:32:01 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q8so4102645qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6MsMQpJz4b53tdvqSrcKDdmVMz35bLivugQoAi10MNE=;
	b=eRRzLp/od7p6GzWUmSXP2DryHDXrIup6HpVQ+K0P0uqnzV+IU0A4oPo+xf1AFz3fG4
	rLUZ5K8RgHAUCMrSqj3qoLSI8Ef2Xu/vSHdzf7TRdZOTMWVScP25QNWhWBESWGBm56hT
	mBr9gR0kDauDUapqpSpjf7IrisJT38vzbJR6/Lyp+PKVpz4N87empKh0W5CYsQYFUF3t
	qjjrJ6o5GVZOj7ZVUV92piZwSN7y/KwBtRoMipgMnqrMmI2o71iaEg7boCFSq+es+2Ta
	LzmXDl7ce4mjRpAmbgcryq+4ZXwDp9SPVq81tH/ZP2fG1I3MW6vvfEckk31dEtOu/b4+
	u/Jg==
X-Gm-Message-State: ALyK8tJ+o7VnVtQ2Q/gWrWcnImhAMXPiR4SloTBANSUxUIXni3ccpX4L3N7wEkBi8QyJjg==
X-Received: by 10.55.195.75 with SMTP id a72mr63850346qkj.4.1469025122360;
	Wed, 20 Jul 2016 07:32:02 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id a66sm1568310qkg.2.2016.07.20.07.32.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 07:32:01 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 10:31:54 -0400
Message-Id: <1469025114-392-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCHv2] python-werkzeug: update RDEPENDS to work for minimal python2.7 and python3
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
X-List-Received-Date: Wed, 20 Jul 2016 14:32:03 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-werkzeug.inc    | 23 +++++++++++-----------
 .../python/python-werkzeug_0.11.10.bb              |  2 ++
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index f6f75d0..547aa87 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -16,15 +16,16 @@ SRC_URI[sha256sum] = "cc64dafbacc716cdd42503cf6c44cb5a35576443d82f29f6829e5c4926
 PYPI_PACKAGE = "Werkzeug"
 
 RDEPENDS_${PN} += " \
-    python-difflib \
-    python-email \
-    python-html \
-    python-json \
-    python-netserver \
-    python-numbers \
-    python-pkgutil \
-    python-subprocess \
-    python-threading \
-    python-unixadmin \
-    python-zlib \
+    ${PYTHON_PN}-datetime \    
+    ${PYTHON_PN}-difflib \
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-io \    
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unixadmin \
 "
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.11.10.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.11.10.bb
index dd14608..3892f13 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug_0.11.10.bb
+++ b/meta-python/recipes-devtools/python/python-werkzeug_0.11.10.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools
 require python-werkzeug.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-zlib"
-- 
1.9.1


