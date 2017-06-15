Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB9AF600EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 01:36:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5F1adxh014318
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jun 2017 18:36:39 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 14 Jun 2017 18:36:37 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Jun 2017 09:36:36 +0800
Message-ID: <cover.1497428466.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/1 v2] microcode-ctl: add new recipe
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
X-List-Received-Date: Thu, 15 Jun 2017 01:36:41 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comments:
- fix the licenses and add Intel-ucode license file 
- remove the un-needed MACHINE specific variable 

--
The following changes since commit 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837:

  opencv: fix runtime dependencies. (2017-06-12 06:56:45 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_up_microcode-v2_170614_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_up_microcode-v2_170614_0

Jackie Huang (1):
  microcode-ctl: add new recipe

 meta-oe/licenses/Intel-ucode                       | 30 ++++++++++
 .../0001-add-support-for-other-distributions.patch | 27 +++++++++
 .../files/0001-fix-the-help-return-code.patch      | 57 +++++++++++++++++++
 .../files/fix-No-GNU_HASH-in-the-elf-binary.patch  | 30 ++++++++++
 .../microcode-ctl/files/microcode_ctl.service      | 11 ++++
 .../recipes-bsp/microcode-ctl/microcode-ctl_git.bb | 65 ++++++++++++++++++++++
 6 files changed, 220 insertions(+)
 create mode 100644 meta-oe/licenses/Intel-ucode
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for-other-distributions.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-return-code.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-the-elf-binary.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
 create mode 100755 meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb

-- 
2.11.0


