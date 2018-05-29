Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A467B747F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:21:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4T7KuJG032531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:21:32 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:21:23 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:52 +0800
Message-ID: <1527578277-26494-20-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
References: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 19/24] mce-inject: add UPSTREAM_CHECK_COMMITS
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
X-List-Received-Date: Tue, 29 May 2018 07:21:41 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/mcelog/mce-inject_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
index f876144..86d50a2 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -8,6 +8,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-inject.git"
 
 SRCREV = "4cbe46321b4a81365ff3aafafe63967264dbfec5"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=30;md5=94c18755082a2da9c9cf97cba3ad47d6"
 
-- 
2.7.4


