Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31A7D6ACF5
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 12:34:54 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40895.1766061289798389826
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 04:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BwsHuTUN;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso8894165e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 04:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766061288; x=1766666088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdjJzeGMTUrX1bpBp2v0vyC9W3Y9Mxj4g+/vG8mVLB0=;
        b=BwsHuTUN0w0nj7zAMU4TvV6XRrQPhGCOXah9xnoEiyC1trP5RZTC4MdcFT1pq9lTge
         Em6P+McNO9benCmKdibZv8qNQ8qPgm+mW+mpF/2atdYT0b0W+kBPctu2KolRz8fwqcC2
         3gSlg4YfS+2/g2squNCZ55q9qY4JkmJUVkIu/6TaUX1+C2kaM2khSiX8+Lc1qrSLV3n0
         8WUj+QT/K41tj4q3ikHjuF0rUiLdwlfw/ujQnztyxisxqZgYeoRpHJpLt6GDuEkEkwFF
         sXwj1mQ/LjBxVFokYw9G94rx7fs2UlsbfCIy6ig0QUP53zn/AtjcGDQC0m8kZue+MWHk
         hz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061288; x=1766666088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KdjJzeGMTUrX1bpBp2v0vyC9W3Y9Mxj4g+/vG8mVLB0=;
        b=l0/s/zvisDYyjGHslkkx+ORz52SS+z7FGghHbn/9M/5hTiNKqfoqidNIriJNFG+y2g
         QLceuVJc3M24HtQuFvPEXJcqus5/ue8i3UM4U+uGeFWqgnTgZppPGVkkpCsKdte4nR6B
         MhLgoJl13oN0UekwNRhEHdJi41powGT4yaMwhZa9bX1IJ/KfWachB2K7S2BQqMkIutyV
         jTc1fDw06N5za5/7Ldc7OTob3SJiHg5nZphTBuMFLM4y/Ed1ae8U/ecQlBz0GgdL09yW
         +BkhSWfOi4Kgv+0jDrLZJD3PVJmOrnfhNtAYYkPoYTKNmdrSOaDUfBtz5wIQh2URyWPy
         sPtA==
X-Gm-Message-State: AOJu0YykvSounKJaXQHf6Lwcpc0WBhIhUr1+HzlrOffdLZ3DI6AdjSvH
	WhpA9ybKDBXrlTuYlX+O1BMnaN/Xr1zfxzl5C+vvbEmkKJ0ChwtBryYi8JztEQ==
X-Gm-Gg: AY/fxX7nBmFflhs4J+/AvObZZewaEmzSVY9OBoJGhNyI738vRtSJBoIvsVMLtDhsrGR
	shsURoRGiNN+JTnDNPYsWhWxaGSH6x/Dv86Yf42PepR422yxQ4ljfrzzK4j48aMIcvyZ4szqo8s
	Ow2gNkSKM5nK+IlEs8N8POXZ4cTu7NlTXWlpHAXBgiUZPmZRRNyOpDB8g6TgNregvKDS0qLMacO
	s1KegQJ5OwAhCm1DN+3ZRDxRrFnVTbUBuv9U96OCdfJfgIvHJcn2ynUr/+xiH4EHdHdjxe3G43C
	7A69au+6HCOBuTbPmaDRztLIN3j6EHmcZaePyfgm6dUhB78PPvml/fJBBTL2lpDwuHWrdeqDqRY
	BqhPv86hc65MZ2T7i7sREYuHn+F+ZWx47RmtMVmwoSdpnEi1y/7UaCSB6235BqNWKAvQAotzSLi
	ugrVSD2u9t
X-Google-Smtp-Source: AGHT+IGPIEBicDfNGHQQfbQdXi0KPoxOVv5NH7BnbZXkvDmSSLa8lqAF8fMg9qcWwZILZHfrC2gMCg==
X-Received: by 2002:a05:600c:3b03:b0:477:9d88:2da6 with SMTP id 5b1f17b1804b1-47be2923797mr24622515e9.0.1766061288104;
        Thu, 18 Dec 2025 04:34:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a3ec73sm12679035e9.5.2025.12.18.04.34.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:34:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][kirkstone][PATCH 2/4] xfce4-panel: upgrade 4.16.3 -> 4.16.6
Date: Thu, 18 Dec 2025 13:34:44 +0100
Message-ID: <20251218123446.3489941-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218123446.3489941-1-skandigraun@gmail.com>
References: <20251218123446.3489941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 12:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122761

Contains translation updates and assorted bugfixes.

Changelog:
https://gitlab.xfce.org/xfce/xfce4-panel/-/blob/xfce-4.16/NEWS

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{xfce4-panel_4.16.3.bb => xfce4-panel_4.16.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.3.bb => xfce4-panel_4.16.6.bb} (94%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.6.bb
similarity index 94%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.6.bb
index b9201bc655..a11bb118ab 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.6.bb
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xd
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "5934eaed8a76da52c29b734ccd79600255420333dd6ebd8fd9f066379af1e092"
+SRC_URI[sha256sum] = "ce942fc9d716777c81fa45da428fb6cdbf1417f200c656fd621ea35425b96fe3"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \

