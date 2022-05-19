Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DF5C4332F
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 12:13:09 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.6727.1652962387278952919
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 05:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dsnUvlp0;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id fd25so6752680edb.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2CaVZLgkwqf6L/JM1HqLenV3Gvclo7GGnMXkvzfpDyA=;
        b=dsnUvlp0x/NhblNfNFa5a5+vyA0X+7qbQ3qh8X/JTW8m+/SXpBtdJvdIeNdpj1FGFA
         AKOdjhq4VyLgEFlrq0R6PFqKlNdZWNwy8z4UhqUF04Wh1fBEScf1PHGdo2aAYAyoP1Gz
         GMroIBP3TSU71mNxks6LKYZE5JTjHwow9SwYfvtTsEbxVOT0n48XJwlRyJCcO5CVEPRD
         j6AHsYIxZNvWbeDqvSTJnrgCvoi8V2E+g0RjT80R62yCq8SE613U50+GyDKhk/WEYKTm
         a5ETM8rvRNpZasqdeKSVKHhb+BNCmeioV7/iNsOj+ojByyYD5wHFUktq0R9eu52NoA8P
         dr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2CaVZLgkwqf6L/JM1HqLenV3Gvclo7GGnMXkvzfpDyA=;
        b=t26E+Sk3aFnLs2XXecXd2atI5Kg8hY5tHRrJE2eb+1eYq5zHUbdrECCe4qJE/RgfJI
         x80HzBl0v5sgxIFrubWwP1NBtYX+OLUzQDKNMQBp97DjRN/Q9KtTFPzkAuNlEwdHZFrb
         5iv9T/wALUO3B0OfkXzd8NL30QrCXzIjQH0Aix0+AWQjynrTHD5OiMe0X13F6WCydP8c
         S+6rrbQQdcnIJLGzKlleT+E7HKxDJDb0XNaYW2DQ9d0wEl9caBhVO+VcT/RLyiscygk/
         Zd8lhCw+mctKy6cGIN0k5GboHh7g2lawN3/ZOTks10LcqG8TQiqhsvVN7FYk80RGvKBR
         pxWg==
X-Gm-Message-State: AOAM531tX649rEguaZG+ZlEwjQRxmHt1j0q39WlStyB9M0hAvWjzgjcp
	zdEGo8SDH8r13FKRetkvXwl9agKU7x4=
X-Google-Smtp-Source: 
 ABdhPJxPrzsXzG/ZVOX+CiFQBTCAUZwB5wr7npUe3FSQPERUp3vGFmGm1AzRipATcv4r4muYzgOLZg==
X-Received: by 2002:a05:6402:2750:b0:428:53bb:3433 with SMTP id
 z16-20020a056402275000b0042853bb3433mr4991024edd.22.1652962385280;
        Thu, 19 May 2022 05:13:05 -0700 (PDT)
Received: from Unimatrix08-Focal.lan ([93.68.172.225])
        by smtp.gmail.com with ESMTPSA id
 de22-20020a1709069bd600b006fe9ec4ba9esm326713ejc.52.2022.05.19.05.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 05:13:04 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] libmtp: Add doxygen-native dependency in case
 documentation build is enabled in PACKAGECONFIG. This fixes a FTBFS due to
 missing dependency.
Date: Thu, 19 May 2022 14:13:02 +0200
Message-Id: <20220519121302.802956-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 12:13:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97193

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
index b4cbb792c..3483db3c8 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.19.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF += " \
 "
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)}"
-PACKAGECONFIG[doxygen] = "--enable-doxygen,--disable-doxygen"
+PACKAGECONFIG[doxygen] = "--enable-doxygen,--disable-doxygen,doxygen-native"
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile"
 PACKAGECONFIG[mtpz] = "--enable-mtpz,--disable-mtpz,libgcrypt"
 
-- 
2.25.1


