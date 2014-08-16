Return-Path: <openembedded@mindchasers.com>
X-Greylist: delayed 1184 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 16 Aug 2014 16:39:28 UTC
Received: from smtp.webfaction.com (mail6.webfaction.com [74.55.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id 7F887601A0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 16:39:28 +0000 (UTC)
Received: from localhost.localdomain (c-68-38-40-177.hsd1.nj.comcast.net
	[68.38.40.177])
	by smtp.webfaction.com (Postfix) with ESMTP id A410E22A426C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 16:19:44 +0000 (UTC)
From: Bob Cochran <openembedded@mindchasers.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Aug 2014 12:19:41 -0400
Message-Id: <1408205981-22320-1-git-send-email-openembedded@mindchasers.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] postgresql: Fix typo in PACKAGECONFIG[python] variable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Aug 2014 16:39:33 -0000

typo in extra argument to be added when feature is disabled

Signed-off-by: Bob Cochran <openembedded@mindchasers.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 79d1281..a9b4a01 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -42,7 +42,7 @@ enable_pam = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
-PACKAGECONFIG[python] = "--with-python,--wsithout-python,python,python"
+PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
 PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
 # when tcl native package  is fixed change WORKDIR to STAGING_BINDIR_CROSS
 PACKAGECONFIG[tcl] = \
-- 
1.7.9.5


