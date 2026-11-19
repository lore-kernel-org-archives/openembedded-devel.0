Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1869.1795113408537297129
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GsKsFGJo;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06e79e152so75653b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113408; x=1795718208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqCep6bGOM4a9X2/cTpL8S8Fzsnr1WPXLEZa7Cf6wXg=;
        b=GsKsFGJoKKIO0z55v/WeDG79tFru+TSWiDCSfu6OjvdMVhF4wJFi7xLNl+mR+yz7fx
         3EL52pkvGDNiM/6XvoKEnfZGYptjdzRKqBZU3QpBsncx/aqQjLGXmjZ9g4vaAHgPU/C7
         BvsY0TMpLkAdPkRyuggNjA3LuNuRehBmxCV96XErZ8SxVqFZuWG8E6TuOSPKTRuNRRWS
         rnXuFkGrxYU47aBcANpo7fBTNoHyr+Fwz7uRhMFpaTM3SK2+W1HU6gsLW3f26CLnmSRZ
         poSEvQYnmG8fEDT0GkKprPdTuE4hoaymbyS4v72cPhUrCm5h/6xEKbso7HFjYHYjRRCa
         Lglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113408; x=1795718208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqCep6bGOM4a9X2/cTpL8S8Fzsnr1WPXLEZa7Cf6wXg=;
        b=lTo5lPPn4KMDJsMnyuBvzBpTflvCtyToq1lX4tjofw1GRhx1f8nGLKMLhnvfPbmYXc
         u5wgROMMrqir8D+PaTQCJ9eO4MW48zHDhlu6ZDmhF/6Ja/NVIT72LTHIpTBdRz7F0lzT
         VHu/CmOjcv+YGnUdU0jgeJ4Wgp5KWZmfp3y8DOBiPYMC5nPp8Ttp5vwvgyI5Q4rsL1kF
         mvvqN/VxsP5UpHhwF/aWFWSKdrYdqHLvwQuVZeUpjVN9OXDW4JkNsdrEYko9m8Pu9Uk/
         9i9DUqp+cAK9ao9anwmFcCIVjfGpD8P0ms8VKqCPGhcf8drCMUGWmgv9ePalrJayOszv
         9g8g==
X-Gm-Message-State: APuU4Z/MWOqAN0suEYZK86o857JNAqTk4MU3JEnJfqw62at5dK3HIY3b
	x9xcLHghMWwI3pyzOeWt1fjkpEXxyIeMpwh6rw7cQ7gfwJj2Hv9O99w4uQNNnw==
X-Gm-Gg: AYBFou3130w5v5iU+6B5gGAp2fdcbeuXS2N0FadJFeZVSzZ3+lGWC6/9764z1D8eQAk
	4Mfl7IaZE44vjohhK47X1uJ+g9nHllGX3FYEt9uBJlKaPnzK1ivxlCpaqm84NSfuFzYduvH85BY
	Ab0ikotEc1G1UcdUzE4cy6eZeAadqZ28Np+4yoljYvdhwzCNY3UXJO+ibXWmjeWRsWfZqXGwMfy
	wYOkgQXDzmHyx2RVjHQzS4GTkPVQJv8x7ew77Ju/xGZvSrbCk2g2G3WreEciOKOco95hfFPrj3S
	fef6qk2YmI0w7YQWbKNBF6OXTQC+tPsf5ve+eE8gryafPvpUGOlsQk/weejbCqFVIXUVfoyP2tY
	Igpz10egyac1B2XT6vORW4lFIljRSduOzAy/TQ7/tgwfrYWJJb4765FXw21pCCVoxyu/1zIOXEV
	fgaEPdVnM0Vld8IcoM90uw+8IHk7NtoW0Cc/WC+FHloqnvsqjB9ulKBoNQZHjVlOMmZ01JZ9jh8
	njmJipTBD9uCCnxel3uNCcoY4C0nZm/pEy0fi8AgnUdx9JBqbXlr30pdULIh8zaCd9dAehN526g
	vV2qVDCh9SN34hyyfgvQAzC0kuqKaX+yzMH3fyz6wfNAELSoBLDlkXD28xxe2A==
X-Received: by 2002:a05:6a21:4d02:b0:3fa:e66a:fc64 with SMTP id adf61e73a8af0-4014d2549f0mr411402637.36.1795113407861;
        Thu, 19 Nov 2026 10:36:47 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Siegumfeldt <mns@gomspace.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 20/64] spitools: upgrade 1.1.1 -> 1.2.0
Date: Fri, 20 Nov 2026 07:32:48 +1300
Message-ID: <148a37fdfc76afc3e8408b9da9642dc93be143ff.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132710
Content-Type: text/plain; charset="utf-8"

From: Martin Siegumfeldt <mns@gomspace.com>

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../spitools/{spitools_1.1.1.bb => spitools_1.2.0.bb}         | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/spitools/{spitools_1.1.1.bb => spitools_1.2.0.bb} (86%)

diff --git a/meta-oe/recipes-support/spitools/spitools_1.1.1.bb b/meta-oe/recipes-support/spitools/spitools_1.2.0.bb
similarity index 86%
rename from meta-oe/recipes-support/spitools/spitools_1.1.1.bb
rename to meta-oe/recipes-support/spitools/spitools_1.2.0.bb
index e2ab0a5d11..d14affa9fe 100644
--- a/meta-oe/recipes-support/spitools/spitools_1.1.1.bb
+++ b/meta-oe/recipes-support/spitools/spitools_1.2.0.bb
@@ -3,10 +3,8 @@ HOMEPAGE = "https://github.com/cpb-/spi-tools"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
-SRCREV = "74ba65b19e0cf9d1eabd52d17d842200ef901d61"
-
+SRCREV = "57a950d2853aeac3e69c4f79873c0ab9930e4f7f"
 
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=https;branch=master;tag=${PV}"
 
-
 inherit autotools
