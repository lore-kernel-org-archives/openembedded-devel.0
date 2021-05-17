Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.19531.1621261514677650307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C3gsMYg+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v12so3216373plo.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5aLGllgCC37P4If9CMwi8Kv8g4LvpDa5NN0DBGnPxdI=;
        b=C3gsMYg+gB1WuDSOZaZaJEwxJDld9oH41nqynKci2W9ljXl/4f3Co4gsvjazWp6dLw
         LX1mciUKf4UP7+lwIvNYpNY/2QxovGk+qalLbYVufcWJx07KxNdJcwIDQr7h8s8el+Fa
         +X4GTNxrkprvG3sfpfIrqmYjM86fSRwsrIgpSgdJw+L6iVrqatOCIpTubIoR9BEzDs5Y
         7sAr8OcansuVt229NxBgft1ZfWfYiLr7hVyUgbAal+3OuKoqO5EhKMuUHjhHIBRaQUqA
         rvJBakQY7s+buCZRe9tINap1Hb+++V9MzcMagHHko2OkM5pYDWp2rUd9cds5c2e9TMtW
         NBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5aLGllgCC37P4If9CMwi8Kv8g4LvpDa5NN0DBGnPxdI=;
        b=SHBjBUWK/s8Y9kA5c5A27FeVWEDFjsEkcsGf8qAtsV2zKru82RHtz+2buKobEXKQp2
         4IBBmPwz/RkqknSVxQcYTt++NPv4Cgtlxd3ufEfuVyva59xJShTa30RULRvPbEewjCcs
         obsMg3KS5X8kXGsBaHDpvf7d2e78Cmd1EHjuxVzg4/leKQL8cQ/hscEWUagfXvbq67px
         6AgkQ1/AZhD0zHbky8ZBFzLGVKdTPXHtf8/orIYQlvBNU6cAmO0pxJJaJ5v9KYkYtb2N
         NumWwlVJaU4QQs7qGOYhEI/qIGGW4ooHz8kQvTjXVPqomnrffOQlDKUhYYYrJVOD5Xpa
         RdtQ==
X-Gm-Message-State: AOAM530FRomp5cBUgLnf3WBMQ6TYVAgMDeOFe2Gc4EtqmoCc/7naZd2c
	lmYVZsecehTUfgGy6iGRI1Xu818ffP0=
X-Google-Smtp-Source: ABdhPJz4QrEk7CaSDjd85wa9qlt0ye5q8Ye/UPAGcgv+cDr1JsnH3NWdwHD40fZxyvFuIFoWqUisWw==
X-Received: by 2002:a17:902:ba8a:b029:ec:b04c:451d with SMTP id k10-20020a170902ba8ab02900ecb04c451dmr228479pls.67.1621261514064;
        Mon, 17 May 2021 07:25:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:13 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 07/11] openvpn: upgrade 2.5.1 -> 2.5.2
Date: Mon, 17 May 2021 07:25:00 -0700
Message-Id: <8fecae53fe49d9e51b49be52311fe77ad866453f.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b12a2818b9fdaa0e9397c892c066b700ff20fbc3)
[Bug fix update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openvpn/{openvpn_2.5.1.bb => openvpn_2.5.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.1.bb => openvpn_2.5.2.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.1.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.1.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
index 6aa7b17be6..f82107dbee 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.1.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[md5sum] = "b1c279e89d97849d5fcde31d76812f04"
-SRC_URI[sha256sum] = "e9582b8e9457994bd8d50012be82c23b2f465da51460c9b2360a81da0f4e06e6"
+SRC_URI[md5sum] = "7643f135b49aee49df7d83c1f434dc4e"
+SRC_URI[sha256sum] = "b9d295988b34e39964ac475b619c3585d667b36c350cf1adec19e5e3c843ba11"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.17.1

