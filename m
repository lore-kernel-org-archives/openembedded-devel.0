Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8933.1793358200412450052
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=N4wggVdr;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso542710a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358199; x=1793962999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTanHciY09kAbfyBGAo8y/tuJin2wTamvMgsOMNvLQk=;
        b=N4wggVdrE7aq9ifgLZyn3l2f9GOO3oRktFJJSDOsyXh5s7SiFxDZts8RCTrvx1kiuF
         oznCBZwaKKcSlgUOL+usdPLXSLRFFVNVh17Bi6p9hJuxnWhjYc6O9aEYTztmdrFgMC6x
         5Kq/Fl/jec64A5bzGaSftxh++/EMDi0wxMR8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358199; x=1793962999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTanHciY09kAbfyBGAo8y/tuJin2wTamvMgsOMNvLQk=;
        b=ZTWeSo4ehtFHJgE0jyqcAR+KPgIzvhuKZfOFWn0Dvewikd7HqHqUJLVEnenCSnqzFE
         o31e0RtmAXdbE0Sy/nfCil9qB2rNBClmH93y+9tQxmuJ0g8AyoOlb4Muw3UAsyrsBTpS
         uNkJ69/VcB6E604RikNghv2f8LeQTwJHeu1RZO4g4VjTCcShs7QWgZDhaWtcJZITBNkt
         EI/sG7jMgYrmv4P4xinGeuDQzs2wtRX4WdudfFD5gB82drWQbfdU/QRGFvazZBLA8ZCK
         M6vEumjKFeuPGSfVUq8wlHuo2Ie0SwI7sQOqVcCS5m1BEbT3qDY8x4cA4SFFkuCQ3iSd
         LxYA==
X-Gm-Message-State: AFq9FYIbsmHIM4wMa+fxj8kwxdDctZgv72WfEWo34s4WBUMo8BFweWHj
	jMhFMzVEbRJwoPNjdHNOeq1UToJBjyfDFlPm6a2MWizhZATRroDMANRyVYYiHobd+am7YK1hxel
	JZvPs
X-Gm-Gg: AYBFou2l3mn3/4Bca5Rf77jvjdbV9j3nrVlJceAeV8ObprgsJlw77NVShRrrrE3ZoQk
	oJEr/LgD0cy0eqplL23/M9xPLDykOnk/PoAc96MR5WiWmIlO+p54L0V4oLmFEEUh1aKudcjywZO
	9Ncj72sxsMMTC6PdiwMzBgMGSbOHgaK16wfgZCknU5szD+tsSqve/RefQ/bXg4+sdxk9ugZ/69F
	/VG0W0eoYbpKV1spj9cJ0cpy4Q7lc9kN+J9YVyM1l4lt2rClTC3GSNPiLPqzhDXO/vQSs3g56Ig
	943CtrWGu+nuqOM5VNuDveSRfe9Cki0QGwR/W1IPXyQ8EbfOht9AW7ay+2/6Qzwk0mvHZnsviaW
	BnMqfctmK9jLGE7P+J/baNDvi0hkrkRzcWdvkg4cgvz8Qz4y3ENEaZAdpLR2ukvLugVwAiC4k4S
	KpLcjeW0GP2QPXLeBzdWLJqs1UR+XbYwp7UGGOhmHpUBcNTbW7X/AlRcAJsr28IzdM6UKp1LXTq
	Zu/khCiPGPSKmxF0X4dg7st07U0VgPiuNSC5NRnYr1rIEm6MmXIZDOml4gH0WgJv8Mnptomhn90
	By6AUCKJE+7gWqaAs4Mj/ygYo5sd9F+VLQ1I55ufyDc2lGNLjl48dI/urOPk1imLYZQvmKBcWcb
	IDagjJwUEnR4pHc1BUZFz3Ymb8FHvUpker6ZD6OhWVfe7Yc5C2BB21A==
X-Received: by 2002:aa7:cd73:0:b0:6a7:e514:1d85 with SMTP id 4fb4d7f45d1cf-6b4d438a5aamr928200a12.13.1793358197627;
        Fri, 30 Oct 2026 04:03:17 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:17 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/25] python3-engineio: Upgrade 4.14.0 -> 4.15.1
Date: Fri, 30 Oct 2026 13:02:48 +0200
Message-ID: <20261030110309.1124614-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131686
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.15.1:

- Reject requests before the connection completes
- Address possible race condition when checking the last pong
  response to a ping

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-engineio_4.14.0.bb => python3-engineio_4.15.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.14.0.bb => python3-engineio_4.15.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb b/meta-python/recipes-devtools/python/python3-engineio_4.15.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.15.1.bb
index 3811ca332c..bed536229c 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.15.1.bb
@@ -20,4 +20,4 @@ RDEPENDS:${PN} += " \
 	python3-threading \
 "
 
-SRC_URI[sha256sum] = "eaa1e386baf9c2c7959eef7f9d9165c5ea910c5b392f5316e78d29ed073cb43d"
+SRC_URI[sha256sum] = "1a412e798a90c64fabe7b20798939ae6d4a03f34da8a33d5a21a25a8bbbc3612"
-- 
2.47.3

