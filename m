Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fidencio@profusion.mobi>) id 1P9Rnf-0007xp-HR
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 02:17:32 +0200
Received: by ywa8 with SMTP id 8so1214416ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 17:16:51 -0700 (PDT)
Received: by 10.101.148.15 with SMTP id a15mr2706353ano.257.1287793011865;
	Fri, 22 Oct 2010 17:16:51 -0700 (PDT)
Received: from localhost.localdomain ([201.82.29.28])
	by mx.google.com with ESMTPS id u3sm4239972ani.19.2010.10.22.17.16.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 17:16:51 -0700 (PDT)
From: fidencio@profusion.mobi
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 22:15:54 -0200
Message-Id: <4cc22973.0311650a.0c4d.ffffaf69@mx.google.com>
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
Subject: [PATCH 14/17] Ecore: Patch to fix attribution in Ecore_Getopt.h
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
X-List-Received-Date: Sat, 23 Oct 2010 00:17:34 -0000

From: Eduardo Lima (Etrunko) <eblima@gmail.com>

Signed-off-by: Eduardo Lima (Etrunko) <eblima@gmail.com>
---
 recipes/efl1/ecore_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/efl1/ecore_svn.bb b/recipes/efl1/ecore_svn.bb
index 934a52f..fcbd244 100644
--- a/recipes/efl1/ecore_svn.bb
+++ b/recipes/efl1/ecore_svn.bb
@@ -1,12 +1,13 @@
 require ecore.inc
 SRCREV = "${EFL_SRCREV}"
-PR = "r12"
+PR = "r13"
 
 SRC_URI += "\
   file://iconv.patch;maxrev=43996 \
   file://exit_uclibc_dns.patch;maxrev=47076 \
   file://exit_uclibc.patch;maxrev=50815 \
   file://exit_uclibc_newer.patch;minrev=50816 \
+  file://ecore_getopt_attribution.patch;maxrev=51081 \
 "
 
 ECORE_OECONF = "\
-- 
1.7.3.1



