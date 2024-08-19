Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3378BC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 11:54:57 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.208483.1724068496297152967
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 04:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OU7QfcEG;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efa16aad9so5306523e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724068494; x=1724673294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0tveDxTay5LNFeSQqIyWb13FEx1uSUyh9b29wXUrhso=;
        b=OU7QfcEGJmWejuL9pJtMVg2r3lGBEieTu2trFIUlvmst0+qBuD3gTonA9JbajcIzrL
         Z4r6ylg10nXkF+cwPHz9rdOGD5wWezHF8mTai/txIhGnNwJK05YFLZA69jfDlV/ergz9
         6OWB/iiuAdwiIAgjZZECYGJvgGZmlvZb3FXgkrosP+5Q8CFvl2p0w3GuNuGh6VKlu/ix
         57pjF37pas6mZffg14JMtC5IggN0BAmCYQX6guFW90Azeynk3rUz6seGrcNtAhWeKzcR
         HlN31P6CeE0PmckWTBGoie9jOAuvmEVjfX2qO/6sv+6zqxQs7eo9Qv3tisZjrTFOAJ6Y
         cWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724068494; x=1724673294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tveDxTay5LNFeSQqIyWb13FEx1uSUyh9b29wXUrhso=;
        b=T2YkUIZjvZuKCEzaGpdTsYTgR7TT/MK11Tam4o10osDwdSW6zTEH1dIR8e+yuYKezT
         /laJo63cE4qmJQ1IaflO2ayCtqB0LI2VUwGUD+2mbyn3qo6Vkr+PpCCj6xPXi/pIq0Gr
         4/sT5G8U/ewf55+TROm6C6OTOmQ7O0EkCHqaATRkd14RyrBaLY1tet7Ii20xBuvGp0Dk
         IGTVPPXTs39x5S7J01hS9vnmsonRiJ+FkP7Xq/11BtCIES3rt0H8kKjTYv4jYpULhtoz
         qNUH5/kXiQCytQ6svbybovlW+mS5IEl7EEs7lMMKGMWeuf/9eQl+KwiiGQkhc8Co5chu
         mlNA==
X-Gm-Message-State: AOJu0YyzyUe8rRoc9vGY4mi8J0ABTnBRPwKGcTYEAFC0V97GdU10Ab2e
	nCLK/BfqKOajtsM9Iiah07zkUx6Hw8YIFX9G01B2a1WhMvXKU6QPyqskww==
X-Google-Smtp-Source: AGHT+IFRK6e4k2MOX0J9ox/a2sxQ2lDwSrJBu79BMRcSqblA4JCx9qcm86MBdvNeZY/KJ9ldOAVCPQ==
X-Received: by 2002:a05:6512:138e:b0:52c:d80e:55a5 with SMTP id 2adb3069b0e04-5331c6e23e6mr6586612e87.41.1724068493602;
        Mon, 19 Aug 2024 04:54:53 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947799sm632064666b.177.2024.08.19.04.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 04:54:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperyasinak1@gmail.com,
	f_l_k@t-online.de,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] blueman: fix installation paths
Date: Mon, 19 Aug 2024 13:54:42 +0200
Message-ID: <20240819115442.3212142-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 11:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111849

* pass systemdsystemunitdir and systemduserunitdir to set correct directories
  instead of using libdir from:
  meson.build:systemd_base_path = join_paths(libdir, 'systemd')
  which is wrong e.g. with multilib where libdir might be /usr/lib64 instead of
  usr/lib used in ${nonarch_base_libdir} which is used by systemd_* variables:

  export systemd_system_unitdir="/usr/lib/systemd/system"
  export systemd_user_unitdir="/usr/lib/systemd/user"

  fixes:
  ERROR: Didn't find service unit 'blueman-mechanism.service', specified in SYSTEMD_SERVICE:blueman.

* inherit python3targetconfig to install into right python site-packages
  without this it installs into
  /usr/lib/python3.12/site-packages/
  instead of /usr/lib64/python3.12/site-packages set in PYTHON_SITEPACKAGES_DIR
  variable used in FILES, causing
  blueman: 295 installed and not shipped files. [installed-vs-shipped]

  # $PYTHON_SITEPACKAGES_DIR
  #   set oe-core/meta/classes-recipe/python3-dir.bbclass:11
  #     "${libdir}/${PYTHON_DIR}/site-packages"
  PYTHON_SITEPACKAGES_DIR="/usr/lib64/python3.12/site-packages"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-connectivity/blueman/blueman_2.4.3.bb        | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index c2bb4d24c6..42e20cc9ed 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-native"
 
-inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon-cache useradd features_check
+inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon-cache useradd features_check python3targetconfig
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
@@ -13,7 +13,10 @@ SRC_URI = "git://github.com/blueman-project/blueman.git;protocol=https;branch=2-
 S = "${WORKDIR}/git"
 SRCREV = "7bcf919ad6ac0ee9a8c66b18b0ca98af877d4c8f"
 
-EXTRA_OEMESON = "-Druntime_deps_check=false"
+EXTRA_OEMESON = "-Druntime_deps_check=false \
+    -Dsystemdsystemunitdir=${systemd_system_unitdir} \
+    -Dsystemduserunitdir=${systemd_user_unitdir} \
+"
 
 SYSTEMD_SERVICE:${PN} = "${BPN}-mechanism.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
@@ -40,8 +43,8 @@ PACKAGECONFIG[polkit] = "-Dpolicykit=true,-Dpolicykit=false"
 FILES:${PN} += " \
     ${datadir} \
     ${systemd_user_unitdir} \
+    ${systemd_system_unitdir} \
     ${PYTHON_SITEPACKAGES_DIR} \
-    ${prefix}${systemd_system_unitdir} \
 "
 
 # In code, path to python is a variable that is replaced with path to native version of it
-- 
2.46.0


