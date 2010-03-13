Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1NqLos-0000Sy-MS
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 08:31:39 +0100
Received: from localhost.localdomain (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CF9DB2FD98;
	Sat, 13 Mar 2010 02:28:27 -0500 (EST)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 23:28:22 -0800
Message-Id: <1268465302-3725-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.6.3.3
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CF9DB2FD98.8EFEA
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sed: migrate -native to BBCLASSEXTEND
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
X-List-Received-Date: Sat, 13 Mar 2010 07:31:39 -0000

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 recipes/sed/sed-native_4.1.2.bb |    3 ---
 recipes/sed/sed_4.1.2.bb        |    3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)
 delete mode 100644 recipes/sed/sed-native_4.1.2.bb

diff --git a/recipes/sed/sed-native_4.1.2.bb b/recipes/sed/sed-native_4.1.2.bb
deleted file mode 100644
index 3bfacd8..0000000
--- a/recipes/sed/sed-native_4.1.2.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-SECTION = "console/utils"
-require sed_${PV}.bb
-inherit native
diff --git a/recipes/sed/sed_4.1.2.bb b/recipes/sed/sed_4.1.2.bb
index fe80f3e..e4337e2 100644
--- a/recipes/sed/sed_4.1.2.bb
+++ b/recipes/sed/sed_4.1.2.bb
@@ -1,7 +1,7 @@
 LICENSE = "GPL"
 SECTION = "console/utils"
 DESCRIPTION = "sed is a Stream EDitor."
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
 S = "${WORKDIR}/sed-${PV}"
@@ -24,3 +24,4 @@ pkg_prerm_${PN} () {
 	update-alternatives --remove sed sed.${PN}
 }
 
+BBCLASSEXTEND = "native"
-- 
1.6.3.3



