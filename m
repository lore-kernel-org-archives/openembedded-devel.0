Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8AA97CE86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 02:13:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBD2DkJk004041
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:13:46 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 12 Dec 2019 18:13:45 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Dec 2019 10:13:40 +0800
Message-ID: <20191213021342.8636-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/2] Fix corosync build error when package config rdma enabled
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
X-List-Received-Date: Fri, 13 Dec 2019 02:13:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (2):
  rdma-core: 18.1 -> 26.1
  corosync: fix build error when package config rdma enabled

 ...igure.ac-fix-pkgconfig-issue-of-rdma.patch |  32 +++
 .../corosync/corosync_2.4.5.bb                |   3 +-
 ...Remove-man-files-which-cant-be-built.patch | 255 +++++++++++++++++-
 ...IFSOCK-is-defined-in-both-glibc-musl.patch |  29 --
 ...ude-endian.h-for-htole32-and-friends.patch |  25 --
 ...Remove-unused-include-for-execinfo.h.patch |  27 --
 ...igh.c-Do-not-include-net-if_packet.h.patch |  26 --
 .../{rdma-core_18.1.bb => rdma-core_26.1.bb}  |  26 +-
 8 files changed, 295 insertions(+), 128 deletions(-)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch
 delete mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch
 delete mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-include-endian.h-for-htole32-and-friends.patch
 delete mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0002-Remove-unused-include-for-execinfo.h.patch
 delete mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-include-net-if_packet.h.patch
 rename meta-networking/recipes-support/rdma-core/{rdma-core_18.1.bb => rdma-core_26.1.bb} (54%)

-- 
2.17.1


