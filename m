Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 474 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 11 Aug 2019 15:25:02 UTC
Received: from 19.mo1.mail-out.ovh.net (19.mo1.mail-out.ovh.net
	[178.32.97.206])
	by mail.openembedded.org (Postfix) with ESMTP id C1D687ED15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 15:25:02 +0000 (UTC)
Received: from player760.ha.ovh.net (unknown [10.108.35.159])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 2B6CD189B82
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 17:17:09 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player760.ha.ovh.net (Postfix) with ESMTPSA id A17538CC09F8;
	Sun, 11 Aug 2019 15:17:05 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Aug 2019 17:16:25 +0200
Message-Id: <20190811151626.13990-6-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190811151626.13990-1-maciej.pijanowski@3mdeb.com>
References: <20190811151626.13990-1-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3563754683797024328
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvvddgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH v2 6/7] python-async-timeout: add asyncio to RDEPENDS
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
X-List-Received-Date: Sun, 11 Aug 2019 15:25:03 -0000
Content-Transfer-Encoding: 8bit

It is required to properly import the module. Tested on python 3.7.4

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta-python/recipes-devtools/python/python-async-timeout.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-async-timeout.inc b/meta-python/recipes-devtools/python/python-async-timeout.inc
index 7e4959ebc4ad..e71a00262b0f 100644
--- a/meta-python/recipes-devtools/python/python-async-timeout.inc
+++ b/meta-python/recipes-devtools/python/python-async-timeout.inc
@@ -13,3 +13,7 @@ SRC_URI[sha256sum] = "0c3c816a028d47f659d6ff5c745cb2acf1f966da1fe5c19c77a70282b2
 
 PYPI_PACKAGE = "async-timeout"
 inherit pypi
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-asyncio \
+"
-- 
2.20.1


