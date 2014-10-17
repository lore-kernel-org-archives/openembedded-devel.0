Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18A0A60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2014 06:49:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9H6nWSD029556
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 23:49:32 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 23:49:31 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Oct 2014 02:49:29 -0400
Message-ID: <cover.1413528325.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1][meta-oe] rsnapshot: fix rsnapshot.conf.default
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
X-List-Received-Date: Fri, 17 Oct 2014 06:49:37 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

This change is used for fixing cmd path in rsnapshot.conf.default.

The options --without-* disable checking command * on host and get
the default path used, otherwise the host path will be injected into
target configs.

The runtime dependencies to ssh, logger, cp, du are optional and
could be customized in rsnapshot.conf, so it's not needed that
using PACKAGECONFIG to define the runtime dependencies.

The following changes since commit fa04f43dee6994bb63374995a6444e72d65bc658:

  libgphoto2: add bash to RDEPENDS (2014-10-16 07:01:01 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/fix-rsnapshot
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/fix-rsnapshot

Wenzong Fan (1):
  rsnapshot: fix rsnapshot.conf.default

 .../rsnapshot/configure-fix-cmd_rsync.patch        |   44 ++++++++++++++++++++
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb |   12 +++++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/rsnapshot/rsnapshot/configure-fix-cmd_rsync.patch

-- 
1.7.9.5


