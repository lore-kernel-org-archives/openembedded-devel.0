Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UHN5n-0000zv-N6
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 00:34:22 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so2320535eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2013 16:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Z0/uZ9UuX9/kSY1IxykXtvPEfBR0O7EVGHXz/kty/Qc=;
	b=UN+NJYR6A23/yoCyhFrmkvj70qrpf1+lp239e8iA9Guwe6YYGfSnUSIUu6E5eYUVob
	8VrDSx/E/F5TfvmLVH7Ap2rQljQBcMqrp8PybCu/mOnGPSHu0fA846aNAeBIDN8rb48h
	Ha3MddhIRipRuuOFPOyN5xUdsAJ4hiAJv5VVNgkZ4uAVJzo4GZbzFP/T0UhFD0pZb+Is
	Zo05spjgrkkk3UEUMcuzgufNO+su6D3884FJkTXhzFMj8vgZUilSvqLlc2Q69O1x/64a
	xeOCXpPTsvijb/SZ8CnpuofOB3cvcT0nqUXmL9X2Qc16/ro68NKLn38dsURin6Y8hktQ
	51ZA==
X-Received: by 10.14.1.130 with SMTP id 2mr42880105eed.15.1363562252851;
	Sun, 17 Mar 2013 16:17:32 -0700 (PDT)
Received: from mizar.localdomain
	(host195-251-dynamic.8-87-r.retail.telecomitalia.it. [87.8.251.195])
	by mx.google.com with ESMTPS id z45sm23918077eeu.10.2013.03.17.16.17.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 16:17:32 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Mar 2013 00:17:14 +0100
Message-Id: <d1c667510df743da86635637dbba3845fa07d8bd.1363561878.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1363561878.git.andrea.adami@gmail.com>
References: <cover.1363561878.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1363561878.git.andrea.adami@gmail.com>
References: <cover.1363561878.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 1/5] linux-yocto-tiny-kexecboot: add patch fixing mtd on SL-C3200
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
X-List-Received-Date: Sun, 17 Mar 2013 23:34:24 -0000

* the patch must be listed in SRC_URI when compiling for 'terrier'
* because kernel only knows about spitz and borzoi

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux-yocto-tiny-kexecboot-3.2/spitz/3200-mtd.patch     | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/3200-mtd.patch

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/3200-mtd.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/3200-mtd.patch
new file mode 100644
index 0000000..4b2a968
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/3200-mtd.patch
@@ -0,0 +1,13 @@
+diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
+index 953a919..14e7736 100644
+--- a/arch/arm/mach-pxa/spitz.c
++++ b/arch/arm/mach-pxa/spitz.c
+@@ -802,7 +802,7 @@ static void __init spitz_nand_init(void)
+ 		spitz_nand_bbt.len = 1;
+ 		spitz_nand_pdata.ecc_layout = &akita_oobinfo;
+ 	} else if (machine_is_borzoi()) {
+-		spitz_nand_partitions[1].size = 32 * 1024 * 1024;
++		spitz_nand_partitions[1].size = 43 * 1024 * 1024;
+ 		spitz_nand_bbt.len = 1;
+ 		spitz_nand_pdata.ecc_layout = &akita_oobinfo;
+ 	}
-- 
1.7.12.4



