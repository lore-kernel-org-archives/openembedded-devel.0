Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B95CF74D0C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:31:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4U6UODA001317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:30:55 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:30:42 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 May 2018 14:30:09 +0800
Message-ID: <1527661812-30744-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527661812-30744-1-git-send-email-yi.zhao@windriver.com>
References: <1527661812-30744-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-filesystems][PATCH 1/4] fuse: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 30 May 2018 06:31:04 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
index 202d4c3..2996319 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
@@ -19,6 +19,8 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
 SRC_URI[md5sum] = "9bd4ce8184745fd3d000ca2692adacdb"
 SRC_URI[sha256sum] = "832432d1ad4f833c20e13b57cf40ce5277a9d33e483205fc63c78111b3358874"
 
+UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
+
 inherit autotools pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "fuse"
-- 
2.7.4


