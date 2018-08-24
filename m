Return-Path: <prvs=767db467e=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id CA665795D1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 07:53:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,281,1531778400"; 
   d="scan'208";a="1623043"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Aug 2018 09:54:28 +0200
Message-ID: <20180824075428.30511-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] conf: distro: add mejate{, -musl} distributions
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
X-List-Received-Date: Fri, 24 Aug 2018 07:53:51 -0000
Content-Type: text/plain

Add meta-java test distributions for glibc and musl. Those should be
used for oeqa tests of the *-test-image's to cover also musl.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 conf/distro/mejate-musl.conf | 7 +++++++
 conf/distro/mejate.conf      | 6 ++++++
 2 files changed, 13 insertions(+)
 create mode 100644 conf/distro/mejate-musl.conf
 create mode 100644 conf/distro/mejate.conf

diff --git a/conf/distro/mejate-musl.conf b/conf/distro/mejate-musl.conf
new file mode 100644
index 0000000..257381e
--- /dev/null
+++ b/conf/distro/mejate-musl.conf
@@ -0,0 +1,7 @@
+require conf/distro/poky.conf
+
+DISTRO = "mejate-musl"
+DISTRO_NAME = "Meta Java Test with musl"
+DISTROOVERRIDES = "poky"
+TCLIBC = "musl"
+
diff --git a/conf/distro/mejate.conf b/conf/distro/mejate.conf
new file mode 100644
index 0000000..611cb23
--- /dev/null
+++ b/conf/distro/mejate.conf
@@ -0,0 +1,6 @@
+require conf/distro/poky.conf
+
+DISTRO = "mejate"
+DISTRO_NAME = "Meta Java Test"
+DISTROOVERRIDES = "poky"
+
-- 
2.11.0


