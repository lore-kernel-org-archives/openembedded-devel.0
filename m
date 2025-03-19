Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD6AC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 19:41:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.3764.1742413285992262054
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 12:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q2pAzM0n;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224171d6826so55337885ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742413285; x=1743018085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVQ1FIAI7RNJihDgFm7We3YOkvx1+pRW7fiADwkSTM0=;
        b=Q2pAzM0nebT8XNmm5+yqhbOL7URPRd+5/i/gu2uA7iouHF9koXBTfPcPNMitUZPlIh
         uisUmFlqmgDbBTztj7UV3PYXTuV9OrFGI0PBeMQdTJm4LuXYa3eF/7fItpTf8jDWA/xc
         Vpb4LBzSznF0Djnhf7S3sl2xWBs5QIk7E8EkC/sw6ioK/8rYH5ULUN1FemrVBHmHIGv5
         95I10lA2Ejd/5H20uUhPnOdObH1MS84nQoA3rKR33hy8cKmlfqJyGJ9P2G+/kGE7acDa
         Fr7f1hxOY4RYWbj6k9VlRyJsZptKEU6VOprA42t7JyHIrlIJ/fvQG3xlAmylvmDQpWGJ
         qNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742413285; x=1743018085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVQ1FIAI7RNJihDgFm7We3YOkvx1+pRW7fiADwkSTM0=;
        b=BRdaTmeNxlFDIrteWery04iS8CMYL/9Kez597bIoNFOQTpjs6+TQE2UrjIJW6XOXVy
         ptHvSAbTSQLOb9ISzpCeyKDTJgBKSf7SMBvcA0wfg8VW7O6p1tpJb4A/GUEgJfzTGZdd
         uCNJ92PprFrRL0ZSdMqf+69nMfC9gfwWj1e3g3Yl2h/386rE8ztthcfjXOG8k6Z3ezH2
         LZYErZayx2/evOFud3mOifTPSGfKj4vg4KhkK4fEc+7OqNTCPJrhnLtse4FyfNiVtQzc
         CtOZIWUsfYBwpLENO+r/w+SbxtSAif/ZUbb8L584Piz2sYBcj/5y7dXlEQLQRvEtbAcl
         GcQg==
X-Gm-Message-State: AOJu0YwbsTmgV7bDVP8Hjgt5t5KkB62OiFCSZzkRvk5nZmc6lKOxgA64
	yL7cEalv5SO7pEc7vc2CZFPXW9iPUFBxODGX5aNQfyfm2ZUNv1Vy0zsnpyel
X-Gm-Gg: ASbGncu/XBWn+f2LC0YMaMTZVet/x6quvurifhAWIHer2hYv7RqRsVgcwsstcNrTGZI
	VTvbzUcnlLrt3yDR1XYDYOpcKvZBvVzpWaCuQ8cbjAhrdGp6bb3/ezwaSHlPVuTNncZrEftqKTF
	KUTwH9g96dH5aPPPqNUL2+pJNvoo8fACeJIV6uU5lwmnuuWVfjEbA4z1erTm2l4XwDv3xtTB3e5
	orSqSSN8mZrbm/cQpYGyYNW0SrZJCnxJq011EyHfxfD+0EbtdH6vTqa5YvkIhN+M47lguxRZwGM
	/GEUl2K+TnlQgvkUvtv8IzhxpvG8T9mH/rOa
X-Google-Smtp-Source: AGHT+IEBt4vy5j1Fn73qrwkD9T0eq4ZjyeSPXfgwZjolhH5XXpwOa8rfnkOLiz5GgLmCAIJj3RmrhA==
X-Received: by 2002:a05:6a00:3a12:b0:736:46b4:bef2 with SMTP id d2e1a72fcca58-7376d60009dmr6033153b3a.6.1742413284843;
        Wed, 19 Mar 2025 12:41:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b1103sm12114114b3a.167.2025.03.19.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 12:41:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] rdist: Pin to C17 std
Date: Wed, 19 Mar 2025 12:41:22 -0700
Message-ID: <20250319194122.2106764-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 19:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116107

It can not be cleanly compiled with C23 defaults in GCC-15
therefore stick with C17 for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
index abe23cb46e..2fb5ced2bb 100644
--- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -36,6 +36,8 @@ UPSTREAM_CHECK_REGEX = "/rdist/(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "bison-native"
 
+CFLAGS += "-std=gnu17"
+
 EXTRA_OEMAKE = "CPPFLAGS='${CFLAGS}' BIN_GROUP=root MAN_GROUP=root RDIST_MODE=755 RDISTD_MODE=755 MAN_MODE=644"
 
 do_install() {

