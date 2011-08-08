Received: from mail2.multitech.net ([65.126.90.254] helo=mail2.multitech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jgilles@multitech.com>) id 1QqSuT-0001E1-Fo
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 18:42:37 +0200
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	9C9C25B02F0_E4010F0B for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2011 16:38:08 +0000 (GMT)
Received: from mail.multitech.com (unknown [192.168.11.244])
	by mail2.multitech.com (Sophos Email Appliance) with ESMTP id
	6AD125B02FB_E4010F0F for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2011 16:38:08 +0000 (GMT)
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from localhost.localdomain ([192.168.52.61]) by mail.multitech.com
	with Microsoft SMTPSVC(5.0.2195.7381); 
	Mon, 8 Aug 2011 11:37:29 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Aug 2011 11:38:02 -0500
Message-Id: <1312821482-32319-1-git-send-email-jgilles@multitech.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 08 Aug 2011 16:37:29.0564 (UTC)
	FILETIME=[76CAB9C0:01CC55E9]
Subject: [PATCH] jakarta-libs: fix SRC_URIs for avalon-framework, logkit
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
X-List-Received-Date: Mon, 08 Aug 2011 16:42:37 -0000

* code was moved to archive.apache.org
---
 recipes/jakarta-libs/avalon-framework-api_4.3.bb |    4 ++--
 recipes/jakarta-libs/logkit_1.2.2.bb             |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/jakarta-libs/avalon-framework-api_4.3.bb b/recipes/jakarta-libs/avalon-framework-api_4.3.bb
index 06fde62..08d560c 100644
--- a/recipes/jakarta-libs/avalon-framework-api_4.3.bb
+++ b/recipes/jakarta-libs/avalon-framework-api_4.3.bb
@@ -3,8 +3,8 @@ LICENSE = "AL2.0"
 AUTHOR = "Apache Software Foundation"
 
 SRC_URI = "\
-	http://www.apache.org/dist/excalibur/avalon-framework/source/${BP}-src.tar.gz;name=archive \
-	http://www.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
+	http://archive.apache.org/dist/excalibur/avalon-framework/source/${BP}-src.tar.gz;name=archive \
+	http://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
 	"
 
 inherit java-library
diff --git a/recipes/jakarta-libs/logkit_1.2.2.bb b/recipes/jakarta-libs/logkit_1.2.2.bb
index c5eceee..39fe897 100644
--- a/recipes/jakarta-libs/logkit_1.2.2.bb
+++ b/recipes/jakarta-libs/logkit_1.2.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Logging toolkit designed for secure performance orientated loggin
 LICENSE = "AL2.0"
 AUTHOR = "Apache Software Foundation"
 
-SRC_URI = "http://www.apache.org/dist/avalon/logkit/source/${BP}-src.tar.gz"
+SRC_URI = "http://archive.apache.org/dist/avalon/logkit/source/${BP}-src.tar.gz"
 
 inherit java-library
 
-- 
1.7.0.4



