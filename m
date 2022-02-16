Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C59C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 18:54:10 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.3337.1645037649677986384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 10:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nAbpBKNM;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso3213491pjh.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 10:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JYpjKVmHeXPwjQUjrWajHGC7MEgT4RQOhQwHbD3LOhY=;
        b=nAbpBKNMwhrJT/6IJTDejfNc5Isw/HHWVA8iMaDAcb7Br048DsdbEXvkz693Qk0MWZ
         QYMZIGHW0Q4SSX8iz2QOE2QpEgpSmUzjK2qq/+/2tHaaUzd7SZqM7oD/8zWqV6vM3cqs
         2Bj8J+Fcfiba1czjH04qO93VKeVtQm2fxQ0Y9S+vfZAWXyHm+t0YhjluF0bVnwtNSGXi
         VNryMmEEual22/dqtgMvICvwgWdV7V4B59LfXSLdN3q7tZ/s99pTSSv+9Vv1vQu2IRBp
         vOQoVbp1ZVKuhydOOVbwc74i15PKuCJ0ahZJ9ShaOYYHSha97LDAY6mFIB8qgyGRtDxy
         Q9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JYpjKVmHeXPwjQUjrWajHGC7MEgT4RQOhQwHbD3LOhY=;
        b=mQ6WKvciiJrlqSZAo/gbNR0Vp1OLqEehpjbzlYNBH0nKd62eZW237X74gR3dSRqwtK
         loTokvpQk9Uta/UTyncQyFmUuhoNg867ngvlmhRpRf38nwQI1w5vSeTr/NriCEvYQl0b
         b9SqwW3Qb2vpxqwcJ6+n6jkmpYwLxurHkz+gJBJTanJWuMNrjNlMuIjICKI1iJvi3uXw
         hrvfk4Vrgm1HCI2YkY13gEu6R5Sjv7mXOfTvjVcUhS8IZxEyNGaR85zVMVRaG1IFOZE6
         6htPNRD+dBD3ShnZ1+Rm+wuCqnBP6frLZgZoEiv0FHCPHmZKeHGLAv5Wf2C/I3S499O8
         n3LQ==
X-Gm-Message-State: AOAM532mrUL0Tfy/sDXO8ip4PFdbH4mDE5ja/9/PRu6gD3qyCQ8nnH/0
	6Vr4Zz2DZV8G273rvjo6DpC2/BX+JXP/Qw==
X-Google-Smtp-Source: 
 ABdhPJxW7cWNEVicfmHkvs1T+999f1U1J3E4GHBEuiGUXBapfW0Ut94W1zB0Ts/1h/m6e0DcIQJdNA==
X-Received: by 2002:a17:90a:4891:b0:1b9:81c:8774 with SMTP id
 b17-20020a17090a489100b001b9081c8774mr3368839pjh.8.1645037648782;
        Wed, 16 Feb 2022 10:54:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 mj21sm20718714pjb.20.2022.02.16.10.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 10:54:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] recipes: Use renamed SKIP_RECIPE varFlag
Date: Wed, 16 Feb 2022 10:54:06 -0800
Message-Id: <20220216185406.3538485-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 18:54:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95346

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb          | 2 +-
 meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb           | 2 +-
 .../recipes-support/lowpan-tools/lowpan-tools_git.bb            | 2 +-
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb      | 2 +-
 meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb                 | 2 +-
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb   | 2 +-
 meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb            | 2 +-
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb        | 2 +-
 meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb         | 2 +-
 .../xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch           | 2 +-
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb              | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index 48b32eb7e2..c45cbcd925 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -69,4 +69,4 @@ RDEPENDS:${PN}-server += "tcp-wrappers xinetd rpcbind"
 
 # http://errors.yoctoproject.org/Errors/Details/186962/
 COMPATIBLE_HOST:libc-musl = 'null'
