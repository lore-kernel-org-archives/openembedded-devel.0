Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F69C43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 09:35:29 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.8403.1654335328338248283
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jun 2022 02:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JxCG5Sii;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id r8so10283711ljp.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jun 2022 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oT9kSWqWe15Sj1nOTYfZYApdvKDKMjHPK4D07Z7Ns7A=;
        b=JxCG5SiiD6NvyQxMmUfFf4+UPuSEmwrjv/X3DbbA3ijteHEXQ2nPO+HinB2lcOjyLa
         VqmmhKyo+yYvredt1l7SupGFAdI+ZYRc2sUW0yB8RiSTpUD3OXdNwC1bRKQLB9Gz6L3e
         Gk+pKbT0W2IJsIJNiKEZ01oCTSMc+KCa6hIK6Urruno/nohRQnTB/rZqBRJ10bMBoVvV
         gLisVMbzVlbfFgezDCZnLlGN/dSQ9FxrwotZVD+yHeZgvcn3THI10kxYDe7cnn0B8rjF
         SV3UuCWHd1XZZuPnab6YO4pVdJOM9kBdUtTYH+O5f1v2Zxmss7UC+GtbKauradg/Xo+K
         OCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oT9kSWqWe15Sj1nOTYfZYApdvKDKMjHPK4D07Z7Ns7A=;
        b=0N5AiPDH/0WeEKVetv1hwSW/u86cJP+/DPudfsE/GbwGahITOjO6Wc0iI4Mr9if2aM
         1AT9EJEFsun6MwtfI+pRzKYyf92i2IMTcV8Idpe7GyOfiatgvTXXD8cHHX2kdUTn184X
         pnfSXvfa7Z/Tbrw8QmETDrcduV+vNJwI1SkNgaCLWapvKawp4DnH6tVZFnCl1AJxQdux
         CwPRule4cBibNZGVygMaqMvJm78x6pYMzR+o9BkynEZDLOxga2ntC/LL8B7b6IuriixG
         JwzbmpTw67YqtGTEmymOnPZAVBs/ENPD8lI99sTkgxYJnCwbSggcBVp9IIZEp86vcRrx
         aBCA==
X-Gm-Message-State: AOAM533cjd0YypJcNWEVQ+TfUSFJsk8zpW5r0lHY2jaCslPoRBJ0xOGb
	5LV+781KWUrVwKgdXza0td7m2SKGrd4=
X-Google-Smtp-Source: 
 ABdhPJz4PrQhV5jl+wvU7rMijqAletDnvmGf+6vBDrmjfVaJfpAyrmeF3e190fc9PohxfqXUDjsUow==
X-Received: by 2002:a2e:6a10:0:b0:253:e02a:94c6 with SMTP id
 f16-20020a2e6a10000000b00253e02a94c6mr40236837ljc.460.1654335326014;
        Sat, 04 Jun 2022 02:35:26 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:230:9439:bc15:d6de:b236:e4dc])
        by smtp.gmail.com with ESMTPSA id
 a12-20020a19ca0c000000b0047915250d98sm1099755lfg.272.2022.06.04.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 02:35:25 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-multimedia] [PATCH] bluealsa: uprev to 4.0.0
Date: Sat,  4 Jun 2022 11:35:18 +0200
Message-Id: <20220604093518.30749-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jun 2022 09:35:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97410

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


