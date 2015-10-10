Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A11DC759D5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Oct 2015 03:39:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9A3dBl3010248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Oct 2015 20:39:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 9 Oct 2015 20:39:11 -0700
From: <kai.kang@windriver.com>
To: <martin.jansa@gmail.com>
Date: Sat, 10 Oct 2015 11:31:29 +0800
Message-ID: <1444447891-13579-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/2] V3: Upgrade efivar and efibootmgr
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
X-List-Received-Date: Sat, 10 Oct 2015 03:39:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V3:
* add patch to drop 2 gcc options for efivar-native which may NOT recognized by old gcc

Built for qemux86-64 and qemuarm on Ubuntu 12.04/14.04, Fedora 20.

And it fails to build with gcc 4.8 & 4.9:

| linux.c: In function 'make_mac_path':
| linux.c:850:9: error: missing braces around initializer [-Werror=missing-braces]
|   struct ifreq ifr = { 0, };
|          ^
| linux.c:850:9: error: (near initialization for 'ifr.ifr_ifrn') [-Werror=missing-braces]
| cc1: all warnings being treated as errors

It is a knonw issue of gcc and I'll send a patch to oe-core to fix it.

Ref:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119

Kai Kang (2):
  efivar: 0.7 -> 0.21
  efibootmgr: 0.6.0 -> 0.12

 .../{efibootmgr_0.6.0.bb => efibootmgr_0.12.bb}    | 21 ++++---
 .../efibootmgr/files/docbook-fixes.patch           | 28 ---------
 .../files/w-keep-existing-mbr-signature.patch      | 26 --------
 .../efivar/0001-efivar-fix-for-cross-compile.patch | 31 ++++++++++
 ...ptions-not-supported-by-lower-version-gcc.patch | 71 ++++++++++++++++++++++
 .../efivar/{efivar_git.bb => efivar_0.21.bb}       | 23 +++++--
 6 files changed, 130 insertions(+), 70 deletions(-)
 rename meta-oe/recipes-extended/efibootmgr/{efibootmgr_0.6.0.bb => efibootmgr_0.12.bb} (39%)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/docbook-fixes.patch
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/w-keep-existing-mbr-signature.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
 rename meta-oe/recipes-extended/efivar/{efivar_git.bb => efivar_0.21.bb} (27%)

-- 
2.6.0.rc2.10.gf4d9753


