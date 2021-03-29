Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.21207.1617022654633938776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 05:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FPXWE84Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: aj.bagwell@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id w3so19311242ejc.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Mar 2021 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2J9N5ehidav+EZgGv0n/hWmaLVAD6n41ZTD5IFVqu7w=;
        b=FPXWE84YSXWYxoAavF9L7yklLW5CvkVO2tMzj4BI1sZtjV4a0+H55j3lt7H2dmUIws
         L7efzT5H40X32It+NX1fT6zvBqk4nK2FuM4j4hSupX7We5q8OynGHPMZpAoQFJVu1bMd
         swGSaqZQtdLbo6XUPkqVFMl+CR3YcG2VbQuIStMRKQG+sjHg4gZZ5c+ADY1zvp56cSDM
         VPuc1HDyAc6wM1DIMIkC4Re8sU8cHDy4CQ+SA7wO5O1/OgU2VTDI5Kek/7pnLLukaM8b
         0z8ladPb2fVtBNabRu9Oyd58aMjeCQw6gQNIgc9ucX3qBXZ40rPZXB8mIrcFpzg/zNOp
         V+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2J9N5ehidav+EZgGv0n/hWmaLVAD6n41ZTD5IFVqu7w=;
        b=FzBExpI1i4nCuj9Kh+ku5S0hKAp3ULjm8goKScomBOX4Nvu3tJLTCc7TRSy0nUmios
         r5RGdFs80D6jZQVMNscwnszGCjNdTys2NnmWG8nlJpAVs2nwDBT5Z+Ai02iQvLXVyhm2
         l2JA3L1vHHu0GM/CEKv1F4BYXIg4fqk3KsfzN4mgfSawpcIDtYtlsDyFcvypHXoJ1UQI
         QfkYAiGeKXBM6ayS+k9MXM4drm/geJ443ec7kxGKaKIQmvcAktuoL79lyjDHeaSI80Gp
         cecWfefNMqomvBC1dIoqB3x8Z792OP2z1Bc+catfIKMXrHbbUtni1I88SiP8hCpPK4S3
         jOaw==
X-Gm-Message-State: AOAM530z/FRCBmDerID+XEci6IJ2Ba0iChg0xWy7pQZVeKMLyWPGCfxq
	yEX2zAoqol8OgjmOvj2JXgOY9Pd0WQ8kcw==
X-Google-Smtp-Source: ABdhPJyhhHY+1MwarSkWJLKkyabqPG5RA7/E2XuGs8S0Du3KyReH1EnWr4456kT9rTEMu8amJiDs7A==
X-Received: by 2002:a17:906:1749:: with SMTP id d9mr22300371eje.12.1617022652957;
        Mon, 29 Mar 2021 05:57:32 -0700 (PDT)
Return-Path: <aj.bagwell@gmail.com>
Received: from CMM-C02QQ1FRG8WL.localdomain (cpc159419-cmbg20-2-0-cust164.5-4.cable.virginm.net. [86.29.216.165])
        by smtp.gmail.com with ESMTPSA id c17sm9369329edw.32.2021.03.29.05.57.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Mar 2021 05:57:32 -0700 (PDT)
From: "Anthony Bagwell" <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-devel@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [meta-java][PATCH] layer.conf: Mark as compatible with hardknott
Date: Mon, 29 Mar 2021 13:57:15 +0100
Message-Id: <20210329125715.57585-1-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ Bagwell <anthony.bagwell@hivehome.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 6a98adb..7ef116d 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth"
+LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth hardknott"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.17.1

