Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB1060721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 05:40:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5L5e3Bj019718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jun 2016 22:40:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 20 Jun 2016 22:40:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jun 2016 01:39:53 -0400
Message-ID: <da581fde516db076f04ecfb81cd70ebce9f5c1f8.1466487409.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1466487409.git.hongxu.jia@windriver.com>
References: <cover.1466487409.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] python-cloudeebus: fix do_compile failure
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
X-List-Received-Date: Tue, 21 Jun 2016 05:40:03 -0000
Content-Type: text/plain

It fixed the following failure:
...
  2 Traceback (most recent call last):
  3   File "setup.py", line 24, in <module>
  4     from setuptools import setup
  5 ImportError: No module named setuptools
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
index 120a8a7..1490e22 100644
--- a/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-cloudeebus_0.6.0.bb
@@ -9,7 +9,7 @@ SRCREV = "b5cc957eeabfe98cb996baf8e5a0ac848993c3d4"
 
 S = "${WORKDIR}/git"
 
-inherit distutils 
+inherit distutils setuptools
 
 DEPENDS_${PN} = "python python-distribute"
 RDEPENDS_${PN} = "python python-dbus python-json python-argparse python-pygobject python-autobahn python-twisted python-subprocess"
-- 
2.8.1


