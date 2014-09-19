Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0545C7142A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 19:22:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8JJMnWx005360
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 12:22:50 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Sep 2014 12:22:49 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Sep 2014 12:22:49 -0700
Message-ID: <1411154569-2625-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] radvd: update to 1.14
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
X-List-Received-Date: Fri, 19 Sep 2014 19:23:01 -0000
Content-Type: text/plain

No changes except to source version.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-daemons/radvd/radvd_1.14.bb            |    6 ++++++
 .../recipes-daemons/radvd/radvd_1.9.8.bb           |    6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd_1.14.bb
 delete mode 100644 meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb

diff --git a/meta-networking/recipes-daemons/radvd/radvd_1.14.bb b/meta-networking/recipes-daemons/radvd/radvd_1.14.bb
new file mode 100644
index 0000000..bf572e3
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/radvd_1.14.bb
@@ -0,0 +1,6 @@
+
+require radvd.inc
+
+SRC_URI[md5sum] = "a257e05bd6a435ef948d3b407726d56f"
+SRC_URI[sha256sum] = "3b16dd9ef3d6c8b889cdabfdb16c81db8bd61b0f1fc42f6acc52d3cf300c6d07"
+
diff --git a/meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb b/meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb
deleted file mode 100644
index 407eb43..0000000
--- a/meta-networking/recipes-daemons/radvd/radvd_1.9.8.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-PR = "r0"
-
-require radvd.inc
-
-SRC_URI[md5sum] = "7a96a38252c3964ee18bbc1fdeae25fa"
-SRC_URI[sha256sum] = "645ccf1c9b16e769ff4179813712e580e2c8786d64a888d8afa1e296c057c1c1"
-- 
1.7.3.4


