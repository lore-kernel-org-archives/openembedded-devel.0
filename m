Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 565DC78273
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 07:37:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4Q7bYMX022203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 May 2017 00:37:34 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 26 May 2017 00:37:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 May 2017 03:37:28 -0400
Message-ID: <cover.1495783956.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/4] fix lvm2 invoking lvcreate failed && add python3-pyparted && add python3-pyudev
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
X-List-Received-Date: Fri, 26 May 2017 07:37:38 -0000
Content-Type: text/plain

The following changes since commit b063789560bfb9c60a7a15277b5b3a9839b5ba74:

  libgpiod: add new recipe (2017-05-23 15:59:31 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-lvm2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/fix-lvm2

Hongxu Jia (4):
  gnome-themes: remove PNBLACKLIST
  python3-pyparted: add a python3 recipe
  python3-pyudev: add a python3 recipe
  lvm2/libdevmapper: fix invoking lvcreate failed

 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |  6 ++--
 .../recipes-support/lvm2/libdevmapper_2.02.166.bb  | 21 ++-----------
 meta-oe/recipes-support/lvm2/lvm2.inc              | 26 +++++++++++++++-
 .../0001-explicitly-do-not-install-libdm.patch     | 36 ++++++++++++++++++++++
 meta-oe/recipes-support/lvm2/lvm2_2.02.171.bb      | 31 ++-----------------
 .../recipes-devtools/python/python-pyudev.inc      | 19 ++++++++++++
 .../python/python-pyudev_0.21.0.bb                 | 22 +++----------
 .../python/python3-pyudev_0.21.0.bb                |  8 +++++
 .../python-pyparted/python-pyparted.inc            | 21 +++++++++++++
 .../python-pyparted/python-pyparted_3.10.7.bb      | 23 +++-----------
 .../0001-fix-version-float-check.patch             | 26 ++++++++++++++++
 .../python-pyparted/python3-pyparted_3.10.7.bb     | 12 ++++++++
 12 files changed, 163 insertions(+), 88 deletions(-)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-explicitly-do-not-install-libdm.patch
 create mode 100644 meta-python/recipes-devtools/python/python-pyudev.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
 create mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted.inc
 create mode 100644 meta-python/recipes-extended/python-pyparted/python3-pyparted/0001-fix-version-float-check.patch
 create mode 100644 meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb

-- 
2.8.1


