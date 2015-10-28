Return-Path: <prvs=736b72a50=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id F3CED71633
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:40:22 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqgEAMDBMFasEApK/2dsb2JhbABehHkGum2GCReGBIIMAQEBAQEBgQuFNSiBFg4FiDXFPwEBCAIhhneKDh6CFwxDgTEFkk+DbpZUgQOEc40OhGhxhHeBBgEBAQ
X-IPAS-Result: AqgEAMDBMFasEApK/2dsb2JhbABehHkGum2GCReGBIIMAQEBAQEBgQuFNSiBFg4FiDXFPwEBCAIhhneKDh6CFwxDgTEFkk+DbpZUgQOEc40OhGhxhHeBBgEBAQ
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Oct 2015 13:38:54 +0100
Message-ID: <1446035935-3070-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Subject: [meta-java][PATCH 1/2] README: remove PREFERRED_VERSION from instructions
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
X-List-Received-Date: Wed, 28 Oct 2015 12:40:26 -0000
Content-Type: text/plain

Due to the fact that currently only one openjdk-7-jre and
icedtea7-native version is included in meta-java, their PREFERRED_VERSION
selections are removed from the usage instructions in the README file.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/README b/README
index acbe7cb..630e368 100644
--- a/README
+++ b/README
@@ -59,10 +59,6 @@ PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
 PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
 PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
 
-#For openjdk7:
-PREFERRED_VERSION_openjdk-7-jre = "91b01-2.6.2"
-PREFERRED_VERSION_icedtea7-native = "2.1.3"
-
 #Sometimes the following is needed:
 PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
 
-- 
2.1.4


