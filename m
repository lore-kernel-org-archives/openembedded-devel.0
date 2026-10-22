Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20969.1792669645184057986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 04:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T9GmxKn+;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-675676afc3cso1837945d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792669644; x=1793274444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3UbBYYtmH4MgN7xUV/e3hXMhLYHCPBugKmQ7z1vH+I8=;
        b=T9GmxKn+0LLcIrMkJIaTm9rUoIKY0QE4QnY1FoMBeq1C3MBuWDDhy+Iw+xVjfcMEpQ
         2tU2c6/sT5x7lb8Pt3GUM4T77iXqgoJvR68dlD/6XKMORm3ICunOTz4ctGuZeZ9cog5c
         LrQShReOY0Mv1FmJlEPWDCqxRvjnU8+DR7ttX6S+wPX3GmlexeV3FCrjF8AGXSY/y/dA
         iIOJwM0mbRdLhkpwD11udbnzucE8a+8IzRqH6x1Vr5UF8VC2JPYWTLy9JNIU70DTTyQZ
         RyXv63q9C8AakdvpXkvM10jKO8KfOK1vuXp71t6u4+XcVx9SZnUaL7q54+BAGgjiGlBR
         rtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792669644; x=1793274444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UbBYYtmH4MgN7xUV/e3hXMhLYHCPBugKmQ7z1vH+I8=;
        b=TBUnbaQHOMX7DSNB66OlE14v6e1AvDW0T58WMrZOX72wuZFnMCxCXqtlXSLu4wNprD
         MW0xuTVgtin3NnewQoKm7O2J6D7bFv42UAZVhD1IUDtZxNjjR+HBU0OPosd32BWn6caG
         vTqy+xX1fhPlhynFlrlBFDxTUJAI6WSwpcPaq8nhEptjAdMFTktQt0RvyKLxZYQKgIpX
         Wzk/mnwRJCJ7qt+kFVoGD3gvb/1kd6XFYlKj8QWVZZ5k3+rryIfrld9+648RzM0n5iDc
         eXmPu9YSjwm1ez5i2RndkYAOD7t/OPLvyp5p65zm74qidVNkDLoZfp3zJJUG0r5k2p9h
         X71g==
X-Gm-Message-State: AFq9FYISDE33PrSqkUz5OZNALEUKKxDj3DfJCdlo1AXxMa7quAX+mXi4
	VPczhCueUxz1z6j8SlTzugYLQTEtfdgJTh2MXFbbnQ17oUhbt6/SeoX9IWgSF2gr
X-Gm-Gg: AYBFou1NjmKT7NpvvhzYqZSNbbz/bzVtPLjoaqgNaDHxEWK3Ejns+RfN0bNMgZQECPR
	w9BVlfnd86xuQdVlIhzlhRMC+FpROKVdVFsBZsLfhv2i5TUp7Wh8R2wy37EbbjbAbZJHVv458Ze
	TFKAtuJqofL2eNy4PCw4FptHYuiN2Xo2DhuCrmfCfm563nQ/WiZNzTnGK8lFQP5hgvC9XCwqGIO
	tg8yxxYaORGke6DBPIQz4VzFRPoxpp7gWzwd4pvWm9qiIFka0mUl8yvP1wiXOeBRmYRoMKQ97jI
	7s081fc2aYinSckUPifbLyylfKz+4B1cVBdAsI75uXS7PEMjT4xZMByQDhvLgBQBx8UhZ3Zc7/Q
	TGBLxxo+gJdVHEAds/vJ8fd/QHG6RYPSLSSv/V4MxoaS+AHkW4Ss2Tv2n+mLYJ2ND6gaE4P6GS0
	q61/KNidCVtritC14ZGzOkmmkbVFOBCEwFEhFU33pj/wZ06ULDf41zT50AyIzfPDzu+cBGRJCzl
	S2MWk4q0q3V7CQwGaWT5DMShefS7DS5kTnLEW5dnHZmd2n+0HZzUJgsm8NybmPxndobSKvyopWK
	47Xw213y3F/cCh4rrUl9IxKh1pv3jdCSXh+wdNsbRxlyBVSt8UtpaLGY4CVHjNwMPQmuEllHsB/
	qDto=
X-Received: by 2002:a05:690e:418b:b0:679:b705:f1a4 with SMTP id 956f58d0204a3-67a0e46b429mr2535388d50.21.1792669644062;
        Thu, 22 Oct 2026 04:47:24 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e539f46sm2492817d50.17.2026.10.22.04.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:47:23 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 24.22.0 -> 24.22.1
Date: Thu, 22 Oct 2026 07:47:07 -0400
Message-ID: <20261022114707.100800-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 11:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131312
Content-Type: text/plain; charset="utf-8"

This is the October 2026 security release.

  4 high severity issues.
  3 medium severity issues.
  3 low severity issue.

High severity issues.
  CVE-2026-105482
  CVE-2026-105483
  CVE-2026-106069
  CVE-2026-111497

Medium severity issues.
  CVE-2026-105481
  CVE-2026-106072
  CVE-2026-106074

Low severity issues.
  CVE-2026-106070 (affects only nodejs v26)
  CVE-2026-106071 (affects only nodejs v26)
  CVE-2026-106073

https://nodejs.org/en/blog/vulnerability/october-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v24.22.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_24.22.0.bb => nodejs_24.22.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.22.0.bb => nodejs_24.22.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.22.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.22.1.bb
index 39a8563672..4912136f76 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.1.bb
@@ -35,7 +35,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "41f97cff2c666f1f8293dc5f85c65e8dd605c16b43fd9febd49ede32ee1e0329"
+SRC_URI[sha256sum] = "4f5379796280cdaeb0c2f358fd04b6a16cc4fb7dfa83b5a8c91a9d963b435231"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0

