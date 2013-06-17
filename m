Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D5EF3608BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:34:59 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id e11so2751157wgh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fLctsudLp5qwe+gQs7Lb+26Yyiipe2Cq1wFIb6riGLA=;
	b=qwLqk8nTgjIf/JQQ8hPtyYbfSOlaFU2ckMIkjjvpqDkQq/UtX4ns0n2L81STIoUZaF
	xW3UD67DFfCqlsx8fMAVgnsNfEdepBOo2Vefcr5OgF+NYjZXMyS/OBtNopxN+U9zjnkW
	+WZphF5dtkRXxkkqItzNX48+/wQwNii7ovmHatS02FtlPi8cf8796W/aKICLm1gUy2tG
	LGIaDOz0eADFKmQ0loXtfzkd0kyjX1LPJiFvaoK/Quttq8qiI5X5qquOzoV/9DajbERI
	maRANget/duDLWa44XS31zOdP3v81nBTLeKXqJK4NwGMQ+wcaIdlnF50b9HXiPhk40El
	zNoQ==
X-Received: by 10.194.179.33 with SMTP id dd1mr8865321wjc.51.1371501300556;
	Mon, 17 Jun 2013 13:35:00 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.34.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:35:00 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:45 +0200
Message-Id: <f57b756430598a8435ec804362f15431a9490303.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/9] kexecboot_cfg: add SUMMARY and extend DESCRIPTION
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
X-List-Received-Date: Mon, 17 Jun 2013 20:35:00 -0000

 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
index 0b305f0..619a143 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
@@ -1,4 +1,5 @@
-DESCRIPTION = "Configuration file for kexecboot"
+SUMMARY = "Configuration files for kexecboot"
+DESCRIPTION = "Default icon and boot.cfg for kexecboot linux-as-bootloader."
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
@@ -23,6 +24,7 @@ do_install_prepend () {
 echo '# First kernel stanza.
 # Show this label in kexecboot menu.
 LABEL=${KEXECBOOT_LABEL}
+#
 # Specify full kernel path on target.
 KERNEL=/boot/${KERNEL_IMAGETYPE}
 #
-- 
1.8.1.5


