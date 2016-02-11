Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC4A731D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 23:01:30 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p63so13212728wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wVKNIpLYYPX672LdwQ1ZdKKXMrngSl4iXkA6zVyIn9Y=;
	b=uBUGFdjs2Y+LS09AsEmsPJ9sYBh5zP/Rh1/zJcBZntZV14Z2vY+7QMO4RRO2n2PqLy
	8DRLKEnbfhHjlXat9ckDeiIWchbdZuxBj3YhiNZ+BUgJP4eH3ns8U/BFyVlfraf75q7W
	sg3j3eshQo9xvkCZg/0TfbcYRGGiQcA/GuWxXJXFykMlqxvAcLnoBwPxSTl1McMxty2+
	AUlW12s+pC50aZKdEXURFUDl00iPBvAqoeLv+zhMIi0gqXF0rV5nG20oxqLab3KwS8KO
	QpzLcQMm3AvyiNx9WWMxOQX4xkQ34X4cNS8SkV2ehUtUSQrMD6EdOlQ69coXD7En14gu
	GqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=wVKNIpLYYPX672LdwQ1ZdKKXMrngSl4iXkA6zVyIn9Y=;
	b=jink+4kwIsNc3Z5PWrqQ0GhqqIaI2YX6VMHBEvmSJPRSGDOy7Nha+hI9XyzpSCFHHd
	r1rJyG7oajAdUJBOZtmScCFITWAKdCJBkQJE190N/vAbiE5RNLHgC7BWfO/GF/CPsO/a
	20B/7SBJ+aSX1vkOyF9eiKxgpJrl9M8KQWM+VvDSV4VwFXtzll/BokQ/J0C5/Ae9DYLi
	9xpAeXbzBeHxehSUc0rnVrbtiEqzl/R6CJojJT6cnJw1nRAPFvxOWcRaRQc5uJ13Jpzu
	5DKe0sCf1MPUC4AjdXUp6TfegZNVL4JmC/NPJiSGp6MOA15hHw50j5qGiE5A13n0YF5a
	dJ6A==
X-Gm-Message-State: AG10YORg8vo3yIO6HVwB6PxXlZNtAHRFZ885BI2Fk/hDJa02e67BmoDcp9hAkTrXLVdlLA==
X-Received: by 10.28.53.138 with SMTP id c132mr1042826wma.93.1455231691287;
	Thu, 11 Feb 2016 15:01:31 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host180-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.180])
	by smtp.gmail.com with ESMTPSA id
	yz5sm9520324wjc.36.2016.02.11.15.01.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 15:01:30 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2016 00:01:09 +0100
Message-Id: <44fdbaff218c82668a03da8f66e70b68e5661d73.1455230414.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455230414.git.andrea.adami@gmail.com>
References: <cover.1455230414.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1455230414.git.andrea.adami@gmail.com>
References: <cover.1455230414.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/3] klibc_2.0.4: Silence QA Error about non-symlink so [dev-elf]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 23:01:33 -0000

Following debian packaging-style we have a copy of klibc-xxx.so in libklibc-dev.
(Comments can be found in klibc.spec.in)

Fixes:
ERROR: QA Issue: -dev package contains non-symlink .so:
ibklibc-dev path 'work/i586-oe-linux/klibc/2.0.4-r0/packages-split/
libklibc-dev/usr/lib/klibc/lib/klibc-HWWIvOaMdZy4N4-6rLLHAB2TjFQ.so'
-dev package contains non-symlink .so:
libklibc-dev path 'work/i586-oe-linux/klibc/2.0.4-r0/packages-split/
libklibc-dev/usr/lib/klibc/lib/libc.so' [dev-elf]

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 903424b..3f47587 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -38,6 +38,7 @@ do_configure () {
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INSANE_SKIP_libklibc-dev = "dev-elf"
 KLIBC_ARCH = "${TARGET_ARCH}"
 KLIBC_ARCH_aarch64 = "arm64"
 KLIBC_ARCH_armeb = "arm"
-- 
1.9.1


