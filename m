Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADC8D2C12F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.19620.1730817421519622909
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BHYKxW3f;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e377e4aea3so45755497b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817420; x=1731422220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1T2msTWFvnOJ3XvK0bDD8Vl9wWFm0D0a7++v/zciD0=;
        b=BHYKxW3fuRRL9U4GllkxScHv5o49JyEKit55p7dbwOvsvT/CHZ7M5X5thau27FaaRt
         m2fJPy4/dksvUblAjQ2fsyYMobC8Se4ib1+ll/DERTYwrteWoM7gYjJ0E/TEfyvGkoFV
         2RvoqCD5Nve8omMGb4QwhqLhrG3r6nPBXEYS3Tpcev7rxBRoMLGqhemvLYhNxHL75ZAW
         djn3LRjdm19qXpCKJPGkCqLV4Jzus46A1KxhUCkiZNbeT+OQN1cSkqlUTa2AeyJ5u7up
         uxOlxpVe89gh2zR46iGS5YHCavMTpjoi6+QDKXjDUeA0b/JT7i9+hM1NC7DFPORoH5ku
         Va4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817420; x=1731422220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1T2msTWFvnOJ3XvK0bDD8Vl9wWFm0D0a7++v/zciD0=;
        b=ubhzJ+clk1RgeG61FTFDuuxDD5zGw7Ji21XQCAQlr0Hdvh1DSgrCWm81E3hBPUyZ5J
         opC4MaJcpunsxUT33PUohlHHTMDt/GbESn883nlB20p8qowMR1AgjIpdX5s+Dbl00isa
         5kvXASXeYQ/WqXiwIuaPlc9DE3Si40R7CZhJI6VGs16ziZhuR2qDYLrRGNgv77RuxlkQ
         mybyDfObF2GmS/5YhqPSRCKbaG323XC4NSdlzp0fMSZdwbt6+EzSkqZ+bxBDsfrBCgSJ
         ojsV1Kzx/3wHDqxQe/hPhINF+IGmuDKuqvJMC1ZUxpbzfBn2ier0tle9jGbyW20Tw/Bc
         pNsg==
X-Gm-Message-State: AOJu0YzmSuFdCQS+Dc3Fr3uhIRG6mzIt9NgcKlQZox+V+NvmmiLoUQun
	B8C3k7QaSsx8O4XFahcTWps20HcyQEgyUWmLC0d5kTjvRQsXpw5/fQ0rNA==
X-Google-Smtp-Source: AGHT+IEzgNkfKIowVWFQyxtQ/szgj+fqBj8bQ1XPzDVKnJrvJdgvJvpLvV3yGUYO6avcS+uo2wNYHQ==
X-Received: by 2002:a05:690c:7448:b0:6e2:2c72:3aaf with SMTP id 00721157ae682-6ea64bdcd0emr162978827b3.31.1730817420566;
        Tue, 05 Nov 2024 06:37:00 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "J. S." <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 47/90] syslog-ng: upgrade 4.6.0 -> 4.7.0
Date: Tue,  5 Nov 2024 09:35:12 -0500
Message-ID: <20241105143638.2301245-48-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113465

From: "J. S." <schonm@gmail.com>

Changelog :
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.7.0

Dropped patch - merged in this version :
* 0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch

New json-c dependency fixes configure failure.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch | 40 -------------------
 ...{syslog-ng_4.6.0.bb => syslog-ng_4.7.0.bb} |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.6.0.bb => syslog-ng_4.7.0.bb} (97%)

diff --git a/meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch b/meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch
deleted file mode 100644
index f21ad5d70f..0000000000
--- a/meta-oe/recipes-support/syslog-ng/files/0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 896d77dd949b52d6ea5798e5a038ba97d6b802be Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Thu, 4 Apr 2024 15:44:18 +0200
-Subject: [PATCH] macros: guard ipv6 code with SYSLOG_NG_ENABLE_IPV6
-
-With ipv6 disabled, there are linking errors currently.
-This fixes it by not using the symbols when IPv6 is disabled.
-
-Solves #4810 with my config options
-https://github.com/openembedded/meta-openembedded/blob/2487e65ee3842b6ae0c7a2628985be6189ed9ebf/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
-
-Upstream-Status: Submitted [https://github.com/syslog-ng/syslog-ng/pull/4880]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- lib/template/macros.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/template/macros.c b/lib/template/macros.c
-index 54142706c..fcb83637f 100644
---- a/lib/template/macros.c
-+++ b/lib/template/macros.c
-@@ -277,12 +277,14 @@ _get_originating_ip_protocol(const LogMessage *msg)
-     return 0;
-   if (g_sockaddr_inet_check(msg->saddr))
-     return 4;
-+#if SYSLOG_NG_ENABLE_IPV6
-   if (g_sockaddr_inet6_check(msg->saddr))
-     {
-       if (g_sockaddr_inet6_is_v4_mapped(msg->saddr))
-         return 4;
-       return 6;
-     }
-+#endif
-   return 0;
- }
- 
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
similarity index 97%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
index ab4a8d1825..588a38126b 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.7.0.bb
@@ -13,7 +13,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=924958cefc9f7de3e0b818832b8a1cec"
 
 # util-linux added to get libuuid
-DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native curl"
+DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native curl json-c"
 
 SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
            file://syslog-ng.conf.systemd \
@@ -23,11 +23,10 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
            file://0001-Fix-buildpaths-warning.patch \
-           file://0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6.patch \
 "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
-SRC_URI[sha256sum] = "b69e3360dfb96a754a4e1cbead4daef37128b1152a23572356db4ab64a475d4f"
+SRC_URI[sha256sum] = "b601265362c633a25f26c497a7e57592739d5a583b7963b722ff58f01b853506"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
-- 
2.43.0


