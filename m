Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB8CC38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 06:48:42 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.6747.1675147714165710264
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 22:48:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YjC4IA86;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 88so13343140pjo.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 22:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UEs49fYwq7zkQM44rIWGeiNDHg8FDAT8QZCbszc5BAs=;
        b=YjC4IA86ZI5AaKGt5xulUvsWjYgOXWo+U5HYJ/K0oL9GVvsLA0d0IQbAR9NeDq4R5X
         l1XZ2zQwIsEcQ3g7RTDIovfBerCzHGhRQFPe6ai94q+jk9uX7/WMO/hmd8ORdDqlbYyh
         q7Ite1tAZ3xvhDMxrrIQovS6YilABGsvI12IpuFWaS0Mm2LAQUeKPHfj/LVbyvm2zM8D
         af3Nx5MDQTyzheOWYc7269frkQa8I/V7DvMTiblKkJqpPz/ZwBPolX2cr1cEsps2tA/X
         YNjgStMMR0AUnA7yptdh8XjmNFrb+j1Jc7SWnxS/bxzOgUa2rJ0sZPXqloC8L1JrbYg9
         HspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEs49fYwq7zkQM44rIWGeiNDHg8FDAT8QZCbszc5BAs=;
        b=uL8LgELQCUll6Cl9+4HeiZMgU79Xco7Nfa9qtUMu1x2oB3HpMKj5u00BZt+nUGaUWx
         y9urbjiM4WrpO6gWhLTdI8b/N1GBvEFJspAEOSyd0+VPYfuDzoq2g7Xv3F+0ED6opjzg
         jmsQyhez6OXQXVCg5xanAy0zir2xwVtww0U7ZwY0Ga9Kl52oNYqjOECW8q1ddJym4C1g
         BhYeflZiHb03TpP9UBwJ0horQXBkh5AsMBxWV48PdLmhR3JhIj0WTH+cxi8BfRJbpunI
         5boEYKgj9852H2OJ26aI9PafIYrdbVmyn9ynkd8i9MDa7EiDM3czBL4+FXNZO1n8ipWg
         Aa/A==
X-Gm-Message-State: AO0yUKXxoG9T9ALnUQkKhmLQev2u883+w3VoTajR7kuS99bsaqiHzK+h
	8wNiCck2HzJnCvOSKxq1LNcF9Gcnscy6rg==
X-Google-Smtp-Source: AK7set+39Gb/ewMdlCtInmVJ6tdV2QdA0LHNXrreO0p3gpKxTFEInL+Nv91nYAFeq/3KYlNxwn5FQg==
X-Received: by 2002:a17:902:ecc4:b0:196:6a26:9c5c with SMTP id a4-20020a170902ecc400b001966a269c5cmr11682539plh.26.1675147712990;
        Mon, 30 Jan 2023 22:48:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c15-20020a170903234f00b00194d14d8e54sm8871136plh.96.2023.01.30.22.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 22:48:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mongodb: Use bfd linker for x86/musl with gcc
Date: Mon, 30 Jan 2023 22:48:30 -0800
Message-Id: <20230131064830.2011716-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100871

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb            | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 56512a2e2e..253187e33c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -74,6 +74,10 @@ WIREDTIGER ?= "off"
 WIREDTIGER:x86-64 = "on"
 WIREDTIGER:aarch64 = "on"
 
+# ld.gold: fatal error: build/59f4f0dd/mongo/mongod: Structure needs cleaning
+LDFLAGS:append:x86:libc-musl = " -fuse-ld=bfd"
+LDFLAGS:remove:toolchain-clang = "-fuse-ld=bfd"
+
 EXTRA_OESCONS = "PREFIX=${prefix} \
                  DESTDIR=${D} \
                  MAXLINELENGTH='2097152' \
-- 
2.39.1


