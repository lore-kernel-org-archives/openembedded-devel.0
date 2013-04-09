Received: from mail-gg0-f177.google.com ([209.85.161.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPeKC-00086y-0F
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 21:35:24 +0200
Received: by mail-gg0-f177.google.com with SMTP id q1so1126347gge.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 12:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ssiYMs9gwXNC2sd2GMvQ3hxSa0XouH9vTAVu87NzQ5g=;
	b=hIdLruIBDlNoSKWtRYNoB/HCkejQTgUBQDMDP8OCXyM8ZhfspQSJbFktYld91ahw8J
	SeOS+cXJWHgFW08FCdBE7l3glpy5kXk/UpDlJWm2firVVZFU/TK5SGoHLdg3bPW3BvZ8
	sVS9Sb63XQFD7gqW3RlCSvjAtPpguSanMnQTkpYvxMngstV5RvhmGuk7gSDVgdsvgMD5
	ocTblE2ctLbWYNfmKwb/67tYUK8KHKpBdRO8pu+NaGRLEVi0GpnhZJL1c9sbJfacnqb2
	32vzHVqf5Kn8uB7QDCjhwtA/TQolkedSLCUB2CFbvyB8ff0SIP0NQyKbxIDTOtsYaTJw
	aqCw==
X-Received: by 10.236.78.234 with SMTP id g70mr16145626yhe.84.1365535083020;
	Tue, 09 Apr 2013 12:18:03 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id t9sm45013110yhh.0.2013.04.09.12.18.01
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 12:18:02 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue,  9 Apr 2013 16:17:37 -0300
Message-Id: <1365535059-27254-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1365535059-27254-1-git-send-email-otavio@ossystems.com.br>
References: <1365535059-27254-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-fsl-arm][PATCH v2 2/4] mxs-base.inc: Add U-Boot common definitions
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
X-List-Received-Date: Tue, 09 Apr 2013 19:35:25 -0000

This removes the U-Boot common definitions from imx28evk board as they
are shared with all 'mxs' SoCs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Change-Id: I44d33aa54971534c07a240e6cf88c0c4b3051f25
---
 conf/machine/imx28evk.conf        | 5 -----
 conf/machine/include/mxs-base.inc | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/imx28evk.conf b/conf/machine/imx28evk.conf
index d981358..fb9fdcf 100644
--- a/conf/machine/imx28evk.conf
+++ b/conf/machine/imx28evk.conf
@@ -7,12 +7,7 @@ include conf/machine/include/mxs-base.inc
 SOC_FAMILY = "mx28:mxs"
 
 IMXBOOTLETS_MACHINE = "iMX28_EVK"
-
-UBOOT_ENTRYPOINT = "0x41008000"
-UBOOT_LOADADDRESS = "0x41008000"
 UBOOT_MACHINE = "mx28evk_config"
-UBOOT_MAKE_TARGET = "u-boot.sb"
-UBOOT_SUFFIX = "sb"
 
 KERNEL_IMAGETYPE = "uImage"
 KERNEL_DEVICETREE = "${S}/arch/arm/boot/dts/imx28-evk.dts"
diff --git a/conf/machine/include/mxs-base.inc b/conf/machine/include/mxs-base.inc
index 74f839b..6dc1302 100644
--- a/conf/machine/include/mxs-base.inc
+++ b/conf/machine/include/mxs-base.inc
@@ -9,6 +9,11 @@ include conf/machine/include/tune-arm926ejs.inc
 
 SOC_FAMILY = "mxs"
 
+UBOOT_ENTRYPOINT = "0x41008000"
+UBOOT_LOADADDRESS = "0x41008000"
+UBOOT_MAKE_TARGET = "u-boot.sb"
+UBOOT_SUFFIX = "sb"
+
 # Disable perf features as 2.6.35.3 fail to build otherwise
 PERF_FEATURES_ENABLE = ""
 
-- 
1.8.1



