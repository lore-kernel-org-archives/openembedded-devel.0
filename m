Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3051CFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 15:11:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18886.1763997060528465666
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 07:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kryeeH4a;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47778b23f64so23467065e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 07:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763997059; x=1764601859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVsrycqxyynLzO7UuDV4VX6uhxl73mmnphg0VfkYK+A=;
        b=kryeeH4azQxaBaosyukOfwGjgb3qx2vE9vHdft68rsm8xHtuAfHDI1jQd/XDMjB1IG
         iMZQgblFL/oDxdR0Xgb6Q/hjbJhLj4vdqUbADKG0xSgQ6xLwZ6jUz4MaWvJR8ui1dciK
         wjoCHGi+1eRhriCzVuHiQ1BtZt86luoZ28/aUz05QY0WzkYvRQD/bwl54Zzs9jcamRfT
         /2GI4RX87OSUOaMKwvA0TCwERkZzk9i/m15pFrClGv11vmn96eUaTJH5DKeJtgwhEeEm
         am6zd6kYrarv1AL+gsz9mNsKyPoB0RzQS5agYdvd45Pw4XLDATa05JFJztvOT+UDw/6j
         8Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763997059; x=1764601859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVsrycqxyynLzO7UuDV4VX6uhxl73mmnphg0VfkYK+A=;
        b=qWt9BBAyDkv2RrA356NIDENVxXXcny9eshGx6ShmQBzf05PxDTJcFFNArEYAqEOier
         RjuCE+IyOUUnUk9IC6lQB9N6H6qZtygczBnYThMdKRqJ8wm6P5vKL75k80K16T3L8Ju/
         UnHncwJaTaB6Ai5j7aUeZN8cPKZoaB80UaDjFPAtYDdKqz5DJyROO+yf5/Hqrpicn2bA
         ziuxTsalPiTHBFafalMRGtL++OoyPrQw2KAIML5LdaKddjLLLyDaigjG7tH2bD42eGMj
         0zZmdo53rCRZl7NLjuKf/hSYHU5J/D/DTiB40gEOk2JQCNraECiLqcwENsqZ0Y7I8Wc9
         J4Cw==
X-Gm-Message-State: AOJu0Yz3Df8QxPL4193BwAf3L8jxKGS0KkH5QmSsGJxscSkPfmDFtKi9
	JdCBTNy56UY484u6BNiBJQEJtS1uH5ot46uh/A+I2us6X7Lo+tcPHVAa1fqs9aog
X-Gm-Gg: ASbGncvNDiTgSiI35z7T/UPemX+whSe5SfMUB7r2zB6EBosv4wPGd/+zn5lbBENj/h2
	woNKbshJdyoHRP9G6NuWQeNFSPAKFYMcw2niswEPdfP6m6XLutFT37FjUz99FyOTIOA4YT0FAhL
	wT8ssvlcqzOSFzEyNsVnkdhzH5Miu7+NzYwdG9Tgb32hKoAocncvVzdrGhmVTDThD4bx4B6qULm
	KVovdw88o3MeDkF9kmGdF5CX+6jFPj9sa0cXNJU4NDtS3LluAIIbksMEfSWEINohYjeCB4pgPF8
	R09P3d05YJHa/jtpEGFYriH+WrzR1ufL7JYFeY5NArxtIVaDtELf5QifdiE79VvI3+kTM+72fuI
	/0Pwetat7neKUeqLQR+iLBHCUd19prZwn1uBWE733h4jVvqPuih6ZvxruihUyrmtT5X2uv3z/0O
	1LTKPz8ua1
X-Google-Smtp-Source: AGHT+IH2d5gxG/ZHyV80X4ycWMP9sUfMPJsV116bSan7QE14hCwaovDlW680Ehm1FQ+IxW6S0AKKog==
X-Received: by 2002:a05:600c:46cf:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-477c1103015mr103787315e9.5.1763997058732;
        Mon, 24 Nov 2025 07:10:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97412e3sm149092445e9.5.2025.11.24.07.10.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 07:10:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 1/2] cockpit: set correct CVE_PRODUCT
Date: Mon, 24 Nov 2025 16:10:56 +0100
Message-ID: <20251124151057.389723-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 15:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122014

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
index 4726386f6c..f84b1c4c34 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_349.bb
@@ -197,3 +197,5 @@ do_install:append() {
         done
     fi
 }
+
+CVE_PRODUCT = "cockpit-project:cockpit"

