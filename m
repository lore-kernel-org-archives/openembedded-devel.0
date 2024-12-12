Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBA6E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 19:41:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.51.1734032459280263318
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 11:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aL9j28LD;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43624b2d453so12905555e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 11:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734032457; x=1734637257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZBwQVWipFlYY2PL8SsC1ak5uoiPmbOvT9Ed7l2luxM=;
        b=aL9j28LDMSdHtL3htR+SVf6jc8Kx9T7xPPYugXQGuJK1ynS61YCHdPlyp0Keue+rtl
         65beMWz7NrlCOnaN6c7Xo327YhHPlD2F3iIuZwkgY2SMM4KAvq/FerzTfNpcCSqGTcFP
         3BntEbVuwAVLAa2kep+tSa1kOzzF7DrBnVMQ0eeHtWsUZ9xhhe2E6+CvzeXkbbg49inr
         Wt49ASnIe4fYWyMpdbTGbA/0OtZbPMwQrZ7u34DrvX2kVSdVco3Vb0jaIgK0pLzbzNi7
         AoTFL/uaFTeXcqGm7nHSDvXqcyxdob3WuwAG5fvW8evrMCoZ2SzHGfr3QQKDknjwiJgN
         4fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734032457; x=1734637257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZBwQVWipFlYY2PL8SsC1ak5uoiPmbOvT9Ed7l2luxM=;
        b=eRuCdmbvJxriCRQeluHlZu1LY0hJ+kSVgEgw/r0MDNbPl1if4MJ3IOpKwjUxe/8yG1
         mGIKx1+OfFUjeZnPM8qm3XG2LyWmGDJAMvREUPbgojciGo5pPpEhAIVUII/z9JLq95NQ
         3WQDDqbP88ZMFmpcPcqfY2WARnibHmGfTT3uONFPSYRDyhwL92XU0YX9xDTDt1asl8tg
         LqcDkmwIHpiudAXCGuSwjUEB/n/P60ZGxsqwrmynLEybLAWTvCzbQWL8r6X5KpgzPQnR
         cIG0X41S0by9lfqSqEtINIDJf6u8rXUAezZmdo+Fa6//aC2QhYjpoLZb51XQyuKDDOm7
         rfPA==
X-Gm-Message-State: AOJu0Yz8aQ8N095eKb+iIDOzq9/OPyCghQ4WfKZD0MChR/NoQsIfTmjQ
	P4p+iIg1aVaHT5aFKLFfy4OmnBqGYDtYwmxZFBXe7d7wSMtvDcH9WoD06g==
X-Gm-Gg: ASbGncvdRejLTjT22eF3qxk9T4BgL5GumqsokuIABCqiSTAPyNokwXsScoVs8V5HqMu
	i30yFY3sHr4XL+raGU7YVFuaR4ebc3AlmbirHvBhkI7Lpbuh6DEFUM8L6YDjpCIuyGrFD7JdnqL
	7o2YdEtczMDXE1TeQt1uV5ZuU8/TR2GvnbdMXtAT/aRCCvywFKinDZ5VQQzvURd5+2DWJ/S3m/L
	AApzZ8zBM/OXEmy6Ob3zwxsAgjj9qhKfy9LOjeHVywll6TjNUFv7z6sFJfp1nnieYGgSxazS9O6
	OrhUjw4UDTomuy34usdnPq8gIL37kEoRpIBWF6TH0rCHB0vjGAXRtRAJsoNQWUsNEkGjMlPZqFF
	kaQ2S
X-Google-Smtp-Source: AGHT+IEA5cMMyfBW9+1P2OqKkfGmVIw6I6ybm1yz6EWey1pOPrcXpvb9rGLZGE2+shr2cqTRsCwOfw==
X-Received: by 2002:a05:600c:1c01:b0:434:f0df:9fd with SMTP id 5b1f17b1804b1-4361c393cb6mr86399885e9.2.1734032456833;
        Thu, 12 Dec 2024 11:40:56 -0800 (PST)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4362571765dsm25788735e9.39.2024.12.12.11.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 11:40:56 -0800 (PST)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCH 3/3] upower: add polkit PACKAGECONFIG option
Date: Thu, 12 Dec 2024 14:40:46 -0500
Message-Id: <20241212194046.874645-3-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212194046.874645-1-marc.ferland@sonatest.com>
References: <20241212194046.874645-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 19:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114297

From: Marc Ferland <marc.ferland@sonatest.com>

Add a PACKAGECONFIG option for polkit. Activate it when
DISTRO_FEATURES contains 'polkit'.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta-oe/recipes-support/upower/upower_1.90.6.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/upower/upower_1.90.6.bb b/meta-oe/recipes-support/upower/upower_1.90.6.bb
index 2cffdc14f..6d5fa7016 100644
--- a/meta-oe/recipes-support/upower/upower_1.90.6.bb
+++ b/meta-oe/recipes-support/upower/upower_1.90.6.bb
@@ -24,9 +24,10 @@ GTKDOC_MESON_OPTION = "gtk-doc"
 
 inherit meson pkgconfig gtk-doc gettext gobject-introspection systemd
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd polkit', d)}"
 PACKAGECONFIG[idevice] = "-Didevice=enabled,-Didevice=disabled,libimobiledevice libplist"
 PACKAGECONFIG[systemd] = "-Dsystemdsystemunitdir=${systemd_system_unitdir},-Dsystemdsystemunitdir=no -Dudevrulesdir=${base_libdir}/udev/rules.d,systemd"
+PACKAGECONFIG[polkit] = "-Dpolkit=enabled,-Dpolkit=disabled,polkit"
 
 EXTRA_OEMESON = " \
     -Dos_backend=linux \
@@ -41,6 +42,7 @@ RDEPENDS:${PN} += "dbus"
 RRECOMMENDS:${PN} += "pm-utils"
 FILES:${PN} += " \
     ${datadir}/dbus-1/ \
+    ${datadir}/polkit-1/ \
     ${base_libdir}/udev/* \
 "
 
-- 
2.34.1


