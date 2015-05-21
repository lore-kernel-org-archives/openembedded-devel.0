Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D300607BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 08:00:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4L80suj012190
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 01:00:54 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 21 May 2015 01:00:53 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 May 2015 16:00:47 +0800
Message-ID: <cover.1432194921.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 0/4] 4 fixes for multilib
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
X-List-Received-Date: Thu, 21 May 2015 08:00:53 -0000
Content-Type: text/plain

The following changes since commit 54def94d4e7aa8900fec58e6aaef8f8c3b0b563e:

  sylpheed: remove do_install_append (2015-05-17 09:46:31 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/4-fixes-for-multilib
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/4-fixes-for-multilib

Yi Zhao (4):
  libio-pty-perl: fix QA issue for multilib
  lprng: fix QA issue for multilib
  ctags: fix ${PN}-${PV} -> ${BP} for multilib
  cscope: fix ${PN}-${PV} -> ${BP} for multilib

 meta-oe/recipes-devtools/cscope/cscope_15.8b.bb    |    2 +-
 meta-oe/recipes-devtools/ctags/ctags_5.8.bb        |    2 +-
 .../recipes-devtools/perl/libio-pty-perl_1.10.bb   |    2 ++
 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb      |    2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

-- 
1.7.9.5


