Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 9814071B57
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Apr 2017 01:09:18 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 66BEE5C0648;
	Sat, 15 Apr 2017 03:09:15 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Apr 2017 18:09:08 -0700
Message-Id: <1492218548-22881-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1492218556; bh=WFveskMhuh26wrwSNuh2McVAFedeY86TCshsBK42vzs=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=DqkjQMaNeUiY6A2peBWcCZHzfLat4N9L7cwApzirahhpSOYqZVqcTU5OJ3imqSHwyHyxrXrCY5tBuuSzqTANZCgHw5ACV5K6nPsR7QBjnaJtIRPREa9LbBB6WJ5cQqaa8PZgxWN2vnx9filSnumKYnWOutPlkkxh4R1bvjyxXFE=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-python][PATCH] python-can: add initial recipe for version 1.5.2
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
X-List-Received-Date: Sat, 15 Apr 2017 01:09:19 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Add initial recipe for python-can library which provides controller
area network support for Python 2/3.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-python/recipes-devtools/python/python-can.inc       | 9 +++++++++
 meta-python/recipes-devtools/python/python-can_1.5.2.bb  | 4 ++++
 meta-python/recipes-devtools/python/python3-can_1.5.2.bb | 4 ++++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-can.inc
 create mode 100644 meta-python/recipes-devtools/python/python-can_1.5.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-can_1.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
new file mode 100644
index 0000000..1878f31
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Controller Area Network (CAN) interface module for Python"
+SECTION = "devel/python"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38138baa100d7259934590850bc0406e"
+
+SRC_URI[md5sum] = "f653aecf8b9034bbba32cc04ca6a7b6d"
+SRC_URI[sha256sum] = "edabb426e6cd11c2dc7a98980340135aa0eb02143b0d51bf14e3e6178c131cc3"
+
+PYPI_PACKAGE="python-can"
diff --git a/meta-python/recipes-devtools/python/python-can_1.5.2.bb b/meta-python/recipes-devtools/python/python-can_1.5.2.bb
new file mode 100644
index 0000000..ec81a9e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-can_1.5.2.bb
@@ -0,0 +1,4 @@
+require python-can.inc
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "python-sqlite3"
diff --git a/meta-python/recipes-devtools/python/python3-can_1.5.2.bb b/meta-python/recipes-devtools/python/python3-can_1.5.2.bb
new file mode 100644
index 0000000..a1d45b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-can_1.5.2.bb
@@ -0,0 +1,4 @@
+require python-can.inc
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-sqlite3"
-- 
2.7.4


