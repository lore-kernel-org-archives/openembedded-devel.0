Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3384C83F01
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.2914.1749958588280655857
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Jun 2025 20:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0OA95SA;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2352400344aso30313455ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Jun 2025 20:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749958587; x=1750563387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=039doY4xDgDGT+mYwBm0P47uz1vEDwOe78H0QgulGA0=;
        b=R0OA95SAjSawOkzgA3QaRgRect1Ko3xSPxtZ50obX+RjpRg6eRBT+uo8nmgYE9n1xF
         TjxSikXdplr7iZcOh88+nAEOZNyrTa4W1v9I6JJP00wgKmWV7cwq2dxSdPGZakuiLUoU
         JwC2NcZrwb85JNpO66RKiGJXJQQDUkBg56lD62GbdBRROfZPc76mxZxD/0QDokKfjESR
         NMdaaOlQAvcpeWC9hAKvZR/BUbdOGVsGlq7RtLRoGqiGsdgTGs51kStfnaurcngQ0Uet
         /YfhNz9WgFq8y5/9NHULQSM48wieVcvSx5h/7uQwUpi/27R6oIg2S+4XIcPgP28i+tPD
         xVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749958587; x=1750563387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=039doY4xDgDGT+mYwBm0P47uz1vEDwOe78H0QgulGA0=;
        b=GYDGAjA+vrLMv9MJWwGXS6VV0+oAC3ueJJPuh/oUY4guM/2AcFwJVbKs1GfjLP80LF
         OnDbu8t60g6t+tv3/dxkmwmNhCX+ySqv8EvHnwzpRpZfWK70mOdpFJT7IGDNP0G5Tvz5
         16Ga2nPQvFPOi4keV78bcU0rJQIgyAwgvEROVehN268g+T3jqQxUVt4cDP8X2jWbQVtJ
         i1BhV8pwoHNyO1+Vrle9V2XkniTegXkrd42sn9fpUIQexwK8l+XEKj+u61MYWK8LVrY0
         /2OSYohm63KOjgUT3u9IUczXTWUd59QoWfJ5M6g+Bbb0DMsUXxOZyad8YvwliqPOTC/t
         6YkQ==
X-Gm-Message-State: AOJu0YyOQFoNrzWN+Bz90BB8DtBa3nMENfAIgDCsWCca8M8FLekYtF77
	gexQbjkU5+IcyR35qL1/p/C7WDEGJe7FWOv0k0zewmfDC8htMRg7YmmNw36LJbqI
X-Gm-Gg: ASbGncv8kwYYYpcNeQStTZ55hmmxCFNdd8CJTrjnCi5mz9vXQz+a4F2gyiF65eawcc9
	3w0kK+gbFAXb+Leaww6fYDvA5JLf2sMIFuWfygSns83iR3sdFu8C/UYK/8DIFmlmiZ+7YSzrRJs
	FfAySOx1Lm7MwNdP8PqVO3Jy4rU74OVEMkSnl6+Hp/6AbdTe50qh2PO19JHM4Z9HA+zwUxY4xp3
	nhKS4FovFdT5Pnmuq1XCBdbnBWwuCI1NNMHartEMdYlK66S0ZZKehZD5NbuZ8eswvVGdYoBoXlr
	H8v+sN1KG0t6NDHVmxOWFYVvnVMXuRVjjbWQLxa5XDaOvb5rKxZwca7UndzoXjIBJGdJDCryUu0
	3Bjd4iYh8Kg==
X-Google-Smtp-Source: AGHT+IGTlDXjlLPm4yQoc61w8pd+PxB6Kg0JJE05yyM1pB8ftBGoIIUincYO4HthHO85gL65pu2guw==
X-Received: by 2002:a17:902:dacf:b0:235:e76c:4353 with SMTP id d9443c01a7336-2366b16e8edmr60792875ad.51.1749958586979;
        Sat, 14 Jun 2025 20:36:26 -0700 (PDT)
Received: from thuannt-Z87M-D3H.. ([2405:4802:9117:aa0:1aae:a85b:c232:c531])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78ce2sm37417595ad.95.2025.06.14.20.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 20:36:26 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: v1.0.7 -> v1.0.8
Date: Sun, 15 Jun 2025 10:36:19 +0700
Message-ID: <20250615033619.6240-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117912

- Fix daily/monthly/yearly error.
- Check with Raspberry PI 3 B+.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../{libsimplelog_1.0.7.bb => libsimplelog_1.0.8.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libsimplelog/{libsimplelog_1.0.7.bb => libsimplelog_1.0.8.bb} (92%)

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.7.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
similarity index 92%
rename from meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.7.bb
rename to meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
index 0302f7c89..b4a721b30 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.7.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 
 SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "edbe423bdd1b36faf30d2eeeb869e4c1755864de"
+SRCREV = "093d80b4006042b75a433a5e63760ae9bebad142"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


