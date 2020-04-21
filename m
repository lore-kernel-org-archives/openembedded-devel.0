Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.1470.1587513186749244997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2020 16:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.65, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: QB+neO4xiVv0S/NFgOeJkbY1G5KM/j5NFutsWyi4UIvDEcvUlO8vzwmkVCMylvbj8GFvjWZmQW
 R8J5rWxUozHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2020 16:53:05 -0700
IronPort-SDR: 8zWhOa0QLQ4lbxJoc32ZbqrANbb4OES4MxmGx0nZ28T+2b8NbFj4KSsUhqag59DoN4qWNIQ7zz
 fgj+3YOk1nYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; 
   d="scan'208";a="255453852"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga003.jf.intel.com with ESMTP; 21 Apr 2020 16:53:05 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [meta-oe][PATCH] icewm: upgrade 1.5.5 -> 1.6.5
Date: Tue, 21 Apr 2020 16:52:50 -0700
Message-Id: <20200421235250.3274-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add additional DEPENDS on libxcomposite, libxfixes, libxdamage
Add update-alternatives similar to xfce-session from meta-xfce

For release notes and changes see:
https://github.com/ice-wm/icewm/releases/

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../icewm/{icewm_1.5.5.bb => icewm_1.6.5.bb}      | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/icewm/{icewm_1.5.5.bb => icewm_1.6.5.bb} (76%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb b/meta-oe/recipes-extended/icewm/icewm_1.6.5.bb
similarity index 76%
rename from meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
rename to meta-oe/recipes-extended/icewm/icewm_1.6.5.bb
index 887a32d52f..241a2b30f3 100644
--- a/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_1.6.5.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Ice Window Manager (IceWM)"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 
-SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[md5sum] = "6eba94a7935a0531d2c14eeb1426aeef"
-SRC_URI[sha256sum] = "f1c1344b20a9e8635143f70ee27930b55f813c15ca61f84d77584d311b6ac027"
+SRC_URI[sha256sum] = "d41e6abf842ff3f8705a81d352be7c5b181c587549c183de0641c3820234a7b2"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-inherit autotools pkgconfig gettext perlnative features_check qemu
+inherit autotools pkgconfig gettext perlnative features_check qemu update-alternatives
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
@@ -20,7 +19,9 @@ EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
                 --enable-xinerama \
                 --enable-shape"
 
-DEPENDS = "asciidoc-native fontconfig gdk-pixbuf libxft libxpm libxrandr libxinerama libice libsm libx11 libxext libxrender"
+DEPENDS = "asciidoc-native fontconfig gdk-pixbuf libxft libxpm libxrandr \
+    libxinerama libice libsm libx11 libxext libxrender libxcomposite libxdamage \
+    libxfixes"
 DEPENDS_append = " qemu-native"
 RDEPENDS_${PN} = "perl fribidi"
 
@@ -38,4 +39,8 @@ EOF
     ./qemuwrapper > src/preferences
 }
 
+ALTERNATIVE_${PN} = "x-session-manager"
+ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/icewm-session"
+ALTERNATIVE_PRIORITY_${PN} = "100"
+
 FILES_${PN} += "${datadir}/xsessions"
-- 
2.24.0

