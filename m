Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E049ECD4F26
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 01:54:37 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3152.1782266072682828129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 18:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rIX64eMd;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7fd8446a1cdso5573347b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 18:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782266072; x=1782870872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfNmykSfV5RXmxSF5oJMdNZLVkqkWgLSyWA8sLbFueo=;
        b=rIX64eMd6nepjw686gctznbIHOKB6rivCfF7ArqiExXoWtr0hUApdil3GSSlkyttZ8
         xwGimAPX33Mv0gvzECOzerRiwfJWIHyt+QYiXDYhZWfa/vMFqIorpgIxIwTFrO0yaLxx
         MWpzNOSfRF/ngCWH+/CZJGTH4KT9HPbiflFB08HQw8yJ5q8Vd2fM6GZvzf96hrjbDxvc
         wjLSqIq6Pn0ZvJfnp18rSFeIGscRV3kZvMd4YWRY1rGa5wzyBJzYGaKjPxjF8vBkMXhF
         h6PK6YJAyzQ2j7DB7+meqQAQoZ2M2dx0K60vP/IdbTBYO0bMgjTDVAvyNtZjjnOa1UUD
         rtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782266072; x=1782870872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfNmykSfV5RXmxSF5oJMdNZLVkqkWgLSyWA8sLbFueo=;
        b=k2khHWDGlB2R2YfoJDSLQkFjGEG7Yo4GTLX2GecgG502ftqTvXQTIjdpjYj5Hh8aNz
         kion7+AsBI3egAHatApWl2JwfvaAyySpypJQNaNVPPu0EJFj72eeLTqRrDHMRtITfBfm
         IOXaCelO9UCPNAFswj0FzdwM7aqbBfS8/D2IZphMGUa5ikPF18FvC8WAqjILYsidtyXZ
         IBwh5eCzi2/by3obT6+XCn040XbUu0B8znlIcPR9tE5LB3it/kNH9mCIImTrbV230aSR
         BMhinXkRRH0UAkkgvlt/V1vZ8CUx1ruASCKupiDU51kV/Rmaj6dionvDSIjC865/Lvxt
         gF7g==
X-Gm-Message-State: AOJu0Yz0NkS4VMWFWGdTtg/7A/GVObcLHu85lrjjXtOu3NlZNeNvow6D
	D+RgsoFa9MCUXxJ+Y/VPsmVLO2pzSgoS36/BG6fi9HYMl/NXL/U1/1BIUzm/bKgu
X-Gm-Gg: AfdE7ckE5/Mh0hXEIPANo/gweQskb2WZVrLT4OBDkb+B8nv1H9MqdHciU25BcdPzEI/
	7ylf9iG2H7fV6+pkZBu1F6uMKyR2y4xZgPdJ2Bw92eOF6FGZxSd1AZMGroFesSQBEWX6rnNgNtn
	6xbwtYu/TKr+94oTaZ5x3MN5yf+L7hBskjTPqy+vYxpEntY/wG2BKDRoVyaf6/x1cEQIuoQLmIn
	vafdV6aArpSbrHTvIJc6F4dX+tF0eMTwxc9a44M1aWEdwjG7S7EGzgYZknVT2G1Z4/T3YQR4a/g
	TYXyYZdKHnUT39RtEZNJhqhH80h5I8I7V6zpdwuHwVKDzzoWC+MxCKUJzUqrepsvMz47kWGj3MN
	lHic2n9sBgD+VgREt18slv8vpODS4Eqtx76CZv7l8idJLZqWuUEBfTACsrHTfLAo6s8+uUAh9Rr
	IHGFsCTZNerS+xTDdx4IhOwxaMed6TTrPhtJrvWRpZR9bbbZXmMCTRPDhQvAslr6haWl9EKn3P0
	WG5OY5yUmPN5MoOmSUJHktmimMVmrAmeWKlgf+J
X-Received: by 2002:a05:690c:4b01:b0:7e4:bc8:7ad6 with SMTP id 00721157ae682-807ee29a835mr13952377b3.30.1782266071531;
        Tue, 23 Jun 2026 18:54:31 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025c96fda7sm52547077b3.3.2026.06.23.18.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 18:54:31 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][wrynose][PATCH] nodejs: upgrade 22.23.0 -> 22.23.1
Date: Tue, 23 Jun 2026 21:54:15 -0400
Message-ID: <20260624015415.824085-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 01:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127704

Changelog: https://github.com/nodejs/node/releases/tag/v22.23.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_22.23.0.bb => nodejs_22.23.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.0.bb => nodejs_22.23.1.bb} (99%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.1.bb
similarity index 99%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.23.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.23.1.bb
index a55a8d8940..8ad884b9cd 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.23.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.23.1.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "3acfae100c7b855a4c76520ee0f95cadcace3f4254f16b7d4887f178fc95d4a0"
+SRC_URI[sha256sum] = "b27385d6845089bdb91285d94b06c2a5cf1c37f8173a3c4e10824cc1ffadeaba"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


