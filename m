Return-Path: <contact@lpzone.it>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 43DF865CF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 08:46:34 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k10so3960194qtq.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 01:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lpzone-it.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hHyp2Kbs3SURDssvH2pBBq+NENJnOmLe9NYWYdknoyg=;
	b=FMgkHP8CX7Ix5w5fdX1sod6N87aY6saPLn0P0g3Fz03oJ7pLUDocgy89nQz5CXALgX
	ZMrA5qle2g414fDT7GaEcbUjS8VmKM0BhPD96X+AMXSbJaoSvs1iIIcsNW5+2Nna3krB
	cbQ5qRbt3Y82WQNn91cNoC7nQXTd1E3qd6LqFVEbZ9+g4avpMm/Z4dxypWGmohk+qCqv
	aomPIluAUv/2kayrRE7uJIKCIccqLVhxXaRJGtE8VQ3rBeUaRj0wyLdL4NKml6gMxxFH
	CUkjAA/kWbfUp2QQuVEcdslHigpG8uSEUMvdsrAtiTyMAZ5QzRd/D753wRnFSdT2ueDc
	Frmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=hHyp2Kbs3SURDssvH2pBBq+NENJnOmLe9NYWYdknoyg=;
	b=LEAHQdbH4zw3z5qWPWkK01gsTUEcWenjFrNF1+0+Z3U9e1w4+tEbORNNDEupmWAFNB
	1oUF+9Dx2QG6A6Oc7ukmcYsE+DLW/Pm1hCDUYdIQXQS2UAAHjC9L0jAkITv+biTeIR7s
	koepcFkqhvXK6OLpWECqv4cFCui/R6JctiTkh0anLIEJH0EMh7yW/0d0l6Q2jZAmvCYe
	jq6yBO5IE+N+r6iyEmpoxBtTQi/9VNmZRy4UmKaXekxU7UpBloxI78knieLFxXenwLM2
	iA+F19XR+TJWGXeQxpVQ2lZc3rnwn8MqJVCelW/5CVZ8LFuM48GgqFn0pUVxv8iqvUCA
	PfLg==
X-Gm-Message-State: APjAAAWtwNSnl+Iupar+rTwm5oE6+160Koa0ANM5J7nNS+iTwWOh8xyE
	rDXxmXXNR3o6FO3VM8BfPos4GfwH
X-Google-Smtp-Source: APXvYqxc94YHwKJzvgKoPGMv9Aurk/DOQQKUV8HYP+TxF9lzh/KtnWr6UXdS2ilX3wvcZtPcN8BDQA==
X-Received: by 2002:ac8:5315:: with SMTP id t21mr12136324qtn.66.1564735594836; 
	Fri, 02 Aug 2019 01:46:34 -0700 (PDT)
Received: from MBP-di-Luca.bticino.bt
	(host98-19-static.110-62-b.business.telecomitalia.it. [62.110.19.98])
	by smtp.gmail.com with ESMTPSA id
	q32sm31187463qtd.79.2019.08.02.01.46.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Aug 2019 01:46:34 -0700 (PDT)
Sender: Luca Palano <luca.palano@lpzone.it>
From: Luca Palano <contact@lpzone.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 10:45:43 +0200
Message-Id: <20190802084543.22167-1-contact@lpzone.it>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Cc: Luca Palano <github@lpzone.it>
Subject: [meta-webserver] [PATCH] Netdata upgrade: 1.8.0 -> 1.16.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2019 08:46:34 -0000
Content-Transfer-Encoding: 8bit

From: Luca Palano <github@lpzone.it>

