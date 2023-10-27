Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AC3C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:02:57 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.9148.1698418972317244331
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 08:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ib5rVFkY;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so32636581fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698418970; x=1699023770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ahh3jI4jSLvoKKwImY8vrO2Kmv7t3000UT54Decb30=;
        b=Ib5rVFkYvOVXuGy1k4mhI4v5zx+IssAgK/nzgNwCHeuohrHmnYxT2EhR6ot8F6fgc0
         exafMiafPep+vLOXVt3flFe4A0UPt3Z6fmlLXM4NmkOO9DAi69FkWtwy9EnOHcEp7OHy
         2UaORre12LtyXoLb/BcbsnxePeo8d8fJnsQMjG6z+NDGQfEPNbwWuQs3whssYXBNBMQm
         Lk6+Wrk1xo9hj8VVlSiwnaSgzhpgWNZFZJ2r4BWHbvvrkOUk8RQjckxP7vlysnKD+dVH
         lHoWaCTyB+I6dDJHtD84Q9GlgDu79IiDeUZ9XrP89qJNfKgZ2deNZ79xD1WnNRQSZtWD
         puSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698418970; x=1699023770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ahh3jI4jSLvoKKwImY8vrO2Kmv7t3000UT54Decb30=;
        b=D3I23du6waAihus2ac7d4hQMvuEqO6NtMvaJW4TAf5Pp/2VCutXz5p9ShX26DIO24F
         0LISjMCqD7Qk1XVY95X30+5gFRaEZoQcLvdnHVJLjgiPv/97pApWc7wHxMPO+5FcblC/
         a83q8eP7HXN8v6YJwEY9p3EzX7iUKuAJvO+f8h6x7M2oybXtUnis2oEI3Y9usWYLFQf3
         8h5CSMujxshfZeYBbeuBvHXYtJ24OFnl2N1egEOi8KEAus9HgMOIxXHWW7L3GMUsIGBg
         S0UEInF7KsOdpNlUPmLs1gpZN2uwhDKxugOUx1GkqNz+p4BGyTkK8CTFzwSLx3h5BUQ1
         D3ag==
X-Gm-Message-State: AOJu0YwfSfyy/8d9sOVKyDG+Udw6JibMAuYiSmj7HYrqcAT4sQbN5ouq
	0eBJHggd4jQlkdfB+A/BVimR9jV98lI=
X-Google-Smtp-Source: AGHT+IEsQFusAXKdK0Iv3Jdn99Nba56LWYb4Np4BCma1Xu33t0m0URR25v+e90xaCkr8QY47A1qq6Q==
X-Received: by 2002:a2e:3816:0:b0:2c5:8a0:b502 with SMTP id f22-20020a2e3816000000b002c508a0b502mr2260341lja.48.1698418969819;
        Fri, 27 Oct 2023 08:02:49 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id bg38-20020a05600c3ca600b003fee8793911sm1816287wmb.44.2023.10.27.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 08:02:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] connectivity: add pcapplusplus recipe
Date: Fri, 27 Oct 2023 17:02:44 +0200
Message-ID: <20231027150244.231022-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 15:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105776

Add PcapPlusPlus 23.09 recipe.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../pcapplusplus/pcapplusplus_23.09.bb        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
new file mode 100644
index 000000000..90f18b7aa
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A multiplatform C++ library for capturing, parsing and crafting of network packets"
+HOMEPAGE = "https://pcapplusplus.github.io/"
+BUGTRACKER = "https://github.com/seladb/PcapPlusPlus/issues"
+SECTION = "libs/network"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
+
+DEPENDS = "libpcap"
+
+SRC_URI = "git://github.com/seladb/PcapPlusPlus.git;protocol=https;branch=master"
+SRCREV = "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGECONFIG ??= "shared"
+PACKAGECONFIG[zstd] = "-DLIGHT_PCAPNG_ZSTD=ON,-DLIGHT_PCAPNG_ZSTD=OFF,zstd"
+PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF"
-- 
2.42.0


