Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD54CD11DD
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 02:05:03 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.27757.1711505095753767836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 19:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CD+h1xLW;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e7425a6714so4076624b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 19:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711505095; x=1712109895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izB+j7PEe2FlasFHpMNGxb1iiju4v/HvVz5wH76VHUs=;
        b=CD+h1xLWt5CRwfkiddv4KJXv6FwIcO0I95dB/6aA+/lb6Iw6uHtftuUQX1WQ70jO1b
         X8ypyTmxzktgfoLolqc6p7Vg8Ez93+8RePEwSLqGiAG3z1WtEuQMz6PxF9NloUKYJKk5
         6gXqegJeCvDQOIpzEwsvps5Jmg2JdE5BY0MDdukn3PhkwzxIPfr5YDNgWmRyAerk53vW
         5G25Kbii9zP89ovx9EyKDPMVt3k07vFItypIexnZbe9snNLKbfMoXXFVMdxrZ92SbgxU
         TPXyNr9lIdKAGppmOwgFasxYAt2AxjuhBSt/7eAoPtRTDeLud5m8uhCzXXndxxKZV10W
         SB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711505095; x=1712109895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izB+j7PEe2FlasFHpMNGxb1iiju4v/HvVz5wH76VHUs=;
        b=KDocMrwR+whiAl6ifYU023qjUSfex6dm+ts/gfWqZq1wnT5GD9djkRkzx2b6T7MMUJ
         oAfAEM8+E1ytneOSYVe4cu9QxdlmVOCN1B0YvZP1j8RXdcQmXghJVduyU6BkIRgi+o9j
         T39GohK0YETxuAvYrkb+Uwa2ICIQ99tCSyUH/8o2TRzXxe968WR+F+e0Dq9O3kNNEgPn
         B17L5savJ78Lbs+zPDVRc3llgp4gacc+jNBiid85Cblbd0e9T3SQSBiNkgGcjTdYMmLE
         UrvA+HtyC7naRlK7y/5z/wZMXvyOeKrMQTyKjDSCLILU2TUYLSQfwN1jOgUejauIiZKW
         5hDQ==
X-Gm-Message-State: AOJu0YzXlUntClLHHBC0HOAErZiD1R2WQQ1Zycc2W3HU+n4f9nJEq16B
	WpXKw/FzQFTqchITcl5rNb2xHt8YyiR99HpMHYQ/uMJBbqcNf7996wLLxIl6
X-Google-Smtp-Source: AGHT+IFFpzyJA4wkSBuIcoJ0AHAd6ue9agtDKX70CNOYxFQzeGDEWZkooKSkLt05b6c2suJZi51duw==
X-Received: by 2002:a05:6a20:2d23:b0:1a3:e681:29ce with SMTP id g35-20020a056a202d2300b001a3e68129cemr92885pzl.52.1711505094914;
        Tue, 26 Mar 2024 19:04:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7a27])
        by smtp.gmail.com with ESMTPSA id k19-20020a170902f29300b001dd6f305a81sm7607425plc.293.2024.03.26.19.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 19:04:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] multipath-tools: Fix build with musl >= 1.2.5
Date: Tue, 26 Mar 2024 19:04:52 -0700
Message-ID: <20240327020452.1437678-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 02:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109634

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bmultipath-always-use-glibc-basename.patch | 42 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.9.8.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-always-use-glibc-basename.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-always-use-glibc-basename.patch b/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-always-use-glibc-basename.patch
new file mode 100644
index 0000000000..0365a7ef64
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-libmultipath-always-use-glibc-basename.patch
@@ -0,0 +1,42 @@
+From 389286b25a903be62ce7f964246824fcc20c4c67 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 26 Mar 2024 18:56:55 -0700
+Subject: [PATCH] libmultipath: always use glibc basename()
+
+There is a use of basename() which expects it to be GNU version of
+basename, which is not available in other libcs e.g. musl on Linux
+therefore provide a version for such cases
+
+Upstream-Status: Submitted [https://github.com/opensvc/multipath-tools/pull/84]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libmultipath/configure.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/libmultipath/configure.c b/libmultipath/configure.c
+index 4ecf6ba4..e81cc67c 100644
+--- a/libmultipath/configure.c
++++ b/libmultipath/configure.c
+@@ -43,6 +43,19 @@
+ #include "sysfs.h"
+ #include "io_err_stat.h"
+ 
++#ifndef __GLIBC__
++/*
++ * glibc's non-destructive version of basename()
++ * License: LGPL-2.1-or-later
++ */
++static const char *__basename(const char *filename)
++{
++	char *p = strrchr(filename, '/');
++	return p ? p + 1 : filename;
++}
++#define basename(x) __basename(x)
++#endif
++
+ /* group paths in pg by host adapter
+  */
+ int group_by_host_adapter(struct pathgroup *pgp, vector adapters)
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
index df95df6f70..e9f01bd1fe 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.9.8.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=ma
            file://0010-Subject-PATCH-Always-use-devmapper.patch \
            file://0011-fix-bug-of-do_compile-and-do_install.patch \
            file://0012-add-explicit-dependency-on-libraries.patch \
+           file://0001-libmultipath-always-use-glibc-basename.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-- 
2.44.0


