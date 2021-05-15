Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.591.1621121948117367831
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 16:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AN887eWv;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id di13so2643390edb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 16:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwWTTyelqboQGGadaqsm7T4CQsZ74adGZP9iHt8cyDw=;
        b=AN887eWvEWbOlbAZPjQSP+9kAIvGNyyCUEeBPjlrMWJhbqU68xTySEF73MnhpSFYKg
         sBt7sz7bnC9h0+k55a0/vXd1f5uixVk/3zfh7m6MwNx8zPSCvMXkP4uTg70q/60rH8vE
         rnlEOqZQXDeodxwbQMKy7PSXzoQWwYPOcs0PtoMWtjsT+VQm1vLqFNAHZ9JCMf7g9B+t
         lTbn/oUqNrjtiYr9EIg7uf43cX1WH0yPK4ZmvH3cYH3xVjo4laRrFSwSUiTbS3yx41p0
         9pko+Gnr5FrzEkd8YFYSVMd0ZaiJiWvIdxBKY1p7Nmij+6Z1hQCIuChgjYtrBpVYI1lu
         JcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwWTTyelqboQGGadaqsm7T4CQsZ74adGZP9iHt8cyDw=;
        b=JN6OQx84JoqGpxc65su4DXpzMRTk3tP09izQauJfA1y2fIrrS/zbxVmMXrzNkS9nCh
         8KStzD5cKlXC4/+FZkV7wIp08n0ivMis47Q21kIqDdVkeQBgQIMcKnaFrQDbcXuqyVsY
         jvsQ5HXcOtiLaX1VH6RtvBenY0DtMNNZN8nG1qKgXTP9kqhVBUvBY8n2kzdIq/lDNYC7
         R75/22t5137hYN3OmEORWPJWrXp9NEQ4tsUCMSlZGXuKmVK+b5TCdxcJmgmE7xG9zDiA
         r5T9K12R+ftu1ZE6zTsiS7/LxY2LOAoVLsdUFFWruQNZdt4D7c0Cvgwd9cJ3RW/nRgGf
         Rb0Q==
X-Gm-Message-State: AOAM530lalD0SfeIAsx5azDvnED8VGnheXsYCIIX/3BzZMRuIEMvnfC7
	AvuQZDRCFrUddrNlU1T1OOCyi/gfrEY=
X-Google-Smtp-Source: ABdhPJyj9syFdvmNsGy60bWp77iyoVTQ2ME2SnyNz085NIBYbbUicHZFw/awF5XjpIOmNtc9e+hbaQ==
X-Received: by 2002:a50:9558:: with SMTP id v24mr3300856eda.264.1621121946488;
        Sat, 15 May 2021 16:39:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d19e31b0fdffece5e2b.dip0.t-ipconnect.de. [2003:f0:7f17:4d19:e31b:fdf:fece:5e2b])
        by smtp.gmail.com with ESMTPSA id r25sm7668986edv.78.2021.05.15.16.39.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 16:39:05 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/20] tracker: upgrade 2.3.6 -> 3.0.4
Date: Sun, 16 May 2021 01:38:34 +0200
Message-Id: <20210515233853.583490-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* huge bump is required for upcoming nautilus 40.1
* PACKAGECONFIGS have no meson option anymore so remove them

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{tracker_2.3.6.bb => tracker_3.0.4.bb}    | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_2.3.6.bb => tracker_3.0.4.bb} (59%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_2.3.6.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.0.4.bb
similarity index 59%
rename from meta-gnome/recipes-gnome/tracker/tracker_2.3.6.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.0.4.bb
index 2c11976ca..82e3d006e 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_2.3.6.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.0.4.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = " \
 "
 
 DEPENDS = " \
-    libxml2-native \
     dbus-native \
     glib-2.0 \
     sqlite3 \
@@ -22,30 +21,32 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check
 
-SRC_URI[archive.sha256sum] = "bd1eb4122135296fa7b57b1c3fa0ed602cf7d06c0b8e534d0bd17ff5f97feef2"
+SRC_URI[archive.sha256sum] = "c120d81f2df94aa794b1a7953b55cfa46de318ed68e6f3b5ad4fce0c729c2483"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-PACKAGECONFIG ??= "fts"
-PACKAGECONFIG[networkmanager] = "-Dnetwork_manager=enabled,-Dnetwork_manager=disabled,networkmanger"
-# full text search requires sqlite3 build with PACKAGECONFIG[fts5] set
-PACKAGECONFIG[fts] = "-Dfts=true,-Dfts=false"
+# text search is not an option anymore and requires sqlite3 build with
+# PACKAGECONFIG[fts5] set (default)
 
 # set required cross property sqlite3_has_fts5
 do_write_config[vardeps] += "PACKAGECONFIG"
 do_write_config_append() {
     echo "[properties]" > ${WORKDIR}/meson-tracker.cross
-    echo "sqlite3_has_fts5 = '${@bb.utils.contains('PACKAGECONFIG', 'fts', 'true', 'false', d)}'" >> ${WORKDIR}/meson-tracker.cross
+    echo "sqlite3_has_fts5 = 'true'" >> ${WORKDIR}/meson-tracker.cross
 }
 
-EXTRA_OEMESON = "--cross-file ${WORKDIR}/meson-tracker.cross \
-                 -Dsystemd_user_services=${systemd_user_unitdir} \
+EXTRA_OEMESON = " \
+    --cross-file ${WORKDIR}/meson-tracker.cross \
+    -Dman=false \
+    -Dsystemd_user_services=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)} \
+    -Dsystemd_user_services_dir=${systemd_user_unitdir} \
 "
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-    ${libdir}/tracker-2.0 \
+    ${datadir}/tracker3 \
+    ${libdir}/tracker-3.0 \
     ${systemd_user_unitdir} \
 "
-- 
2.31.1

