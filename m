Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web09.256.1617899785307271046
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MiGk/uLy;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id c16so2806893oib.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+vndLNMlXJJRCqyW9hFduzPL4GXipANWXS0TH2KO5Q0=;
        b=MiGk/uLyBe9AQoaO4UJ+OPtQyxIgTS9WIGbR/qeT7b6eSNjnsckNssV4zDcom0CMNg
         pnngDkZGyAE/kCTwGQOYuBJEnbIuqfx2xDsxvaOGWcZ9wx1pyBnZozNIs4YENA6mRWBB
         E+Jur83HV6fhsNz8ke/tCrWohB92+wL9E7SLbWTtDUBjQmpPJB/jOCk7qZS87VduqahA
         Ord8jmoIeoKOZGBmeAyLAHdZ3AbxSmdNXQGOocjgA6MPTyoD5N1Ov6gPct1u9cOZ18yt
         MzoESFr5CKulyXmGrvc8JyDCBAEftJ2OiKt/mmW8TT1EKikqpNn9KjtgJdou7PEIcqOl
         T5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+vndLNMlXJJRCqyW9hFduzPL4GXipANWXS0TH2KO5Q0=;
        b=BmWhHegpHAU0v2CkXMvRx2hwlAKXv2mls/Bx9q1h8ePADn49ZV/PSNa5GWkKFhFKcH
         6I2im5OcDVj2Fe7aN/LLQWk7DlD/c9eoHImCirSuFZUFbbnFM+RtUy1RH7IPVq/VtnGQ
         o+7mLs27vXMOLRIyOFP94J6zD83U5RFywb7RgIc/qB2DLdv6oTHs68vuQXYEucNaawmZ
         JMLShVFmRmKoMmDD1F9K27Gm9b3fhU9uqklMgZ9hGBc3iogvuOE/1H57aYg8xzq9jowl
         cehM6QIxfYPAilXV/33Sd/8MKbMYMKtNv20GETIjPeZPEeU3j7KbBWi9z8W+oouv+y3r
         pJmw==
X-Gm-Message-State: AOAM531YPlt83P6zCcVfi2t0If9LYRHVakzSww4p8F9oXP/RM7JL2af8
	mBFNWOHwF0EZpVG0MjJchxQnH0PsEFI=
X-Google-Smtp-Source: ABdhPJwxnbYtHtEsGfBIpomSzZhsEYF9mnBVAacIMdXfFKbb4NFTTQpSN0e2Z5ZzHdHcGTangEjzEA==
X-Received: by 2002:aca:dfc1:: with SMTP id w184mr6859538oig.79.1617899784530;
        Thu, 08 Apr 2021 09:36:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:24 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 11/64] sox: Exclude from world if commercial is not in inclusion list
Date: Thu,  8 Apr 2021 09:35:18 -0700
Message-Id: <377e9ec1cb6ed3ebe1cb03259664eac28c301b09.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

It needs ffmpeg

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
(cherry picked from commit 944317df4b2dc94613ff04ef0484380725006acb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 21fddd1e197..4c3f37913ad 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -38,3 +38,6 @@ SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"
 
 inherit autotools pkgconfig
+
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
+
-- 
2.17.1

