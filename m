Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 354AE76DE1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 06:28:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U6S9l1002286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Sep 2015 23:28:10 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 29 Sep 2015 23:28:09 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Wed, 30 Sep 2015 14:21:11 +0800
Message-ID: <1443594073-23679-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.0.rc2.10.gf4d9753
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/2] V3: Upgrade efivar and efibootmgr
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
X-List-Received-Date: Wed, 30 Sep 2015 06:28:13 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V3:
* add description for efivar that license checksum changes
* create with git option '-M'

V2 only affects efivar commit:
* update git repo - the previous repo uri is a clone of the official repo
* add efivar-native package to provide command makeguids for efivar to avoid cross compile issue

Kai Kang (2):
  efivar: 0.7 -> 0.21
  efibootmgr: 0.6.0 -> 0.12

 .../{efibootmgr_0.6.0.bb => efibootmgr_0.12.bb}    | 21 ++++++++-------
 .../efibootmgr/files/docbook-fixes.patch           | 28 -------------------
 .../files/w-keep-existing-mbr-signature.patch      | 26 ------------------
 .../efivar/0001-efivar-fix-for-cross-compile.patch | 31 ++++++++++++++++++++++
 .../efivar/{efivar_git.bb => efivar_0.21.bb}       | 22 ++++++++++-----
 5 files changed, 58 insertions(+), 70 deletions(-)
 rename meta-oe/recipes-extended/efibootmgr/{efibootmgr_0.6.0.bb => efibootmgr_0.12.bb} (39%)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
 rename meta-oe/recipes-extended/efivar/{efivar_git.bb => efivar_0.21.bb} (31%)

-- 
2.6.0.rc2.10.gf4d9753


