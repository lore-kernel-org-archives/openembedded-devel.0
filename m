Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.3268.1608096617127174807
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Dec 2020 21:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZADiD+bG;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id h186so5416557pfe.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Dec 2020 21:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2d2p57YSeydympsb0cF3+7gPscwz7Ak2/U306gS3XME=;
        b=ZADiD+bGYEnrybe4UHGgrMdATsD373sc2tWpxxzj7HDPcspsJItWipiGKuhEWC3F3c
         WMgzhsCpxvz52g1ly0YMraSm0Xkshqpo9WxJJoVlGQ6dch69szhdcApIodS/ZmLWwm16
         EnD+Pkz7U+WXws288DqbfjDIPBQbUGZibOIV/C7wiULLUbhcnYNezEst9TAJFfLcR+jO
         aB7v3Q36oTlKhgmYEif3jfH5/ps9OSzNAE58NPPqxL//P8FcACwVaIW7sBb/9QqKlxxa
         6Tyl1Gelt33l8rvfjYDwzIp4NaBpzwnsDC+Zq5ggZAUpEy1qh1baMr1i0nddC3hwElmv
         SCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2d2p57YSeydympsb0cF3+7gPscwz7Ak2/U306gS3XME=;
        b=gqkyU7NmUwLm6ydQQalhqT4akHchuox10i/VoSWAxXpbuzPOscEH4c4hg8elazWtf1
         KWnIMyx8Qj2/Ilg02rmasp3lVjYPXjF60cepQvU9MNCCzu5GxHM0uDLgnEycqktTBB+0
         T66TpkLMnWW0pl+Sf4tkypOlZwJRS3tcLwk5E4ognQleS295UFYRL9tELKrsAoxtrYqS
         1nNd0dxq51/nljQDGM+TRnDtL0wt9ysTeUE9J7njMtiP8bUvLdCQ+ld0dOWbu7FV248m
         MnsRV4rpYnQbs5q4x2g59T/FPneqXLe/6CqmUMgf2UrXeN8KSQIPQNQtbXn44ems39nL
         Hz4A==
X-Gm-Message-State: AOAM533rc44U5ztJkOZESzf8isJb3eZmZBe2PLc4NYESLQWQcoMrMLoN
	pX/PkHIsP+VJxh3+2+qq/Pnr/RLykMj18Q==
X-Google-Smtp-Source: ABdhPJzVnWL1WTjSw7YMN3+EBUGmgDw1nje6BWaye0GuWwk4ofOerLILZis11UWxbb/KQJ5y8Ro+fg==
X-Received: by 2002:a63:4925:: with SMTP id w37mr5285310pga.64.1608096616143;
        Tue, 15 Dec 2020 21:30:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id e13sm887230pfj.63.2020.12.15.21.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 21:30:15 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] nodejs: 12.19.0 -> 12.19.1
Date: Tue, 15 Dec 2020 21:30:11 -0800
Message-Id: <20201216053013.1661310-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

Uprev nodejs in order to fix CVE-2020-8277.
This CVE allows an attacker to trigger a DNS request for a host
of their choice, which could trigger a Denial of Service in
nodejs versions < 12.19.1.

See https://nvd.nist.gov/vuln/detail/CVE-2020-8277 for details.

CVE: CVE-2020-8277
Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nodejs/{nodejs_12.19.0.bb => nodejs_12.19.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.19.0.bb => nodejs_12.19.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
index 9d15586238..8021fedf44 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.1.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "3b671c45c493f96d7e018c15110cdbafa4478e5e5cfc9e6eec83cea9e6b551e1"
+SRC_URI[sha256sum] = "74077e0cc3db000a6f3cc685b220e609807b61adc8e7d8243e8511d478d1b17d"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.29.2

