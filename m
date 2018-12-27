Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFB46C16F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 02:29:41 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w4so8189263plz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2018 18:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=j6ABKu75pDGL6tMw7E6lAQwlPtgXnfWlMgAMAYG3uUA=;
	b=lWxqL1REiHxKBc9RVdM7iNXqIDpF90h7aL7f6i6YTJ9zTk0AQSqVmTa17TfZHYys3x
	Ey36WbqXKK1IiBsZZxdcDaHx2X1G1bDhOE4uBB2slXJ6GsnX0iEpA9Whrlb17vhoF/xg
	D8HiBWus3h1jci6Sd/dHq/bP1ZOm0Yx7nscw38JsEktQSsmBuglvwZMt1t4YkcxKAnNb
	u3tpEBr1z3qCFMb37mQtyh60uwS+GgOkEnyIcDZuR3F46ZFGoRzlfHAjZnuDiMC9qyX/
	FSbm5uFewsa+7HhN2a/7yLvOP6VsTDLsVqAUzvxcIuGgSpZFm/wQtkOGPARjTnV6QM0f
	9ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j6ABKu75pDGL6tMw7E6lAQwlPtgXnfWlMgAMAYG3uUA=;
	b=nsDxDFER8SkXJ8+slz1/B49Qwb7uOmgyKbvju/qfUC0sv2552HmVc7TgQn5c4W+VxS
	U9mm731ETh0onUhG+wkalEK3KI2tl8i3eh/cde9VtVevRSVarqc4tAmzqp2Zl5jhJ9jc
	Ujk1BCUqgg6Cfps50qCDKl+o31MDOA+j7VSk7lV+/e6rtnfFH6Mo5yhqz5LVD3UIQKLy
	XT198SPgtLJD3RT7nTpNak+u+1dCa9Ofc/+uZ4WkvGVx6p7GyoknYLp0iup+9bSzs8Iv
	g1NuK7+i6Pe1M6KBTLPn4gWE4XSWc68Vjx6Edzv/+li9i4azNqW189A3D27qzmbCndRH
	PIIw==
X-Gm-Message-State: AJcUukeSCvmbCZ6k2ujFEu8GzXTRl+kXprEAxyG99ebkD7X82nrJ3S5y
	8WwISI/o4tL50bqS8Qjf/ZDaguRL/XQ=
X-Google-Smtp-Source: ALg8bN7yzOQasMaIUyoJnSBiyolOJydmQOtbrAppiZ55ukirogdk7Ts0RGgOE49+oSwNjCbzXW2lvA==
X-Received: by 2002:a17:902:5982:: with SMTP id
	p2mr21830809pli.39.1545877782488; 
	Wed, 26 Dec 2018 18:29:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	([2601:646:877f:9499:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	p2sm50666072pfp.125.2018.12.26.18.29.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 18:29:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Dec 2018 18:29:24 -0800
Message-Id: <20181227022925.5920-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181227022925.5920-1-raj.khem@gmail.com>
References: <20181227022925.5920-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] packagegroup-meta-oe: Remove unbuildable packages on risc-v from rdep
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
X-List-Received-Date: Thu, 27 Dec 2018 02:29:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index eb461297d5..62f1c77591 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -56,6 +56,8 @@ RDEPENDS_packagegroup-meta-oe-benchmarks = "\
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mipsarch = "libhugetlbfs"
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mips64 = "tinymembench"
 RDEPENDS_packagegroup-meta-oe-benchmarks_remove_mips64el = "tinymembench"
+RDEPENDS_packagegroup-meta-oe-benchmarks_remove_riscv64 = "libhugetlbfs"
+RDEPENDS_packagegroup-meta-oe-benchmarks_remove_riscv32 = "libhugetlbfs"
 
 RDEPENDS_packagegroup-meta-oe-connectivity ="\
     gammu hostapd irssi krb5 libev libimobiledevice \
@@ -90,6 +92,8 @@ RDEPENDS_packagegroup-meta-oe-bsp ="\
     "
 RDEPENDS_packagegroup-meta-oe-bsp_remove_mipsarch = "efivar efibootmgr"
 RDEPENDS_packagegroup-meta-oe-bsp_remove_powerpc = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv64 = "efivar efibootmgr"
+RDEPENDS_packagegroup-meta-oe-bsp_remove_riscv32 = "efivar efibootmgr"
 
 RDEPENDS_packagegroup-meta-oe-dbs ="\
     leveldb libdbi mariadb mariadb-native \
@@ -119,6 +123,8 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "uftrace lshw"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "uftrace lshw"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "uftrace lshw"
 
 RDEPENDS_packagegroup-meta-oe-extended ="\
     byacc cfengine cfengine-masterfiles cmpi-bindings \
@@ -146,6 +152,8 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     "
 RDEPENDS_packagegroup-meta-oe-extended_remove_mipsarch = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc = "upm mraa"
+RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa tiptop"
+RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_libc-musl = "lcdproc"
 
 RDEPENDS_packagegroup-meta-oe-gnome ="\
@@ -260,6 +268,8 @@ RDEPENDS_packagegroup-meta-oe-test_remove_libc-musl = "pm-qa"
 RDEPENDS_packagegroup-meta-oe-test_remove_arm = "fwts"
 RDEPENDS_packagegroup-meta-oe-test_remove_mipsarch = "fwts"
 RDEPENDS_packagegroup-meta-oe-test_remove_powerpc = "fwts"
+RDEPENDS_packagegroup-meta-oe-test_remove_riscv64 = "fwts"
+RDEPENDS_packagegroup-meta-oe-test_remove_riscv32 = "fwts"
 
 RDEPENDS_packagegroup-meta-oe-ptest-packages = "\
     zeromq-ptest \
-- 
2.20.1


