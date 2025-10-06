Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A486ECCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 09:54:07 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.30324.1759744445876414494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 02:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oO+n0qiZ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b4736e043f9so843754766b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 02:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759744444; x=1760349244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arbSu/FMgku15vX2BSWbRxBQeJNn1v7abfKvqqbfP+o=;
        b=oO+n0qiZx/d6JXytC1XtbiJGR4x3eD74BhUGmA1wnC8hQOXTcbsI1Z+bxe7kyv2x43
         CEVFdNZTfqvOh4ElokikQZLZ3UEVe71TGH2LatA2FOcioohHfW3Rw5rOJAA34AHKp487
         UjpGxN8JvmrPTzk0WGLbvvZYx9zIXT0di/hmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759744444; x=1760349244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arbSu/FMgku15vX2BSWbRxBQeJNn1v7abfKvqqbfP+o=;
        b=r14uG+icSazOJlR+pfBNW8xCySWyMlWEkzft42jhEohEB5/ExhbdQ6HoSreD/Ltakb
         P607QNb5p/bMMHXi0y/ASEk7hcgKrowa657Yl4yb3rBs3qCd4Zk3ddojfz/5FMHw/xPb
         bB3Bj2LaSyw2X75PY2UpcOn4BP9bjgrkfsQKul/rRq3wnNLQFAFq+ev7eiJx9mrH2u66
         plMqHotGM55jGG+kWH3KtaQv5uvUFC6ucYbxJoB47xIpCo1EYEcvMW4OEa/UtZdLcOTE
         tpFIOoUNmzqPH3oJh9OojDLdo3f3P/h1iAGxiDcoenk6uZ6LYEDaVey8BlWJApBHIBcS
         U4lg==
X-Gm-Message-State: AOJu0YxG4Vb8Jfm3JPwfxfOWG93LPt34SUbvMdZnKZ6QHzto4Q2/318q
	xBJ9/xY+E/HeY5VgVu7uxQt/0ZYK01ieKLZLGfC6VV1mXN/xocB/OXYAHH5z+KRep/exEcyU6q0
	DyUye
X-Gm-Gg: ASbGnctNFoGbuz2y8hhiHq6wK27bQPfPZKGBNK6phwdu5iwrQDspgiWdVoGdOwguK3L
	lzB1J8RQxVpjIXG2IjfavlXBl1ZiR0DuR76mm6uyQbPDv5M5Sn6/2LSNGDD0Vto/xyJ8yxbFLiA
	y37IcfgfjTDOTaW7XprzSDcWeBXb3LhNgh6/iZkCIV7/JwivvgWuq4DgONJA8dRvSBaDBGlmyJC
	lQXmiMMksLa2ZxJDOFNgbrQ9/jQimnyrgsvbpOcFAmZlDgiNty5E5impn95laxGNirGH9NJkAL+
	ShMOUE3lmOdchUF1qWUdHdx8BfMsX3Gv0IEwrYjfBKUch54Gz0iC6RCVwQyKKQ0Bt1cPCcp8KBY
	9ettwelW8lN/+HqbZ7xU/kOcIPvwq+c9IBLt4LdCPHewVQC8gqenEFWyrwoji
X-Google-Smtp-Source: AGHT+IHRoUqLhAkGN137G+IL2yistI2iaSkbN8onGNdL8KB6kNAogN9i9qqWfUn3j7Dl4KCAaqZuQw==
X-Received: by 2002:a17:906:6a0c:b0:b46:6718:3f1d with SMTP id a640c23a62f3a-b49c47ac8acmr1522243266b.38.1759744443685;
        Mon, 06 Oct 2025 02:54:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1094493466b.45.2025.10.06.02.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 02:54:03 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-moteus: Upgrade 0.3.90 -> 0.3.92
Date: Mon,  6 Oct 2025 12:53:57 +0300
Message-ID: <20251006095358.532479-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251006095358.532479-1-leon.anavi@konsulko.com>
References: <20251006095358.532479-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 09:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120275

Upgrade to release 0.3.92:

- Implement servo.inertia_feedforward for calculating a feedforward
  term based on the control acceleration

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-moteus_0.3.90.bb => python3-moteus_0.3.92.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.90.bb => python3-moteus_0.3.92.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.90.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.92.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.90.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.92.bb
index 6bc49bdcb0..f4d4aadd5e 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.90.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.92.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "13d31a485c3082e36e385c570379f13d267c93501baaf5395bd1e7e7286e7a13"
+SRC_URI[sha256sum] = "65db1f35e2e3899d9b02852ecc5c00388805b1f7bd8245a47e2c13515b3c3bf3"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.47.3


