Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16776F4385E
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 17:12:16 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.339.1776273135705379917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 10:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BqXQ8+Ln;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2d891442388so6376836eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776273135; x=1776877935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvxfO2sY8uCYFhfA4kR3LyAUWEf6A2FhvK/PUzhNJOY=;
        b=BqXQ8+Ln8NHQlt+nRC/cRjmQIRDCrQo5iGPw6RxBuLa0nWxUueZw49Q0tEqBDtzrWT
         LKcN+cN0JrcNKiQcoq/Apiq92Oev9GdHaRxKSdoYEbdZ37rs1K2mjxUhanYyONXMDhbI
         Qbd4Smg1X7z9/ZHurQQgFTHNAwpqWaeykAE7104jwMyVCxtfrf4rLDJkyM5G6LI0TZcO
         C7tkST2npzqddwx6TAGJDki9oYNaOxOrfjnI5TD/VmtiSKmYoXBFUCgq+bdHhOCZ+2/d
         Ix4nNSAp+WxeNXy2o+NzqZZCxCxWPhzeG1GRNO/lX9+RuLRCDS0KQsURjQtT2fV5mBxH
         3vUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776273135; x=1776877935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hvxfO2sY8uCYFhfA4kR3LyAUWEf6A2FhvK/PUzhNJOY=;
        b=mhexRk9mgU6mbB5Z2kvDmt6tEK0bg0pvpAbo7wPzrv0U+qWU6KYJcjLjbrNMrH2taC
         qIYvs64Y36YgLEPwdliby8fQCLPet0nQsyFYmRfLwgmiZZjPuNyNOBtN9v07yhD5RAWN
         R0rjQJtWzRvO0GhrpUnHTOIDeg0jnt+LUOW5EH2SxPBIbEsBXQDIss6YrhLi+uT8WE9C
         4ckMNZ5lFMzydVJ+qWypgXmCJKovlEqD7nGG0ydu4A5VO71BnTk2ZX9QysuVGhp8xrEK
         yUg/IIY236RFAeo1CKyETLaW5vE4K2emlGgdEJB7i+3Rx3zjYJJ9mBgHcP61UPA1Taua
         /lqA==
X-Gm-Message-State: AOJu0Yx1Vz8yQ396aHKIe7Ox+50XH4WebATZdlPgpPKTN4P5RYXSfr3v
	KFM+zmTRwAj567c9j9gkpkD90BQ9HT/a9Fmp64GEe8qPNoTTGBitSIT1wpiIFg==
X-Gm-Gg: AeBDiesRN4p6lOTB4awORe1bp7XDr2L5GEw9pU0Z8x11iucu1I2iaK+R++QQAFouWHo
	i3VYF/ZujYGmjPhtiMJutgvR4ZphqnW8S7hfKbcdPT9EMNqjj52vbUv4nLPX6xLabo3kHEI5cI1
	0gLb8ImJCnDb7b/D771iYfUzD3xprMD1gqqSYOAB6QGWRCdDiqsK0H1BKEVjdPVehvfdB1d7iZ1
	wD/ho2wK0d9uRuXJjJVfW8EEZL8X+iyFTs/PqnHlw/CmilVdPCi+CduADwloOhTPvSK8K/jsbNA
	19DnAAn1Q/8H3jcWgp0T52d/tD/8W9HJ3j9xVtJARAgv3CRzqA899UyyVBxltGpj1R+L5dzaRW5
	rZEXhILYZvSjk9/TLioaS60g6Iv4zy0hJx1cD7m2wPgfDm9YoXMQeIiy4Qh4i4rxWHpHzi1LTRt
	QrBcUobQ2hz8nPfdLh1QOK5HPrcxg+Sm6QY8AwHHZNXwIzzsgpqG/ZcToJYOb3AC5LAA3erl8w4
	4UnUjd+sjXdTTb5s9JTBCZDb3mVxrmMZeBorvC40Uix23Y1wWbpxe71huBkXcZP/uyUvDtHKoB6
	S0/jj6OmEhsdOGmAp0cy4GtnXod+eNJWqtFLt1IadAmyis3CXYU=
X-Received: by 2002:a05:7301:e0a:b0:2c7:287:6740 with SMTP id 5a478bee46e88-2d58aa831d2mr15826232eec.28.1776273134649;
        Wed, 15 Apr 2026 10:12:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606222sm4329527eec.8.2026.04.15.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:12:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] libcanberra: Upgrade to 0.30-20
Date: Wed, 15 Apr 2026 10:12:09 -0700
Message-ID: <20260415171209.1502882-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415171209.1502882-1-khem.raj@oss.qualcomm.com>
References: <20260415171209.1502882-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 17:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126365

* Revert "Disable tdb feature on loong64 for bootstrapping"

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libcanberra_0.30-19.bb => libcanberra_0.30-20.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libcanberra/{libcanberra_0.30-19.bb => libcanberra_0.30-20.bb} (97%)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb
similarity index 97%
rename from meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
rename to meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb
index 1f1c23d041..2f10a10931 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-20.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
     git://salsa.debian.org/gnome-team/libcanberra;protocol=https;branch=debian/latest;tag=debian/${PV} \
     file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch \
 "
-SRCREV = "d1ed1ac0c9950ed3908c04abb7c4a6de5c51ed94"
+SRCREV = "47d67f43c58af36143060888fc8e69a9cb0eddea"

 EXTRA_OECONF = "\
     --enable-null \

