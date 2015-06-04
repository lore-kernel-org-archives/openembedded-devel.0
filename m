Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A134C755FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 07:48:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t547mGbE005855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jun 2015 00:48:16 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 4 Jun 2015 00:48:16 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jun 2015 15:48:10 +0800
Message-ID: <cover.1433403866.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 0/3] 3 fixes for multilib
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
X-List-Received-Date: Thu, 04 Jun 2015 07:48:20 -0000
Content-Type: text/plain


The following changes since commit 9a5d25f2a717814f948b492b9c01c1ff0edb678d:

  pinpoint: use clutter-gst-3.0 (2015-05-28 10:35:35 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/fixes-for-multilib
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/fixes-for-multilib

Yi Zhao (3):
  luajit: fix build failure for multilib
  nodejs: fix build failure for multilib
  llvm: fix libdir for multilib

 meta-oe/recipes-core/llvm/llvm.inc               |    9 ++++++++-
 meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb  |    4 ++--
 meta-oe/recipes-devtools/nodejs/nodejs_0.12.4.bb |    9 +++------
 3 files changed, 13 insertions(+), 9 deletions(-)

-- 
1.7.9.5


