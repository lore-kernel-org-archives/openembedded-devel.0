Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id B24527F885
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 20:15:57 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id x13so1692525plr.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5x5pLvHiyJJ4N3CZTUuVsU3ZZOUt5DvlOX2Y9qQ0JVk=;
	b=r3sD+qZuf2vO7Tx1JVdce58WSwh9jPoe96/PjeCiW8DKO90OTf1hxORG4cthIbVQb0
	NKd72J9VdCOG+9DMvYaBVWrItB8CiNsfFZWQNy1ok3jrWx8ZQfquv2x5hvqiYgNEkD/L
	jzanKe/bWd8f4wYpRz+YsYoBb4L1gwK+EoXX/deJuT6yy6/IMKlnDvuJ5iW+TdiOFrdd
	TNott18I2jFDJSi3P1nIRW0ZHmTK6P+g9RgqXF+/RdEOyplJVhZF9c+2rL8nbyx/iHtg
	m8k0alaqAd/HM0onMn8hAReR8LYFY6YAeG8tCaNTEZUbvigEttIWTg3o4nwuEEmiILZt
	TyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5x5pLvHiyJJ4N3CZTUuVsU3ZZOUt5DvlOX2Y9qQ0JVk=;
	b=oLBR1YCLme+dpuNqrGs/DlwzlnHfnPfYVuRE5bAzk3X7m5yCJCCJlnXJwO79jph+xu
	UhJo0ZqyassOKrpzK/Y3peWVbsOxvnHaWJybzZd+cEiREFDahEUK9juOn1izBnLuzjcu
	vc6rZvRRfy5Ig9E0rWWvcslGF2TXfb1A+tX24t9Kve5f50T40r9PMaBa5vdhSBAlAn4v
	iNs37QzOYWIfXoToIPr5MmPEUeMXWWAa04ImbxedM+flJHVZx4NMW4gc93U2gGjc1vau
	GgZHxBEmMX0dyPo+hKfo9JKHHhI8uIG3L5wJPTaGi69fdQfaT5Bn4DSosMt7ktDg/HmL
	IB4Q==
X-Gm-Message-State: APjAAAVaWCtrGrp/7kNOAOXTtbLaHIimW+4TriOFu9Ed3dsaYBfazHzk
	FLjDppGXOtkKbCFiRWrjPE9mJMgCOA4=
X-Google-Smtp-Source: APXvYqwK5nCTEBqm5CynSYwJmT+ltjn/gFa9z1DcaEsf+kie5YjvIzUC3MYBWCH3TNLkmje3Xpq8DQ==
X-Received: by 2002:a17:902:6909:: with SMTP id
	j9mr10855531plk.136.1575576958155; 
	Thu, 05 Dec 2019 12:15:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id
	b73sm13977440pfb.72.2019.12.05.12.15.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 12:15:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Dec 2019 12:15:42 -0800
Message-Id: <20191205201542.523250-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Remove nodejs and uim on riscv
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
X-List-Received-Date: Thu, 05 Dec 2019 20:15:57 -0000
Content-Transfer-Encoding: 8bit

These are not yet buildable for RISC-V

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 310de53726..bd1609dc70 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -123,8 +123,8 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "uftrace lshw"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "nodejs uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "nodejs uftrace lshw"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
     byacc cfengine cfengine-masterfiles cmpi-bindings \
@@ -258,6 +258,8 @@ RDEPENDS_packagegroup-meta-oe-support ="\
 
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch = "gperftools"
+RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 = "uim"
+RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 = "uim"
 
 RDEPENDS_packagegroup-meta-oe-support-egl ="\
     freerdp libnice opencv \
-- 
2.24.0


