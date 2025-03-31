Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBAFC36016
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:27 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.3920.1743454877625909564
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DDA4Gmdt;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso8972004a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454876; x=1744059676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEW6UY8COj3SCkWTxAFFJcDTw3XZQtTSMRxJlrGk3e0=;
        b=DDA4Gmdtb+GM+CHtQNpV7Qvze4GqWvke+HTXIHK4w6BB+MBEEosSBWdCOdFl85pEwr
         fXin2FAgybBTaYkoJBtRC94Z8DN56n0vHbFURLV4RD0pyYJCG8DNfteUlRCQjSfsDAgz
         4VGKY/YU+VUX9xBtIeTSLixP4rN5QhhhbuiAqed+ue/hRZbUm/2hCKWBnvuAwzPhHs+l
         8tzOfM/D6WJpS9NqE6kvJZhOzwLMqB1uP4o4YT1C1RF5v/YeFc3d3gpkONQPofZO72p/
         wqtjxN1vJVwqHKj5oCNy+67UrjdWP2oxgbVh59vjv+1NchUg+E2E12mvgv9tc+6/xsX7
         bGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454876; x=1744059676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEW6UY8COj3SCkWTxAFFJcDTw3XZQtTSMRxJlrGk3e0=;
        b=Mv3VV+FOAYPXBq14uQM+ZpNW2aaaNx76Pt5RpriVwrUhbym7hp1cKF0tXBfwpFizyC
         K6btjGKUISuqzqgh3k2M2lxVLZLe8lgl4BJqbYkMpFt919jMrN1hlFuLLoecOU6sKqjP
         vuF2/e9dZ/hKnKU0hdG9a6nxTOK2MYHyt0aR7vm3CGOt1e30SNjtiaC+aLPHNoJ9TXDh
         i8OE3kFO8ev60y9pO8ECkXU7wJx6R8hzj7MEt+M+aTlPnsV4iF+MEVa48v1TiIG2/oL9
         VfbgYKGvGUDY4/EFzJSn8CHakLiDgjLFIn4TyEZzK2KBQrNmoVW4wnKFG2j2E73kJDJE
         Q/iQ==
X-Gm-Message-State: AOJu0YykS6veoqpIIGoYQTrU2ngyNNYA14IgwmrrkiSeQo2KALMlfwLH
	8cYYjj+iUBsLBVKnpX7Kr2I63EVz/WEyXNGLCky0bUxP1O4JAcgEE0TbkYxw
X-Gm-Gg: ASbGncvWglaX7tVOzHx9Z9RMycb2tfPenLuDjp/00YG8bk/+08HY2KfxVaA8Kpw6MFe
	wCn8VPFyHElXtlYOqtzsKYiqChtHejWt7OjuT6gqLiFe5Fz3lQ5IcErOximmzu9qDTLDGjcGIAy
	fxTBeJ/QVDnb73/S7VEkRxj3a2ekrFKtYubq7bVT5TQ2Kz3XivkLR1jviZ33S9m3GK8F8wnsY7B
	9GxaU24GTzF34luq0DrMTi2YrBN4Pzm03d70GzYCp38uTkLdt3W311c0aBETvpNg6WM3IHNh7xY
	NYPAB+aeAxVXd6vl1syJGJNrGcPwg448Pd+IrCcMIHHwO/g=
X-Google-Smtp-Source: AGHT+IGP05o8ReDE7eW4p1LfI/PSXgBSmDQHNlB3dV2JUS2MdB0EDGuu3K/DKy0oMyp9G5wxaaQq+g==
X-Received: by 2002:a17:906:bc55:b0:ac7:3916:327c with SMTP id a640c23a62f3a-ac73916336fmr817204566b.59.1743454875890;
        Mon, 31 Mar 2025 14:01:15 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71922c0c5sm673024166b.9.2025.03.31.14.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:15 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 04/21] botan: Make it reproducible
Date: Mon, 31 Mar 2025 23:00:44 +0200
Message-ID: <20250331210101.3460858-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116440

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/botan/botan_3.2.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
index 5eff2d383e..1fdda65a05 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
@@ -18,8 +18,8 @@ CPU:armv7ve = "armv7"
 
 do_configure() {
 	python3 ${S}/configure.py \
-	--prefix="${D}${exec_prefix}" \
-	--libdir="${D}${libdir}" \
+	--prefix="${exec_prefix}" \
+	--libdir="${libdir}" \
 	--cpu="${CPU}" \
 	--cc-bin="${CXX}" \
 	--cxxflags="${CXXFLAGS}" \
@@ -39,8 +39,8 @@ do_compile() {
 	oe_runmake
 }
 do_install() {
-	oe_runmake install
-	sed -i -e "s|${D}||g" ${D}${libdir}/pkgconfig/botan-3.pc
+	oe_runmake DESTDIR=${D} install
+	sed -i -e 's|${WORKDIR}|<scrubbed>|g' ${D}${includedir}/botan-3/botan/build.h
 }
 
 PACKAGES += "${PN}-python3"

