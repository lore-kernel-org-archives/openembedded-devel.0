Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D44979C92
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:18:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x628FgiV001817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 01:17:41 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 01:16:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 2 Jul 2019 16:16:14 +0800
Message-ID: <cover.1562055251.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/8] Upgrade 8 recipes
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
X-List-Received-Date: Tue, 02 Jul 2019 08:18:01 -0000
Content-Type: text/plain

The following changes since commit 64974b8779291419486338f75f229a732e450d78:

  xfce4-screensaver: 0.1.4 -> 0.1.5 (2019-06-21 06:22:19 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib hongxu/upgrade-20190702
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=hongxu/upgrade-20190702

Hongxu Jia (8):
  python3-pykickstart: 3.18 -> 3.20
  python3-blivet: 3.1.2 -> 3.1.4
  python-pyparted/python3-pyparted: 3.11.1 -> 3.11.2
  libbytesize: 1.4 -> 2.0
  libblockdev: 2.20 -> 2.22
  network-manager-applet: 1.8.20 -> 1.8.22
  thin-provisioning-tools: 0.7.6 -> 0.8.5
  libreport: 2.9.7 -> 2.10.0

 ..._1.8.20.bb => network-manager-applet_1.8.22.bb} |  6 ++--
 .../{libblockdev_2.20.bb => libblockdev_2.22.bb}   |  2 +-
 .../{libreport_2.9.7.bb => libreport_2.10.0.bb}    |  2 +-
 .../files/0001-fix-out-of-tree-build-failure.patch | 37 +++++++++++++++++++
 .../{libbytesize_1.4.bb => libbytesize_2.0.bb}     |  8 ++---
 .../0001-fix-compile-failed-with-libc-musl.patch   | 42 ----------------------
 .../files/use-sh-on-path.patch                     | 21 ++++++++---
 ...s_0.7.6.bb => thin-provisioning-tools_0.8.5.bb} |  3 +-
 ...on3-blivet_3.1.2.bb => python3-blivet_3.1.4.bb} |  2 +-
 ...ckstart_3.18.bb => python3-pykickstart_3.20.bb} |  2 +-
 .../python-pyparted/python-pyparted.inc            |  2 +-
 ...yparted_3.11.1.bb => python-pyparted_3.11.2.bb} |  0
 ...parted_3.11.1.bb => python3-pyparted_3.11.2.bb} |  0
 13 files changed, 67 insertions(+), 60 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.8.20.bb => network-manager-applet_1.8.22.bb} (87%)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.20.bb => libblockdev_2.22.bb} (97%)
 rename meta-oe/recipes-extended/libreport/{libreport_2.9.7.bb => libreport_2.10.0.bb} (96%)
 create mode 100644 meta-oe/recipes-support/libbytesize/files/0001-fix-out-of-tree-build-failure.patch
 rename meta-oe/recipes-support/libbytesize/{libbytesize_1.4.bb => libbytesize_2.0.bb} (84%)
 delete mode 100644 meta-oe/recipes-support/thin-provisioning-tools/files/0001-fix-compile-failed-with-libc-musl.patch
 rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provisioning-tools_0.7.6.bb => thin-provisioning-tools_0.8.5.bb} (84%)
 rename meta-python/recipes-extended/python-blivet/{python3-blivet_3.1.2.bb => python3-blivet_3.1.4.bb} (96%)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.18.bb => python3-pykickstart_3.20.bb} (94%)
 rename meta-python/recipes-extended/python-pyparted/{python-pyparted_3.11.1.bb => python-pyparted_3.11.2.bb} (100%)
 rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.11.1.bb => python3-pyparted_3.11.2.bb} (100%)

-- 
2.7.4


