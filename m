Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B01D5B16C
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 17:43:08 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29616.1765734187582661580
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Dec 2025 09:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kSrlJSt4;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6432842cafdso2498977d50.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 09:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765734186; x=1766338986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/3Ja/Kxf1smp77i1SMYs05f+Qp3Y3DeZvU5n361EEV8=;
        b=kSrlJSt4g+x2c0p7GYKGaE9MEsE4qFXAYvakBF38d8HadXfwC/VA7RypSYvgj+4+9q
         SkqmzOQvWuLqRt+96Xxxp0Oa2X7yGoOTxzVCBVi9qkQVg1vWkFj6whGU+cKmdsOoWGII
         jNM2QQpcUHPuZ9DtXkr0fRIEfTcnwOU9OxMHa8apvwYNFxwoYY1bL43uC4s7oMJSczT4
         Dc7bIQ0/qTZQHS2t2+H/cJZx1LI+t/oUgpFWgKhCFQoppix7Od5oIkrG0vqADeFNXQfR
         plxwUkQs/5+jffJBjM8ZUaldI/zWtbPpe3aCyN99/vtJqoB5GPq73ZRLyk5itCiHlFtk
         LH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765734186; x=1766338986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3Ja/Kxf1smp77i1SMYs05f+Qp3Y3DeZvU5n361EEV8=;
        b=YVraS4dKItAPt5nZ7yQjkXTaXdGZaK/f6C39pwCVz6D5ORRCrTAW4qit6DTL2/N1Gd
         ouWKjELl/5aq8EOetWoLkKRJj35twp5ew6P9lSHc17ppIGuq8L8LrCf15lNd+BDUcptM
         wnir6A+tAcwLWgnqBDRUE8roeBI5rmqs/46b7AhfqXjbIu8c/IdOhC0cW8I/Yhsbqmor
         yCZJi8BQNaXaY8mVYE46fuUg4Kz8ExE46otavBfArDh+E7cbziOA6C7fqtOsebOI2tKt
         3YLtChJKZViyKceJKzVMIv6CbXrOQq9B7P7+hcK4zTQo+yyr9pVsugsHVuSmHxNO0PMw
         2/hQ==
X-Gm-Message-State: AOJu0YymGrwfDvXTli5s6yJs2zQ9ooD1J1shx7I71vqSBwqbkbNyysEs
	Y7j1j4Na22GZym+/iYYdAcKvsIVjOJ4vJIClgprkXSW8YHUGNVZtrR4ama9ltxiK
X-Gm-Gg: AY/fxX4fEHFwyTcd+N7Ma7kk2rRZTGLCL4sSGO/kQULKvF9FKW9oeZvpGgciET6sWv0
	lUtNKdxq5MiHPXrrHpF1kxuOTqwLCbr4Dm2aXjXfRPhY3qWv7I1BORdSBWtR07dFudY1xJTNK5o
	9bUrNujpzmNbm6rEKhJRd1EFzxGpfaRWTVV1XNynhpxoGWG17nO8MS8/MAVXhyiBu0olNVMHbd4
	lznQl72wAgSsXtdS1Uj+ixDgzCEPlmkvg4gS9BXeEG7yasJPHUvT+KhbZo7YAnyjRt4LkxYzlbf
	cxfRHP2PuRjPO4/GE/nQq0KP77GfbOsdjd2E6TtS1G4yUw8o/U5mV19EiV2Dp9yolUWnS0hICUM
	+13J+yUSVedeA4/h6p693Ut7L7pmBDgYTrcVo9PWOOiJqvPA/2zYHfOzjynbU87zSv6NjSxsTrs
	hJ0zEP81T1vxwhOQlaumZN2kRhLVwdDfY8vOh6NpTRArZdoBmhgoj/xFcs/do42qUFp1BhUzkxv
	2PHwuwIeWRrbjUbjx/Xigm0xO6X0KDNmJCizPgpQU+r/xnIHwMMPcpB12+uXk8EEw==
X-Google-Smtp-Source: AGHT+IEceVQ93memKN14Ibb9PdmOEnYjkWwyc2H1WBNKnCQQibbujFajJtemyKjtzi4ZeqH+XTRVPA==
X-Received: by 2002:a05:690e:28e:b0:643:1ef1:960b with SMTP id 956f58d0204a3-6455564e8ddmr4738646d50.56.1765734186234;
        Sun, 14 Dec 2025 09:43:06 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78e749e550csm19497927b3.29.2025.12.14.09.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:43:05 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-networking][PATCH] nopoll: Upgrade to 0.4.7.b429
Date: Sun, 14 Dec 2025 12:42:38 -0500
Message-ID: <20251214174238.28948-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 17:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122651

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nopoll/{nopoll_0.4.6.b400.bb => nopoll_0.4.7.b429.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/nopoll/{nopoll_0.4.6.b400.bb => nopoll_0.4.7.b429.bb} (84%)

diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
similarity index 84%
rename from meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
rename to meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
index 816e513a15..b4f8605136 100644
--- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.6.b400.bb
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
@@ -13,8 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f0504124678c1b3158146e0630229298 \
 DEPENDS = "openssl"
 SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "8d333f158b5d5a8975a6149e6ef8db63"
-SRC_URI[sha256sum] = "7f1b20f1d0525f30cdd2a4fc386d328b4cf98c6d11cef51fe62cd9491ba19ad9"
+SRC_URI[sha256sum] = "d5c020fec25e3fa486c308249833d06bed0d76bde9a72fd5d73cfb057c320366"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


