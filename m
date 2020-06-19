Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.4679.1592566334732003287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DrbCOEyg;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id gl26so9814635ejb.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 04:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jC4mgYKviO1qlGLsS9zG59bcNyQPjqQYZM4qY+TsDXc=;
        b=DrbCOEyggr0XFsS4uHrfcV0voqwX532vzDDOVPD+GrItBpMVvOPTgG7rVLf3EJKyCV
         kCSmuRwEb252Zm7fGlXgm34hPyFdDi1HPZVmcN7EdcPps3eAGGVnyUioGz7UhCJQrCXq
         YyPFMo8FMpIlNVUs9KGuKvi0joNkIO/+JAdGDRFIRoRHseTKImbL8fuNXEbGJKoA07aD
         Awh6/eImEbSSjsmW4h2PQReOKgYZKzyS2aNZZfcYDHKLtOIXaADLE5U7dBUm8T8K92XB
         98w/5AjpcLQja8+teKGeDI4PwOmlr1t2yvMd3VzWPyzPn4Ij14tRYz0lTiENLFbgDUc2
         nNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jC4mgYKviO1qlGLsS9zG59bcNyQPjqQYZM4qY+TsDXc=;
        b=cJCbtKlhHkHElF25dRdaEWWZ3OTXOt3wZ/UViJ7kBuheBgOyCgTrKG7UBwU2JpkfKi
         u5sWYasxmzRkAJDAXHRLm73haoVhdHDIDKHiOtSC+FVF3dqsywF4RZuSX/g/umM0/jGl
         +VH54yDwzHq11Zc3A0DCuUHHWH8tz/1EO72BGvUwHuNNmHv2jDuqWzkn5u3YRKzPp73D
         sJkvQ+P0INsCRy9j+AX1USiE4GnY4Mkxwf+zodfAWmH4DpP5Ieydr0DIrCWKWO9NAXOb
         AnEjH/WXigf6yM4a+BkZOxYafUxSHYOa+aNuJ8DeppffuWKDwuRbrhWK7uwTBW1JU/ED
         Uwiw==
X-Gm-Message-State: AOAM533a92vKMpfxVMexM0IBLKewfg5kYA/cy9P1vORe280QjK7MA8ir
	ondbEHgBLYePD5MUp4No8jMJIYqJD1c=
X-Google-Smtp-Source: ABdhPJywDbWfLZ+ix8+fXMjtaYg/igDqyKFoC33xiN8ikrTZ0vaSHxbxFWppZTtYATcg4e3fYZFYNQ==
X-Received: by 2002:a17:906:7f05:: with SMTP id d5mr3163586ejr.70.1592566332664;
        Fri, 19 Jun 2020 04:32:12 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07a002d299e9f71202562c.dip0.t-ipconnect.de. [2003:f0:7f07:a002:d299:e9f7:1202:562c])
        by smtp.gmail.com with ESMTPSA id o12sm4472346edq.7.2020.06.19.04.32.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 04:32:12 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/10] netdata: upgrade 1.17.0 -> 1.22.1
