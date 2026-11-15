Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3805.1794728991317937472
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=glacAum9;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4584242eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728991; x=1795333791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNiOIEbcgJC80wec5SdRWKpAFuHJjU8Ic+Fu4z39cGk=;
        b=glacAum9z+vAr8UDmyK3wpDuVcqMjYSmkqeioXeBqxpPKyHVI7PmTk3DzlHmhZq8sx
         zlfah5EPzl+VyxPKa1SlSaITVi39mBJrky02EzqO047opESQiHj8FfA0hqGpaBeJzJsf
         0KyqaS/SWQGkmOw4Q8w48bQns+VJm7nsMFMnShN6XmtuGeOtqM+58y4FhEw4kYDQRIb9
         2usbodHASVlh2OYydoWHKcqvwgXqY4siRacFhhSoZp9/egNVMmg4nRsJNS0zcqisS/29
         K5+t75SwMPxUirqTgOc/INY4O0z53nUjsxM41DTw4mqEPCYmAmZzXDN3b5atQItzbXoh
         Rc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728991; x=1795333791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNiOIEbcgJC80wec5SdRWKpAFuHJjU8Ic+Fu4z39cGk=;
        b=IePAIAP+An2g5dDKrG/2qxvqgkArZvj2QpQy8KCLmXYBUg7SAbUDaF/DZZSk4HSTzs
         WCg3Qj9yvXd+vpovRdANaVQklcvhotw9yRMB1Pwq97IBgOq3jji5urN6wxDAfShyvUdP
         c01KWh2A585kvWjAYAjnVCfr6cm6N58BPZrc82ps4skoKs0K3Ntbmq0sy5VAYaDNvUX9
         ahTID/K/sR6eqaOkRaHoxISSVvZBvKxUVaLeeq50hk5t/D/PsgqjjpCD2FCVTWQg0xuI
         sN6o6eHdIsi9xRVDe7jR4yRqHRxiKYDAjwR+IDm9k17NZi1HqSqhyfbnsNzG+b0bDkHc
         D/3Q==
X-Gm-Message-State: APuU4Z+IW7vgFNU292DngFkbJEyeV9kCnGQAYWEX4wEdul4f5k0Kwr7u
	5NnHQNVuBYeeFNN/hpnKa3OUmIYZpmwiA0mKyaXDcI0KpSzF276wP5nKaXW9lrIS
X-Gm-Gg: AYBFou3XDMQ9xP9IcZD/FjB1lfDA6iTQekwCobu5iaUN5/J82EIhJ7PK/+pFMYm1uuV
	0Ssk7eFo3o2AfIwzAJItlzdQm1lllqdHfR7nuYUYmvbOcc320onZDMy4Wd/KjwxuPiI6oswOHkS
	c77VOXc54bGmDklgDtrqRY/NgH0MxhCrbwenWEuOHKWNhfC3IPEaevpQbiqSl7q766I68WnE1k6
	/11pSNyHja3vC0peP72f4bOfpn/3bgr0mTt+6FGy2E3i8etGwDszdDGQDgXblCABSXtTAedx04c
	BzGiFSQeDLMR5AgK51+ha9nNyoGQpOznDDjDgOMHHptxwOPm7j3xAXOtpiUlKkdSfrO5qD14emR
	XhpoFFf/Hqg0n1wV59NcknAdLKpyzhNhPFabdSfKER1nqmziS+w4tcl8WYwn/T4Wplm/2cXzom1
	qIeTFegP28NcOwNgfRDNghqI5DDIVJ1zdffU6FizMv1f7FLzBKW83rrZMpP8rGb+Y4k+k38FR+U
	Gk6GS33IHJDNf3UJIGuRqI5Ft/wWHnygfV2UY0hDelVgK3wB1QjeAjoRgE4hKPSocKjplYHxEHf
	4qOsoygKDc9hQ5uZeIkSqpKW//UxXwhCiz0fzGdARoLOU2BRgdbGO2UTFHrTtOEXCHIgRDFia1p
	uFYbRmfy8zcplZGA5XQiaH8TT4L2M/dJSuFhKhcZZN9HB/5g5AJlX+de3+hU4wK1TCoi5qI5Ge4
	MkbVLm5UbXWsn+bG7g5lZBnsb9nI5iaOYqyhRj1Ustx87n2OT0hQfnB6N+9s1XPpTFeds569peA
	7USRa+93YQFjYeXCPZun/XlemilZJYQd5OI7wQoETZpLfi6tRgZSXy15fYeo+BWHemQ2AnOFh6D
	piXv
X-Received: by 2002:a05:7301:d189:b0:36e:2b8b:a09e with SMTP id 5a478bee46e88-3796740eaafmr7785929eec.34.1794728990598;
        Sat, 14 Nov 2026 23:49:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 18/96] libblockdev: upgrade 3.5.0 -> 3.6.0
Date: Sat, 14 Nov 2026 23:47:56 -0800
Message-ID: <20261115074918.2932593-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132288
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libblockdev/{libblockdev_3.5.0.bb => libblockdev_3.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_3.5.0.bb => libblockdev_3.6.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.5.0.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.6.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_3.5.0.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_3.6.0.bb
index d7395bef44..bbcfb36d11 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.5.0.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.6.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https;tag=${PV} \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
            "
-SRCREV = "065d6910a0e915dbe633356da7bad9c4b3a2e2b9"
+SRCREV = "ced1904d3ae8a18c89a13b76d68f1908c3f103d4"
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
