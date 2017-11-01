Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 46C5677F34
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 15:37:58 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id 8so3165760qtv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 08:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sdjUshUZttu+JRAwznyqyOmNSoNI5rjaDYFTH1233FI=;
	b=dNWfnGFWZKawmO0uabKhHm3UhWxuBoqAJQLLgSKKRiHhSnaFCCSgYz6ptWuHVwRBnb
	rOngoaljFNpA8Nd+on7ZvX59gOLvDzp+KVvPm4skav537o/9mKDWxzfEHuXXvAONVViz
	MU5pPvTPNnOcL+Qhe7eDetY8rCua9NO8GW5066yPEgYesgSMwlRlzhGRfvEySVaWsuQP
	84hiTKY3cqQVuSH56C8vILcaZh2JfnSwji3MKa88LTSlq4eVS1Eqk4rUSkyIAgWdN4ea
	nk+l1rbs+6iwbPa3YaG2TFc9R4XgM4MRSHavCpmHv0uTTjwRl3v8rY/WrFBE0YSSfM0k
	EF6A==
X-Gm-Message-State: AMCzsaW5KcaNqt0/c3/eCTTlM0Msu1QNWRwbny7LULb7tafr8djSE6NN
	F09EvwQyHZT+Y7XUVgUvjaC3aMIi
X-Google-Smtp-Source: ABhQp+Q3rnif9/zhMo/VvzbM4VJIz9rd4Q4q95x8gXZG9xDKJWLzN8LPb7gooYrD4x//UvjGcEfkzg==
X-Received: by 10.237.42.230 with SMTP id t93mr369888qtd.317.1509550679728;
	Wed, 01 Nov 2017 08:37:59 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	d193sm604809qkg.88.2017.11.01.08.37.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 08:37:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 11:37:51 -0400
Message-Id: <1509550671-22502-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-hyperlink: add a recipe for version 17.3.1
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
X-List-Received-Date: Wed, 01 Nov 2017 15:37:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-hyperlink.inc        | 17 +++++++++++++++++
 .../recipes-devtools/python/python-hyperlink_17.3.1.bb  |  2 ++
 .../recipes-devtools/python/python3-hyperlink_17.3.1.bb |  4 ++++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-hyperlink.inc
 create mode 100644 meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python-hyperlink.inc b/meta-python/recipes-devtools/python/python-hyperlink.inc
new file mode 100644
index 0000000..2b5b0a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-hyperlink.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "A featureful, correct URL for Python"
+HOMEPAGE = "https://github.com/python-hyper/hyperlink"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
+
+SRC_URI[md5sum] = "eaccb9845b559817e838846669cbc68a"
+SRC_URI[sha256sum] = "bc4ffdbde9bdad204d507bd8f554f16bba82dd356f6130cb16f41422909c33bc"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient"
+
+PACKAGES =. "${PN}-test "
+
+FILES_${PN}-test += " \
+        ${PYTHON_SITEPACKAGES_DIR}/hyperlinkt/test \
+"
diff --git a/meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb b/meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb
new file mode 100644
index 0000000..59a9a5c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-hyperlink_17.3.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-hyperlink.inc
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb b/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
new file mode 100644
index 0000000..3d30af2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_17.3.1.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-hyperlink.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-selectors ${PYTHON_PN}-enum"
-- 
2.7.4


