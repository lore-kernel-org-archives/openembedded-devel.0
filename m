Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1O6lqi-0002FW-OI
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 16:33:21 +0200
Received: by bwz20 with SMTP id 20so2940304bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=gLkCnmXfKGZ6NcKS8C/IjuBhYn8neAIKzUETYqgg6FQ=;
	b=MtQPzWc2KR2mGxMFw4nCCX4fISeqZhfcRc3C1awtbFodiY1sw1MgV8UkcA7+lo0JQK
	bNmSR8xp6rTDGdcNBaCoBXUn2lg9pHHQFgvLGEW64DuDWuRLCxk4aFBzlAKNB233kFSO
	8fFyShqUd2ODu1hOQnOVtbdzpFyV6tX9d9nAo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Rm8G2FhNIZvKMOO/HknKAIk3LHVmVDHGkA7rqBSSr91/6IVpiFFT8ZmBpeVbw22i5w
	PXSXGKnidcVfaRHXFmJ/O4/+Xi271kqC61ohqCZtGiS7q0Ofp5W8Y+pK22e1v3PKswsF
	fmFtBd0AXAMdGonvA7rfsqf1hc2LeBQSIbbUE=
Received: by 10.204.4.153 with SMTP id 25mr3815355bkr.77.1272378580430;
	Tue, 27 Apr 2010 07:29:40 -0700 (PDT)
Received: from localhost.localdomain ([201.153.217.127])
	by mx.google.com with ESMTPS id a11sm171739bkc.21.2010.04.27.07.29.38
	(version=SSLv3 cipher=RC4-MD5); Tue, 27 Apr 2010 07:29:40 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 09:29:12 -0500
Message-Id: <1272378556-21914-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/5] xilinx-ml507.conf: add screen options
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
X-List-Received-Date: Tue, 27 Apr 2010 14:33:21 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/xilinx-ml507.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/xilinx-ml507.conf b/conf/machine/xilinx-ml507.conf
index 693f904..8c888b2 100644
--- a/conf/machine/xilinx-ml507.conf
+++ b/conf/machine/xilinx-ml507.conf
@@ -15,7 +15,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-xilinx-ml507"
 
 KERNEL_IMAGETYPE = "uImage"
 
-MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet"
+MACHINE_FEATURES = "kernel26 apm ext2 vfat ethernet screen"
 MACHINE_EXTRA_RECOMMENDS = "kernel-modules"
 
 UBOOT_ARCH = "ppc"
@@ -30,7 +30,7 @@ PREFERRED_VERSION_u-boot_xilinx-ml507 = "git"
 # XILINX_BOARD = "ml507"
 
 # Don't use tty1
-USE_VT = "0"
+# USE_VT = "0"
 SERIAL_CONSOLE = "9600 ttyS0"
 
 # Device nodes add xsa for (system ace)
-- 
1.6.6.1



