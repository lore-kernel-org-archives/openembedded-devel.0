Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCE5CA6017
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:49 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31577.1768811323506376893
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8yz82vh;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a743050256so3240375ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811323; x=1769416123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pL6DNhzuae9B+y4pXixsbW1c08aJ5QMUAOPyZlzcck=;
        b=J8yz82vhQxTsIAeqlaTQnOB3G+jk8FK+3qBpITAPDBmdvU8F5xw7W+9hFPqeTnMFpp
         kVcY/U1F6cOSvkDQ66pRIJUNcy2HJLw91yGd3m+rvdlV4zQS0KoyeEqzE1CgaKX7ZzRQ
         +lwyVGtOOcg8Ef3vAnmQ49g/fmeKjSrlINVzLQu/qm1H/pfVNpvCXYlX8hJX8On97iVj
         DP37Px1pEtsnZEACG1sjMk0qvIaU/zmsbsTcxalD0NJnOOLTlmMMTggQRZenb45HXaVO
         Gtn+VUXx7unyowJy3kdtD1z6mG9TOIk8DN5s3vqgDkGweMoLy8B8udUSnmeSIUgqs+sY
         Z/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811323; x=1769416123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pL6DNhzuae9B+y4pXixsbW1c08aJ5QMUAOPyZlzcck=;
        b=C5rgTABUqf3dMUOyj4UQFnexrjQ8cENJq6eY8joAivtq0yqJ5GXifcopc/lmsTSlY5
         IrBrvh76G6aJZbxjf5riOX7tPSsgBqGNyiZZEigZInt+MpWqbTGxuhHmhQcFkVJrAHYd
         mhTz5vV91IeOuma39gjaGdyXO8tlV/cWyV9ElKTWxvZ/GWpse2y2lREMrZwZbYLIoaHn
         v16q5yTFMqArmwGXeL9fJ+QUdxENmFU/fcMDPqXxk3ITSTm3kLRntj3KLAWlyezYNlRN
         tvaiwFDK9XS8uKMB0OHQldvnQmbqThEW3AKv/vOz30cFevmjw+PYlszlIDHrGehENhVO
         3fMg==
X-Gm-Message-State: AOJu0Yya1YOzC8OCOHkZHMH9ms+akojGhImXBVpSr3678HSipZszJzBD
	9z+2KAHjYSnq+2y5Al22bArH/J5+BncKvJ1iyAUYvEMtNJGepilFCVAaO21xag==
X-Gm-Gg: AZuq6aIDSQUlaqkTGAVI3AaoVPaacZJmMmpPlQcl9trEB5D+f4BMUUL9+MUYxrcUxwQ
	JXzUIiQkOiutPQJUm9SB1HOqoNoDvXsvYzEQ51QUvab5Ts29N+5AZ8Acy1rLkfe8tG15s8Fq57j
	1D+ZBc3VDgEMYm94ZmYUIvQ+DtYprCbHFtKGtlE2xbT7duNl0TxQtNrClebPgDLYNz6uF0jHmxW
	LobdPE6c+6PkLKAA7OAhkHSXhLoGmh9JDfUDoyyUDVzFggJQHRnAhygrogRfsnOO9EOu2uvVLIT
	+PAW0ya/YS8qLz273nu0u1/dIUpHureAL6/1quSY1/8RoXFV+0VN8Oej0EKiDVEyLi3QiU2tXyN
	mfkOEBZRzMKIuUTBSItHjhahVBoo3hmWzkPlKHXpYt+s7nEXYh/1X2/KyDVNVyjJ2UQ9D3czElZ
	/9jCK8ymXJRq7zb+GFzL7JK7Q=
X-Received: by 2002:a17:902:e846:b0:26d:d860:3dae with SMTP id d9443c01a7336-2a717529fe1mr125523245ad.3.1768811322741;
        Mon, 19 Jan 2026 00:28:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 16/28] libsdl3-image: upgrade 3.2.4 -> 3.2.6
Date: Mon, 19 Jan 2026 21:27:38 +1300
Message-ID: <20260119082752.4120991-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123610

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Release Notes:
https://github.com/libsdl-org/SDL_image/releases/tag/release-3.2.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libsdl3/{libsdl3-image_3.2.4.bb => libsdl3-image_3.2.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.2.4.bb => libsdl3-image_3.2.6.bb} (87%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
similarity index 87%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
index ac425f6ad2..7c2f4026f2 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
 DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp"
 
 SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.2.x"
-SRCREV = "11154afb7855293159588b245b446a4ef09e574f"
+SRCREV = "d78dd65454f442bfdbc373201165f1ef579484ab"
 
 
 inherit cmake pkgconfig

