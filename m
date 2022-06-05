Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E451C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 09:35:36 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.19014.1654421733570921016
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jun 2022 02:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M/VzCjMV;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id q1so12856083ljb.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jun 2022 02:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oT9kSWqWe15Sj1nOTYfZYApdvKDKMjHPK4D07Z7Ns7A=;
        b=M/VzCjMVfdNfhtp8B/PRK6kJwfur/KpTAJ7PVtStFTB9z/LlADqNXmEgnspGrlCeXr
         e/KiGec/lpoyKENSB1Bo38glKz82MflfB0QPClymI00uoaUeeUV6wFbNleHzek+1WKhL
         c+YOoTNtwa/J7pYQrjW4Srx8nSmBXC6Yh0nPL5MyEoJXPtmuWpRah8qgWaJzEvuAxrGP
         pzvB6QGtrximLjoGKc5zPniNo9awaDBz6i52+pK74CLYZD9tJW9JJkcwGe5ZGv6mpA+4
         RNQMjHa6OuNqZkz5unNNvCZO1LHOySR2MgHi+xq16KvObPcal5Uw9apcI8H5fUJPX4d5
         eyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oT9kSWqWe15Sj1nOTYfZYApdvKDKMjHPK4D07Z7Ns7A=;
        b=bcCimRhKRAu8i16R21pEW45bVr7IrYYm6Rp6J/sXILaMGGcACqzkVi+SIBTxkI8+Qv
         HXfN1j0ccVSuxfXn7M7jb2GYQFuNYaSHB++37ONT2MYkwCUqDCdGBzEVwZPmeM6QfXUB
         PXxXy2qMpSMAAQa0EnGYO8aIZbqcqPQBsujPakGqnY2dChyA7lqhyyj2A8+P4cLfVWuM
         CJWw6OolHDMCxZ0WH9XB+HcKww2rJMTqK+Jg+5ZCyEEj/0JrjhmV4LFtqhyf3+vQUQxm
         3HJnwVzk6d/gazu2kBVoFWxMuNuKAVIxuprfU8nB3jEK+h8fSqGHKLS4yDNFOLwJPcY8
         gFGw==
X-Gm-Message-State: AOAM5328KM8DTbCOCawJxdXMmG04w0uvWgRHShVKsZcj9d6y30eMCSrI
	8Aa70i8mMEk+VCEH1heCOTkIXn1Vn70=
X-Google-Smtp-Source: 
 ABdhPJyZHPDL95+lIgsOpzT5/TCRI4DpWed8ieIIxKwoKEDUX8Ph/o0nAs8oh+n67I7jCX/ceonFCg==
X-Received: by 2002:a2e:9b93:0:b0:255:7acf:e21b with SMTP id
 z19-20020a2e9b93000000b002557acfe21bmr7484663lji.419.1654421731245;
        Sun, 05 Jun 2022 02:35:31 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:230:9439:c99c:5ab4:c8e9:1c0a])
        by smtp.gmail.com with ESMTPSA id
 g28-20020a2eb5dc000000b00253dfbe2522sm2015349ljn.100.2022.06.05.02.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 02:35:30 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-multimedia] [PATCH V1 1/1] bluealsa: uprev to 4.0.0
Date: Sun,  5 Jun 2022 11:35:22 +0200
Message-Id: <20220605093522.30964-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220605093522.30964-1-liu.ming50@gmail.com>
References: <20220605093522.30964-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jun 2022 09:35:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97413

From: Ming Liu <liu.ming50@gmail.com>

Some recipe changes have been made as well as follows:
- Dont install bluealsa.service from recipe, use the bluealsa.service
  from bluez-alsa source. In bluez-alsa 4.0.0, two more autoconf
  options have been added: --with-systemdbluealsaaplayargs and
  --with-systemdbluealsaargs that could be used to pass bluealsa
  and bluealsa-aplay arguments to systemd services.
- Drop some useless FILES varialbes.
- Add more PACKAGECONFIGs, explicitly disable the codecs that not
  supported by Yocto, this is to get a predictible build.
- Split out bluealsa-aplay to its own package and disable
  bluealsa-aplay.service by default, since bluez-alas can be used
  in many different ways, there is no default usage for it, like sink
  (BT speaker).

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../bluealsa/bluealsa_git.bb                  | 69 +++++++++++++------
 1 file changed, 48 insertions(+), 21 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
index 674017606..edd97afe0 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
@@ -5,35 +5,62 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=72d868d66bdd5bf51fe67734431de057"
 
-DEPENDS += "alsa-lib bluez5 glib-2.0 sbc"
+SRC_URI = "git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master"
 
