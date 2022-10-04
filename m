Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9043C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 06:25:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.7554.1664864710448916419
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=qFTCZPeb;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.46,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f46.google.com with SMTP id n12so135501wrp.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3viro0cS0AJJ6KIgDh+jkM/qkroqKGYg+GnDqwnfcnk=;
        b=qFTCZPebAQqf+AwpvxII+iJwBL+tbx2cQbEOOTg6i9lkpWDUW4Rh2R6OOww7CBCa3Z
         dVHOx5qoDEzDf/ORI2iQmx93HlaYvOvHSvj4aI8ifDWx8NyurU97ng4isKLLKdSuCiI1
         /NwHeggIDlRHkn1DcKC2qGXSRdidmAZDzL8n1OPGT8nxdu5087c3LNc6+On9MhpdOhC4
         Jz5f/I5q3yxRLJlU/ZEDWxDG0JzdaxMN50lACQUsA9D1PbCDcJa/p/ppuNpP6heRsDpz
         4oRC7SC0wqr6HZtqicmckBg1Yf7PKUXwVh5Qt4wjcYtnHpyIh1SmdB0fMe/mQ//cJcxO
         zJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3viro0cS0AJJ6KIgDh+jkM/qkroqKGYg+GnDqwnfcnk=;
        b=yoY+pmav6Uek0QVwhqhxh4E2564TcnQ4bWKAc/dzEmD8jvoJnuXhGrj/RAXi6W2YXQ
         GSRfm4drZj+E6KD5CyU9U1tCUhoeoUe3gpK28CQy/el771b8aZ2E9EkyaIw8B8WIUKI5
         QrAqBiSB1y49DObramTJMpvYmglpuEax6DFTurmZIxy2hYPsqEkIU3o1eKeDuNfdLXxK
         qf8y5Ta8AY+lo4YKk53/V5x/erv3+rV5Fl0V6N8SmoltgCSbs5YOOaOS2PqEP2JNBoWt
         dR2M+eMmBGq8IbcmxljwpMADNUXu1+1PHmGL9CiT8j+tOdQqhdYDtmY03xps1SmCpwde
         vqGA==
X-Gm-Message-State: ACrzQf2FArvsxNih+Q/2IGuLfQtTWnLVaws5Ba6bS7e2Xv7wxDFxAxwL
	BuzHGYe8C/IoGE25/vYQsJMRt2gXlIXNLLU/OUE=
X-Google-Smtp-Source: 
 AMsMyM7RSfvcSqB3uiyLRDy4cmlKEFE9IZRmi8Ul/QpRA6YzWehaUi8XLeF1WkSMJgHiOEU6j8mj5w==
X-Received: by 2002:a5d:434c:0:b0:22b:262f:ee66 with SMTP id
 u12-20020a5d434c000000b0022b262fee66mr14575853wrr.143.1664864707621;
        Mon, 03 Oct 2022 23:25:07 -0700 (PDT)
Received: from WIPC21110265.. ([2a01:e0a:9a8:8b40:238e:3570:9587:5b36])
        by smtp.gmail.com with ESMTPSA id
 n31-20020a05600c501f00b003a844885f88sm13802771wmr.22.2022.10.03.23.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:25:07 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	joe@deserted.net,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [meta-networking][PATCH 1/3] mbedtls: Fix CVE product name
Date: Tue,  4 Oct 2022 08:24:35 +0200
Message-Id: <20221004062437.2541052-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 06:25:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99048

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
index d4a9c7bf8d53..a3859fbebaed 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.0.bb
@@ -42,3 +42,5 @@ PACKAGES =+ "${PN}-programs"
 FILES:${PN}-programs = "${bindir}/"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "mbed_tls"
-- 
2.34.1


