Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.1366.1616178824540750575
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oYSU0bGk;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so5290590pjv.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 11:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DP64Uvu7nwr4UhjWvFIMwL7gTnb7q77YKw8glsZHywQ=;
        b=oYSU0bGkdVEiE1HQfFqq1C/ZVmcaqgAV4Sg+bosYVgLrq3skLA4vTGvmr43K8LRWO9
         9dixdo+9KYdmhPVSb5xHtpe+z8EqiMS/yoF9hl/yzAyhzBInwrDZ9zLlNSpU/X6HCzSm
         /OA+OCyybZkUaZfJqXikFCYReChUdlF5+Y/3iTK1qRdgUjkfa7RHquCtNhZtsAhgikSA
         /JUVgJiF0psK8TbyvIn2hnpSP34ea3aIWjnOx+sEyY/8auz1++K+LSrcXo5n5PtYtElC
         0P84eb9RQ0cITzRuvgmLfB/XHVlIszW+ZRzrk3NtMyabdifdGEy7CNfSCaQpdtJdZ0Vy
         zzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DP64Uvu7nwr4UhjWvFIMwL7gTnb7q77YKw8glsZHywQ=;
        b=DfhW7pElzd0F1Q5f0s5HpxrNYWpqJEyNpaqRJT/53GoE3qTccqX9q8WwVgBSRdHT2b
         PncKfZbf8IIZs0DTXK/vDjhxBj6sRoWj+2NlYmW2iKWlyQEbEqmPsxeNF6Uud6idZA9u
         JOOi4KTB7lC3Mi4JReF4S0HXDzamuBZWaDJhpCNs99VU8g9tdXiHpNGNRM8Kt/A/AJ8L
         ZbrYWMgqH1cbGAICPMi8yZBeofnipfWWyL/2dmAqic4b96vmYFBDIHvy/qXEnnJFUMx6
         STmmLmcieZvDollgyeJjeLQS36toMU80wHr3R0t7cSLbZ5kQv2BcIUpikbVffcOyl+TQ
         0spw==
X-Gm-Message-State: AOAM5314rbZKP6kELuxWjFCT+8IZZd5wuqWAR7lMAaMN06IMMQ7vfwGs
	+RKhvBFnRa1Ehm3jIxY3FtYuj1g2vWJQQA==
X-Google-Smtp-Source: ABdhPJxGR2FKM/+dp27BmKRhmhs8WVG2R7zz21zs5b2yIT0eWSoz3b2DrCzWpWdREtgQmKU/qH+RTw==
X-Received: by 2002:a17:902:47:b029:e6:cc11:8210 with SMTP id 65-20020a1709020047b02900e6cc118210mr12280244pla.20.1616178823575;
        Fri, 19 Mar 2021 11:33:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id f20sm6378216pfa.10.2021.03.19.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:33:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] links-x11,links: Upgrade to 2.22
Date: Fri, 19 Mar 2021 11:33:40 -0700
Message-Id: <20210319183341.1308949-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove devtool added comment

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/links/links-x11_2.20.2.bb | 53 -------------------
 .../recipes-support/links/links-x11_2.22.bb   | 29 ++++++++++
 .../links/{links_2.21.bb => links_2.22.bb}    |  8 +--
 3 files changed, 33 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-support/links/links-x11_2.20.2.bb
 create mode 100644 meta-oe/recipes-support/links/links-x11_2.22.bb
 rename meta-oe/recipes-support/links/{links_2.21.bb => links_2.22.bb} (68%)

