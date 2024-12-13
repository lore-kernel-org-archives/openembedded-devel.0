Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F52E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 06:23:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.9899.1734070990921066874
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 22:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=an0I1ko7;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e87b25f0so1617971f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 22:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734070989; x=1734675789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yW79wb4bvcUua2o7OihLMccP6SWp2jktDv+oz2LvYjs=;
        b=an0I1ko7GKim7h+yFEJkXECy/CwFw5qLOPdWb8ZRQLAQ5WNJy18lMuf+ZWLGzGqImc
         3kKXeqZxLvk0Ptsn/GgYVSR5QG2MOTC/hX4izK8WOIrafb2ZyFghqPz1nsLamqxz89FA
         nEx4fALB1ds63t67GbjazwsVTLcwwPGo4ix4MkqiF0g5LoT4+Np8YUTqE8bzequJjozz
         a76fd5XqxEh0E5SiS5KVJQdiTX8Dpt2qhK1VnQFSmsJhSJzD3+DJn6kjiwePHU7RYzVv
         oyAq89wzNQshTHDmMTGy50+YehQDyvIrDeRhuXsiAFKaRxwmieuV8XfTqxsxFCz3z+5G
         bzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734070989; x=1734675789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yW79wb4bvcUua2o7OihLMccP6SWp2jktDv+oz2LvYjs=;
        b=e7FccxE4vJ6RnSU9Z27R0oN5q/lZ+FuhX4XUH9VsGKDapROfbwaRVpdhbX7UfgW/kh
         5t0JvhTyf7ygPUkOkld+vZJwg6APhduG+yCxsoLe14LG329wRQPJk/sq3uygsLm5OksL
         x9XCjsU9uhXUCBrA016L+5CYNhaSg0fU9YC+IkoEwc5h3dpiUVDnANsrMdliBtqRxF21
         loB77PRZ7sB3IEDUSkd2ViGAeZ6c+w1JfJJxPRQtS5NeMu/XFA9Cuz99K6UfIwbqsXvR
         r0micsabLIcnasIxWg5oGQHeq9DwMVKwragBEBHDVly+r5Lq9d1HaH53gWH4NcsNQr2p
         xWEw==
X-Gm-Message-State: AOJu0YxGmdTt+6H8P1QKdRncl6DgwmDk6YeQQI5mEETVlQCL3Fa8Mj9t
	/mb+5sxwYt6Mn2+7RIFCbQH1MtDYmdKnrdCQ1Ng0v76hj4bu4wsgIbwIGw==
X-Gm-Gg: ASbGncu2Kp/RQ6Al6gTr4ttaZ4eETh7e6vpA9aSJnhzl9QO74OPNvP6acnkm9PJ11pE
	2nGpKipj9XMMBq0WaOXaO5u3X7tH0XWewajHlNGB9R2J99vaGB5izYA1br35g1ukr2RwaguF8o8
	LM/JqmGJCc8Lmd4XzbGewQfgmh6hywrKdm+9MTvPkAaLzYd0v4pzbSA0Y20QL/4fmtDh37zLCux
	sK2hqIKvWK1zcM7BW6VJr3M3nbTvhsD6uCyVSlOAydYu/hxw7wde/jlph6oHewKtkES/NhbGEh6
	pNpc+6E=
X-Google-Smtp-Source: AGHT+IEgrbT2KC+h8nHpY7su+by0g8vHAhnqb9haccjaYG1ta8mBgdi61HBuZZ70+gMD9hx+C8mGjg==
X-Received: by 2002:a05:6000:156e:b0:385:e328:8908 with SMTP id ffacd0b85a97d-388c3a922c7mr631740f8f.29.1734070988345;
        Thu, 12 Dec 2024 22:23:08 -0800 (PST)
Received: from Unimatrix04-Jammy.. ([2a02:b023:8013:daf:2821:856c:5fe8:6e67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4a31sm6065072f8f.30.2024.12.12.22.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 22:23:06 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.22 -> 7.1.4
Date: Fri, 13 Dec 2024 07:23:03 +0100
Message-Id: <20241213062303.1659394-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 06:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114308

From: Gianfranco Costamagna <locutusofborg@debian.org>

Also enable arm64 support

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_7.0.22.bb => vboxguestdrivers_7.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.22.bb => vboxguestdrivers_7.1.4.bb} (96%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
similarity index 96%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.22.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
index 74b15aec3..0eed353e0 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.22.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
@@ -7,7 +7,7 @@ DEPENDS = "virtual/kernel"
 
 inherit module kernel-module-split
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm64)"
 
 VBOX_NAME = "VirtualBox-${PV}"
 
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "cf3ddf633ca410f1b087b0722413e83247cda4f14d33323dc122a4a42ff61981"
+SRC_URI[sha256sum] = "872e7a42b41f8558abbf887f1bdc7aac932bb88b2764d07cbce270cab57e3b5e"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.34.1


