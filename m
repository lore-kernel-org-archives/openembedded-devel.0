Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 466A471995
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 09:23:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uA19N88M025881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Nov 2016 02:23:08 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 1 Nov 2016 02:23:08 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Nov 2016 17:22:59 +0800
Message-ID: <cover.1477991825.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-networking][PATCH 0/6] fix GNU_HASH QA warnings
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
X-List-Received-Date: Tue, 01 Nov 2016 09:23:08 -0000
Content-Type: text/plain


The following changes since commit 7a491f384c277ee42ac895fec6fc2ef70f15df4d:

  nodejs: update to 4.6.1 (2016-10-26 10:28:41 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/hash-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/hash-fixes

Yi Zhao (6):
  aoetools: fix QA warning for GNU_HASH
  nuttcp: fix QA warning for GNU_HASH
  zeroconf: fix QA warning for GNU_HASH
  tsocks: fix QA warning for GNU_HASH
  vblade: fix QA warning for GNU_HASH
  tunctl: fix QA warning for GNU_HASH

 .../vblade/files/makefile-add-ldflags.patch        | 19 +++++++++++++
 .../recipes-daemons/vblade/vblade_20.bb            |  4 ++-
 .../tsocks/tsocks/makefile-add-ldflags.patch       | 19 +++++++++++++
 .../recipes-protocols/tsocks/tsocks_1.8beta5.bb    |  4 ++-
 .../zeroconf/zeroconf/makefile-add-ldflags.patch   | 19 +++++++++++++
 .../recipes-protocols/zeroconf/zeroconf_0.9.bb     |  1 +
 .../aoetools/aoetools/makefile-add-ldflags.patch   | 31 ++++++++++++++++++++++
 .../recipes-support/aoetools/aoetools_36.bb        |  1 +
 .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |  2 +-
 meta-networking/recipes-support/tunctl/tunctl.inc  |  4 ++-
 .../tunctl/tunctl/makefile-add-ldflags.patch       | 19 +++++++++++++
 11 files changed, 119 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-protocols/tsocks/tsocks/makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf/makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-support/aoetools/aoetools/makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch

-- 
2.7.4


