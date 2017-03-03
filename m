Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F23877602
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 01:29:27 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id s186so23769314qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 17:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yZUfgb7tqzMG8LwctRhlLV/cMqVXBfP3k5fImXCcsEE=;
	b=kII1JOilBKSDRPb2Nihn1iB2rTFLfKZPjSsdKP9BVbQbNK7zBNS6ReokeDNUk0YIGE
	TSPmyKvigOMw05ExNJwFKpuvAPEH/3OgVWqqAEZ63Y1g27wMF2FDwdThnf31j4qe6hFf
	eiNCDHw/on/g/xsL9S4aEnN/s/xydW+oSUmn2PqpNZSo8aGBhAr9VtAPnzh2+eFiHuLr
	Tn9EkyJWWFDrITeI3ATKS7Upvzavs/8eLgElPzQXPiu1z1aXyiAFxA2RLZ93Jqz84Ie1
	4NySwnBSP6hLY4YwXRW6JCGA0RNu853DCrmrnH6bv4hAvVvODEaCD7zWU1tfVQWleYx5
	1qTQ==
X-Gm-Message-State: AMke39m/avi313NK6HssQxAg2CIo9G7zjasNzNVbvAoF9O2N5oPS5g4beOqoVv/k0etRgA==
X-Received: by 10.55.23.19 with SMTP id i19mr196523qkh.261.1488504568939;
	Thu, 02 Mar 2017 17:29:28 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	z32sm6613953qtg.17.2017.03.02.17.29.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Mar 2017 17:29:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Mar 2017 20:29:20 -0500
Message-Id: <1488504560-22789-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-babel: add initial recipe for version 2.3.4
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
X-List-Received-Date: Fri, 03 Mar 2017 01:29:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-babel.inc | 20 ++++++++++++++++++++
 .../recipes-devtools/python/python-babel_2.3.4.bb    |  2 ++
 .../recipes-devtools/python/python3-babel_2.3.4.bb   |  5 +++++
 3 files changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-babel.inc
 create mode 100644 meta-python/recipes-devtools/python/python-babel_2.3.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-babel_2.3.4.bb

diff --git a/meta-python/recipes-devtools/python/python-babel.inc b/meta-python/recipes-devtools/python/python-babel.inc
new file mode 100644
index 0000000..866ce78
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-babel.inc
@@ -0,0 +1,20 @@
+DESCRIPTION = "A collection of tools for internationalizing Python applications"
+HOMEPAGE = "http://babel.edgewall.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
+
+SRC_URI[md5sum] = "afa20bc55b0e991833030129ad498f35"
+SRC_URI[sha256sum] = "c535c4403802f6eb38173cd4863e419e2274921a01a8aad8a5b497c131c62875"
+
+PYPI_PACKAGE = "Babel"
+
+inherit pypi
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-babel_2.3.4.bb b/meta-python/recipes-devtools/python/python-babel_2.3.4.bb
new file mode 100644
index 0000000..e0eadcd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-babel_2.3.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-babel.inc
diff --git a/meta-python/recipes-devtools/python/python3-babel_2.3.4.bb b/meta-python/recipes-devtools/python/python3-babel_2.3.4.bb
new file mode 100644
index 0000000..05084ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-babel_2.3.4.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-babel.inc
+
+# Requires _pydecimal.py which is in misc
+RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-- 
2.7.4


