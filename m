Received: from [151.189.21.53] (helo=mail-in-13.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1M7Vvd-0001Uo-H6
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 16:40:57 +0200
Received: from mail-in-17-z2.arcor-online.net (mail-in-17-z2.arcor-online.net
	[151.189.8.34]) by mx.arcor.de (Postfix) with ESMTP id 0821B2BAE12;
	Fri, 22 May 2009 16:33:14 +0200 (CEST)
Received: from mail-in-04.arcor-online.net (mail-in-04.arcor-online.net
	[151.189.21.44])
	by mail-in-17-z2.arcor-online.net (Postfix) with ESMTP id E07FB45C16C; 
	Fri, 22 May 2009 16:33:13 +0200 (CEST)
Received: from localhost.localdomain (p5B3B25B5.dip.t-dialin.net
	[91.59.37.181]) (Authenticated sender: leggewie@arcor.de)
	by mail-in-04.arcor-online.net (Postfix) with ESMTPSA id 600D533AA3C;
	Fri, 22 May 2009 16:33:13 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-04.arcor-online.net 600D533AA3C
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 May 2009 16:33:11 +0200
Message-Id: <1243002791-519-1-git-send-email-no2spam@nospam.arcornews.de>
X-Mailer: git-send-email 1.6.0.4
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: [PATCH] bluez: 3.36 does not need the hciattach-ti-bts.patch. Fixes do_patch.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2009 14:40:59 -0000

From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>

---
 recipes/bluez/bluez-cups-backend_3.33.bb     |    4 ++++
 recipes/bluez/bluez-gstreamer-plugin_3.33.bb |    4 ++++
 recipes/bluez/bluez-utils-alsa_3.33.bb       |    4 ++++
 recipes/bluez/bluez-utils3.inc               |    2 --
 recipes/bluez/bluez-utils_3.33.bb            |    4 ++++
 recipes/bluez/bluez-utils_3.36.bb            |    5 -----
 6 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/recipes/bluez/bluez-cups-backend_3.33.bb b/recipes/bluez/bluez-cups-backend_3.33.bb
index 40e0996..f3601b4 100644
--- a/recipes/bluez/bluez-cups-backend_3.33.bb
+++ b/recipes/bluez/bluez-cups-backend_3.33.bb
@@ -4,6 +4,10 @@ PR = "r1"
 
 DEPENDS += "cups"
 
+# TI patch landed upstream sometime between 3.35 and 3.36, 
+# albeit in a somewhat different form
+SRC_URI += "file://hciattach-ti-bts.patch;patch=1"
+
 # see bluez-utils3.inc for the explanation of these option
 EXTRA_OECONF = " \
                  --enable-bccmd \
diff --git a/recipes/bluez/bluez-gstreamer-plugin_3.33.bb b/recipes/bluez/bluez-gstreamer-plugin_3.33.bb
index 53b7eb8..f4e3ca4 100644
--- a/recipes/bluez/bluez-gstreamer-plugin_3.33.bb
+++ b/recipes/bluez/bluez-gstreamer-plugin_3.33.bb
@@ -4,6 +4,10 @@ PR = "r1"
 
 DEPENDS += "gstreamer gst-plugins-base "
 
+# TI patch landed upstream sometime between 3.35 and 3.36, 
+# albeit in a somewhat different form
+SRC_URI += "file://hciattach-ti-bts.patch;patch=1" 
+
 # see bluez-utils3.inc for the explanation of these option
 EXTRA_OECONF = " \
                  --enable-bccmd \
diff --git a/recipes/bluez/bluez-utils-alsa_3.33.bb b/recipes/bluez/bluez-utils-alsa_3.33.bb
index a1e3e85..2558b87 100644
--- a/recipes/bluez/bluez-utils-alsa_3.33.bb
+++ b/recipes/bluez/bluez-utils-alsa_3.33.bb
@@ -4,6 +4,10 @@ PR = "r1"
 
 DEPENDS += "alsa-lib"
 
+# TI patch landed upstream sometime between 3.35 and 3.36, 
+# albeit in a somewhat different form
+SRC_URI += "file://hciattach-ti-bts.patch;patch=1" 
+
 # see bluez-utils3.inc for the explanation of these option
 EXTRA_OECONF = " \
                  --enable-bccmd \
diff --git a/recipes/bluez/bluez-utils3.inc b/recipes/bluez/bluez-utils3.inc
index 703788f..5fab6e7 100644
--- a/recipes/bluez/bluez-utils3.inc
+++ b/recipes/bluez/bluez-utils3.inc
@@ -10,10 +10,8 @@ LICENSE = "GPL"
 
 FILESPATH = "${FILE_DIRNAME}/bluez-utils-${PV}:${FILE_DIRNAME}/bluez-utils"
 
-# ti patch should be sent it upstream!
 SRC_URI = "http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
            file://hcid.conf \
-           file://hciattach-ti-bts.patch;patch=1 \
            file://sbc-thumb.patch;patch=1"
 
 
diff --git a/recipes/bluez/bluez-utils_3.33.bb b/recipes/bluez/bluez-utils_3.33.bb
index dc098e3..322f841 100644
--- a/recipes/bluez/bluez-utils_3.33.bb
+++ b/recipes/bluez/bluez-utils_3.33.bb
@@ -2,6 +2,10 @@ require bluez-utils3.inc
 
 PR = "r3"
 
+# TI patch landed upstream sometime between 3.35 and 3.36, 
+# albeit in a somewhat different form
+SRC_URI += "file://hciattach-ti-bts.patch;patch=1" 
+
 # see bluez-utils3.inc for the explanation of these option
 EXTRA_OECONF = " \
                  --enable-bccmd \
diff --git a/recipes/bluez/bluez-utils_3.36.bb b/recipes/bluez/bluez-utils_3.36.bb
index bd319e8..20a9bad 100644
--- a/recipes/bluez/bluez-utils_3.36.bb
+++ b/recipes/bluez/bluez-utils_3.36.bb
@@ -2,11 +2,6 @@ require bluez-utils3.inc
 
 PR = "r4"
 
-# removed hciattach-ti-bts.patch (landed upstream)
-SRC_URI = "http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
-           file://hcid.conf \
-           file://sbc-thumb.patch;patch=1"
-
 # see bluez-utils3.inc for the explanation of these option
 EXTRA_OECONF = " \
                  --enable-bccmd \
-- 
1.6.0.4



