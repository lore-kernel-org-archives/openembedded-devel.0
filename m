Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.4969.1593630904575850994
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 12:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QM486psZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id o18so21730758eje.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2020 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VhY5FuN2oFH10b9lSLQ1LirZG62HUc9yf7jgR5LSp3A=;
        b=QM486psZl+zWTQCCXjTntHdW2fM+sDW3i46gmO43gEkuUfx+MvAclxS0kp+5E8Q03u
         TPyxux7PZAirtXnqWm+zEJ+CRAeMPUojr0iO2620Vge2PfwRIXhAPxCdlL69fXZjz8Po
         x3cW5i7yrXi5JO9GKmzT/RXTweVYi3Ok9ldBIduViix/ggRQz8f1NdbgoS+7RnGK77/f
         AhyMCckE8HINarYnLByNWW4uOHYtVU7d1ZR4kZ58Jl1GPDQl5Z8T2A033xuhlIZ8Ezwg
         txDNUJK8TWvpTOXMe38KBc1Q7agburG8nx6vkjCmb9nfF8BcfsXoCc4/FPxZYX1IGUKd
         IuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VhY5FuN2oFH10b9lSLQ1LirZG62HUc9yf7jgR5LSp3A=;
        b=j5t7Z8BaE+5M4bqVdNYenObemq3SV2dzxlST8yXmp1QVRDM8oO3FI4Fmzc5rxTUbFz
         ZRm6T5TuAM88+nAv3T5DgiB0kR/8znVw4PurWpM9dckolBIrJOaW94H8ZsiTayCQBgd+
         RwkqVucfbQ5z6bMsC+93dfjsIGrvB2cQ8md6RGkaD4n9pfT1XeOe5AKcPYBWYK+l2Hqc
         ok51s4vKnrw9eUg/2K8ZBQuv+KVW69KIIZ9sl3iBS0psSTuN4CrsFGb+AeZLmjJeEi9H
         C12WXlbkaeXmlAaw2OhAFw69y7RSvabmQd3rb5JA4fCJry2fQoPUx+Dg67niCRThhOek
         Ujdg==
X-Gm-Message-State: AOAM533sbiGFDOlzs311t1AuWNciu+jUgodzdV7HUXts1YZ2JgCTFS+4
	A6R0wF7uPPSCc9T9QE3ML/sOekMtIFM=
X-Google-Smtp-Source: ABdhPJwiStk5cdr7RHC5+HDcHlQNfMM+pRnsYVW419CZIn+kUg2wi3WO5wEViZAs0979NC8qLOpPfg==
X-Received: by 2002:a17:906:f20d:: with SMTP id gt13mr18914492ejb.117.1593630902712;
        Wed, 01 Jul 2020 12:15:02 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2pfrec.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id n2sm7179549edq.73.2020.07.01.12.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 12:15:02 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH] firewalld: upgrade 0.7.3 -> 0.7.5
Date: Wed,  1 Jul 2020 21:14:46 +0200
Message-Id: <20200701191446.2909522-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See full changelogs
- https://github.com/firewalld/firewalld/releases/tag/v0.7.4
- https://github.com/firewalld/firewalld/releases/tag/v0.7.5

Make documentation build optional.

Delete RedHat specific modprobe config file.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../{firewalld_0.7.3.bb => firewalld_0.7.5.bb}        | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.7.3.bb => firewalld_0.7.5.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.3.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.5.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.7.3.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.7.5.bb
index 4dea848f4..fbf586f76 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.3.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.5.bb
@@ -8,16 +8,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://firewalld.init \
 "
-SRC_URI[md5sum] = "05ec772cbdc0a2b3df081e4beca5599d"
-SRC_URI[sha256sum] = "414c46202c12334cd5c986214e5e2575d18e743c5531a97ace1c0cd94341c60d"
+SRC_URI[md5sum] = "b1aeede85a72adcf4f79d98019811244"
+SRC_URI[sha256sum] = "45a8a7dbc084ef56ce306154d3834922e7f1fc2bf11b6c821f579cad51313226"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
-DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheets-native"
+DEPENDS = "intltool-native glib-2.0-native"
 
 inherit gettext autotools bash-completion python3native gsettings systemd update-rc.d
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd"
+PACKAGECONFIG[docs] = "--with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog,--disable-docs,libxslt-native docbook-xsl-stylesheets-native"
 
 PACKAGES += "${PN}-zsh-completion"
 
@@ -37,7 +38,6 @@ EXTRA_OECONF = "\
     --without-ebtables \
     --without-ebtables-restore \
     --disable-sysconfig \
-    --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog \
 "
 
 INITSCRIPT_NAME = "firewalld"
@@ -62,6 +62,9 @@ do_install_append() {
     fi
     sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g \
         ${D}${bindir}/* ${D}${sbindir}/* ${D}${sysconfdir}/firewalld/*.xml
+
+    # This file contains Red Hat-isms. Modules get loaded without it.
+    rm -f ${D}${sysconfdir}/modprobe.d/firewalld-sysctls.conf
 }
 
 FILES_${PN} += "\
-- 
2.25.4

