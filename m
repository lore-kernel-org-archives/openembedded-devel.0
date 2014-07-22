Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C283470757
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:02:25 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so872198wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HLmdVCut7HzgTu1DhJ8MXuYY99ZrMWl7IPLzHIcW0xM=;
	b=TONGtoiRS3AxpKjwl/51Qpou5Zrfnzdo1ex6qNnNcKjDSH53bGI/GVjCKaaS1hym85
	9IPXGV7vSUpPtCK2R8EIxwEKAmDWraNi5SPioscBHYgs0HEpe970MAOP4ZueDqbe09mb
	NJP1E9A7+1yb0QH6NtF5FQVYqJ+EnxHpeEoiic7n94x0I8wFrbbfFzO6HMFsODf0tBnY
	8QC3bDPwo9DYVNcF0dCoUoNnHAnKYNbgrFNeoWTqGVkVMfRIBVYxiHVCR6y/El7IOjJ0
	NeVQaAz91zV15M+DqlJaN8kQ8n47KbTbbLGEEWUw1zRX1s/wR2vp24pNv6+70ICrvUq5
	DZ/A==
X-Received: by 10.180.104.132 with SMTP id ge4mr17204107wib.0.1406052142678;
	Tue, 22 Jul 2014 11:02:22 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host214-54-dynamic.1-79-r.retail.telecomitalia.it. [79.1.54.214])
	by mx.google.com with ESMTPSA id
	dn3sm56279342wib.12.2014.07.22.11.02.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Jul 2014 11:02:22 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 20:02:08 +0200
Message-Id: <1406052128-31657-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] klibc: upgrade to released 2.0.4
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
X-List-Received-Date: Tue, 22 Jul 2014 18:02:27 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/{klcc-cross_2.0.3.bb => klcc-cross_2.0.4.bb} | 0
 .../klibc/{klibc-2.0.3 => klibc-2.0.4}/armv4-fix-v4bx.patch             | 0
 .../klibc/{klibc-2.0.3 => klibc-2.0.4}/klibc-config-eabi.patch          | 0
 .../klibc/{klibc-2.0.3 => klibc-2.0.4}/klibc-linux-libc-dev.patch       | 0
 .../recipes-devtools/klibc/{klibc-2.0.3 => klibc-2.0.4}/staging.patch   | 0
 .../klibc/{klibc-2.0.3 => klibc-2.0.4}/use-env-for-perl.patch           | 0
 .../klibc/{klibc-static-utils_2.0.3.bb => klibc-static-utils_2.0.4.bb}  | 0
 .../klibc/{klibc-utils_2.0.3.bb => klibc-utils_2.0.4.bb}                | 0
 meta-initramfs/recipes-devtools/klibc/klibc.inc                         | 2 +-
 .../recipes-devtools/klibc/{klibc_2.0.3.bb => klibc_2.0.4.bb}           | 0
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-initramfs/recipes-devtools/klibc/{klcc-cross_2.0.3.bb => klcc-cross_2.0.4.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.3 => klibc-2.0.4}/armv4-fix-v4bx.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.3 => klibc-2.0.4}/klibc-config-eabi.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.3 => klibc-2.0.4}/klibc-linux-libc-dev.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.3 => klibc-2.0.4}/staging.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-2.0.3 => klibc-2.0.4}/use-env-for-perl.patch (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-static-utils_2.0.3.bb => klibc-static-utils_2.0.4.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-utils_2.0.3.bb => klibc-utils_2.0.4.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc_2.0.3.bb => klibc_2.0.4.bb} (100%)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
rename to meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/armv4-fix-v4bx.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/armv4-fix-v4bx.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/klibc-config-eabi.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-config-eabi.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/klibc-config-eabi.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-config-eabi.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/klibc-linux-libc-dev.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/staging.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/use-env-for-perl.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/use-env-for-perl.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-2.0.3/use-env-for-perl.patch
rename to meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/use-env-for-perl.patch
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index b4f0cab..0209b20 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
 DEPENDS = "linux-libc-headers perl-native"
-SRCREV = "f0440baf7f2dc1d9a25863c184d0a8fb73c4ee6c"
+SRCREV = "7763dd33e5b8eed4b9e3c583c02c10176fd550d3"
 
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
 SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.bb
-- 
1.9.1


