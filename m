Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.663.1614719011733864913
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 13:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qw2IW2rT;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d8so2334545plg.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 13:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2xfs26TVewDZZYVu7vAzIy6UlzopzvABtwEy616ROkc=;
        b=qw2IW2rTNt70kIz0KB/zlL16Al4c8/iVzoVQhNDCvDlsaRv5xwqW+edOqAetH9cjaI
         dQEpyJgcPrCbgPfuKuMeAVDAn3rfX57fbrrOOeAD8Z7ZBAcGIP87rgFbdVVujgPQ5jiq
         dPu+W1STlLTcjHHUgXOGwz4zNSNryhwyU9xuxGV/X52S6jbh8Y4v0DSSYjSAQL8eSj/3
         ctSOQ6I6xEHNvSv/S7u/Jy6uZATmoIMB/dToteocjWJM4Iz7QyXYbkZuuli3TvYyjl3P
         eeioq5Kex3s/+NSR0tlUH4Pkqf1N+sy2QnhhqBBzQXgZJRzu2YBovFyfrWUK6yOIWd7U
         13yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2xfs26TVewDZZYVu7vAzIy6UlzopzvABtwEy616ROkc=;
        b=Y573bhdKA+PzZnd/k+CT9WQ4M8VVWsmDcRD4JsE4vQv5U12E7ezm2L9Z4zC+7M8KpJ
         a+S/1OUJq3JZuZIQC6uMh6G4D0lsbOMEtb1FnM265GZZcaskeYvAH86JFLwDffHs+USj
         24CdbdJZoDv04g2UmRLsIN86DabvEBjl3BzWEApNrnbSguDWHhfRo2Be2W5SJVJRJQUi
         bR6MRRvdpchUWpLXtwfc+kfJu3sAebTHyo5S7DjqSADKdt6Prlfyfg3XfGHK87NLOxMb
         HGT2FvWMrqswQUE9a4/VVfjA79fcqvY+oLkSiK5bo1djy+VqTMwgunh7wGXLABLUOCls
         M/eA==
X-Gm-Message-State: AOAM5302RD/So5iH00Pol3oxqPHAvrRT/QvOtYICwYapGpaLTep5Gl5v
	5Cf1Nvz9W9X50NeoWfLcdErG06lD1f0KFw==
X-Google-Smtp-Source: ABdhPJz79sc2cypT9rcjOeVu84GYvG5DC2MIMh/8zmX1r3X0lvrZxjFonLliKLFt/PSDuFVgUMXhvw==
X-Received: by 2002:a17:90b:1a8f:: with SMTP id ng15mr6250053pjb.186.1614719010788;
        Tue, 02 Mar 2021 13:03:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id z137sm23455607pfc.172.2021.03.02.13.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 13:03:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mpich: Upgrade to 3.4.1
Date: Tue,  2 Mar 2021 13:03:26 -0800
Message-Id: <20210302210327.1143245-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add fixes to work with/with-out X

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.2.bb   | 47 -------------------
 meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb | 18 +++++--
 2 files changed, 13 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_3.2.bb

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.2.bb b/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
deleted file mode 100644
index 51b313cef4..0000000000
--- a/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "Message Passing Interface (MPI) implementation"
-HOMEPAGE = "http://www.mpich.org/"
-SECTION = "devel"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2106f0435056f3dd9349747a766e5816"
-
-SRC_URI = " \
-    http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "f414cfa77099cd1fa1a5ae4e22db508a"
-SRC_URI[sha256sum] = "0778679a6b693d7b7caff37ff9d2856dc2bfc51318bf8373859bfa74253da3dc"
-
-RDEPENDS_${PN} += "bash perl libxml2"
-S = "${WORKDIR}/${BP}"
-
-EXTRA_OECONF = "--enable-debuginfo \
-    --enable-fast \
-    --enable-shared  \
-    --with-pm=gforker  \
-    --disable-rpath \
-    --disable-f77 \
-    --disable-fc \
-    --disable-fortran \
-    --disable-cxx \
-    BASH_SHELL='${USRBINPATH}/env bash' \
-    PERL='${USRBINPATH}/env perl' \
-"
-
-inherit autotools-brokensep gettext
-
-do_configure_prepend() {
-    for d in confdb test/mpi/confdb src/openpa/confdb src/pm/hydra/confdb src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb src/mpl/confdb src/mpi/romio/confdb;  do
-        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
-        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
-    done
-
-    autoreconf --verbose --install --force -I . -I confdb/ -I maint/
-    oe_runconf
-    exit
-}
-
-do_install_append() {
-    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
-    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
-}
diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
index e5f36a5140..77e080c8b8 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
@@ -19,10 +19,18 @@ EXTRA_OECONF = "--enable-debuginfo \
     --disable-fc \
     --disable-fortran \
     --disable-cxx \
-    --with-device=ch4:ucx \
+    BASH_SHELL='${USRBINPATH}/env bash' \
+    PERL='${USRBINPATH}/env perl' \
+    --with-device=ch3:nemesis \
+    --with-rdmacm=no \
     --disable-numa \
 "
 
+PACKAGECONFIG += " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+"
+PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
+
 inherit autotools gettext pkgconfig
 
 do_configure() {
@@ -33,10 +41,10 @@ do_configure() {
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
     done
-    cd ${S}
-    autoupdate
-    autoreconf --verbose --install --force
-    cd ${B}
+#    cd ${S}
+#    autoupdate
+#    autoreconf --verbose --install --force
+#    cd ${B}
     oe_runconf
 }
 
-- 
2.30.1

