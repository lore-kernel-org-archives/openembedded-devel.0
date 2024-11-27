Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE1BD609C4
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 09:42:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.68430.1732700558430280906
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 01:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=caxAKjUC;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso441885e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 01:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732700556; x=1733305356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0BNqaOoi9euWjsbC2tQi739H7X+NEoZtia2/yuSu78=;
        b=caxAKjUCGsphHPS7mliqQ5rMRY72GL+4nQede9zdUM8+GLQzTXHlbNPF8pMaO+VH+l
         NBRyvdsmbKG/OaR72llF/pKBQyvZOBLmL9I0Xgq7nRIrSCVhjLh+QzdeNH+UxAOtcpoa
         caPuMNrDEUhMSYKqd8qFyNKBvNF8sVetMSeu4OZxQC00wWjzhPBSSPRkKNSC0QqQSmKZ
         Qk9hHP574V8Xtgdm8xys7LW0Fs+CgCJP7goDPBAloBHrvMAfN1V9KEObnZgRaijH7AGh
         GBhxYKamFLb2kitqi/cCap2GwERtp6NWsEajVe75rodsx+vy/1M6lBh/KnUVV7EB2Xbx
         25kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732700556; x=1733305356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0BNqaOoi9euWjsbC2tQi739H7X+NEoZtia2/yuSu78=;
        b=pvxIIrHavLlGcRHaMHQxgqu/pzJB0ujVnvU3rAQ9khDCb1/erCZaBPUlTjc6XGYr2O
         MMk96v38fUJy61Mt5fsNcmMOPboxMY6A5pwLimeDa7r8YFhwXRB9HdPdGUyc9Ekq2E1C
         JelZK9osBmxHvt052+B4FhKGgKHa+OCqmCYotyiHbiWeOIovBZ/wCnkhS8E4sXb189WA
         EHxCUT0pjOnzR8bbxA1KjHk42Zw9aCQBvwZ5ee9VFP2kkR3DHUyXdd8UCe2Rc79G8itw
         +yNGxtFAxvvejW/CbcXEfLLyYVzkUU/bsX+21VuUkuJ3+M0bDFcrrJT0t82OtKmVGYJQ
         cuPQ==
X-Gm-Message-State: AOJu0YzvEMDXsWT8sdfKeMhUD4dRwTKWoeHkz+hOu8NGArg7GeIk/RWx
	QEvVQbpq1F/LJglkizDBSDEyZjS4o1cs9Q4YWj5HwWfeHbYP7J6z7u7eFsrx
X-Gm-Gg: ASbGncslAe+PH2b59fnj1pflzfJjxEYj2G7x2KwrpcWgUkSIa1oIGmXKWkW1FiUI43O
	9PiQgxOjS8q5hDszFYGIRo1k2LLiFwHT9vwMlAwld528XhII94jt/ldXzdU8ev59+UO3rz41p3M
	39y6S2TwdgQU9/6uJlOXXXHWQ4Lwnr62Tcm0JcstRXG7F4yoTdDozvG9E34nrUIBIzfoOCeS6oF
	nRBxbe0LkMRuQrWMTMuqBaMJxcBssKQ4qhz+ft0W0LmwtkilqDPt+5LE7oMTuY584SN7KJeIYbm
	/duaXzJ6RDHk5QXkcA==
X-Google-Smtp-Source: AGHT+IGGOXVV983ceIwYhq70l+pCA5S1zp19Yx25FDVlFCpYIZxKdGrNqR1LglsiBiXkIAem5E4VMw==
X-Received: by 2002:a05:600c:3ba6:b0:434:a1e7:27b2 with SMTP id 5b1f17b1804b1-434a9dbbd7dmr18816005e9.7.1732700554309;
        Wed, 27 Nov 2024 01:42:34 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa781200sm15437565e9.25.2024.11.27.01.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 01:42:33 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2559.1.1 -> 2559.40.32
Date: Wed, 27 Nov 2024 09:42:12 +0000
Message-Id: <20241127094211.11193-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 09:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114084

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/{mdns_2559.1.1.bb => mdns_2559.40.32.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2559.1.1.bb => mdns_2559.40.32.bb} (98%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2559.1.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb
similarity index 98%
rename from meta-networking/recipes-protocols/mdns/mdns_2559.1.1.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb
index 212fd0eab5e3..9cc6708d18c5 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2559.1.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb
@@ -27,8 +27,8 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0005-Fix-missing-limit-declarations.patch \
            file://0004-Add-definition-for-MAX.patch \
            "
-BRANCH = "main"
-SRCREV = "71e6611203d57c78b26fd505d98cb57a33d00880"
+BRANCH = "rel/mDNSResponder-2559"
+SRCREV = "0b8a5dbcefd6cc72846385aebfe4f6111f2814cb"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.25.1


