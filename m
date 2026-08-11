Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902C7C5AD55
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 05:37:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48356.1786426666611804215
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 22:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rrHkbZXB;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc73e322dbso29696605ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 22:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786426666; x=1787031466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HLIQA7AYPeFjadSuhI/VgWqZ81Rxzrbus/2OdQ5KYQ=;
        b=rrHkbZXBojEmV1Lp3w1iHvplK2X/CWXG9WLiZk5hD43M9ja3wagbQ642+Ks457PbBc
         TNCs8bcDGSECysSK9+c6JXZhpQaJHoC15k76/OIxM94z25U1hvakk9YDHFlI/OaUd1vA
         azw7r+51RfnUD58jPdVbR/wCU7Tk2pSLC/unf3ldz++ytV1z6/RJuIs01WV3sy8CdKFX
         V3yPxlLj1/NJHdO1+hvjxGoLEdBDHG7KD6q+tHRZF4HejQjiw0ySv5UzoA/h/ide8KZM
         2cRQYsFjtjpIrV3jEPUuQqwHa1e+/NuRBavjqnz4nm5Sup8p0wdgF1Mz8FkHU8I5qJ1K
         t1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786426666; x=1787031466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HLIQA7AYPeFjadSuhI/VgWqZ81Rxzrbus/2OdQ5KYQ=;
        b=Ypo/Ml5G2hEk84qXwTFfhzlSOP5YoWFZ2GGtjnVIrO+AwLcQbtBVokcxweroBDaO9k
         UNyJlYd7NlDjMd9WrI/Myj0dX29VTC3YAfEmKyIhdO86iRDAy8X9/ckXBKJeSblLwide
         MX1Pof3qEpP/5iiz3bXrMQwWJwDC4tFLWStQ34WWwlACEs33tkpvUnAZSuf6Q6B5AK+A
         /frzf/ueJJn0mg4qc9mkCb/rOL5ZIb3f3dbiVr5UJQXhulS3MlTuToNpGsWnCN8pbZ2D
         Y6up0AjdSlvwcFh8l8U2CXW0Xnny7k1KwT14uQH9dl8TSab8kI4+r7y03WQYNtTZEi3R
         Zy1A==
X-Gm-Message-State: AOJu0Yx31R+1eu3XzRgwq/FvAfJcWrCmnzptjYtPOWldTPiCcod2fitq
	se61y3tQ4xYaVD6ftOvEPejXLcv2o9VyZIIj8+pQvMWyTscA07iDA2bnkXi2SzAX
X-Gm-Gg: AR+sD12D4rCs1XqqCkojuB2VzgDtG/iPCrsz6r/7Otgfx9cCGcN326X2qwXAwqrL7bM
	Hhc5xxarXRqnrU5FRSdnNQpapKTgQqJ97x8QFmsGvOtWgl52r8XYMbdQEXvoMXG92OPnsTHZWT/
	t6BNOSxJzKbPyMG3a+yAjuxXlrM+DvFSEja2fUaUt3ZaOtixRO2O49iGyw92h9Hnxu/Wvl7dAod
	LtUFjyjzUOt3HOf66uBUrqCx7s+xlN0znr/VEljjfFys3Tf4fjRS/SMIMZi6+4qXjdB65Z/NWNx
	HM1P1cPgnAUEP1747jb4o7zsy7WzW4yjfGuZV7rAY6OLtaR+41207w7pfOrgktsBruv37snIG4P
	uUVlsGfWfY3qtM9/Tx3hmlw5lOajF97PbS0/SzTC95cqCGhjouNT4W6fU21zgOz3658hZ5IUmFx
	IWR/Yq9ATzDJNBJoeP8q06uXYwnTaiUwMuDOUggNRQ897IGCVDvFk85DruQ1mn2Hk+g+I0ZwJ0A
	Q==
X-Received: by 2002:a05:6a20:da12:b0:3c0:b766:751b with SMTP id adf61e73a8af0-3cc2ba03da4mr1264492637.14.1786426665972;
        Mon, 10 Aug 2026 22:37:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c64237e9csm923812eec.18.2026.08.10.22.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:37:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 3/6] postfix: upgrade 3.11.5 -> 3.11.6
Date: Tue, 11 Aug 2026 17:37:25 +1200
Message-ID: <20260811053728.4125303-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
References: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 05:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128911

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
http://www.postfix.org/announcements/postfix-3.11.6.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.11.5.bb => postfix_3.11.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.11.5.bb => postfix_3.11.6.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.6.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.6.bb
index 60f1889a38..14854ca11d 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.11.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.6.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4a6ab3d0e9390989fa201fc6c446045fc702c4e16e7a247c3ae261c9e9bee610"
+SRC_URI[sha256sum] = "b9a748705b1cab0a4afcbe42f934c82a33b342ba3229017fb508c71700078d07"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"

