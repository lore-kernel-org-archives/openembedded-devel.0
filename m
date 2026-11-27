Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8215.1795739720803272041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=R6cTYulg;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so4103851eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739720; x=1796344520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUk8YzADaZAuhiTfvBEE7BOHGcExbQCZn0O05KSLBl4=;
        b=R6cTYulgCBIWII4DUIuhUZ8cf5yKeaau78fqvkOwA069835XLrSrEw62QDRaBE8fhs
         CjsmZQTACScaL/kVEmWAxDNBnsfys/iWtfhcNOZNvn7QV7EN2JfFtwyksgf4dgJGENPy
         imQfHLHpvcNHf4krQ/cCHE/u65hN8263q54Zw2SdjoG4/RQqDsfzHHj1yW+fIkOy0rYc
         J+5Q70jrlpbYGbt/1Y21eMyq7pZ7sgzGfb9uEadYJ9mMXB7TZIUruBYwKmoqkE/PlceT
         ix+QfNXyopVIsi/lgEkPx37S+Zq1YxGo2y7XgQj/YIpoU3E+0YSGt+Enc8pfWZ5LUPM0
         172Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739720; x=1796344520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dUk8YzADaZAuhiTfvBEE7BOHGcExbQCZn0O05KSLBl4=;
        b=pMtwCznVkBTpGvH8NTu5Yi2o5q9EFtJysQZ5GloX88IwXzeZDmV/O6ZqJuG7WuQXHY
         Cgn1mWj2c4IM1jtVlbI1bMAoLBwPc1uKeiK+35hs/XQL6PUAO/QHTcyH5UkzAUXa7xmf
         IJwjsO5kYNL7UWhli2k5qPdd4qViQBRMzavm4mp75GnViFotq9zdLRkJv3/ZPZgT6E3Q
         ew0kRim67RbkJ44NSoxYRONVKaNqMQsWUeh1AIeOprfydx3ilxRivlbvhhi0tTGzRNo9
         IQlUxNjsgZvy/GCQTdDsv5+WlLvcFjK2r4aNfT3BtRhTqGnBA2PrIbreysEPo04+teYW
         iNdg==
X-Gm-Message-State: APuU4Z+EhG4m7lVbAizQINd68bnZrz4liannvEufESud+QtYaKRXvuqK
	hMy6/pY0KBfWZ6hlwF3aR0SKCnTaklUXAuPDlf9twWsmwkLEBgjLXOHYKz+1pRSs
X-Gm-Gg: AZFdTZfhUBKb3ItQ95PKpS1dOoXewR255V8pL/ss7SJSRP0GEcuVApFrksOY1osQtwi
	+8vgC86A4U3OZ9yp2pXzriZq/Yws45RGAxjWy/1TNCygIQKCddtdz7fHngZGeDQTX1kQ631znMO
	ZwSAtewTt/XKXJVunQ/KdkVBFS31a6XUWdBMLtKXf9XT9gaLyIyOu6Ux3CEtqrquOnO70tPpoS4
	cKdipEim5L6MqlRQ7xWE81W5GWRaA1okSxdf0uDEG3wo5ImbIkTzjPna3Vy9MfYj3kwOmy5wCDC
	NZRmFOYAAlNQB9/d7jmluTEd4SqbFWMeM6+Ey+g4iYSo8TGxSW1NF/WqVMgz9CF16m/2rvouSNV
	gJ08fqDhe7XoBbhLj+/jM4JIq0xFIJtNbaeoTgltrpHHF+1gDFrGuODl+hwrRkDX8bQMxCh/1i2
	vXtGOQ3oJq6yE8XY10/8+AV2L/briNcq426jz1rzzKZjejz/06n7IJU/v64nyRAMg7JJcfU4J6i
	T4PK4pERFO18kXC0yh+8m0gh5lUydBlksRMhChr0pvxYOLRnoGSExUUQXK2ZHHn5gvgW4Y7s1Ha
	RrkLGSxD9nYI9L6bL7OSJMpkWpgYmWlNSEOkMPs35eab0mZhEjeyGP+EtRZlAJmekFPbip6mNvT
	ZXfmbpMyHBT3jhpaYSVhCmMJqxJGQVxGG7wMqTu928tgWhPP7Wp/M69UGfITmOtceP1rHngB6vW
	dpXKyqH4EOgw1fbQw7WMWs6U225DMDq5SPSwiIAUhOn1qI1RkCo6U2kwGgPxAq3g1+bhtmYzaPu
	6+ZDJ+RbozUBUmoL+2f0S3L3b3uOjnebYBItaG/3Bw0fwo8cs39CLdIeuxXbuoWMnKb9YuhpueZ
	13nl
X-Received: by 2002:a05:7300:d10e:b0:36f:a72d:29f with SMTP id 5a478bee46e88-38570152da4mr24361505eec.34.1795739720156;
        Thu, 26 Nov 2026 16:35:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 48/69] mksh: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:04 -0800
Message-ID: <20261127003425.2166632-49-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133148
Content-Type: text/plain; charset="utf-8"

mirbsd.org does serve a directory listing and the check already found
59c, but UPSTREAM_VERSION_UNKNOWN turned that into KNOWN_BROKEN. Drop it
and only match mksh-R<number><letter>.tgz tarballs.

This replaces the upstream check settings from commit 787d1b73e2
("meta-oe: repair broken recipe upstream version-checks").

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-shells/mksh/mksh_59c.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-shells/mksh/mksh_59c.bb b/meta-oe/recipes-shells/mksh/mksh_59c.bb
index 5c14a9b7c6..271e1cb0c0 100644
--- a/meta-oe/recipes-shells/mksh/mksh_59c.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_59c.bb
@@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=26;md5=6efc2c249328e4d2bd3
 SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/${BPN}/${BPN}-R${PV}.tgz"
 
 SRC_URI[sha256sum] = "77ae1665a337f1c48c61d6b961db3e52119b38e58884d1c89684af31f87bc506"
-# mirbsd.org serves no browsable listing; PV 59c is the current release
-# (matches Debian's mksh_59c). Distinct "RNNx" scheme defeats generic checks.
-UPSTREAM_VERSION_UNKNOWN = "1"
 
-UPSTREAM_CHECK_REGEX = "${BPN}-R(?P<pver>.*)\.tgz"
+UPSTREAM_CHECK_REGEX = "${BPN}-R(?P<pver>\d+[a-z]?)\.tgz"
 
 inherit update-alternatives
 
