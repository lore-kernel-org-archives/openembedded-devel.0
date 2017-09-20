Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4F26E77A62
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 22:32:30 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e69so1705019pfg.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 15:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XaUsTXjr4q/rRycZgBPCn5zYn0LHOnGefKp4vdde4iM=;
	b=Je+ccAU6p2BPG9Z9LkjhuIO/vHtpDjel2tgnoesv+NLD3RH2+qXucvNSTduPpOPGWm
	2dIboP7TnYwOKmh2H/fLSC+Rk7Zb6m8jk5NXLus4M9pZV5dYNv9ansLVogXJVyVSRpVf
	O9C1FY2mIx893BjA9vr65B934ztG5jDATed53MTaj3eOWPbt1AOAy/VE/5LhslzAhakK
	KTCif1hfmjdDYYcyMbsag4dSdSnW9nI8KZ594BsdaCDo5wgDr4BzPqoQesiEkPR76ATw
	PoicKYNZcePRbH9gBLfGpvaaDQRLWCCsGyTBCnrEvZjVpQOe5qGUxN/ga0xBmZ1ossHG
	fpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XaUsTXjr4q/rRycZgBPCn5zYn0LHOnGefKp4vdde4iM=;
	b=f/A4Q2nDZ/8P6U7OdfQb0ov7JL4EHOGdKChvxrtzoACuFE8V6dCVGHga/rojw0jOKK
	YcjTE31cqXbXRJA0P0wuzBG+U9+hZQJo0wGyGHj5Fl5jleSgpfKRmb38E+72O1YEssDW
	014tMthHS5l0AKjgideZZislYDAsL16zQYohjW3c8+zX9f/adBf34/QXNP6CM19SlUhg
	3rDaaA2vvHEHOg7MND0/nj1BkGIArcLR+83YIYSyC4Cm3ixH4WLPnGof4ZPY69xI58Cp
	JBASn8wH7pD3zo5Su+ZOjaZy1WSHO5blXrArIE9bpYrQ8wk2305HjpjEIlDZhg1SNzHQ
	q77w==
X-Gm-Message-State: AHPjjUiK0IqkLKBCZUng41sqZOfpwHlmLqlho2ASpMBgigC3hxGVcRlA
	0EHKx9G73vANaK41P9+iz4gqPg==
X-Google-Smtp-Source: AOwi7QA7scuRDhGAf9H9xMYSGdur7KX6p0HsOXj4J0OxrvHbXHszLPb/Vno770rkOQ8Wl861jvmr8w==
X-Received: by 10.98.79.65 with SMTP id d62mr3712388pfb.324.1505946752277;
	Wed, 20 Sep 2017 15:32:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	d4sm9031277pfb.185.2017.09.20.15.32.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 15:32:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Sep 2017 15:32:21 -0700
Message-Id: <20170920223222.26924-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] luajit: Fix mips build with clang
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
X-List-Received-Date: Wed, 20 Sep 2017 22:32:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit/clang.patch | 19 +++++++++++++++++++
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb    |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/clang.patch

diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
new file mode 100644
index 000000000..c39ef6fd4
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
@@ -0,0 +1,19 @@
+clang pretends to be gcc 4.2.0 which is a big lie when it comes
+to features, its same as latest gcc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: LuaJIT-2.0.5/src/lj_arch.h
+===================================================================
+--- LuaJIT-2.0.5.orig/src/lj_arch.h
++++ LuaJIT-2.0.5/src/lj_arch.h
+@@ -313,7 +313,7 @@
+ #error "Need at least GCC 4.2 or newer"
+ #endif
+ #elif !LJ_TARGET_PS3
+-#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3)
++#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3) && !defined(__clang__)
+ #error "Need at least GCC 4.3 or newer"
+ #endif
+ #endif
diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index d7477ed98..73c38111e 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://luajit.org"
 
 SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
+           file://clang.patch \
 "
 SRC_URI[md5sum] = "48353202cbcacab84ee41a5a70ea0a2c"
 SRC_URI[sha256sum] = "874b1f8297c697821f561f9b73b57ffd419ed8f4278c82e05b48806d30c1e979"
-- 
2.14.1