-PNBLACKLIST[netkit-rusers] ?= "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or directory"
+SKIP_RECIPE[netkit-rusers] ?= "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or directory"
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
index 3ce63c457b..05d42c75ef 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
@@ -21,4 +21,4 @@ do_install () {
     oe_runmake install DESTDIR="${D}"
 }
 
-PNBLACKLIST[drbd] ?= "Needs coccinelle to build with SPAAS"
+SKIP_RECIPE[drbd] ?= "Needs coccinelle to build with SPAAS"
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 28def7b489..cc6053ba96 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -36,4 +36,4 @@ FILES:${PN}-dbg += "${libexecdir}/lowpan-tools/.debug/"
 PACKAGES =+ "${PN}-python"
 FILES:${PN}-python = "${libdir}/python*"
 
-PNBLACKLIST[lowpan-tools] ?= "WARNING these tools are deprecated! Use wpan-tools instead"
+SKIP_RECIPE[lowpan-tools] ?= "WARNING these tools are deprecated! Use wpan-tools instead"
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index be131cd261..b0e7475bdb 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -76,4 +76,4 @@ INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 # see https://github.com/libhugetlbfs/libhugetlbfs/issues/52
-PNBLACKLIST[libhugetlbfs] ?= "Needs porting to glibc 2.34+"
+SKIP_RECIPE[libhugetlbfs] ?= "Needs porting to glibc 2.34+"
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
index 43fc69073f..cd46586512 100644
--- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "811040b647e5d5686f84db415efd697e6250008b112b6909ba77ac059e
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-PNBLACKLIST[mysql-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[mysql-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 
 inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setuptools", "", d)}
 
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index 5263aaef30..3d58a9fbd2 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -37,4 +37,4 @@ RDEPENDS:${PN} += " \
 "
 
 BBCLASSEXTEND = "nativesdk"
-PNBLACKLIST[dnf-plugin-tui] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
+SKIP_RECIPE[dnf-plugin-tui] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
index 60c5ab3815..05d3a1e239 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
@@ -10,7 +10,7 @@ its lifecycle. CFEngine takes systems from Build to Deploy, Manage and Audit."
 
 HOMEPAGE = "http://cfengine.com"
 
-PNBLACKLIST[cfengine] ?= "Needs porting to openssl 3.x"
+SKIP_RECIPE[cfengine] ?= "Needs porting to openssl 3.x"
 
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=233aa25e53983237cf0bd4c238af255f"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 850ed4f5fa..24271eb2bc 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -7,7 +7,7 @@ SECTION = "System/Management"
 
 inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setuptools", "", d)}
 
-PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 
 DEPENDS = "python-native python-pywbem-native python-m2crypto python-pywbem"
 
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
index eea231a2ea..331e00fb89 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
@@ -27,5 +27,5 @@ BBCLASSEXTEND = "nativesdk"
 
 FILES:${PN} = "${PYTHON_SITEPACKAGES_DIR}/ ${datadir}/ ${bindir}/ ${sysconfdir}/dnfdragora ${sysconfdir}/xdg"
 
-PNBLACKLIST[dnfdragora] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
+SKIP_RECIPE[dnfdragora] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
 
diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch b/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
index 207285373c..c5a70f5d08 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg/0001-Makefile.am-Error-Fix.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Makefile.am: Error Fix
 Do not compile man dir since error always occur.
  | sed: file filenames.sed line 3: unterminated `s' command
  | make[2]: *** [sessreg.1] Error 1
-It is not a good way.But can remove it from PNBLACKLIST.
+It is not a good way.But can remove it from SKIP_RECIPE.
 
 Upstream-Status: pending
 
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index 108d65298e..15acdf51ac 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -55,7 +55,7 @@ do_install() {
     install -m 755 ${S}/conf/lio_start.default ${D}/etc/target/lio_start.sh
 }
 
-PNBLACKLIST[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 
 RDEPENDS:${PN} += "python-stringold python-subprocess python-shell \
     python-datetime python-textutils python-crypt python-netclient python-email \
-- 
2.35.1


