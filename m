Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id AF59C6A463
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 23:47:50 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id l10so1758198eei.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bp40yZpB3KJ8KLcbV0W4egEBLg3Fel7XEubpyKWxQxM=;
	b=KWAKby3ROyQ0o6WruczH2I3XQlx7HBcaptI7stM7dYT0p0vtwzj/kv0PG5DbpnXssp
	9m+mP8oAaMg3+WnXxKVJp8qahEe0DPWxKQ27RWC5tLLpLuliPGMEmNiP2fOI4g7L00dR
	d5JCO5EjklGDE/AzCjrrUmBMZLPCpdmTtSaNG+J3lNuCoi8UfWJHifEoCdV1HATo+k7S
	lXMxPwchsTFcfP2n8MAi2uxijUpTNwg1LCUv9wVUeaUGSpU0p54DZkpYWz19jvK1Nkh9
	rnJkKQ6LCoql1aiNGNihybdhH4FHpYFAvjXdSPFceecy7iAt2cyIetbrVO+B9LIunk3k
	yMdg==
X-Received: by 10.14.241.74 with SMTP id f50mr45461621eer.29.1384300072171;
	Tue, 12 Nov 2013 15:47:52 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.41])
	by mx.google.com with ESMTPSA id i1sm81396914eeg.0.2013.11.12.15.47.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2013 15:47:51 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2013 00:47:43 +0100
Message-Id: <1384300064-21694-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1384300064-21694-1-git-send-email-andrea.adami@gmail.com>
References: <1384300064-21694-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] machine: h1940: switch temporarly to linux-yocto-dev (3.12-rc5)
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
X-List-Received-Date: Tue, 12 Nov 2013 23:47:51 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/h1940.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/h1940.conf b/conf/machine/h1940.conf
index cd7e9d2..5945363 100644
--- a/conf/machine/h1940.conf
+++ b/conf/machine/h1940.conf
@@ -9,7 +9,7 @@
 require conf/machine/include/tune-arm920t.inc
 
 # Set preferred providers
-PREFERRED_PROVIDER_virtual/kernel = "linux"
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
 
 KERNEL_IMAGETYPE = "uImage"
 UBOOT_LOADADDRESS = "0x30108000"
-- 
1.8.1.5


