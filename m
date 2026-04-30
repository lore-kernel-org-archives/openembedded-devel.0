Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B566FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18366.1777549627904058318
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=llHxoVN4;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so769926a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549627; x=1778154427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bDC+CpFjRJeE8jL/RAvuJ9OkzQSI6iQ2rclgeKbCWw=;
        b=llHxoVN4XZ9jIaa4A5o89nbpAGtwFLG1Y76FIH0WWaEBaSwTgfHZ5S97pZxGG/Ndu6
         Tu6RF4uIp4Vgk0JbF/BztZGq96MTVOBVHC9Ttm50H2xCFCZe3LD3jaW0pu5Qxm+II21P
         F7Xk/NMtm6YPRg6EjEsv+pOz4szCoKcZjpwlcLkMT0Fx/+RBHHTIeu/fBUyvh1MVWWXX
         G2h3MweuSHGwNg1Oq8L13wKdcQ4HCtaMOxXfJNlWvVmbjvcyomTOOiwWUFIwugDAWsdY
         G7DT0UwZBk7IKElVLBzJjI/1If1u2P/xJwGy0xbDCpofF+a2fk7VVt1fQDeyWh4Qknvc
         OSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549627; x=1778154427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6bDC+CpFjRJeE8jL/RAvuJ9OkzQSI6iQ2rclgeKbCWw=;
        b=rmG1FU3BPrVCKZy4IRkwklSJ6VrGW/syhrDoc+/E8u4i2McEJQmoqgWNk6ti1Ix73A
         am1INwXVAAXFJrvcqrUzpKq7k+7mPiFL/5wCBLM1xvv/6Qg3Dk1mIB1xVhqCxUpCdz+l
         QsS9vxl6FMhI8gxJiLyl0zLvywxe9djKQKTQFHtjIzC9nmgcsqhGIz1B0E9ME6+BXU2h
         wXaOPm8d49VFHmcb7jNwWYvmI6OtVDuiLTRONxerq2QiIq4qw/urENA3YXiHQVMzKIAT
         oVnerh959FSfdrKVvK/BssQVqO33rApG7wPm3VuU5opsADyBbAcm3qb89aRC7010N/mt
         LqBQ==
X-Gm-Message-State: AOJu0YyRvFYr0hUGDIsFSnTvZF9OYVYYjgM50YlGE/HJA/OVclwkV+2G
	7rVFghM9WL5T3xgi9JFyR/B45wKVpa0XeJgk2koLTsWiafOR5QFGok5IKQtd59JV
X-Gm-Gg: AeBDietd33bMfGJ2oyFREzryG57knRHw1hydqCJ+KwgISKVX1SuCcp2uBbpT/LOJySS
	9Vl905sOWJvTBgi+2C/7+ri4lYWZ3YiOaA0QnK7gtPxTeFByXFnAEXXzC/Y71NURQeVJYZDcQiB
	3R/UgvSL4UEOwTSYNegItCiNiQNPXh25mO1llu7KShZsRPwEqqA2+ir/gkJp6uPfQ19yXHAPSSv
	eorNHkviBe8Gg2YRNzsBnhXP9gP8J9o4/TGcGoINukZplJG9LdtwKBMOy6xoIa0eu51QWdXcQeC
	vCzYtHdO1QWrF5ZFspQ8ekmniNBk6VNJmPIN0dzarXGAT92P6UHqsVEg+FTrDMiGocouea/0DsG
	M5rAdNRKiPkMuoPk7ZxJYbLYDbQikdFoMC5k7kWhl1Kqzg0ByBFQJqNxM4n5Vyw7EmWhl37tY10
	StneynliWtrr2byIKteI7H1SyTQwD5nTazm9o6yXm64eZm0Wo=
X-Received: by 2002:a17:90b:270b:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-364c2d9f623mr2613305a91.0.1777549627056;
        Thu, 30 Apr 2026 04:47:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 3/24] xdg-dbus-proxy: upgrade 0.1.6 -> 0.1.7
Date: Thu, 30 Apr 2026 23:46:26 +1200
Message-ID: <20260430114649.4184890-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126737

From: Gyorgy Sarvari <skandigraun@gmail.com>

Contains fix for CVE-2026-34080. Since it is tracked without version info
by NVD, mark it explicitily as patched.

Drop the patch that is included in this release.

While here, also add the recipe to the ptest list - it's a fast one,
runs under a second.

Changelog:
- Drop the autotools build system
- Unbreak the CI
- Prevent a crash on disconnect
- Fix building with glibc >= 2.43
- Fix the eavesdrop filtering to prevent message interception

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{xdg-dbus-proxy_0.1.6.bb => xdg-dbus-proxy_0.1.7.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.6.bb => xdg-dbus-proxy_0.1.7.bb} (75%)

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
similarity index 75%
rename from meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
rename to meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
index 43536f5d7b..36b046482e 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
@@ -11,8 +11,10 @@ DEPENDS = " \
 
 inherit meson pkgconfig
 
-SRC_URI = "git://github.com/flatpak/xdg-dbus-proxy.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/flatpak/xdg-dbus-proxy.git;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "1c1989e56f94b9eb3b7567f8a6e8a0aa16cba496"
+SRCREV = "6a170fa77e3cbecb48f9dd2478fe5c0a119eb467"
+
+CVE_STATUS[CVE-2026-34080] = "fixed-version: fixed in 0.1.7"
 
 BBCLASSEXTEND = "native"

