Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BD4CCD1AF
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 18:32:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.20639.1761071528106939193
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 11:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ipj+GtaM;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710665e7deso22727115e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 11:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761071526; x=1761676326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWRbH7wnnvhbOdUwWQIhqXmmMOp7hKMGzF4dK9xi7s8=;
        b=ipj+GtaMlX3uKWfnYkIYt1C/qiHkfJDbY2YvxcgRStubNV85Ih5mRDmJ5HWYo5PCaW
         q6N1X6yE+4XFSIKigNkAUiclu1SmppGtxkw3rDb/1hv8FelF3NdGlz4gQTN9KfgANLNN
         vQerxJREvKwJe6lRwC7N2LsoNFsbGDQlPTWPt0CgsQMS/W+DY45Av3IO6Ex3k1sW88ol
         RN3XezZv3t+rPfN8jf6uX++1Lmpu/278LvEG9TsQJtqluCDt2gtmFN1t0T1GRPS1DAq0
         47OCPocWD8WzJTVkuEuKKCKiWLEr6XgHWm/MUL4hbmdOfHxnuZvHCsnbXnDWCe3CfbDf
         1xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761071526; x=1761676326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWRbH7wnnvhbOdUwWQIhqXmmMOp7hKMGzF4dK9xi7s8=;
        b=dtAM3qpO1moZf//rwLXZ0SmvawZKcHbUYFFqV9VQ3L1qbhIPvcaA0eNsytstRhXBMw
         spO8hHG3TBt6iqYE07mvVrWhdN1dSPx3Jn+laGqZ7Jx61eAnFd0795xqtjlnHDWVtZZE
         z+xN7hKmKrn0tkxnEuyWjq41o4tO3V2WCat/XBhME1AQaBxDWSyE8JXe7li/NHcoxF4i
         ksIM1t+xnk/RqV2HrUCCVpPZ4+7iBtzcrJSDoXFZjs8UqYQrED//CdSZIRKXEqXT9EQW
         AvRgnh+x2S2Sq7E757qxQj0VfsZU8g1EU6jkgZ4fT19htO5XiagnJrvXBrBOOmJoq6mw
         TXZg==
X-Gm-Message-State: AOJu0YySX9QZIti7h9jnYWCcYGqnwiDN4h6S7OED96cReBd1zxiDAp31
	GdKzot7ZCuokae2pbNALs5APwoCZcWoslyK54YI/s4VKhRmYkBrOv/OjYO7AeA==
X-Gm-Gg: ASbGnctYX8kvcMEQzLOvnDF8fHBljfrSNjwVF5fYrEFiObKOtkOKGLrG7EblS3KQ6xq
	eVY1LT96e8bDujdJrawuD8wHwCEVC7d/8rnaQszQYbkYXiZNnuKIJHgSLxg73BL9mXYW9nuZX10
	A+0k7Nd0KTA2cw863SsB4LNcgbsygX1LIxK/T6Wij9XrC+HJoUSO3LM6ZMukKmOITJZjF7gLbHC
	BtG5MBQFGpj3zpgy/sEREvcCfUJZuDEC3/DZlY5UCr7DW7SWPDX9xJWfLojZgOBbNnixeqcbpWn
	X9prS8l7mKLMxRKtphmUy9zwbP6nfVm/Bdm2ZiRUDDe46ehImiXGyuDgZ8nYrEabY6bic7jKre+
	dMFGfzVFG2CxzJisxT+5xy/MttI/q5dd3McFu0SBQImIKQv9RxdrVjWx0VAi9KttGOkAFJwnO5l
	dVZf9TW99W
X-Google-Smtp-Source: AGHT+IHqNUX06YYkANz4XSaVxZjI6AULn0nv16QiIiWkTD/zIUWaK+WHcSy0qw0ZozmLpvdASK8dGw==
X-Received: by 2002:a05:600c:444d:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-471178ada32mr120859565e9.16.1761071526399;
        Tue, 21 Oct 2025 11:32:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496cf3b45sm20984535e9.7.2025.10.21.11.32.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:32:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/6] squid: patch CVE-2022-41317
Date: Tue, 21 Oct 2025 20:32:00 +0200
Message-ID: <20251021183204.269102-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251021183204.269102-1-skandigraun@gmail.com>
References: <20251021183204.269102-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 18:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120842

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-41317

Pick the v4 patch referenced in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../squid/files/CVE-2022-41317.patch          | 26 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.15.bb       |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2022-41317.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2022-41317.patch b/meta-networking/recipes-daemons/squid/files/CVE-2022-41317.patch
new file mode 100644
index 0000000000..a77f73aead
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2022-41317.patch
@@ -0,0 +1,26 @@
+From 745d5d5a6d10731656adfc2b1b4d16ef208dd073 Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <yadij@users.noreply.github.com>
+Date: Wed, 17 Aug 2022 23:32:43 +0000
+Subject: [PATCH] Fix typo in manager ACL (#1113)
+
+CVE: CVE-2022-41317
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/2c5d2de9bdcd25d1127987f8f76c986ab5bfb6da]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/cf.data.pre | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cf.data.pre b/src/cf.data.pre
+index 4aef432..f15d56b 100644
+--- a/src/cf.data.pre
++++ b/src/cf.data.pre
+@@ -1001,7 +1001,7 @@ DEFAULT: ssl::certUntrusted ssl_error X509_V_ERR_INVALID_CA X509_V_ERR_SELF_SIGN
+ DEFAULT: ssl::certSelfSigned ssl_error X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT
+ ENDIF
+ DEFAULT: all src all
+-DEFAULT: manager url_regex -i ^cache_object:// +i ^https?://[^/]+/squid-internal-mgr/
++DEFAULT: manager url_regex -i ^cache_object:// +i ^[^:]+://[^/]+/squid-internal-mgr/
+ DEFAULT: localhost src 127.0.0.1/32 ::1
+ DEFAULT: to_localhost dst 127.0.0.0/8 0.0.0.0/32 ::1/128 ::/128
+ DEFAULT_DOC: ACLs all, manager, localhost, and to_localhost are predefined.
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index b79f632508..4cb21187fc 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://CVE-2023-50269.patch \
            file://CVE-2023-5824.patch \
            file://CVE-2021-46784.patch \
+           file://CVE-2022-41317.patch \
            "
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"