-SRCREV = "aac8742a9e7dd12a1fead9cbce7d2dc8b961999c"
-
-SRC_URI = " \
-    git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master \
-    file://bluealsa.service \
-"
+SRCREV = "dd05a1baa261b94da9ba977b5e3392c8b4dc7a5e"
+PV = "4.0.0+git${SRCPV}"
 
 S  = "${WORKDIR}/git"
 
-PACKAGECONFIG[aac]  = "--enable-aac, --disable-aac,"
-PACKAGECONFIG[aptx] = "--enable-aptx,--disable-aptx,"
-PACKAGECONFIG[hcitop]   = "--enable-hcitop, --disable-hcitop, libbsd ncurses"
-PACKAGECONFIG[systemd]   = "--enable-systemd, --disable-systemd, systemd"
+DEPENDS += "alsa-lib bluez5 dbus glib-2.0 sbc"
 
-PACKAGECONFIG += "hcitop ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "aplay cli hcitop ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[a2dpconf]  = "--enable-a2dpconf,--disable-a2dpconf"
+PACKAGECONFIG[aac]  = "--enable-aac,--disable-aac,fdk-aac"
+PACKAGECONFIG[aplay] = "--enable-aplay,--disable-aplay"
+PACKAGECONFIG[cli] = "--enable-cli,--disable-cli"
+PACKAGECONFIG[coverage] = "--with-coverage,--without-coverage,lcov-native"
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
+PACKAGECONFIG[debug-time] = "--enable-debug-time,--disable-debug-time"
+PACKAGECONFIG[faststream] = "--enable-faststream,--disable-faststream"
+PACKAGECONFIG[hcitop] = "--enable-hcitop,--disable-hcitop,libbsd ncurses"
+PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
+PACKAGECONFIG[mp3lame] = "--enable-mp3lame,--disable-mp3lame,lame"
+PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123,mpg123"
+PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono,ofono"
+PACKAGECONFIG[payloadcheck] = "--enable-payloadcheck,--disable-payloadcheck"
+PACKAGECONFIG[rfcomm] = "--enable-rfcomm,--disable-rfcomm"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir} \
+                          --with-systemdbluealsaargs='${SYSTEMD_BLUEALSA_ARGS}' --with-systemdbluealsaaplayargs='${SYSTEMD_BLUEALSA_APLAY_ARGS}',--disable-systemd,systemd"
+PACKAGECONFIG[test] = "--enable-test,--disable-test,libcheck libsndfile1"
+PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,,upower"
 
 inherit autotools pkgconfig systemd
 
-FILES:${PN} += "\
-    ${datadir}/alsa/alsa.conf.d/20-bluealsa.conf\
-    ${libdir}/alsa-lib/libasound_module_ctl_bluealsa.so\
-    ${libdir}/alsa-lib/libasound_module_pcm_bluealsa.so\
+EXTRA_OECONF = " \
+    --disable-aptx \
+    --disable-lc3plus \
+    --disable-ldac \
+    --disable-manpages \
 "
 
-FILES:${PN}-staticdev += "\
-    ${libdir}/alsa-lib/libasound_module_ctl_bluealsa.a\
-    ${libdir}/alsa-lib/libasound_module_pcm_bluealsa.a\
-"
+PACKAGE_BEFORE_PN = "${PN}-aplay"
+RRECOMMENDS:${PN} = "${PN}-aplay"
+
+FILES:${PN}-aplay = "${bindir}/bluealsa-aplay"
+FILES:${PN} += "${libdir}/alsa-lib/*"
+
+SYSTEMD_PACKAGES += "${PN}-aplay"
+SYSTEMD_SERVICE:${PN} = "bluealsa.service"
+SYSTEMD_SERVICE:${PN}-aplay = "bluealsa-aplay.service"
+
+SYSTEMD_AUTO_ENABLE:${PN}-aplay = "disable"
+
+# Choose bluez-alsa arguments to be used in bluealsa systemd service
+# Usually could choose profiles with it: a2dp-source a2dp-sink hfp-hf hfp-ag hsp-hs hsp-ag hfp-ofono
+# Enable bluez-alsa arguments by default:
+SYSTEMD_BLUEALSA_ARGS ?= "-p a2dp-source -p a2dp-sink"
 
-SYSTEMD_SERVICE:${PN} = "bluealsa.service bluealsa-aplay.service"
+# Choose bluealsa-aplay arguments to be used in bluealsa-aplay systemd service
+# Defaults to be empty:
+SYSTEMD_BLUEALSA_APLAY_ARGS ?= ""
-- 
2.25.1


