Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11830.1795763029227768011
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=r9uqvKp/;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f05b465cd1so970945ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763028; x=1796367828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZ8F5ao06le9yvI6MNwPILgnJsbBrnoUET9Y9Gk7WBQ=;
        b=r9uqvKp/NRessMDHlgRvh7vHUE1+EauWP4U8sTz7jYA/SFZXDCMOemfSQrHlbKLz2D
         WzDeUKPzbBISYNpRBTbQSmn0EnOmTOLjv9TIAm3tYWuyBAFvxX12LVyLITwqKpf3UdQ3
         hk2GHfz1fTMrhgGDBky7ZiAl8Z1kkKFVkc8bxYvZMkUV63IZEP630oOoBAw6DOIw2rkC
         xLyYJo9hcFs495nR2pZOzY421sgXCqcEEVVKmzE74c3ubtc40oXZi+njIOdCZISUQo1y
         9sTkgXFIhzoaa8lo811wCyqSyrtyKQjwBCYxYu96J8POy6tPWVKSc6AlsLsJyr8qlOdj
         q8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763028; x=1796367828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZ8F5ao06le9yvI6MNwPILgnJsbBrnoUET9Y9Gk7WBQ=;
        b=bME6tnL3mzJnRiKa2dmmA5IcWVlvlE0eAjuhkMFQ/4tVrQYTd0OeCsVr2qHn5Ra5kU
         vuLnGCJVN8wlYbq/pjkSQJ42rDw5W3RMNdt0HikMFvUpq5GWwG6dI1A/JIXXz+zmWsj6
         F/V6kDE4ni53NbvIJM3WpKA+R78C4D4PHdTAGsy9U3z9QWyocmZ7igkbvtgh4MgtQkbn
         OonLjczWGWcBBw6ND0b06cKLbxPXWC8guEO4u/kZ5KPQBuDkT5qwT3HwTzA32y46B047
         f7iqk7nCGoBQ2bKnGAwAK1MBej9uZDELu7cpzSqDnhfyLkfo+J6o0zYfPjw7nCY+Fo4l
         5dTA==
X-Gm-Message-State: APuU4Z/neTf2/nczemG1U9dXiGx52FMTJwJNZVApHNt0SR8yfAv6072i
	Oz8SJDN3kFs/KW5EceKJOZLBESICpPar20ETH3poqG6yfSz3xcK+Qi/uN17oMRgX
X-Gm-Gg: AZFdTZf6myx2IQW1PfkkRHrT+fLrgs4cXnpyXtgbG7fIwuBDbO2M6QtXmEDISrs3hYs
	QtkSme2WDg+NG354Xt+VzAX+A1z+7oQ1v2VIB7Fk2za5lm5EokxiqpOMhfYN+PQzuQ2ny4qeLSr
	HP4aWoGQK3F1gPOEeXmO7J1BDfMvoK3LwX70d7sz2EdHF1p6UAtMhVLuWAyVTjLPHFd9fcqtslz
	8YIbrXzpRHdMuJL8c16nAjzWdP7TwSlamkcRHaaGMCnZ3TNqvlABKceUz/Gdm1hli1XgWnDpZGY
	pb+57j4sSbMVj8Ft6s12kCLoTbzgiGLGjdc7z+n8M7kAh2VYBQV1qQeKIr/RAuZorEXdG1MBttB
	ZixLDFil56h4RoRWLbCd2lLH5nBxtAPLG0IS7L2OFf6G1qn43ofFaYhDjtYm5llp320RoRRf+cB
	ntC6z2B0PBvFRblf4FEKCxj+TFfbXxrN1e0PGqnDtxuzpeBgUhLhjBDyALMXsMN6EQGIlv+E7CN
	1OCSDubitWlDLAcM0b5xpTVZhtNiTKq5Op85R91mhI6ocObVEXstB6RCwpUGCyO94h8CTG3qBPa
	7qd0AZt3P4bi6MbqxwyCwyJwVUqucFWK9jE2z+keZpYzVlrCAvHBnoxNa3mbB80E3a9m29Cyan4
	juAvoFgDdp2wTpm6Iy4E0bc2OfBZwso/b6YxwHVNqOKCr7+dcwbXrOpHzkMAuP/j/OxgC9idpsy
	VGm1//mSEkHEG5P+PgTn1tzM2pIAnsR9JEM8W8w08JhlWTG3QMFDLQFNlXCHdCuVAh2rXTZk2Td
	2on92J+TER7X2+bBh4y8IghgJ4cE20I8sQ3GOjm5t8gbI9DIvwmtnePi5GHK/Sq3OvSc2rcTJfU
	oiYOby1cHKBLSwWCgb/u59lxnw==
X-Received: by 2002:a17:903:4586:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2f03f14540emr209601305ad.30.1795763028384;
        Thu, 26 Nov 2026 23:03:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm112292155ad.73.2026.11.26.23.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 3/4] mod-dnssd: Fetch the 0.6 release tarball
Date: Thu, 26 Nov 2026 23:03:41 -0800
Message-ID: <20261127070342.2403582-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070342.2403582-1-khem.raj@oss.qualcomm.com>
References: <20261127070342.2403582-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133367
Content-Type: text/plain; charset="utf-8"

