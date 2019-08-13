Return-Path: <maciej.pijanowski@3mdeb.com>
Received: from 1.mo2.mail-out.ovh.net (1.mo2.mail-out.ovh.net [46.105.63.121])
	by mail.openembedded.org (Postfix) with ESMTP id ABC0C7EC64
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:24:35 +0000 (UTC)
Received: from player711.ha.ovh.net (unknown [10.109.143.18])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 8EA691A6497
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 20:24:35 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player711.ha.ovh.net (Postfix) with ESMTPSA id 136FB8BFE585;
	Tue, 13 Aug 2019 18:24:33 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:24:13 +0200
Message-Id: <20190813182413.28313-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 27866022749417032
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddviedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH] python3-aiofiles: add recipe
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
X-List-Received-Date: Tue, 13 Aug 2019 18:24:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../recipes-devtools/python/python-aiofiles.inc    | 14 ++++++++++++++
 .../python/python3-aiofiles_0.4.0.bb               |  2 ++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-aiofiles.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python-aiofiles.inc b/meta-python/recipes-devtools/python/python-aiofiles.inc
new file mode 100644
index 000000000000..3ecb21c86dd2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-aiofiles.inc
@@ -0,0 +1,14 @@
+SUMMARY = "File support for asyncio"
+DESCRIPTION = "Asynchronous local file IO library for asyncio and Python"
+HOMEPAGE = "https://github.com/aio-libs/aiohttp"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "cb33cf96c371fbd56fc27ab0bd81bd61"
+SRC_URI[sha256sum] = "021ea0ba314a86027c166ecc4b4c07f2d40fc0f4b3a950d1868a0f2571c2bbee"
+
+PYPI_PACKAGE = "aiofiles"
+inherit pypi
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-asyncio \
+"
diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
new file mode 100644
index 000000000000..b4d188b2edf3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-aiofiles.inc
-- 
2.20.1


