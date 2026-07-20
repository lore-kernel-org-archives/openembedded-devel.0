Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480A0C44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:22 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11284.1784590756117425613
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fpTI6vuA;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dcbade417so8851391a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590755; x=1785195555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dq1h9FzPrP55d7pGiHs3wL3VYtVBd1x/Wa9uWlIYQ+s=;
        b=fpTI6vuAHFoQHfy5/H8iWRAsIt3qe2BplbUAy0RA6EOvt/+OyJa/lxF0uC+R133tT7
         QUr4aUiN5b1HqkriOPccrOHaXp+LWhUNuglAgleXO48z9NPShbd6HbUlFcWJ27oNH/A0
         USNN8RBfzwg2yaItOWL7i3qUuUIR6+BJSaB3uShzC1zYMvgNyJF258997jM339t8pf6R
         rs+YBzTZKreUgBMgF5u8bLks9TgQpdjb4++guHkZxknj1pnEeKnjsXSxrJbIkUfLplz6
         9OwcZec8Y0CJvb66kEE6L7UTH7PF+tA8VPYXShGi8EnuSkg+IE2Z3yYksUp/3DS06EMu
         mtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590755; x=1785195555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dq1h9FzPrP55d7pGiHs3wL3VYtVBd1x/Wa9uWlIYQ+s=;
        b=JawJEVY0eZFPzLmpAAXpb1uzg4d6nqMEcy/QOPt2/QHzGsUZelduBxulqVeP1HyOOu
         6wsujOqx7pmjv0ueippDs9xNR0Q/iuen6YN06qzwcBN3RKolYM21tFvMAilkUfGHkycR
         ybJJq5c+S1at7vJtzllm6enJSYYojHdYsTvR13MKC3yBd0D9XtffRK/eOlkCdqEK4mIJ
         d6aVk0rzY8hsLpEgREhuf+lcx5oP8vyGc0OtUc7NifgNq99bY8h1Xf8I3kg70nzu58ka
         jRkAf/2jdBFiLC2dv9GwLfnFekTULWTKY58FCMBnZ0hg9m5yoK11lbRr7HNH3nlzY1NP
         wLcA==
X-Gm-Message-State: AOJu0YwTeWPIExx7cIJK8FQC5wbywjmD95ajxrjm+k4rcwp7pWhNILxP
	+dIO7td0LW+6bhip5DK7aZwz9xXsHTri08vcCHaKULDU6jB8tkAvBByAFXu2xQ==
X-Gm-Gg: AR+sD13WUR8N2dZ/08r9UxsclEcZxjxfnWk/g8p0/xBfkWcMI0+AYl95tm29d3yUaE9
	TnFMLKOzOrv6S6uY1SxnJfqJ55RFrBNu07CSRdbJ18JpSYI9+EtZRGTdf9YBndcG87EN2y8L6mu
	RUnUI5qz6Z9yrsyYdZhuH5U1ajuIhDu8ob7J1xFBkqCUu6hQ+7rbUYV/llIIhFCV1ylHPygvUTH
	5inj+e+U8TzRuqe5qP5nbuim8FMTUnpFId13lUbGUU8leI32WFlIAmSnX2bhbao/eP0q1OLMQ4y
	mU6f6CMB2lO7NOWQthftcp8D3Y6TtCey9f9okyrQGor74iU8xtVaEn1ZFBsV/epZ8pIWbMnJJla
	L1zB7eU0mU0fBDWB5zfOkKWtSbCbbNOSwDJakctvqPZ0QNmgmM2LqHhZaMyl/k300lA0N/fdPQr
	021lwEJTH7O1etC5I=
X-Received: by 2002:a17:90b:5288:b0:38e:4011:4650 with SMTP id 98e67ed59e1d1-38e4b5865f4mr15873849a91.37.1784590755507;
        Mon, 20 Jul 2026 16:39:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 20/30] xdebug: upgrade 3.5.1 -> 3.5.3
Date: Tue, 21 Jul 2026 11:38:01 +1200
Message-ID: <20260720233811.2324493-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128321

From: Khem Raj <khem.raj@oss.qualcomm.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 779cef925d7c1f81053b88e709615cae8d92752a)

Changelog:
https://xdebug.org/updates#x_3_5_3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.5.1.bb => xdebug_3.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.5.1.bb => xdebug_3.5.3.bb} (92%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.5.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
similarity index 92%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.5.1.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
index 4c2c6538b5..02bac6f23f 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.5.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "0f26849a5edf3d9120edc100219854599d54f923a8a4d1cb4fe4403520e49678"
+SRC_URI[sha256sum] = "f073de91bea046106abf4d6071c963ea71e58571df6ce58948ceca89d121cb2d"
 
 UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"

