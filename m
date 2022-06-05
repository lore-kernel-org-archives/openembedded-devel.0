Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97600CCA47B
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 09:46:56 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.19092.1654422414837747788
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jun 2022 02:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z6+vQKG3;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id n10so23765158ejk.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jun 2022 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9eT8BSrPfx8XAF1dVfTrm+hdtz/y6awihMY+e2nDTQw=;
        b=Z6+vQKG3q8x59P+2kLVLdtA7AX+dQCywjmA5Ln03gyFV+nm/Ge9DFkxQcepO/uSuSs
         6J1Swp8AuHivph4fDFyNjkA9GgVZa0hrdbCAkREHjaViZpOqcMdvrhJFehKuZKVt8UJl
         A3rteD/g2BnOJBBNY7w1YaSIo4A+ehzsi7MagOpcq1EzZHD1hGEDPkQeUDhpfeszHELK
         LxvE+u5zmJve9OQG9AJNsIivzWW/JtyOQ+l/EgBFC18wzqQqXHdUTJhEVGdZiWeY4pY5
         yl6RTptfrKF+60Xncb3c3kimamTc0T5SDeMds7TkoGICJ3G8TPSjVRBzRbHm7Tne3li9
         D7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9eT8BSrPfx8XAF1dVfTrm+hdtz/y6awihMY+e2nDTQw=;
        b=yRzwggv7ud1OSeQVDPLEw22KHzVOivZXiQmRsN4sg3r0tpxBSiW3oIiqctkzCEyHtQ
         fRuQbngE2cwVem2eQanVxijEED3Gl1UEdVavN6c13ALpLEMxB74rLyJUOdaVtdOPbH1+
         3wNeQthDaZyrMgyd5x7eChvPfhRqQ+GAGsF171mD2z4bq/FD5ZcDKWOvsjbHSrnZbCO+
         v7eoYuKfhdjtGvCG2IyP9rdf1UHjLll+xU7EzuyBi8EudZ9V8ZewKzga76bg8OeTSEhY
         zkpiJMg5pPkFzo1z3WIfOAb8TZzrx5f+BvazVOY1XikzDAEROppZcotu7HnFhBewhwpj
         UXOg==
X-Gm-Message-State: AOAM531Gup/ZzNfBhk0iU1kh7RFIa9TlfKYZfNKZuvLtogPdvL8FSovb
	6i1/KEG0SF/gnKpoOLILZMu6U2B69dA=
X-Google-Smtp-Source: 
 ABdhPJyIEfaARS9khxMl7Xu1L1nurmc2FtIfO96kZPh7vkVxztKlXZ4SmY++9zsTIpPOhhVXCve8rw==
X-Received: by 2002:a17:907:94d2:b0:710:c164:5e99 with SMTP id
 dn18-20020a17090794d200b00710c1645e99mr6048412ejc.337.1654422412792;
        Sun, 05 Jun 2022 02:46:52 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:230:9439:c99c:5ab4:c8e9:1c0a])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a17090791c400b007109b15c109sm1813708ejz.66.2022.06.05.02.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 02:46:52 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-multimedia] [PATCH V2 1/1] bluealsa: uprev to 4.0.0
Date: Sun,  5 Jun 2022 11:46:45 +0200
Message-Id: <20220605094645.190874-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220605094645.190874-1-liu.ming50@gmail.com>
References: <20220605094645.190874-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jun 2022 09:46:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97415

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
 .../bluealsa/bluealsa/bluealsa.service        | 11 ---
 .../bluealsa/bluealsa_git.bb                  | 71 +++++++++++++------
 2 files changed, 49 insertions(+), 33 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/bluealsa/bluealsa/bluealsa.service

diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/bluealsa.service b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/bluealsa.service
deleted file mode 100644
index 671815e03..000000000
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/bluealsa.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Bluetooth Audio ALSA Backend
-After=bluetooth.service
-Requires=bluetooth.service
-
-[Service]
-Type=simple
-ExecStart=/usr/bin/bluealsa
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
index 674017606..ab0d8bca9 100644
--- a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
@@ -3,37 +3,64 @@ HOMEPAGE = "https://github.com/Arkq/bluez-alsa"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=72d868d66bdd5bf51fe67734431de057"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8449a4f133a93f6254b496d4fb476e83"
 
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


