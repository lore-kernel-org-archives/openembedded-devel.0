Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.294.1597264899736565593
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p3AmnYeG;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id ep8so1706343pjb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Iwf0ejCqjjQNfwgDYpJdMI5kIclZR954ZAbb6hH6ujU=;
        b=p3AmnYeGKHKdypotIPlm9TmXCybG4Rq1/RvaMzzqN5Qw3F+q0Wxt7+hb8/+fFKRTt6
         /oAa9oElblncc76YrDKc5LVElD+99pMIeCDhGfQhknICWipND/5Ct3HuXNFNJnGZKdw1
         QHJ2WxD9QX+g1nQzKP4Tsco2EwEXPO0M1bXVKr909d+KXdsJwJoQdAJ/4pd4Cao5ly4x
         pqV5Zcq/C3m4HXJ/4sODTRXed9bINd9p06NLoPBVgfmqyK/NqwE74IZZQHRMiGwg0vUf
         olaMlel4vwNn99RUoMfjrVZZcK+cf/XbD8KA4rB9qRYWFIqr+bT4YxzWtq9c2qe9/aly
         h8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iwf0ejCqjjQNfwgDYpJdMI5kIclZR954ZAbb6hH6ujU=;
        b=CkMVDgxormVdW6Vw71AoF52p+ljMSqVfpwhyXvgz/tsVUscO5w4bMH+f7DUUNSQpE8
         arboV9vB+VSBKNnC5Nj8Br22LfrFe7vic+7xJvEAmfgzeUQhFXK21mrpRiZRJyd/Q3Gi
         hgUMRd9E1DsrtUXYlHHkUl9c14UIbI9H1XlfYB0dMRny5HEH7JieMQVAM7lBTIDy919F
         swRu/9vhNkCNgPMxtQ+/2XHsi/OsMcF/hAuGWQGgEypU6dPwwo/HoG6e1D5PS4+tRtG+
         0krg6dpwU4XJTYF232lr1c44mqFUWyJMXkP6QE7Fut0YFdiXLaNUiPoAuxvyxrFR0xP4
         C/7Q==
X-Gm-Message-State: AOAM533KUrUK4q4idcHkQmWGcVJHRvZZXZy4umG0NuAe5KosT2LhKtd5
	FE3fvsQy9Ef7Q6O/bPYRP5aIo1PyTmM=
X-Google-Smtp-Source: ABdhPJy0wE5/cq+fZDVouKwzWxm2ngVArhuYHFYkwNwQFlhPV5oSreP3ntWVuiOSMtHSjar9SNxemw==
X-Received: by 2002:a17:90a:c7cb:: with SMTP id gf11mr1784871pjb.108.1597264898483;
        Wed, 12 Aug 2020 13:41:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 08/18] iscsi-initiator-utils: Upgrade to _2.1.2
Date: Wed, 12 Aug 2020 13:41:20 -0700
Message-Id: <20200812204130.1012160-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Makefile-Do-not-set-Werror.patch     | 31 +++++++++++++++++++
 ....1.0.bb => iscsi-initiator-utils_2.1.2.bb} |  9 ++----
 2 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.0.bb => iscsi-initiator-utils_2.1.2.bb} (96%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
new file mode 100644
index 0000000000..d5e0deb899
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
@@ -0,0 +1,31 @@
+From 31d88f46bfc67de2659991674253a5d5dfb92afc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 12:00:29 -0700
+Subject: [PATCH] Makefile: Do not set -Werror
+
+clang finds more warnings which causes build to fail, disable treating
+warning as errors
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usr/Makefile b/usr/Makefile
+index 21bb154..0018605 100644
+--- a/usr/Makefile
++++ b/usr/Makefile
+@@ -35,7 +35,7 @@ endif
+ PKG_CONFIG = /usr/bin/pkg-config
+ 
+ CFLAGS ?= -O2 -g
+-WARNFLAGS ?= -Wall -Wextra -Werror -Wstrict-prototypes -fno-common
++WARNFLAGS ?= -Wall -Wextra -Wstrict-prototypes -fno-common
+ CFLAGS += $(WARNFLAGS) -I../include -I. -D_GNU_SOURCE \
+ 	  -I$(TOPDIR)/libopeniscsiusr
+ CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.0.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
similarity index 96%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.0.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
index 97b5563574..254362881b 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.0.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
@@ -12,9 +12,10 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV ?= "549f8987be49583bb06b117a364bea3a8fc5250c"
+SRCREV ?= "802688debcd88c48edabe86deb7e7ed47ebadc26"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
+           file://0001-Makefile-Do-not-set-Werror.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
            file://iscsi-initiator \
@@ -23,9 +24,6 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi \
            file://set_initiatorname \
            "
 S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-
-PV .= "+git${SRCPV}"
 
 inherit update-rc.d systemd autotools pkgconfig
 
@@ -34,7 +32,7 @@ EXTRA_OECONF = " \
     --host=${BUILD_SYS} \
 "
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', '--without-systemd',     d)}"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', '--without-systemd NO_SYSTEMD=1',     d)}"
 
 EXTRA_OEMAKE = ' \
     OS="${TARGET_SYS}" \
@@ -43,7 +41,6 @@ EXTRA_OEMAKE = ' \
     MANDIR="${mandir}" \
     OPTFLAGS="-DNO_SYSTEMD ${CFLAGS}" \
     PKG_CONFIG="${STAGING_BINDIR_NATIVE}/pkg-config" \
-    NO_SYSTEMD=1 \
 '
 
 
-- 
2.28.0

