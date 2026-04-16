Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B81CF433F4
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:51:09 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7032.1776318663487736281
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eMJCMW/a;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c55e3858cso6336479c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 22:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318663; x=1776923463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvxfO2sY8uCYFhfA4kR3LyAUWEf6A2FhvK/PUzhNJOY=;
        b=eMJCMW/aGIyI8I1DDNIp2m8nxBPaYRg2VQp1YJZ0hHg0bN5/oB2gnhMSym4XLC4SrH
         CWXOJt5ez0cHCdxnqv+Z1EQblQsoQpqqRMgYGgp3rfGWZvMGG3pZdJ/Qwuo2O7G0Ut6J
         mHiCByYU6cmxFNEQaQ34MQgWNRGMaglwglaJzKDDD1zwsM6VdY1h1jDdCqiIz0Oc9FNO
         9/H88VQLi/QqcBGNGik8+N9XIW/lB6xwrqIbyMCHhpsVmdXfyI1NfB5IVBzK7cS+XGar
         aUgHBHU4xgRwoNB9nrMT3BqXOs/qw6FS5FDRhWaEGhobe/9k0E6BCGsvhH44cfeZckA6
         g1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318663; x=1776923463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hvxfO2sY8uCYFhfA4kR3LyAUWEf6A2FhvK/PUzhNJOY=;
        b=nelaT9O4ODSZSlvMKdqIRGx5fYt+1URvbuHWZKWbPYjcseb6lSlCArAfm8RzF7YA7p
         sSnDTMf9FIBQcGZXP40kL6uxgQnVJw5K2DL6AVIX+7t5U1f1IDnaBYMj3y6sjWYKqSpS
         qk0RM+8LZqC3ll4Iw9aL6vpVyfq0dC6Hp2IIuv++Si/AQe9wC1dCbou3bjjT3jai+UdC
         OdHjraoaPJzh3tqod+3JwCSvDQ8XNAyZSh9+owvLKgyhPTwlqqcps5L36Cq00CuFX5Hl
         ndxWBKv8PzIx0NufwlQMaIWMW4W88OzmYbAteNLsc+7IoswW/sRBdL31igdiDAzUU6HI
         Zzvw==
X-Gm-Message-State: AOJu0YxAsASiigLpUT/FMGDZIltSoWgZfgQHMIa1wt2UrBAlbQYiGlnp
	jR0D4Xapj6M5gfIAt6G7+9N+rsaq8G1vAnc/fYjBtFnIEoCVgpFYvIcgLdpYBLuh
X-Gm-Gg: AeBDietIwpOrY6IUyZsT0FQfeJ3LbqXWO0ug0poiPJjb93ZgVWcKb2Wk/QWlYFhcDpB
	oxoThb5RV5jy0nphV2poth2pzsHU5CRtryJtLYJmMk0gPt23ExW4GIjH51lyqeuyIxvQXfjLaBU
	aWRNKD8Oy4kfTAqchTTU5Fuz9WgcYJspquAL49swwnH/hRCo9ZKy9/DHnYqF+Bv82MS5+yrPSzD
	Nuu5kPloIy54mmq/BMKUljyvlcUq5dHPWYMabFZZNq79evTkL/S/utJDlj58wpbi3uBXALAQI/t
	e2xgYzW+fE6jZjtdl0AXNrjhoYIX6qM0wX/7w+Ze326bFkNHfxITjIdy5vGFZzB0beiaVQGyEJ7
	RyoJ16albE7EgpqlOJIQlsIJGT6LywOuuT7UdZPbfjzVwRcfJbxuaya2kaG4TDxQXsqy3VBeIo8
	SNH/iZZeuQsdKt2bxsPs8T+ogjWcPcKkloE4tabWFQUOx8n3K/XTCkuIsddYaNsgD87A28oFQ6F
	y3DK9BJxYw7udpdNL2bvpfZnI71QwFy0uKzkOocE7yrGnAIESWxp7al0IrR/3oEKC+vFQYCFfMn
	SgSaUusDatVupUrNSNWpp5R/Gm9oMIPYK9zkqaIUH5bb0k/AfeI=
X-Received: by 2002:a05:7022:698a:b0:12a:68cc:3efb with SMTP id a92af1059eb24-12c34ebade5mr15861695c88.16.1776318662623;
        Wed, 15 Apr 2026 22:51:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61db6bsm4810182c88.1.2026.04.15.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:51:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/18] libcanberra: Upgrade to 0.30-20
Date: Wed, 15 Apr 2026 22:50:42 -0700
Message-ID: <20260416055058.792189-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
References: <20260416055058.792189-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 05:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126381

* Revert "Disable tdb feature on loong64 for bootstrapping"

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libcanberra_0.30-19.bb => libcanberra_0.30-20.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libcanberra/{libcanberra_0.30-19.bb => libcanberra_0.30-20.bb} (97%)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb
similarity index 97%
rename from meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
rename to meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb
index 1f1c23d041..2f10a10931 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
     git://salsa.debian.org/gnome-team/libcanberra;protocol=https;branch=debian/latest;tag=debian/${PV} \
     file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch \
 "
-SRCREV = "d1ed1ac0c9950ed3908c04abb7c4a6de5c51ed94"
+SRCREV = "47d67f43c58af36143060888fc8e69a9cb0eddea"

 EXTRA_OECONF = "\
     --enable-null \

