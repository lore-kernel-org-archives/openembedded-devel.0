Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD5BC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:05:55 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.2419.1646251554309816685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:05:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EqMqcq3A;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id j17so4588956wrc.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8cik0ofVabYJ5ldgwL/c3x0hMVFsCIgKZp6bAg+IsBE=;
        b=EqMqcq3Axx8x4PXvrDAzz0b1m2FEj0nu5d9FbL5l+4HUKnU1911iXOhMDya4LV3Irx
         YVfJ1bWBz72m5+Kxk3bZBSQrJ9bgMN5fVSUsVvtilo0rXq/vVL/CDCOjP3djt1mX21Ky
         ng6iu4dQNKR3yxd//GqOy6i17SMoWP/dR4kG4PZDynv4xw8EWhLzqnd288FPzKi9vbgD
         cqintmuLnvNDqpcokiMIWPaOAwTwUVwnSvk1DkqyNrzxY1JmiPSuABfA5rimYpZuUNrU
         /4q//chR5TVceR6nFWj9kcOu11KDfgfpzO5CJfiPRdUs4XD21N4M3n5p/CHz9AQ01W/K
         tfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8cik0ofVabYJ5ldgwL/c3x0hMVFsCIgKZp6bAg+IsBE=;
        b=20IzcfJncG1jFFd9Y8+x1dURv/8/AP8Vw6S9c9oXd45YD33CCRDATXAntwRuNQ8Yok
         7JNpX7BzJZL1MeOJVg5E42gbM0mxiYPB0LpRSWAvY1AXI+ISjmdRrYfQr1BYGgmXW/7Y
         1WC/xPk2TvgdBkBsLm2itZJpfG760Nq/8UMzGyLi/AxTEsAXsN253ZFFfutIUyWt5GKB
         VNPAY6o+EiBhxTYPwVSYDVG4lAG2WaQVEwUxsigOkyjl23BXYG7H8uh6g3zylpDs8CNs
         2a6eyguoB+Efhm0lEycBl5oeFCAcyf7hEVAMbpcN9rxAv89tTWLdgbgUE1SQl8vAyPV+
         8dpA==
X-Gm-Message-State: AOAM531RW0Z6cNzOArnxhNURlcsK+vwrmz3+QZ07a2tTXQRfmI3A/VuW
	lifentyh2pOIGnGVI2rmKSYQQ+titTY=
X-Google-Smtp-Source: 
 ABdhPJxlPBEG73oppP/Py7U2p9AGaCTCOMK/i4OoBWwTeb5qrFMnXyrf+NxYDPYo5zvmjA+UFVdaFg==
X-Received: by 2002:a5d:654e:0:b0:1f0:1a18:166c with SMTP id
 z14-20020a5d654e000000b001f01a18166cmr6447311wrv.28.1646251552462;
        Wed, 02 Mar 2022 12:05:52 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 m2-20020adff382000000b001f022ef0375sm4688447wro.102.2022.03.02.12.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:05:52 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH V4 0/2] networkmanager: switch to meson
Date: Wed,  2 Mar 2022 21:05:46 +0100
Message-Id: <20220302200549.3823033-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 20:05:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95709

Sorry for V3, please ignore it.

In comparison to V2:
Fix the build regression of libnma. vala support is required by libnma.

Adrian Freihofer (2):
  networkmanager: switch to meson
  networkmanager: new configure options

 ...e.ac-Fix-pkgconfig-sysroot-locations.patch |  22 --
 ...1-do-not-ask-host-for-ifcfg-defaults.patch |  27 +++
 ...ttings-settings-property-documentati.patch |  60 -----
 ...d-to-var-libdir-rather-than-hardcod-.patch |  30 ---
 .../networkmanager/enable-dhcpcd.conf         |   2 +
 .../networkmanager/enable-iwd.conf            |   3 +
 .../networkmanager/networkmanager_1.36.0.bb   | 208 ++++++++++++------
 7 files changed, 170 insertions(+), 182 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-do-not-ask-host-for-ifcfg-defaults.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-dhcpcd.conf
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/enable-iwd.conf

-- 
2.34.1


