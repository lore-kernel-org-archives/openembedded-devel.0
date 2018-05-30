Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F22C600EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:30:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4U6UOD7001317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:30:40 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:30:14 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 May 2018 14:30:08 +0800
Message-ID: <1527661812-30744-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-filesystems][PATCH 0/4] add UPSTREAM_CHECK_URI for recipes
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
X-List-Received-Date: Wed, 30 May 2018 06:30:49 -0000
Content-Type: text/plain

Some recipes can not get upstream version with bitbake foo -c checkpkg. Add UPSTREAM_CHECK_URI for these recipes.

Yi Zhao (4):
  fuse: add UPSTREAM_CHECK_URI
  ntfs-3g-ntfsprogs: add UPSTREAM_CHECK_URI
  yaffs2-utils: add UPSTREAM_CHECK_COMMITS
  aufs-util: add UPSTREAM_CHECK_COMMITS

 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2017.3.23.bb                   | 3 +++
 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb        | 3 +++
 meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb                    | 2 ++
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb              | 2 ++
 4 files changed, 10 insertions(+)

-- 
2.7.4


