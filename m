Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9Rnj-00085b-3h
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:36 +0200
Received: by ywa8 with SMTP id 8so1214424ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:53 -0700 (PDT)
Received: by 10.100.32.7 with SMTP id f7mr2722733anf.8.1287793013741;
	Fri, 22 Oct 2010 17:16:53 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:53 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:55 -0200
Message-Id: <4cc22975.0311650a.0c4d.ffffaf6a@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 15/17] Python: Update EFL recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Oct 2010 00:17:36 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

* Update PV
* New recipes for python-efl-utils and python-ethumb
* Add new recipes to task-python-efl

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/python/python-elementary_svn.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/python/python-elementary_svn.bb b/recipes/python/python-elementary_svn.bb
index 4d2a105..da5ee68 100644
--- a/recipes/python/python-elementary_svn.bb
+++ b/recipes/python/python-elementary_svn.bb
@@ -1,4 +1,8 @@
 require python-efl.inc
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary"
-RDEPENDS_${PN} += "python-evas python-ecore python-edje" 
+RDEPENDS_${PN} += "python-evas python-ecore python-edje"
+
+do_stage() {
+        distutils_stage_all
+}
-- 
1.7.3.1



