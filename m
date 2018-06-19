Return-Path: <prvs=7010ab24f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 7F73F7554B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:05:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,243,1526335200"; d="scan'208";a="10922079"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jun 2018 15:04:49 +0200
Message-ID: <20180619130449.6650-4-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180619130449.6650-1-richard.leitner@skidata.com>
References: <20180619130449.6650-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH v2] 3/3] README: add "Testing" section
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
X-List-Received-Date: Tue, 19 Jun 2018 13:05:01 -0000
Content-Type: text/plain

Add new "Testing" section in README where we describe how meta-java
tests may be used.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 README | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/README b/README
index b66df64..17a25e7 100644
--- a/README
+++ b/README
@@ -57,6 +57,22 @@ Main layer maintainers:
   Otavio Salvador <otavio@ossystems.com.br>
   Richard Leitner <richard.leitner@skidata.com>
 
+Testing
+-------
+
+The meta-java layer may be tested using oeqa's runtime image tests. The easiest
+way is to add the following configuration to your local.conf:
+
+SANITY_TESTED_DISTROS=""
+TEST_IMAGE = "1"
+
+Then you should be able to use the open{jre,jdk}-{7,8}-test-image recipes.
+Furthermore you could also include the tests provided in lib/oeqa/runtime/cases
+into your test image. More information on image testing is available at:
+
+	https://wiki.yoctoproject.org/wiki/Image_tests
+
+
 Usage instructions
 ------------------
 
-- 
2.11.0


