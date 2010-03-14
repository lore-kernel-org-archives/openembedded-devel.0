Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1NqbRL-0001Ri-7o
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 01:12:23 +0100
Received: from localhost.localdomain (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id EF80A30294;
	Sat, 13 Mar 2010 19:09:15 -0500 (EST)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Mar 2010 16:09:09 -0800
Message-Id: <1268525349-13520-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.6.3.3
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: EF80A30294.700CC
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
Subject: [PATCH] sed-4.1.1: migrate -native to BBCLASSEXTEND
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
X-List-Received-Date: Sun, 14 Mar 2010 00:12:23 -0000

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 recipes/sed/sed-native_4.1.1.bb |    3 ---
 recipes/sed/sed_4.1.1.bb        |    3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 recipes/sed/sed-native_4.1.1.bb

diff --git a/recipes/sed/sed-native_4.1.1.bb b/recipes/sed/sed-native_4.1.1.bb
deleted file mode 100644
index 3bfacd8..0000000
--- a/recipes/sed/sed-native_4.1.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-SECTION = "console/utils"
-require sed_${PV}.bb
-inherit native
diff --git a/recipes/sed/sed_4.1.1.bb b/recipes/sed/sed_4.1.1.bb
index eac4a9c..2f926f7 100644
--- a/recipes/sed/sed_4.1.1.bb
+++ b/recipes/sed/sed_4.1.1.bb
@@ -1,8 +1,11 @@
 LICENSE = "GPL"
 SECTION = "console/utils"
 DESCRIPTION = "sed is a Stream EDitor."
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
 S = "${WORKDIR}/sed-${PV}"
 
 inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.6.3.3



