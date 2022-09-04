Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FF9C6FA83
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.11284.1662276902992911181
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XCJLCOEs;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id b144so1088946pfb.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3NpGuutTx/fwaNQN6Myej1tkEmfc8vn/u6YGEhoe9Ts=;
        b=XCJLCOEswHhyXD9ZKaOmGTs+1d8hyQFN1D8zyCqCd6WK2yrgApkei6LoZTL9H+x6Iy
         BOByNtOXgGYDw8dbWgKbvG+JeTr0zhtY/jgfvsr3HP7gnVgRxwQLtzjdsDH7DOx9YSbl
         Hy6eelqGT661W4UBjWkPG3mP7Q9D7gT//P1GDuDIuYdng1JWjgWyzyCxbpfNdeSbIwsx
         ZSzwnZ+Tr12z1ux2lihy6Q0LCnKjeHd06TezB1Ffe/BJfVKl7TQEinAbenWKAId+bJ0U
         e6mgXPT3NXuJf9WvZZT/25Ar599nQ/QhBt+VpBp1VfAz6ekdjIrksP0XROmOIduqYYAJ
         NJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3NpGuutTx/fwaNQN6Myej1tkEmfc8vn/u6YGEhoe9Ts=;
        b=ILa5xgNudM8Fs7MRriaI8g2+kqs9GMjqNgrgCw2NgCfVsUib76C1lKaio5gwQoJccb
         B43/cWDWh7pfsPXYJSVJlPt3+Gpn4nMLibWUEmyc/tBwwWhxhFOgusER2Ib5J9qcE7fh
         8zNw9MgqMVAmYV8UZleLoTieAV1/MIwvaL9aP2rUWYN8j+XWx6pPh+lRFwHuh7mVJHUp
         13WIvyXd8IUp0cOiJmtvmsir5ru7K46R5hNT0x2TeSOsWpcWwLXCBvPvylNXR883hJpG
         3HzMP6qxQpxjNdm8eoWJzHD+g1q4OvrQB5PaaH231sFJuK1zxAiLfnWt4kL4pQz2HwAo
         TEmw==
X-Gm-Message-State: ACgBeo1DjaVuZsOK78o+F33tKpCoUwyxzWtn+DE3QPszSwd9EJbW8q8j
	t/qHz0BUz+kwHua0KCeWQT5lhOgoeoC4yA==
X-Google-Smtp-Source: 
 AA6agR7yriHPoBrTfmXX0iqltr2OzXX6RWSaQWngyXyoMpJuZ8x+i01FVNihuCOCJqBkQrN2R9riTQ==
X-Received: by 2002:a63:cf0b:0:b0:419:f140:2876 with SMTP id
 j11-20020a63cf0b000000b00419f1402876mr36777128pgg.303.1662276912425;
        Sun, 04 Sep 2022 00:35:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 51/63] mg: Upgrade to 20220614 release
Date: Sun,  4 Sep 2022 00:34:05 -0700
Message-Id: <20220904073417.3251865-51-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98645

License-Change: update version string [1]

[1] https://github.com/hboetes/mg/commit/da1036f6e085f2d7edd4d4ab65d74de4d4d18c08

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/mg/{mg_20210609.bb => mg_20220614.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mg/{mg_20210609.bb => mg_20220614.bb} (88%)

diff --git a/meta-oe/recipes-support/mg/mg_20210609.bb b/meta-oe/recipes-support/mg/mg_20220614.bb
similarity index 88%
rename from meta-oe/recipes-support/mg/mg_20210609.bb
rename to meta-oe/recipes-support/mg/mg_20220614.bb
index 5deb5c66e3..01ccef5124 100644
--- a/meta-oe/recipes-support/mg/mg_20210609.bb
+++ b/meta-oe/recipes-support/mg/mg_20220614.bb
@@ -1,11 +1,11 @@
 SUMMARY = "A portable version of the mg maintained by the OpenBSD team"
 HOMEPAGE = "http://homepage.boetes.org/software/mg/"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://version.c;md5=1895eb37bf6bd79cdc5c89d8166fabfb"
+LIC_FILES_CHKSUM = "file://version.c;md5=43616508f42ab3fdb082c5f932bd2eb4"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRCREV = "688f49cd67ab30dfa6482c74815e117cbf7af63a"
+SRCREV = "ea58e622fad20622ac0b723d021baaaf5dc0eb49"
 SRC_URI = "git://github.com/hboetes/mg;branch=master;protocol=https \
            file://0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch \
            file://0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch \
-- 
2.37.3


