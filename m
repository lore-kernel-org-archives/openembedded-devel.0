Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7181D35E2C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:16 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.27871.1730831928508764310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YypzuJ5G;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ea07d119b7so47379957b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831927; x=1731436727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzjDlgin4ooJ+kWuPZxw8EJHHqA5TcyU2MUhRdykj0=;
        b=YypzuJ5Gyz2eR+Q5LxKeJuvim9YvGRlowgO3nUcsVsnPR1rB5vXB9aeWCKIwRDp8kI
         t0LkrUl2gHLzGiqpFEWISdQsYmcSwgzJHqb71H8aH5ZKSsvTCMXAN29gFMi/CbXhZ59d
         THe3WMPiKxcdt1pgVBcBW1aG1dIlWjYiHID38aY2IcrZngfM3S6YoShnNyGqY/j//1sq
         l44+/xsvrMbmWCntdj+8/CIbKFEjpbjtcNO8byGc50vwSQrLrUcEqhNy2B9PdLCKYRQi
         rAeDnbDpnG0rRMoupEuHPrv67k4Crg7KlL0XFslwA4N8I5KF+evFG0/XT7W18OvgZrrg
         vwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831927; x=1731436727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEzjDlgin4ooJ+kWuPZxw8EJHHqA5TcyU2MUhRdykj0=;
        b=ExbrKBcWhVwo/aCY55VbyJ01e6TQ9tSu7nHyoA0ORI2Ljq9Zjtcnjubv8cGFmVQmbX
         kwCxSDDL50vhP3gpUf11q1z7uCJl4x0ZT6nyca0mgrHJA8H/veFIm3leWd6i9lLPomJS
         teKcsebzidB9xX9elA7gDU8Oh3UUqJZK8hnGMOQNwhFRwCFLvou55CqZkPPGPntpPD0T
         tdoLVYxF6YmzqkHNmn60+PJS9I1959gpiGaw1qDyw8btLg1bq44A1n2M9ywh8Fy/5HMh
         QYopdey+2NTFrVHT9vSjDP5G+egzGRJtoS7HE2SRwSZYvzGt3FoNJ+T5P8cmiUp4mKul
         LtaA==
X-Gm-Message-State: AOJu0YzjMF98+ia+9BIY3CVZ3QzMfGhQ+Fa5Ngp9msF+2eVsMOgjLo3U
	qS3qywJEZ/ZC4gQbbTwCUnd4tu7Fc0ua9sasAhHkR71RgY9meAxkWKbrALA+
X-Google-Smtp-Source: AGHT+IEqxA3UPTVAHG1hOouAx5Ld1oUo365DpPoDaYumSh7N2xClG6MOrj1n3txqZHPd4kpmn0kiTg==
X-Received: by 2002:a05:690c:883:b0:6ea:8132:4081 with SMTP id 00721157ae682-6ea81324270mr120310407b3.3.1730831927186;
        Tue, 05 Nov 2024 10:38:47 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:46 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 060/161] libsigrok: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:36 -0500
Message-ID: <20241105183658.34982-62-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113575

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
index 1e5ffdd85..1e63179e8 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
+++ b/meta-oe/recipes-extended/sigrok/libsigrok_0.5.2.bb
@@ -19,7 +19,6 @@ inherit autotools pkgconfig mime
 
 SRC_URI = "http://sigrok.org/download/source/libsigrok/libsigrok-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e258d471b6d5eaa58daf927a0dc3ba67"
 SRC_URI[sha256sum] = "4d341f90b6220d3e8cb251dacf726c41165285612248f2c52d15df4590a1ce3c"
 
 FILES:${PN} += "${datadir}/*"
-- 
2.43.0


