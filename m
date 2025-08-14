Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8863DCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 03:37:49 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.14809.1755142666184095102
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Aug 2025 20:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bx5qjF0U;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e1fc69f86so1260896b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 20:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755142665; x=1755747465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CI56/5V1A/JyJtRjqtmkz0fI0uF4rsHq0yDEGiP6AzI=;
        b=bx5qjF0UVmxndD9+QrCk200i0PHhDU5sB7ZY0ZUtosU6cKElHMEjxeUF5WEY0sKO3B
         LhwWo1wqK2B7OawTf2ylv+9sq1KzM09ZeCslM+ukHGWxCJ/qqkP31DS38IiNqrC70H9s
         aWpASIJwUsXZF1z0bV7glEaTlL6qdS4X862MJdFzMnG/Z8T10yvYoxm5ma1uHBedvJl4
         eAny9d9K9CnBZMCpTTgT9PiCSHVAY/uUV/X62+68wP2KMi0hqRWwvuFVRVeV4jfse/b5
         WKEScCtEwjLUUcbHzBKjActrK9G/kd0jMia1aQ6lzhNay5SHOSeuRTVH7c9Szb/wzJE7
         8xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755142665; x=1755747465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CI56/5V1A/JyJtRjqtmkz0fI0uF4rsHq0yDEGiP6AzI=;
        b=g8QjogVS48oTpBazrf0ygFx0v8GFZC/ctMzQ5WDko+GnaPERWEB0GyZYH82idcP6qJ
         9Wkb0NhHXWvkMSEoobfLJFDFp9mCn+qm7sGkqTMf8rpPhc4pkAuu1KNXc7T2zVGjJSJF
         WPkvNw2LkCvU85bly8v0JMk8BSwtRRfS3VYu1GzQkPXW+HkVSgUhj5DsJ1jc6JtYd/Mx
         IP1xkVOhpaNzFUp6ovSBAZyRBNdGe0KAwa18edQxIzQ/08liqFcNhLUJNYjv7+tw7c1q
         k1SzxshZ4BZN5A9mORvhPn4s2JPHfdSk6iw3DwCm5fRChKHThEGGpnAllnVlx/Hy5rTL
         9/Ug==
X-Gm-Message-State: AOJu0YyuxNrk/BcJxl1YKPlQPX3ff7uFsQuv/AJHzmjXxPJe+nYdWsUq
	wm6SGbwtqUIINlo979PCc0QZWExlzCVZZCUeLGW7yppDdFsTuEaUTYeymVtgwEL/
X-Gm-Gg: ASbGncu/21DLjHm4JRXUTNnN7nhv+Ydo2r0QlWPuDvdMzhkawKbECe9F+pZpzJEVWGS
	bL9YZNf7MMP+Ss0yP8mVmn4WrFVqAEMs/yCRAX46A/E0QgIatdTNAml6pmBOKqpE6quAy349jqb
	YpiknfLNJ4TVj6xT0Vy3hZT343aWHE1w/AsB6B8UX+uYmrmxzT95wmD5XAnWJCPYKFuwI4FyajF
	e3PjxCcXOjVhIq6LExBONauoIJ7GNlewXSPu5m9WkrM6RMJhs+qVcFOIvk2oU6ItZi/irAxI9rR
	6E4Nmk51H0ndQ8HugOdSNhIibrPIfYVqZ9Y7Ng5i8R1O/AcmLFXXMA3bqm83zlD0uorbMiyw9IX
	OTOrRKj/rntFFI4CxkFGl
X-Google-Smtp-Source: AGHT+IFUvT4EbgWk03bjCLK1hPvIB9UnW+TW6rMUrBKwDVf6QBnxrIaW7LYpcTfs9SmFJUOsxBspYQ==
X-Received: by 2002:a17:903:1448:b0:240:86b2:ae9c with SMTP id d9443c01a7336-2445c4e05d3mr10696055ad.14.1755142664940;
        Wed, 13 Aug 2025 20:37:44 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21c65sm341892015ad.73.2025.08.13.20.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 20:37:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] ktx-software: Disable AVX on x86_64
Date: Wed, 13 Aug 2025 20:37:41 -0700
Message-ID: <20250814033742.1711651-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 03:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118927

When using x86-64-v3 AVX gets enabled by default and
this does not work well with ktx dependencies e.g. basisu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
index c7fa74c92e..21af3c493b 100644
--- a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
+++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
@@ -13,4 +13,7 @@ SRCREV = "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
 
 inherit cmake
 
+# BASISU does not work with avx
+TUNE_CCARGS:append:x86-64 = " -mno-avx"
+
 PACKAGECONFIG[ocl_backend] = "-DBASISU_SUPPORT_OPENCL=ON, -DBASISU_SUPPORT_OPENCL=OFF, virtual/opencl-icd"

