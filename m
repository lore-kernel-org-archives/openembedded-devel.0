Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F13C61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:53:44 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28010.1787799220125112034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=azEg6NDB;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-85339ed040aso149630b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799219; x=1788404019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wuWznYmovvNK1rFI/ncA5Wpn9L4oQJmYEuFRrWl05TA=;
        b=azEg6NDBLM7ry0femv0LyRDCiT4nLtiQF9yQ4jqwOEn+XTKUUMMxhheT9lIOZj9//4
         YucPVy1QcjjVRcMxK+ZswaAT7Hjn9eRdWow7dIQ7/FEOwL5tderVdHTvL7f51Alk1h0J
         3prjA0ojlb6GJIXg7tQnoconGq22g79i660KJRZ750zMRLLMKafSMNSuohTfonjwVr9A
         kT+XpeP+F919Iucffb88qI73UMuqo/ptubDljvnTEy8cvM+dYOuQpIUfUMn2vhlB8eoE
         XkgCDqtGr1W/kzPAvB9xCBOIRDBUJSb7yRiGaSK0sMAH1SlRgLyUZiYflkGxUP43VA0E
         Cmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799219; x=1788404019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wuWznYmovvNK1rFI/ncA5Wpn9L4oQJmYEuFRrWl05TA=;
        b=hXKaqcrc8v84FGorCjjtckeBFjB82K6CJqJetBaP5JyR4V23uVk9tOgjQsWnsV2XXq
         vOYbvSpe+HWNypwnIKOYtw6Zt3HPqgr0t0c5SQkY0yN4KDwtgmPAPzFtUJgCpxbUbZmj
         MwpmjwOqS1Ue+5nW3Hg7r/tMVYbitI5mj/LGd7h4OZ08BCF3Deq9O5UyNd+FEvedc5qy
         yNlmG3tTiFiGst8eHk7+VYiv0J9idhujFRSmKkJUhdZq7o/27WSzEz83ooU/US+5VJQx
         MZIYhlUBjmANHn1hKGoZhXT4ZROROUD9cfhCg7J9AvvuBwiNrrg4bH/eTcnpADFJ+m5T
         dkTw==
X-Gm-Message-State: AFuF++lg1aWqm4vCMkR+a1PEjpJLk3GdBXvEbO3ILb1i9qkp5ZdIZfcP
	al8dhK+Tc6lx2LJpZE923BWVKImxZH6wkKE/mRmDjK+i6eqHlMg0Yncg5g2l7g==
X-Gm-Gg: AR+sD13D6lu63oIRpukhKJEIbTUz/uIFiW3asswiYr6xPL+UJCzEIa3Ud8u5+stUIwd
	iswfilXaRkQRfET8i9sOcs0c8RliMUgIIgBA3S4Q/M5RCSyKIxWTkeAjoTn1Q8bTMZqFZT9Z/Sw
	Y7wyEqXSrVscMyY/STeAfG39EUlhDktpC+4GiHudWt/m8HvJ+joP1n574CLuIfeejzzF+YOEc8R
	X6Olz5z1QOcP3ECoBvk1cBYq1ImHMGxfM81XnLCxUiSrb0WBpCfeV4Pe/N8+th1nkdFK27fxBZV
	ZWB7YjhmAJiSlmAwchgUNneV433l+WsXcm7Zw/Yb5t3QHNssOamklv/IBPgGcQsbqSAfLc69X5w
	BxtgswuPX4188e7TGPg3eb4cV+DeaO+Fl9q6yMRwAAk1bdjzmbYKwbnH3H0lykmfdKnjWIy5vpD
	756DEzU3zi8rTCeEAeCNr/gyIdMmQyVPkYMkJnkY6fzkkBJD1GNoDLd6KZeqteWwPd5X8MDtYW
X-Received: by 2002:a05:6a00:44c4:b0:845:e440:d0ca with SMTP id d2e1a72fcca58-853738ac5d6mr22085764b3a.8.1787799219499;
        Wed, 26 Aug 2026 19:53:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 3/11] libmpdclient: upgrade 2.26 -> 2.27
Date: Thu, 27 Aug 2026 14:53:15 +1200
Message-ID: <20260827025323.1433982-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129523

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/MusicPlayerDaemon/libmpdclient/blob/v2.27/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../musicpd/{libmpdclient_2.26.bb => libmpdclient_2.27.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{libmpdclient_2.26.bb => libmpdclient_2.27.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.26.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.27.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.26.bb
rename to meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.27.bb
index 2170a28c19..ade2563be4 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.26.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.27.bb
@@ -9,7 +9,7 @@ inherit meson
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/libmpdclient;branch=master;protocol=https;tag=v${PV} \
 "
-SRCREV = "ee11992a793e16bcbd81eeef38d0cf20c0396cd3"
+SRCREV = "d783a769f8b486e247febaa0056022e4ca980990"
 
 PACKAGECONFIG ??= "tcp"
 PACKAGECONFIG[tcp] = "-Dtcp=true,-Dtcp=false"

