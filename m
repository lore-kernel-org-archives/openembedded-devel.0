Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.2028.1632360311273059704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 18:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQx/v/JS;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id j14so2970153plx.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 18:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3B5gC2OosPVWmG9WgQrBtq2rs6U2cxLEpL3wRNj/x6c=;
        b=cQx/v/JSuYt39g5cNtdsNjuRRWpz1hnp+fKg0hOVUIgRsvsUs1kjUb/xFZBYXsowDD
         Z1imQ815SET0FcYmqxrvB5FZoE23C+J03khTu4lDbR/72N6lqUU/NC+U2vJ2FngCdIQp
         8XnjfFIfdIlyokkhOp/rL3FC9DfnrqP3BtgZOPBMfb9ZjnAfsfZsRyCXrOGxs4xwlrco
         JQZLgfOxfN1qVv9Sau1X1Tv8iSog0SuI4EtKKuBcWRKy9e4wAyxCjtdnlV/YwH0zgPZY
         ObelDJ24LMJCCzAVOUfpicSGVIYLooQ98cVgRtRaPo98USwkrKM/Pfw4vNbyQn7xQ+t9
         5tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3B5gC2OosPVWmG9WgQrBtq2rs6U2cxLEpL3wRNj/x6c=;
        b=4Dvdn792pEGVoqwEW1EeDjeFuxdiTBqNCpU6rCz/BaIc8m8BASlgoy3sUGZXT7KA0i
         7D6Su2dwwXOwBZF0DjFHaKQpFal/RKTC1dByiVVCm0v3uAq4I0edlfRm6SqhOYUmVNir
         G551zkzqhXF3/veBiqTbOW2RMew+XsA0AR8XsBpYXa6jUfXmU8EktqptAbaCRfzdiGM3
         xxBHp9IftGyqFL5u3bCdzqwoohDjGdzGeqITMFaI75kiMsjHyRV0gqigMO1hvd4Lj0Cw
         pqkj/1+2maXHiRd7gRRHq+7bcqkN53T17CIL4X9KU83M9larMOGZeGtfAId9vTtEEuUY
         qvTw==
X-Gm-Message-State: AOAM530lxepPgfSP3SRR+ikgaD0uR0CQcQOc/hyYub1+Ns2jrPq02mSy
	cNwZl1bIYRIv7mOW7+1nuJzTyoR3deXNWQ==
X-Google-Smtp-Source: ABdhPJzYjTkrwShKqi77sAvgVz0N/blOlti3U9/QUyuymQ/ewZK2Sor01Say14HDtH1IZpzSBFRyiw==
X-Received: by 2002:a17:90b:3508:: with SMTP id ls8mr14761638pjb.44.1632360310553;
        Wed, 22 Sep 2021 18:25:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id e8sm628747pfc.153.2021.09.22.18.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 18:25:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] ntopng: Inherit pkgconfig
Date: Wed, 22 Sep 2021 18:25:05 -0700
Message-Id: <20210923012506.1693632-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923012506.1693632-1-raj.khem@gmail.com>
References: <20210923012506.1693632-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
| make: *** No targets specified and no makefile found.  Stop.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntopng/ntopng_5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.0.bb b/meta-networking/recipes-support/ntopng/ntopng_5.0.bb
index 89107430ea..0ddc596782 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.0.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.0.bb
@@ -29,7 +29,7 @@ export LUA_LIB = "${STAGING_LIBDIR}/liblua.a"
 LDFLAGS:append:mipsarch = " -latomic"
 LDFLAGS:append:powerpc = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
-inherit autotools-brokensep gettext systemd
+inherit autotools-brokensep gettext pkgconfig systemd
 
 do_install:append() {
     install -d ${D}${systemd_unitdir}/system/
-- 
2.33.0

