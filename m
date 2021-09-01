Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.9524.1630509672875990074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 08:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XnDdml+1;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id e16so51714pfc.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Sep 2021 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZtdWWq9UMhQOpkEoxf/O0HOslrdJZfQ5eUWjdimFO4Q=;
        b=XnDdml+1vB5X9BS28t1H+TiBHQT4JtquyWL6fNUdQ0fj935QEWan9cdoeGSqYWQOm6
         rpxXYT7RckXkdVWlR18g7n9T4fikt8CKVYPgxZ6xDvoi35B+hnbQhEgErR63xV8zEtLF
         0nNgqPYF13jTgHy4/ZWDty5dGOtTcbhIJO1oQeNPk7XdSz+5+BulxILrvg7Mu0spdtzO
         wNEWi0lDcsx/jhe+DGLzQfvCeEH1lrWTf+jSJzO1xdfX3yd989dNbUOqIYM5V3ksoiOU
         Or140THu20B4U0sVpOtYhRsanB0+WoISmpQsIdYmdYh9Qnk0QLeQpKMTn1VerngQpPXx
         hCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZtdWWq9UMhQOpkEoxf/O0HOslrdJZfQ5eUWjdimFO4Q=;
        b=QPkB5g9F7CvOouYIT7MX8y2rjx8FHfOjxg34jm7SylSRGtn9jNuYLzw4zjs9TTgw0l
         fQ0UndEWGWqMVjr3dAxA1Ng2TCbBxddYGA06DZ7RSKDN9pdSgdaBBTybdm95/6n44EJq
         2boyEW/161edvDNRx+X/5ClY46p/DPax968J40KVxt/U2gte/G6ZxHjWGCmjikSWVD9H
         /nNEOhgWn/4dJQFZQ+RYy9RZ0VkLAFPCrdAup7cRcXuohhQc3r1eREUnf1Yq3gYAHO+5
         7q9tH0aev55OHY9sBI8H85Ikp1zO9rbt5/cUY9D2bRMRE2rb7Xoul8xqY0pf+79TKXYt
         7wwQ==
X-Gm-Message-State: AOAM532LK4d/cXzQflqPY5Q+HvpLx9XNhiRM7uy0G7Frd/SyZg2xJ3V1
	4Rqqc12nn4gK1WBua2aWFy2ZQC3yP7h+nQ==
X-Google-Smtp-Source: ABdhPJxkOnOTSeqJTfhSmCnpD5MnhwAyYcMxoDNT/iCu7k24tFd91OJ4rY1m1Z72vog22Q2lXQ3yIA==
X-Received: by 2002:a63:4614:: with SMTP id t20mr14422pga.372.1630509672070;
        Wed, 01 Sep 2021 08:21:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id r15sm326489pfh.45.2021.09.01.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 08:21:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] bluealsa: Add recipe
Date: Wed,  1 Sep 2021 08:21:08 -0700
Message-Id: <20210901152108.24811-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901152108.24811-1-raj.khem@gmail.com>
References: <20210901152108.24811-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implementation of bluetoooth audio over alsa backend esepcially with
bluez5

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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
index 0000000000..058bafc2cc
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
+DEPENDS += "alsa-lib bluez5 systemd glib-2.0 sbc"
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
+PACKAGECONFIG[systemd]   = "--enable-systemd, --disable-systemd,"
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
