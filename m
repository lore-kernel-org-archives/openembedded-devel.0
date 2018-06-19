Return-Path: <prvs=7010ab24f=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id C280175512
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:04:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,243,1526335200"; 
   d="scan'208";a="1507417"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jun 2018 15:04:46 +0200
Message-ID: <20180619130449.6650-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH v2] 0/3] Add openjdk oeqa tests
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
X-List-Received-Date: Tue, 19 Jun 2018 13:04:41 -0000
Content-Type: text/plain

This patch-series adds tests and images for openjdk and openjre. They will be
the basis of future quality gates for accepting patches.

Changes v2:
  + Add "Testing" section to README
  + Adapt dependencies of java jar tests to "java_exists"

Richard Leitner (3):
  oeqa: runtime: add java & javac testcases
  images/classes: add open{jdk,jre}-{7,8} test
  README: add "Testing" section

 README                                        |  16 +++++++
 classes/openjdk-test-image.bbclass            |   5 +++
 classes/openjre-test-image.bbclass            |   9 ++++
 lib/oeqa/files/test.jar                       | Bin 0 -> 8164 bytes
 lib/oeqa/files/test.java                      |   8 ++++
 lib/oeqa/runtime/cases/java.py                |  60 ++++++++++++++++++++++++++
 lib/oeqa/runtime/cases/javac.py               |  32 ++++++++++++++
 recipes-images/images/openjdk-7-test-image.bb |   3 ++
 recipes-images/images/openjdk-8-test-image.bb |   3 ++
 recipes-images/images/openjre-7-test-image.bb |   3 ++
 recipes-images/images/openjre-8-test-image.bb |   3 ++
 11 files changed, 142 insertions(+)
 create mode 100644 classes/openjdk-test-image.bbclass
 create mode 100644 classes/openjre-test-image.bbclass
 create mode 100644 lib/oeqa/files/test.jar
 create mode 100644 lib/oeqa/files/test.java
 create mode 100644 lib/oeqa/runtime/cases/java.py
 create mode 100644 lib/oeqa/runtime/cases/javac.py
 create mode 100644 recipes-images/images/openjdk-7-test-image.bb
 create mode 100644 recipes-images/images/openjdk-8-test-image.bb
 create mode 100644 recipes-images/images/openjre-7-test-image.bb
 create mode 100644 recipes-images/images/openjre-8-test-image.bb

-- 
2.11.0


