Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0302A6011C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 00:48:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r11so10799269pgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 16:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IYaBioGJatjxIOXjloqYxQa4UJbOL7xZMutKG8bwa6M=;
	b=Hau5MyZhrl8WxxQzWTBWrGY6biq/vdwuKTKfMxl/BktPTFZw0rItXPwouZkM53lNHR
	Ptvj7LBTnsbuSr5lUbwsFatbCbwYk7YUGlNCJMXTPiWRBM4QJ6inMKGHgVnQoBLYqBzb
	BpuIwGh8eG4GfwKKlklNidwInPFZg3MMaqciKLIEygNLTZXuELh/kbWSuGGn+Z3DFnYR
	/tS7PCSaZL3QZLdRJGcsh6Mhza4m7MJhRIw9tmr1T0ohf36nt1FABDJ8le8AbLi0c9tR
	T5+rgXE+FzYD0qXQeguJiS/s9q2V7ST6RiVeCwt8z4Cf8VSMghVMbWv1+jHMObKGGytP
	0vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IYaBioGJatjxIOXjloqYxQa4UJbOL7xZMutKG8bwa6M=;
	b=k1Vcdek0W2lM+y/7U8DWOVZxH7q6aU5Rx4VskfaO0C32AaVh0xB/rAxKucohrJCEL8
	6tSV/cg/o3CQXWSi+6pTdmQvY6HZf7gL047pjehodswZVGXZ44OffoKI2NB+Xw1ykzD0
	8slsLnQweTUGJzhaB5x3dNz+AUWZpCfy0668mzxobR8rGPJfUbva0BcVeN4Pp41zFJ2B
	v2PabgMVW9yCiSFCU848A4B2KtoKvLt5YAQEuQf8e111lKh5gn1Wgjhu+mrp2uV3nTcS
	0hp2hXov6166l8iUukXJq0yLGFz5P3FRC/vwLYmzAQtnWxH6HJ+B0xrHBtCEFnI0lL0a
	rxew==
X-Gm-Message-State: APjAAAXVjY2K0MvXFmFTHD4+XlgORuKOVOq2L0OuKu6qdfaQ/JCtuFID
	KVxgHD5kyBqQRFg+TkbjbvFrYLYGPKM=
X-Google-Smtp-Source: APXvYqyfrRPA1eWHPOs5hkk+Xpzm5THyB2YF9MosftTiJjCtU0AhKecs048VEggaCyRp2I8l7FGHgw==
X-Received: by 2002:a63:d705:: with SMTP id d5mr41909299pgg.24.1579222130178; 
	Thu, 16 Jan 2020 16:48:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	11sm27698372pfz.25.2020.01.16.16.48.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 16:48:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 16:48:48 -0800
Message-Id: <20200117004849.3444434-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Remove unbuildable recipes for ppc64le from rdeps
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
X-List-Received-Date: Fri, 17 Jan 2020 00:48:50 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1be9370f5f..e3a669432f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -94,6 +94,7 @@ RDEPENDS_packagegroup-meta-oe-bsp ="\
 RDEPENDS_packagegroup-meta-oe-bsp_remove_mipsarch = "efivar efibootmgr"
 RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc = "efivar efibootmgr"
 RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc64 = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc64le = "efivar efibootmgr"
 RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv64 = "efivar efibootmgr"
 RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv32 = "efivar efibootmgr"
 
@@ -125,6 +126,7 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "nodejs uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "nodejs uftrace lshw"
 
@@ -156,6 +158,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
 RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64 = "upm mraa"
+RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64le = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_libc-musl = "lcdproc"
-- 
2.25.0


