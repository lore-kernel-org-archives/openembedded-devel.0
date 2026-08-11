Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0703C5AD7B
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 05:37:58 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48358.1786426669094064276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 22:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QvIVLyrN;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d02b4c3601so29924265ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 22:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786426668; x=1787031468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7F0jpvtKH70Rt9tO7onpD4wA0/0NgPXEQRIlwVscGo=;
        b=QvIVLyrNyZk/q0hrebfj7wBdk4wkDHXst76UB9qPZfZQDTewHYShl638KVPLd7ZQxk
         2wKygkgGFFV+CtSCQBtFu+4vKNTH9zZNQbl1g0C9G10zuyDo/C0s1AAg3sm9wjhcMLjo
         IuCukCL/+8DgJuGEVvqoteVQEXv+mPKkd/7/L++bpVL2MGRJ4V+5o/uzGqG6rPJHibk4
         KUShWl0zR1vxIIw0LTsFqZcNNXFR1j/1ABoMyzIPuvERmtJvHFkRznSGRp2d6ytCi9VQ
         uF5qHSL4+S3EB69fencrudIwcuV2OtAP4DPImhzLhtNtY0ZEFDt6kY6CD5uM4zx6y3SD
         OnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786426668; x=1787031468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7F0jpvtKH70Rt9tO7onpD4wA0/0NgPXEQRIlwVscGo=;
        b=HXWNMapyFoQVF+HYmlZm+v0L2ARXmjBa1flhex//j0wzgS0eowb/n8Q0723h58EQw2
         rJWuEZb7XrlxRpBF3D5ReCLu1tcKtvp/6aqs9YU/zdzvULrzzxISNNnG9Uai6wxOar7h
         kvP85I3p0pvcpKFU5P22EfegTNn+GgHi94TafTL7x8PIcGWGiNuQpGl+MP3fyORr8i5/
         Dq+N1P5bCKOeVv3eTcSg0num3mSObekU3PNC8cb44LQ80/tT5M6jAIKAuHYSjQEx9leR
         /rHxXvhfq2Zx0XDovMKeRB+HPvkO68byYajUqruaXrOnZu1b5T9iJQyKXBoNxAzSx5Cu
         4cLg==
X-Gm-Message-State: AOJu0Yx/N7IJRyFLgNClOCmL+ESRav3x/lOGMGQIod8vCK6MB1I6TjFq
	YlpsDNtKBj5WF1z0HXAdZ1elZoprQVVYZbRN/p2tedMEieHXABeQTyp2+io/Bhmr
X-Gm-Gg: AR+sD12ysYqHW3VKkr4OiJTpLdaXhzdwVu8x5nepuApWnJ3JNQd1gpIBtZXtMDRioTm
	BmZV31FIw21LY4bp1zg6GTaorSsATag54nUMr7FXm1p1/UgN5KDDZFMBtYlGOh3FyiXuYWrZKZ7
	0zKrYPeOt+uS9bwOsKQOWNKlT7TP/HkjSaPKtNWOfz94O8xuPa1KTDdJEqdigjo2nSPrwHE0XIG
	PB3ryweA4jx2aRSTpl5zziaTx7lBSbPO3oSEYo5aXsC85KSh1mh6ch32sNvTwYFz2Iv1tKQLr+x
	+SEDmgUOPkcS/3hdIbGIMHYZQ0ONobPwJfrw46BHObsw/SGbQ9xzPAUGhL0jOBOfHDYbDagYXYv
	q1/zay0nrxtjCznLLp6sa9vm4O9OlHhurKjQBD2Kw14+xAzf/wPeRdePoerfsNWirgTuiVNfkU4
	HrqKApqGj7vqSLe5bsEq+qJ6017je9ZCsSXo+Wgcx42y8p8v6W6uSiUqK7UuNpnkNHPCY4ANXmN
	iaFOIIYeS65
X-Received: by 2002:a17:902:f787:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d31791a1bamr12863255ad.12.1786426668384;
        Mon, 10 Aug 2026 22:37:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c64237e9csm923812eec.18.2026.08.10.22.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:37:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/6] capnproto: upgrade 1.4.0 -> 1.5.0
Date: Tue, 11 Aug 2026 17:37:26 +1200
Message-ID: <20260811053728.4125303-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
References: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 05:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128912

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/capnproto/capnproto/compare/v1.4.0...v1.5.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../capnproto/{capnproto_1.4.0.bb => capnproto_1.5.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_1.4.0.bb => capnproto_1.5.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
index 948ff80345..b867c72e36 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https;tag=v${PV} \
            file://0001-Export-binaries-only-for-native-build.patch"
-SRCREV = "8b892a8a11a632f5d52b877a49728808a142379a"
+SRCREV = "373e61ec89e2359f1c362e9b2eadc552f4779306"
 
 S = "${UNPACKDIR}/${BP}/c++"
 

