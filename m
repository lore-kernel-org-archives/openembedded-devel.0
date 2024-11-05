Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD65DD35E2D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:16 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.27785.1730831959500674321
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NuKjuZsq;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ea051d04caso43290527b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831958; x=1731436758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaphO92BipKfboOAXVzKUh+g/SqVA5LuCbheErIalqU=;
        b=NuKjuZsqWcWzScBLy2XUOTpDIYeElLokCBUok44tECtrkpM467Rx1FsINkunhUOLqQ
         3jfwuaK90wexLJ3Thfki93HAOlViOdagUhFmhS7bk5AlRy8zYTZd3i6gHgWv9Ym/2DoU
         /1WEdhYh4d1sv+rZmPYDuz/XV9ZN0nRCUHVTF2mGhzZ4hhPCSRP+UXQWabsOovnceIKO
         BQLMS+FBaCo1MoS0IuA2DX0s+F887+ExSt7iV4dPbJHi/j/9XYKyjHYdW4H53eqfSawn
         1N2alRmVLH2ixqzRCmpeMioOtd6wZoaO0oBC4EHBJFTFuwQOeKF+eGxiEFOD44cPb8i8
         nklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831958; x=1731436758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaphO92BipKfboOAXVzKUh+g/SqVA5LuCbheErIalqU=;
        b=h2aJqqeLOcDV+u1U5UWaDjkFDUQuWHooFavfB/xKzT/gwBCRYYGnuVBypwYj5RJufC
         39tsxZm5ASi/N/5Qc5j6S4UfFwnVbUHetutCta30Ko2377qWKZtHVt5wLVnubVF/Bb42
         0szKRAnK4OJDndSLBQ+vgmkovcOf9Lb/3YI4wzGIdbkwlr+6fZDMeRayYhiSe8RAPBYW
         SpySGOJnaLtqxqPPSEwdsZ6js8Qv4qlC0XXKyy5Lnk42AL6b1aYgEK9WzUm1n41maztz
         WjBqYtbhUTmH6zy0RWUFKzYfnf9n9+3k0mbhG2Gmtf+5sXwQaggvqEoIhl3b1PGEPa/3
         PsDw==
X-Gm-Message-State: AOJu0YzelG9dJYCdgnn6spcBljJJVUyNTqGIHqpWAbbt+1jDbdpiVkyX
	vUFgimFzqvQkPCenfnN6w6gt171ctzUWTjInn4oK/RcWtMbVrKm9VMNC8vSY
X-Google-Smtp-Source: AGHT+IEA/bnneZ+A+c3fNVDx0MNFAV1m+z7WGp6DxguxVg1hIHksw9zmCsCYliFawHBuM7RpASaeYg==
X-Received: by 2002:a05:690c:4b13:b0:6e2:446f:422c with SMTP id 00721157ae682-6ea64b0f91fmr177952357b3.21.1730831958189;
        Tue, 05 Nov 2024 10:39:18 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:18 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 098/161] font-bitstream-100dpi: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:14 -0500
Message-ID: <20241105183658.34982-100-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113613

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
index b280a3260..def7357e3 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "6b223a54b15ecbd5a1bc52312ad790d8"
 SRC_URI[sha256sum] = "ebe0d7444e3d7c8da7642055ac2206f0190ee060700d99cd876f8fc9964cb6ce"
-- 
2.43.0


