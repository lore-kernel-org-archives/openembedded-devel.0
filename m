Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1Oerhx-0001Hq-84
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:41:17 +0200
Received: by wwb34 with SMTP id 34so23302wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=jTehgDT3MsfuzPoe3cprySUtRXSBE8L4W13tIDP8+JM=;
	b=hGgoz7soMAqvBl5bnCdk1v+wA7JDv/05dBqOp92Q2tnOCMiuUNw7Rkkwhk5bnfAXwx
	j/HuaXVCF7CvJ5y/6XVYiBu4lIF7K26uVZZOMft+mgVcLy5ZFALpoUlVpZvEvxP8hK2Q
	6bhtY4T2AHAQQrsVbW2V+a7mO0u8nvM2WuKWo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lANKhEnSDkR710kzIGUw+hDFn/CAQonp049h6PBTAAG0MUnf9EJDqrejcvNLkwQzl1
	VeedbxNHBhmrQDge8UCGSPy0M+lCMfWrNyXeI67RTOgURiUjomQXqq65hyCZEjJmTI0Y
	TDb6pcF+QouBKUU6Hhkd6g7eH7rwTpKQiahWg=
Received: by 10.227.138.6 with SMTP id y6mr1830010wbt.162.1280504452216;
	Fri, 30 Jul 2010 08:40:52 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.218.190])
	by mx.google.com with ESMTPS id h3sm2015014wbb.15.2010.07.30.08.40.49
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jul 2010 08:40:51 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 10:42:31 -0500
Message-Id: <1280504555-3633-6-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/10] u-boot-xilinx: new file
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
X-List-Received-Date: Fri, 30 Jul 2010 15:41:18 -0000

* u-boot for xilinx platforms
* Inherits xilinx-bsp.bbclass for passing xparameters
  header file from hardware reference design project
  to match hardware/software model

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



