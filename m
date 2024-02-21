Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5C6C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 16:21:08 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.17341.1708532460126568068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 08:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QgD8iHLH;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6da9c834646so757517b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 08:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708532459; x=1709137259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=71d/j6/T2A4719HO7ebDJjdq715TOz+zMz45OcCFIRE=;
        b=QgD8iHLHssCxHhvLaQMIRKpJpGI4DBnCicNNEQGnRfNm3AdhAdO/wsWqoGlXJu4Cvo
         cW39rIH4pvRx+qjFAak7pmv8w24Xt/sBAUdgT4FXdwD7jLgnXMp647nVUfUjD8eBLv+L
         0cleO7wYe8lPC9ot1Y+lsOFNHyHs30Wibg8KRcHt+bumuWBnZiPESUciTuQVuPY2u4ge
         Ug+NV31sKfq62FhvcZIf/h6MwJgulAyeFZAjWlZP/VPFXB0FH5XWaIILlogyx81QhgKj
         r8E6uy7EMwAyQS8Tck5opFjLMfCkEwSV2M1mkQbOSEwfwkYsxV7Jj/ZN3NvuUW8rkUOK
         1E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708532459; x=1709137259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71d/j6/T2A4719HO7ebDJjdq715TOz+zMz45OcCFIRE=;
        b=Tbu8Xy3QD3WdvvSHOrLGazYE9u1G3OQmUwGLfqi0Ug7xj0+/d3kqnjaAnctdlg21su
         NkOQtEbo6xBG+dUUvGFbbwEKZUj/FD7AbfwwSjueRiBS2H5kLLmQWFfHdU3NpEot7HPV
         MiIa+9r/Jic+tZflgK0nN6flfYywo6EPvJUA+C8qnioFAxXq2YfblN7ydvL/2f6+770q
         qWT7C6dYQgQ6BZI1kONXagtdGkdUYNZAYMNx7TLxlFL7Lp06BbN+pdnCbzjHBd9sgDLW
         nG71qUOs6SgW3hBT9byDH2/WI6CKg0InERv7IqoWx+JiGpO+fSkJ1YcOW/abzoofGZxm
         D3bg==
X-Gm-Message-State: AOJu0YwRI1Omm0wbCLewl5Kmx6EdS3MgzL4703qVrEZrgws6nCNm3CNM
	uvDa/4zyyhDVt9iqukW5dqpXIFalBNcq+DYwJqISgMd8bhz7Bj+/b000P6cOj+M=
X-Google-Smtp-Source: AGHT+IFPh6D/dcCk+BeBrtrjpTYfxzKC3L2o/1Bad6NM8QrsiJRw/QxP4fwE6Qv7m9RvxqeFtpXtBA==
X-Received: by 2002:a05:6a20:9c8b:b0:1a0:6496:84c1 with SMTP id mj11-20020a056a209c8b00b001a0649684c1mr23805254pzb.37.1708532459112;
        Wed, 21 Feb 2024 08:20:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::67c2])
        by smtp.gmail.com with ESMTPSA id nv13-20020a17090b1b4d00b00298e639d17esm9753550pjb.22.2024.02.21.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 08:20:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khawaja Shaheryar <behzadshaheryar@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/4] libdaq: add recipe
Date: Wed, 21 Feb 2024 08:20:54 -0800
Message-ID: <20240221162057.4154660-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 16:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108964

From: Khawaja Shaheryar <behzadshaheryar@gmail.com>

I am adding this recipe as snort3 depends on it.
snort3 recipe will be provided in next commit.
See more: https://github.com/snort3/libdaq

Signed-off-by: Khawaja Shaheryar <behzadshaheryar@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-example-Use-lm-for-the-fst-module.patch | 32 +++++++++++++++++++
 .../recipes-connectivity/daq/libdaq_git.bb    | 18 +++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/daq/libdaq/0001-example-Use-lm-for-the-fst-module.patch
 create mode 100644 meta-networking/recipes-connectivity/daq/libdaq_git.bb

