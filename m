Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.4111.1621157483686118513
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 02:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AVAMtjek;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id n25so3350842edr.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 May 2021 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4f+HFwDHG0QHW3DlrMQw0HOJE/oIEJFpUkPWocyKXy0=;
        b=AVAMtjekSb+YO4MUMd8/yrwyxv8ko3G2hajSMQ9RXFMeJb6k3WJN3cftcF/RG7Lllh
         rISSGKVf1n5Y7qecpDiNGWH5Xhx8bNyR/IUYfG7Sk2i8Z5W3Ipl61VqQT1N/9tQx4ilJ
         hGy+5EBuY8hJbzXO4DaGXyjijyDDzDBZNjjHm+a4/M7b9rkl882RJ9KlxxN0/dcIBnrC
         BafqaCVnZKgDgpg72bBPInAOhkKzaGf+ZEEPBd/KDXEDj0R2uBlHpUWJiLSa3R7toLdf
         S+yPq70efcFs8shRAVi+ryUFSiIQdHciJGJLM0C1OnRLLzreAOMYbXQQgpJnYoPJgqvL
         NnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4f+HFwDHG0QHW3DlrMQw0HOJE/oIEJFpUkPWocyKXy0=;
        b=PIlnYKntcWGfu62DIYwZccqda87xCz2DlWjs3+f6USO+gtD23HsJULcoeWGdi9LtTw
         PYH6bn6xyeYFre0PDJUBn0Ck7G77q7loJCnf9PT4s4IuW5xJZdSMu2A3GekLH0VtCwJD
         M4QrR4q3FTxPNZNNi4Tv6jkUpehA9m+stpzSqzhmPXR/7EvW/I1peHLKvGE1f53RLEgE
         /mIitsekvWhIS7OCEiCgX4BdHOSj9Q7zUMlXrRuZRYlPrDFP/o/9RjKiyneaC6p7wAai
         jgoduEsBqOGo8Wx4WiJdVeV4jhMnz3i/IDQZaLAduVVy9W6bn3qOl/iCUbgpXGB+aFVU
         6Mjw==
X-Gm-Message-State: AOAM530obdWJ39ai+qS3Z8q5EXMQ6irAppTnOSBXEygetLXbOUfXkFS6
	GHGeL0LMdbVA8okssRMlytY5KNooo9g=
X-Google-Smtp-Source: ABdhPJzW1LBzNf3Z7KwKsKjb7PAPXQHPmrWb8TAZ7rfv+7FULQ54MscydJ70tjDITZJ+LY6EzDTd6Q==
X-Received: by 2002:a05:6402:176f:: with SMTP id da15mr20052466edb.380.1621157482075;
        Sun, 16 May 2021 02:31:22 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f174d65c1ae51a678565703.dip0.t-ipconnect.de. [2003:f0:7f17:4d65:c1ae:51a6:7856:5703])
        by smtp.gmail.com with ESMTPSA id i6sm8679136eds.83.2021.05.16.02.31.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 02:31:21 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] meta-gnome: remove upstream-version-is-even from inherit on 40.x version recipes
Date: Sun, 16 May 2021 11:31:14 +0200
Message-Id: <20210516093114.824010-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_40.1.bb                  | 2 +-
 meta-gnome/recipes-gnome/gedit/gedit_40.1.bb                    | 2 +-
 .../recipes-gnome/gnome-calculator/gnome-calculator_40.1.bb     | 2 +-
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb      | 2 +-
 .../gnome-system-monitor/gnome-system-monitor_40.1.bb           | 2 +-
 meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb              | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_40.1.bb b/meta-gnome/recipes-gnome/evince/evince_40.1.bb
index 15fac9918..3b1a978c6 100644
--- a/meta-gnome/recipes-gnome/evince/evince_40.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_40.1.bb
@@ -19,7 +19,7 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext mime-xdg gtk-doc
+inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection gettext mime-xdg gtk-doc
 
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
index 471a7f632..ee94cdd2a 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
     tepl \
 "
 
-inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg python3targetconfig
+inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check mime-xdg python3targetconfig
 
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_40.1.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_40.1.bb
index 5e6982714..ef96632bd 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_40.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_40.1.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = 'true'
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gobject-introspection gnome-help vala gtk-icon-cache gettext features_check upstream-version-is-even
+inherit gnomebase gobject-introspection gnome-help vala gtk-icon-cache gettext features_check
 
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
index 8a8306952..6b69c08eb 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
@@ -23,7 +23,7 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gettext upstream-version-is-even gnome-help features_check
+inherit gnomebase gettext gnome-help features_check
 
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_40.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_40.1.bb
index 7b80c74a2..ecc5a09a0 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_40.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_40.1.bb
@@ -15,7 +15,7 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check gettext upstream-version-is-even
+inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check gettext
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit"
 
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
index 09e075044..75fc03237 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_40.1.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
     libportal \
 "
 
-inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check upstream-version-is-even mime-xdg
+inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check mime-xdg
 
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
-- 
2.31.1

