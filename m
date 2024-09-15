Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B989C3ABA0
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 16:13:53 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.117526.1726416829365954284
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 09:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YR/jbjE5;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e1f139b97b5so551979276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726416828; x=1727021628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XXkR5UB7oH/01FhXyQa1z9SW2powoyVu75q7iI2OE7U=;
        b=YR/jbjE5Gz/wk9NzYcivtNaTBd3K7oVO1otSrFdKA9IIkslJ9/9XwF5RlJWIVUopd4
         l8GuTUtRZ2IYh1V9BaYF5C3QUdjrx9xDmrVsYVvbcVEA7cgRku40oVmez6UCq3AoayEV
         aeUPlZfnsIQKNqrpzY+tzpdsssiSQ9oKiCd70L8J+bSf7OYG8FmemORG78ZNnhsf2iGn
         E8DIoMLJ9NYSgv1Guzc+6Y788EWwHXz2GiFWS4aJMn2zQ3j9JclJNg3WZ0VGfPM0PcEu
         gyQQfwPvg2gqvfEzycf5U9vidWCUP1o3HOzMep1+okBoMzvGka6YONiPK//Rd6s/96ZO
         C6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726416828; x=1727021628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXkR5UB7oH/01FhXyQa1z9SW2powoyVu75q7iI2OE7U=;
        b=Pk5HWahn/7QZknLsdu7Zr37AOO9jX7wnvgg3SVMTlpwtIXPscsKyCui7hCGALHss4a
         pMftHd30utnnWskNTWaIhj077T/SdGBfltoj/xXKTRkR1L1+mox5UoEkOt+wrB87ef27
         rY45a6GfVJJt1Gjv97r3EHWfkaWNVigxov1cINWTu1QUWXlb4cBPO4ltYSS1HIOUnMJ9
         n2I0MbKn2Lm4h7YWz5JCQnKIbG22MQ49CHxSn0jr8K+nDo0NfCMqOROd8dSRb+kv1cMX
         chAjqPVhfYL2hMN+riruEJRAbaYXk5cKJNjNbrEIgDhGAsBHRGOZ3+HLwNyKhnrPNBDH
         Dphg==
X-Gm-Message-State: AOJu0YyM3y9GSv1YuH7jg3CDE/+zlfNhATtTUPJ62oeLp1XyIq4fxsKe
	8khVuv6XfSqxBCrGR5hDVLxgMG8nmN3vYGxk6AFArT1szSNBEnQQ/qdXzw==
X-Google-Smtp-Source: AGHT+IFJmSZrbxb8Px7sf0QEWZ0EaZiMDdu3xD0RbutuScg6EagiEX8RmDknCOBYcWrL8MKYoKu8PQ==
X-Received: by 2002:a05:6902:2706:b0:e1d:aa:8807 with SMTP id 3f1490d57ef6-e1d79e51827mr13935517276.3.1726416828294;
        Sun, 15 Sep 2024 09:13:48 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:971b:923e:7e7f:305e])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1dc1381150sm663993276.43.2024.09.15.09.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 09:13:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] gnome-remote-desktop: update 46.1 -> 46.2
Date: Sun, 15 Sep 2024 12:13:45 -0400
Message-ID: <20240915161347.187613-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112301

From: Markus Volk <f_l_k@t-online.de>

46.2
====
* Potential crasher fix
* Improved disconnection messages
* Broader client compatibility support
* Various security hardening improvements
* CVE-2024-5148 Limit login screen->user session handover access to appropriate user

Contributors:
 Pascal Nowack, Ray Strode

Translators:
  Balázs Úr [hu], Efstathios Iosifidis [el], Fabio Tomat [fur],
  Hugo Carvalho [pt], Jordi Mas i Hernandez [ca],
  Juliano de Souza Camargo [pt_BR]

- add polkitd user and fix permissions to avoid:
Error: Transaction test error:
  file /usr/share/polkit-1/rules.d conflicts between attempted installs of gnome-remote-desktop-46.2-r0.corei7_64 and gnome-control-center-46.2-r0.corei7_64

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7ecfdeb3cf4e13801b63f0c05afd572d9df54403)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ktop_46.1.bb => gnome-remote-desktop_46.2.bb} | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/{gnome-remote-desktop_46.1.bb => gnome-remote-desktop_46.2.bb} (64%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.1.bb b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
similarity index 64%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.1.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
index 634b37971e..59ae9383db 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.1.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gettext gsettings features_check
+inherit gnomebase gettext gsettings features_check useradd
 
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl polkit"
 
-SRC_URI[archive.sha256sum] = "7c62a4281fdfa9522110affbf75d09973035f2adc7fa4577511d733186beb68f"
+SRC_URI[archive.sha256sum] = "97443eaffe4b1a69626886a41d25cbeb2c148d3fed43d92115c1b7d20d5238ab"
 
 DEPENDS = " \
     asciidoc-native \
@@ -36,5 +36,15 @@ PACKAGECONFIG[vnc] = "-Dvnc=true,-Dvnc=false,libvncserver"
 PACKAGECONFIG[rdp] = "-Drdp=true,-Drdp=false,freerdp3 fuse3 libxkbcommon"
 PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
 
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd"
+
+do_install:append() {
+    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
+        chmod 700 ${D}${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+    fi
+}
+
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 FILES:${PN} += "${systemd_user_unitdir} ${systemd_system_unitdir} ${datadir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
-- 
2.43.0


