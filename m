Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OCYnl-0001Yp-Lr
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 15:50:14 +0200
Received: by pwj5 with SMTP id 5so639908pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=cYbuC4UCYgO4yBr2+SwvSRxlNDlwJUw5l8bY86F19Jw=;
	b=cZfHA5P/D4Bq525lNz42FrqC5bJ6OJgVSJCLWYZTOAVAbHLFSmhy5fal7usyvj3xXw
	yLd/Ab8LZXEjEv18Z2YXAuZfnfiETGIW5V0XC6hRylWlKMAklAtt6mTjT09aGCpLOi4z
	0pszVqn8SFcYeDsBIuTWa40eHMFlZFSSpWUQk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=r+lyPcICG7j3oxwwhuZWvPqNmwAYMGlLPHEZkumzVi9zG6mRmBeEPYjtj3WpgeAhw3
	Wjh5Hkrit19zGgECtdKakWnKyqYTG/71i0X0iDQldtUPwuAaL6BJbGTvNcuXaljSHSU1
	N6w212Ai9XQMnpklukBA+8olZFqt/rtHxTBzc=
Received: by 10.141.213.24 with SMTP id p24mr6171302rvq.291.1273758377494;
	Thu, 13 May 2010 06:46:17 -0700 (PDT)
Received: from localhost.localdomain ([201.153.77.51])
	by mx.google.com with ESMTPS id d14sm1098627rva.18.2010.05.13.06.46.15
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 May 2010 06:46:16 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 May 2010 08:46:37 -0500
Message-Id: <1273758399-23601-3-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1273758399-23601-2-git-send-email-aalonso00@gmail.com>
References: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-2-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5 v2] linux-xilinx-ml507: update kernel version
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
X-List-Received-Date: Thu, 13 May 2010 13:50:14 -0000

* Update kernel version 2.6.33
* Include xilinx framebuffer patch

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/linux/linux-xilinx-ml507_git.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/linux/linux-xilinx-ml507_git.bb b/recipes/linux/linux-xilinx-ml507_git.bb
index ec9de1c..fd3e33e 100644
--- a/recipes/linux/linux-xilinx-ml507_git.bb
+++ b/recipes/linux/linux-xilinx-ml507_git.bb
@@ -1,17 +1,18 @@
 require linux.inc
 
 DESCRIPTION = "Linux kernel for Xilinx ml507 platform"
-KERNEL_RELEASE = "2.6.32+git"
+KERNEL_RELEASE = "2.6.33+git"
 
 COMPATIBLE_MACHINE = "xilinx-ml507"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_xilinx-ml507 = "1"
 
 PV = "${KERNEL_RELEASE}"
-PR = "r0"
+PR = "r1"
 
-SRCREV = "dc53725d22405e384b984d222542f526eaa9b829"
+SRCREV = "17431547113100a3ae0a622b9f76ad17fb76eb56"
 SRC_URI = "git://git.xilinx.com/linux-2.6-xlnx.git;protocol=git \
+           file://xilinxfb.patch;patch=1 \
            file://defconfig"
 
 inherit kernel xilinx-bsp
-- 
1.6.6.1



