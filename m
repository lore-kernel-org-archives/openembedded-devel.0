Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 1201 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 Aug 2019 21:40:39 UTC
Received: from 7.mo177.mail-out.ovh.net (7.mo177.mail-out.ovh.net
	[46.105.61.149])
	by mail.openembedded.org (Postfix) with ESMTP id 5110F7C377
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 21:40:39 +0000 (UTC)
Received: from player750.ha.ovh.net (unknown [10.108.54.94])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id DCB78103B08
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 23:20:52 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 7964B8DD8AE8;
	Sat, 10 Aug 2019 21:20:49 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Aug 2019 23:20:12 +0200
Message-Id: <20190810212014.23197-5-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
References: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3833689185828810312
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudduledgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH 5/7] python-aiohttp.inc: add missing RDEPENDS
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
X-List-Received-Date: Sat, 10 Aug 2019 21:40:39 -0000
Content-Transfer-Encoding: 8bit

Module could not be properly imported (tested on python 3.7.4)

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta-python/recipes-devtools/python/python-aiohttp.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-aiohttp.inc b/meta-python/recipes-devtools/python/python-aiohttp.inc
index 81f1809bdd53..e711ad71dab6 100644
--- a/meta-python/recipes-devtools/python/python-aiohttp.inc
+++ b/meta-python/recipes-devtools/python/python-aiohttp.inc
@@ -15,4 +15,7 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-idna-ssl \
     ${PYTHON_PN}-multidict \
     ${PYTHON_PN}-yarl \
+    ${PYTHON_PN}-typing \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-attrs \
 "
-- 
2.20.1


