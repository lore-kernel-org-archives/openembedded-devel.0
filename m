Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1589CCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 19:32:19 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12356.1762630331883849109
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 11:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HoTtyuHz;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47778704516so737435e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 11:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630330; x=1763235130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BEUQxKWaueBBoYGIWIK0jJWr2JdEkYS6dyOZGUFX7M=;
        b=HoTtyuHzwFv9GCZwijAybfncwSq1lI/xxPmpeDdzp9E5oe2VKtqGF5XzM4vb1pqksU
         Pk1CRvehsd+GZMW1FMvFwxKb9mr6CCJ+5LwkzAg31W9g5gv9Nez+vVUWpGQ2icpZ5+jq
         og2lxigjhOH06uX/G1/T5BYy1RFIaGMz7lXkhIXELBKu2zNKoWaU6AoNLAhnW0EKmApM
         Gvgvsv7Fx7wHMl5L2B+64BOnW/o/mbgNQZDrkybBDD32lzqVrsyxoh0SfovpKMgAwRyB
         GPYjUSal+EaVle7DPkRFUfGOWJzCif9YzKzs1setoYoNcyxUgZ31BBYj/IsOASuYHRIa
         o/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630330; x=1763235130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BEUQxKWaueBBoYGIWIK0jJWr2JdEkYS6dyOZGUFX7M=;
        b=g3rwVV4OZxXpCvfAl6DhDcVYGkKdquVq6zUbLmZbhB34WD8y+ROjv5x4WHoskgqwx+
         hNMXnWfTOT7Z/vg8NpTloilIfAHSc1BHXbu4yUKzemCe5PnJ2QTmf5yWzXUsqisElXZg
         Y8ZoaSHtC5LQAg6lhqRgHDGwkVKEvAAmY/tA07ykdS8aVCEq4VWROWroRx/ZzdjNjqqQ
         VOu/j77WqHhjxfsly8pyPek6fN5PKwffvbGba000lwi3kxYVpLi4v32uZpkH2BJ+27Lp
         H3SPOjmpLtpFiq1/x0vH4SIQ7a0G9OODIeTcd8o3sQxqhMLzHBkjTB0XI28KqHp7725K
         carw==
X-Gm-Message-State: AOJu0YxWnckCr1K1vieiDJMbUa1sYNQZgNu+oxy4BEx5TdiouwOyjqh1
	tlPAHbuyaTkHS8tGoxQUXP47osJqkaxLkfUcW2aVxAiaTDFR7GTcla6aKO1pHm7d
X-Gm-Gg: ASbGncuuKiitHZtUuWjdnobdyI92Kgv/4BKdtAJLkuANg1i/nKaI7aSjZPNumBlawVO
	KOrxwxE2wGXD6gQx0QK3Ovw+AvuLDpRDQMf20BNa5yHtvRCM1tD0FAJY6vr74h9oDAzrdl5he7q
	euq5fbGu9xNZbxtBifDB1g+OMAjUA2C+zbW8ndSqEgwb6NJymfgvytsZtp5Rz5wPKNjfpMK0A7d
	bmqGRr1bq4DGQsRNtVHaNoafj8v97xC9wGVXd9NPWvUGBVrmqHEzAsAAS3aelkHq7Y3zRDXCdbS
	FviqYavxkX3xRjdbsTjdEiBR3z9fLIFbuuZ5YbGd0ZEcJa0kYDdiDVG+f51g4BRFi6XioY6GfZ5
	6i7zRApuPuAVX90p0u9K7qlc8OgHOBShe4x+p7jaL8pTzQyBYyBWDsEWpcZ0/jN9NEDHNQtv9oz
	M6WTZlwAEk
X-Google-Smtp-Source: AGHT+IFCeQU3UiXc2zvBVV7Qq70jcf8JObji9/iH4ilNByE4jN6J9zFDaM/TsN7I/w532a+t5Sv+GA==
X-Received: by 2002:a05:600c:3105:b0:477:1622:7f78 with SMTP id 5b1f17b1804b1-47773293fd4mr25361335e9.40.1762630329884;
        Sat, 08 Nov 2025 11:32:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcfd021sm150455725e9.11.2025.11.08.11.32.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:32:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] consolation: upgrade 0.0.9 -> 0.0.10
Date: Sat,  8 Nov 2025 20:32:04 +0100
Message-ID: <20251108193208.3465135-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 19:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121401

Also fix SRC_URI, which wa lacking the "protocol" tag, causing fetching
failures.

Changelog:
 * Fix support for --enable-dwtp and --enable-scroll-button-lock
 * Resync with libinput 1.26.0
 * With libinput 1.23: New option --set-profile=custom
 * New option --set-rotation-angle
 * With libinput 1.26: New option --set-clickfinger-map

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{consolation_0.0.9.bb => consolation_0.0.10.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/consolation/{consolation_0.0.9.bb => consolation_0.0.10.bb} (89%)

diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb b/meta-oe/recipes-support/consolation/consolation_0.0.10.bb
similarity index 89%
rename from meta-oe/recipes-support/consolation/consolation_0.0.9.bb
rename to meta-oe/recipes-support/consolation/consolation_0.0.10.bb
index a1523be376..0c1aa9357f 100644
--- a/meta-oe/recipes-support/consolation/consolation_0.0.9.bb
+++ b/meta-oe/recipes-support/consolation/consolation_0.0.10.bb
@@ -14,8 +14,8 @@ DEPENDS = " \
     udev \
 "
 
-SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git;branch=master"
-SRCREV = "5ef08f0cd6ede62de14de477b74fc3611108c676"
+SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git;branch=master;protocol=https;tag=${BP}"
+SRCREV = "26cc27451dc10128dd64e804c9f071680e7fd8ed"
 
 
 inherit autotools pkgconfig systemd