diff --git a/meta-networking/recipes-connectivity/daq/libdaq/0001-example-Use-lm-for-the-fst-module.patch b/meta-networking/recipes-connectivity/daq/libdaq/0001-example-Use-lm-for-the-fst-module.patch
new file mode 100644
index 0000000000..7147c042a1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/daq/libdaq/0001-example-Use-lm-for-the-fst-module.patch
@@ -0,0 +1,32 @@
+From 9357da2a5a829f7a0620e6c19835a65b7b02a8fb Mon Sep 17 00:00:00 2001
+From: Khawaja Shaheryar <behzadshaheryar@gmail.com>
+Date: Tue, 20 Feb 2024 21:03:26 +0500
+Subject: [PATCH] example: Use -lm for the fst module
+
+If -lm is not passed in Makefile.am, the following is seen
+| arm-yoe-linux-gnueabi-ld.lld: error: undefined symbol: ceilf
+| >>> referenced by math.h:632 (/usr/include/c++/v1/math.h:632)
+| >>>               libdaq_static_fst_la-daq_fst.o:(std::__1::pair<std::__1::__hash_iterator<std::__1::__hash_node<std::__1::__hash_value_type<FstKey, FstNode*>, void*>*>, bool> std::__1::__hash_table<std::__1::__hash_value_type<FstKey, FstNode*>, std::__1::__unordered_map_hasher<FstKey, std::__1::__hash_value_type<FstKey, FstNode*>, FstKeyHash, std::__1::equal_to<FstKey>, true>, std::__1::__unordered_map_equal<FstKey, std::__1::__hash_value_type<FstKey, FstNode*>, std::__1::equal_to<FstKey>, FstKeyHash, true>, std::__1::allocator<std::__1::__hash_value_type<FstKey, FstNode*>>>::__emplace_unique_key_args<FstKey, std::__1::pair<FstKey const, FstNode*>>(FstKey const&, std::__1::pair<FstKey const, FstNode*>&&)) in archive ../modules/fst/.libs/libdaq_static_fst.a
+
+Upstream-Status: Pending
+
+Signed-off-by: Khawaja Shaheryar <behzadshaheryar@gmail.com>
+---
+ example/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/example/Makefile.am b/example/Makefile.am
+index 0d5ca31..1eaa9e8 100644
+--- a/example/Makefile.am
++++ b/example/Makefile.am
+@@ -31,6 +31,7 @@ endif
+ if BUILD_FST_MODULE
+ daqtest_static_CFLAGS += -DBUILD_FST_MODULE
+ daqtest_static_LDADD += ${top_builddir}/modules/fst/libdaq_static_fst.la $(DAQ_FST_LIBS)
++daqtest_static_LDFLAGS += -lm
+ endif
+ if BUILD_NETMAP_MODULE
+ daqtest_static_CFLAGS += -DBUILD_NETMAP_MODULE
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-connectivity/daq/libdaq_git.bb b/meta-networking/recipes-connectivity/daq/libdaq_git.bb
new file mode 100644
index 0000000000..19346124bf
--- /dev/null
+++ b/meta-networking/recipes-connectivity/daq/libdaq_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "LibDAQ: The Data AcQuisition Library"
+DESCRIPTION = "LibDAQ is a pluggable abstraction layer for interacting with a data source (traditionally a network interface or network data plane)."
+HOMEPAGE = "http://www.snort.org"
+SECTION = "libs"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=79258250506422d064560a7b95b2d53e"
+
+DEPENDS = "libdnet libpcap"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
+           file://0001-example-Use-lm-for-the-fst-module.patch"
+SRCREV = "c757aaae5a70d5bbb3239c5a16bca217a5aca651"
+
+S = "${WORKDIR}/git"
+
+FILES:${PN} += "${libdir}/daq/*.so"
-- 
2.43.2


