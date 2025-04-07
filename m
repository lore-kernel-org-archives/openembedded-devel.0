Return-Path: <sofiane.hamam@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D743C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:32:22 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.52049.1744043537019418508
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m2lOuBep;
 spf=pass (domain: smile.fr, ip: 209.85.208.51, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso10425663a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744043535; x=1744648335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x4vX8zcAt/o/I6CnHm0QiesPKW5imRG5noAg9Ew9EBw=;
        b=m2lOuBepN8HTxABQYnG+NqjjBcDmVwxlcO6/YehJ5Xia1P8eqNvic5a18Yi9nbianT
         PS6YpbjQK2DbiivVdbua1mOy4KNSF0sUgI9TjAye6LkvQRVx6IVKvpPNdHKKSZYTm63C
         2aa0KR6e632rqqSdJNN8igVyQ8UXZ0KyUFxNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043535; x=1744648335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4vX8zcAt/o/I6CnHm0QiesPKW5imRG5noAg9Ew9EBw=;
        b=mZDRIpartjmebSRPO1/7p9JJMwcftQ7atkAbLkC49OqFIlIINpWtpUkCjdJKkPYqoJ
         L1nOheovu/f/DCV1TtgJvLFxRtHsh4DlR940MNsk3jk9S8RA/HHNVt/mQtOjPVruvd3s
         Ui+s0jjBzwwWNuvpw3GbLF85gOEM9RG10/UfOoZHmNqVPU8veXUWs+RlQtyKvsD2gjf6
         JtZLHnWa3p2WPtUx3rgvO+XNe+d01IAh+iTGTugX69oczqrhV3zoDCdQjQ75jRZ2omK0
         7Y9BwiEV6YrMJAqwkD0yzxjzBDZFeDft1wAIKFC4z0rpB4skBYLZ1lqNQr6G+xJulXRO
         +5mQ==
X-Gm-Message-State: AOJu0Yx/BUqdFZkcH8qDaI7X6w7R93EgUY1/1uZDPC2x1L6yVLf0faz1
	vOM+scp1siaM/SoW84Kl+C1X/TTRLd/yj8NRQ9XiFkyf8YEMPrBNEtmZeObUDm6LBK+1MQ3hr4d
	k
X-Gm-Gg: ASbGnctdEWHMeZZ1iLsoowULn5InGqmpDGYjsJQzt10Ymn0jupmDVaXwwak3ebd/qa1
	JFqSQtSM2nH0ccPtr+Jv0JajSBWllhgMyh35SdcxX6h4AyORYR6HTg6Ri2vr0Wc8lMnuk7PbwQt
	b3ts3Ww8pRVcISZKV64zvZTw4GwrBraEFzlk9IfpXkpjmv8fxsRGPuZQQtIuXrfIl/Z269FnSow
	OnHhmRoyivM8ZBvHU2Ag1Mv4XJQT7lWXZnIiiGiSnaM1hH/Xr51guLpmBqPpbENkVIspuF0/TMc
	RAZxIsAVThgK5ZWPX/0mwzLmiOU6RW28iKFG1QVDAz1amD+4ikwtaHnC
X-Google-Smtp-Source: AGHT+IHZFAOqYyapBnjid3Cb9d+dlzQD0b0F4MtGDzc01TpFDAYMNrs3pYX1v9QT0KHV4sLDe1tg7w==
X-Received: by 2002:a17:907:da9:b0:ac7:e4a6:20e4 with SMTP id a640c23a62f3a-ac81a698bbemr12192566b.19.1744043534985;
        Mon, 07 Apr 2025 09:32:14 -0700 (PDT)
Received: from FRSMI25-BPYTOP.. ([213.248.108.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f2e9sm778334566b.91.2025.04.07.09.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:32:14 -0700 (PDT)
From: Sofiane HAMAM <sofiane.hamam@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 1/2] openocd: Update patch upstream status
Date: Mon,  7 Apr 2025 18:31:57 +0200
Message-ID: <20250407163158.3346593-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 16:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116675

The patch has been merged.
see: https://review.openocd.org/q/6834f022b96fb1c7f5829166578e01a0ac223cb0

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...1-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch
index c0a1803a9..a7d7552d5 100644
--- a/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch
@@ -15,7 +15,7 @@ Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
 Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
 Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
 
-Upstream-Status: Submitted [https://review.openocd.org/c/openocd/+/8619]
+Upstream-Status: Backport [https://repo.or.cz/openocd.git?a=commit;h=6834f022b96fb1c7f5829166578e01a0ac223cb0]
 ---
  src/Makefile.am | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)

