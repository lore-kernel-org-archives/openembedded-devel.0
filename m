Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NrNEI-0003gQ-0P
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 04:14:07 +0100
Received: from gandalf.denix.org ([unknown] [71.251.59.195])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KZC003NFU5WFBO5@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Mar 2010 22:10:48 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 22FDE14AF5F; Mon,
	15 Mar 2010 23:10:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 23:10:26 -0400
Message-id: <1268709026-7111-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] opkg: fix global depends on openssl, even in -nogpg/-nocurl
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
X-List-Received-Date: Tue, 16 Mar 2010 03:14:07 -0000

Fixes the problem, introduced by 8c1731d818c89a291f80940c1912587ff9ce46b7,
where openssl is added with DEPENDS_append override, preventing -nogpg and
-nocurl variants from clearing the DEPENDS, when they include opkg_svn.bb
file, thus forcing them to depend on openssl too.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/opkg/opkg.inc    |    4 ++--
 recipes/opkg/opkg_svn.bb |    2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index 4442102..9a3d3dc 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -2,9 +2,9 @@ DESCRIPTION = "Opkg Package Manager"
 DESCRIPTION_libopkg = "Opkg Package Manager Library"
 SECTION = "base"
 LICENSE = "GPLv2"
-DEPENDS = "curl gpgme"
+DEPENDS = "curl gpgme openssl"
 PV = "0.1.6+svnr${SRCPV}"
-INC_PR = "r20"
+INC_PR = "r21"
 
 FILESPATHPKG =. "opkg:"
 
diff --git a/recipes/opkg/opkg_svn.bb b/recipes/opkg/opkg_svn.bb
index 4945260..5138458 100644
--- a/recipes/opkg/opkg_svn.bb
+++ b/recipes/opkg/opkg_svn.bb
@@ -1,7 +1,5 @@
 require opkg.inc
 
-DEPENDS_append = " openssl"
-
 PR = "${INC_PR}"
 
 PROVIDES =+ "virtual/update-alternatives"
-- 
1.6.3.3



