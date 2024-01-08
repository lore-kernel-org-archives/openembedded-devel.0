Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADA6C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 17:06:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.2445.1704733568903807242
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 09:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B7fzoreE;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33678156e27so2035303f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 09:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704733567; x=1705338367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bbPAcMGpcSXO8k+T7YEsZWJ+BQTVtWzWLIRcUu974lI=;
        b=B7fzoreEyzhWkJ2Em2YAYjambkz1gUv8rvMaDKMFwHr0TWjreIf0j7pcrKv4g6p2Ua
         j0V2d90laQN2n/4xlCPgV+Dj50CJHM2b0NLZsuW9whCdHNSNJBDtif5wjnBOmyXpbTvL
         t21bvglIHG/btCyR3FEKwC9wlxj0mbatuuRE8fGTcCNhoD7hg5RYEkhqlrr9Zi2fonEL
         wuidZHhKSBegvlKvbwbJ1H0gkXrReYDB13tRe1ZrpnYiEyvC2Z7XjZ0vTSiu/4etNunw
         vkkvJ+9iSYoImC0QK2CPZvscAWz4j9ZZQetfkbXPX9mwTs3WzB33HfpVOYe68v1Mu2y9
         d0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704733567; x=1705338367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbPAcMGpcSXO8k+T7YEsZWJ+BQTVtWzWLIRcUu974lI=;
        b=KkHtaL6GvSV2kRQOwFiEM+ILziGI3+bx0IWXMVrX9033281rBiqLEFFQEn/+wzWVPJ
         5NVwSWzyKpBCSTVtcDZGfTpkEvEb8G6SfVrCZwjhbT+/TRkIcxqBcOcsUvcD5r2g+3IC
         t4ni8NWeflzGiRZItC83kvvIj6v1N7WkZAKuIDhleuBjI2YQ+NfhMsQaz9DQ6uSsNCAb
         XlKhFSEa1+qcKVqHgyY4VDuQ07Y8Sl+0pQfyVSHF2A7G2FDC/VLc+LN/JpdJtTdszzjS
         L+HV8PS+PqLmCUX4VxaJZHudcY9VJdnOtEgV8xeyeUvAfO6zhaxW9nkIHVoRqXlWhNX8
         TMxw==
X-Gm-Message-State: AOJu0YwdPtn84x7f/2uB30P/0h9edbXF9+EN2oIje8jvr/PgCWYBHz0x
	K/crwZe+KGgOYsYb9GhMDZOzL1HpnEA2rw==
X-Google-Smtp-Source: AGHT+IFHdsbO/yNdcaD4b6jToUg1/s5j9hTA0Kf9UeSvYkXGJPJhkxLP5Cq7T3V3lcOSXCjRXM62/A==
X-Received: by 2002:adf:ea83:0:b0:336:8d29:573c with SMTP id s3-20020adfea83000000b003368d29573cmr1727474wrm.108.1704733566489;
        Mon, 08 Jan 2024 09:06:06 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.25])
        by smtp.gmail.com with ESMTPSA id j1-20020a5d4481000000b00333359b522dsm128008wrq.77.2024.01.08.09.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 09:06:05 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] pcsc-tools: upgrade 1.6.2 -> 1.7.1
Date: Mon,  8 Jan 2024 20:05:52 +0300
Message-Id: <20240108170552.304195-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 17:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108169

Changelog:

===== 1.7.1 =====
- 64 new ATRs
- configure: Use ATR_analysis by default on GNU/Linux
- improve Windows support

===== 1.7.0 =====
- 182 new ATRs
- pcsc_scan:
	. add debug option -d
	. add PnP option -p
- gscriptor: i18n and l10n in English (default), French and Russian
- configure: add --enable-ATRparser=foobar to specify an ATR parser
- minor fixes and improvements

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 The only difference between v1 and v2 is the use of autoconf-archive as native.

 .../{pcsc-tools_1.6.2.bb => pcsc-tools_1.7.1.bb}           | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.6.2.bb => pcsc-tools_1.7.1.bb} (75%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.1.bb
similarity index 75%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.1.bb
index b71fb0427..97a94ec97 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.6.2.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.1.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"

 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master"

-SRCREV = "b1018b83346f8a3bc3d42c96f2ed4dc62147cb24"
+SRCREV = "53834cd33155ae1f0332102b1baca6ce63660fc5"

 inherit autotools pkgconfig

 S = "${WORKDIR}/git"

-DEPENDS = "pcsc-lite"
+DEPENDS = "pcsc-lite autoconf-archive-native"

 RDEPENDS:${PN} += " \
 	${@bb.utils.contains('DISTRO_FEATURES','systemd','pcsc-lite-systemd', 'pcsc-lite', d)} \
@@ -21,4 +21,5 @@ RDEPENDS:${PN} += " \
 	libpcsc-perl \
 "

-FILES:${PN} += "${datadir}/pcsc/smartcard_list.txt"
+FILES:${PN} += "${datadir}/pcsc/smartcard_list.txt \
+		${datadir}/pcsc/gscriptor.png"
--
2.25.1


