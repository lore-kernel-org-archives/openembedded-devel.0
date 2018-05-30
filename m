Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2E7F6067D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:31:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U6V1Ea003731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:31:02 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:31:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 May 2018 14:30:11 +0800
Message-ID: <1527661812-30744-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527661812-30744-1-git-send-email-yi.zhao@windriver.com>
References: <1527661812-30744-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-filesystems][PATCH 3/4] yaffs2-utils: add UPSTREAM_CHECK_COMMITS
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
X-List-Received-Date: Wed, 30 May 2018 06:31:02 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 67c926b..317965e 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -18,6 +18,9 @@ SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
            "
 
 SRCREV = "bc76682d93955cfb33051beb503ad9f8a5450578"
+
+UPSTREAM_CHECK_COMMITS = "1"
+
 S = "${WORKDIR}/git"
 
 CFLAGS_append = " -I.. -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DEFINES_TYPES"
-- 
2.7.4


