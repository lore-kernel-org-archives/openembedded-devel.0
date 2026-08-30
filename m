Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA729C61DD6
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:40 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.993.1788051031280471952
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a0EkNM7p;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2365935a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051031; x=1788655831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvEytHi+Dql6TzdUc6/uAgM14AoEeARusdYZ6JVKIlE=;
        b=a0EkNM7pft5f08fa5HUlewvKzj18gJ2imkkm4OH6nk8ExZyAhb/4UPEHPl2ysEqs/f
         lagALpDxJ0EvHnQhEIHOl8T7gRx6qQXeiWk1T/ghlM/JnrKHV3cIx+QE1RSyqruqokmf
         LoU5oy6yKA9nD9GOI3bkMwekky8q5giZH0sXtYZuVv1ynsxejQY0teLFKdTdwzhGojqK
         dsOEgBjfKL+o97t5QxTZh7MqJS4JBiRDO1jJCWy795ps8dssXCPOyQgKxpneiquEH26f
         USVvOwYrwWIepfsphu6P3JLKTNbpyzrzyyjb6bY/ehkCvSiePt+aq5+0+jGo+drTIfbf
         gygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051031; x=1788655831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvEytHi+Dql6TzdUc6/uAgM14AoEeARusdYZ6JVKIlE=;
        b=QTawo0TzJClJFObRgZ6k7fgenZAHcUE1rt5hRWfcyjjnWPMdRFuaIYf+5gWDXJGCh6
         y9d/z7P4RCMRfUMzp9jk4mWImE4shpOv1tRt8B7flmwkGfK7wR9CRnK+pa7ZbDuU6aNs
         KNjMEQQV68QAsAtgg6RSoob87oy9GBYwrmjhZ5H9j9fqTX6L0lqGNlKM2C6hDXjl9Bzz
         4POqOa0foMJsNZGJYoS06Z3g017xpGvWhRa1GW3KK6AtwG8igK9f8+ikcMQlsV87SYzl
         Z4q9WzXHhmOE1W6paMY3l4F6brb6OSKLwT3lR9KOwLHnv1OLKFFtft9Qrh+rW2TLtcxI
         NSYQ==
X-Gm-Message-State: AFuF++mTiv0sUma7kE4D1ZdUDApuFb0PsKI6pV3X85rzqiJniiGEByTv
	KnzoLWGhF8tkigkjtUwaJO6kl7PX1RI8dPWn5GTgWBuPWF6JNjDHLjLkGzgr8b9h
X-Gm-Gg: AYBFou3uNEtztVOfm5QeN57zjPhrJY+SU1eSQg7ldZ2YT5o6e8P8x/Fx4PhDWQ6Aaf1
	yzmhUuNYZw7AN5no+mrlGVqTx7/QLfqqot5mkhNajzNsZXWBnZmLCyTx1l6oNXI7wbQUIz1UPVs
	Ii+ljq9sLWGChJmzVE4a0PAgWQGZS4gCKZablufEOV8laRivHHe618+WcfbwnIBVLw2vKJx9ckf
	0rbWwWxzKQRH8bp4bv2Zg+OT5SfmG69g/zB56+nl8nA/2lme+9RxJ8JfMh6OlCPobUkwmspul4v
	Fs35F3DqsEE4rChlmQrj0lzHQwOVoYNWDYMHfuy9RwMSm+25h8+FO3phxzxFnWhz6hMtUkzdo1I
	FXJZGGcT88XmhK2QnlOEFSMZoYqjEll83BSQ2U0sDhSKO/SclaFoML2atr70UHlxrnAWKiV4X/B
	8f2dS2b+Bvx3xYjT4bu+VO9VUZJtR+cr8NzyZP89CQDekveyE563wwGxMoskUpCDoZhkQIGWBT7
	Q==
X-Received: by 2002:a17:90a:14f:b0:398:9c00:29f0 with SMTP id 98e67ed59e1d1-3989c003c60mr8207779a91.24.1788051030553;
        Sat, 29 Aug 2026 17:50:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/11] grpc: upgrade 1.83.0 -> 1.83.1
Date: Sun, 30 Aug 2026 12:50:08 +1200
Message-ID: <20260830005015.2555347-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129585

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/grpc/{grpc_1.83.0.bb => grpc_1.83.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.83.0.bb => grpc_1.83.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.83.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.83.1.bb
index 34ec8863ac..75b2ea5a18 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.83.1.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-SRCREV = "c876f4da50f7da2f331888b88b2a7243514139fe"
+SRCREV = "aae267021b1ac256f8b9038d0ef528c3798cc137"
 BRANCH = "v1.83.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \

