Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96F856FFED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 16:19:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4AGJfYT015322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 10 May 2016 09:19:41 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 09:19:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Martin.Jansa@gmail.com>, <koen.kooi@linaro.org>
Date: Tue, 10 May 2016 12:19:34 -0400
Message-ID: <cover.1462896891.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH V5 0/5] efivar: upgrade to 0.23
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
X-List-Received-Date: Tue, 10 May 2016 16:19:46 -0000
Content-Type: text/plain

Changed in V5:
- Fix unknown option while gold linker used

Changed in V4:
- Fix one failed with:
| install -d -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/
| install -m 644 efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
;  install -m 644 efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
;
| install: cannot stat 'efivar.pc': No such file or directory
| install: cannot stat 'efiboot.pc': No such file or directory
| make[1]: *** [install] Error 1
| make[1]: Leaving directory `efivar/0.23-r0/git/src'
| make: *** [install] Error 2
| ERROR: oe_runmake failed

//Hongxu

The following changes since commit a6c172e2713f0018c5ebac0f957cff28b7ac2630:

  poppler: add --std=c++11 to fix build with Qt 5.7 (2016-05-06 12:40:28 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-efivar
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-efivar

Hongxu Jia (3):
  efivar: fix do_install failed
  efibootmgr: sync with upstream while efivar upgraded to 0.23
  efivar: fix unknown option while gold linker used

Koen Kooi (2):
  efivar: update to 0.23
  efibootmgr: update and unblacklist

 .../recipes-extended/efibootmgr/efibootmgr_0.12.bb | 14 ++---
 .../efibootmgr/files/ldflags.patch                 | 17 ------
 .../efivar/0001-efivar-fix-for-cross-compile.patch | 28 +++++----
 .../efivar/efivar/0002-disable-static-build.patch  | 33 ++++++++++
 .../efivar/0003-efivar-fix-for-cross-compile.patch | 44 ++++++++++++++
 .../0004-fix-unknow-option-for-gold-linker.patch   | 40 ++++++++++++
 ...ptions-not-supported-by-lower-version-gcc.patch | 71 ----------------------
 .../efivar/{efivar_0.21.bb => efivar_0.23.bb}      | 29 ++++-----
 8 files changed, 155 insertions(+), 121 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0003-efivar-fix-for-cross-compile.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
 rename meta-oe/recipes-extended/efivar/{efivar_0.21.bb => efivar_0.23.bb} (46%)

-- 
2.8.1


