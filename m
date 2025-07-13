Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B410C83F21
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 06:31:01 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.52283.1752388235774718753
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 23:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b6rg63Aq;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso3675809a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 23:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752388235; x=1752993035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT9Ba2wVdRJhzrZ8S0XNid6fkZQg0k0TCatueWlV9FQ=;
        b=b6rg63AqlALtTGd3iG7L3gFXJAJ5VbgSY2KblCk3iKM18+BN6iY8rN8mJ3VW+69i6h
         DzrskdhmmUj/8dNbxC+tiS5qW+f4iof/TCV8Kz7lWX2yYRf4nHIrqgWuvb5p+A2qzThJ
         B71xwjm4bTRfxbw0ombae58PUCLZEXcnQlPku0HC39KsqfaeRhu2bbuVoCSuhAmxSyen
         33CKdp9yQpMX6F0OBnKUS2kqhGI54zoWIHRjZm17PwK2teVbtC1YMW64NYLyiOViAbrh
         cX7R/PHAhpzcH2aBsqCbLG1eeuS8tJ0Agvq7rzzjU/TIMg5aKoQHr6iChFA0Zw2EG+DU
         5UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752388235; x=1752993035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT9Ba2wVdRJhzrZ8S0XNid6fkZQg0k0TCatueWlV9FQ=;
        b=qeasYM4irYQhhSw98xue4HDff3rZ9S3nM+yb9h+z4VwYcA5OjwDGb8qJM9/VI1MPkF
         4OghUAp1ikfNJe6gQ9YOa0EJ1eOq1W159YNNr1QAexgiqJSv65PxVchqpwTcnifq1CsO
         wTFm1DuzobSAO1j62Vhfmjavb6WQsiDJo/Dpj4HRON6dQl5QpW0lppov5ozvvNPvYoaw
         eDmQnaqd2gpvOX8F849aVdUuqv7eKw1JMSZIntgG/qlBqQsne0Q7wYOYklKmQGswreB3
         tQLE+pm/sRA8i2FSBdh/x5Q/7SYXCl7VCiSf17edhvQFyBRVhoIe1EHOjh2RHtM1SZF7
         +l5Q==
X-Gm-Message-State: AOJu0YwUE3sUdPTA1P86xbnx8VfZKHiKlnksm6lLbYS7C/9+nAncWyLz
	xRZC4gnLusolUmCXoKPx5+AQFZ32eZNILIHvlBoyqvXZI8JKtU1S+boY2AQ2Lt/v
X-Gm-Gg: ASbGnctnr4wdjbgoS2vpo2iCCbjBN7eDYcq30iQsQ7s9OSf7YRIvPMaceMtODBxh5fR
	QSpM+YmPPMgGGe0F1/vqQDnVU5r444554nfwUvh5vEozLqHZDCVPcgpbDRay2tcB/pOy3SVRCOO
	ixLlxPN5CZxdE5dNHzwd31YHaoQDX+Nix7vurtabrQ0xD0nRDzg3HXJTykUBnSA84fewYOeQFv2
	T2BjkTlGr2iuNn1cwgJ+yH1JMBoSvLETsDS4CvdD7nfUZQzBkwBVmeVV9La7J41A/IEyp5URTbn
	xTUZsQzXDBSgChLISFE9RT/364rdy2+hSjBM37Ie5QffDgeq0KIHRxq1SaBM68P0cy3p44Knmca
	pQWuHEmEuV00L5g==
X-Google-Smtp-Source: AGHT+IF2ny/7rHVezSf55H5jjQBJfSyuQB+tkZl7+HaZgYZP8wWOd36x7+y5YA/TqBh3nz9ABsVSQg==
X-Received: by 2002:a05:6a21:6004:b0:225:defd:26f0 with SMTP id adf61e73a8af0-2314937873dmr16445596637.32.1752388234769;
        Sat, 12 Jul 2025 23:30:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bce529689sm4928927a12.52.2025.07.12.23.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 23:30:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/7] ot-br-posix: Update to latest tip on trunk
Date: Sat, 12 Jul 2025 23:30:22 -0700
Message-ID: <20250713063023.3538218-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713063023.3538218-1-raj.khem@gmail.com>
References: <20250713063023.3538218-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 06:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118499

Fix build with cmake4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ot-br-posix/0001-Musl-build-fix.patch     | 27 -------------------
 .../openthread/ot-br-posix_git.bb             |  6 ++---
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-Musl-build-fix.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-Musl-build-fix.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-Musl-build-fix.patch
deleted file mode 100644
index 108ed76b30..0000000000
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-Musl-build-fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 502aa4ab4bbc790fb2999ff2b5f10dabd7085190 Mon Sep 17 00:00:00 2001
-From: "deepan.shivap" <deepan.shivap@lge.com>
-Date: Mon, 2 Dec 2024 23:12:17 +0900
-Subject: [PATCH] Musl build fix
-
-usage of getaddrinfo_a creates dependency on libanl, which is  specific
-to glibc.
-
-Upstream-Status: Pending
-Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
----
- src/posix/platform/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/posix/platform/CMakeLists.txt b/src/posix/platform/CMakeLists.txt
-index b4ac241f5..7b2028e45 100644
---- a/src/posix/platform/CMakeLists.txt
-+++ b/src/posix/platform/CMakeLists.txt
-@@ -175,7 +175,7 @@ target_link_libraries(openthread-posix
- )
- 
- option(OT_TARGET_OPENWRT "enable openthread posix for OpenWRT" OFF)
--if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT)
-+if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT AND NOT OT_TARGET_MUSL)
-     target_compile_definitions(ot-posix-config
-         INTERFACE "OPENTHREAD_POSIX_CONFIG_NAT64_AIL_PREFIX_ENABLE=1"
-     )
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index 576c316ec3..d0b4f81a4c 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -7,18 +7,16 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=87109e44b2fda96a8991f27684a7349c \
                     file://third_party/cJSON/repo/LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0 \
                     file://third_party/cpp-httplib/repo/LICENSE;md5=1321bdf796c67e3a8ab8e352dd81474b \
-                    file://third_party/http-parser/repo/LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778 \
                     file://third_party/openthread/repo/LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     "
 DEPENDS = "autoconf-archive dbus readline avahi jsoncpp boost libnetfilter-queue protobuf protobuf-native"
-SRCREV = "fe5855332e8f804944d737c65b75cf9a89c35e77"
+SRCREV = "7142b740479e50f6f2c2a91a369b9c36e024fe0d"
 PV = "0.3.0+git"
 
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
            file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            file://default-cxx-std.patch \
-           file://0001-Musl-build-fix.patch;patchdir=third_party/openthread/repo \
            "
 
 SYSTEMD_SERVICE:${PN} = "otbr-agent.service"
@@ -57,8 +55,8 @@ EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DOT_REFERENCE_DEVICE=ON \
                  -DOT_DHCP6_CLIENT=ON \
                  -DOT_DHCP6_SERVER=ON \
+                 -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
                  "
-EXTRA_OECMAKE:append:libc-musl = " -DOT_TARGET_MUSL=ON"
 
 RDEPENDS:${PN} = "iproute2 ipset avahi-daemon"
 

