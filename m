Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B45C41535
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:34:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.32317.1699860890132952154
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=msdvYKxf;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc58219376so36713095ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699860889; x=1700465689; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIpojbFOruoJj/hclyWzTrTuwlBxWfUp9Eayw/4WTjI=;
        b=msdvYKxfkGUEaCY3ch3k6ssP7dPX3U5h3SrQgMnewcMlYu5cRI05D6HMYkl+fYGJTq
         L5fPh0Sx8og3so4lnUXtjcFiWiH/HfvVOi6UQtURyPrWhb5xs5oHBR9V0FInHnQDmSwk
         EBog4Jpjfxh1O2Gx/d3XzUcp/d9Gu1l+YkcKvfov5EEbKKl70XgdyMNJGZs6ULUMEYLV
         VrXdhOVr34Q1h/6X1TpaYOMupDD8qbcg/o662mWjpTDTPM4s9Q/KbWHozJV6Qns67tNu
         iiUx6+YQicwGflMyWB9XgoLZ3JRLzEK5bEB1ea591D3CGNKfKy1Fg+fsTFcEvG0FjiQ3
         ffSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699860889; x=1700465689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIpojbFOruoJj/hclyWzTrTuwlBxWfUp9Eayw/4WTjI=;
        b=VAcvwaf01u6vcQowzi43B3KJQsrarBJeIdiZRqafkIyaCa5ZWoj/RcZ3iZhaRR63On
         UKbrAggPTnmSwkQXAdogrPr6Err920NACUl+5Ks06sRRI5Z6C0DV9AyrjoWIu5Jg1CAV
         GOoPC58XbTUOH6YWzKs1NtE9J71dbTl/WeHzsBarTQw6HCWFKO/9W6naa/YqDqaZgcSl
         QMG74Jljwgt6ydlKjzNAzBYDRGMRMqv6wBwz7jfy0j8tsCKEbel7/DrqRJHN0/EQQuar
         3EoCZ4FXC0ir1jBT4tKdybHFF5IR/npE8Wa1BI6ulyfG0qT3wTbkZKLqCCYLSSoZAcA9
         kgPQ==
X-Gm-Message-State: AOJu0YzrTr+bZ2endIYrXd2jmARMdNdqeQr6I4/AGzx+d1GbtfP2wQu4
	tO6yO1hi/mSQ1MFtTiK8a5/zr7AS7H62FA==
X-Google-Smtp-Source: AGHT+IEHX1Pl8wCUdxqJSTlTHOzcyRIiaNY2gu4TTTRzkkTK+c0yeupNIf+BMo7aO8D5+1uTg3bBsA==
X-Received: by 2002:a17:903:230a:b0:1cc:569b:1df4 with SMTP id d10-20020a170903230a00b001cc569b1df4mr7375787plh.1.1699860889200;
        Sun, 12 Nov 2023 23:34:49 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc50f67fbasm3509691plx.281.2023.11.12.23.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:34:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 23:34:45 -0800
Subject: [PATCH v3 1/6] meta-networking: Use autotools make system
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v3-1-51f4c8091bc8@gmail.com>
References: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
In-Reply-To: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 07:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106627

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


