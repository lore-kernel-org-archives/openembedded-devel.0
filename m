Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1O6lqp-0002FW-2R
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 16:33:28 +0200
Received: by mail-bw0-f220.google.com with SMTP id 20so2940304bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ofORDosjmt7kKznJNtavP847XG7jU7857sogOyd2aoM=;
	b=SR1iMxxXzsUOWI515x7zv8i7M/TKAnL8UKHdZ8qsfqFpb3svyxuj+BOY/yDhPdZOC9
	ULKXD+OsWkhYStwk3anDlMNi/GPtTxvRyHBqzfvTgJKN67ajvwPPbK+9z3ALLZ91nDWv
	7sU2WUx4iHO7qSgzAwv15eavym7Qr0jP0caus=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Lot1F2RDACwnv5akruK7SbEfqjeOGVJxWLO9HxRL+WVaDafIpkM7i1Mkg7+XoMKBzd
	Enx/w0zTAROoIWCr2o/3CBGLU4yyIbq+VEGHKaTR3+Uq6W5NDguBIivGz0Wp8wuMpckr
	Nkqz49cBs3fkgC9a71ymprPaCuLoOsVj/52u4=
Received: by 10.204.7.194 with SMTP id e2mr3682257bke.103.1272378589237;
	Tue, 27 Apr 2010 07:29:49 -0700 (PDT)
Received: from localhost.localdomain ([201.153.217.127])
	by mx.google.com with ESMTPS id a11sm171739bkc.21.2010.04.27.07.29.47
	(version=SSLv3 cipher=RC4-MD5); Tue, 27 Apr 2010 07:29:48 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 09:29:15 -0500
Message-Id: <1272378556-21914-4-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1272378556-21914-3-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1272378556-21914-1-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-2-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-3-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/5] xilinxfb.c-update-tft-comp.patch: new file
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
X-List-Received-Date: Tue, 27 Apr 2010 14:33:28 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 .../xilinxfb.c-update-tft-comp.patch               |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-xilinx-ml507/xilinxfb.c-update-tft-comp.patch

diff --git a/recipes/linux/linux-xilinx-ml507/xilinxfb.c-update-tft-comp.patch b/recipes/linux/linux-xilinx-ml507/xilinxfb.c-update-tft-comp.patch
new file mode 100644
index 0000000..ec33361
--- /dev/null
+++ b/recipes/linux/linux-xilinx-ml507/xilinxfb.c-update-tft-comp.patch
@@ -0,0 +1,26 @@
+From 54dc9b9e9cced3204b9d9a8a27319d9de662af3b Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <aalonso00@gmail.com>
+Date: Wed, 31 Mar 2010 22:14:55 -0600
+Subject: [PATCH] xilinxfb.c: add tft compatibility versions
+
+Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
+---
+ drivers/video/xilinxfb.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/video/xilinxfb.c b/drivers/video/xilinxfb.c
+index ed7c8d0..829efaa 100644
+--- a/drivers/video/xilinxfb.c
++++ b/drivers/video/xilinxfb.c
+@@ -484,6 +484,8 @@ static int __devexit xilinxfb_of_remove(struct of_device *op)
+ /* Match table for of_platform binding */
+ static struct of_device_id xilinxfb_of_match[] __devinitdata = {
+ 	{ .compatible = "xlnx,xps-tft-1.00.a", },
++	{ .compatible = "xlnx,xps-tft-2.00.a", },
++	{ .compatible = "xlnx,xps-tft-2.01.a", },
+ 	{ .compatible = "xlnx,plb-tft-cntlr-ref-1.00.a", },
+ 	{ .compatible = "xlnx,plb-dvi-cntlr-ref-1.00.c", },
+ 	{},
+-- 
+1.6.6.1
+
-- 
1.6.6.1



