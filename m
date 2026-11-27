Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10363.1795753070183651011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=avfOXfwx;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so1417086c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753070; x=1796357870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNGbWlibcNoi+tz5NaK4Gyb1njB48i4q0/5GCY9JDWg=;
        b=avfOXfwxqvgqj+UlYQpeX4IR1mgYiydUm4zhMbvo3hCI8hJs5WP95S7d2yEMIexR8D
         1TeaAJOllBwlYC2te200mc4Unxf6Ffmt4m0ZRLajO/OdyyUP+pE7bY/xxzrNqHfXxhp1
         2Lf5sC610v+vYySnzK2yoYfixYOwNpNKcWB3QeryaXpxyzwGSfKYngR+B4jvX2LNLAas
         KLuFiYyu7P1A0SjIHqelr9pElTpsSGs5ssEQ7Lbn9RKSc61Qf+o+KxdBVM2kbRB8uSV4
         J+VZ2Fb283hkqu9xnuUPGGMNeCx6K67uD1WezDO38aNV61SDmipZUy47r1jJUclDsIUX
         3Bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753070; x=1796357870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pNGbWlibcNoi+tz5NaK4Gyb1njB48i4q0/5GCY9JDWg=;
        b=p2cxWXvBpZ5onGAAiCWJzkXSRgZNhLKQ3EfovbyodOIgkiJawdjv/RkKpLpSeGNHvR
         8JZVt03ojU6ONspjfGt0EO03zE2dX17tKye3Lg93IzWWzWelWOoN36gDiIK6XSo3RJ9H
         PDPernImg5Wa0LW6kcSrgylj7EueyrqpBonnQl51Qoab2ABeSXC7zMkn2ldbURrOS1h6
         J7ulHw71ehGXC/ybrGTL0iAENZn0NhOmQK45zDc192wq+rv1/c1606o2C+gYonRivYGN
         Youij1DjPfj6lmKFhRCs0/knSXyaX1e36yWDOf7UMnd7fu/5jrJr4DPlKTVLOd1vDY5V
         bYpQ==
X-Gm-Message-State: APuU4Z/ogygVYkoh6Wy69vbIo0vQKXBXrMWjP8u02mBT3rP5mnSFXTwJ
	842I2E5gc41C0AJoyVAFiZjBAaBHkl9L0/ZJY6vVbBTcGfmigPEPGeoXxDElJqqV
X-Gm-Gg: AZFdTZeX5fXD4LiAc12Hw3W/rxFU9GxRcD206AAA6BzvGQhb8V4P/X0Ue8X/SiLb4Jg
	6jYJT4QiAspBQpQBun2fsDD3wt4RMig3lCUFQ+0g1K2sJIWuE6BthsR40l81oReBLo5Sj0eKHZ2
	puRuh71gWuzDGJAGlKkTdI098YLXsguC7MfLZPDNoTp5YWE8mMsRBcRm31HaC7wx62nwArH0C+O
	F5YfrsKX1w4TYc7f7kf1YrWqm/IZ5sBK6x8eu6Ixyfq67BKzqfZ7eJXQQzkM2TRy6NanpMgDbw3
	Sy4X67e4T6TTNcEuipizg8FZr5AH5Ooyg86wJXmaFD3QuqZ8U4u7T6ey/S60kbBGoCq83nh6b/v
	0doB1Hf40heOqj7Snwm6vc1FBGyq/24zoSpxHlTJt/HLZ95Qpo9fqTZAcA7cfMebcZn0KqIhJSC
	Dw2/mJ3jF4Wai4eOlDuvSA1s0LJGuKYMPlbWRFnlzfDpQGTvp+r/CGFv6rTZlbPRCIH3+oEWuTg
	1yupkbZrY7qISMj1B5XKMGZVg/GhF8zDhM678CPh+0wowkgdm0r0oZqiidcBKyJtGoFlo1d9XcG
	wntm/Snf4axetz0g7qtRMTiMcHxyzvFtetfoBPh2GyM8AA6JO+tsddHvSJENQW1BvAfDw/0cKi2
	BNEmgE7YVwjOmhuJhAS0NxHLEAWim+oPXOJuEODPKSJklHjynCLxqHj1zwKNrx9Fc5SwiYJzIGF
	oKHEItHdpsTmm4VW0H6k0FV/55KMY5uFHcuQaw3plLa4vrnXjqbDiuv4q1gM9r3ev4+YNhcm/Ee
	HoL+V5NN++Q2SEaR2mUxdMi88+2lvJl8unIo/dDVdFHf0OeIqUnp2kuNEclz/YkWMtG7cmQ7+um
	fCGU
X-Received: by 2002:a05:7022:c84:b0:15d:fb47:4268 with SMTP id a92af1059eb24-1b5568c9b56mr21889635c88.21.1795753069134;
        Thu, 26 Nov 2026 20:17:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 28/35] ncp: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:08 -0800
Message-ID: <20261127041715.1776485-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133280
Content-Type: text/plain; charset="utf-8"

http://dl.fefe.de/ has no directory listing (404), so nothing was found.
Check the ncp home page, which links the current tarball.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index 19fb258aec..2b15693ce7 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -11,6 +11,9 @@ SRC_URI = "http://dl.fefe.de/${BP}.tar.bz2"
 SRC_URI[md5sum] = "421c4855bd3148b7d0a4342942b4bf13"
 SRC_URI[sha256sum] = "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0bb095a73c24b9359b88"
 
+UPSTREAM_CHECK_URI = "http://www.fefe.de/ncp/"
+UPSTREAM_CHECK_REGEX = "ncp-(?P<pver>\d+(\.\d+)+)\.tar\.bz2"
+
 EXTRA_OEMAKE = "\
     DIET= \
     DEBUG=nostrip \
