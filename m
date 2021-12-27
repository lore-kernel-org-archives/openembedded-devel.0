Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4E8C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 20:38:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.30755.1640637493649275308
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 12:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MXVuBh3h;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so15281461pjp.0;
        Mon, 27 Dec 2021 12:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HsseyYOU+qV18HmhJPzqd/AZ0vi8gGCbkk+PCrKmD4E=;
        b=MXVuBh3hJ4Z9SUdUp1/5kYW7IFMfIHnpNUd2/Z8r2MtKjILPO71Fv0Tuyydr0QGElF
         jxEzMYE09LOr83qQV7QOkqZZYrJoRFjGpbh8zrJn2CCPkivH8KJr+JJL57U14KWpT680
         JzpTudnT5Cy3PfMdGOaUIlVh3FFSUphFAEFaqctevVZhGCJ1CGIpSfeOJPY2/UAJAyB2
         UhX+dJ8umEs0Hx098fT0ITQ0EgoYCZJG0oDBRUtk8Judq/ZuKBirV6BYePkG2n/BAu6i
         cGKnACz8+evyRsKLLghcnXgeioZ2XiQ7Sd0tuk5kXEboRFhm03nsevE91kq5OEuLDUCE
         2mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HsseyYOU+qV18HmhJPzqd/AZ0vi8gGCbkk+PCrKmD4E=;
        b=l/A6XVH92525Q0i1dnzft4fTl6uaNJPuqtno/fuU/CAdlI9Tr997GIF+86MUf1gd1N
         FCWyTZxqyL9JI2N3N3Be7iTffPh5ZGxlwQGRGj0gT9dHjULXEdFfHg9IO+6kivaiEWV7
         vYcb1shhzylcetJuT9ojHkuq9Zj6zwfKEeh1EHJvr3vyPcQUoRK6XcEpRarJ5ClJXbP2
         Bo9VBiULcPqmVCl0TSyZmBv2FEKU5CK7yq9TsS78rhFGLneZnKKcT+lvpJ1VY8hzowa2
         lfVCP+cl0mhflrG/nKmn3VerHBHv7ZjBwFuk+2tJNgKwlgbsqKUkQyQsOkpHVpaileNF
         pjIg==
X-Gm-Message-State: AOAM5302Vo6VnBsWZLoxD4Zn8fUw4hKIfZ7P/9D4eVle3tXqyOENClwF
	qOee1Yoq6dMooGNDQDHjX0UAPjddPNg=
X-Google-Smtp-Source: 
 ABdhPJwJpNLtzSnkK4MzIzAzwWoMK41j32f2jn4cbVYSLGihS3eGBrCKO3CoJm71t4TW5T3CILxgGg==
X-Received: by 2002:a17:902:b414:b0:142:431f:3d1c with SMTP id
 x20-20020a170902b41400b00142431f3d1cmr18489488plr.32.1640637492713;
        Mon, 27 Dec 2021 12:38:12 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:67e3:bc71:b585:c820])
        by smtp.gmail.com with ESMTPSA id
 br24sm19962896pjb.40.2021.12.27.12.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 12:38:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Armin Kuster via lists.openembedded.org"
 <akuster808=gmail.com@lists.openembedded.org>
Subject: [meta-networking][v2][PATCH 1/4] strongswan: provide PACKAGECONFIG
 for cureve25519
Date: Mon, 27 Dec 2021 12:38:08 -0800
Message-Id: <20211227203811.481782-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 20:38:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94517

From: "Armin Kuster via lists.openembedded.org" <akuster808=gmail.com@lists.openembedded.org>

Not everyone wants this to be installed by default. Enable to remove
cureve25519 is someone wants to.

Signed-off-by: Armin Kuster <akuster808@gmail.com>

---
v2]
Fix typo
---
 .../recipes-support/strongswan/strongswan_5.9.4.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index 45500df01..124b5a799 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl \
+PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl curve25519\
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
@@ -41,6 +41,7 @@ PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-sou
 PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
 PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
 PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
+PACKAGECONFIG[curve25519] = "--enable-curve25519,--disable-curve25519,, ${PN}-plugin-curve25519"
 
 # requires swanctl
 PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
@@ -130,7 +131,6 @@ RDEPENDS:${PN} += "\
     ${PN}-plugin-x509 \
     ${PN}-plugin-xauth-generic \
     ${PN}-plugin-xcbc \
-    ${PN}-plugin-curve25519 \
     "
 
 RPROVIDES:${PN} += "${PN}-systemd"
-- 
2.25.1


