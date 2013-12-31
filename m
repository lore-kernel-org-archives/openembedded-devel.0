Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 63FB8611E8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 17:09:53 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c41so5562157eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8iAYmPoY5VvQsvdWLycD9BdAMAFPzueHsd/4CczLJgI=;
	b=pFH8YHY6eTKdRxh+9L7qQgfpO5gtzXu5/KtAf0u/wspkIfH7KGKQWdMtg7goG2Y3K4
	klytgqlvpnHj4FAvftQ5CuI9zuFUg0KIxDZs8K0VdvmcF4Da1bFpMf4hRCFE73TNFufi
	kvU8/a4dG8UI+jmsW1Nlxdu9Cc/LwTGbGGzWuSbND9Jz0d9ipC72N21Df++i52yKREj4
	QR5TxJHYKZcpWRtLVxm8KkxithruTe68AQPezqIcHKcwX6F0lZu/cx2rPQjuffnz4o1j
	jLq3Yvsq6p3Tb1k3ey3Y+cwGFGUl/50cNHDuIBsJnJOc7SqIHA1nCkwxCevQAaTsVHni
	E8Tg==
X-Received: by 10.15.43.10 with SMTP id w10mr61251089eev.13.1388509793543;
	Tue, 31 Dec 2013 09:09:53 -0800 (PST)
Received: from mizar.localdomain
	(host45-150-dynamic.9-87-r.retail.telecomitalia.it. [87.9.150.45])
	by mx.google.com with ESMTPSA id
	o47sm119806950eem.21.2013.12.31.09.09.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 09:09:52 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 18:09:48 +0100
Message-Id: <1388509788-22249-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld] pull request 20131231
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
X-List-Received-Date: Tue, 31 Dec 2013 17:09:55 -0000

The following changes since commit debdd39695a7f476d3be75a2e51535db4f94f7df:

  README.zaurus: add some more details for flashing (2013-12-15 17:33:30 +0100)

are available in the git repository at:

  https://github.com/andrea-adami/meta-handheld master

for you to fetch changes up to 969bf7ae90c221d2f6e7d9beef1deb5d00723248:

  linux-yocto*: collie: update Partition Configuration Register patch (2013-12-31 17:55:25 +0100)

----------------------------------------------------------------
Andrea Adami (5):
      linux-yocto*: zaurus: beat kernel size down to 2,5 MB
      linux-yocto*: collie: revert brute hack for CFI detection
      linux-yocto*: collie: apply workaround for CFI NOR misdetection
      linux-yocto*: collie: fixup for the CFI reading of nr of hw partitions
      linux-yocto*: collie: update Partition Configuration Register patch

 .../linux/linux-yocto-3.10/collie/collie.scc       |  3 +-
 .../patches/patches-mtd/collie-PCR.patch           | 90 ++++++++++++----------
 .../patches-mtd/collie-cfi-partitions.patch        | 48 ++++++++++++
 .../patches/patches-mtd/collie-force-cfi.patch     | 30 --------
 .../patches/patches-mtd/collie-match-cfi-qry.patch | 29 +++++++
 .../linux/linux-yocto-3.10/shrink_kernel.cfg       | 28 +++++++
 .../linux/linux-yocto-3.10/zaurus-common.scc       |  2 +
 .../linux/linux-yocto-dev/collie/collie.scc        |  3 +-
 .../patches/patches-mtd/collie-PCR.patch           | 90 ++++++++++++----------
 .../patches-mtd/collie-cfi-partitions.patch        | 48 ++++++++++++
 .../patches/patches-mtd/collie-force-cfi.patch     | 30 --------
 .../patches/patches-mtd/collie-match-cfi-qry.patch | 29 +++++++
 .../linux/linux-yocto-dev/shrink_kernel.cfg        | 28 +++++++
 .../linux/linux-yocto-dev/zaurus-common.scc        |  2 +
 .../patches/patches-mtd/collie-PCR.patch           | 90 ++++++++++++----------
 .../patches-mtd/collie-cfi-partitions.patch        | 48 ++++++++++++
 .../patches/patches-mtd/collie-force-cfi.patch     | 30 --------
 .../patches/patches-mtd/collie-match-cfi-qry.patch | 29 +++++++
 .../linux/linux-yocto-tiny-kexecboot_3.10.bbappend |  3 +-
 19 files changed, 450 insertions(+), 210 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-cfi-partitions.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-cfi.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/shrink_kernel.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-cfi-partitions.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-force-cfi.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/patches/patches-mtd/collie-match-cfi-qry.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/shrink_kernel.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-cfi-partitions.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-force-cfi.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.10/patches/patches-mtd/collie-match-cfi-qry.patch

-- 
1.8.1.5


