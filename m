Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B64E76FEF6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 19:57:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u08JvMWp024325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 Jan 2016 11:57:23 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 8 Jan 2016 11:57:22 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Fri, 8 Jan 2016 11:57:22 -0800
Message-ID: <1452283042-10335-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] xl2tpd: modify recipes to avoid forced internet access
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
X-List-Received-Date: Fri, 08 Jan 2016 19:57:23 -0000
Content-Type: text/plain

We should always specify a commit id for git SRCREV or
we will try to access the upstream repo when fetching.

In addition, if our PV is just "git" we will access upstream
when doing archiver functions, so we should specify PV for
xyz_git.bb recipes.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb       |    8 +++++---
 .../recipes-protocols/xl2tpd/xl2tpd_git.bb         |    5 ++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
index 515553f..df2ec52 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
@@ -1,5 +1,7 @@
 require xl2tpd.inc
 
-SRC_URI = "git://github.com/xelerance/xl2tpd.git;protocol=git;tag=v${PV} \
-    file://fix-inline-functions-errors-with-gcc-5.x.patch \
-"
+# The SRCREV corresponds to v1.3.6.
+# Adding tag=v1.3.6 to the SRC_URI will force access to the upstream repo.
+#
+SRCREV = "5619e1771048e74b729804e8602f409af0f3faea"
+
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
index 0cce7ab..42bc398 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
@@ -1,5 +1,8 @@
 require xl2tpd.inc
-PR = "${INC_PR}.0"
+
+# This is v1.3.6 plus some commits.  There is no tag for this commit.
+#
+PV = "1.3.6+git${SRCPV}"
 
 SRCREV = "a96b345962622ea58490924130675df6db062d11"
 
-- 
1.7.9.5


