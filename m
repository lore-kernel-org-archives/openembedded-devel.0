Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A147ED185DC
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:06 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6693.1767950936283342783
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MjXeQ42R;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0c20ee83dso38542925ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950935; x=1768555735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPyTcFQUTPfVLzxLxZAV684S19HdWRKph8vGkfF7hMI=;
        b=MjXeQ42RHzu7CzfXcFDImoNGxD+eLJ4zrmgL3WS53gFotKLtPvoC2xd24XfdLx8u1H
         fxIgG9CX5VR/iC8+n8v9jyulLYZ6i0j+QFXEgm57v/AjSXvGxJFu3S6iBXbF3orwz1RB
         K3O6RZif/0sf7CIPTn/u6Xln0wcBVjplgwmNoE9Ra+igx2DsWfP8+iGI2fYd4VZWL/Bw
         srHO9o/07y7UXxOuM+PjzcSjrPAI/eeZmj6OkKnVsMWUWNm3VZnJsxO7ROChFDMtUGKa
         blg113PPz2Cjh3xOpPETwFCNaB37/zGq9NBRDFLMQegu5UXcvV0jAKbaFXre8RrtZwb2
         Hzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950935; x=1768555735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NPyTcFQUTPfVLzxLxZAV684S19HdWRKph8vGkfF7hMI=;
        b=t3g8BbVZ+IBwy27o7oNZXcm4KGLqEToaTD6cupGO7lt0AL1YPeuEy3fjzA1MA4KU/S
         goxgaM+Zs1ir3nNszPaZ4jWsr838wBbmk7IXfcR9vbG/nX/7t0GFnKDi2pK4pHtzMkWI
         nunJLdzwGmE7gQgh0EEGGRkk40Pp9i/yk7tOIId/sFVAT6xEHQQp8OtGevq6vLgvHOlr
         KglLJaZ3s4A6ljFPT+E/TScgVK9cmrB+T8/ECQjqPuRDpr8p/cGwL8RYz8QickrHAdfE
         O8Zik4DJthZkAd/TXW3ilz+7JHEUhkyADZk5gkFOWgNLt32FxRF8mBH2qgNWmztwDWsR
         YWRA==
X-Gm-Message-State: AOJu0Yx2am93EMetqhEom2jxzpqji+xbZuFQm/lL/+O9kOLdCgrx7oGi
	4mlNEnvgQ6b1geO+KQAPAbuhIsTA58qN7NXf1tmwVSfHGFxefNhjNMEhFNM7kA==
X-Gm-Gg: AY/fxX4yasj9rDgtFUi08qGBOEoIcMdyXBdFGEJaskoHLZmNtrjWZVC7Xw46hWOxlDi
	MWmIpsQX904NYK+/BSagFKiPF9Bzp93xDCoQsc66WuZavIn9/VzvnBO7dJjrIRLfmWlVWGZo0aT
	aDrBqbZFmag+FDyyV4ln7y0CkOD+D2gI9kINkrAzqgxGOyj3bHsgYAYgl/k7axO7tQPoysnl6fK
	qPEemaokGngrv10eO9WTCcTvIcCsF8v3h85B4n0RSIWpsGeInxGbD64dwGyAlXZUEhCJ+yEA+0n
	fV3B7qkLvVwHRO1TAUoBcz0FP39hTfV2zVh3MWSKHyxS9LPceFXu0vyw4M3UGpfAGDSisPWOwFC
	06haNJ1a2kDZaJu1pVANgCo44d7PmrUoJqscYh2cjl4LS6tGq3VOdQoLNaeKmzIdtqV9+shb8qk
	BIvJ/g8eZS5kbCJNHvo54Wgp8=
X-Google-Smtp-Source: AGHT+IE8U+Z/rYUncYSz0oUXDdq4aFBiEhF3th301L5oCKfn3nS9UPfPDI9MEkIW7cZoKWq/NUIjeA==
X-Received: by 2002:a17:902:ef0c:b0:2a0:9e9d:e8cf with SMTP id d9443c01a7336-2a3ee4bb973mr93523355ad.57.1767950935319;
        Fri, 09 Jan 2026 01:28:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:28:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 02/12] dante: upgrade 1.4.3 -> 1.4.4
Date: Fri,  9 Jan 2026 22:28:32 +1300
Message-ID: <20260109092843.1924568-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123280

From: Gyorgy Sarvari <skandigraun@gmail.com>

License-Update: copyright year bump

Changelog:
- Fix potential security issue CVE-2024-54662, related to "socksmethod"
  use in client/hostid-rules.
- Add a missing call to setgroups(2).
- Patch to fix compilation with libminiupnp 2.2.8.
- Client connectchild optimizations.
- Client SIGIO handling improvements.
- Various configure/build fixes.
- Updated to support TCP_EXP1 version of TCP hostid format.

https://www.inet.no/dante/announce-1.4.4

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dante/{dante_1.4.3.bb => dante_1.4.4.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/dante/{dante_1.4.3.bb => dante_1.4.4.bb} (90%)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
similarity index 90%
rename from meta-networking/recipes-protocols/dante/dante_1.4.3.bb
rename to meta-networking/recipes-protocols/dante/dante_1.4.4.bb
index 4badff8bbd..3a290d31d6 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
@@ -9,11 +9,11 @@ what could be described as a non-transparent Layer 4 router."
 HOMEPAGE = "http://www.inet.no/dante/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=edd508404db7339042dfc861a3a690ad"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b3a8e7dc09bb720460f28c9d3796afa5"
 
 SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d"
+SRC_URI[sha256sum] = "1973c7732f1f9f0a4c0ccf2c1ce462c7c25060b25643ea90f9b98f53a813faec"
 
 # without --without-gssapi, config.log will contain reference to /usr/lib
 # as a consequence of GSSAPI path being set to /usr by default.

