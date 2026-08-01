Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D40FC55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:40 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5270.1785589954894354165
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hwloRd2v;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84830c774a0so1928880b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589954; x=1786194754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCsnI0W6NWhQxZNh2ITrIEy9Sk8Qn/wJAgbHEndAeLY=;
        b=hwloRd2vNHY2w+troxtMmsIlmfzsVvjtKXJC2uLyLUlrwP1cnw6ce7ILao93IlbXnW
         Il5+1NbYbeT38keIhUZdaipwlViFYRjEsAZmqJ3bU72O4EqS9LzpOx3wqyfYtdZ28wWk
         qFdRziUcqK6+gTrqeTz+rS9ZJVCIzRoJpm/9kTpGs5MmONtqST6sopP2TkY9L6/L/sJ5
         BVU/WYw5BN3CV4jlTi1AGBJxFB+LzUJUWCecrjnJw8wzWz9AaUhxw5K/GIz+ie1mJpqf
         2JjxBpYPcBM2ZYHVURxcm+Gj7PPXlyBNjfYv8rWZ7bQRlPnRZGPM+V+DfJBqeRIQuha4
         AeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589954; x=1786194754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KCsnI0W6NWhQxZNh2ITrIEy9Sk8Qn/wJAgbHEndAeLY=;
        b=rIKleQ2kAgreulDB5HaLRQzvy6G5A536yLEndFUS23v8Ew96qTU7oCgGcrlDEgIIXr
         ptlqwm4qt9sLDWA0w8AYlY4ZS1WVEbuwj20Hk5mAWg1ZXZAI3jM4lIMSdGjPdHTZtLxl
         menanjhD4oRGtdrF+el4kijvO+xoZuXhtJ5e8KMl1/ToVG4sFXB5iNTZuSi7wtecxdGL
         /QavYISdBPkScqtcNbOxeihQc+jWEmyfLBM99Qa/iMjAnuQM4e1qGvg88phAiYTz9SQf
         uNc0J3AAMvFAPpZcL82jYRR3bHb5IG0NmupljHKd8AoW5q57dP7XIL1iI/p92tMp/DFB
         ceQw==
X-Gm-Message-State: AOJu0YxBOkM78ZriKZmD6kCZwEY0Jy21Y3NmIRh4wetwS1B060XFgFpP
	JroTHc01Vttxdoc+2gTWldTANaysuxU+w5VvT3Yj64Ta+on1c7ukR5AKdwq1x+7e
X-Gm-Gg: AR+sD10RMmVxVO0i7MZ5bU9FUyBUI4u+eDeRRGlxbuyFkPeXkbYLN1HhY68uhGW6hc9
	C3XNbELNcIH686ownmDZ34zJ8oYBJ2lHiv+zUf61nG8LiBfCswelykixbL0omZjZ70Ry+nvzk26
	zR4KI714iPrCmPhfX6q4yG8P0lDXDnL+CLR//HrlMpsoDtq5XTBOIKVp+cnws6rpSJmRWhiDuoH
	Y12M9PZ4lZbO6s/EEdW19ChZPwLfqWSKGQ/HiLcBs9rPloR2W0YL4VqUFmh2JgkP2dLF50QbAPA
	UosIfA6xSM+bL2EuHn3crRTiV5GunCWWoQfowYgPKFAqTWmp9FqQ0Io12Okw7VXtVv2XC73UY75
	omhO3+sDnSwCPA1CxwtcM+MXDVRB8hilom/mRGCYMzpvWp8y49659Isxt3VYxlkACbEy6UrsNYm
	+lwiR8BE/7fz9F9SvW/rMVfzqgyyOtNrn5WjLnNJDbgrC3/K60ap81DNgqoTDwQ1RB8jrGJhCuX
	TVx/wAcZhg2
X-Received: by 2002:a05:6a00:6c8f:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-84ee479aca0mr2990076b3a.2.1785589954315;
        Sat, 01 Aug 2026 06:12:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 17/20] libmpdclient: upgrade 2.24 -> 2.26
Date: Sun,  2 Aug 2026 01:11:35 +1200
Message-ID: <20260801131138.3299410-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128611

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/MusicPlayerDaemon/libmpdclient/blob/v2.26/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../musicpd/{libmpdclient_2.24.bb => libmpdclient_2.26.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{libmpdclient_2.24.bb => libmpdclient_2.26.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.26.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb
rename to meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.26.bb
index 2e59d7624d..2170a28c19 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.26.bb
@@ -9,7 +9,7 @@ inherit meson
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/libmpdclient;branch=master;protocol=https;tag=v${PV} \
 "
-SRCREV = "5073329989bf52676d8c446176a1d29ed3ffccca"
+SRCREV = "ee11992a793e16bcbd81eeef38d0cf20c0396cd3"
 
 PACKAGECONFIG ??= "tcp"
 PACKAGECONFIG[tcp] = "-Dtcp=true,-Dtcp=false"

