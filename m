Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OnnUD-0007tD-W5
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 08:59:59 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OnnTn-0003XX-D5 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:59:31 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 24 Aug 2010 08:59:29 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Aug 2010 12:56:47 +0600
Message-Id: <1282633007-664-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 24 Aug 2010 06:59:30.0160 (UTC)
	FILETIME=[E616DF00:01CB4359]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] uicmoc-native.inc: Changed PR to INC_PR
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
X-List-Received-Date: Tue, 24 Aug 2010 06:59:59 -0000

* Converted PR to INC_PR

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/uicmoc/uicmoc4-native.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/uicmoc/uicmoc4-native.inc b/recipes/uicmoc/uicmoc4-native.inc
index 1124226..ea6a469 100644
--- a/recipes/uicmoc/uicmoc4-native.inc
+++ b/recipes/uicmoc/uicmoc4-native.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://www.trolltech.com"
 PRIORITY = "optional"
 LICENSE = "GPL"
-PR = "r1"
+INC_PR = "r1"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
            file://configure-fix.patch"
-- 
1.6.3.3


From b5ec4b836699cc8780524a214a9e884ca0936212 Mon Sep 17 00:00:00 2001
Date: Mon, 23 Aug 2010 18:28:38 +0600
Subject: [PATCH] uicmoc4-native: Introduced PR in the recipe file

* Introduced PR and set it to ${INC_PR}.0

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/uicmoc/uicmoc4-native_4.4.3.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/uicmoc/uicmoc4-native_4.4.3.bb b/recipes/uicmoc/uicmoc4-native_4.4.3.bb
index d1816d2..0ef53e1 100644
--- a/recipes/uicmoc/uicmoc4-native_4.4.3.bb
+++ b/recipes/uicmoc/uicmoc4-native_4.4.3.bb
@@ -1,3 +1,4 @@
+PR = ${INC_PR}.0
 require uicmoc4-native.inc
 
 inherit native
-- 
1.6.3.3



