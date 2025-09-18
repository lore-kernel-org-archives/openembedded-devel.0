Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5586CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:24:02 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.11626.1758194635587813066
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ixfVNGFA;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0787fdb137so125660166b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194634; x=1758799434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIVvwa9SeJ1MlaK34NUplwbHfyKPHhZV2n/y8FwQ1oE=;
        b=ixfVNGFA90Myq4k3BBb7z1pM+kjyMZ8NyEpRuUtIj4vzc0a5/jq3NxVKna7f9HMLlK
         Sww9G6+Rev7vnMM6Fp3Q5O2qQHMDpoOZMRQXexS82CytweR7i5YTAqDMwuogGbVwScWw
         eBj7xBky1txDxp1FkX+rjw/lqsbByicMHJNY45EDcrlptDWmsXDjTD1luoe0BO9Qp91F
         jAZ9ThL9UHau8bbjGK0rvXIonRNg6tpRs5Gtdh/EpyHlihCNa0n7yFIzX5lcZ3RSykKx
         SlcIfBPqD7Vp3h6gixnJst6oFqmaBs62Gt1TCJnMD9LBl6RpIdbdXpv6BYLHA+94dD29
         pLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194634; x=1758799434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIVvwa9SeJ1MlaK34NUplwbHfyKPHhZV2n/y8FwQ1oE=;
        b=b83jgTQi0H6VJMpjPwGSrerRi3wWe6qd0SuGUgqce1/5qRyr4wRtQyW5g6iFAs4BPi
         P9Ta3jeYEubnNojKBomv1Orn7RNmyotyAfP/DQIG/iBzULECrqbGpdHuzjpVJ2r9NR0i
         kjlOomA4+i+4WmAsSndc2TqpgPGQmiDA49kNVCCFGTUJnP0PU6J57AI0is+BJuvTv/HQ
         yMNbVREXwHpqiUFv9EDaDkXB7FlMYRV1Pf4m7TlSfwFMys1KryjTNix/iqTuadXKNN3F
         81Gw/fB83mWgIM8EZXjPHx3+ZSc2lEekRo6S4NaOCGP8SX0Ywk2ZWKMNGzd0HIV3rPQx
         UQTA==
X-Gm-Message-State: AOJu0YwSPb+8H7CPwQQGi74uSJIaK2A3zLmf+yPTn6rMcDMxb9j/zeqa
	iVxIdLjBpZqWumdHObBLt0UvT2jnlRorCE63GKKMsWaAgrfOUZWAbp93FwfFkg==
X-Gm-Gg: ASbGnctPbB+ojN66YeUR9gTS1xuldMsmCQ8vzjGdGMfCmMNlzzdJRMxul45ENdYVe4u
	YNWr7XTcIojwcX2iuZh6QpHmaRwpAOnXAAGKmYKGFMyG+lxlVuDAIQMs5wbRxHPYl2hjoLRY3UF
	5Uq7ngi7BUx2QW7g9TGO7MYvOnT8r0Q0kYsv5WY+Tx/iNSN9bxElD1tvMyWR1eJZ0zKqxDDbhfG
	94q1rK09ZcTrlMczRoIGN73cJw54F1yMleYYvDDoJKjKv/n5ijh+Da9NADVUgqH4wpOwlvotke7
	Cb3ekNcetPTIxaHG+chs5sSuEqeBQbEEnwLqDhhM+ilbdLLKvMPPsbKTxFGHRzUShzmQo8SbAdU
	LqjoE/w3V3yIl9dtXN2GGRA/BTW41Y9AViHSDsno=
X-Google-Smtp-Source: AGHT+IFGXbu5o3n2WmRcfP2asJh6UcI6ctgUwInu84ucA/zdJX3JUJ1yLGBw6BwiqPsUvgO+VcNJMw==
X-Received: by 2002:a17:907:5c1:b0:b0e:8cd4:e2d3 with SMTP id a640c23a62f3a-b1bba0036f1mr532506966b.19.1758194633859;
        Thu, 18 Sep 2025 04:23:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc75ac5e1sm180410366b.43.2025.09.18.04.23.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:23:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/10] avro-c: upgrade 1.11.2 -> 1.11.3
Date: Thu, 18 Sep 2025 13:23:42 +0200
Message-ID: <20250918112347.1331393-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918112347.1331393-1-skandigraun@gmail.com>
References: <20250918112347.1331393-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119567

From: alperak <alperyasinak1@gmail.com>

Changelog:

* This is a minor release, specifically addressing known issues with the 1.11.2 release, but also contains version bumps and doc fixes.

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e1552304bf3cd1abc403dd8cd1b4ed5cd646c64b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/avro/{avro-c_1.11.2.bb => avro-c_1.11.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/avro/{avro-c_1.11.2.bb => avro-c_1.11.3.bb} (88%)

diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.2.bb b/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
similarity index 88%
rename from meta-oe/recipes-support/avro/avro-c_1.11.2.bb
rename to meta-oe/recipes-support/avro/avro-c_1.11.3.bb
index 9b6a52e2e2..14a3cbe462 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.11.2.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"
 
 BRANCH = "branch-1.11"
-SRCREV = "44d1c4f221ccc4571a4b4b9edb023ed1e89354b7"
+SRCREV = "35ff8b997738e4d983871902d47bfb67b3250734"
 SRC_URI = "git://github.com/apache/avro;branch=${BRANCH};protocol=https \
           "
 

