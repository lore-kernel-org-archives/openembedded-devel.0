Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 10BC56074F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 00:45:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0J0jprU001359
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 16:45:51 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 16:45:50 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jan 2017 16:45:50 -0800
Message-ID: <1484786750-11772-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] relayd: derive PV from SRCPV
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
X-List-Received-Date: Thu, 19 Jan 2017 00:45:52 -0000
Content-Type: text/plain

Currently, PV is "git" and contains no version information.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-connectivity/relayd/relayd_git.bb      |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index aab2ab5..6601733 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -8,6 +8,7 @@ DEPENDS = "libubox"
 SRC_URI = "git://nbd.name/relayd.git"
 
 SRCREV = "2970ff60bac6b70ecb682779d5c776dc559dc0b9"
+PV = "git+${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


