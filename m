Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CE1CA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 06:35:52 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.6314.1757313347418562081
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Sep 2025 23:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfsxaAvS;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2570bf6058aso5006795ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Sep 2025 23:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757313347; x=1757918147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3YVPzZ+wOyqFKCGov08W9eAgdPR6wc4a7JYLZZS7vjU=;
        b=TfsxaAvSkj9zhxwY7OiQDQfTRLyE1K4cauOMwkB0QQ7T6i1geo9sssYXmzcdOti21E
         XNFbbHTGwSsEETU5ivGjzBdBmBS8juFq0KSnNkbmQ3FG7OcJRguiFwOBh2tyOMWxiq+T
         tgjBCVMsyUC+YDGjNJ+uhwKEnQuxgpxvTccx5XD++K4Yjh8qaeK508GahEAi+h/Rvajx
         v2OKyG86n8+/oUCZIO9V5ICP+Q1ugG28KSY7IFgPVeIZyj0Zdz0WJpoev3sW5kLDb+u8
         w1VvRXvk6UN2rNs7cpm5kGmfoNW8R38uVUvukErOukXbJwUuEXcA8L0ay1M/y9ygd2FU
         EljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757313347; x=1757918147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YVPzZ+wOyqFKCGov08W9eAgdPR6wc4a7JYLZZS7vjU=;
        b=E6wPoySI1mB5z2VyitJnPxB5ctzrKUHt8sLqs57IEscbIcZnBAQI9NGXhNee+wRc7L
         xwSr/cC8+bEHi7RZ5c4UuUZVu7OMs9oZ7IMQdKjA9fiHfhmpHhVdJl1VY1izxN+pZtiG
         ueTPVn9as0xFe3wBAk9XjhgJXYvnwkW7XcqDLGxx3O6AIKYVfsli7tG2m8DgPSqIUU7T
         Fnv0XSd7LrPIkZR4/HgwYTgGxE8JlTMhuEBeVcSj7leRfOZmTHz3zZ5nlV+rJrEb7j5N
         RqU/CcpYt2qaRNSIsSn9NetW08BpKsatE8kc/2OfndVnQ8bNyeMoGxNC6zllNAn7Unf1
         Jckg==
X-Gm-Message-State: AOJu0YxX8+roM3z/xo8tSwU5cP7mAFi6CB+Z8mhowAV7AIi1AM1OUbFO
	nLWzE4IhTiBk/ga4nJb3KR7hhfetPz+trZAKTFo1DoOuqhm0dhIdyDS5m2sxOdSN
X-Gm-Gg: ASbGncuBRHyudfUiOq3kiBYeBmzkxpd1PxfArUVi3qFI9NWMdBwz0y0ps04JDyOsdPt
	/4r8x7/ZhAMdsPkgrmfnI2X52LHlXD88TXpqDh2CziKSeZLpLguENR4IEcgBjk1zj4TP4lG+GWd
	KqFLYOItirBZWY7TCulMXupGRa0pJ30teZwqdhpguJGU1u06dAYBu8u6BD7MDhesDoNywijNfvW
	+2uj0ePQakeA5OuvpQsRUHjTAzv4XLqClsYDO0meJToAw6PQzFhjqZR6HZis2ew9KOFZqFN3Tah
	AHGoO9C+axl32W1sOJM7bLcMPpbkQIVZFH8khdKuCDIq+WoprOECLqfRGEOJSaxuRX2osTZ/pth
	CbN36wLnrPRIOpg1hwv14qErrPRw8gN3j7o/ix+iFQ97ObvwEdBFRpLQzvtiWt97I+yby1fWqMy
	RxYbrN1OICqB1ZGHun1raBb2480gDya8x+eKY7s+0WdNPXo84nGyPOtrCLAc6n+g==
X-Google-Smtp-Source: AGHT+IETUO1Omd9OyyZlm90m3g0nzrYSAdWm21n9ROe1rHqDNdiIdVupSZ85MkCH98AzwO1iapV0YQ==
X-Received: by 2002:a17:903:2288:b0:246:cf6a:f00f with SMTP id d9443c01a7336-25171cb6a56mr124070995ad.31.1757313346446;
        Sun, 07 Sep 2025 23:35:46 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fe29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b2daec2dbsm154401055ad.124.2025.09.07.23.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 23:35:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] kronosnet: Upgrade to 1.31
Date: Sun,  7 Sep 2025 23:35:43 -0700
Message-ID: <20250908063544.2864968-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 06:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119330

Drop Upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-links.c-Fix-build-with-gcc-12.patch  | 40 -------------------
 .../{kronosnet_1.24.bb => kronosnet_1.31.bb}  |  6 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch
 rename meta-networking/recipes-extended/kronosnet/{kronosnet_1.24.bb => kronosnet_1.31.bb} (90%)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch b/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch
deleted file mode 100644
index d57d0e61b5..0000000000
--- a/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a8aac8f3fd8b07fde8f5dc0aa9ece54a46d24425 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 9 Jun 2022 16:03:06 +0800
-Subject: [PATCH] links.c: Fix build with gcc-12
-
-Fixes:
-  | /build/tmp-glibc/work/corei7-64-wrs-linux/kronosnet/1.22-r0/recipe-sysroot/usr/include/bits/string_fortified.h:59:10: error: 'link' may be used uninitialized [-Werror=maybe-uninitialized]
-  |    59 |   return __builtin___memset_chk (__dest, __ch, __len,
-  |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-  |    60 |                                  __glibc_objsize0 (__dest));
-  |       |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
-  | ../../git/libknet/links.c: In function 'knet_link_set_config':
-  | ../../git/libknet/links.c:108:27: note: 'link' was declared here
-  |   108 |         struct knet_link *link;
-  |       |                           ^~~~
-  | cc1: all warnings being treated as errors
-
-Upstream-Status: Submitted [https://github.com/kronosnet/kronosnet/pull/382]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- libknet/links.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libknet/links.c b/libknet/links.c
-index 8cb1621b..0ef42b79 100644
---- a/libknet/links.c
-+++ b/libknet/links.c
-@@ -105,7 +105,7 @@ int knet_link_set_config(knet_handle_t knet_h, knet_node_id_t host_id, uint8_t l
- {
- 	int savederrno = 0, err = 0, i, wipelink = 0, link_idx;
- 	struct knet_host *host, *tmp_host;
--	struct knet_link *link;
-+	struct knet_link *link = NULL;
- 
- 	if (!_is_valid_handle(knet_h)) {
- 		return -1;
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb
similarity index 90%
rename from meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
rename to meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb
index 06b2fa4d2d..d4b76903c4 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.24.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb
@@ -11,10 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa88
 SECTION = "libs"
 DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
 
-SRCREV = "f8f80fd7f9b85f2626d2c6452612962ad8efca9e"
-SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1 \
-           file://0001-links.c-Fix-build-with-gcc-12.patch \
-           "
+SRCREV = "da73f2a1e0ffe2aee15d4f705edf90ee8445e2d4"
+SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1;tag=v${PV}"
 
 UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
 

