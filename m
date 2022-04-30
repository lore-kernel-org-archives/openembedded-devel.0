Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0983C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.26007.1651346314910673384
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c5yMRQy3;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id n18so9699617plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tiRUm0njeZ2k6s/m6sVbw8Pp/H94k1U9++VRvia7aX0=;
        b=c5yMRQy3wWdPEgN1RponxpKGg8VRuzJV7ECBOFuIdXJVqXGygCpm7d4Aq5zw2luALR
         Bxhh9T1CAMBi5QcMRGeENhDPOCVlX5aGJYL7oaNJjtpOJ+BnqyGgdeDmejsiNiqqF2Pj
         WN8JDWUPes9aySO/TGy3Rw1+sjvCEbHOhQxCSQMpr9Ee8DK3SvPBaa7iKIl62a3pBMER
         l1gpBTrcsAYO6AV2W+YMxASvwWt+Gtt1zxHn1y/Kn4xlxRIp2aoFt0ckBFOrinCC3u6L
         lGqkmTJ4Mk3l+ho2Z1i2wexwVbCizUvsCONrAgjaLH1tdcqFOKaQbuD6silXyi83Zs1W
         2M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tiRUm0njeZ2k6s/m6sVbw8Pp/H94k1U9++VRvia7aX0=;
        b=u3rWSMI9vShACDkv77VKSU3FFh0Vv0EeH7tjPHTgxe4stqMMOIxQ1Q1Iv86JrV4PSM
         c/Swomo8pM4UIdbVstn1UJWfOf7s2SZgisw4ZzLgy4j4gqGcnJUuW0iPofzoKuZYVKya
         PUtnH6TkQ1o9f5G6ODCV2eMczpcpg0w9iAHvUZbQ8fZyH9RZkcwRshKWkP3l4r5vHdX9
         8uzyLIFyHUlMi21XR5XmNO5iCKk+qAI1MhQ70e8PRBwuQTIwgq6PvUSb7rSxsRbu184l
         Vme692mW85GbKndaQWWPZa0GoySWKhggbNXS9MZit2XntMW3tvdPVf7E05EOgWDMwcXz
         PQkg==
X-Gm-Message-State: AOAM530TU3W9BW83ShRnWCUZHLO1fWAeQMgVZI7EugMyf+20NMZngckO
	wI7JG12cljxIwxT+2ia2XPq8WhHuwij9Qw==
X-Google-Smtp-Source: 
 ABdhPJzjdmJOMNQOzC6bGzKRRuMavPuY0RLV3N7tdC/l/yjsbd4r6s+XlagjdnqB/vONNBFQgNGXzg==
X-Received: by 2002:a17:90b:350e:b0:1d2:e1ad:5be6 with SMTP id
 ls14-20020a17090b350e00b001d2e1ad5be6mr5402769pjb.30.1651346314163;
        Sat, 30 Apr 2022 12:18:34 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 06/39] tomoyo-tools: Define SBINDIR
Date: Sat, 30 Apr 2022 12:17:46 -0700
Message-Id: 
 <02b9c944677d5bb1209946b48ffeb4d0849d48da.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96873

From: Khem Raj <raj.khem@gmail.com>

default SBINDIR is hardcoded to /sbin which does not work when using
usrmerge

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8c7ffffa07d3c5bb8156a90f4f37dc0cc3166153)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
index a1c4cc9eb9..d9f09d1744 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -26,5 +26,5 @@ do_compile () {
 }
 
 do_install() {
-    oe_runmake install INSTALLDIR=${D}
+    oe_runmake install SBINDIR=${base_sbindir} INSTALLDIR=${D}
 }
-- 
2.25.1


