Return-Path: <menschel-d@posteo.de>
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	by mail.openembedded.org (Postfix) with ESMTP id A78F978B06
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 23:30:58 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
	by mout01.posteo.de (Postfix) with ESMTPS id EF01B20F45
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2018 01:30:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1532129458; bh=1jsv5VQYoN1Gxh5yeq1EtwVnoP0lxo4srAf1Ce+yTSE=;
	h=From:To:Cc:Subject:Date:From;
	b=sODt0XJ9PcDaJGoU15kl1GfJAzgM9+oTeNfdRpVNh0q9aAYOxrsTNxttTQjeBcTRU
	1TQfPqzMBsG1va4e0LDbZyzvSpQe/PX6cIGDCX6o8pWRl+kD1DkxFP1wqo/zWDxB2p
	H8Y5Fgwk/h7sGhJf8BxYOi3NvE/aZ/h5XLmh0OJfyt6SU86xTZOumgmOnQJOkuhjtS
	8bY0lw9kpGZnhopITNywC9oxNhsMigIjv8y0mraY4kgYMBSyLgQFlIU0aPJ7IdYZvj
	IK6aa7n8Is12qYhBq5wGMGYFmCwOWQOPGy4duuxaVxLiXwUBqMbZlkfWYuVMBdycI7
	rfY7Oe84sRi2g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 41XRw14HMKz6tmH;
	Sat, 21 Jul 2018 01:30:57 +0200 (CEST)
From: Dennis Menschel <menschel-d@posteo.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jul 2018 01:29:37 +0200
Message-Id: <20180720232937.8303-1-menschel-d@posteo.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python-semver: add new recipe
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
X-List-Received-Date: Fri, 20 Jul 2018 23:30:58 -0000

This small python module provides a way to manage and compare version
strings which adhere to the Semantic Versioning specification [1].

[1] https://semver.org

Signed-off-by: Dennis Menschel <menschel-d@posteo.de>
---
 .../recipes-devtools/python/python-semver.inc        | 12 ++++++++++++
 .../recipes-devtools/python/python-semver_2.8.1.bb   |  2 ++
 .../recipes-devtools/python/python3-semver_2.8.1.bb  |  2 ++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-semver.inc
 create mode 100644 meta-python/recipes-devtools/python/python-semver_2.8.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-semver_2.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python-semver.inc b/meta-python/recipes-devtools/python/python-semver.inc
new file mode 100644
index 000000000..3c95c06ea
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-semver.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python module for Semantic Versioning"
+HOMEPAGE = "https://github.com/k-bx/python-semver"
+BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI[md5sum] = "dc579ba9d0bb2137bad5324d4bdb7e40"
+SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-semver_2.8.1.bb b/meta-python/recipes-devtools/python/python-semver_2.8.1.bb
new file mode 100644
index 000000000..0572feb31
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-semver_2.8.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-semver.inc
diff --git a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb b/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
new file mode 100644
index 000000000..77925ae2b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-semver.inc
-- 
2.17.1


