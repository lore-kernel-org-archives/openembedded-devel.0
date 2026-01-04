Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0181C2A06C
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 10:38:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40900.1767523126456938865
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 02:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQ/KMkrq;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43260a5a096so7277494f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 02:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767523125; x=1768127925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QnU5eINtFQSB7OMJ/syNYnh1gScBy8Sw1lT2E256H0U=;
        b=EQ/KMkrqMMEZEiOYo7UWBr/f1fQUf+Z68ZxC+7hVpWY9PVx3fMN3Nv1MIGP9sopuzl
         vMzE5yIRFnqJ+pvYWiANTyJDax4Dfa6VuxNi3t2kZPNjSVFWAQGEhd8uY2ZlKeMIeDrS
         b1H/1ov0/kbklqkrnFxaBnbSV1DEyNpaRW6sraIYHbUpep0eKYykBV1sr3MkCO+F674K
         IJQqToB1d2tlRd6T7qFBEQQ1TJF9KNMtDwsCQSY9zEvuTec5L/kF3qcKNiyBh3ihXaWS
         s9p1QUK0OwZIHy+GHbJwxoW6oxyk9mnLuLqNHoTGACLu+d1NtUuMpA5IH+4SAFbWYgMb
         +sOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767523125; x=1768127925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnU5eINtFQSB7OMJ/syNYnh1gScBy8Sw1lT2E256H0U=;
        b=drvDKrKcOh8Lb1tRsuM5+Ewp6XFNjGdCjuGHle1XgHQKMoZRwDabZSlik7nGGFhyAF
         LM48VTO89+DxIzxLrqmry/aet2FadiNkwloWkYQVV+VVMaeqGN35tYr1RzhTg1BekwPT
         TSG7MejJ5WTxNBrAVH3eIUfHpMPvHVj34oGwZdyPnWQUOkPnv6ZivMpYjFwXKaeKuYu2
         aZb9yaQ0PPyqf60rbpwGYY6gkRmRhAMiPFiuONjrVXwBtUN9PVamDwNomj4nOBZPdYca
         Hfbgssq+aKmC4Vn2Vcq9CjjMc9joAMnSKX95QIZNh+yJ68JDY/CYW0VPP0mVh2AuFc20
         hiFg==
X-Gm-Message-State: AOJu0YxqOqiK+0UmB7dW8gtxfEzk8Tty8PpTUxInyrDmFJt3y3xcsVzK
	gq76LpVphayILHLR7o0Jw7Q2lFQfRM9fTV2gloGhNo0F4SuTJ5FG7bD9wN7Ahw==
X-Gm-Gg: AY/fxX6s9tFXhUlWAoJohq+iM4LC5Es7y8SG4QoXAJ241TbtI5quOcAPD/luliExlrC
	D3vk55SHS0+87EmptSNztrMo+vfMrbuMSD+HnzgwF2sOgqZCdfvLqJFdxbEgIM3k3nIvqFaqkmB
	ljbgnh6597VZX87NgrcfBVZ/dw76yFp6PaSRjqyE8uNlRzetRKQqvGg4gi/M+dLOv2MKN0zG6ku
	bdplXYkhDNSLJNl32fMIdnuIEmh7NN5D4cEn51VzDA7UUghr5PdQHa3LisimxZZP0c/dS+rg6bs
	Ii3xI4MPQb7cSm1DyV+07xg79Ozcql6umKf+BXDmM+o0AFTV3x0aTN5oPF6Aqyu7JjIYYruyNI6
	zQKpZ+2r/XXJj3HwJhevtWdbZJumKoNkBP6pUaDMNarmRodntSHvKTCO39Dlc4Vzm5RWYucJx8x
	BmD90vNZZh
X-Google-Smtp-Source: AGHT+IFAbVJG/JpKVD0CceV0/0dwnCpkz4dnSmWnfSlDiUdF1j4H0tSB/C2CVH94DttWZ59JVbNTtg==
X-Received: by 2002:a05:6000:178e:b0:430:f7dc:7e96 with SMTP id ffacd0b85a97d-4324e50d6ccmr61218296f8f.48.1767523124442;
        Sun, 04 Jan 2026 02:38:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aee5sm95885178f8f.4.2026.01.04.02.38.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 02:38:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] xdg-user-dirs: upgrade 0.17 -> 0.18
Date: Sun,  4 Jan 2026 11:38:39 +0100
Message-ID: <20260104103843.3450950-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 10:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123114

Changelog:
- Fixed minor leak
- Documentation fixes
- Updated translations

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{xdg-user-dirs_0.17.bb => xdg-user-dirs_0.18.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-user-dirs/{xdg-user-dirs_0.17.bb => xdg-user-dirs_0.18.bb} (76%)

diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
similarity index 76%
rename from meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
rename to meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
index 75d7f27485..84fc9e2f18 100644
--- a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.18.bb
@@ -3,8 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "e0564ec6d838e6e41864d872a29b3575"
-SRC_URI[sha256sum] = "2a07052823788e8614925c5a19ef5b968d8db734fdee656699ea4f97d132418c"
+SRC_URI[sha256sum] = "ec6f06d7495cdba37a732039f9b5e1578bcb296576fde0da40edb2f52220df3c"
 
 inherit autotools gettext
 

