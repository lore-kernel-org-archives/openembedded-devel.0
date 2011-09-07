Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R1Ine-0004rJ-SH
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 16:08:22 +0200
Received: by mail-ey0-f173.google.com with SMTP id 7so5250943eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=FUYF5B8OzFfuave4KgiFLFRgs4QXOaIwo1eMZWduVSA=;
	b=puTA7xcFMfHuZY3p85n8CBJZ9LnSkdrO9aJjEHOYi3BXOgJFlaSHaiIQfpz6/VBdws
	0zM5hsP5jSFphPigb6K91wX8DBogagRpO2XKZ9EYfih1k2zfLks8SSXzhLYsI3MW9j3R
	h0/r2C6J7d6mOHo046aUXuSXk8lX+kZML0Aik=
Received: by 10.204.135.21 with SMTP id l21mr3695285bkt.106.1315404202689;
	Wed, 07 Sep 2011 07:03:22 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l11sm440069bkb.1.2011.09.07.07.03.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 07:03:21 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 18:03:00 +0400
Message-Id: <1315404187-18176-6-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
References: <1315404187-18176-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-handheld 05/12] linux.inc: drop devicetree settings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2011 14:08:22 -0000

Device tree names should go to machine conf files, not to kernel recipe
or linux.inc. Also for now they are unused, as none of this machines
is supported by meta-hh/linux.inc. Drop them accordingly.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-kernel/linux/linux.inc |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/recipes-kernel/linux/linux.inc b/recipes-kernel/linux/linux.inc
index eba11fa..ad4510b 100644
--- a/recipes-kernel/linux/linux.inc
+++ b/recipes-kernel/linux/linux.inc
@@ -27,25 +27,6 @@ LOGO_SIZE ?= "."
 
 FILES_kernel-devicetree = "/boot/devicetree*"
 
-KERNEL_DEVICETREE_boc01 = "${WORKDIR}/boc01.dts"
-KERNEL_DEVICETREE_calamari = "arch/${ARCH}/boot/dts/mpc8536ds.dts"
-KERNEL_DEVICETREE_canyonlands = "arch/${ARCH}/boot/dts/canyonlands.dts"
-KERNEL_DEVICETREE_kilauea = "arch/${ARCH}/boot/dts/kilauea.dts"
-KERNEL_DEVICETREE_lite5200 = "arch/${ARCH}/boot/dts/lite5200.dts"
-KERNEL_DEVICETREE_lsppchd = "arch/${ARCH}/boot/dts/kuroboxHD.dts"
-KERNEL_DEVICETREE_lsppchg = "arch/${ARCH}/boot/dts/kuroboxHG.dts"
-KERNEL_DEVICETREE_mpc8313e-rdb = "arch/${ARCH}/boot/dts/mpc8313erdb.dts"
-KERNEL_DEVICETREE_mpc8315e-rdb = "arch/${ARCH}/boot/dts/mpc8315erdb.dts"
-KERNEL_DEVICETREE_mpc8323e-rdb = "arch/${ARCH}/boot/dts/mpc832x_rdb.dts"
-KERNEL_DEVICETREE_mpc8544ds = "arch/${ARCH}/boot/dts/mpc8544ds.dts"
-KERNEL_DEVICETREE_mpc8641-hpcn = "arch/${ARCH}/boot/dts/mpc8641_hpcn.dts"
-KERNEL_DEVICETREE_p1020rdb = "arch/${ARCH}/boot/dts/p1020rdb.dts"
-KERNEL_DEVICETREE_p2020rdb = "arch/${ARCH}/boot/dts/p2020rdb.dts"
-KERNEL_DEVICETREE_p2020ds = "arch/${ARCH}/boot/dts/p2020ds.dts"
-KERNEL_DEVICETREE_sequoia = "arch/${ARCH}/boot/dts/sequoia.dts"
-KERNEL_DEVICETREE_tqm8540 = "arch/${ARCH}/boot/dts/tqm8540.dts"
-KERNEL_DEVICETREE_xilinx-ml507 = "arch/${ARCH}/boot/dts/virtex440-ml507.dts"
-
 KERNEL_DEVICETREE_FLAGS = "-R 8 -S 0x3000"
 
 CORTEXA8FIXUP ?= "yes"
-- 
1.7.2.5



