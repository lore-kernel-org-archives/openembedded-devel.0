Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E1EC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:57:42 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.379.1666371461770831673
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Oct 2022 09:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eAoe+y5f;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id j12so2892523plj.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Oct 2022 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HOk60ZQBVikVkRpyoukBC776+7kSiv+hLhN6bvW7eyY=;
        b=eAoe+y5fcGbdaANdwVwpZEiuOK2Qx9DB8oKu7jP+GptRKwBPsh9IAmDHzwUxZiboSQ
         6QabiCYe50kIrelXeQLD7gYEUSE7p+Jy3U/Z3sj6XSJE0RXKIK8DfXnpcrObuXTvZR70
         ywh2DiSDqxrt4yyvbRlpb09K5nvApTRpJI0TLHHjopbY0+MPbukcsuy0uFjEN0OT7ST6
         BQTik/ePSu+YvPIhI3YZgqPS0fNxJvi74Smj78n9/CfajmOGyjzQeRXxiL0u3uAIHpNa
         zr1nFkqEpNsyAWg3jP6yAtZx1T4Dk/H6HnKJ39iN9XfjGRAQaBAh8qk3HcND7x4QWJxg
         kP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOk60ZQBVikVkRpyoukBC776+7kSiv+hLhN6bvW7eyY=;
        b=sagFWVg/ODq17pIdNr22XYh3BLHei59eKkOtLT1cvp2Wtt1kn6mQROXcK11lC4cM1o
         1Ywz+EKegX41pbVBKSIK6UYZiWKrq7FCGEiFUGP9LMUOfMhdXgtCcxOvEsNNJO2F7dxM
         xg4NgFr9lMjCaNnzrbh7bpWVmzPzLOL2Daag045idROdGo7gniwGSYm0daIUpYLPcmGU
         LA6wwOtLtEHGJs5r9OvYfWSMCsc5zvRwSxK4m052Vcrmj/+kR3xdA0YXhYUouH7GFDaX
         onlj4pyX8DP/LDXos8UZDxO6s7APEdRTvxxhdacUCNNWe1Sfn8Y3IHSpGEThsZj6qsxd
         cb+Q==
X-Gm-Message-State: ACrzQf371fOVz6kBT6e/ksDtY0wufym2T4ohFJmyEqn1pkG9RuW+1XTD
	kU6K/tmNOwhYpaG0mFmUnY4PfbH+1kA=
X-Google-Smtp-Source: AMsMyM622K/gxMeZe1MEmaaqr5/p5HfGEhho6gOTruR0RxkQsXEKSPXcJAu4KbveapfYFaS5QB0oPg==
X-Received: by 2002:a17:90b:4d05:b0:202:ec78:9d73 with SMTP id mw5-20020a17090b4d0500b00202ec789d73mr23233742pjb.103.1666371460854;
        Fri, 21 Oct 2022 09:57:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::751e])
        by smtp.gmail.com with ESMTPSA id e21-20020aa79815000000b0056160437e88sm15458693pfl.20.2022.10.21.09.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:57:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] protobuf: Enable protoc binary in nativesdk
Date: Fri, 21 Oct 2022 09:57:38 -0700
Message-Id: <20221021165738.1803166-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Oct 2022 16:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99255

When it was disabled for target, it was enabled for native but not for
nativesdk explicitly, lets do it here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
index 0bc9cbedc0..c8b9158e6c 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
@@ -26,6 +26,7 @@ inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG:class-native ?= "compiler"
+PACKAGECONFIG:class-nativesdk ?= "compiler"
 PACKAGECONFIG[python] = ",,"
 PACKAGECONFIG[compiler] = "-Dprotobuf_BUILD_PROTOC_BINARIES=ON,-Dprotobuf_BUILD_PROTOC_BINARIES=OFF"
 
-- 
2.38.1


