Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3FDD36133
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.27874.1730831930095800205
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DC+PgNYx;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e29327636f3so5045202276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831929; x=1731436729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW76DJFbnxonARnSz7zWBJyI0/giD9Ny4oNHDPRswbs=;
        b=DC+PgNYxM5bv6AoTbpwoCnc2CDfyW5voZTk7NpyZwlCnz82BZLLxKgduzpeOOnyTpi
         /sxyb1xJQtzEDGh66aJAsoIJExoPEZnGlGY9gF3KyN3p15iIAUsRpMXb6pw2SrfSULKa
         1/cygfND+yzVspY0+oL9GNpWmLdni/92g4ZtsvUgKRsuUdwvgGym4/No1KslyewiC4pY
         nC/p0Nel06j+fwhCx+ADmPf5Qx2b7hOq3EzIpRuRBbFp7LSR713O5oFo5kp/yXazbnLG
         yGI4fAYPLA+aNTotNWGotl+xzAxXjnkNTlriTRum0667oDDDBD7oIJ4pe9voWxtSSgTt
         j3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831929; x=1731436729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qW76DJFbnxonARnSz7zWBJyI0/giD9Ny4oNHDPRswbs=;
        b=berukJ8kcCfpAvyZtTsAAxmbbhY6XtfuOXKUHRSAVWzwWFrTrR8iqbzN35DKW0fPp7
         91FmWezEnMYkkqpjEJfXiQ7id6jl+4r+mHto6JzeZXLbNG3JboMT7/gOJp3VK8uyMb4j
         S/+UgAwagZAvyAiqakWu44r0QQ4zYQyvgxNROpkSXq6QPhZ6yUp019jOo77umBz5HVb4
         LU1rCPlSY8BvAd7OWqUHK/bPOwpJYW+ONOwr4k0HwRgZqPLg+VrJZbhmWiRTxFzsATkB
         yyatoMcF3S28pKHswmMxIuRZQH/jtrlkSCklOGUeUZiIytEyF0Fle+6br7XH2R0GZjej
         6Fxg==
X-Gm-Message-State: AOJu0YyIxToKKF4W+KySztdNh+56i9urew6KWxzA0qhxji1Hvs2aFpxI
	1VLnMtkXiCGNoas9SPQMZiovdIrVu4oo7IdXrv0pXtBFMzaIOdCA+wXZ5zwt
X-Google-Smtp-Source: AGHT+IGD1Zxel6HmBc4HaL35eHLEYsB0W17/A3Vb9qSU1JCkffMjRV0suqlATxIMW44Kb44/gPSCFA==
X-Received: by 2002:a05:690c:6811:b0:683:37a8:cd77 with SMTP id 00721157ae682-6ea64bdd705mr179527247b3.29.1730831928869;
        Tue, 05 Nov 2024 10:38:48 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:48 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 062/161] sigrok-cli: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:38 -0500
Message-ID: <20241105183658.34982-64-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113577

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb
index 48f96cc43..f9da51fe6 100644
--- a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb
+++ b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.2.bb
@@ -13,7 +13,6 @@ PACKAGECONFIG ??= "decode"
 inherit autotools pkgconfig mime-xdg
 
 SRC_URI = "http://sigrok.org/download/source/sigrok-cli/sigrok-cli-${PV}.tar.gz"
-SRC_URI[md5sum] = "856fd496cd99d1091aa128405c522a36"
 SRC_URI[sha256sum] = "71d0443f36897bf565732dec206830dbea0f2789b6601cf10536b286d1140ab8"
 
 FILES:${PN} += "${datadir}/icons/hicolor"
-- 
2.43.0


