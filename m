Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 627A378F61
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:11:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7DGBo5L004084
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 09:11:50 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 09:11:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 14 Aug 2018 00:22:15 +0800
Message-ID: <cover.1534177115.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/5] misc fixes
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
X-List-Received-Date: Mon, 13 Aug 2018 16:11:50 -0000
Content-Type: text/plain

The following changes since commit 30bbde3d09ebdf1ad2eac7764abeae0990f4cea2:

  oprofile: upgrade 1.2.0 -> 1.3.0 (2018-08-11 20:16:53 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/misc-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/misc-fixes

Hongxu Jia (5):
  python3-pydbus: cherry-pick patches from fedora
  python-pykickstart: fix typo
  python3-blivet: remove dmraid from dependency check
  libblockdev: drop obsolete patch
  python3-blivet: add `-Z y' and `-y' to lvm.pvcreate

 .../0001-fix-configure-and-compile-failures.patch  |  87 ---------
 .../libblockdev/libblockdev_2.18.bb                |   1 -
 .../0001-Support-asynchronous-calls-58.patch       |  93 ++++++++++
 ...nsformation-between-D-Bus-errors-and-exce.patch | 203 +++++++++++++++++++++
 .../python/python3-pydbus_0.6.0.bb                 |   4 +
 .../0012-remove-dmraid-dependency-check.patch      |  31 ++++
 .../0013-add-Z-y-and-y-to-lvm.pvcreate.patch       |  41 +++++
 .../python-blivet/python3-blivet_3.0.1.bb          |   2 +
 ...0001-support-authentication-for-kickstart.patch |  10 +-
 ...d.py-retry-to-invoke-request-with-timeout.patch |   6 +-
 10 files changed, 382 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus/0001-Support-asynchronous-calls-58.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus/0002-Support-transformation-between-D-Bus-errors-and-exce.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0012-remove-dmraid-dependency-check.patch
 create mode 100644 meta-python/recipes-extended/python-blivet/python3-blivet/0013-add-Z-y-and-y-to-lvm.pvcreate.patch

-- 
2.7.4


