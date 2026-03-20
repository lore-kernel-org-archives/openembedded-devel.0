Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B48A108B8ED
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:23:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9510.1774002188445492871
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 03:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dH1w5o3D;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so4193375e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 03:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774002187; x=1774606987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVBVL8yGa95fpPU/PxEqVF77479Po3TE9HRYgTFEsLw=;
        b=dH1w5o3DxZ8NiNYyGocyAD+/AQYMyNafmDOzGy9XbknD/AeeT3cMdc9bjxfFj/fRY+
         pb0G8/xnQVw9uBaUoHHO8jicCarrNWziJIltoaUoJYTyYpA6HPg1vXhWnSUL22038DQN
         i0Y3SStChH2pAIDOs9VoD4CATh6MnniFQFFktWARzxlcyzxAllcQPGSxqhsCcmtQSmpC
         IkLsoM2PfLoEkOZeXfD59QTrCPBgO25O5tp5+ysyzLTFqWaeCJokRcBhjj4TFp9+9f+q
         fALYR7PAIJfMG3p3nCjwZzRtnsPBF+eIQdlqqI27F0PZQ7QOo+av9Gd+X8vQ+aDEP2nE
         Rm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774002187; x=1774606987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVBVL8yGa95fpPU/PxEqVF77479Po3TE9HRYgTFEsLw=;
        b=CXLfUTBxL/EWDwK0h6p5N75iROMyQQ8LF2Rc/onY9tVRkZDVZe65JU0PnqsNuhCfhz
         uKnOyrYdCc2qncu33QE20g11K6S3aem2N/Hk92DKLmAlrtfas0wcBDGh5B5kky7p0qr6
         GKM4Ed5p1exg1th/QJMmTfiL3DimqFC4VdtJfjInS1BgDalEfvXn+qKvsVHh6l4fdULa
         wWCjdW2h53jl3aN2lZoBL1P7C8hR6SZgDFvCa78SObq39eJcP5hsalX1GyQopNWwaJXx
         a1bNDN8ohJMnhTEcGmCGsg4m/cApEC9y6kBXc82/ZvickS+XD8HYWgvs5+mk4vncPB1a
         9qdA==
X-Gm-Message-State: AOJu0Yx6OpM09zBz+uWNVGt+z1IVO2jFmPUKMDnFnuBHNfJnNj8V4FPV
	YXBL35Qx9xWf+XrRFtiqji6meQttOtsD61dKzTBau29/wJd/e2a+ahaJ2dIqAQ==
X-Gm-Gg: ATEYQzx/VdPOkgFHNeHkBAapOEENJX0G4DA6T841p2Q4le1m+1HPpb2f58E5455S9o9
	32HCwrQWVk4womf0w/HRcB4quICioboR7OdUsVufNypKxlrGwdy7uzq/oJGj9eQ2c69pmn68M9q
	KqqPrV3xC56HyotmhxIKMMuc1sPNWuE+9YMDPKmNk55hdCzu2cK3THK3kEmVOjW+B0K2GgHvhjl
	cm/baNCj0OpGz7ZaunuH3PQfHtdalTN+E319Tmym11HBPFqyrZHqCu0JkO33EAIqtpRG+yYKvqT
	uO0El0jUlOEe1bB3D5MT2ZOHgATfDCvS1WHgW8mLG72dNshQ3eLn6Px6/ImS9PempfbOObY6n/z
	pJll5QocTR5TQ5IUcoG8R0vg/OekBSz1EaSZYXFGDnppwzurALZJDb5S9FlOa7UtE0ab1FhWO5F
	I+0TiXGUaeYibGWlzU0Szy
X-Received: by 2002:a05:600c:1c16:b0:485:39d4:2dd9 with SMTP id 5b1f17b1804b1-486ff04fb4cmr41523275e9.33.1774002186401;
        Fri, 20 Mar 2026 03:23:06 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1d8138sm12201725e9.34.2026.03.20.03.23.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:23:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] transmission: upgrade 4.1.0 -> 4.1.1
Date: Fri, 20 Mar 2026 11:23:04 +0100
Message-ID: <20260320102304.2808111-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125432

Also disable running clang-tidy on the code. On one hand the cmake script is trying to run
the target version of it, and on the other hand it is not needed for compiling it,
it is intended for upstream developers.

Changelog: https://github.com/transmission/transmission/releases/tag/4.1.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{transmission_4.1.0.bb => transmission_4.1.1.bb}          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/transmission/{transmission_4.1.0.bb => transmission_4.1.1.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.1.0.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/transmission/transmission_4.1.0.bb
rename to meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
index aed1e2e32a..a4b7856abe 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.1.0.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.1.1.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
 "
 
 # Transmission release 4.1.0
-SRCREV = "272401184f0736e6063f9da90be7d037e907508a"
+SRCREV = "56442e2929cf4e9e20c8604a229e99fbb352190c"
 
 
 inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
@@ -28,6 +28,8 @@ PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'gtk', ''
 PACKAGECONFIG[gtk] = "-DENABLE_GTK=ON,-DENABLE_GTK=OFF,gtk4 gtkmm4,"
 PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd,"
 
+EXTRA_OECMAKE = "-DRUN_CLANG_TIDY=OFF"
+
 # Weak default values for transmission user and group
 # Change them in bbappend if needed
 TRANSMISSION_USER ??= "root"

