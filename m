Return-Path: <andrea.adami@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id D494C60304
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:34:57 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id m19so2652846wev.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ms0g6S++/GDaSIlNHYdBFYbWGqfgaEy6duprKiSkBqA=;
	b=NHTc9y8xmT/bSm4m38qhy6tz9bvnZ/DNznDLU8hsmLA6kbzzRXmM+bKBt5w6C/zP08
	nD6aj1t1kEjwjZo3sSVT2gjVBEgsPPCp670itVo0kf8pAKhy2YEzRL4NE/kyEmRwD6kW
	G6q/4Ixl+63aMEIcqLLpUJ/s90zVjKnkWo+S7PTBBct9xYbNIsWywuz/yQWIq5xvUe83
	/Q8hNs+eJM8tJz8pFFoYPVMcXfPX7a+zxLeXXnwKi1nMeF9SjwNHZss9jVpSBCptg/ld
	cwa+AULSEVJLE3Obz1JnLXEyrkNZv9uK5f3TH6mrFsFY2q+fQrDfjHUqaOJzoHXQyVnO
	TJBQ==
X-Received: by 10.180.13.5 with SMTP id d5mr5834514wic.56.1371501298353;
	Mon, 17 Jun 2013 13:34:58 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.34.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:34:57 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:43 +0200
Message-Id: <cover.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH 0/9] add missing SUMMARY and DESCRIPTION
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
X-List-Received-Date: Mon, 17 Jun 2013 20:34:58 -0000

Andrea Adami (9):
  initramfs-kexecboot(-klibc)-image: provide SUMMARY and DESCRIPTION
  kexecboot_cfg: add SUMMARY and extend DESCRIPTION
  kexecboot(-klibc): add SUMMARY, DESCRIPTION, HOMEPAGE
  ubi-utils-klibc: add SUMMARY and DESCRIPTION
  kexec-tools-klibc: add custom SUMMARY
  linux-yocto-tiny-kexecboot: add custom SUMMARY
  klibc(-static)-utils: add SUMMARY
  klcc-cross: add SUMMARY
  klibc: add SUMMARY

 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb | 10 ++++------
 .../recipes-bsp/images/initramfs-kexecboot-klibc-image.bb      |  6 +++++-
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb      |  4 +++-
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb    |  1 +
 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc             |  3 +++
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.2.bb      |  1 +
 .../recipes-devtools/klibc/klibc-static-utils_2.0.2.bb         |  1 +
 meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.2.bb     |  1 +
 meta-initramfs/recipes-devtools/klibc/klibc_2.0.2.bb           |  1 +
 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.0.bb   |  3 ++-
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb |  1 +
 .../recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb     |  1 +
 12 files changed, 24 insertions(+), 9 deletions(-)

-- 
1.8.1.5


