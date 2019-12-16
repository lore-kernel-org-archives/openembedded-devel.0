Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id F16587F7E6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 03:42:11 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id g6so3841176plp.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 19:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k+pLY7vnsFttHZc1pO6iKNd0ESINioR7hivNDWBOipI=;
	b=gYbYcjvUtEcGQyhR9SEQ8uGgdQVYxBrhISrQDCKMpWJbhdu3AOzDslxfv3JXbdcbvs
	nYOQ+P38iRwT/laJ7Q6QLOXo9a/AiuHdaUf7rBquAf7ol/LACCyn5ie6XyYw/r9gSdGJ
	eZbnItXy0CfZAm5qEZYVfYdyRHUwKir1kR39KhwenFdun01MU89Jhmc9m8Nh+Lo3Tu5U
	rBQzalzV2jOdDUr0/nhgBqPojV7BYD3iiGO+BgXzPuMltNWOWWSlTEbllNzdxWZ9tP19
	F4vphGDP5rS9uL+IOoacSjjgVvgzimoY6Pxu6zZ8+o3p0wSzO8+BOl1L7NGw5AjB/X0s
	iBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=k+pLY7vnsFttHZc1pO6iKNd0ESINioR7hivNDWBOipI=;
	b=lPqNVxCgfPzzbT2tLNuBoWgKPw+mYBdqvqdl3ZCd2r73B9NKj0kyqC7c5/XUZ9pY05
	6W79lnCzrwO4ywOS9j4ZyHX2zw0ZGDhiC31ZrdLf1KMUzyFMebPRiTO4REUcNYJpQawf
	IFhOAKNn0W52K1LaTDRehugihxDkTOE4r2Jr5AoEr21uwvZuCwTlOGjh9yh2CvtmWCdq
	Ddztpl8EN5fuXRxsia8PvDMbCi9Lj1JgLTgH8P6v8endnvVzCjhKvPSHo1qc/Hfu2yAc
	Gn9YVf1hk2xPo0C0L5B76vfbOGu0TEO+U49HBJMWJfbxs7fofxYZJpi2T4YGFa41op1j
	WEbg==
X-Gm-Message-State: APjAAAVh+uJ0v4r/UceKhK2Ez/Grqp8l64WzjRiaWR8zhmypUDnq3CqF
	Xd90WGTZudQM6Y3ORbsV75cpieGdtfw=
X-Google-Smtp-Source: APXvYqxnbOcMby+ojkAw50BcmI9mAIyLl49FR8MdII4vCzZlvhT5HNtEJNy2X5Xhggc5IGXs6qEPAw==
X-Received: by 2002:a17:902:be10:: with SMTP id
	r16mr14084560pls.169.1576467731961; 
	Sun, 15 Dec 2019 19:42:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6563])
	by smtp.gmail.com with ESMTPSA id
	a22sm21336106pfk.108.2019.12.15.19.42.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 19:42:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2019 19:41:54 -0800
Message-Id: <20191216034155.2675900-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216034155.2675900-1-raj.khem@gmail.com>
References: <20191216034155.2675900-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] packagegroup-meta-oe: Remove ppc64 specific incompatible packages
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
X-List-Received-Date: Mon, 16 Dec 2019 03:42:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index bd1609dc70..31c3f4e95d 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -93,6 +93,7 @@ RDEPENDS_packagegroup-meta-oe-bsp ="\
     "
 RDEPENDS_packagegroup-meta-oe-bsp_remove_mipsarch = "efivar efibootmgr"
 RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc64 = "efivar efibootmgr"
 RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv64 = "efivar efibootmgr"
 RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv32 = "efivar efibootmgr"
 
@@ -123,6 +124,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "nodejs uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "nodejs uftrace lshw"
 
@@ -153,6 +155,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     "
 RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa"
+RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64 = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_libc-musl = "lcdproc"
-- 
2.24.1


