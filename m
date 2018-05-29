Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0109F74501
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:22:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4T7MBWN003513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:22:11 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:22:10 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:56 +0800
Message-ID: <1527578277-26494-24-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
References: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 23/24] thin-provisioning-tools: add UPSTREAM_CHECK_GITTAGREGEX
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
X-List-Received-Date: Tue, 29 May 2018 07:22:10 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb            | 2 ++
 1 file changed, 2 insertions(+)
 mode change 100755 => 100644 meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb
old mode 100755
new mode 100644
index c9d6690..4a692dc
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
 
 SRCREV = "49bfc12e9c7956c1ac134b24afbe1a6a602ce7d5"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
 DEPENDS += "expat libaio boost"
 
 inherit autotools-brokensep
-- 
2.7.4


