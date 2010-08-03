Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKFE-0007sx-E3
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:21:45 +0200
Received: by mail-fx0-f47.google.com with SMTP id 12so2157248fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1fJBzvqjJN3pZ2Jopo9xRLijIfzVqCEDmoYnwgJVWjQ=;
	b=Ht0VWR9ATi2tbsYgyn9XxygLx/ff6yJbHS6nRcdkp9WvenHPJ2YJxl0jDbfynsoeMm
	l7BXHx/Enu5m/bSTTKfyAXTvwH0QNscz/vFDHAycZ5fkEPuESPfkY1zyChYuuZRcADxg
	oUSPQ2+Apue0u3bmHmFezyd8n6ukZTEbUQxe0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rJp/M3b1J4K4++mbnykkhIUKLka4uCgQvSyJFpEtXVvSQK36woNVn0QYE/+SB703o3
	8PWwjQyZWftNjusWA7NOd77X3bSWHihtqfSb1Yb0vgfMuVsGSGQbbBl3Rwa6QnyTsx2F
	u7df6P9P/HzrV5J5ueRKCFC5LC365WOakLdMA=
Received: by 10.223.116.197 with SMTP id n5mr7595418faq.53.1280852495494;
	Tue, 03 Aug 2010 09:21:35 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.32
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:34 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:18 -0500
Message-Id: <1280852605-3524-4-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
References: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 04/11][v2] u-boot-xilinx: uboot for xilinx virtex4 virtex5 targets
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
X-List-Received-Date: Tue, 03 Aug 2010 16:21:46 -0000

* u-boot for xilinx platforms virtex4, virtex5 based
* Inherits xilinx-bsp.bbclass for passing xparameters
  header file from hardware reference design project
  to match hardware/software model
* v2 reorder patch set

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/u-boot/u-boot-xilinx_git.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-xilinx_git.bb

diff --git a/recipes/u-boot/u-boot-xilinx_git.bb b/recipes/u-boot/u-boot-xilinx_git.bb
new file mode 100644
index 0000000..57677fb
--- /dev/null
+++ b/recipes/u-boot/u-boot-xilinx_git.bb
@@ -0,0 +1,17 @@
+require u-boot.inc
+PR = "r0"
+
+# Prefered u-boot from mainstream since has generic support for
+# ppc405, ppc440 and microblaze
+# SRC_URI = "git://git.denx.de/u-boot.git;protocol=git"
+# SRCREV = "8bd9dbdfa3a19f322810e2ad9e6d6551602d8afe"
+SRC_URI = "git://git.xilinx.com/u-boot-xlnx.git;protocol=git"
+SRCREV = "26e999650cf77c16f33c580abaadab2532f5e8b2"
+
+inherit xilinx-bsp
+
+TARGET_BOARD = "${@map_target(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+UBOOT_TARGET = "${@uboot_target(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+export UBOOT_MACHINE = "${@uboot_machine(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+
+S = "${WORKDIR}/git"
-- 
1.7.2



