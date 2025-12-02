Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75065D1266F
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 20:44:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3362.1764708250479029074
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 12:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIOduRL6;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so68279635e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 12:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764708249; x=1765313049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pv4XZNeYY8Eg+lMfcfqh28u3w9T6ujFcVx6PJ1orIPk=;
        b=WIOduRL6YZr0o4f3fwVluxYpJjGVeIwYEfAaBHqgmB72gPtPBUU1yHlHOhKJWYnLAx
         M1ASblztf0ngVKKIfUjrDRnKAG7vMgMdN+GcvMn/vWBcnCeoPo27vuEDw0CKynAwk+bv
         ip4VI66HeyVSsO3yeNOaMiSgLKrVTWQsEAbsSukk0SxyF6SVcgKeL02161NFhfJhRC0p
         UPrsPLgKShJDI8/MQTgEV3U7eO1ALUzm4cBIJUjlRrBETFFfeU5w1KuzC+hga4P/Eaav
         Yxh4Z2ed6Ig9hqlDyw9cv1mlklQC3UDIrmP3dCVBq4gdhQ8cu1rVsFwZwf9WA+SkkFvc
         QuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764708249; x=1765313049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pv4XZNeYY8Eg+lMfcfqh28u3w9T6ujFcVx6PJ1orIPk=;
        b=NT1Ydafy57njd3zk+96aTP1Sel+S2hpkGcAUzf29hK0tG/dyGxClhf6sxOBcxmgRSe
         5Y/lajICl+a4K5KhYpT2Eh7/Vaua0O5sglOkcuSpD5bjmqpWzJHK3JncgcIweL9bIO27
         TUvSznxlvJ/LrhlACW9mFo/bLI056fo5AWFlTIwYBaM0Oc5gYycgNRM/L1iV9fIKoM8/
         qrLgWD6IAOptLu69D3iVYX1Br/IBOkceiv24L3lT+vy9T4XjGrh/SM36bUUYhAFDafw/
         pt5Hxg4amFphKo07tqC8ANVsC2vKO16ht3vtM4AuB7UyVMgKLA9RwYKwpwKIBqQ6QkoY
         J1Cg==
X-Gm-Message-State: AOJu0YyhBpaZAlUfo5wg3rP0b8gYmz3yDaeKQeZMy4rjUPULdLRBbKWJ
	B7xks468fzVlPWPu+Art4IXzlLAmReESety3x9E3KJcy+Ze0PglG9NeP25Lkmg==
X-Gm-Gg: ASbGnctE1gqTEfFKJ1lQHjWRi2szpVI1VOfB4z4/zIfB0hzajZ85g/jSJyxKImkP+hT
	mn6fliDS5nUfJEqshhTs+lmq/V1twUQyVanWwWgr7WSAW0bx1Jb16iODl79Sb+RRSUAa3kLEHsW
	Kg0FxhLdQDNLeH4SbypIxzthDTaQ/rhlMqH7+MQgZ/GXIEgBMU4IKXpQEWRAGML37icUjijtLrD
	RxJ2Ei+EmueNeudlNGujOaTu3g7uaICpl6o6iKNueF+4omTet3TthLwhf7OnDeAdpAhWEEuGqga
	m8axbCgJ9G2I7Xw4ixHaK0b99jjF29Zhkf/NGFefivQJcoT9Icaptnsr2X10q7e+lxGSSprE5xZ
	Go8GZI2o1MMnj0FFx3buWlWOID+YY5JBp9rK/DyI18A2KPehaEuUVPNLrufHlZKIZPXYG8/eZgN
	7feR0ByvSX
X-Google-Smtp-Source: AGHT+IFbQ5P15gZWtplR1qpMaR3XaJ9ExJAl50hY/BdSRVmMkaXtoVcOTqAVV2qENHT0nmMktUSgKg==
X-Received: by 2002:a05:600c:1f8f:b0:477:9e8f:dae8 with SMTP id 5b1f17b1804b1-4792ae635cdmr265845e9.0.1764708248366;
        Tue, 02 Dec 2025 12:44:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7971c7sm8383295e9.2.2025.12.02.12.44.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:44:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/6] gssdp: upgrade 1.6.3 -> 1.6.4
Date: Tue,  2 Dec 2025 21:44:02 +0100
Message-ID: <20251202204407.3755450-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 20:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122266

Drop patch that was incorporated in this release.

Shortlog (without CI-changes):
client: Format Since/Deprecated versions in a way gi-docgen can parse
Fix template to use local mirror
gssdp-enums.c.template: use basename instead of filename
resource-browser: Make regex pattern static

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...mplate-use-basename-instead-of-filen.patch | 32 -------------------
 .../gupnp/{gssdp_1.6.3.bb => gssdp_1.6.4.bb}  |  5 +--
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.6.3.bb => gssdp_1.6.4.bb} (82%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch b/meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch
deleted file mode 100644
index 63126520e9..0000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 78270f9159a9ec7284ca39a2fbb1774347942de1 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Wed, 24 Apr 2024 19:08:43 +0200
-Subject: [PATCH] gssdp-enums.c.template: use basename instead of filename
-
-This would prevent the build path from leaking into the source code.
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gssdp/-/merge_requests/13]
----
- libgssdp/gssdp-enums.c.template | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libgssdp/gssdp-enums.c.template b/libgssdp/gssdp-enums.c.template
-index 600d426..2dfb859 100644
---- a/libgssdp/gssdp-enums.c.template
-+++ b/libgssdp/gssdp-enums.c.template
-@@ -3,8 +3,8 @@
- 
- /*** END file-header ***/
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
--#include "@filename@"
-+/* enumerations from "@basename@" */
-+#include "@basename@"
- /*** END file-production ***/
- /*** BEGIN value-header ***/
- GType
--- 
-2.44.0
-
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
similarity index 82%
rename from meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
index e6ea472709..b601037608 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
@@ -6,10 +6,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/gssdp/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI:append = " file://0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch"
-SRC_URI[archive.sha256sum] = "2fedb5afdb22cf14d5498a39a773ca89788a250fcf70118783df821e1f3f3446"
-
-GTKDOC_MESON_OPTION = 'gtk_doc'
+SRC_URI[archive.sha256sum] = "ff97fdfb7f561d3e6813b4f6a2145259e7c2eff43cc0e63f3fd031d0b6266032"
 
 DEPENDS = " \
     glib-2.0 \

