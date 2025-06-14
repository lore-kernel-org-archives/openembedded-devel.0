Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39601C71141
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 09:27:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.6964.1749893249384212846
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Jun 2025 02:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TI7yEkwd;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so22513395e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Jun 2025 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749893247; x=1750498047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFyi8ZxoXku7r8QUmUUahdnBPCqF7dTlOuSqhZ8OQ3w=;
        b=TI7yEkwd9RKB7kR5uPvCcrnO877YKVu30ZKWE+BtLHodvs3ICZzsyNMxHAHoVHMCLn
         RdnAYNT9fpmsJb2aaVQztMHgwbII8QHXi7W4H/lAOgR3hBs1hhuo36/+fzFsfdvm2oi0
         6HZMR8Za6uigLT+YxKrLMR/+625rqp5ImPg0z3o2YLx/F/UOkVL8BTqal8l44MGrSmL3
         OY6PIEhbvxcTD1SqyFj8JLReDnuf7Nmr2bqn1suKKLMLF9V8XjtL2GzWWpWViYUZ4pxS
         sMFI6elkj2F0Wk97Kgy72ASrBi+cUwLnOIZ2kDdP1hGFjyLMOYEjq87OLgWojGEF8545
         V85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749893247; x=1750498047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFyi8ZxoXku7r8QUmUUahdnBPCqF7dTlOuSqhZ8OQ3w=;
        b=fvh+KQJzWLu2yHB9h6fwz2oVkSe02+pxwOA12coP/3ONJZ87iD5cQfgH5gfgp+rtAe
         yjUAXktmQNuvqGsxjCv/vb4QjZIokCOIAvyJY5e21pjwBgS8DwdvnTjlklgLDMFK+UQj
         UOu/SsyLSwj/nTPki8Iyry4YLhj93tznyp3x8CdttGVdXDgTBBeMzxa9Jd4s9dz4P6Pf
         kIjhnUwl7cwfHtlSUO0FWGa4Oq15GsOziPA2NP0qVegG3/XCORHqkEWk3RI14c2dSG6m
         kNl2uJWUKkrf83mXRfXZCKRWoSICegyuDyEcxiVZ/UIh1ETHPX1DY5cTdsNOio0dkq5y
         AbZg==
X-Gm-Message-State: AOJu0Yxcvl4fvAGjXhvxRMcLMJvVeGNfYDxwx2jQ1oE3GabUAurnX1xg
	ZKB9rX83UrtZA/UHJJo9R4DYjR83Ubp1V+drgye9gseCtV3Y/suw7ETB7Bel3XCz
X-Gm-Gg: ASbGncvxcHHl+EnK2MSlEjY9uOnLMedUDW7q8B2IXg5IYA8mKYDhHNv2a0fItKln0on
	jTbZagJWp0rHliwq+mHwFzzIQhWvU6jemrw8DtQeQWPrE0cIY1RRnpzDWTmY/JXum4sUe2h9G/j
	bJC9A3MonAqQX5CmXIn76OiE06QvqRkRoQdxQZXogWFwCuaLp4ka9uPDS16K6+Ar7BFxLlJVi1j
	hyOIvhhYyiLG2eKzt8o41+kmbCWwOovUnWNhQ/sg5PmHDOrGOYo+oLktBItdaYqYzS19AK1yYKt
	L/o6alar1Q/EXCLg2/7sbSeW+LAF8yIbtYm8BWsj/a6/vh7Ci7oFY0WPItyUQeMHluTNYl79K6h
	V5+gWvqXfE2I/1Ncme4csx6xJgcTs
X-Google-Smtp-Source: AGHT+IEeF/x/seEluk2M9NcTJO1ggKsP9vpVefo+a3tERzlBGZc1pYNS+o4vDbMUkjr6OnpU2Gh9Kw==
X-Received: by 2002:a05:600c:c16a:b0:450:d614:cb with SMTP id 5b1f17b1804b1-4533cacab63mr23877435e9.33.1749893246962;
        Sat, 14 Jun 2025 02:27:26 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73966sm4801455f8f.34.2025.06.14.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:27:26 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 2/2] libcoap: Add PACKAGECONFIG[wolfssl]
Date: Sat, 14 Jun 2025 09:26:36 +0000
Message-ID: <20250614092634.149312-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250614092634.149312-2-alex.kiernan@gmail.com>
References: <20250614092634.149312-2-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Jun 2025 09:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117911

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
index 9e88b1af46be..2793b900fe5c 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
@@ -23,13 +23,14 @@ PACKAGECONFIG ?= "\
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
 "
 PACKAGECONFIG[async] = "--enable-async,--disable-async"
-PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,,openssl mbedtls"
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,,openssl mbedtls wolfssl"
 PACKAGECONFIG[manpages] = "--enable-documentation --enable-doxygen --enable-manpages,--disable-documentation,asciidoc-native doxygen-native graphviz-native"
-PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,,,gnutls openssl"
-PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,,,gnutls mbedtls"
+PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,,,gnutls openssl wolfssl"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,,,gnutls mbedtls wolfssl"
 PACKAGECONFIG[small-stack] = "--enable-small-stack,--disable-small-stack"
 PACKAGECONFIG[tcp] = "--enable-tcp,--disable-tcp"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,cunit"
+PACKAGECONFIG[wolfssl] = "--with-wolfssl,--without-wolfssl,wolfssl,,,gnutls mbedtls openssl"
 
 EXTRA_OECONF = "\
     --with-epoll --enable-add-default-names \

