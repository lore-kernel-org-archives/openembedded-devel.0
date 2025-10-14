Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE87CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:47:06 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.156.1760474816560653068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1lG/w+W;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-781db5068b8so4636114b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760474816; x=1761079616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmHclUJ25MIJyZi2SM3obrQODuP76Qo8MHLLqy2MftM=;
        b=g1lG/w+WsQ5LIe2sSJvkps1HQwbioonEWKT/TUXM5DzR83qEm2vgaj7lhNJwYYXZ1P
         GipBIsPL1UMZLy2lTX+kVp7pRL0RJ4OEh5TwuVmEj1qbiVEbGUB16+jO2fOZBTdu/voo
         qmyY736Hp5m/rE6hlUTCj8c/o8EerxuyrxtpyyP9QkWz3BVZ6V5hRJenco9qpZY1R70c
         hyWicxt+NxLEnjHcKjy4N9D53/deqFcMz8Htodp9y34z+Kl50ai8tHbnsEIYw/m/79G8
         OrNqWuIO1ji6TDhMSv+UoQf3PeFhi7tOa7qgJAEYEdFBOHkoip0DqskKOESdYAKlAH6p
         ReBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760474816; x=1761079616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmHclUJ25MIJyZi2SM3obrQODuP76Qo8MHLLqy2MftM=;
        b=Lio+AECbX2GN0nA7xg8lHWKQE9EBnKGYo8Q55+auJNXwKlEcOzW1utNkcpKDJLkmtF
         I6hIFplOquK73gtiScUh1pbCCe9GYR8FIE7OGTViPGj9kF8TI7wKj7exta+gCptbiTxq
         eIMxsa9pbwL18s6wtgOCENqbUrNPbWPisCymbRGIuvbF2wAZd8ObkCT+T8+eCClQ81v+
         mS8/QGr3400YlhCUobrCpnPJNlZADv85NFVWl1Uf/LwnYZEoccsVrdiZIe3Hdi5PCkm0
         KumKlx9s12A+vEo75g1xvZVstCCfhNjUt6+eHhiFXyKNGOr9vUnfobwQ//NjQSvgMbuR
         8jgw==
X-Gm-Message-State: AOJu0YyN2U+rsbo2/qJHkRvnbAEIThiiEKNz2V7qQ3cetP+MjW0v4JSC
	5hY2OJJDMpe6/7hbTdaVJXRGzVg9qMY26/Qn5S6aU9lIapQwXYwxt5BUQqnZQA==
X-Gm-Gg: ASbGncs6GSSmWfHZGXAmns2T1R15BHAXlCtnhrrwhoWBQ9D4mcyqgFNjkO6uRrGHr6E
	x/qI7FlNkLlmJjT7/Cifvw2aJ9uoZNqZ3+mHfBqrh0gDhbN/wYxEZ0ZsWoVuEyS7vYbqOBWu/9L
	zcbJBO1POn2dgIzmUPew7XO2WNPYfdhbhvwcDhp+YV5QKewpEEKqo6q8lfWadbpNYNOzkTiljRi
	gvMxIzXsqQKcRA406lBUkpzzGXe+eskaAVSLf+44Ye8RxsuFfMMQBzNN3C5nOCyjF+rkX7VKBCn
	6qH6ILrJ1aEGb/gnl7GNpcNwCw2vxbrmVa9RanrP85hWewEKiDrjR++trw2cLqL6MkBFCMDRET2
	i5umdM75/XEzDDRAyT2EjRDPrEr0xZeuhZ5wTKKpGS4uDbyRSYuuk5NM=
X-Google-Smtp-Source: AGHT+IEbmBWrz4uAA1jPSheJeZunOMh6loLLLac/rzFEooQiwQ/2QQSYpTjIHXvO2xTxL1sfWBNuZA==
X-Received: by 2002:a05:6a20:7d9e:b0:262:82a6:d932 with SMTP id adf61e73a8af0-32da83e68d0mr33081913637.48.1760474815788;
        Tue, 14 Oct 2025 13:46:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm16134829b3a.30.2025.10.14.13.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:46:55 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH] libavif: ignore CVE-2025-48175
Date: Wed, 15 Oct 2025 09:46:42 +1300
Message-ID: <20251014204642.1483646-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120632

CVE-2025-48175 got introduced due to following change which is missing in the current recipe version
https://github.com/AOMediaCodec/libavif/commit/1b4ce5ca24a33b5878b7f766de6eaa05c49f08e6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
index 885758b6a4..8ddd16ee2a 100644
--- a/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_1.0.1.bb
@@ -14,3 +14,5 @@ DEPENDS = "dav1d"
 inherit cmake
 
 EXTRA_OECMAKE += "-DAVIF_CODEC_DAV1D=ON"
+
+CVE_STATUS[CVE-2025-48175] = "cpe-incorrect: The current version (1.0.1) is not affected by the CVE"

