Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OCYnn-0001am-5L
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 15:50:15 +0200
Received: by pwj5 with SMTP id 5so639931pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=KPw0OZhfqH48GpkzhbxmL6q47gpQoruGvcrQCOWuv3c=;
	b=Met+pZJI2vIKB9KgzB9oJJ14/SZEDhVUC3X6taR5YQ1Vby2HyeRfyO92rgBgsj4V2r
	CH20fMisDcKoRCoosVKVkoHjDwgXc4Xyb686q7AgIZjbfKCeZGAN2Mb9ZZ6qcPM5s2wx
	xTNAemT8mkE4HAGx6RZXnj8H4SKXaRXZaDkKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uQvwdbKPddVrLvn3KPJRpE4PogxgbvAsefFMQfFkFOP6Q8zMNRk86BtE+Gq0uwdzMr
	sB2zPylBNl3PdPVZ8o2fo22KKPOfQSzo9qn5IPmByqFnpHsmQYQ0K4hLWNYqsXvp+Bqu
	ZEg1wM53xRCHVB0JFvBV6EyTQPY8vdTWdJ1CY=
Received: by 10.141.105.17 with SMTP id h17mr6152789rvm.293.1273758379299;
	Thu, 13 May 2010 06:46:19 -0700 (PDT)
Received: from localhost.localdomain ([201.153.77.51])
	by mx.google.com with ESMTPS id d14sm1098627rva.18.2010.05.13.06.46.17
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 May 2010 06:46:18 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 May 2010 08:46:38 -0500
Message-Id: <1273758399-23601-4-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1273758399-23601-3-git-send-email-aalonso00@gmail.com>
References: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-2-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-3-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/5 v2] xilinxfb: new patch
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
X-List-Received-Date: Thu, 13 May 2010 13:50:16 -0000

* Update hardware TFT video compatibility modules

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/linux/linux-xilinx-ml507/xilinxfb.patch |   26 +++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-xilinx-ml507/xilinxfb.patch

diff --git a/recipes/linux/linux-xilinx-ml507/xilinxfb.patch b/recipes/linux/linux-xilinx-ml507/xilinxfb.patch
new file mode 100644
index 0000000..ec33361
--- /dev/null
+++ b/recipes/linux/linux-xilinx-ml507/xilinxfb.patch
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



