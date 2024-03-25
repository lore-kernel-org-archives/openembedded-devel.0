Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14697C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 05:52:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.45651.1711345927399660507
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Mar 2024 22:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GIfZCQPU;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6fb9a494aso3033932b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 22:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711345926; x=1711950726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qIXSLZNHBU14NaH+y/tCRBBexgXcKTbFHLyrqtPTCLU=;
        b=GIfZCQPU8qLwyQ/jrCW3JyeWfJHaE8wzk8+u9DucoFd4TmutBt5koD6qS+XmR6P3bL
         gjPFtueIviYbtOqvbWLxR/ZaF3H3WsMHID+gC0AOzAIVFYBY8WYRc+IeAvqa8/eBbU8I
         ah8p80gRumYTrAW6o9Ng/QF4f6cEtec5Z2LF/hUMiZ3sLwgV/gZa//r4jn3v/oQwk+nv
         0qFaVL6Uu25gOfI+CCRul1qJzll6E5yHwn3OEGRJX6b485+IgMLg/bgUgjp9yU3ZJCFM
         GU+Z1DjWi7yCyEPB7yWXha8rBKEKAAqcEw4yZdGKTL/VMObOA3gSCxgmZBLbsIlI0jZl
         4Mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711345926; x=1711950726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIXSLZNHBU14NaH+y/tCRBBexgXcKTbFHLyrqtPTCLU=;
        b=ljMM07hJ2UScJbbkYw7/ClC9B4rLhPZDTIW3epiSl4r6yWcZlR1x1qzuPLN3TnS2WB
         q0uTjauXZthmo7hVMhBppDc/oAkVjvsi2AfT+uxm4GXYvBTGeHKYUMz6ytvehEVF8H8q
         uYpOUi9AT0EoVMbha0PhaU8L97cR7xG6948ALMeCH+d6PEMvTs3r1nB4Km7l471FK65N
         xyK2UpoUcTgiszrR8Sdr7V+zS1frNoidl/6OFkMK3fD4VwZyue9JhCzHgcLiIveOgZjp
         GBxqs+0pYMiaXKKMzXCKLaQYDm/704ehUw44v9mJLrKS0+FgiRghC24gjNt7SQ7Wh9+Y
         Mhgw==
X-Gm-Message-State: AOJu0Yz29sPEnIZJ8msnPO7ZxDEnocyEGM+hz1SNz8jF2GP/vkKpj8IW
	BMoXPyN18Zk3ZWBsvfa40JI0qS30ja6rjUUXUdSErXsuDV7M2Lmd+8ZPWXA6
X-Google-Smtp-Source: AGHT+IGezuNECgzkhLS2bOi+WcOSOAHM7sa6LWnfBZant3WUWX1Xhd+J1nWea7i/CvbOIPeM3rg0mg==
X-Received: by 2002:a05:6a20:19a0:b0:1a1:776d:15c with SMTP id bz32-20020a056a2019a000b001a1776d015cmr4357203pzb.21.1711345926189;
        Sun, 24 Mar 2024 22:52:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id x17-20020a17090a531100b002a03da6286asm5096971pjh.35.2024.03.24.22.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:52:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/4] ipset: Update to 7.21
Date: Sun, 24 Mar 2024 22:51:59 -0700
Message-ID: <20240325055204.150628-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 05:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109568

Fix build with latest musl while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...et-Define-portable-basename-function.patch | 50 +++++++++++++++++++
 .../ipset/{ipset_7.19.bb => ipset_7.21.bb}    |  5 +-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-filter/ipset/ipset/0001-ipset-Define-portable-basename-function.patch
 rename meta-networking/recipes-filter/ipset/{ipset_7.19.bb => ipset_7.21.bb} (70%)

diff --git a/meta-networking/recipes-filter/ipset/ipset/0001-ipset-Define-portable-basename-function.patch b/meta-networking/recipes-filter/ipset/ipset/0001-ipset-Define-portable-basename-function.patch
new file mode 100644
index 0000000000..a06bcac362
--- /dev/null
+++ b/meta-networking/recipes-filter/ipset/ipset/0001-ipset-Define-portable-basename-function.patch
@@ -0,0 +1,50 @@
+From 8c5c0a7a48af7652c50bc27a4efdd9cb4f7d95bd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 24 Mar 2024 21:58:50 -0700
+Subject: [PATCH] ipset: Define portable basename function
+
+Newer version of musl have removed prototype for basename in string.h [1]
+which now makes it fail to compile with newer clang 18+ compiler therefore
+define own basename utility function and not depend on platform for it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ipset.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/ipset.c b/src/ipset.c
+index 162f477..7b5d580 100644
+--- a/src/ipset.c
++++ b/src/ipset.c
+@@ -16,6 +16,16 @@
+ #include <libipset/ipset.h>		/* ipset library */
+ #include <libipset/xlate.h>		/* translate to nftables */
+ 
++/* basename is implemented differently across different C libraries. This
++ * implementation matches the one provided by the GNU libc, and does not
++ * modify its input parameter.
++ */
++static const char *ipset_basename(const char *path)
++{
++	const char *base = strrchr(path, '/');
++	return base ? base + 1 : path;
++}
++
+ int
+ main(int argc, char *argv[])
+ {
+@@ -32,7 +42,7 @@ main(int argc, char *argv[])
+ 		exit(1);
+ 	}
+ 
+-	if (!strcmp(basename(argv[0]), "ipset-translate")) {
++	if (!strcmp(ipset_basename(argv[0]), "ipset-translate")) {
+ 		ret = ipset_xlate_argv(ipset, argc, argv);
+ 	} else {
+ 		ret = ipset_parse_argv(ipset, argc, argv);
+-- 
+2.44.0
+
diff --git a/meta-networking/recipes-filter/ipset/ipset_7.19.bb b/meta-networking/recipes-filter/ipset/ipset_7.21.bb
similarity index 70%
rename from meta-networking/recipes-filter/ipset/ipset_7.19.bb
rename to meta-networking/recipes-filter/ipset/ipset_7.21.bb
index bb4319f36c..c7ebdc1c66 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.19.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.21.bb
@@ -9,8 +9,9 @@ SECTION = "base"
 
 DEPENDS = "libtool libmnl"
 
-SRC_URI = "http://ftp.netfilter.org/pub/ipset/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "9bc1fba48d65786e3e0b63dc6b669a866823d77840c6990c0c6b23078ec2c4d6"
+SRC_URI = "http://ftp.netfilter.org/pub/ipset/${BP}.tar.bz2 \
+           file://0001-ipset-Define-portable-basename-function.patch"
+SRC_URI[sha256sum] = "e2c6ce4fcf3acb3893ca5d35c86935f80ad76fc5ccae601185842df760e0bc69"
 
 inherit autotools pkgconfig module-base
 
-- 
2.44.0


