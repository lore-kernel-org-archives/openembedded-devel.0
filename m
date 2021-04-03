Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.34500.1617479833930012904
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Apr 2021 12:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mSU4t7gJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id b16so8668823eds.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Apr 2021 12:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HJsNz9ttg6VmQOaE4jDLHP1m/KS0tWAm1GBCzf1sTEY=;
        b=mSU4t7gJQF4G4Yh2KXK1o+EeMrKlbeb1+LSCyhfR2o3YuPvbBZF581d3gbVI+g7PIh
         IYJ0nhJWkeoKbyl3v2BLUmpVpoOZLmrY8oATypFujbaf0kLxn7/dNrlCeUtAvAp0OJd8
         9a138JAhZ1viZiaE1IUkuIDH6X1SFJz/EExQB/MtZ2TP+aXZFDf58e0cJ4qKLNr5o6J6
         RG3UnsyNhQim0yS8X/kt2nDYUce0/0DuoO2ca8/Ts8PJB3ioX0nEzfftqyL46gk4Q/EU
         DczWQckC/eG1qtUnPodAOhoNz4nw8eoK4gEvK9tqLrI4tCWftATODZ9iIFeSR1x9MItc
         Jpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HJsNz9ttg6VmQOaE4jDLHP1m/KS0tWAm1GBCzf1sTEY=;
        b=J/PtkvihV32LL7Obp83cW479Xsranb4bk/VLA/nrNQqM9E0e24vWLOaUrVUOP8Eybh
         mml3E8EsbW8Je8E+0gjyd4s6R3dHtBrO8740hZtjjU7+mXVr0fg4aY0hP4nTRgOOOKzu
         pYJvfSdf0nXmlnA5s4/TpPU01bqSwlDE5eijMr2NsS7QcHVKgRTscw//ITuAl/SHe37m
         E1+hIGda4HZJjK/0tuLr6EvtUfnA8q7R+jytru24C1u21GhlyK6uZL8EFFuxZc7MAmDa
         mvyhMWiveIUqBJb/IjIBxJwjs0gsI7SZ8ERf58zNwDf578chZSqnEF16R6WNLTIEh4wW
         w3ag==
X-Gm-Message-State: AOAM530YRQEahQkbOnK0feut1dt2kR4dS5jGMuzjEH/c6Cu186qNILc4
	4Kid6eNNUnIEjR3ufUQZJvw9MtGAVMQ=
X-Google-Smtp-Source: ABdhPJxDgILPBc7TMN+yAE3Q0H9vIp3iCsZRjU3YbsRzS+M7LT51oLepkRo+tjOosyj+FEZPXbevqw==
X-Received: by 2002:a05:6402:c1:: with SMTP id i1mr22278561edu.315.1617479832388;
        Sat, 03 Apr 2021 12:57:12 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id oy8sm5869986ejb.58.2021.04.03.12.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 12:57:11 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] phonet-utils: remove
Date: Sat,  3 Apr 2021 21:57:09 +0200
Message-Id: <20210403195710.1402036-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* no update other than occassional build fix since 2011 when I've imported this
* it's also failing with usrmerge:
  ERROR: phonet-utils-0.0.0+gitrAUTOINC+4acfa720fd-r2 do_package_qa: QA Issue: phonet-utils package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
  ERROR: phonet-utils-0.0.0+gitrAUTOINC+4acfa720fd-r2 do_package_qa: QA run found fatal errors. Please consider fixing them.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Include-limits.h-for-PATH_MAX.patch  | 25 -------------------
 .../phonet-utils/phonet-utils_git.bb          | 15 -----------
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 3 files changed, 41 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
 delete mode 100644 meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb

diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
deleted file mode 100644
index 8bb7e5a188..0000000000
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f7ad9a4471cee2324f216a0d82ba8097ec746c56 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Jul 2017 11:48:12 -0700
-Subject: [PATCH] Include limits.h for PATH_MAX
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/pnstat.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/pnstat.c b/src/pnstat.c
-index 661a5bc..76068e6 100644
---- a/src/pnstat.c
-+++ b/src/pnstat.c
-@@ -35,6 +35,7 @@
- #include <dirent.h>
- #include <unistd.h>
- #include <netinet/tcp.h>
-+#include <limits.h>
- 
- struct fd
- {
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
deleted file mode 100644
index 3c599950fe..0000000000
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "This small package provides a few command line tools for Linux Phonet"
-HOMEPAGE = ""
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-SRC_URI = "git://gitorious.org/meego-cellular/phonet-utils.git;branch=master \
-           file://0001-Include-limits.h-for-PATH_MAX.patch \
-           "
-PR = "r2"
-S = "${WORKDIR}/git"
-SRCREV = "4acfa720fd37d178a048fc2be17180137d4a70ea"
-PV = "0.0.0+gitr${SRCPV}"
-
-inherit autotools-brokensep
-
-FILES_${PN} += "${base_libdir}/udev/rules.d/85-phonet-utils.rules"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4eb2e8c11c..eb6cb3592f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -146,7 +146,6 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
     obexftp \
     packagegroup-tools-bluetooth \
     paho-mqtt-c \
-    phonet-utils \
     rabbitmq-c \
     rfkill \
     rtorrent \
-- 
2.30.2