Date: Fri, 19 Jun 2020 13:31:55 +0200
Message-Id: <20200619113201.2811033-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619113201.2811033-1-schnitzeltony@gmail.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0001-Correct-timeout-issue.patch: timeout is build by coreutils
* 0002-Makefiles-does-not-build-contrib-dir.patch: Upstream added identical

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../netdata/0001-Correct-timeout-issue.patch  | 42 -------------------
 ...Makefiles-does-not-build-contrib-dir.patch | 24 -----------
 .../recipes-webadmin/netdata/netdata_git.bb   | 15 ++-----
 3 files changed, 4 insertions(+), 77 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-timeout-issue.patch
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0002-Makefiles-does-not-build-contrib-dir.patch

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-timeout-issue.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-timeout-issue.patch
deleted file mode 100644
index c4be8270c..000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-timeout-issue.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ccaf4225239c3092a51cf44f2ab0a2141b8a5fa6 Mon Sep 17 00:00:00 2001
-From: Luca Palano <github@lpzone.it>
-Date: Wed, 5 Dec 2018 10:36:52 +0100
-Subject: [PATCH 1/2] Correct of timeout issue
-
-The timeout issue has been disabled
-
-Signed-off-by: Luca Palano <github@lpzone.it>
----
- collectors/charts.d.plugin/charts.d.plugin.in | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/collectors/charts.d.plugin/charts.d.plugin.in b/collectors/charts.d.plugin/charts.d.plugin.in
-index 0df6c30c..63ea4506 100755
---- a/collectors/charts.d.plugin/charts.d.plugin.in
-+++ b/collectors/charts.d.plugin/charts.d.plugin.in
-@@ -156,7 +156,7 @@ restart_timeout=$((3600 * 4))
- dryrunner=0
- 
- # check for timeout command
--check_for_timeout=1
-+check_for_timeout=0
- 
- # the default enable/disable value for all charts
- enable_all_charts="yes"
-@@ -251,9 +251,10 @@ time_divisor=$((time_divisor))
- # timeout command we use, providing a function that
- # can emulate the timeout command we need:
- # > timeout SECONDS command ...
--if [ $check_for_timeout -eq 1 ]; then
--	require_cmd timeout || exit 1
--fi
-+#if [ $check_for_timeout -eq 1 ]
-+#    then
-+#    require_cmd timeout || exit 1
-+#fi
- 
- # -----------------------------------------------------------------------------
- # internal checks
--- 
-2.20.1 (Apple Git-117)
-
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0002-Makefiles-does-not-build-contrib-dir.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0002-Makefiles-does-not-build-contrib-dir.patch
deleted file mode 100644
index f0887fed0..000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0002-Makefiles-does-not-build-contrib-dir.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 95e1da77de80e38068bb2739faeaad49105700cf Mon Sep 17 00:00:00 2001
-From: Luca Palano <github@lpzone.it>
-Date: Mon, 15 Jul 2019 10:16:32 +0200
-Subject: [PATCH 2/2] Makefiles does not build contrib
-
-Signed-off-by: Luca Palano <github@lpzone.it>
----
- Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index bc928bba..ba9edc6b 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -54,7 +54,6 @@ dist_noinst_DATA= \
- 	CHANGELOG.md \
- 	cppcheck.sh \
- 	configs.signatures \
--	contrib \
- 	netdata.cppcheck \
- 	netdata.spec \
- 	package.json \
---
-2.20.1 (Apple Git-117)
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index d6a5ce066..ee4a7c1e3 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -3,15 +3,9 @@ SUMMARY = "Real-time performance monitoring"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-SRC_URI = "git://github.com/firehol/netdata.git;protocol=https \
-           file://0002-Makefiles-does-not-build-contrib-dir.patch \
-"
-SRCREV = "588ce5a7b18999dfa66698cd3a2f005f7a3c31cf"
-PV = "1.17.0"
-
-# patch to disable timeout because timeout are not available with actual version
-# of core-utils
-SRC_URI += "file://0001-Correct-timeout-issue.patch"
+SRC_URI = "git://github.com/firehol/netdata.git;protocol=https"
+SRCREV = "1be9200ba8e11dc81a2101d85a2725137d43f766"
+PV = "1.22.1"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
@@ -21,7 +15,7 @@ SRC_URI += "file://netdata.service"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "zlib util-linux"
+DEPENDS += "zlib util-linux libuv"
 
 inherit pkgconfig autotools-brokensep useradd systemd
 
@@ -58,5 +52,4 @@ do_install_append() {
     sed -i -e 's,@@datadir,${datadir},g' ${D}${sysconfdir}/netdata/netdata.conf
 }
 
-FILES_${PN}-dbg += "${libexecdir}/netdata/plugins.d/.debug"
 RDEPENDS_${PN} = "bash zlib"
-- 
2.26.2

