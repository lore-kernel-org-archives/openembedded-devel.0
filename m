Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7BDC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.68628.1674717462111039724
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n6Ol9h6d;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso978019pjf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYLi6wHySElPQmaAY4tpSi3n0NlPDmZGWMJAOUvnr/U=;
        b=n6Ol9h6dR3vny7eLQ+yecvyqY8Ft//PKR4n8hdxTAYoV3QSJS1U103tVa8ESqyd0MY
         x+o/msnsJQSvpeAeLiyMcalqooHa7ikz6ib72Ko1HlxaFcO1XnCDCNSyvdi7VBbglCGI
         9pl1QRvuRLQCs4bZFM9QemkkK6WEIKMSYwLbKljY1tqJy8HJWjhf+Lm7NiilKYeck+TD
         eVDkzGNKxPr62dhsT7aq/pdpen101yC7oyTzU5m/tG+LuvTrHDJyG71/ZssDIFHLJqTI
         Le6CSvZDVRk4OBaF89gnq3tBLM07G1AdDlBW2l4/ifP4WM9MaPLL6uwLk9J5eMI37iHO
         KTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYLi6wHySElPQmaAY4tpSi3n0NlPDmZGWMJAOUvnr/U=;
        b=LU/+Fs1qztyVPQE/inzmyEbjLUjoQN4dy+MzHj2cpOm95stcPmxvMEk+tKHWsp1BJr
         hfp7s5ZTUyVzKxJCkx69AmuCD8Z5G5+qn/VO/zA9GxwNV4SltYpvN6vSpABjuXpK8DXK
         pd7MNX/E0Dq7lFemeiO7m/xdvpd4/x7ysxhW4ZRyydgHEZcwZevSm6Rg4iZeAaYbgP7f
         TTRL4DA6fMBnwymLEWpGZU9EssLWaQFtSrZ+WfpaysqVAyysa6fqzGRP2CTyAO2TF6Ks
         yoPDzDgCuvmemE8oJYf7CPytU4qhYSUe9Y/tsFHLYzQONpD7YUaxAsGjTq9aKO1sG4Rp
         lvMw==
X-Gm-Message-State: AFqh2kotrStwNXTFr53l2qBpG1C88UVZmW5DeKdHfHeBPq8s640nwrbD
	FLPkqkQj0ArDRHL68trUdX815kz/+TqBZg==
X-Google-Smtp-Source: AMrXdXtgSxv4DdJmScU/rmKsRL1U3cqnLagfR6iTJtTLLVtIhvm9W3slr/YjlZBYmqfYR3PrRJaX2w==
X-Received: by 2002:a17:902:bb87:b0:194:7532:fb31 with SMTP id m7-20020a170902bb8700b001947532fb31mr33958999pls.62.1674717468568;
        Wed, 25 Jan 2023 23:17:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/13] dbus-cxx: Upgrade to 2.3.1
Date: Wed, 25 Jan 2023 23:17:34 -0800
Message-Id: <20230126071735.2444745-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100794

License-Update: Swith to new license [1]
Drop upstreamed patches

