Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836A8106B514
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20824.1774441263633971239
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rDaNRh+K;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso23347435e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441262; x=1775046062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrDOaoFYg1P7ZDgPTxBJu7qZCNwPd3Dj9KVm1UhNwI0=;
        b=rDaNRh+KBy+hEzt1DTAxSMMgW+/8zfDk0VwaDsuIpE/cK/ar5JDXgLRD4Eqm2/XGRK
         qdfml5Q3W8xANBJuECRncBXEcpfa3h55LDWgs+KuA9Fq0ajppUHI06wy+xam6hwlSerh
         jY7umaxeaINSkr06cUJN169lWHBWY+L97oXgtWtUenc7WiS+Q5GI1UPS3bFYU45tDSv+
         bEF9zcnomNb8Y5/uQ5/cwHmNUFnF2A7mUjjSG3Yzf1HUuT0iZ35VEhyINNm+xbHP1BRW
         e70Q02WmI97yiXbw1FUp8ZDsphGX+RhXKWhUz5sOLo23VWEj43wh+kMwxG3fy5Y6bHwa
         22tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441262; x=1775046062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PrDOaoFYg1P7ZDgPTxBJu7qZCNwPd3Dj9KVm1UhNwI0=;
        b=FGzq1EhulFtov8y8WKTGaCsGNMLQuB2vFKVnPyDm0NfwVcf3BGl+5eRkfaEenrPdRw
         BTS0RgzYPN0Ofb4wzGJFxSmJ28oP3tsMJMOJc3guFUKtd3kfCx4VIo5IBCdXwp2sh/BZ
         V8+QPrfEqEMqQ4OoMpJzEdun0zOmJcuzL9okrWeYNubPJWhJb4HexwFt14PZ4WTXQLDr
         q+SrGtckLpkDAGCKkRjV21uvsCnfdSQ4O5L0CYP4+xCbiCWQhEby6rzUUK0GMkYjkqPT
         rTjeorSVE5tzxC040WadD6PBXDHqeHi3th0wtpDcNx8HUk6nAcvzna0jAWKX+rx8IcWn
         pa7A==
X-Gm-Message-State: AOJu0Yx0EZYjv4FQZSRs4qqQCFAz82x6PQyQXv0WWIdB/3pRbPE1MvRn
	+D3ehkpRTyppsrBkPpccj1x/flSaFRsFOFL4yExHBkGYRPHzPSehUAujA4wNqg==
X-Gm-Gg: ATEYQzwSrfDaMjMzkN6zkvEZrkR7QUPmJQ6LWBDu8zI+x9+azDDgodzTRT0frfp/uwJ
	NT1zWRdmZIEW31MG5Tize6HUnz3pgdrghTwDHg7kmAz5S1qnZ+mxgocsFSuS+7n4LqrN1141EXW
	T/ikDo1X+wLanWWo7pAtWadEae8xJNjVhZmtvatMH8eGTAmXfADTOtWOyXYB1QS9/LWEkjLmLU9
	nND97+Ql/yKv5j/xwDMTsHzfZ8SNYUBU27OaqQizArTVqOdgBLr9pFZI9+cHP3Ec3fiApS5h3YL
	/93VTiElL7clOedkD2ltkMGlm0Y2ipL0kuMCahlUaEnUTRxuZTe0w8VvKUaoQZZXMinqRmXzoAb
	AKoZ7ZMyTktacR1otMy71/cdSYCKi5yrzEXX10cR09lfjPYz1AH1jri7wV6wGoubNQ41BgacUdb
	aiiTmFnW+Lip3D/A==
X-Received: by 2002:a05:600c:4ed0:b0:487:288:1199 with SMTP id 5b1f17b1804b1-487160934dcmr49558445e9.28.1774441261610;
        Wed, 25 Mar 2026 05:21:01 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:00 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-networking][PATCH 03/15] ntpsec: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:29 +0100
Message-ID: <20260325122046.1211090-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125610

Use PYTHON_MAINVERSION instead of PYTHON_BASEVERSION because
the former includes PYTHON_ABI. This makes the python module
to be installed into the correct location.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
index 9704e2d15e..acde62a493 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
@@ -50,8 +50,8 @@ CC[unexport] = "1"
 CFLAGS[unexport] = "1"
 LDFLAGS[unexport] = "1"
 
-export PYTHON_VERSION = "${PYTHON_BASEVERSION}"
-export PYTAG = "cpython${@ d.getVar('PYTHON_BASEVERSION').replace('.', '')}"
+export PYTHON_VERSION = "${PYTHON_MAINVERSION}"
+export PYTAG = "cpython${@ d.getVar('PYTHON_MAINVERSION').replace('.', '')}"
 export pyext_PATTERN = "%s.so"
 export PYTHON_LDFLAGS = "-lpthread -ldl"
 
-- 
2.53.0


