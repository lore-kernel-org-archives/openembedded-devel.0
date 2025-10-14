Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB64CCD18D
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 04:23:56 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.7464.1760415835783398253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 21:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MGIs+KgO;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-781010ff051so3453874b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 21:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760415835; x=1761020635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egsaIfCXQz59EOWSXaCyuVMnL4MeHH/a3gjDfpZeR1o=;
        b=MGIs+KgOXypImoXfbbOdGmLdhKPxqfxBiwShjjAiVV590gZUxduWx1Vviy2InoS9oo
         dPVkuD4sz7Geg4Dawk/nV9z8exv4cOSspmCALrf06Vj0JRzDvpFTyGMFTQE9dMGDtQ9K
         18J8R1Dhgy3JOczVMsAO0nlrVu+Vpst84OcBQwDbLuPwWBj8sFb3+mBcTmihLJtcuQFK
         nJu6AVWYzIjcbMAJupHm+l/yNMhVOm4bvgdjWbpNaGzk7f8HwiP4h3jNO6GRouzA5KzO
         omm5Rt0kvNxx1oUHSQGrmgQeIQQljeLk4T879xNcLsQ+lalflYiKt16w/OyxPimU2cZz
         qXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760415835; x=1761020635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egsaIfCXQz59EOWSXaCyuVMnL4MeHH/a3gjDfpZeR1o=;
        b=cUByLIEZds0SqEvb2JHbyvjZdyWxlDfnhEPT/Du1fUETde5YPOO0FSD8SWt0rYI3n3
         FdH1yp0HvlQRjf/wSrygta4y2W+hb1xuS22pNIxIhGqCOP9jPd2t7J21d4oaDtVsTxhX
         pOswt+N5w8tl4afJ9Ob3OWaw2+3q4IlUg4qFtago+5Q/ZZs4/Lf67R+/uQq+6Ql5qusP
         bykRcKUMTBc1HgvBmBqn2cFxJuoaPN1ARnQGaM4jkfrkeEnSxV/GgAtH7/k0PfJVuciK
         pmrT6I8hvDROg9FNrCc0Ol3V71axHBtqBaE0188DqiU7dEjOo3WAQOeCiyfj1ZUNRb1L
         GLHQ==
X-Gm-Message-State: AOJu0YzIR3n6R2/kL04+243Erj1mn5AChaN5NJ3QD36J6O2aj4iAW6KO
	qcMvtUdFPir35+WCSmMnJV2rWdWLbmGzqQWtdvttY00MjPZJPhbfUvdPhV6PvKvn
X-Gm-Gg: ASbGncvEuwTAiTBXG0I5l2b6OgXrkkjBY5zYoeVRQXzl+sBY3EzvC/MalbBwJQyCcyE
	eosJQAjFVHG8RDNOMi1VpZwzcbnfoSAEhz1bUk46IQFU+WFkTmF3bgDO/f3244rHn6AeSLaZsr2
	HXK489Izv6kwj6acn8pA83NAN8D4dhG3GXQU4j47wh7rMFD3x5nB13MdPKnIxZa9zrPE/C+fVHQ
	bvI2qQXHHOtgEkDMldOJShptPBkwk7twVckFUQadx1oCxDIwTZsBcmyS3SDR3sBQa+NrJZdZqSf
	1ublqCJ3Gx3uBsvpZQ5QtFUKWtaHYZUvZ74Ma5COLF/i0/lCdy7roF/yRDM9Ds6V2/8pscAuN2V
	nOy4YKMk+WyP6Z1iWIySYghI3M56gvbD6c45VFJkyHI3V/TW59CE=
X-Google-Smtp-Source: AGHT+IHh/CR0dGGmuK/cT4Ja/7RGWxZdpMGVaZS2SgV5Xt6QsGHlX+K7e+XytD5EV+n0DtfOiGKX1w==
X-Received: by 2002:a05:6a20:7349:b0:319:1c54:17ad with SMTP id adf61e73a8af0-32da839f216mr29445316637.37.1760415834530;
        Mon, 13 Oct 2025 21:23:54 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm13504959b3a.38.2025.10.13.21.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 21:23:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-lief: Upgrade to 0.16.7
Date: Mon, 13 Oct 2025 21:23:51 -0700
Message-ID: <20251014042351.465422-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014042351.465422-1-raj.khem@gmail.com>
References: <20251014042351.465422-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 04:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120554

Changes:

https://github.com/lief-project/LIEF/compare/0.16.6...0.16.7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-lief_0.16.6.bb => python3-lief_0.16.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lief_0.16.6.bb => python3-lief_0.16.7.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.6.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.7.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lief_0.16.6.bb
rename to meta-python/recipes-devtools/python/python3-lief_0.16.7.bb
index 2c5aeb6bb6..e511d0232b 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.6.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.7.bb
@@ -5,12 +5,12 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=be298b85ef6036ef77810ae0dce93776"
 SECTION = "libs"
 
+SRCREV = "a4fcb58cfb5f0016a944f7ac20dcf4fca08aa6a9"
 SRC_URI = " \
     git://github.com/lief-project/LIEF.git;protocol=https;branch=release/0.16.x;tag=${PV} \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \
     file://0002-api-python-config-default.toml-Debug.patch \
 "
-SRCREV = "d52c66d6da4d67c69438989df83a5415236ae08b"
 
 PEP517_SOURCE_PATH = "${S}/api/python"
 

