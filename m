Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.2047.1630529941475247216
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 13:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U+KXctSp;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t1so769844pgv.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Sep 2021 13:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxE0ZTiXWY5bNG5tPdJluhttQPDINM0E4vpw8eSzK7I=;
        b=U+KXctSp3+8DhBeVN4yinWLTMjDv2RNS5/nIBk+qRfmT7iM+PyqBJduQgjVoTR47Ag
         FJqMtvObgmbQqYEn59tBLTUHWxVmszbh5JQod/9RYpcahqPggpCJPf0FqiDwYrA0vh1r
         BXfG6f7UGMj6KN7FjWEiv74wI+hYGHfgF/vjqm+1TBSzedSbrEVRUXyvXk1gs0BgMGOK
         wnuVdOiG4f5w/S+vMFznDPEzhBK6NlM6tqpVvIe219Mz8lYMjBwd0PFOktqeQCGOGrV3
         MYf8m5wDwht5dJ137w2+/ZPraYGgQruPfzJ0yGRUkkq+GiRchGZWPoL9iIVn1NR1hz3e
         Hlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxE0ZTiXWY5bNG5tPdJluhttQPDINM0E4vpw8eSzK7I=;
        b=mARQtCxq2KMP/mp2Z91Wp+wOZmRKAY6jnIWjWtr2tiOFljz/9QwXl1d9AEb5syBz2P
         MCTCX72RTZTeyzMp5b9nVZWcONaC5o81ibJN/KeoHbDgIpcTgn4AiZSfr8C0Oc77Oz8A
         qyJ9VzYFr7LTSnOzFOD2H8Tthr/ajxfCmr8mCh8RG/bB7Pr59uxpjstOCpzLkvJgDXW8
         dqGIlTP/fHdOEKbWt9PdshbOr6xbREm4pQ5PL/6TOdrq1QC9k8eydRggjHQZEPpNpbdg
         YO18GuqKTpzQ87T9PRJXLLVdvrP/UESAhjFA+EPophh3OaK3i3fIg8QTUjbeL9OXSixM
         svDQ==
X-Gm-Message-State: AOAM53392KweLHvPtnwnVtyJ84DsWjepCbUhpBdb2tc3R7llH8UeRsZM
	/qNVBLSqr6ckEYpOWDXvEJAkBqw4QWKPIA==
X-Google-Smtp-Source: ABdhPJz5AQnhshK5hH7sEMoQfTjPxPe95nnEHhfjjJpgmgQYRaBM9xC9u6eRK30oLk9Lmj/W32//JA==
X-Received: by 2002:a63:5c51:: with SMTP id n17mr904611pgm.376.1630529940618;
        Wed, 01 Sep 2021 13:59:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id t15sm554753pgk.13.2021.09.01.13.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 13:59:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH v2 2/2] bluealsa: Add recipe
Date: Wed,  1 Sep 2021 13:58:56 -0700
Message-Id: <20210901205856.99727-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901205856.99727-1-raj.khem@gmail.com>
References: <20210901205856.99727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implementation of bluetoooth audio over alsa backend esepcially with
bluez5

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Move systemd dependency to be added only when systemd packageconfig
    is enabled

 .../bluealsa/bluealsa/bluealsa.service        | 11 ++++++
 .../bluealsa/bluealsa_git.bb                  | 39 +++++++++++++++++++
 .../packagegroup-meta-multimedia.bb           |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/bluealsa/bluealsa/bluealsa.service
 create mode 100644 meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb

diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/bluealsa.service b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/bluealsa.service
new file mode 100644
index 0000000000..671815e031
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa/bluealsa.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Bluetooth Audio ALSA Backend
+After=bluetooth.service
+Requires=bluetooth.service
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/bluealsa
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
new file mode 100644
index 0000000000..674017606e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/bluealsa/bluealsa_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Bluetooth Audio ALSA Backend"
+HOMEPAGE = "https://github.com/Arkq/bluez-alsa"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=72d868d66bdd5bf51fe67734431de057"
+
+DEPENDS += "alsa-lib bluez5 glib-2.0 sbc"
+
+SRCREV = "aac8742a9e7dd12a1fead9cbce7d2dc8b961999c"
+
+SRC_URI = " \
+    git://github.com/Arkq/bluez-alsa.git;protocol=https;branch=master \
+    file://bluealsa.service \
+"
+
+S  = "${WORKDIR}/git"
+
+PACKAGECONFIG[aac]  = "--enable-aac, --disable-aac,"
+PACKAGECONFIG[aptx] = "--enable-aptx,--disable-aptx,"
+PACKAGECONFIG[hcitop]   = "--enable-hcitop, --disable-hcitop, libbsd ncurses"
+PACKAGECONFIG[systemd]   = "--enable-systemd, --disable-systemd, systemd"
+
+PACKAGECONFIG += "hcitop ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+inherit autotools pkgconfig systemd
+
+FILES:${PN} += "\
+    ${datadir}/alsa/alsa.conf.d/20-bluealsa.conf\
+    ${libdir}/alsa-lib/libasound_module_ctl_bluealsa.so\
+    ${libdir}/alsa-lib/libasound_module_pcm_bluealsa.so\
+"
+
+FILES:${PN}-staticdev += "\
+    ${libdir}/alsa-lib/libasound_module_ctl_bluealsa.a\
+    ${libdir}/alsa-lib/libasound_module_pcm_bluealsa.a\
+"
+
+SYSTEMD_SERVICE:${PN} = "bluealsa.service bluealsa-aplay.service"
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 5522731a29..7e581392b6 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -22,6 +22,7 @@ RDEPENDS:packagegroup-meta-multimedia = "\
 RDEPENDS:packagegroup-meta-multimedia = "\
     alsa-equal \
     aom \
+    bluealsa \
     caps \
     cdparanoia \
     dcadec \
--
2.33.0
