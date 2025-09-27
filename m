Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B60ECAC5B8
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 17:17:50 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.16897.1758993461563717386
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 10:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cXZwqRD7;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7501c24a731so29974737b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758993460; x=1759598260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7Si1yoS3Rhk4qxww1BaF+z4QjA50g42DtMUb+uKXis=;
        b=cXZwqRD7s56zYyib5yq1uePktUwifjdFy4tJoG7Y0KyIBhtRKp6bwbrcxgrvmZ5amG
         hKjYh85X3i9Y7TfiqzrSgkvkY3irL8QSdjs/I184e3Dvnap6jM+w5e94fPp6ajWbZ9J7
         7Vqez3pUA7GkbaLVinGIt5ThiBfS5FhU6xe7zXSp6z3PFZApHsDhZVYwQrZ6eRrCUtwJ
         967LkuMwUnSfHac7gmZ/OcdxhMTd47UMh+xy8KS87C4JdZsKp+oH6QaopTUcfcycfNyq
         AqVz6oZQJjRB9Y6kR8KPcxde7UGXI2gMxlvBYhHQ7RSWmWbS2Cdr6BSxpIEFr4NfvD8b
         Km4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758993460; x=1759598260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7Si1yoS3Rhk4qxww1BaF+z4QjA50g42DtMUb+uKXis=;
        b=vl1B+x7ab4pyNY55w0MQegomEIiQvad0bG6jxjQZRhLGDkYL96dxwuk4E522ANYcFJ
         90kVYyLgODCtlRM7KPsmyMaivLmA2eG3tUogqmt5vvDyfGL1eDz8o19U1laIZe1V1ias
         X1UkcdqTgPBSPrWL5TR5zfhjPRTWKcQUz7L0OWysv8+Odam3OO8P1jUNshKHKJ8qAheo
         XiMVXH1GIaK+UQ4uZAkTR19+7OXDYH418XMXSAZHfF3gKhAsYIUz+pyhI70k37WkvHwn
         2wAv3tenH+bLcr3dckN3cT4zBMgR8VBe/vq3uyVDGiqqFNYZNe8J+WadPPd2kyOOMkxH
         a20g==
X-Gm-Message-State: AOJu0Yy4R+bDJAKMvNPvEQzaOJ8Xt8gLBzX8FPeUkrXVkrTkN/EfGoAO
	Ww9gdGlYhQIwQNF2t1Tsy6wDAvmp+lRNSx2toY0L5Gt8lYIGCs/1L0TpoHQZNuQi
X-Gm-Gg: ASbGncsp8hUOnJNG5hZs7LGxT1pwbzyfGGePSQSZv8duapzj3SCm/FjOvwWmagO/G/l
	vZaexj+5nwg2DX7XdrzfiuzMLPThtY/aTAHUF/FzFZ0hBi1JfYnf49ZLT539Us0C/OUajq5g+9f
	Vuvc0uPJ9NzZjfI5vZ9HoErnxihDPQ64nHaiuDshaRJoP7al2VbbODZ8xUx5PoelC/mKLaPZFtd
	PtY3yYNjtdFilomKaRJAStk7PzPFrge+Bk6IQfmhqlRARkI9mK7mgJkqx1nIhqRbNwXv+i9P8lL
	PIdvVqNfiV5SobfXFuEJw6WHvgQpqvuw0PlJBaC9TL9JsOloOObs1znNum491315Vl7EF1of5+k
	MasQMTq2WjPc/GbKD9eNer1vpRKcE
X-Google-Smtp-Source: AGHT+IF6iLTmdxWU4mJsva2kRNcBddHKTqfhhYf6zq/0EloFy1+98pdEfJpCmethoMDMG+U5ZIzxPw==
X-Received: by 2002:a05:690c:8f:b0:746:e6a3:1f6d with SMTP id 00721157ae682-76404671152mr121239517b3.43.1758993460173;
        Sat, 27 Sep 2025 10:17:40 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-636d5b1d93fsm1283036d50.24.2025.09.27.10.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 10:17:39 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH v2] gsoap: upgrade 2.8.134 -> 2.8.135
Date: Sat, 27 Sep 2025 13:17:19 -0400
Message-ID: <20250927171719.7453-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 17:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119992

License-Change: update copyright from 2015 to 2024.

from the changelog.md file :

  Version 2.8.135 (07/01/2024)
  ---
  - Updated `soap::http_extra_header` optional user-defined custom HTTP header string to
    permit multiple HTTP headers in the specified string separated by newlines, the
    specified headers are checked by the engine to conform to HTTP header formats.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../gsoap/{gsoap_2.8.134.bb => gsoap_2.8.135.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.134.bb => gsoap_2.8.135.bb} (88%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
similarity index 88%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
index 0956eb121c..8ce4f17075 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language bindin
 for the development of SOAP Web Services and clients."
 SECTION = "devel"
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7eaf5d4df67c0db38549ba3c714a37d6 \
                     file://GPLv2_license.txt;md5=a33672dbe491b6517750a0389063508b"
 
 SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
-SRC_URI[sha256sum] = "63478e555c0ccde0164f055ff605b02805db0abc6712a04bcb14cb617b047218"
+SRC_URI[sha256sum] = "b11757e405d55d4674dfbf88c4fa6d7e24155cf64ed8ed578ccad2f2b555e98d"
 
 inherit autotools
 
-- 
2.43.0


