Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1064DC4167B
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:17:54 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.22580.1699820272626794644
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PF/2CnTM;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-586753b0ab0so2180273eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820272; x=1700425072; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIpojbFOruoJj/hclyWzTrTuwlBxWfUp9Eayw/4WTjI=;
        b=PF/2CnTM8gGXkUvD39T8RZZZdkSkNpDg02fehZ9FQ55aaOqFgErq0sRmqMrRT2FKSS
         wjGfeibttTizsTb7JzU0RyHOTMrvK2VwWzvKUc6HgWjY1o7bb1aQgrAdSCVIuIuIS3EA
         IAZoD/heqe4p1o2SkwcVS80OHyUJjCAXCDN58SyJ7zpXvB5abwONuA/CgHTJkwhkYuWn
         MsgHLhpLwH/qN1LCuvu7ZztfIZ6eqwg0/VIclpsHmp/X/Os5OuTi2iiMO1DrbC+qVO25
         0W/PdY1Hi3C3b0hBPSfQSX3/neyaoaZB/UymO49pWhzEr2k0X96UiGqm4tiSoMKrMkNk
         9fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820272; x=1700425072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIpojbFOruoJj/hclyWzTrTuwlBxWfUp9Eayw/4WTjI=;
        b=JPPCmyionehHv2EKnJFpEm8jZR6s3uCp6ed9UIOZLHn8V+AansU+BN3w4ljfN82sDN
         pjSO8qQw3YhGWO/q1EXn7DueAevwi5efJ2oFh9JLzrZDMlQlV5mkBjRIVRCU/VzVM4fm
         fHArsvYw4vYxGrgGkeMBOPCfnTxSG4IJlVIo4O1rOWkPaQN7NAUi/qiQpqyW1kRyh4Sh
         Er3I5KaDCgbjTQesgZBQnfz2nqcaXV2IPDKnSl+h3sABPI+43e+YKX9R01lRdwW8Guxc
         apoHy6s+Z858lrUaIN3ee24IKSuXeGXrvQieFXJIcdCf23rZvRg7tneVMvnwz4spcux7
         xenw==
X-Gm-Message-State: AOJu0YxQ/vxMK4kDvU/5KlF1TOUxNiCOyPIV59rR6IeMZa0/5gi46tHI
	WauLDnXK5JAhyQD7vx8e/H0=
X-Google-Smtp-Source: AGHT+IFpgJZUk9nubv6TaEfuYilKX3Zq8y7hWLwqqHLlxvaOL4Rx4RXjbK/ZxFCU4U3vyDuTRsUdog==
X-Received: by 2002:a05:6358:52c1:b0:168:e3a9:14f5 with SMTP id z1-20020a05635852c100b00168e3a914f5mr5335862rwz.12.1699820271755;
        Sun, 12 Nov 2023 12:17:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id u8-20020a63df08000000b005ac384b71cbsm2954892pgg.60.2023.11.12.12.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 12:17:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 12:17:48 -0800
Subject: [PATCH v2 1/5] meta-networking: Use autotools make system
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v2-1-f38d4f960d44@gmail.com>
References: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
In-Reply-To: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106605

OE-core is switching to default to meson for gnome recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../networkmanager/networkmanager-fortisslvpn_1.4.0.bb                   | 1 +
 .../networkmanager/networkmanager-openconnect_1.2.8.bb                   | 1 +
 .../recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb
index a251e8bf3d..a15c69b601 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-fortisslvpn_1.4.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "glib-2.0-native libxml2-native networkmanager ppp"
 
+GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gettext useradd
 
 SRC_URI = " \
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
index c978defbbf..ee19afbd11 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openconnect_1.2.8.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=186e8b54342da4f753a62b7748c947db"
 
 DEPENDS = "glib-2.0-native intltool-native libxml2 networkmanager openconnect"
 
+GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase useradd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openconnect/${@gnome_verdir("${PV}")}/NetworkManager-openconnect-${PV}.tar.xz"
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
index a9afe3a7e4..cdef11c89c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=100d5a599bead70ddcd70dcd73f2e29c"
 
 DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native glib-2.0-native"
 
+GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"

-- 
2.42.1


