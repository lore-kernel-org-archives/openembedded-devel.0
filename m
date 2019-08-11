Return-Path: <maciej.pijanowski@3mdeb.com>
Received: from 1.mo2.mail-out.ovh.net (1.mo2.mail-out.ovh.net [46.105.63.121])
	by mail.openembedded.org (Postfix) with ESMTP id B07C76BC19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 15:16:52 +0000 (UTC)
Received: from player760.ha.ovh.net (unknown [10.109.159.248])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 4A4271A6A1A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 17:16:53 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player760.ha.ovh.net (Postfix) with ESMTPSA id 11C228CC0989;
	Sun, 11 Aug 2019 15:16:48 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Aug 2019 17:16:21 +0200
Message-Id: <20190811151626.13990-2-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190811151626.13990-1-maciej.pijanowski@3mdeb.com>
References: <20190811151626.13990-1-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3559251082086198856
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvvddgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH v2 2/7] python3-multidict: upgrade to 4.5.2
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
X-List-Received-Date: Sun, 11 Aug 2019 15:16:52 -0000
Content-Transfer-Encoding: 8bit

According to the comment and issue link, the workaround is no longer
needed.

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../python/python3-multidict_3.3.2.bb               | 13 -------------
 .../python/python3-multidict_4.5.2.bb               |  9 +++++++++
 2 files changed, 9 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-multidict_4.5.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb b/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
deleted file mode 100644
index e65d7d4f2902..000000000000
--- a/meta-python/recipes-devtools/python/python3-multidict_3.3.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args etc."
-HOMEPAGE = "https://github.com/aio-libs/multidict/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "06ca91d993de2d04c7ee6df0cbb44ea2"
-SRC_URI[sha256sum] = "f82e61c7408ed0dce1862100db55595481911f159d6ddec0b375d35b6449509b"
-
-# Work-around for broken make clean. Note this is fixed in v4.0.0.
-# https://github.com/aio-libs/multidict/issues/194
-CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.5.2.bb b/meta-python/recipes-devtools/python/python3-multidict_4.5.2.bb
new file mode 100644
index 000000000000..57167f219d27
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-multidict_4.5.2.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args etc."
+HOMEPAGE = "https://github.com/aio-libs/multidict/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "5e9d8f7e1ada9a22932aed6a72f88e43"
+SRC_URI[sha256sum] = "024b8129695a952ebd93373e45b5d341dbb87c17ce49637b34000093f243dd4f"
-- 
2.20.1


