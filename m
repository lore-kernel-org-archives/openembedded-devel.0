Return-Path: <fw@javox-solutions.com>
X-Greylist: delayed 1057 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Aug 2018 07:07:08 UTC
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
	[80.67.31.36])
	by mail.openembedded.org (Postfix) with ESMTP id 61A6571C42
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 07:07:08 +0000 (UTC)
Received: from [78.34.217.187] (helo=javoxdev2.fritz.box)
	by smtprelay02.ispgateway.de with esmtpa (Exim 4.90_1)
	(envelope-from <fw@javox-solutions.com>)
	id 1flTu0-0001US-0k; Fri, 03 Aug 2018 08:49:32 +0200
From: Florian Wickert <fw@javox-solutions.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Aug 2018 08:49:28 +0200
Message-Id: <20180803064928.21527-1-fw@javox-solutions.com>
X-Mailer: git-send-email 2.18.0
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
Subject: [meta-python][PATCH] add libudev to python-pyudev RDEPENDS
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
X-List-Received-Date: Fri, 03 Aug 2018 07:07:08 -0000

pyudev uses ctypes to load libudev shared library at runtime which
results in an exception if it cannot be found

Signed-off-by: Florian Wickert <fw@javox-solutions.com>
---
 meta-python/recipes-devtools/python/python-pyudev.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pyudev.inc b/meta-python/recipes-devtools/python/python-pyudev.inc
index cb906c9ec..683a75cdd 100644
--- a/meta-python/recipes-devtools/python/python-pyudev.inc
+++ b/meta-python/recipes-devtools/python/python-pyudev.inc
@@ -15,4 +15,5 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-threading \
+    libudev \
 "
-- 
2.18.0


