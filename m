Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F235FC97F9
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:05 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37634.1774820340354931571
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RXXkAHLy;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b982b0889d8so451358466b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820339; x=1775425139; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWqkq5lDOOMgox1m8D+imuiA0hT6PoGGJ7JgHELY7FE=;
        b=RXXkAHLysZVCdnWFTBp/qZ/3/3S0s/WDfu6Kirt2SgtyrqqaA18aP8Ifz5UxqoTW9m
         i+SWy7Sfd3QRYSkwrk55u4Ibnxwsl6dwPJZoepOVp5hVMhxm0raJczaWXlYj/UaiFqhk
         Yy/12RAtni/0T59rRqHxGNxAZwfD6BD0TD6G4VabuROwXG/vAOBcKfUGsaIQXnLqG4T5
         NLFx0gaByShg4ERZwgPmdkg139FRDkw8Pt2D9uK5CrD6FBmMWudmPWlry5bUCV6Uo0JC
         PdDmEL+H+nmrIqv6rP+mGVl225XJONwWmBGYuwYc39pIr6YR8idjfGFJHYcmIh1TIpcX
         FbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820339; x=1775425139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NWqkq5lDOOMgox1m8D+imuiA0hT6PoGGJ7JgHELY7FE=;
        b=P8G6vsD9BRA6O0lcOD1s2NWafPSMqCkQYi2Wz/j0RdjZjGgSxPl2srD6YSfiU4ZYhE
         bH5SU/Bo6ezUkdgv70fgPhslv97wCD/Mnl9P27T6vxbFjlM5MRVinJhgpgZujoboozFh
         6cDEG4ktiSWpmDT2ocFks/nn3hTlNauScoB5td+xJunyluvnckGJRSIsR1ERtmrPKRi/
         0NIxmCeylwG2LZJ2sUwWwtVoRidtbcgoIHatrp3sO37HA68bHMXBgKoHb96X8lyAFhnp
         i3CmSExtLBgwautn6V38IOjDAHyZ/03d4uQD3bgykGhKzdSnniFAku7YouYFNxRybgts
         sdQg==
X-Gm-Message-State: AOJu0YyZiiHT9aXtyd4ILFCkLvIhIukI0Ch6kc4Lb7NTx297cfdAkddZ
	kzQSsbu6BBOmsbAwtcjDP0O7Aoe1qgzUK1X28XJXvxUjNKAzR13wBmUc
X-Gm-Gg: ATEYQzwnhtAXt81xQtdhOIahMj1sqcqnk+pP8oVlZFjkB6g3TXiU6Rty2YZMNVE1JMx
	XCRi8l4IuFQmhKKMjWMaXqnJGBvnne3M32e0VlcLtor33Vs5M4tNlIThPOsn48TIEaI2EYXbk5V
	jtuMeALW7tNqakYkUVn2mHNeoXHsnDJGNptjs47fWRH8tgw1runCOyiMpk0egL1wngq/9lj1tz1
	ZXy4qws4XJ35sMTvfdYGRrTvc4htThgI1uzgpMIY53OyaymelvKDrknlONERulXCZ3sBwfjO1at
	uf9i6Xxknb8CFbxhIfZWjwIFTLppSl85ifT+LiihpcZ+A6cr7np7GrX0KLnJIcV/kZ2D+rhpoM5
	DPOVpPyrHO8OZE2p2ORRNdvBEQ0Y8+QhxohMHoxY30Z4/H0sCJyAZOtKoGIB8892TCF4JUtaSgW
	H9WxImVmM3LRxrnkgtQHp1ZQU47rXfMfhKesiXU17E5DHJHAWwutI2686hooLh
X-Received: by 2002:a17:907:cc27:b0:b98:1129:52 with SMTP id a640c23a62f3a-b9b509146a3mr449706466b.28.1774820338593;
        Sun, 29 Mar 2026 14:38:58 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:58 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:11 +0200
Subject: [PATCH 10/13] syzkaller: Drop qemu-system-native dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-10-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>, 
 Stefan Wiehler <me@sephalon.net>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125819

Either I am missing something or it isn't needed in the build time and
should maybe be a RRECOMMENDS:${PN}?

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
Cc: Stefan Wiehler <me@sephalon.net>
---
 meta-oe/recipes-test/syzkaller/syzkaller_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
index e35a8a77be..bdd4cf6a40 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -6,8 +6,6 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=5335066555b14d832335aa4660d6c376"
 require ${BPN}-licenses.inc
 
-DEPENDS:class-native += "qemu-system-native"
-
 SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX};branch=master"
 SRCREV = "22ec1469fe8c0ba256de07e8f97fa7b375b522bd"
 require ${BPN}-go-mods.inc
@@ -39,8 +37,6 @@ GOBUILDFLAGS:remove = "-buildmode=pie"
 
 LDFLAGS:append:class-target = "${@bb.utils.contains_any("TC_CXX_RUNTIME", "llvm android", " -lc++", " -lstdc++", d)}"
 
-DEPENDS:class-native += "qemu-system-native"
-
 compile_native() {
     export HOSTOS="${GOHOSTOS}"
     export HOSTARCH="${GOHOSTARCH}"

-- 
2.53.0


