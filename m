Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA24781CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:44 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d193so9392844pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TFaaClM8GV/gPLF4MHZbbsbdcYVXbgofLc+JhvgK1lg=;
	b=DWC5WVPmSJHRzorGhRdMMiNyyD+1AewhkOS8nnqPDN/Cde0yUaGIjwEEZPq5+tvn+A
	TOM9QQLnwaQNZ6g6rGwx4khHNYNXfIAVS7ytIPo7YFVx66iyQYj/2Fg4fOBmmMPcPM10
	VG2013S5Tx85U+qmuT24Fx8mRNcrExFmCIF09ZFGBSphQ2yCUBkKMEIfdI7RNuKO502N
	zkx5ARRFwGjOa8U4Pxfva0AgbEGOwMsWFIlmjfRfOkhQumq2+wa5I1mWyHQhMSqNmsMf
	EX281/dl8PHJhe3/HiXT623E0o2/bvHi3mt+EYvP+z0Rf39fhgNM2xFruOPvwlmRm9Hf
	1Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TFaaClM8GV/gPLF4MHZbbsbdcYVXbgofLc+JhvgK1lg=;
	b=NkPi1KFsMI6Shj0Mxmg5QsYsVGEx4Fhz+dlKYvECULluuYGDlI2VkHB8DPrWNUmD+K
	KARCWyMH7tBSrb+PgPn0D+m7eS4NySmG14Ci6MYzheb3zLYIfZdRL3e9qec5rtjfNo7j
	HxUdhR7KckVXpnrGnQxzAy49QkCsDcDvucxTNHzCi4QLF2Ng+6dDJppShPctjCXp3IXz
	di8AYyyeg8CxsKUSgHtu9+zlh+Com6EK5LXwtWm2XJTD09s1tSDSGimcIld2yF89jYDa
	5eh2OGb+b6ufL/noxfepnJ9OPOkE0WE2e+KTWD4EO0uVXsPhgbQODh99aNmsM2sSm7R2
	5RHA==
X-Gm-Message-State: AIVw113kldlgAyn2Fd9a9t8dlqO/H9N+tm1ZR0yEggVPzEFGsaBN1UZF
	+PpS4kEg9WOr8tmM
X-Received: by 10.99.7.129 with SMTP id 123mr12591777pgh.171.1500010845340;
	Thu, 13 Jul 2017 22:40:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:10 -0700
Message-Id: <20170714054013.34458-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 15/18] kexec-tools-klibc: Fix build with musl
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...he-order-of-headers-to-fix-build-for-musl.patch | 30 ++++++++++++++++++++++
 .../kexec/kexec-tools-klibc_2.0.2.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
new file mode 100644
index 000000000..a7600b301
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
@@ -0,0 +1,30 @@
+From 86b962e7c0de43b20b6210d059e4855ce87078bc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 16:20:08 -0700
+Subject: [PATCH] Adjust the order of headers to fix build for musl
+
+Fixes
+kexec/ifdown.c:33:16: error: storage size of 'ifc' isn't known
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec/ifdown.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec/ifdown.c b/kexec/ifdown.c
+index 2215798..e13f777 100644
+--- a/kexec/ifdown.c
++++ b/kexec/ifdown.c
+@@ -16,8 +16,8 @@ char *v_ifdown = "@(#)ifdown.c  1.11  02-Jun-1998  miquels@cistron.nl";
+ #include <sys/time.h>
+ #include <errno.h>
+ 
+-#include <net/if.h>
+ #include <netinet/in.h>
++#include <net/if.h>
+ 
+ #define MAX_IFS	64
+ 
+-- 
+2.13.2
+
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index c9fec2542..49c53a3ea 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -20,6 +20,7 @@ SRC_URI += " \
             file://sha256.patch \
             file://sysconf_nrprocessors.patch \
             file://fix-out-of-tree-build.patch \
+            file://0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch \
             "
 
 SRC_URI_append_arm = " file://arm_crashdump.patch"
-- 
2.13.2


