Return-Path: <prvs=736b72a50=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 4F28873695
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 07:54:55 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqcEANt+MFasEApK/2dsb2JhbABehHkGumCGCYYbggMBAQEBAQGBC4U1KIEWDgWINcUkAQEBBwIhhneKDh6EFwWST4NullSBA5F/hGhxhHeBBgEBAQ
X-IPAS-Result: AqcEANt+MFasEApK/2dsb2JhbABehHkGumCGCYYbggMBAQEBAQGBC4U1KIEWDgWINcUkAQEBBwIhhneKDh6EFwWST4NullSBA5F/hGhxhHeBBgEBAQ
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Oct 2015 08:53:48 +0100
Message-ID: <1446018829-28181-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [meta-java][PATCH 1/2] README: remove instructions for OpenJDK6
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
X-List-Received-Date: Wed, 28 Oct 2015 07:54:57 -0000
Content-Type: text/plain

Due to the fact OpenJDK6 was removed from meta-java, remove also its
usage instructions from the README file.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/README b/README
index f031021..69821ed 100644
--- a/README
+++ b/README
@@ -59,20 +59,11 @@ PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
 PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
 PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
 
-#For openjdk6:
-#PREFERRED_VERSION_openjdk-6-jre = "6b24-1.11.9"
-#or
-#PREFERRED_VERSION_openjdk-6-jre = "6b27-1.12.8"
-#or
-PREFERRED_VERSION_openjdk-6-jre = "6b32-1.13.4"
-PREFERRED_VERSION_icedtea6-native = "1.8.11"
-
 #For openjdk7:
 PREFERRED_VERSION_openjdk-7-jre = "85b01-2.6.1"
 PREFERRED_VERSION_icedtea7-native = "2.1.3"
 
 #Sometimes the following is needed:
-PREFERRED_PROVIDER_openjdk-6-jre = "openjdk-6-jre"
 PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
 
 For conf/bblayers.conf you have to add
-- 
2.1.4


