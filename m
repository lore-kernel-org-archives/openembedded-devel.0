Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0A4E71AE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 07:38:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v797cXtv004685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 9 Aug 2017 00:38:34 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 9 Aug 2017 00:38:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Aug 2017 03:38:29 -0400
Message-ID: <cover.1502261386.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/2] libblockdev/tigervnc: fix clang compiling issues
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
X-List-Received-Date: Wed, 09 Aug 2017 07:38:34 -0000
Content-Type: text/plain

The following changes since commit 0fdf014ffc080b614293dab17713c01afce5c914:

  fbida: Fix build with libjpeg-turbo (2017-08-09 02:15:15 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-clang-issue
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/fix-clang-issue

Hongxu Jia (2):
  libblockdev: fix a clang compiling issue
  tigervnc: fix a clang compiling issue

 .../files/0005-fix-a-clang-compiling-issue.patch   | 111 +++++++++++++++++++++
 .../libblockdev/libblockdev_2.10.bb                |   1 +
 ...005-Remove-INITARGS-from-xserver119.patch.patch |  27 +++++
 .../recipes-graphics/tigervnc/tigervnc_1.8.0.bb    |   1 +
 4 files changed, 140 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0005-Remove-INITARGS-from-xserver119.patch.patch

-- 
2.8.1


