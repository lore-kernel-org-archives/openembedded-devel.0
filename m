Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1377C033
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:39:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBI7cYgx014805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 23:39:00 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:38:44 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Dec 2018 15:38:34 +0800
Message-ID: <cover.1545037250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/8] upgrade 5 recipes and 3 fixes
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
X-List-Received-Date: Tue, 18 Dec 2018 07:39:26 -0000
Content-Type: text/plain

The following changes since commit ff6bead1624a1e261408516b3d064a04aab5f592:

  doxygen: Use SOURCEFORGE_MIRROR for SRC_URI (2018-12-07 08:38:34 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20181217
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20181217

Hongxu Jia (8):
  efivar: 36 -> 37
  libreport: 2.9.6 -> 2.9.7
  python3-blivet: 3.1.1 -> 3.1.2
  python3-blivetgui: 2.1.9 -> 2.1.10
  python-pyparted/python3-pyparted: drop incorrect and redundant PV
  usermode: 1.112 -> 1.113
  lvm2/libdevmapper: drop unnecessary UPSTREAM_CHECK_URI and
    UPSTREAM_CHECK_REGEX
  efibootmgr: fix conflicting types for 'efi_set_verbose'

 ...1-Include-sys-sysmacros.h-for-major-minor.patch | 25 -----------------
 .../0001-Missing-n-in-translated-string.patch      | 28 -------------------
 .../{usermode_1.112.bb => usermode_1.113.bb}       |  6 ++---
 meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb    |  1 +
 .../efibootmgr/files/0001-remove-extra-decl.patch  | 31 ++++++++++++++++++++++
 .../efivar/{efivar_36.bb => efivar_37.bb}          |  2 +-
 .../{libreport_2.9.6.bb => libreport_2.9.7.bb}     |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc              |  3 ---
 ...on3-blivet_3.1.1.bb => python3-blivet_3.1.2.bb} |  2 +-
 ...vetgui_2.1.9.bb => python3-blivetgui_2.1.10.bb} |  2 +-
 .../python-pyparted/python-pyparted_3.11.1.bb      |  2 --
 .../python-pyparted/python3-pyparted_3.11.1.bb     |  2 --
 12 files changed, 38 insertions(+), 68 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-Include-sys-sysmacros.h-for-major-minor.patch
 delete mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-Missing-n-in-translated-string.patch
 rename meta-gnome/recipes-support/usermode/{usermode_1.112.bb => usermode_1.113.bb} (79%)
 create mode 100644 meta-oe/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch
 rename meta-oe/recipes-bsp/efivar/{efivar_36.bb => efivar_37.bb} (96%)
 rename meta-oe/recipes-extended/libreport/{libreport_2.9.6.bb => libreport_2.9.7.bb} (96%)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.1.1.bb => python3-blivet_3.1.2.bb} (96%)
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.1.9.bb => python3-blivetgui_2.1.10.bb} (92%)

-- 
2.7.4


