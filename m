Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6F478AD2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 01:23:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w721NXVT001767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 18:23:33 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 18:23:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 09:33:53 +0800
Message-ID: <cover.1533173392.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533111522.git.hongxu.jia@windriver.com>
References: <cover.1533111522.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH V3 00/16] upgrade 16 recipes
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
X-List-Received-Date: Thu, 02 Aug 2018 01:23:33 -0000
Content-Type: text/plain

Changed in V3:
- network-manager-applet: ${datadir}/appdata was
  replaced by ${datadir}/metainfo - so remove ${datadir}/appdata

Changed in V2:

- dconf: inherit bash-completion and use var-GNOMEBASEBUILDCLASS

- usermode: correct typo in subject

- python3-blivet: correct typo of branch name (s/3.0-release/3.1-release/)

The following changes since commit a001e465293b36c03d4ca4500857fe0a67d13e20:

  samba: Update to 4.8.3 (2018-07-30 01:34:10 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20180801
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20180801

//Hongxu

Hongxu Jia (16):
  dconf 0.18.0 -> 0.28.0
  usermode: 1.111 -> 1.112
  libgnomekbd: 3.22.0 -> 3.26.0
  network-manager-applet: 1.8.10 -> 1.8.14
  libblockdev: clean up obsolete patches
  thin-provisioning-tools: 0.6.3 -> 0.7.6
  efibootmgr: 0.15 -> 0.16
  efivar: 0.31 -> 0.36
  lvm2/libdevmapper: 2.02.177 -> 2.02.180
  volume-key: 0.3.10 -> 0.3.11
  tigervnc: 1.8.0 -> 1.9.0
  libreport: 2.9.2 -> 2.9.5
  isomd5sum: 1.2.1 -> 1.2.3
  python3-blivet: 2.2.0 -> 3.0.1
  python3-pykickstart: 2.35 -> 3.15
  python3-blivetgui: 2.1.5 -> 2.1.8

 ..._1.8.10.bb => network-manager-applet_1.8.14.bb} |   6 +-
 .../dconf/{dconf_0.18.0.bb => dconf_0.28.0.bb}     |  27 +-
 ...libgnomekbd_3.22.0.bb => libgnomekbd_3.26.0.bb} |   4 +-
 .../0001-Missing-n-in-translated-string.patch      |  37 +-
 .../usermode/usermode/0001-formatting-issues.patch |  34 --
 .../{usermode_1.111.bb => usermode_1.112.bb}       |   6 +-
 .../{efibootmgr_0.15.bb => efibootmgr_0.16.bb}     |   2 +-
 ...-Add-Wunknown-attributes-when-using-clang.patch |  33 --
 ...Do-not-use-__bswap_constant_-16-32-macros.patch |  35 --
 .../efivar/0003-efivar-fix-for-cross-compile.patch |  42 --
 .../allow-multi-definitions-for-native.patch       |  14 +-
 .../recipes-bsp/efivar/efivar/musl-strndupa.patch  |  25 --
 .../efivar/{efivar_0.31.bb => efivar_0.36.bb}      |  11 +-
 .../files/0001-tweak-install-prefix.patch          |  14 +-
 .../{isomd5sum_1.2.1.bb => isomd5sum_1.2.3.bb}     |   2 +-
 .../files/0002-remove-python2-support.patch        |  30 --
 ...emove-dmraid-while-compiling-with-with-dm.patch | 492 ---------------------
 ...ix-compile-failure-against-musl-C-library.patch |  50 ---
 .../files/0005-fix-a-clang-compiling-issue.patch   | 111 -----
 .../0001-Makefile.am-remove-doc-and-apidoc.patch   |   8 +-
 ...ac-remove-prog-test-of-xmlto-and-asciidoc.patch |  16 +-
 .../files/0003-without-build-plugins.patch         |   6 +-
 ...configure.ac-remove-prog-test-of-augparse.patch |  10 +-
 .../files/0005-remove-python2-support.patch        | 142 ------
 .../{libreport_2.9.2.bb => libreport_2.9.5.bb}     |   5 +-
 ...-explicitly-support-python3-by-pkg-config.patch |  54 ---
 .../{volume-key_0.3.10.bb => volume-key_0.3.11.bb} |   5 +-
 .../files/0001-tigervnc-remove-includedir.patch    |  16 +-
 ...005-Remove-INITARGS-from-xserver119.patch.patch |  27 --
 .../{tigervnc_1.8.0.bb => tigervnc_1.9.0.bb}       |  11 +-
 ...0004-tweak-MODPROBE_CMD-for-cross-compile.patch |  29 +-
 .../lvm2/files/0005-do-not-build-manual.patch      |  46 +-
 ...mapper_2.02.177.bb => libdevmapper_2.02.180.bb} |   4 +-
 meta-oe/recipes-support/lvm2/lvm2.inc              |   4 +-
 .../lvm2/{lvm2_2.02.177.bb => lvm2_2.02.180.bb}    |   4 +-
 ...01-do-not-strip-pdata_tools-at-do_install.patch |  12 +-
 .../0001-fix-compile-failed-with-libc-musl.patch   |  48 +-
 ...s_0.6.3.bb => thin-provisioning-tools_0.7.6.bb} |   3 +-
 .../python3-blivet/0001-comment-out-selinux.patch  |  20 +-
 .../0002-run_program-support-timeout.patch         |  10 +-
 .../0003-support-infinit-timeout.patch             |  16 +-
 .../0004-Mount-var-volatile-during-install.patch   |  59 ---
 ...004-fix-new.roots-object-is-not-iterable.patch} |   8 +-
 ...orrect-timeout-while-system-time-changed.patch} |   8 +-
 .../0005-update-fstab-by-appending.patch           |  32 --
 ...kages.patch => 0006-tweak-btrfs-packages.patch} |  10 +-
 ...007-invoking-mount-with-infinite-timeout.patch} |   8 +-
 ...use-oe-variable-to-replace-hardcoded-dir.patch} |   6 +-
 ...0009-invoking-fsck-with-infinite-timeout.patch} |   6 +-
 ...0010-invoking-mkfs-with-infinite-timeout.patch} |   4 +-
 ...> 0011-invoking-dd-with-infinite-timeout.patch} |  10 +-
 ...on3-blivet_2.2.0.bb => python3-blivet_3.0.1.bb} |  25 +-
 ...ivetgui_2.1.5.bb => python3-blivetgui_2.1.8.bb} |   2 +-
 ...0001-support-authentication-for-kickstart.patch |  59 ++-
 ...-parser.py-add-lock-for-readKickstart-and.patch |  36 +-
 ...-sections-shutdown-and-environment-in-gen.patch |  10 +-
 ...d.py-retry-to-invoke-request-with-timeout.patch |  25 +-
 ...ckstart_2.35.bb => python3-pykickstart_3.15.bb} |   5 +-
 58 files changed, 308 insertions(+), 1476 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.8.10.bb => network-manager-applet_1.8.14.bb} (86%)
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.18.0.bb => dconf_0.28.0.bb} (29%)
 rename meta-gnome/recipes-gnome/libgnome/{libgnomekbd_3.22.0.bb => libgnomekbd_3.26.0.bb} (71%)
 rename meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch => meta-gnome/recipes-support/usermode/usermode/0001-Missing-n-in-translated-string.patch (15%)
 delete mode 100644 meta-gnome/recipes-support/usermode/usermode/0001-formatting-issues.patch
 rename meta-gnome/recipes-support/usermode/{usermode_1.111.bb => usermode_1.112.bb} (84%)
 rename meta-oe/recipes-bsp/efibootmgr/{efibootmgr_0.15.bb => efibootmgr_0.16.bb} (93%)
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/0001-efivar-dp.h-Add-Wunknown-attributes-when-using-clang.patch
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
 delete mode 100644 meta-oe/recipes-bsp/efivar/efivar/musl-strndupa.patch
 rename meta-oe/recipes-bsp/efivar/{efivar_0.31.bb => efivar_0.36.bb} (72%)
 rename meta-oe/recipes-extended/isomd5sum/{isomd5sum_1.2.1.bb => isomd5sum_1.2.3.bb} (94%)
 delete mode 100644 meta-oe/recipes-extended/libblockdev/files/0002-remove-python2-support.patch
 delete mode 100644 meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch
 delete mode 100644 meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch
 delete mode 100644 meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch
 delete mode 100644 meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch
 rename meta-oe/recipes-extended/libreport/{libreport_2.9.2.bb => libreport_2.9.5.bb} (93%)
 delete mode 100644 meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
 rename meta-oe/recipes-extended/volume_key/{volume-key_0.3.10.bb => volume-key_0.3.11.bb} (78%)
 delete mode 100644 meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.8.0.bb => tigervnc_1.9.0.bb} (91%)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.02.177.bb => libdevmapper_2.02.180.bb} (63%)
 rename meta-oe/recipes-support/lvm2/{lvm2_2.02.177.bb => lvm2_2.02.180.bb} (93%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-name-change.patch => meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch (11%)
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_0.6.3.bb => thin-provisioning-tools_0.7.6.bb} (83%)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0006-fix-new.roots-object-is-not-iterable.patch => 0004-fix-new.roots-object-is-not-iterable.patch} (78%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0007-fix-incorrect-timeout-while-system-time-changed.patch => 0005-fix-incorrect-timeout-while-system-time-changed.patch} (86%)
 delete mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0005-update-fstab-by-appending.patch
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0008-tweak-btrfs-packages.patch => 0006-tweak-btrfs-packages.patch} (85%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0009-invoking-mount-with-infinite-timeout.patch => 0007-invoking-mount-with-infinite-timeout.patch} (74%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0010-use-oe-variable-to-replace-hardcoded-dir.patch => 0008-use-oe-variable-to-replace-hardcoded-dir.patch} (85%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0011-invoking-fsck-with-infinite-timeout.patch => 0009-invoking-fsck-with-infinite-timeout.patch} (84%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0012-invoking-mkfs-with-infinite-timeout.patch => 0010-invoking-mkfs-with-infinite-timeout.patch} (87%)
 rename meta-python/recipes-extended/python-blivet/python3-blivet/{0014-invoking-dd-with-infinite-timeout.patch => 0011-invoking-dd-with-infinite-timeout.patch} (78%)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_2.2.0.bb => python3-blivet_3.0.1.bb} (51%)
 rename meta-python/recipes-extended/python-blivet/{python3-blivetgui_2.1.5.bb => python3-blivetgui_2.1.8.bb} (92%)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_2.35.bb => python3-pykickstart_3.15.bb} (86%)

-- 
2.7.4


