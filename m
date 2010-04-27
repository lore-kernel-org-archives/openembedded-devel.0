Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1O6lqn-0002FW-0b
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 16:33:26 +0200
Received: by mail-bw0-f220.google.com with SMTP id 20so2940304bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ZBsiNMJ1+yNabu/0SiVn9jOJmT8nSMr3iV377YzHEBI=;
	b=wAdyZ8nFPTHtYvkk6t4Kwg9YUrunEbaX1ryhjS2JXdxRiBOXZozBJqlpj4m9w4C0RM
	fHivL//QIcNbxorQJ1LQaLWPtDhvFXDTWcjgrWdKzFYUxb9dxIPUZWIu25OKjaWGHmxL
	BUjT+sf6CHlb/6wzmcfZUlWdmIHRFG7t00r+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=i+sxd17WGTWM+6es9BQnKOdLbOXEC9cI/0cip41n+iY8cEZnR97e89PeLpE+T8QFWT
	JibbKmRyNTxnhrNZnEyDOgO6TCV8OXrVbEiRYs487v2wIZ2yRBKC+Q95+hPaEbl55y0r
	0aTbwsoT71rYXf9O9Kwg4DK21RDRyhJuhgNdE=
Received: by 10.204.15.134 with SMTP id k6mr3754860bka.96.1272378587124;
	Tue, 27 Apr 2010 07:29:47 -0700 (PDT)
Received: from localhost.localdomain ([201.153.217.127])
	by mx.google.com with ESMTPS id a11sm171739bkc.21.2010.04.27.07.29.45
	(version=SSLv3 cipher=RC4-MD5); Tue, 27 Apr 2010 07:29:46 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 09:29:14 -0500
Message-Id: <1272378556-21914-3-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1272378556-21914-2-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1272378556-21914-1-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-2-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] linux-xilinx-ml507_git.bb: update kernel version 2.6.33
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
X-List-Received-Date: Tue, 27 Apr 2010 14:33:26 -0000

* add patch for frame buffer display module support

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/linux/linux-xilinx-ml507_git.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/linux/linux-xilinx-ml507_git.bb b/recipes/linux/linux-xilinx-ml507_git.bb
index ec9de1c..ed69688 100644
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
+           file://xilinxfb.c-update-tft-comp.patch;patch=1 \
            file://defconfig"
 
 inherit kernel xilinx-bsp
-- 
1.6.6.1



