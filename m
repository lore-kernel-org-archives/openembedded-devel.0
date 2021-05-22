Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.1933.1621647340516291221
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EcBEN/5Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id f18so2844656ejq.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4DN9BN3aUoGIjBkAyYPRK+xXX+58EdidkXAlnVz5bXk=;
        b=EcBEN/5ZRcTZJkNFm8sau+nRt6MsvgvRD6vcS/Ke991r0E1DxZRxo7oaLJdBUnIafF
         r2o+G5JY3VbVlFOlBJRn1m5vpF7VSfONdDyVkOsWTF2ziaQglz2djllAje34VcYDzhlA
         NqJ0yM4H6akZC1mawZnS7pAcSjy+rY/1ZEAInwSH+B2MTMj8hDIOuR4dr1s4BJ6ZjPhC
         anJUVp2+yKlkhZCkt9Ib+eRJWXIuS73fNxkX2+hipwS+AQpVjFds0t5eSyGxAGSsvZU/
         bPOzltS5Ws2s1+rLK4VF96PUpZISa80ACgTrfuypMNUEnotlsEFRLzE/jmvH7sInYeZR
         TviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4DN9BN3aUoGIjBkAyYPRK+xXX+58EdidkXAlnVz5bXk=;
        b=W9jOzt3p07PxOXeTwHSjF0p5s9fgOxrUZ8aCzg9ycm+WDgxNGHidbi5K08LlD3snp8
         z0d9tIaUEZ9XN/eF9bQAYzmf40TwkLFlKg1FRs7LpVaM9ifgfruB6s2xO9X2EalQn1cT
         xWP7gO5sq8CE1mQck4ZWdtsyOvlaGaK/43Q6Mx/KgGbCAg+uVUf/h+RAR2X/xSHmt4zm
         amwQp2OpMFsgd5XWqqJiR6CWtqvQ3BpJstWwzOvsvP3ztqswQQTEWTXpCX2aNynxkZAv
         fq45HPxdSqS+SksTcxVlN07HF+WsYVMAJ2jbMPDSYDvSkk2Ei6bwE3qOxOTzT0HUS0SX
         8nfQ==
X-Gm-Message-State: AOAM5310FNOOJNpGOjpe/ZF+Azd3h+uASF/qAC8f4tybgLriMZ4QcKHb
	WB7VquW5WD2VzhhrHX7cBWUERhe2MCw=
X-Google-Smtp-Source: ABdhPJweAv1G/OCb+OKISpqKDOxPBEv49gEFDcpryEQqCSbe2BvDWrcyca9sTIAJSXf4k8NTOiS6Lg==
X-Received: by 2002:a17:906:5fca:: with SMTP id k10mr13056447ejv.357.1621647339182;
        Fri, 21 May 2021 18:35:39 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:38 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/17] mm-common: upgrade 1.0.2 -> 1.0.3
Date: Sat, 22 May 2021 03:35:15 +0200
Message-Id: <20210522013521.588774-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mm-common/{mm-common_1.0.2.bb => mm-common_1.0.3.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.2.bb => mm-common_1.0.3.bb} (66%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.2.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.3.bb
similarity index 66%
rename from meta-oe/recipes-core/mm-common/mm-common_1.0.2.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.3.bb
index 207d9394e..ae2bf2d02 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.2.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.3.bb
@@ -6,8 +6,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase
 
-SRC_URI[archive.md5sum] = "440133a2676275ae26770b3651f89827"
-SRC_URI[archive.sha256sum] = "a2a99f3fa943cf662f189163ed39a2cfc19a428d906dd4f92b387d3659d1641d"
+SRC_URI[archive.sha256sum] = "e81596625899aacf1d0bf27ccc2fcc7f373405ec48735ca1c7273c0fbcdc1ef5"
 SRC_URI += "file://0001-meson.build-do-not-ask-for-python-installation-versi.patch"
 
 BBCLASSEXTEND = "native"
-- 
2.31.1

