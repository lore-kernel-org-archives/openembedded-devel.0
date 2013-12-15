Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2ED6DDFD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2013 16:46:31 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id a15so1778755eae.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2013 08:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XCtJlOLyhJKtUUihQNK6S9o1JflqvX0b1b/WtMLr4ng=;
	b=n09NdOnqe5eITeeeJo5yJR8RjXDSglpU8OpsoboOvSRngtQop96eIDNLKgqoxU8C+m
	okGRjrqPLn8ZNjM98t7VQGLSRUXu1HGD+w8/YE31ScP2HpNoOZ8SCuvfemE6bBQGocUZ
	NL6ID6pvdJ4KBYLx375XKz1weWSuSWN4QdnVbaOLygRiCu45eqs3jsbmcXRpA2lnyhbW
	G+zajyq1sxE8Qg+rYM3Lh/cT0Ilr2hGFCI6e2N/yRgBcb/YfbD+/xCaTR+KG93pFhrwI
	IhV/ilNnOyX+IkMewLirGIuPFmyzWlf7yGNa5nDPgp+3QBn+j4PGqeHSrnaRr/WETxEE
	18rw==
X-Received: by 10.14.5.12 with SMTP id 12mr12649245eek.9.1387125990628;
	Sun, 15 Dec 2013 08:46:30 -0800 (PST)
Received: from mizar.localdomain
	(host155-43-dynamic.54-79-r.retail.telecomitalia.it. [79.54.43.155])
	by mx.google.com with ESMTPSA id 44sm31959654eek.5.2013.12.15.08.46.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Dec 2013 08:46:30 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2013 17:46:26 +0100
Message-Id: <cover.1387125737.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld] pull request 20131215
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
X-List-Received-Date: Sun, 15 Dec 2013 16:46:33 -0000

The following changes since commit f7d2dd6cd9144837996673cc396bc68114eb294a:

  linux-yocto-tiny-kexecboot: use mini defconfig and patches in SRC_URI (2013-11-23 17:08:32 +0100)

are available in the git repository at:

  https://github.com/andrea-adami/meta-handheld master

for you to fetch changes up to debdd39695a7f476d3be75a2e51535db4f94f7df:

  README.zaurus: add some more details for flashing (2013-12-15 17:33:30 +0100)

----------------------------------------------------------------
Andrea Adami (6):
      collie.conf: fix mkfs.ubifs and ubinize parameters for NOR
      zaurus.inc: add ubi to image types for easy flashing
      linux-yocto*: collie: put device back to one single partition
      linux-yocto*: collie: remove unnecessary fixup-strataflash patch
      linux-yocto*: collie: disable CFI buffered write (temporary hack)
      README.zaurus: add some more details for flashing

 README.zaurus                                      | 27 ++++++++--
 conf/machine/collie.conf                           |  4 +-
 conf/machine/include/zaurus.inc                    |  2 +-
 .../linux/linux-yocto-3.10/collie/collie.scc       |  3 +-
 .../patches/patches-mtd/collie-PCR.patch           | 59 ++++++++++++++++++++++
 ...strataflash.patch => collie-no-buf-write.patch} | 26 ++++++----
 .../linux/linux-yocto-dev/collie/collie.scc        |  3 +-
 .../patches/patches-mtd/collie-PCR.patch           | 59 ++++++++++++++++++++++
 ...strataflash.patch => collie-no-buf-write.patch} | 26 ++++++----
 .../patches/patches-mtd/collie-PCR.patch           | 59 ++++++++++++++++++++++
 ...strataflash.patch => collie-no-buf-write.patch} | 26 ++++++----
 .../linux/linux-yocto-tiny-kexecboot_3.10.bbappend |  3 +-
 12 files changed, 254 insertions(+), 43 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-PCR.patch
 rename recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/{collie-fixup-strataflash.patch => collie-no-buf-write.patch} (51%)
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-PCR.patch
 rename recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/{collie-fixup-strataflash.patch => collie-no-buf-write.patch} (51%)
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-PCR.patch
 rename recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/{collie-fixup-strataflash.patch => collie-no-buf-write.patch} (51%)

