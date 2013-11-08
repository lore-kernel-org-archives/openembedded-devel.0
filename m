Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id D97E06D68A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 01:02:37 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so729878eaj.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 17:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8aYmyX8K4R1TdEDw8lALZSvuXxSTx38U8QybdpRJzow=;
	b=yyvDrBAVEvFp7lGrkVSXVC0zWCA/jQ5UWvG2BjObXgH3I6PajIaHSSHNtZmxhkRRE5
	WHLzfGdJrtXGmdllXwYcwGEX9x89ZTVnjldGFn9KvyIFPJngK17dW+DryMrjeFFjl0Cf
	B+1MNnyd4S023r1aHRMXlSE4fDA1IxIyJXCKufpsw8+7nbE+nJ94erWeujZqWhMpXMOv
	g7DBLXefD6uTWwa/VZNtsoLouTkJESgEFw/u32pLseBcYcWoru6nY+WvLJf2S/UpW8OV
	aLFEsL++1k0u7v64GoiwUXk1mgkkYE+pMeZddfhfqnuFQsUkwulzJx2ayLRtkFNot2oX
	PCWw==
X-Received: by 10.15.48.135 with SMTP id h7mr5199eew.78.1383872558813;
	Thu, 07 Nov 2013 17:02:38 -0800 (PST)
Received: from mizar.localdomain
	(host33-1-dynamic.51-79-r.retail.telecomitalia.it. [79.51.1.33])
	by mx.google.com with ESMTPSA id
	v45sm15949739eef.11.2013.11.07.17.02.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 17:02:38 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Nov 2013 02:02:27 +0100
Message-Id: <cover.1383870605.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH 0/6] fixes for Zaurus collie
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
X-List-Received-Date: Fri, 08 Nov 2013 01:02:38 -0000

This set of patches fixes the CFI MTD detection so that the
NOR flash is unlocked on boot.
Still investigating about the cause of the misdetection...

Flash was Read Only with jedec detection, now booting from flash
is possible again.

Andrea Adami (6):
  linux-yocto: remove POWER_SUPPLY_DEBUG as default
  linux-yocto: collie: set MTD geometry
  linux-yocto: collie: revert jedec_probe patch
  linux-yocto: collie: force CFI detection (temporary HACK)
  linux-yocto: collie: resize MTD to SZ_16M
  linux-yocto: collie: force flash unlock on boot

 .../linux/linux-yocto-3.10/collie/collie.cfg       | 14 +++++++-
 .../linux/linux-yocto-3.10/collie/collie.scc       |  5 ++-
 .../patches/patches-mtd/collie-force-cfi.patch     | 30 ++++++++++++++++
 .../patches/patches-mtd/collie-force-unlock.patch  | 22 ++++++++++++
 .../patches/patches-mtd/collie-mtd-resize.patch    | 41 ++++++++++++++++++++++
 .../linux/linux-yocto-3.10/zaurus-hardware.cfg     |  1 -
 6 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-cfi.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-force-unlock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-mtd-resize.patch

-- 
1.8.1.5


