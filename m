Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5187E73A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 13:14:54 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z23so9060237wma.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 06:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HhnYD1LkyZMG7ySTVB+/P0OrQtSsTv/MvOQLEVQqwRE=;
	b=G0Mc1+QydhFropeHkz5M6TUOtaAp5C+8ladqjjHkpAscDHv3O65YWb/r9RJEI9Namx
	VpdoKSYz5vKbWQ8VLVBjF6M9E+7t1YQdr846svXOlpQTrASGEdj16DH7lBKUnc+Mu7Rb
	TN0pz4PcbVtwLmNwSOPeFNFJrOlzFxdcD+OP2S1oAaMYxJyJdgR1xJLC6KXoPlIz7UNp
	sVRj9sxF+KbrmaG8utm1sfN96vcNzOVyfJxjU2ngeIGsBxBpGyK0BnowRIWAl8IdZiHL
	nXns3Yy/4I7/dBGzAPmXCI5wic0rGgXkdqz5AIv0SayjB2pfN7nme8MuSDbk+IU/n7iU
	X5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HhnYD1LkyZMG7ySTVB+/P0OrQtSsTv/MvOQLEVQqwRE=;
	b=bEmJ2rHjJAKX64/RjYj1nIwf5ha4+utMS8sDMoXzyH2jbeQ5UD8kJ6vPBDD9u3T9C/
	+8F7NjWlEHmmuhVa/vg/iOkWM0iaKRXuTgJAGX3s6wQHzF0N4R81j4kaQ2hqi0UtWgxX
	KVKDSU/p5wvZgjkL9c5CZlIeGjAvm4tDU5ovhOC3Ln1WUKskGUcW1DK+Gkb0CbYji7HL
	NRapIEjqSqB2GLk36O41yIEc6EUoQq+ZDsblhPStB0K+RrMMeGwHNFuAofQEPOefmJLH
	H0qo4YbN00y1zQzqfGQ2e1ZzfuAUumroNeN2Tl83+GbZf9IG5ZxmV00pA76X7u8RAzIv
	qPXw==
X-Gm-Message-State: APjAAAVASH5NkWV5rEh4GiJUOpO95vhExUCh7Olx6z6k2C3jWwZKK9Er
	4E2CAZR8caO5rfG/9SctmJ31PmlR4V4=
X-Google-Smtp-Source: APXvYqzopTyuidTqOwi1QMv6+9qwTwPa8B7Q1P06OBWGVGLD2DNAD9w7QX9h174r8mQeY8RxUeio8Q==
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr18417801wme.125.1560777295303; 
	Mon, 17 Jun 2019 06:14:55 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	j132sm13160049wmj.21.2019.06.17.06.14.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 06:14:54 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2019 14:14:37 +0100
Message-Id: <20190617131436.24210-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8: Enable HotSpot builds on 5.x Linux kernels
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
X-List-Received-Date: Mon, 17 Jun 2019 13:14:55 -0000
Content-Transfer-Encoding: 8bit

This is a backport of a patch to enable hotspot builds
with 5.x kernels.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../openjdk-8-release-172b11-common.inc       |  1 +
 ...-HotSpot-builds-on-5.x-Linux-kernels.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
index ad20585..a8d3ccb 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
@@ -29,6 +29,7 @@ HOTSPOT_UB_PATCH = "\
     file://0017-hotspot-Missing-return-statement-in-__sync_val_compa.patch \
     file://0018-hotspot-Fix-debug-build-after-8062808-Turn-on-the-Wr.patch \
     file://0019-hotspot-Turn-on-the-Wreturn-type-warning.patch \
+    file://0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch \
 "
 HOTSPOT_UB_PATCH_prepend_aarch64 = "\
     file://0012-hotspot-aarch64-fix-undefined-behaviour-gcc-v8-fix.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch b/recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
new file mode 100644
index 0000000..f9feca0
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0020-Enable-HotSpot-builds-on-5.x-Linux-kernels.patch
@@ -0,0 +1,43 @@
+From 90220d41f65910b108c901977eefe78fc1edecc5 Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nicola.lunghi@jci.com>
+Date: Mon, 17 Jun 2019 13:59:26 +0100
+Subject: [PATCH] Enable HotSpot builds on 5.x Linux kernels
+
+8217753: Enable HotSpot builds on 5.x Linux kernels
+Summary: Remove Linux kernel version check as very unlikely a kernel older than 2.4 will be used.
+Reviewed-by: erikj
+
+Upstream-Status: Backport (http://hg.openjdk.java.net/jdk8u/jdk8u/hotspot/rev/5af8ec63c21c)
+---
+ hotspot/make/linux/Makefile | 15 +--------------
+ 1 file changed, 1 insertion(+), 14 deletions(-)
+
+diff --git a/hotspot/make/linux/Makefile b/hotspot/make/linux/Makefile
+index 17c14097..e8f20104 100644
+--- a/hotspot/make/linux/Makefile
++++ b/hotspot/make/linux/Makefile
+@@ -227,20 +227,7 @@ all:
+ 	@echo "  $(TARGETS_SHARK)"
+ 	@echo "  $(TARGETS_MINIMAL1)"
+ 
+-checks: check_os_version check_j2se_version
+-
+-# We do not want people accidentally building on old systems (e.g. Linux 2.2.x,
+-# Solaris 2.5.1, 2.6).
+-# Disable this check by setting DISABLE_HOTSPOT_OS_VERSION_CHECK=ok.
+-
+-SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3% 4%
+-OS_VERSION := $(shell uname -r)
+-EMPTY_IF_NOT_SUPPORTED = $(filter $(SUPPORTED_OS_VERSION),$(OS_VERSION))
+-
+-check_os_version:
+-ifeq ($(DISABLE_HOTSPOT_OS_VERSION_CHECK)$(EMPTY_IF_NOT_SUPPORTED),)
+-	$(QUIETLY) >&2 echo "*** This OS is not supported:" `uname -a`; exit 1;
+-endif
++checks: check_j2se_version
+ 
+ # jvmti.make requires XSLT (J2SE 1.4.x or newer):
+ XSLT_CHECK	= $(REMOTE) $(RUN.JAVAP) javax.xml.transform.TransformerFactory
+-- 
+2.20.1
+
-- 
2.20.1


