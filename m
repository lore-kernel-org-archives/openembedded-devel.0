Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EA5E63C92
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 07:40:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35214.1769326809586947149
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 23:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hbjkNtOq;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2001059f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 23:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769326808; x=1769931608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJJBsiRlSEmF6AdkNP7RoIF695TQQaqYvlNLSxNTXXw=;
        b=hbjkNtOqEzI/Uv0AqJNcQrNJ8nyKjWQZl4LMIWgbxU4kygfRpN2NngNo2hCvBUmXF2
         gQFi0vsOcuMjad3N4MgZEECO1LYqTHsjrhL3TvDWOwUk3bG/ToHLNtWygTwppragiHWy
         zxF7IV0yVH8OBAXMOVoHTg9pbUuKdve8QDhWfulfrxMS7UNPizVqvZJmE5OeiU8MNB3B
         8Hq9t0grLMCJC5vQ83RQMIRM+2/qAL+AxNmryZRIbt2O3EOkts+TO7Z1VEFwgdQiibKJ
         nJAkbfnMgb2IM16XLoYoRhOCcVCQsBa4Lh1PGVyJL2T8G6R2i5zWH7itPl8vCH0au6aa
         tTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769326808; x=1769931608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJJBsiRlSEmF6AdkNP7RoIF695TQQaqYvlNLSxNTXXw=;
        b=UwareIY7buUgRoMyZDzWKbQAqgAsphGvjQkmhU/muT67iPJqPTpsGf6TaG911El05o
         uHF4EnHyH4f/6rLdQlyzb6TEWe3fy7wZJMKQVuHf1f9UbCCzKUP8AMx/sdEDff34aCPw
         zOc9w9tRdYUE637uCIJTF4avApn+XF/Gp3tROjFhREWh6+HW/n5WDapjAbO8jsYjAhmq
         2aiqLofCLlopEPhs4FQ6MIP0xeHGIMg4goejkXkhrWVnJL/sECv4nje2Fdb4xQwcmN0Q
         nUgShfJg4mTulKvKdsKghROry/K19cXhrVb1gz/swRJb7KYQqWwK2acn+c7CQMy9H16Q
         5Nhg==
X-Gm-Message-State: AOJu0Yzx4YQT2iZCQOl/37vNesLX6yZhENwOD1RipuaZV1ghyXeTtwsq
	mJyckLcUDfkiWs6US6jJteKzftmd80AY/lxABeBNmnr5bLjlA+MLEUzl6MCAAQ==
X-Gm-Gg: AZuq6aKINj02IxX7+AszSWDoEcZSrrrKSNbYtskGGwlclLJpBxkaHNsVNBEmL+Tudqn
	3zNr51Y0iJlLfiwDYW+NXcFkT5bgx5ANFbrE2K4YmqXZ+M7x45sxytNxB+qmavDc90nyAlDxIjg
	iTilQLxPv495yvJDxmZrlecinKAEuboVPb+hXSm0l2wNMBkVqvFuMqwwqjxfBxAEVyk/50LLAMZ
	+0xdWVK3DPZ10JSY84X/JD1A+hf157Y4r/tObBXF7MSEA5RXiFqWBYye0MOFZdc6gHl4JLQ3w0+
	Kr27Xs59jRMyb0L32d+dfwMKVQ+tOssom32Z65rx3t+zeSumHP0FteMUyqQx81cTHfEVhJEu+JA
	442USTd23GA0caMuoUBgbDMx32UZ9aW6zPmmnRr0cT3uNtJ20F7dY1ctq9Ai0mjvZ/bDeg4Ks5R
	sJ5WAxi93O
X-Received: by 2002:a05:6000:2c03:b0:435:af8a:2a6d with SMTP id ffacd0b85a97d-435ca0d11bcmr1218438f8f.11.1769326807902;
        Sat, 24 Jan 2026 23:40:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm20265542f8f.20.2026.01.24.23.40.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 23:40:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 3/5] gnome-bluetooth: upgrade 42.3 -> 42.8
Date: Sun, 25 Jan 2026 08:40:04 +0100
Message-ID: <20260125074006.244692-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125074006.244692-1-skandigraun@gmail.com>
References: <20260125074006.244692-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 07:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123834

Changelog:
ver 42.8:
This update fixes problems with some devices not disappearing from the list
of quick settings in GNOME Shell.

ver 42.7:
This version fixes bugs that stopped the Obex Push server from automatically
accepting files from paired devices and caused the device's Connection switch to
appear out of sync with the connection state. This version also contains build
fixes and updated translations.

ver 42.6:
This version fixes problems with icons for mice and tablets, updates status labels
to be dimmed by default, and contains updated translations.

ver 42.5:
This version fixes the pairing dialogue misbehaving for some Bluetooth Classic
keyboards, with the passkey disappearing after the first digit is typed.

ver 42.4:
This version switches the power state API added in version 42.3 to be backed
by the experimental PowerState property in bluetoothd. The API will not show
transitional states if the version of bluetoothd is too old.

The battery API now exports the battery information for all Bluetooth devices
listed in UPower, not just the ones re-exported from bluetoothd.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-bluetooth_42.3.bb => gnome-bluetooth_42.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.3.bb => gnome-bluetooth_42.8.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.8.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.8.bb
index 7bb8500206..ed9be6e3d2 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.8.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "c37a2a07f77d4816b261e6c2086a056ed9767c3881dfabc826f4f82f6e1aa302"
+SRC_URI[archive.sha256sum] = "76c241e8ca2c9b1035364535ca26084f89fc5c0e1829510f8909583115fcc2db"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \

