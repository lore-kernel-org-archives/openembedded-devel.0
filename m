Return-Path: <fw@javox-solutions.com>
X-Greylist: delayed 344 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 May 2018 16:26:01 UTC
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
	[80.67.18.14])
	by mail.openembedded.org (Postfix) with ESMTP id 323AF6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 May 2018 16:26:01 +0000 (UTC)
Received: from [89.0.112.67] (helo=javoxdev2.fritz.box)
	by smtprelay02.ispgateway.de with esmtpa (Exim 4.90_1)
	(envelope-from <fw@javox-solutions.com>)
	id 1fDuUL-0000T0-AJ; Wed, 02 May 2018 18:20:17 +0200
From: Florian Wickert <fw@javox-solutions.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2018 18:19:48 +0200
Message-Id: <20180502161948.22136-1-fw@javox-solutions.com>
X-Mailer: git-send-email 2.11.0
X-Df-Sender: ZndAamF2b3gtc29sdXRpb25zLmNvbQ==
Subject: [meta-python][PATCH] Add missing dependency for python-flask packages.
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
X-List-Received-Date: Wed, 02 May 2018 16:26:01 -0000

The module werkzeug.test is moved to the python-werkzeug-tests package
since commit 857ed16. Flask imports werkzeug.tests during exception
handling which results in "ImportError: No module named
'werkzeug.test'".

Signed-off-by: Florian Wickert <fw@javox-solutions.com>
---
 meta-python/recipes-devtools/python/python-flask.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
index 76b5fbae2..ecf5619ec 100644
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -13,4 +13,4 @@ CLEANBROKEN = "1"
 
 PYPI_PACKAGE = "Flask"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
+RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-werkzeug-tests ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
-- 
2.11.0