git.0pointer.net no longer serves the repository (its TLS certificate is
for another host). Use the 0.6 release tarball from 0pointer.de, and carry
the two commits that SRCREV had on top of 0.6 as backports: apxs
CFLAGS/LIBS quoting and the httpd 2.4 ap_unixd_setup_child rename.
Check upstream versions against the project page.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-properly-quote-CFLAGS-LIBS-for-apxs.patch | 30 ++++++++++++++++
 ...mod_dnssd.c-Use-ap_unixd_setup_child.patch | 36 +++++++++++++++++++
 .../recipes-httpd/apache-mod/mod-dnssd_0.6.bb | 10 ++++--
 3 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0001-build-system-properly-quote-CFLAGS-LIBS-for-apxs.patch
 create mode 100644 meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0002-mod_dnssd.c-Use-ap_unixd_setup_child.patch

diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0001-build-system-properly-quote-CFLAGS-LIBS-for-apxs.patch b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0001-build-system-properly-quote-CFLAGS-LIBS-for-apxs.patch
new file mode 100644
index 0000000000..ae5605d017
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0001-build-system-properly-quote-CFLAGS-LIBS-for-apxs.patch
@@ -0,0 +1,30 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Mon, 20 Apr 2009 03:08:28 +0200
+Subject: [PATCH 1/2] build-system: properly quote CFLAGS/LIBS for apxs
+
+Should fix build on systems where AVAHI_LIBS/AVAHI_CFLAGS is not empty.
+
+Pointed out by Scott Brian.
+
+Upstream-Status: Backport [https://git.0pointer.net/mod_dnssd.git/commit/?id=9476b3bd4f7cf90df5408a6a6b169db210c2c10a]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index fd99c17..702f2b2 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -16,8 +16,8 @@
+ 
+ APXS=@APXS@
+ APACHECTL=@APACHECTL@
+-LIBS=-Wl,"@LIBS@" @AVAHI_LIBS@
+-CFLAGS=-Wc,"@CFLAGS@" @AVAHI_CFLAGS@
++LIBS=-Wl,"@LIBS@ @AVAHI_LIBS@"
++CFLAGS=-Wc,"@CFLAGS@ @AVAHI_CFLAGS@"
+ 
+ all: mod_dnssd.la
+ 
diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0002-mod_dnssd.c-Use-ap_unixd_setup_child.patch b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0002-mod_dnssd.c-Use-ap_unixd_setup_child.patch
new file mode 100644
index 0000000000..003b2cb77e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd/0002-mod_dnssd.c-Use-ap_unixd_setup_child.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Robby Workman <rworkman@slackware.com>
+Date: Fri, 8 Feb 2013 14:14:08 -0600
+Subject: [PATCH 2/2] mod_dnssd.c: Use ap_unixd_setup_child
+
+This fixeds an undefined reference to unixd_setup_child in the
+compiled module.  This looks to have changed in httpd-2.3.2 dev:
+20090130.0 (2.3.2-dev)  Add ap_ prefix to unixd_setup_child().
+
+Upstream-Status: Backport [https://git.0pointer.net/mod_dnssd.git/commit/?id=be2fb9f6158f800685de7a1bc01c39b6cf1fa12c]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/mod_dnssd.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/mod_dnssd.c b/src/mod_dnssd.c
+index 6179276..3363701 100644
+--- a/src/mod_dnssd.c
++++ b/src/mod_dnssd.c
+@@ -24,6 +24,7 @@
+ #include <ap_config.h>
+ #include <apr_strings.h>
+ #include <unixd.h>
++#include <mod_unixd.h>
+ #include <apr_signal.h>
+ #include <mpm_common.h>
+ 
+@@ -576,7 +577,7 @@ static void child_process(apr_pool_t *p, server_rec *server, struct global_confi
+ 
+     ap_assert(d);
+ 
+-    unixd_setup_child();
++    ap_unixd_setup_child();
+ 
+     if (pipe(sigterm_pipe_fds) < 0) {
+         ap_log_error(APLOG_MARK, APLOG_ERR, 0, r.main_server, "pipe() failed: %s", strerror(errno));
diff --git a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
index aca6d598f8..cb2e4f95b4 100644
--- a/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/mod-dnssd_0.6.bb
@@ -5,9 +5,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "apache2 avahi"
 
-SRC_URI = "git://git.0pointer.net/mod_dnssd.git;protocol=https;branch=master"
-SRCREV = "be2fb9f6158f800685de7a1bc01c39b6cf1fa12c"
+SRC_URI = "https://0pointer.de/lennart/projects/mod_dnssd/mod_dnssd-${PV}.tar.gz \
+           file://0001-build-system-properly-quote-CFLAGS-LIBS-for-apxs.patch \
+           file://0002-mod_dnssd.c-Use-ap_unixd_setup_child.patch \
+           "
+SRC_URI[sha256sum] = "2cd171d76eba398f03c1d5bcc468a1756f4801cd8ed5bd065086e4374997c5aa"
 
+UPSTREAM_CHECK_REGEX = "mod_dnssd-(?P<pver>\d+(\.\d+)+)\.tar"
+
+S = "${UNPACKDIR}/mod_dnssd-${PV}"
 
 EXTRA_OECONF = "--disable-lynx"
 
