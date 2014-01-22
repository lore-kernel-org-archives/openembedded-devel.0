Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7B63560CEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:02:16 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so4162427ead.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pNx+ft2bd8lLWZflAlvX2rp5RwT6B5hV2c4OzU0eyG0=;
	b=it8BxtNdJwy1571jskOFb4Ll2hKlNlzLooCTuh0VSVUbhAmLpGpShljjmu8ITHR8bZ
	uBWzwpHVCG2IfQKWsIIo0tr73CeNX/qhs4LXK4g6WhJqnPodx+iti/Gj89UD3SRao6xJ
	oXlLNsoCNFERELilsWXK+VkjtsJl8TdJKSGFMAkZ1NzZwlpCxRPLfBHYqZgS5s4PaHU4
	sCpcChueHY0lx8Vzl1QCW85HjdGleiKRfvFiA19ql7ni/ON3YebPqQawph6L1FE3Cl+y
	cNPryQ1H5HqX+EQukXJtynLkYRxyScCNih7UE2StFMUSyf+cpLjT3xD+UntMv4D1MQBE
	rkGA==
X-Received: by 10.14.32.67 with SMTP id n43mr26685261eea.17.1390348936922;
	Tue, 21 Jan 2014 16:02:16 -0800 (PST)
Received: from mizar.localdomain
	(host229-63-dynamic.24-79-r.retail.telecomitalia.it. [79.24.63.229])
	by mx.google.com with ESMTPSA id
	o13sm20368931eex.19.2014.01.21.16.02.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 16:02:16 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2014 01:02:01 +0100
Message-Id: <1390348921-711-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld] Pull Request 20140122
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
X-List-Received-Date: Wed, 22 Jan 2014 00:02:16 -0000

The following changes since commit 066a4d4da6e2a2b6398b96e2144215d36f686104:

  Update LIC_FILES_CHKSUM after toplevel LICENSE file checksum change (2014-01-17 12:09:20 +0000)

are available in the git repository at:

  https://github.com/andrea-adami/meta-handheld master

for you to fetch changes up to 2f3054d6daf1cbbf6a769c118ac3768f19a03410:

  linux-yocto*: collie: unified patch for LH28F640BF NOR flash (2014-01-22 00:43:01 +0100)

----------------------------------------------------------------
Andrea Adami (4):
      linux-yocto*: collie: re-enable buffered write for NOR flash
      linux-yocto*: collie: update collie-match-cfi-qry.patch
      linux-yocto*: collie: remove previous MTD CFI patches
      linux-yocto*: collie: unified patch for LH28F640BF NOR flash

 .../linux/linux-yocto-3.10/collie/collie.scc       |   5 +-
 .../patches/patches-mtd/collie-LH28F640BF.patch    | 131 +++++++++++++++++++++
 .../patches/patches-mtd/collie-PCR.patch           |  71 -----------
 .../patches-mtd/collie-cfi-partitions.patch        |  48 --------
 .../patches/patches-mtd/collie-force-unlock.patch  |  22 ----
 .../patches/patches-mtd/collie-match-cfi-qry.patch |  15 ++-
 .../patches/patches-mtd/collie-no-buf-write.patch  |  31 -----
 .../linux/linux-yocto-dev/collie/collie.scc        |   5 +-
 .../patches/patches-mtd/collie-LH28F640BF.patch    | 131 +++++++++++++++++++++
 .../patches/patches-mtd/collie-PCR.patch           |  71 -----------
 .../patches-mtd/collie-cfi-partitions.patch        |  48 --------
 .../patches/patches-mtd/collie-force-unlock.patch  |  22 ----
 .../patches/patches-mtd/collie-match-cfi-qry.patch |  15 ++-
 .../patches/patches-mtd/collie-no-buf-write.patch  |  31 -----
 .../patches/patches-mtd/collie-LH28F640BF.patch    | 131 +++++++++++++++++++++
 .../patches/patches-mtd/collie-PCR.patch           |  71 -----------
 .../patches-mtd/collie-cfi-partitions.patch        |  48 --------
 .../patches/patches-mtd/collie-force-unlock.patch  |  22 ----
 .../patches/patches-mtd/collie-match-cfi-qry.patch |  15 ++-
 .../patches/patches-mtd/collie-no-buf-write.patch  |  31 -----
 .../linux/linux-yocto-tiny-kexecboot_3.10.bbappend |   5 +-
 21 files changed, 426 insertions(+), 543 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-LH28F640BF.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-PCR.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-cfi-partitions.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-unlock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-no-buf-write.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-LH28F640BF.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-PCR.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-cfi-partitions.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-force-unlock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-no-buf-write.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-LH28F640BF.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-PCR.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-partitions.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-unlock.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-no-buf-write.patch

