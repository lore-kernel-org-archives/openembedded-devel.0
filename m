Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA25C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:00:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.2301.1646251209717735846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q4z8NaFJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id c192so1857287wma.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TIw4Sd6fs2PUkNiQudt1rpMq8oYKgJMm7dcdSARnvTk=;
        b=q4z8NaFJzjbHix2WWwd1eZh8djC8JAWhxDupHCloUJ6+2wOY7kMZWP9t1pPF6SqbM9
         9FZueKVU4gdqjns6uGrMCF7vKaT88D2c4ERuG68DxSt/j4ESLvZChLd6u44TiuTgRSx6
         PostWj0z7kHGSPGmHKT2v8xCsGJoP6DGk/M4dIQhLiGHjc0SBQcIteNhBmRkRmMatNBh
         eU3NnPaPSCKFXhGhtZBWa1digA0vPW9xeT+WSq+nx0l8NJ6cYgs8gciSgRXuW47OVpGZ
         UZeNFWT/5Sak1jY+HpVhE7g3j514UnhZxyydEAVnkxwkhBdu1DCbt22RGbnb2/o9hWrB
         dUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TIw4Sd6fs2PUkNiQudt1rpMq8oYKgJMm7dcdSARnvTk=;
        b=bklsy94c7+bwn4HRZvxt6zi4xs+EdwebfTJ+lorDkHG6pUn4BhOt2IlUb0ufJ+TJrD
         Ayi8EMlWyvzfRLH6SxgaRLZPHsUAtgm6L3m600Hlwi2JKEB1rWSPOpgYjdjlxIELlNLp
         h19G/Aky8Kd928g4/4w70soytMK21qAJDwuwVW0XRFMx7NQiGiQ6IceWMCVOq8H/qFSm
         fmmAgIEKrAcJ2hdjwAvGwIuEIDsrRj8MeIYjgoYUJtOi3wTAK3j7nbHPvCvg686J5sz+
         zKJPFUhEpvRwwQZ4+bMiIgrmZns4AfFQdqPA0XgB9D7AAv1Oi7D05hhLczY1wAvDIQ76
         0asQ==
X-Gm-Message-State: AOAM530EV657mw4yKtLaP7iMrz6GNzMuEqZsTeFpo/+FqeGEAW2TZ85U
	gfgnV8eDKtQvGDJCM+JNC1n1iR1uLtw=
X-Google-Smtp-Source: 
 ABdhPJz2knVASjukYCTWNtY8GVNLWyGBPCfZulkjanrTTfPla/ry0eFT56FI9sHq/aMQ2Y1CCVeDHA==
X-Received: by 2002:a7b:cf23:0:b0:385:17a6:9b9f with SMTP id
 m3-20020a7bcf23000000b0038517a69b9fmr1149448wmg.151.1646251208114;
        Wed, 02 Mar 2022 12:00:08 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 q124-20020a1ca782000000b00382b3260778sm4415373wme.3.2022.03.02.12.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:00:07 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH V3 2/2] feat: add networkmanager
Date: Wed,  2 Mar 2022 20:59:45 +0100
Message-Id: <20220302195945.3818037-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302195945.3818037-1-adrian.freihofer@siemens.com>
References: <20220302195945.3818037-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 20:00:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95707

---
 projects/poky-oe-glibc-sd/conf/site.conf | 5 +++++
 projects/poky-tiny-oe/conf/site.conf     | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/projects/poky-oe-glibc-sd/conf/site.conf b/projects/poky-oe-glibc-sd/conf/site.conf
index d51cc82..55c2c66 100644
--- a/projects/poky-oe-glibc-sd/conf/site.conf
+++ b/projects/poky-oe-glibc-sd/conf/site.conf
@@ -11,3 +11,8 @@ DISTRO_FEATURES:append = " systemd"
 VIRTUAL-RUNTIME_init_manager = "systemd"
 DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
 VIRTUAL-RUNTIME_initscripts = ""
+
+# add NetworkManager
+IMAGE_INSTALL:append = "networkmanager-nmcli"
+
+# PACKAGECONFIG:pn-networkmanager = "systemd libedit gnutls nmcli dhcpcd wifi modemmanager ppp"
diff --git a/projects/poky-tiny-oe/conf/site.conf b/projects/poky-tiny-oe/conf/site.conf
index 2b0c389..31fac0f 100644
--- a/projects/poky-tiny-oe/conf/site.conf
+++ b/projects/poky-tiny-oe/conf/site.conf
@@ -7,3 +7,8 @@ SSTATE_DIR ?= "${TOPDIR}/../../temp/sstate-cache"
 # Enabling Build History
 INHERIT += "buildhistory"
 BUILDHISTORY_COMMIT = "1"
+
+# add NetworkManager
+IMAGE_INSTALL:append = "networkmanager-nmcli"
+
+# PACKAGECONFIG:pn-networkmanager = "libedit gnutls nmcli dhcpcd wifi modemmanager ppp"
-- 
2.34.1


