Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75001D2629E
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 20:09:09 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15693.1768939740693362637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 12:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QBY80ga3;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b73193dc8so5480804e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939739; x=1769544539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xzPVO2EJng1AC8allYNiMc2+sBXANAtGHFQkCyVGoE=;
        b=QBY80ga3JjncAVtal6rRyJtTileIJW1tlr1X2YHWCByYHTs9wTQdgz/W70gMy05mji
         aSmsotiTWMuYaF7HvsMb23yexRYJqagKCgHmx0/JUmERlRvAFzQN0ZBlAhN7Ddso3+sj
         Ka6YoWCp6lxX8udQI8OrOUMiP1bT+ziOOgVzXAAcTIP7u/+EsnazmeQjAys67kcD07Hy
         KEU/MXf0fo4pKIspm/T464DxrjY+bcd/LjHn5cW7S7luUbisoUcYdVscbE35tKtBPO3r
         U2slYCfXlKDh2NXM/b1SIHFutB7NnEvIRgY0UZMjE2fSR3BA2toV2dqU9i/ZYA5POFDK
         G+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939739; x=1769544539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xzPVO2EJng1AC8allYNiMc2+sBXANAtGHFQkCyVGoE=;
        b=Xe/vasPZwJgdn441HmbGo0/b6UXlQXVgr+pf9lALrw38vj0N7BM1GGnCASUHfr9CUw
         xMMsykAg8sHQY2jMFVJYV5BUIQil97EVbWHTRZBDLjhRwUPgdlWRwsNMDAWCOEXwPayy
         6DRbiDoeIQ3yz9rq7dimNkz0zxP58rSsLX/6/OB0ClboW/00tgxRrm2/g0Sc2woVHdYY
         xGN7AbNkuIboUw+DUfPiJ8TI8v7w23ACB20h6Y1jzN51DuJpgnxtcQ8QZjzybOUi9fjA
         BcAsGfQJ73Hxl5v51ZJv0ollik9WBcrrExW92m5/qQc4kY88IAJ+GanPsAMAI40xVfu2
         2QBA==
X-Gm-Message-State: AOJu0Yw4k1uC2JUMcvxLfcu+HJPLqB8+0YMJtx0n2zZyLXnDS1mSvGld
	SEAGk+KZ9jSu7lcqAahLluWYu+9y9d+iZUamyWAEbzeRJX8lFhQz/jEJPcDR7Q==
X-Gm-Gg: AZuq6aKfURRq6qK2XKI/hDM+5joM8LrMPE890Uu7MhJWjaesRvaW6QP9GOihKbbrge6
	tW3asmxmGSkZZbOgGOyUYUb0LzZuzahy8JKYLVS/B7Gk+13GjbgM5asZgMMQnSvtJVT1YtIHGM8
	ilKr7DvnUlNXqAiNbWdOaeyNLTMFglXfRDXafw7al1PyJFylanQum3jCRyhf/hPZA7kEAp0SKFt
	VMKu1cD7HUZBkqn4I3mZQyGExF3DyQQBblYzhmTSEYwLrx2uzjY0yjegXaMuOqiX36Cqp9OXndt
	Vdy8gj9HscG2REGyxA/tnfjEmYda4TWqsXoRiThVZ/RdFadiyaYLgEnowZWEUjImnLyC+vBqaAQ
	Z1lg8x5H62K15ybwyoKcXBcuJxd5NyMMdbpxGpMUGcmIGB9uXK15AM+noEwgpzS8bK6AbP2uf6E
	lbpj6uOpiFydx7ekIljGccD5B9I2IWx0/o6AxsfTFqT6P6xkPgr7d6o+ypcAQOFYAAcikXUQ==
X-Received: by 2002:a05:6512:1417:b0:59d:cc9d:dc09 with SMTP id 2adb3069b0e04-59dcc9ddcb8mr772164e87.35.1768939738451;
        Tue, 20 Jan 2026 12:08:58 -0800 (PST)
Received: from dt.taila4487.ts.net (x5ab8e2e2.customers.hiper-net.dk. [90.184.226.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm4377522e87.66.2026.01.20.12.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:08:58 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH] glaze: improve recipe
Date: Tue, 20 Jan 2026 21:08:36 +0100
Message-ID: <20260120200835.160520-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 20:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123679

The initial revision was lacking in some aspects. This is a followup to
that

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
index f92777a25f..b11176cb52 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
@@ -1,13 +1,23 @@
-DESCRIPTION = "Extremely fast, in memory, JSON and reflection library for modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
-HOMEPAGE = "https://stephenberry.github.io/glaze/"
+SUMMARY = "Extremely fast, in memory, JSON and reflection library for modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
+HOMEPAGE = "https://github.com/stephenberry/glaze/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
-SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=${PV}"
+SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
 SRCREV = "a4af950700b8af2659f0d4a37a18a1b9c5300593"
 
 inherit cmake
 
-EXTRA_OECMAKE = "-Dglaze_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -Dglaze_ENABLE_FUZZING=OFF"
+EXTRA_OECMAKE = "-Dglaze_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -Dglaze_ENABLE_FUZZING=OFF -Dglaze_DEVELOPER_MODE=OFF"
 
+do_install:append() {
+    install -d ${D}${datadir}/cmake/${BPN}
+    mv -f ${D}${datadir}/${BPN}/*.cmake ${D}${datadir}/cmake/${BPN}
+    rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}
+}
+
+# Glaze is a header-only C++ library, so the main package will be empty.
+ALLOW_EMPTY:${PN} = "1"
+
+BBCLASSEXTEND = "native"
-- 


