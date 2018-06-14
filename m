Return-Path: <prvs=696aff75f=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id C88B1755AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 22:49:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,224,1526335200"; 
   d="scan'208";a="1501075"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jun 2018 00:49:04 +0200
Message-ID: <20180614224904.21590-3-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180614224904.21590-1-richard.leitner@skidata.com>
References: <20180614224904.21590-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 2/2] ca-certificates-java: update SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2018 22:49:32 -0000
Content-Type: text/plain

Debian changed the URI of the ca-certificates-java repository, therfore
use the new one.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/ca-certificates-java/ca-certificates-java_20170930.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20170930.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20170930.bb
index 0b149d2..35e2c16 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20170930.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20170930.bb
@@ -17,7 +17,7 @@ DEPENDS = "virtual/javac-native fastjar-native"
 PACKAGE_WRITE_DEPS += "openjdk-8-native"
 
 SRC_URI = "\
-	git://anonscm.debian.org/pkg-java/ca-certificates-java.git \
+	git://salsa.debian.org/java-team/ca-certificates-java.git \
 	file://0001-UpdateCertificates-handle-SYSROOT-environment-variab.patch \
 	file://${BPN}.hook.in \
 "
-- 
2.11.0