diff --git a/meta-oe/recipes-support/links/links-x11_2.20.2.bb b/meta-oe/recipes-support/links/links-x11_2.20.2.bb
deleted file mode 100644
index 645fe3b264..0000000000
--- a/meta-oe/recipes-support/links/links-x11_2.20.2.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
-# The following is the difference between the old and the new license text.
-# Please update the LICENSE value if needed, and summarize the changes in
-# the commit message via 'License-Update:' tag.
-# (example: 'License-Update: copyright years updated.')
-#
-# The changes:
-#
-# --- COPYING
-# +++ COPYING
-# @@ -293,7 +293,7 @@
-#      <one line to give the program's name and a brief idea of what it does.>
-#      Copyright (C) <year>  <name of author>
-#  
-# -    on, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USAThis program is free software; you can redistribute it and/or modify
-# +    This program is free software; you can redistribute it and/or modify
-#      it under the terms of the GNU General Public License as published by
-#      the Free Software Foundation; either version 2 of the License, or
-#      (at your option) any later version.
-# 
-#
-
-require links.inc
-
-DEPENDS += "virtual/libx11"
-RCONFLICTS_${PN} = "links"
-
-inherit features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI += " file://links2.desktop \
-             http://www.xora.org.uk/oe/links2.png;name=icon"
-
-S = "${WORKDIR}/links-${PV}"
-
-EXTRA_OECONF = "--enable-graphics \
-                --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
-                --without-libtiff --without-svgalib --without-fb \
-                --without-directfb --without-pmshell --without-atheos \
-                --with-x --without-gpm"
-
-do_install_append() {
-    install -d ${D}/${datadir}/applications
-    install -m 0644 ${WORKDIR}/links2.desktop ${D}/${datadir}/applications
-    install -d ${D}/${datadir}/pixmaps
-    install -m 0644 ${WORKDIR}/links2.png ${D}/${datadir}/pixmaps
-}
-
-SRC_URI[md5sum] = "ee39e612249440d0497535d0dafc3c0e"
-SRC_URI[sha256sum] = "4b4f07d0e6261118d1365a5a5bfa31e1eafdbd280cfae6f0e9eedfea51a2f424"
-SRC_URI[icon.md5sum] = "477e8787927c634614bac01b44355a33"
-SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
diff --git a/meta-oe/recipes-support/links/links-x11_2.22.bb b/meta-oe/recipes-support/links/links-x11_2.22.bb
new file mode 100644
index 0000000000..563984c0eb
--- /dev/null
+++ b/meta-oe/recipes-support/links/links-x11_2.22.bb
@@ -0,0 +1,29 @@
+require links.inc
+
+DEPENDS += "virtual/libx11"
+RCONFLICTS_${PN} = "links"
+
+inherit features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI += " file://links2.desktop \
+             http://www.xora.org.uk/oe/links2.png;name=icon"
+
+SRC_URI[sha256sum] = "0364986b3a7f1e8e3171bea362b53f71e1dd3360a8842d66fdc65580ebc2084d"
+SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
+
+S = "${WORKDIR}/links-${PV}"
+
+EXTRA_OECONF = "--enable-graphics \
+                --with-ssl=${STAGING_LIBDIR}/.. --with-libjpeg \
+                --without-libtiff --without-svgalib --without-fb \
+                --without-directfb --without-pmshell --without-atheos \
+                --with-x --without-gpm"
+
+do_install_append() {
+    install -d ${D}/${datadir}/applications
+    install -m 0644 ${WORKDIR}/links2.desktop ${D}/${datadir}/applications
+    install -d ${D}/${datadir}/pixmaps
+    install -m 0644 ${WORKDIR}/links2.png ${D}/${datadir}/pixmaps
+}
diff --git a/meta-oe/recipes-support/links/links_2.21.bb b/meta-oe/recipes-support/links/links_2.22.bb
similarity index 68%
rename from meta-oe/recipes-support/links/links_2.21.bb
rename to meta-oe/recipes-support/links/links_2.22.bb
index b6048c1d38..b738ce8bff 100644
--- a/meta-oe/recipes-support/links/links_2.21.bb
+++ b/meta-oe/recipes-support/links/links_2.22.bb
@@ -8,8 +8,8 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-libtiff --without-svgalib --with-fb \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
-
-SRC_URI[md5sum] = "b88a46733d6932442ed8a6b751aac6b4"
-SRC_URI[sha256sum] = "285eed8591c7781ec26213df82786665aaa1b9286782e8a7a1a7e2a6e1630d63"
-SRC_URI[icon.md5sum] = "477e8787927c634614bac01b44355a33"
+SRC_URI[sha256sum] = "0364986b3a7f1e8e3171bea362b53f71e1dd3360a8842d66fdc65580ebc2084d"
 SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
+
+TOOLCHAIN = "gcc"
+LDFLAGS += "-fuse-ld=gold"
-- 
2.31.0

