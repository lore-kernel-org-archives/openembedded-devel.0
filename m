Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PNlJ7-0007fF-Ph
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 12:57:10 +0100
Received: by fxm17 with SMTP id 17so4528296fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 03:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=uLEBR6VDoNsUvpGPtxY7gxCsaMczi8kF5gbzue/LgqE=;
	b=rsIMPTvH3F4qxF8/BTILCIQkQbJmE6p5aWLgjsnD989MQv1HFayRcZoiFVx8Q8EQI/
	ypzqc4MuFcp/Q870u+qlxmWv6ak4RLlDz+2QRxR1OkZ/thLYOTnpLRT3ZdNfGyR/+aXa
	dwaQJzBaPIUJ7tKA3pBPmxHj2OcRcMKKCkySg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=D0CeQkEAYe0/9XftKS+6UXLZuZfcavSjQk/9AnEK8+flOgQDh8UAAp1wT/ZD1G5ZIq
	eqyTfqyyMBIa/bXF118VceRBcF4TyaAivNihDmd0aXl4Rr5JYZm8tm5Xrjlx4IfLoWEv
	iNFFD41t3QzRC5JGDeOJIvw9VKsh9QiC/cXxA=
Received: by 10.223.102.79 with SMTP id f15mr8135614fao.134.1291204548418;
	Wed, 01 Dec 2010 03:55:48 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm2028992faa.29.2010.12.01.03.55.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 03:55:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Dec 2010 12:55:40 +0100
Message-Id: <1291204540-4644-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1291204540-4644-1-git-send-email-Martin.Jansa@gmail.com>
References: <1291204540-4644-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] sane-srcrevs.inc: remove it from distro configs, and file itself
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
X-List-Received-Date: Wed, 01 Dec 2010 11:57:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/angstrom-2008.1.conf               |    1 -
 conf/distro/angstrom-2010.x.conf               |    1 -
 conf/distro/chinook-compat.conf                |    2 --
 conf/distro/include/preferred-shr-versions.inc |    3 ---
 conf/distro/include/slugos.inc                 |    1 -
 conf/distro/jlime-2010.1.conf                  |    1 -
 conf/distro/kaeilos-2010.conf                  |    1 -
 conf/distro/kaeilos.conf                       |    1 -
 conf/distro/maemo5-compat.conf                 |    2 --
 conf/distro/mamona.conf                        |    2 --
 conf/distro/metano.conf                        |    1 -
 conf/distro/micro.conf                         |    1 -
 conf/distro/minimal.conf                       |    1 -
 conf/distro/openprotium.conf                   |    2 --
 conf/distro/shr.conf                           |    1 -
 15 files changed, 0 insertions(+), 21 deletions(-)
 delete mode 100644 conf/distro/include/sane-srcrevs.inc

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 3fa8e3e..ec03276 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -20,7 +20,6 @@ DISTRO_PR = ".6"
 
 OLDEST_KERNEL ?= "2.6.16"
 
-require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/angstrom-2008-preferred-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
 
diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-2010.x.conf
index 5942dca..f2b20f9 100644
--- a/conf/distro/angstrom-2010.x.conf
+++ b/conf/distro/angstrom-2010.x.conf
@@ -25,7 +25,6 @@ DISTRO_PR = ".9"
 
 OLDEST_KERNEL ?= "2.6.16"
 
-require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/angstrom-2010-preferred-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
 
diff --git a/conf/distro/chinook-compat.conf b/conf/distro/chinook-compat.conf
index ca1e3ce..e9e2e1a 100644
--- a/conf/distro/chinook-compat.conf
+++ b/conf/distro/chinook-compat.conf
@@ -84,8 +84,6 @@ PREFERRED_VERSION_libtool-native = "1.5.10"
 PREFERRED_VERSION_libtool-cross = "1.5.10"
 PREFERRED_VERSION_libtool = "1.5.6"
 
-require conf/distro/include/sane-srcrevs.inc
-
 PREFERRED_VERSION_fontconfig       = "2.4.1"
 PREFERRED_VERSION_freetype         = "2.2.1"
 PREFERRED_VERSION_freetype-native  = "2.2.1"
diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index 6d3cec9..75c31d1 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -20,9 +20,6 @@ LINUX_LIBC_HEADERS_VERSION ?= "2.6.32"
 PREFERRED_VERSION_linux-libc-headers = "${LINUX_LIBC_HEADERS_VERSION}"
 PREFERRED_VERSION_linux-libc-headers-native = "${LINUX_LIBC_HEADERS_VERSION}"
 
-# override EFL_SRCREV from sane-srcrevs.inc
-# EFL_SRCREV ?= "44424"
-
 # specifically set an openssh version
 # NOTE: whenever changing the version here make sure
 #       to check we won't loose our specific config !!!
diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
deleted file mode 100644
index e69de29..0000000
diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
index eaa50bc..c2a380d 100644
--- a/conf/distro/include/slugos.inc
+++ b/conf/distro/include/slugos.inc
@@ -187,4 +187,3 @@ PREFERRED_PROVIDER_bluez-utils			= "bluez4"
 # Include any package preferred versions and srcrevs:
 
 require conf/distro/include/preferred-slugos-versions.inc
-require conf/distro/include/sane-srcrevs.inc
diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.conf
index f01b949..28c1dda 100644
--- a/conf/distro/jlime-2010.1.conf
+++ b/conf/distro/jlime-2010.1.conf
@@ -88,7 +88,6 @@ require conf/distro/include/arm-thumb.inc
 # Bootstrap & Init
 #
 PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
-require conf/distro/include/sane-srcrevs.inc
 
 #
 # Framebuffer & X
diff --git a/conf/distro/kaeilos-2010.conf b/conf/distro/kaeilos-2010.conf
index a9743dd..8575254 100644
--- a/conf/distro/kaeilos-2010.conf
+++ b/conf/distro/kaeilos-2010.conf
@@ -18,7 +18,6 @@ DISTRO_PR = ".2"
 
 OLDEST_KERNEL ?= "2.6.28"
 
-require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/kaeilos-2009-preferred-versions.inc
 require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index fdec1e9..815d40f 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -18,7 +18,6 @@ DISTRO_PR = ".6"
 
 OLDEST_KERNEL ?= "2.6.16"
 
-require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/kaeilos-2009-preferred-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
 
diff --git a/conf/distro/maemo5-compat.conf b/conf/distro/maemo5-compat.conf
index b3e5da0..c1f0e4b 100644
--- a/conf/distro/maemo5-compat.conf
+++ b/conf/distro/maemo5-compat.conf
@@ -81,8 +81,6 @@ PREFERRED_VERSION_libtool-native = "2.2.6b"
 PREFERRED_VERSION_libtool-cross = "2.2.6b"
 PREFERRED_VERSION_libtool = "2.2.6b"
 
-require conf/distro/include/sane-srcrevs.inc
-
 PREFERRED_VERSION_fontconfig       = "2.6.0"
 PREFERRED_VERSION_freetype         = "2.3.6"
 PREFERRED_VERSION_freetype-native  = "2.3.6"
diff --git a/conf/distro/mamona.conf b/conf/distro/mamona.conf
index a9df496..c834ca7 100644
--- a/conf/distro/mamona.conf
+++ b/conf/distro/mamona.conf
@@ -11,8 +11,6 @@ MAINTAINER = "Mamona Team <mamona-devel@garage.maemo.org>"
 
 TARGET_VENDOR = "-mamona"
 
-require conf/distro/include/sane-srcrevs.inc
-
 INHERIT += "angstrom-mirrors mamona-mirrors"
 INHERIT += "package_deb debian"
 INHERIT += "buildallpkgs"
diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
index d9fb1e9..7f82791 100644
--- a/conf/distro/metano.conf
+++ b/conf/distro/metano.conf
@@ -88,7 +88,6 @@ require conf/distro/include/arm-thumb.inc
 #############################################################################
 # PREFERRED VERSIONS
 #############################################################################
-require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index f3b9846..102afa1 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -77,7 +77,6 @@ MACHINE_OVERRIDES += "${MACHINE_CLASS}"
 #############################################################################
 # PREFERRED VERSIONS
 #############################################################################
-require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
 
 #############################################################################
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 5c7efbd..5b92a36 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -96,7 +96,6 @@ require conf/distro/include/arm-thumb.inc
 #############################################################################
 # PREFERRED VERSIONS
 #############################################################################
-require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
diff --git a/conf/distro/openprotium.conf b/conf/distro/openprotium.conf
index 749b832..902890c 100644
--- a/conf/distro/openprotium.conf
+++ b/conf/distro/openprotium.conf
@@ -75,5 +75,3 @@ PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
 PREFERRED_PROVIDER_virtual/db 		?= "db"
 PREFERRED_PROVIDER_virtual/db-native 	?= "db-native"
 PREFERRED_PROVIDER_gconf 		?= "gconf"
-
-require conf/distro/include/sane-srcrevs.inc
diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index 140a6d3..0258231 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -181,7 +181,6 @@ PREFERRED_PROVIDER_frameworkd-config = "frameworkd-config-shr"
 #############################################################################
 # PREFERRED VERSIONS
 #############################################################################
-require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
 
-- 
1.7.3.2



