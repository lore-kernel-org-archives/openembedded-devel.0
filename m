Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 65B566D68A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 01:02:47 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id z10so614260ead.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 17:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=YRvywqYb4icWFZt8guv9NCoLrulaXoQNUAMwFSPqIKk=;
	b=WHkSnRiLESpqHz22u+FrzImHkeg0dS/r0sEuTsjv3cIY3HAN+CYBuLA8o5ESm/zGVx
	NIE2g8FTprmID0EyYcnPNNXYdo48pcZGBv/3ogmLOGQaQ+DTPhXYcW/bOhX5pRKL3GLS
	NKNC9C0dWFIfkNEj/DcF6wBrgKSfnoSoFbDVHHR+3CggB9OCYsLu+nHzmtrSYx/xfpp1
	s6jmcUwW023QtNuQS5ftNTU0BHSXsAOG42fnVWt7yK0eE1zBzQzIn4kCnqxZBQ9e1dGc
	9gYLin2G3kK8abX6Mzz2ihlcBBIAcQfz1wnW80319T5xFe89dYF5dhYuVqeJK/hATjdh
	ZNoQ==
X-Received: by 10.15.32.198 with SMTP id a46mr12630295eev.31.1383872568973;
	Thu, 07 Nov 2013 17:02:48 -0800 (PST)
Received: from mizar.localdomain
	(host33-1-dynamic.51-79-r.retail.telecomitalia.it. [79.51.1.33])
	by mx.google.com with ESMTPSA id
	v45sm15949739eef.11.2013.11.07.17.02.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 17:02:48 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Nov 2013 02:02:29 +0100
Message-Id: <756c92e13e3abeae5e31849dca24da7d45794a24.1383870605.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/6] linux-yocto: collie: set MTD geometry
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
X-List-Received-Date: Fri, 08 Nov 2013 01:02:47 -0000

Explicitly disable unwanted mtd geometry options
Add OTP support (warning!)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
index c334774..5238c69 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.cfg
@@ -53,16 +53,28 @@ CONFIG_CMDLINE="console=ttySA0,115200n8 console=tty1 mem=64M fbcon=rotate:1 logl
 # RAM/ROM/Flash chip drivers
 #
 CONFIG_MTD_CFI=y
-CONFIG_MTD_JEDECPROBE=y
+# CONFIG_MTD_JEDECPROBE is not set
 CONFIG_MTD_GEN_PROBE=y
 CONFIG_MTD_CFI_ADV_OPTIONS=y
 CONFIG_MTD_CFI_NOSWAP=y
 CONFIG_MTD_CFI_GEOMETRY=y
+
+# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
 CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+
+# CONFIG_MTD_CFI_I1 is not set
 CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_UTIL=y
 
+CONFIG_MTD_OTP=y
+
 #
 # Mapping drivers for chip access
 #
-- 
1.8.1.5