[1] https://github.com/dbus-cxx/dbus-cxx/commit/efe8d3587104bcd748d990da8b86de9e3ef9a0ed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{dbus-cxx_2.1.0.bb => dbus-cxx_2.3.1.bb}  | 12 +++----
 .../0001-Include-typeinfo-for-typeid.patch    | 29 -----------------
 .../files/0001-include-utility-header.patch   | 32 -------------------
 .../dbus-cxx/files/fix_build_musl.patch       | 12 -------
 4 files changed, 4 insertions(+), 81 deletions(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.1.0.bb => dbus-cxx_2.3.1.bb} (53%)
 delete mode 100644 meta-oe/recipes-core/dbus-cxx/files/0001-Include-typeinfo-for-typeid.patch
 delete mode 100644 meta-oe/recipes-core/dbus-cxx/files/0001-include-utility-header.patch
 delete mode 100644 meta-oe/recipes-core/dbus-cxx/files/fix_build_musl.patch

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.3.1.bb
similarity index 53%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.3.1.bb
index bf1220788e..7af62b7418 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.3.1.bb
@@ -2,16 +2,12 @@ SUMMARY = "D-Bus wrapper in C++ for dbus"
 HOMEPAGE = "https://dbus-cxx.github.io/"
 BUGTRACKER = "https://github.com/libsigcplusplus/libsigcplusplus/issues"
 SECTION = "base"
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4cf0188f02184e1e84b9586ac53c3f83"
+LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https \
-           file://0001-Include-typeinfo-for-typeid.patch \
-           file://0001-include-utility-header.patch \
-           file://0001-Include-missing-cstdint.patch \
-"
-SRC_URI:append:libc-musl = " file://fix_build_musl.patch"
-SRCREV = "73532d6a5faae9c721c2cc9535b8ef32d4d18264"
+           file://0001-Include-missing-cstdint.patch"
+SRCREV = "898f6ea8f7ffe454e81a9337002df555728d4199"
 
 DEPENDS = "\
 	dbus \
diff --git a/meta-oe/recipes-core/dbus-cxx/files/0001-Include-typeinfo-for-typeid.patch b/meta-oe/recipes-core/dbus-cxx/files/0001-Include-typeinfo-for-typeid.patch
deleted file mode 100644
index 9117877403..0000000000
--- a/meta-oe/recipes-core/dbus-cxx/files/0001-Include-typeinfo-for-typeid.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e262b6e7cc6271d71405f10c4817b9b3b2b95f05 Mon Sep 17 00:00:00 2001
-From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
-Date: Mon, 13 Dec 2021 02:00:48 +0100
-Subject: [PATCH] Include typeinfo for typeid()
-
-Otherwise fails with:
-    error: must '#include <typeinfo>' before using 'typeid'
-
-Upstream-Status: Submitted
-[https://github.com/dbus-cxx/dbus-cxx/pull/83]
----
- dbus-cxx/demangle.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dbus-cxx/demangle.h b/dbus-cxx/demangle.h
-index b71bcb9..9a4e99b 100644
---- a/dbus-cxx/demangle.h
-+++ b/dbus-cxx/demangle.h
-@@ -21,6 +21,7 @@
- #define DBUSCXX_DEMANGLE_H
- 
- #include <string>
-+#include <typeinfo>
- #include <dbus-cxx/dbus-cxx-config.h>
- 
- #if DBUS_CXX_HAS_CXXABI_H
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-core/dbus-cxx/files/0001-include-utility-header.patch b/meta-oe/recipes-core/dbus-cxx/files/0001-include-utility-header.patch
deleted file mode 100644
index 0c8262af75..0000000000
--- a/meta-oe/recipes-core/dbus-cxx/files/0001-include-utility-header.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 63170cfcfbf483716ce2599e165db80713fc2706 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Apr 2022 06:47:19 -0700
-Subject: [PATCH] include utility header
-
-Needed for exchange from std namespace
-
-Fixes
-dbus-cxx/variant.cpp:135:25: error: 'exchange' is not a member of 'std'
-
-Upstream-Status: Submitted [https://github.com/dbus-cxx/dbus-cxx/pull/98]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dbus-cxx/variant.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dbus-cxx/variant.cpp b/dbus-cxx/variant.cpp
-index bcf2684..97b622c 100644
---- a/dbus-cxx/variant.cpp
-+++ b/dbus-cxx/variant.cpp
-@@ -11,6 +11,7 @@
- #include <dbus-cxx/dbus-cxx-private.h>
- #include <dbus-cxx/signatureiterator.h>
- #include <stdint.h>
-+#include <utility>
- #include "enums.h"
- #include "path.h"
- #include "signature.h"
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-core/dbus-cxx/files/fix_build_musl.patch b/meta-oe/recipes-core/dbus-cxx/files/fix_build_musl.patch
deleted file mode 100644
index e55d987e43..0000000000
--- a/meta-oe/recipes-core/dbus-cxx/files/fix_build_musl.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git a/dbus-cxx/sasl.cpp b/dbus-cxx/sasl.cpp
-index e8a6060..7a76af6 100644
---- a/dbus-cxx/sasl.cpp
-+++ b/dbus-cxx/sasl.cpp
-@@ -70,7 +70,7 @@ std::tuple<bool, bool, std::vector<uint8_t>> SASL::authenticate() {
-     bool success = false;
-     bool negotiatedFD = false;
-     std::vector<uint8_t> serverGUID;
--    __uid_t uid = getuid();
-+    uid_t uid = getuid();
-     std::string line;
-     std::smatch regex_match;
-- 
2.39.1


