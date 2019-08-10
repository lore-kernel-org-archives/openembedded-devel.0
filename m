Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 8400 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 Aug 2019 23:47:29 UTC
Received: from 4.mo68.mail-out.ovh.net (4.mo68.mail-out.ovh.net [46.105.59.63])
	by mail.openembedded.org (Postfix) with ESMTP id BCCBB7ED3F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 23:47:29 +0000 (UTC)
Received: from player750.ha.ovh.net (unknown [10.109.159.69])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 5288A13E913
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 23:20:56 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id DD6168DD8AF0;
	Sat, 10 Aug 2019 21:20:52 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Aug 2019 23:20:13 +0200
Message-Id: <20190810212014.23197-6-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
References: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3834815085647572552
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudduledgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH 6/7] python-async-timeout: add asyncio to RDEPENDS
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
X-List-Received-Date: Sat, 10 Aug 2019 23:47:30 -0000
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


