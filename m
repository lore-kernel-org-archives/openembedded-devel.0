Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F80C282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 18:14:45 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.1101.1740766479206081573
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Feb 2025 10:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iDIHTET2;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2234bec7192so12414115ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 10:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740766478; x=1741371278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWyShBIkfBqVfSy9ukO9D7xglCtvfhtL3FJaUs244iE=;
        b=iDIHTET2aJsChXVHQJxV9aaVLjYDyUG50kRUsKcISlLijDBDpgFbNSKSexfADruAd1
         DVYjyT1T2fc+zN5o5z2TWAyh/PzHApOzw40iNi9vn7FVmiym6pGmUOOd9oApFgKkOtKU
         pzawLIVLsBact9Wiq+QhvQDbbQbem13R6APwy4Pdnsq7tharHTpB4303YG0EoeyJwVO9
         v0Nnq9WYHrdW4u0JQw8v4TmQOmopAle8huxIp9jaVsgrJmZsv+ejnAzh6sn5moj8Sgma
         0wu7lzno3OP0eC4108AQzxu2gw1jyuXnAf7mGoYRxmJvMOkI0J1gUnn3GQtr0iWGqO4S
         sQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740766478; x=1741371278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWyShBIkfBqVfSy9ukO9D7xglCtvfhtL3FJaUs244iE=;
        b=m2/S7TfbnPzVDnBfQnKrA2MPMZCu1MFFDPeBpNgvt4Lum828akFygcnGunjgWg8j5m
         AxmYQKAlSgx7hdUo0p+ZuxLVrrhGD0GrsVB85rdZTQ762jKcAa+v9SwvEQZkQrk91pJU
         n57xFjRz0EwPLBiPJoNFkyNkyI3h18jw3ncXEy0ybRiTyQyHd2vX9ng5fqS/3RQJX4rY
         a226WD4hqKgqTCG3bf9ik6srKC5eU5XAx3uwjFnmygtxgKhxlBvx6fHdlU0g76C+5cf2
         AcZ1WecupDFw/4+f4G2e6ZCDxPcPneF50aQqMwX4BB0ph43g/j4nYmsqUtnCLv3nez5c
         PgCw==
X-Gm-Message-State: AOJu0YzP1tyA22dgxoJwWIgPiXZJN/ZTg9SmQWZaBRrmE69dFasYuS+G
	2d+sK+UesCQkO1uS/oUMlCAqUwMu1eg5oUHIsSOe9qaLGAFy+VIpmwfM01Ks
X-Gm-Gg: ASbGnctkVAlFdz8CpK/wTP4JvDfxAyEy4m+3kyM8pO6u/TF2P84lhmWdOBxBoK7+75o
	9q5P1IQ05cnsFlhLmTF2FVT68zr8Wfs6BV2Jj/puzfsH0RlcoLk681R82Co0eP3MnSEBBQdRPTa
	+xdrL5n24X6iDy3uVbjXnYVzWYqDD5EhyQbSIHsrEf119Fb7h8rlUTXcziOX7+US0p6daRqUW1u
	fR8IyKFe463B09RhFMOfYJ8pKcKrC+ulPGRekAgDvLdg7g1Rc2PPxMoOs+J+Wls1evOCiu/FHIF
	f+6cjjGd1ChxiP4Lew==
X-Google-Smtp-Source: AGHT+IFmIwOSVAwN0FKH85dcqZ61uT6tqYZiGCXXNIwNlWBJCpIG+PJVZd6dS39d9BVXxVZEhWIsLg==
X-Received: by 2002:a05:6a21:e8d:b0:1ee:85b2:ef7c with SMTP id adf61e73a8af0-1f2f4e00be2mr6639766637.27.1740766478058;
        Fri, 28 Feb 2025 10:14:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::9a5a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a4ebsm3282388a12.23.2025.02.28.10.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 10:14:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tk8: Exclude aclocal so existing macros are used
Date: Fri, 28 Feb 2025 10:14:35 -0800
Message-ID: <20250228181435.2786360-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Feb 2025 18:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115709

Adjustments for autoconf changes in oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
index f277b86d91..9474f3e897 100644
--- a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
@@ -39,6 +39,7 @@ CFLAGS += "-I${STAGING_INCDIR}/tcl${VER}"
 inherit autotools features_check pkgconfig
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
+EXTRA_AUTORECONF += "--exclude=aclocal"
 
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"

