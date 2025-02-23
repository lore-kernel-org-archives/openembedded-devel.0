Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35EAC021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 12:41:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.65889.1740314465398416393
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Feb 2025 04:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g+6esJnw;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f3486062eso3053407f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 04:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740314464; x=1740919264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mvj5i7u7ffklDA7i3j5LHjUxP3iR1QLqwZCdxCPhrSI=;
        b=g+6esJnw8y83rUUYuBnVliAViEtRpp9t8yHENiKNui+o+zrMdPUP9O78lAbsT3P5//
         xu5TmpbB+/nKdrJYOfKhi/7sOE8YGOawidfJtTb32pK2EkAoBBoVslbIS0oaunsOnKwJ
         wP3DRkBzJrpDWpASoG5N0cigXX0jtIkqB5ydiH0nOC9UCpU9dvsMGZ9Q/6yKDlNDPV3T
         xYdnEZ9nz7s/I10RuytnHDdl/+JHwq8nnx4hgcZEXQyzy8gyCKKSPINr2uWncoj16ZkL
         mWqpQ8S5r4p98vSHENVnUqgLmrvsYOfr68ybGaLs1qBznXG8Nadj2tpmJQH5QJfiwUt0
         BoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740314464; x=1740919264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mvj5i7u7ffklDA7i3j5LHjUxP3iR1QLqwZCdxCPhrSI=;
        b=Xe4+w3cJgwBHOb04XV0G89qxFpO3vy0x2MAM6nbeRiwXbRpMeh3n8tYKPdZwXiDZMk
         EHlupErSlD4HOqJhMVVzT4tNDoNYLSXMUKXzH5f8FAlNNPkVLxsr1920K157uH18sYQx
         jUaDAWjEcMZdLJrKKO9UJRKNjg9C6F/E+qDzykkGoZb64gIQN+1ZMmuDZNTC+6DyFReq
         IkPEd8W69E2jCEKJWZCFmnt/4+MR/U8KOovwKqrU+woYDDkQNjydbiBoQCaQR45IQ/Rt
         vD4cejzf09zjubW2DnIdPEYoCXmmkdMUb1CNfNNL704KFzRfMHhjygq8ECvIauk2AVU1
         KVNA==
X-Gm-Message-State: AOJu0Yz5tjqg0KY92q4LKbJvxL62EI1kDlAE15kNjj2RXA4hi0mx4ggf
	mtyK/SnIQDZCCASgEWz558rEokMeLurR40lHum+49C+1W/+dN5+phLnIiA==
X-Gm-Gg: ASbGnct80asutJ9ieR0aPdpb85O7c781+IFceUts9WZi4TziaoLfgDJDPviHrPcOM2H
	20wztCPoHvPD0Aqku5RIrsuVWSa1zzOS+JUIoX+a3zzuHmQQJD1izpm2BKC3dAIvK3X95R4lb8z
	P+1eB/BzGNUmLoHo3HjvEF9S8zHdKB2wMvdhQYj9vdGPaGnwMPfJKXCUiInFzcmpdE/K/XL6lFU
	79am0XCeM8U8JsXrD0yYwlTubpThA4sjehITSnaX9J0DNZ5AdYEFHoiH/QzpJrYMJ9/Qvr2n0Zg
	TqoIgG80i5LSKWkGwJ95EFbpjluIZLiwAE8IIXsf7Q==
X-Google-Smtp-Source: AGHT+IGhXUt0CMuy4ejvogY88GU/LVcfUFGAhixK2YhcLrCyHOqZXLSz0LJ7bRdd+5QnnxDwOK1AQg==
X-Received: by 2002:a05:6000:2ac:b0:38f:4e50:8b1a with SMTP id ffacd0b85a97d-38f6e9791a1mr9485289f8f.25.1740314463585;
        Sun, 23 Feb 2025 04:41:03 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce4e9sm78150795e9.4.2025.02.23.04.41.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:41:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] wireshark: fix SRC_URI
Date: Sun, 23 Feb 2025 13:41:01 +0100
Message-ID: <20250223124101.3777597-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 12:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115548

The original SRC_URI's content seems to be deleted regurarly,
when a new version is published, making the previous version
unavailable.

The new SRC_URI ("all-versions" folder) seems to be more
stable, the previous versions of Wireshark are not deleted from
there.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
index e3e210cfed..62aec8f732 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
@@ -8,7 +8,7 @@ DEPENDS = "pcre2 expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 b
 
 DEPENDS:append:class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
+SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz \
            file://0001-wireshark-src-improve-reproducibility.patch \
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \

