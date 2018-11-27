Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 558426D13B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:16:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAR8FQsk018530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2018 00:15:57 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 00:15:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 16:32:34 +0800
Message-ID: <cover.1543307294.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/12] Upgrade 12 recipes
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
X-List-Received-Date: Tue, 27 Nov 2018 08:16:22 -0000
Content-Type: text/plain

The following changes since commit c26b10b155cf7873ffc8e966f95fd4abed8230c6:

  opensc: 0.18.0 version fix fetch error (2018-11-16 14:46:44 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20181127
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20181127

Hongxu Jia (12):
  dconf: 0.28.0 -> 0.30.1
  python3-pykickstart: 3.15 -> 3.18
  python3-blivetgui: 2.1.8 -> 2.1.9
  python3-blivet: 3.0.1 -> 3.1.1
  libreport: 2.9.5 -> 2.9.6
  volume-key: 0.3.11 -> 0.3.12
  efibootmgr: 0.16 -> 17
  libbytesize: 1.3 -> 1.4
  efivar: correct version number 0.36 -> 36
  lvm2/libdevmapper: 2.02.180 -> 2.03.01
  libblockdev: 2.18 -> 2.20
  ndctl: v62 -> v63

 .../0001-meson.build-do-not-compile-docs.patch     |  27 ++++
 .../dconf/{dconf_0.28.0.bb => dconf_0.30.1.bb}     |   7 +-
 .../{efibootmgr_0.16.bb => efibootmgr_17.bb}       |   2 +-
 .../efivar/{efivar_0.36.bb => efivar_36.bb}        |   0
 .../ndctl/{ndctl_git.bb => ndctl_v63.bb}           |   9 +-
 .../{libblockdev_2.18.bb => libblockdev_2.20.bb}   |   6 +-
 .../{libreport_2.9.5.bb => libreport_2.9.6.bb}     |   2 +-
 .../{volume-key_0.3.11.bb => volume-key_0.3.12.bb} |   8 +-
 .../{libbytesize_1.3.bb => libbytesize_1.4.bb}     |   3 +-
 .../0001-Avoid-bashisms-in-init-scripts.patch      | 136 ++++++---------------
 .../lvm2/files/0005-do-not-build-manual.patch      |  30 ++---
 ...vmapper_2.02.180.bb => libdevmapper_2.03.01.bb} |   4 +-
 meta-oe/recipes-support/lvm2/lvm2.inc              |   8 +-
 .../0001-explicitly-do-not-install-libdm.patch     |  33 ++---
 .../lvm2/{lvm2_2.02.180.bb => lvm2_2.03.01.bb}     |   4 +-
 .../python3-blivet/0001-comment-out-selinux.patch  |  12 +-
 .../0002-run_program-support-timeout.patch         |  21 ++--
 .../0003-support-infinit-timeout.patch             |  14 +--
 ...0004-fix-new.roots-object-is-not-iterable.patch |   6 +-
 ...correct-timeout-while-system-time-changed.patch |   6 +-
 .../python3-blivet/0006-tweak-btrfs-packages.patch |   2 +-
 ...0007-invoking-mount-with-infinite-timeout.patch |  18 +--
 ...-use-oe-variable-to-replace-hardcoded-dir.patch |   4 +-
 .../0009-invoking-fsck-with-infinite-timeout.patch |   2 +-
 .../0010-invoking-mkfs-with-infinite-timeout.patch |   2 +-
 .../0011-invoking-dd-with-infinite-timeout.patch   |   6 +-
 .../0012-remove-dmraid-dependency-check.patch      |  31 -----
 .../0013-add-Z-y-and-y-to-lvm.pvcreate.patch       |  41 -------
 ...on3-blivet_3.0.1.bb => python3-blivet_3.1.1.bb} |   4 +-
 ...ivetgui_2.1.8.bb => python3-blivetgui_2.1.9.bb} |   2 +-
 ...ckstart_3.15.bb => python3-pykickstart_3.18.bb} |   2 +-
 31 files changed, 173 insertions(+), 279 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf/0001-meson.build-do-not-compile-docs.patch
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.28.0.bb => dconf_0.30.1.bb} (60%)
 rename meta-oe/recipes-bsp/efibootmgr/{efibootmgr_0.16.bb => efibootmgr_17.bb} (93%)
 rename meta-oe/recipes-bsp/efivar/{efivar_0.36.bb => efivar_36.bb} (100%)
 rename meta-oe/recipes-core/ndctl/{ndctl_git.bb => ndctl_v63.bb} (81%)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.18.bb => libblockdev_2.20.bb} (92%)
 rename meta-oe/recipes-extended/libreport/{libreport_2.9.5.bb => libreport_2.9.6.bb} (96%)
 rename meta-oe/recipes-extended/volume_key/{volume-key_0.3.11.bb => volume-key_0.3.12.bb} (71%)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_1.3.bb => libbytesize_1.4.bb} (91%)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.02.180.bb => libdevmapper_2.03.01.bb} (55%)
 rename meta-oe/recipes-support/lvm2/{lvm2_2.02.180.bb => lvm2_2.03.01.bb} (88%)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.0.1.bb => python3-blivet_3.1.1.bb} (89%)
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.1.8.bb => python3-blivetgui_2.1.9.bb} (92%)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.15.bb => python3-pykickstart_3.18.bb} (94%)

-- 
2.7.4


