Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D09ECAC5A8
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 19:46:33 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.35525.1758483990592156749
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 12:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TZ7cyHD5;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso2830959a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 12:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758483988; x=1759088788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbP/a6s7rmeJ0+3mt1pg8TsjXIeXWrfjQUQ00bilPsI=;
        b=TZ7cyHD5U9DKjKpZEupbyH5MV1rWtMwO1i4+7RwcLvO/ZoIIJr3IVieoikvxotBVF6
         s+JDwKMSxEmh4jECmnS/cj8BZV7bnifqY05TBNQuy4mMpqLp2QlJ18Cqnv2Dyp+wtV1A
         Uoe2A0foKdiZqs5E45/U01geakoyMuEtDABGudMLlTTQ+qAVYIXOryl4IfO52mou2UkM
         1KMyNRzlRwhg4njDUm90iRKwA9ZlnUTvfxagiTuD8hKy23ogAeT/eXRch5XvFsrdxL+g
         n+/Q6d8jE74zw6Lt9TPDz7ZD7r3a9+VppLCIROYTqnCL+d7hB+xF6Z/nHHKINtbveMgd
         b1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758483988; x=1759088788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbP/a6s7rmeJ0+3mt1pg8TsjXIeXWrfjQUQ00bilPsI=;
        b=UjB0bvdKTdE5Kad80ejACvq1barHOdRztaEIkUsMl3BIP0/RdeU2eSTbQ7c7V+UdjG
         a2ZLjB22GY6quTMdVQg1i4eh/Pd3DWMHlP6wCY220dZ4cz4/x6tzOEC/e0koZjrKPgb0
         dyiCau6YdSH9g5l2qE+bgHG2ahFntTFE2iX1sWXJaGlsaVXPkG15xUNNJg9a4FIxsdIR
         J8KzX0GO3xoEEwKlWEBm98hZA3Y8TZbHCKRxZdrGXi6jU6fpe7pAXCts/WP8vtvxRAUt
         okyXIZc/dAZH2hIIxUbQ/qLq7VbuVmBnCk+z1EMhqck9MsL0ySDLjkfudet8HBWEQH3T
         1aJQ==
X-Gm-Message-State: AOJu0Yy6es35t8ToAUmM2DU6SeSPuOlGGIrBxGKQuQrf/AYFVuVdV4zv
	vp3e8HjKZkT68GCnAo3hI0sV7pjHSYOX5VAeM1EQTSiIMaZNalP8yPFeAm4bNaYL
X-Gm-Gg: ASbGncvX1AaJI0q1GZ4LA790syPSgAcZR7ZOmCkTc+pyQy6yI5hc/x99noCBX3yJofi
	cvc6sZl7tTR+OB8fh0yuJf17UfkMyAC2HKfLzyKOejFa/hGTzXU31ta9mm9+j2iTqTT8l9bjG2b
	aKrtYROPNybGQdSx7i8zsk6EQwHZiTBAQ8u8nYi26ymVTS70o/SW3gmC90+oCbABgRQZsi8ce/O
	eUemuhKhqqaCT9X0UJqN88TLy0aF6G49f2NOlfQdgWgK10MNXGOPRQAxQKwdGuNPJSacunOnXnK
	juVioQJq16W1TQe07utUWOAtZj5VEoid1Bx1CIgpqYt8pL9nFXsKd4LPQfjtR/UUUh1L85IkN+Q
	qOeIzuN6oXZEChuaQ7eft4Y+QsS0bx3nRhIDD7xbAZLfpKALsSg7kOZyKwqWOXIAvlWOYW5RqaM
	cdAproCn2TtuY0Lcmp5Y+JbmG7PmDrhI/i
X-Google-Smtp-Source: AGHT+IGOnfCB1QkESWRcy21VmpUAqWSTx37NbrxAKe29vBSjmiQSn7lwQvbEkqXD4wdgfzCesv8JkA==
X-Received: by 2002:a17:907:9815:b0:aeb:3df1:2e75 with SMTP id a640c23a62f3a-b24f3e600d9mr1082884966b.46.1758483988094;
        Sun, 21 Sep 2025 12:46:28 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b29abf51da3sm315549566b.75.2025.09.21.12.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 12:46:27 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 5/5] python3-aiohttp: 3.12.14 -> 3.12.15
Date: Sun, 21 Sep 2025 21:46:03 +0200
Message-ID: <20250921194602.1207268-6-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921194602.1207268-2-t.f.g.geelen@gmail.com>
References: <20250921194602.1207268-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 19:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119637

---
 .../{python3-aiohttp_3.12.14.bb => python3-aiohttp_3.12.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.12.14.bb => python3-aiohttp_3.12.15.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.14.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.12.14.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
index 642fc6784a..cb8aa96d00 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.12.14.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.15.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "6e06e120e34d93100de448fd941522e11dafa78ef1a893c179901b7d66aa29f2"
+SRC_URI[sha256sum] = "4fc61385e9c98d72fcdf47e6dd81833f47b2f77c114c29cd64a361be57a763a2"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


