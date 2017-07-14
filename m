Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 095DF780CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:41 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id e7so40224313pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IXgkKjn5AUyRsDf7ZMrR2+WQ3OEe8QikBy0g68du0G4=;
	b=QUyM3CbYkMPWO/DF2DkmqrCaRZi9FhqfZ785eK6JaSDaXcQuxiLXtmGYbH0Awyrc43
	r9WW96qUzWGq9hxHMZuWWJHyWj+phPApOHQgxB60Dge5KiTYPeSeVfvDcr8pGt3P6Xt5
	YbW9vZbEieDvlpi9HX6ddB3BZ32RiYnpPV7Kgg75IYwwe1OAysEkcyaXCMHAoRm1W0R3
	zNPQOZIMecdbKMKiqKZ2H3WoOHxJXW+kMVYTevS3hiAYw/mTNJXi9wrmpROmooWdzbcI
	S+u9jr+t3pXABUgyZKXFEDNlL4JRqxZ61X0WmHK4V6vG/RAd3T645IDyRpfOEPl4BMWn
	+cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IXgkKjn5AUyRsDf7ZMrR2+WQ3OEe8QikBy0g68du0G4=;
	b=XlcasoFt1gjsl+b3y1gkXituywGalDbBzLHzY+3niiPe/PVmgFW2tU1+aQpeT6cvPK
	GQirlPeaNPpqnm1Xju7fHFkZYl0HmIcbYMi9xCj9Q26AbhSa+2eHhirnnCsPGQ8ErmFu
	70gP4/PMz4zmFMHQD/RyaxiWI4hHCsC90qZobpj15Meb6vP2f9yfcpvz1MIRzjv/OeDA
	cpo4G/goYOiic3XMlbPHVPT5lQponKKFmTc5qXOa+i3G5yB6dF3mWgH1CuFjdRkS2wcP
	TAO3xQRqP7fQUu1aQnunt+nXl+EJn2jkaNt+WApsrSzvtiG+18i3QJ9ykTXlpTar+DF3
	/FWg==
X-Gm-Message-State: AIVw112yrvvStv5ZvG3ZaAJfDdKcjItxJq9S5ULjvIiRisnMycf7bvnn
	bZ4scxJ7CSSXiS+z
X-Received: by 10.99.123.28 with SMTP id w28mr13052278pgc.183.1500010842536;
	Thu, 13 Jul 2017 22:40:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:08 -0700
Message-Id: <20170714054013.34458-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 13/18] netdata: Upgrade to 1.6.0
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:42 -0000

Licence files has gotten cosmetic changes
additionally checksum COPYING file.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../netdata/0001-Correct-Timeout-issue.patch       | 32 ++++++++++++----------
 .../0001-makefile-Do-not-build-contrib-dir.patch   | 27 ++++++++++++++++++
 .../recipes-webadmin/netdata/netdata_git.bb        | 14 ++++++----
 3 files changed, 53 insertions(+), 20 deletions(-)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch
index d5529a2a6..abea0d66b 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-Correct-Timeout-issue.patch
@@ -1,19 +1,21 @@
-diff --git a/plugins.d/charts.d.plugin b/plugins.d/charts.d.plugin
-index 40c0356..bca57b3 100755
---- a/plugins.d/charts.d.plugin
-+++ b/plugins.d/charts.d.plugin
-@@ -184,10 +184,10 @@ fi
- # timeout command we use, providing a function that
- # can emulate the timeout command we need:
- # > timeout SECONDS command ...
+Index: git/plugins.d/charts.d.plugin
+===================================================================
+--- git.orig/plugins.d/charts.d.plugin
++++ git/plugins.d/charts.d.plugin
+@@ -246,16 +246,6 @@ else
+     info "configuration file '$myconfig' not found. Using defaults."
+ fi
+ 
+-# we check for the timeout command, after we load our
+-# configuration, so that the user may overwrite the
+-# timeout command we use, providing a function that
+-# can emulate the timeout command we need:
+-# > timeout SECONDS command ...
 -if [ $check_for_timeout -eq 1 ]
--	then
--	require_cmd timeout || exit 1
+-    then
+-    require_cmd timeout || exit 1
 -fi
-+#if [ $check_for_timeout -eq 1 ]
-+#	then
-+#	require_cmd timeout || exit 1
-+#fi
-
+-
  # -----------------------------------------------------------------------------
  # internal checks
+ 
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch
new file mode 100644
index 000000000..9a3a4a551
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0001-makefile-Do-not-build-contrib-dir.patch
@@ -0,0 +1,27 @@
+From 87f868918a9ae1dcf93e01f3e177d185c19a149a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 14:32:09 -0700
+Subject: [PATCH] makefile: Do not build contrib dir
+
+It contains debian build iteams anyway
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3ccf82f8..a852e529 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -52,7 +52,6 @@ SUBDIRS = \
+ 	src \
+ 	system \
+ 	web \
+-	contrib \
+ 	$(NULL)
+ 
+ dist_noinst_DATA= \
+-- 
+2.13.2
+
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index de140641c..100366211 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -1,11 +1,15 @@
 HOMEPAGE = "https://github.com/firehol/netdata/"
 SUMMARY = "Real-time performance monitoring"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=747afe070ea9d6c2be0a31353609a35b"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a4a3b650ea3f74269cdfd45a3550e219 \
+                    file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                   "
 
-SRC_URI = "git://github.com/firehol/netdata.git;protocol=https"
-SRCREV = "36c1304e37094174ea51001903058e65053107ca"
-PV = "1.0.1+git${SRCPV}"
+SRC_URI = "git://github.com/firehol/netdata.git;protocol=https \
+           file://0001-makefile-Do-not-build-contrib-dir.patch \
+"
+SRCREV = "f5fa346a188e906a8f2cce3c2cf32a88ce81c666"
+PV = "1.6.0+git${SRCPV}"
 
 # patch to disable timeout because timeout are not available with actual version
 # of core-utils
@@ -19,7 +23,7 @@ SRC_URI += "file://netdata.service"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "zlib"
+DEPENDS += "zlib util-linux"
 
 inherit pkgconfig autotools useradd systemd
 
-- 
2.13.2


