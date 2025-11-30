Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E90D111A8
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 20:35:16 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4992.1764534914461193999
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 12:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hC42H9RY;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e2b78d45bso467804f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 12:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764534913; x=1765139713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wirD7U0DlzP+Pd3lqy24Plk+XjufcrkxDb2AIps5LDo=;
        b=hC42H9RY4inNblucuf4GVYTvhQ6P6rAIhZT+qgiJLqDHikxiorcrSrbZLPr4VOtt3R
         +dedtETWgecKe9PSPJhcPkGnsTmxLyi3uJtcEbux4aNP06fqlBPuesE4on1z2fPLN7Bi
         JIcLmGqUzxu/EyWDJivG0PKpb0S7xJu5UjiiEFjpyK6AQS3jmG+XMvQ675XwiJMAp/lS
         peYLkumZF/hNqhOeDt7F5LgbE/nFXFMLpEWp35/CjxISHT7yb91XlTMCtz4/EZzF/fAh
         khmi8p04fKx+zer5a+yVkI/jDCT/gMPeWZk6bZqZG3voRBAB6V1BP3gs3WNZiytAClSu
         vaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764534913; x=1765139713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wirD7U0DlzP+Pd3lqy24Plk+XjufcrkxDb2AIps5LDo=;
        b=f7irCJ3+8c7YolLoNNUShEUj+Z8TW7sR5K4hte2MOmGQLJ2teb7NC2jZx2phCEQAFA
         fF45lCzhggDL46P1bUD+gB5knuAiYZC1hNR6ayT2xtD19perFueXJz8CqitLmRextIgp
         peLV/vlAohOjz1Rrwlu/4sHTEb+2zdFJ0JpcS3VgymHBMm0S86QqMxOXBx7gvBlfkOlU
         x9dyl+IhENWMZlAcTg8TQpMvZuigjEMUB9u/2kF0wFCwcjHSdX/axWuS5o+4NAVLcFwd
         mK3E8gciy1Sp+k0xz1oc1duEg1H6CQF4ZwrrZUL+4xdG/EkFU0gT/NxWXlFZCPtbvbwx
         sBXw==
X-Gm-Message-State: AOJu0Yz2Rpjwfurt14iYsn8n+HQR+VplAOuUtHL7+L4sRvbtPN+8z13P
	tmP/AoP0ewF1tbU4/Xdjxa417VrByXspWr6g4Cd2j7FtZ/3JilKCbrKaDTChRg==
X-Gm-Gg: ASbGnctNHkPM+V7cpTKLbYWqJwnE8gw32YDGqu/1xAPyzxvEjWTIqA25dBtZnH+a2NB
	GpdRVoPjGBtfeZaagBVS22iwqCBZ476zuMCdYky8qG77MVx7ng4CIiTP/pOTb2p0iTKEbuVleHh
	C5CyHostxcngoO2wkO/Ro01gZOD6oQDj17AQg6foZkqpj/D2lqMOII6MKwdQnu5HTdtUuXQsnay
	BR2/lxzrQGXQjoUo2R1gm2aQDqO0rdNh8JeNN82wCVgBusyJDjAec3K4q1ffi9lXe7clIhcmLYo
	GPm/R2+c44483I0ys4SQzaSqEiahr2pihiiDepLs4ia89ACWs4Ib+SKVXEZu3Cm5g4mmNAP5au0
	4K4FiWA1Z2fa0qc2pSe/MemMeqc7IA5LSQc6PTp2v7Z32CMDlqiwmTGXxWfHDituF2ewe4NUOl1
	/4o+FtD50E
X-Google-Smtp-Source: AGHT+IF5mMKYxxmzuF/VzcjCsvPVCwukXiBCOKzDGa9PXrLf73BCwc3AySh0ubw/0HznaSYGtIqUZA==
X-Received: by 2002:a05:6000:400f:b0:42b:3c3e:5d53 with SMTP id ffacd0b85a97d-42cc1cedbf7mr38487605f8f.16.1764534912675;
        Sun, 30 Nov 2025 12:35:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm21338810f8f.33.2025.11.30.12.35.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 12:35:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/8] yasm: add alternative CVE_PRODUCT
Date: Sun, 30 Nov 2025 21:35:04 +0100
Message-ID: <20251130203511.462501-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 20:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122181

There are multiple vendors for yasm:

$ sqlite3 ./nvdcve_2-2.db "select distinct vendor, product from products where product = 'yasm';"
tortall|yasm
yasm_project|yasm

Both products refer to the same application

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93f85e4fd2fb124cb047f6b378cf0052a1f102aa)
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 99717d3a32..71d3c7e47e 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -34,3 +34,4 @@ do_configure:prepend() {
      sed -i -e "s/^echo \"\/\* generated \$ac_cv_stdint_message \*\/\" >>\$ac_stdint$"// ${S}/m4/ax_create_stdint_h.m4
 }
 
+CVE_PRODUCT += "tortall:yasm yasm_project:yasm"

