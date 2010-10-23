Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9RnG-0007Yq-4o
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:10 +0200
Received: by mail-gw0-f47.google.com with SMTP id a11so1560489gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:30 -0700 (PDT)
Received: by 10.100.112.18 with SMTP id k18mr2699930anc.75.1287792990082;
	Fri, 22 Oct 2010 17:16:30 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:29 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:43 -0200
Message-Id: <4cc2295d.0311650a.0c4d.ffffaf5c@mx.google.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <y>
References: <y>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fidencio@profusion.mobi
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/17] EFL: Add ethumb as dependency for elementary
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:12 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/efl1/elementary_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/efl1/elementary_svn.bb b/recipes/efl1/elementary_svn.bb
index 29e8919..664433b 100644
--- a/recipes/efl1/elementary_svn.bb
+++ b/recipes/efl1/elementary_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPL"
-DEPENDS = "eet-native efreet evas ecore edje eet edbus"
+DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb"
 PV = "0.7.0+svnr${SRCPV}"
 PR = "r11"
 SRCREV = "${EFL_SRCREV}"
-- 
1.7.3.1



