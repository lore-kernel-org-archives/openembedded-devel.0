Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADD57611E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:18:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98927226"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2015 17:22:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6R9GwAc015046
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 17:16:58 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Jul 2015 17:18:48 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jul 2015 17:18:38 +0800
Message-ID: <1437988719-2641-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437988719-2641-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437988719-2641-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH 2/3] radvd: upgrade 1.14 -> 2.11
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
X-List-Received-Date: Mon, 27 Jul 2015 09:18:51 -0000
Content-Type: text/plain

Changes can be found at http://www.litech.org/radvd/CHANGES-2.txt

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/radvd/radvd_1.14.bb | 6 ------
 meta-networking/recipes-daemons/radvd/radvd_2.11.bb | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/radvd/radvd_1.14.bb
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.11.bb

diff --git a/meta-networking/recipes-daemons/radvd/radvd_1.14.bb b/meta-networking/recipes-daemons/radvd/radvd_1.14.bb
deleted file mode 100644
index bf572e3..0000000
--- a/meta-networking/recipes-daemons/radvd/radvd_1.14.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-
-require radvd.inc
-
-SRC_URI[md5sum] = "a257e05bd6a435ef948d3b407726d56f"
-SRC_URI[sha256sum] = "3b16dd9ef3d6c8b889cdabfdb16c81db8bd61b0f1fc42f6acc52d3cf300c6d07"
-
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.11.bb b/meta-networking/recipes-daemons/radvd/radvd_2.11.bb
new file mode 100644
index 0000000..c0b7532
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.11.bb
@@ -0,0 +1,5 @@
+
+require radvd.inc
+
+SRC_URI[md5sum] = "57fc6021f6a5e5472e455937685472a3"
+SRC_URI[sha256sum] = "80ad60b15689e9591a5af393a57a1d93304deeff2e46482f0fd98046c00622f8"
-- 
1.8.4.2


