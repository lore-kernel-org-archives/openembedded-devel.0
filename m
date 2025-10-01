Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B889CCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:57 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.18453.1759326769376760144
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=meD7qlte;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso2140053a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326768; x=1759931568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMj+kElbvxv0RBoBuqNHBR/Q/ZTBrlVVUph0GNqNZX0=;
        b=meD7qltefavjW9y5Cyl0eEauNf/VBeT5CplJ/P41oYnh0vXQoebC6QYoXBqgq5Yqta
         hCVo9Qs8CP5u4gf4vUf66Ce6ZVw6WJiv/mkmQnETppJxT8TSIZSg8G2RwTfCxueF5WpR
         oVrSHhxMqC+qsoDiJ0oRy5iMEfmCcnT5CVwJggLrUuUcIL9eWxObNDCAPUB04j27J0P4
         h770y4n4WWqj7/OiGDK9IkVhsBRkAJv+JmKgYDg78m1KL3vQT9mA2xjx/vcwRk7sajbz
         v/PZ0A1H57o3bLMHqVneBlmAcj26wt2ea27cPiRiZomGawxVBRRvEXxmNas+vycDbvEL
         COCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326768; x=1759931568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMj+kElbvxv0RBoBuqNHBR/Q/ZTBrlVVUph0GNqNZX0=;
        b=JSXWWk/xLSVbLajPZONeXQ8h0bgWH9Qh5qkDly1pUnHYpxHvXT61KPUwZ2TTFCmAWe
         cYRyQPrbWMoc2zPXWM7AREH9DivxpgPfckuI0RKNKBv5eghKtGrbm4qnlBmhHwq8pZ3W
         +ZEeEmM1vy/ORR/xhOsxZA9dnHpGjM0of7gDmyXGtufihf7Aq0R7+un+NXRZmctzXqhg
         h+QaF2ZvGpmBUSuu80XouNCjCgZsQLgWxvlxLk0HNdZ9YHg48pdVy/ZveqcLWYxNlwVl
         MXpn0KxiP7vKuPrQWw0PRWj3TcXkXu1L4YVG+/FRCJrSf2Nf8LM3FR0kR5MGn/P0xuzl
         ZRog==
X-Gm-Message-State: AOJu0YxX55XT7+yJzC3fI2E2nJYESGepSlew55xZcKHV+t8diXmA77Ar
	J8/J5iHZqQwxy1K2e1WMPRSc4AVXEf6OEcKU7J4q5PJuBkUK10m+9PSWVax0Og==
X-Gm-Gg: ASbGncsDKW2sSVDn0p3cEPd7x+KNVe3NEgPceyqbFYFvb4XEJ0rPjpF9k8Ee3fFgv/0
	Qa+Wjdn0MSHQ+LzEFebvwhV2rzsFLsmwKBugVnXEgiD+KiZ0t6N8ZhdO9BPcz0GOdK1k0OdQdun
	eqdghORQrCl8gcX8mh9uqDjYLLeUzfP2qkhvbjE12x2+4oMmQJNbr/R6O19AEYVbmgGnXt65dqj
	b3Q3q6/H8J/ki750JBZnDXNRVKp3U6chXMTHKmjVhAQwKOsxigKpu4Jp7gz13b7y7DaFMMXU008
	DnjgGcAjTHaF2rKG+kbGjvJXhBAqTdX1iG583uYfRgj4vVsuy2AZWCzI28Ddyt5Zj5fJGH254gk
	4733EfFfsrPXunWT1ywkpJ5DK4mfiJ9MsnJW7KlRdUQNhasbetuKQN14=
X-Google-Smtp-Source: AGHT+IGtiMccgajdGWyEboplmweMDq2IJpoIxzeBOXtGufH7nubhfyIp/FwkBtV7D+RlHqdyolHhzQ==
X-Received: by 2002:a05:6402:35ce:b0:634:5791:605f with SMTP id 4fb4d7f45d1cf-63678ba9b6dmr3757917a12.4.1759326767631;
        Wed, 01 Oct 2025 06:52:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 04/25] libconfig: switch source to GitHub repository
Date: Wed,  1 Oct 2025 15:52:22 +0200
Message-ID: <20251001135243.1490753-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120119

From: Jiaying Song <jiaying.song.cn@windriver.com>

The original tarball URL no longer provides version 1.7.3 or any other
historical releases.To ensure reproducible builds, the source has been
switched to the official GitHub repository.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c5de36f5882f0dbaa63f88bb8f9010910cdbb9cf)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
index 6382569923..4492b406b3 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
@@ -7,15 +7,16 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "https://hyperrealm.github.io/libconfig/dist/libconfig-${PV}.tar.gz"
+SRC_URI = "git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master"
+SRCREV = "525922a6b49ca19235cdf307376e7c9c539d1b93"
+
+# needed when we modify grammar.y with above patch
+DEPENDS += "bison-native"
 
 UPSTREAM_CHECK_URI = "https://github.com/hyperrealm/libconfig/releases"
 UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
 
 inherit autotools-brokensep pkgconfig
 
-SRC_URI[md5sum] = "15ec701205f91f21b1187f8b61e0d64f"
-SRC_URI[sha256sum] = "545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7"
-
 PACKAGE_BEFORE_PN = "${PN}++"
 FILES:${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"