Signed-off-by: Luca Palano <github@lpzone.it>
---
 .../netdata/0001-Correct-Timeout-issue.patch  | 21 ----------
 .../netdata/0001-Correct-timeout-issue.patch  | 42 +++++++++++++++++++
 ...01-makefile-Do-not-build-contrib-dir.patch | 27 ------------
 ...Makefiles-does-not-build-contrib-dir.patch | 24 +++++++++++
 .../recipes-webadmin/netdata/netdata_git.bb   | 16 +++----
 5 files changed, 72 insertions(+), 58 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-timeout-issue.patch
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0002-Makefiles-does-not-build-contrib-dir.patch

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch
deleted file mode 100644
index abea0d66b..000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Index: git/plugins.d/charts.d.plugin
-===================================================================
---- git.orig/plugins.d/charts.d.plugin
-+++ git/plugins.d/charts.d.plugin
-@@ -246,16 +246,6 @@ else
-     info "configuration file '$myconfig' not found. Using defaults."
- fi
- 
--# we check for the timeout command, after we load our
--# configuration, so that the user may overwrite the
--# timeout command we use, providing a function that
--# can emulate the timeout command we need:
--# > timeout SECONDS command ...
--if [ $check_for_timeout -eq 1 ]
--    then
--    require_cmd timeout || exit 1
--fi
--
- # -----------------------------------------------------------------------------
- # internal checks
- 
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-timeout-issue.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-timeout-issue.patch
new file mode 100644
index 000000000..c4be8270c
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-timeout-issue.patch
@@ -0,0 +1,42 @@
+From ccaf4225239c3092a51cf44f2ab0a2141b8a5fa6 Mon Sep 17 00:00:00 2001
+From: Luca Palano <github@lpzone.it>
+Date: Wed, 5 Dec 2018 10:36:52 +0100
+Subject: [PATCH 1/2] Correct of timeout issue
+
+The timeout issue has been disabled
+
+Signed-off-by: Luca Palano <github@lpzone.it>
+---
+ collectors/charts.d.plugin/charts.d.plugin.in | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/collectors/charts.d.plugin/charts.d.plugin.in b/collectors/charts.d.plugin/charts.d.plugin.in
+index 0df6c30c..63ea4506 100755
+--- a/collectors/charts.d.plugin/charts.d.plugin.in
++++ b/collectors/charts.d.plugin/charts.d.plugin.in
+@@ -156,7 +156,7 @@ restart_timeout=$((3600 * 4))
+ dryrunner=0
+ 
+ # check for timeout command
+-check_for_timeout=1
++check_for_timeout=0
+ 
+ # the default enable/disable value for all charts
+ enable_all_charts="yes"
+@@ -251,9 +251,10 @@ time_divisor=$((time_divisor))
+ # timeout command we use, providing a function that
+ # can emulate the timeout command we need:
+ # > timeout SECONDS command ...
+-if [ $check_for_timeout -eq 1 ]; then
+-	require_cmd timeout || exit 1
+-fi
++#if [ $check_for_timeout -eq 1 ]
++#    then
++#    require_cmd timeout || exit 1
++#fi
+ 
+ # -----------------------------------------------------------------------------
+ # internal checks
+-- 
+2.20.1 (Apple Git-117)
+
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch
deleted file mode 100644
index 6a0d75e37..000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 87f868918a9ae1dcf93e01f3e177d185c19a149a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 14:32:09 -0700
-Subject: [PATCH] makefile: Do not build contrib dir
-
-It contains debian build iteams anyway
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 2ea9e40..acb1bd8 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -56,7 +56,6 @@ SUBDIRS = \
- 	src \
- 	system \
- 	web \
--	contrib \
- 	tests \
- 	$(NULL)
- 
--- 
-2.13.2
-
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0002-Makefiles-does-not-build-contrib-dir.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0002-Makefiles-does-not-build-contrib-dir.patch
new file mode 100644
index 000000000..f0887fed0
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0002-Makefiles-does-not-build-contrib-dir.patch
@@ -0,0 +1,24 @@
+From 95e1da77de80e38068bb2739faeaad49105700cf Mon Sep 17 00:00:00 2001
+From: Luca Palano <github@lpzone.it>
+Date: Mon, 15 Jul 2019 10:16:32 +0200
+Subject: [PATCH 2/2] Makefiles does not build contrib
+
+Signed-off-by: Luca Palano <github@lpzone.it>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index bc928bba..ba9edc6b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -54,7 +54,6 @@ dist_noinst_DATA= \
+ 	CHANGELOG.md \
+ 	cppcheck.sh \
+ 	configs.signatures \
+-	contrib \
+ 	netdata.cppcheck \
+ 	netdata.spec \
+ 	package.json \
+--
+2.20.1 (Apple Git-117)
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index 390fa4ba9..811c2c522 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -1,19 +1,17 @@
 HOMEPAGE = "https://github.com/firehol/netdata/"
 SUMMARY = "Real-time performance monitoring"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=95b49e9ea979a337578f13c2a3ab9535 \
-                    file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                   "
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
 SRC_URI = "git://github.com/firehol/netdata.git;protocol=https \
-           file://0001-makefile-Do-not-build-contrib-dir.patch \
+           file://0002-Makefiles-does-not-build-contrib-dir.patch \
 "
-SRCREV = "89ed309252981ddd50f697fde4fe93019cb3e652"
-PV = "1.8.0+git${SRCPV}"
+SRCREV = "2c4146832061635273d153a5174c85fb1d967d57"
+PV = "1.16.0+git${SRCPV}"
 
 # patch to disable timeout because timeout are not available with actual version
 # of core-utils
-SRC_URI += "file://0001-Correct-Timeout-issue.patch"
+SRC_URI += "file://0001-Correct-timeout-issue.patch"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
@@ -25,9 +23,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS += "zlib util-linux"
 
-inherit pkgconfig autotools useradd systemd
-
-LDFLAGS += "-pthread"
+inherit pkgconfig autotools-brokensep useradd systemd
 
 #systemd
 SYSTEMD_PACKAGES = "${PN}"
-- 
2.20.1 (Apple Git-117)


