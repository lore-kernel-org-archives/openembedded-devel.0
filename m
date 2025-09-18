Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6ECCAC5AC
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:24:02 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.11436.1758194634932574847
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XaK7+z/S;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so1609252a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194633; x=1758799433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTrf49Qua87A/cH2kBVvSlOP4uIlXmDEkhpaPbGSOxo=;
        b=XaK7+z/SdXvChXcuDphr311CRJtF5Epo5MK7ID8PfNFWyRLRWXB64dBVfkZBD/Lbc3
         GFcnlApNegMmC5XY9Jt602LOQ6htur5Ua1hP7p5ewrM+kPN/oqqYVvCtniwTSnb3B44a
         k1bWLjzBilhCWdBIkSQ6QS9iRVyHv2Th1zvnptSSeQweO5Vg1BRJ9N1t4gR0RBb2WIZG
         eO67MCqD7VO9Sb2noQNr5CDwqzHYP16/2fEjyt4zkjSCfLhXTp8SyOd/dPZnXvUdgDI+
         thYdvYhV3rpK6mqOirAztfOG8Q5BT+iHNa28omlb7bFkR369zuRWDAfcb0O99FHh4P/a
         bnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194633; x=1758799433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTrf49Qua87A/cH2kBVvSlOP4uIlXmDEkhpaPbGSOxo=;
        b=vtQbgIJPe3YCr7rTZWShypjAo60x/D28eiYUvFBxVv4z2x/fn2uUnj8OyNVZ+pIFLB
         D6jLre2tKEoga9YuA8ZBEjfYvdR9tM2ODv+CDv5KgRoHfFfmkXQPVO8629/BhxAcIFu8
         gyNB5oh5lvyLna2BSa8cphQbeOKgOZteb1VamqY9yJM6+EtnFMTd6a4tJjcGDmne9ojI
         rvBJQ+0/v1gzusTQFQiL0EU9B2v75/I1lm3QVS4FgAbrRtmy3UkNg18llKlJDxArswRo
         1H9horTJ1cTZuKt9DtJzlr4mx4sCL96ESTg3lD+N+P+QkUvYrCuZbUTotlk+pklWK5IG
         /30A==
X-Gm-Message-State: AOJu0Yx+2td5KC8uPlyzI3a4DnQeMenm3KNn3ji27hNGf5jTm5C5KluW
	rPQC5hkzwoKVy3dqifmF2FwxU6gkFKLF1u8kdNXfCum9puS7AnDg4t/cDBagyA==
X-Gm-Gg: ASbGnctJY9NZi/tmWolLSMXYfKIxpjulgoTQVvE7rfWdUA5VFhQXp0HRa6qM/1v5YO2
	cNKaAjLRd6W4tR4zTYgnRDXIE8ysQRniNDr82zkQn9NKcM6Uqdyq1awKJZUSkx9jEDY6L73IgKn
	0KbOt2ijFE0HLO2kPJkyJO4J3UvRg9MQPR8bJ/LRyMmJnuQPnoKVQwdrvrWymzq3egKNv7b5eQI
	LvjQulr9yEHav8ACy4nERUePD6fIDkpmtz6p6YnfqadwE/yTO1oN2LwJC8toCDoVsVy+oz8NPBf
	XQKO3q1wZk11G8eBSPnNgxyXpI6j/rrWRI+NxpauzYqG6nV0jbo3QgF5J3JVHV3V+Ip2cfN6YXd
	L8iLKwT/6c76QRAYPqn2/RuPWD+1VPZIhoFrdi/Y=
X-Google-Smtp-Source: AGHT+IFbUOKh/bgtkOxORM/1hqWxEYLS18IrqshvJQXDRCcJXyeEwyV4dpmnpBc7vdhHuT4txsI3kQ==
X-Received: by 2002:a17:907:7f0d:b0:b04:ae68:afdf with SMTP id a640c23a62f3a-b1bb35bb75emr605277666b.28.1758194633235;
        Thu, 18 Sep 2025 04:23:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc75ac5e1sm180410366b.43.2025.09.18.04.23.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:23:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 07/10] avro-c: upgrade 1.11.1 -> 1.11.2
Date: Thu, 18 Sep 2025 13:23:41 +0200
Message-ID: <20250918112347.1331393-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918112347.1331393-1-skandigraun@gmail.com>
References: <20250918112347.1331393-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119566

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 52f35e40106858842c23c31169a98c8862c66e6d)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/avro/{avro-c_1.11.1.bb => avro-c_1.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/avro/{avro-c_1.11.1.bb => avro-c_1.11.2.bb} (88%)

diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.1.bb b/meta-oe/recipes-support/avro/avro-c_1.11.2.bb
similarity index 88%
rename from meta-oe/recipes-support/avro/avro-c_1.11.1.bb
rename to meta-oe/recipes-support/avro/avro-c_1.11.2.bb
index bb0bd7d752..9b6a52e2e2 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.11.1.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.11.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"
 
 BRANCH = "branch-1.11"
-SRCREV = "3a9e5a789b5165e0c8c4da799c387fdf84bfb75e"
+SRCREV = "44d1c4f221ccc4571a4b4b9edb023ed1e89354b7"
 SRC_URI = "git://github.com/apache/avro;branch=${BRANCH};protocol=https \
           "
 

