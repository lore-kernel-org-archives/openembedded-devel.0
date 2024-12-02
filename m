Return-Path: <ghislain.mange@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838B3D7830B
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 10:59:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.171632.1733137162531172781
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 02:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MR4P7+JM;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: ghislain.mange@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1572032f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 02:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733137161; x=1733741961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GUv4l48zLO/DrqOeNcV0HrmcHduKjpv2FB5yZaWMfYQ=;
        b=MR4P7+JMDAGzP3xZmo3+SundV0Vq2BRA1DD4ih0Z6AYymcz9MnRv3D7EwDwVyyyrZ3
         fhTdwHsvgVyOmPfzTIMLqIfK7lgKpCaZ3147IQkqlyjeG/XiC6SPgbMmp83re3GFhODo
         q4ijBfSItb2bmQvxm5oNZsQGPsli3+fSvaqgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137161; x=1733741961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUv4l48zLO/DrqOeNcV0HrmcHduKjpv2FB5yZaWMfYQ=;
        b=ZDNOsZ5khww/p4Zq/AA0ybLeUluhxp6kOdQ5YAihBw8jaAvhmn+tf+swcPFfKpmUN0
         tkuPwrmL3KFj5tfLjWXxL990y1/kZ/zQhS7JkK9uMIR3ZCyJvVawFDI5/fq0ZsWd/sIU
         GNCGNCfqxiUc4LHwrd57puRo2EPIbtdjzjuLQQKqcA+jstAMul9pXz70Vk/6PlaCWqp3
         92ndTU2eIFxhS2bOiy1aCnIEkk0dR7PeiJ8O52PqmpkWbi40nwsZ31DOz1yUNLv3kThT
         iwS4u0v2T/SinOfeFGVg2uKJ+bjFweuaDoe/BYue/3V1kIfOQOI5wOJ4xpMQELX3bFt6
         lWMA==
X-Gm-Message-State: AOJu0Yw864zFgdY6OEEV/DOawM51PN6izr5zz2vtFWpbvcg3baZLaBY2
	b8NbJbTMf19hhBVdgwAx+3uY/qbu0K482iFXR4+qt0fCdKFVXjUE4Wq9XBmhr5Qf1BcfpoQ7mVq
	07A8=
X-Gm-Gg: ASbGncvCQQ5KP25x5DNBM1EnincPZbGFeuoMcZDsg+YO5N1D5N8wLLZXT/iwEzcrC14
	FQUj8zjoiLtoVz/IIU0B4kvzB08kQFxuk0Kv65eINY9tg9L0L5rXppjaoFmZuE9xmZQC+TCeaHs
	FNOSJvGyNJ1/pnVyO1AMSM2beJFivQCvw52HZXbg1MOJWgmwsgve5d+y6Ni6B/oks2hbbowjmNo
	djVqfO1wi63chjOIWRATNhiqfNAgVrmIq0ySR2MaF3Tv03A8sTmiDlxGAcLMWbS5Ybdx9Gsqpd5
	v4DbsyRQuj0BfJzkzSYuRqOpkG6Tk2vlQ0AQ6RPAfzmKEJrJm4WP56WN7g==
X-Google-Smtp-Source: AGHT+IEBR3l5qpU7F8XyxFMIeSF3WS5AJ2xA4vZqEc+PRUYxaHWoWNBsKg1PmqZ5RZ3lZMG+Ko+rkg==
X-Received: by 2002:a05:6000:480c:b0:385:ed16:c91 with SMTP id ffacd0b85a97d-385ed160e75mr4996177f8f.24.1733137160955;
        Mon, 02 Dec 2024 02:59:20 -0800 (PST)
Received: from FRSMI24-FULL.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e32ee381sm7185282f8f.76.2024.12.02.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:59:20 -0800 (PST)
From: ghislain.mange@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ghislain=20Mang=C3=A9?= <ghislain.mange@smile.fr>,
	Ludovic Jozeau <ludovic.jozeau@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH 1/2] wireshark: fix Qt5/6 configuration
Date: Mon,  2 Dec 2024 11:58:46 +0100
Message-Id: <20241202105847.118348-1-ghislain.mange@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 10:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114136

From: Ghislain Mangé <ghislain.mange@smile.fr>

Wireshark is built with Qt6 by default when Qt is enabled.
Forcibly disable Qt6 in our Qt5 PACKAGECONFIG

Github issue: https://github.com/openembedded/meta-openembedded/issues/844
Reported-by: Ludovic Jozeau <ludovic.jozeau@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Ghislain Mangé <ghislain.mange@smile.fr>
---
 meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index 3fa293d0c..be342c73b 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG[zstd] = "-DENABLE_ZSTD=ON,-DENABLE_ZSTD=OFF, zstd"
 PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 
 # these next two options require addional layers
-PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
+PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON -DUSE_qt6=OFF, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
-- 
2.34.1


