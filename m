Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9Rnj-0007dV-20
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:36 +0200
Received: by mail-gy0-f175.google.com with SMTP id 13so1138049gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:57 -0700 (PDT)
Received: by 10.100.119.18 with SMTP id r18mr2728165anc.57.1287793017757;
	Fri, 22 Oct 2010 17:16:57 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:56 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:57 -0200
Message-Id: <4cc22978.0311650a.0c4d.ffffaf6c@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 17/17] EFL Python Bindings are using autogen now!
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:37 -0000

From: Fabiano Fidencio <fidencio@profusion.mobi>

---
 recipes/python/python-elementary_svn.bb |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/recipes/python/python-elementary_svn.bb b/recipes/python/python-elementary_svn.bb
index da5ee68..562f32b 100644
--- a/recipes/python/python-elementary_svn.bb
+++ b/recipes/python/python-elementary_svn.bb
@@ -2,7 +2,3 @@ require python-efl.inc
 SRCREV = "${EFL_SRCREV}"
 DEPENDS += "elementary"
 RDEPENDS_${PN} += "python-evas python-ecore python-edje"
-
-do_stage() {
-        distutils_stage_all
-}
-- 
1.7.3.1



