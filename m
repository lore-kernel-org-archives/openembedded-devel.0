Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4698AC25B67
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 05:06:15 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.13319.1698469570193580447
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 22:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=drJwQUj3;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c87a85332bso24589345ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 22:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698469569; x=1699074369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmgCkOCZ1AK8MorZ6VDUYCrEqhsvs9BSYeViI/qmatk=;
        b=drJwQUj3LBUSHq+TnG6AjGpwQQiYPD00qSnl34ZbiUp+rud/q9icVUpPfgnDxthSf4
         4OIxw78X4M2UQrka8IvEJoP24J6m31Hvp3LVTBr2wikk6VaeydbDMSKYfkLBahFRYn/n
         BTtBGRQPOZ4UXMvaokYHV0pjOSDA/ZVkl4Ej2yI6pITwJ+PWXLHqGELibozeX8JNk53Z
         vaBS4HnoS0VhYSg6EIiPPK49AXqODOoLTkpWsA7sruHtgUYlXrfFdn9/m6eCQMhPzA+h
         VIsA1gyMC+Zkw/p/+kt5vawd93zsgimZcVmx3q+//SNMpn5/M2tAqhiEE0y/EgrXEPic
         zikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698469569; x=1699074369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmgCkOCZ1AK8MorZ6VDUYCrEqhsvs9BSYeViI/qmatk=;
        b=dTL33P6k/07F6UaUB5gyir4OVBbNh+7DH48z3SaxcmfOfeSOFtLYq5UU49xDpL8wJZ
         zUyLRLerTxQFxm/G2Nffk9KDtPMPITlXspbrkcu9hC+Cuwdo+6bbSk/El/12l7YRwQJh
         TWI5riAaoPZ25pPO9/m34H6ofj3B+qlSPRaUJGy1wUVfALIfHcT9e8YwKEpP97LL/ZG9
         P0etDHGGOaPv8oG+3pkVP3XbKRB1y0iIpx3C/TcoOKacH4haI3rUHoKwJ+R4RwhpCjtj
         tIwiqnZdGzy09te245JhcNNhWyAhZ7qqLMYtQMWro9nhyD4Lc6k1HhlyPwF8lG+K27n4
         WsSg==
X-Gm-Message-State: AOJu0YxBgWp6GRw3bT1x9Z7dxcOUcqBokzIY1eKIHDwEYqdKKpBq4z1Y
	+nnzYKQl1eTmXnQXxvxk5do7ogcUoBU=
X-Google-Smtp-Source: AGHT+IGutmbLwTNn0gcE3LJbuidBZhKLZblD7c0HXQioheEiAdh43Qd0aj4RUHHL6o7zzsymseEuog==
X-Received: by 2002:a17:903:20d4:b0:1cc:2dad:7ae9 with SMTP id i20-20020a17090320d400b001cc2dad7ae9mr1883457plb.32.1698469569238;
        Fri, 27 Oct 2023 22:06:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b001c627413e87sm407614pld.290.2023.10.27.22.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 22:06:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][meta-gnome][PATCH v2] network-manager-applet,networkmanager-openvpn, networkmanager: Apply linker versioning patch when using lld only
Date: Fri, 27 Oct 2023 22:06:06 -0700
Message-ID: <20231028050606.3438884-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Oct 2023 05:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105784

This patch caused GNU linker to fail linking, therefore limit it to just
lld.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../network-manager-applet/network-manager-applet_1.32.0.bb     | 2 +-
 .../networkmanager/networkmanager-openvpn_1.10.2.bb             | 2 +-
 .../networkmanager/networkmanager_1.44.0.bb                     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
index 20fc0f3868..058aeb58d2 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
@@ -9,7 +9,7 @@ inherit features_check gnomebase gsettings gtk-icon-cache gettext pkgconfig
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI:append:libc-musl = " file://0001-linker-script-Do-not-export-_IO_stdin_used.patch"
+SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
 SRC_URI[archive.sha256sum] = "a2b5affa1505ad43902959fdbe09e5bcec57b11ed333fa60458ffb9c62efba38"
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
index 024ef39361..a9afe3a7e4 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
@@ -10,7 +10,7 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI:append:libc-musl = " file://0001-linker-script-Do-not-export-_IO_stdin_used.patch"
+SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
 SRC_URI[sha256sum] = "62f0f2a8782221b923f212ac2a8ebbc1002efd6a90ee945dad4adfb56d076d21"
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index 84ef70c9af..8d1c877baa 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -31,7 +31,7 @@ SRC_URI = " \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
-SRC_URI:append:libc-musl = " file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch"
+SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
 SRC_URI[sha256sum] = "edca09637d182f806b3b12d8c5623d7badbd73ccca1ae63be20d2f298779fb9f"
 
-- 
2.42.0


