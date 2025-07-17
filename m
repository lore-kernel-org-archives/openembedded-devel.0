Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7C8C83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 13:56:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.50015.1752760588082124304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 06:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OiGfma+t;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-455fddfa2c3so9544405e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752760586; x=1753365386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YA/8RaDNfQSjNXmDQas0FEWVsJJGTS20KONm7VYbpSw=;
        b=OiGfma+tqIp9fGIRiX5VBuuAlKul8VzYd4p1Mwc7Ak+/IpNk/xNyCRXWl9wm/HUevp
         7EcoPwcyiEU2QKcWZXE82/0qZQfvqZql/bNP/Dqa6EiCwlK8AvGHM5d/kL8kpEUcjW/u
         /iTDi866doXRK77FgmZyHenMw7qZDDWJ08mWDgfGhxYVVQO4r9BbgbclBDQarvbSDRC6
         7LYu5dJsFI9sdKpT+gzaFhUfahpa4YrsyiimoLeKPqbBJHpFaxF+auJPqmtowO2ydXES
         Y/QVlS/SsYEI1T4fm1OTsnzwmMk1mJzZ0W9zRKXartL4FAGWCN5Gb9U8RgTqXcyYGkbK
         u3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752760586; x=1753365386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YA/8RaDNfQSjNXmDQas0FEWVsJJGTS20KONm7VYbpSw=;
        b=KxYOtlEEqaZpjRkbTED89Qg0fZus2d14aLllaQDINzSxFE9DAN7iCeJ2dA8hHPm7pN
         wn7WdAOW9EifEYZiWIu+zI3zgerVxLRop3e1uGA68rGKMqiU42vxtkVQLKXzqiZjhrZI
         88ISyk4EPcbtKOd+iUL7fx8RVy6uEPAXxN0gf5YWM3J7v9wdJudAM+ncxb03B7gv9YAc
         pHNH6aXekK5jPIr5X+FswDcAOwYo4ZsH6JwUPJAbDMQeyQlUoy/DIukPQwRC//K8ryeJ
         ekILcn53ZxQOnP94r4R440TQnNeCdjW0lSQhoUydjuVTEEK2Ra8eJPH8j1KQytc+PCKG
         eumQ==
X-Gm-Message-State: AOJu0Yyp99Q1u27t0wDyHwY7Hy1EiRNrY2AsowQFetquJmqNctddOg2D
	xqPJw+eCt83cKu9jbNq42Zn4Y1YitGLc9mlDU6Ub0fFfk7owKhmin2+bOLJrdgA4
X-Gm-Gg: ASbGncuEvaNkiZU5wmkwk3j4NxvLdUN/OWR0fvyVJKqwIBTEHyyAwQY234SLbQbfw2H
	UEbHf6yOz4g/ZixaHib9jvhPE8B4QdI42cFeEKbnJiBLxd84Lfm+wzHJpLNZHFiEYuisap+XJLm
	C7l3z0CuWGsCswvWqs4oyEfD5rsf0tTdhNUHMoGIp0rYilJsbtYt/TKL4a/W2e20h5U8MsdXkmN
	TXSYjcMD3iqTRotIaVEhGg+xxDn/IQAlOHDqKzn0sTsm5kpsb1sq+Cf/Lk8cEvSSDNH1x1Tfxww
	azQoQyvSve9PLqrKFcan0IfkVP4xStx0aBe8GSWmrmCm5jj3tORemdVNDOLFFNDvELDqTGozOYU
	Uzi74FzFu2gnQP1T7PACKnFf4inC1xs7SLuI5Cc0O11T5xUd/kcp2mNr5Cw==
X-Google-Smtp-Source: AGHT+IErMbD7zP/NqyEDYhaOfDeAdMacgHjRsYfsUXwzBvNNqij3pa0OWPRko3mbZDcBKknPYXSJaA==
X-Received: by 2002:a05:600c:83cd:b0:456:1ac8:cace with SMTP id 5b1f17b1804b1-4562e045547mr67837275e9.12.1752760585796;
        Thu, 17 Jul 2025 06:56:25 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e57200csm52764725e9.0.2025.07.17.06.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:56:25 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][scarthgap][PATCH 1/2] mbedtls: upgrade 3.6.3 -> 3.6.3.1
Date: Thu, 17 Jul 2025 13:56:17 +0000
Message-ID: <20250717135618.3956-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 13:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118610

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.3.bb => mbedtls_3.6.3.1.bb}       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.bb => mbedtls_3.6.3.1.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
index 286d5c45f9..679a05e5c2 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
@@ -23,10 +23,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
-           file://run-ptest"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=main;tag=v${PV} \
+           file://run-ptest \
+           "
 
-SRCREV = "22098d41c6620ce07cf8a0134d37302355e1e5ef"
+SRCREV = "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


