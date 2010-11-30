Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PNP9t-0003Db-38
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 13:18:09 +0100
Received: by fxm17 with SMTP id 17so3446477fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 04:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qnY7NOPWb+kCMihHZJK69dH4Aixh6m6xhaMq/bs8Bl0=;
	b=JcEhinwVFfy0y6fjyHAyDpdh30Li4h5DwoNSnwVDlBjD7+QS6g/gdkJiiEYJC5gSC2
	nlhTqBu4+oiKD1keOz/r3riDTRVf13YmL4+FIrW52uuehcJwZ1BZxKQpwkivzCYwV9Uq
	WmmuOG977jFFkOEf3jYsYRvei641o5GYtM85o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=pSIqzAPPefHTuWdWGN/6jTdcJg2SfnCLJlCNnuluFi+6DPEdvnP2VTQBcRX8omUvCq
	qbzgj6VZcNASVXzHQ0fZjMKNIXHcyGV2MiJC49T2r2HpYpL4qW2whz6issy2TfzP4gs6
	cB/ynCh9QAMtItw/hY1bVP7N0zMVcDjeGpPMA=
Received: by 10.223.125.207 with SMTP id z15mr6682078far.42.1291119408911;
	Tue, 30 Nov 2010 04:16:48 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l14sm1591540fan.33.2010.11.30.04.16.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 04:16:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Nov 2010 13:17:03 +0100
Message-Id: <1291119423-4541-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <4CF4E21A.90009@opendreambox.org>
References: <4CF4E21A.90009@opendreambox.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2] sane-srcdates.inc: remove from all distro configs as well as file itself
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
X-List-Received-Date: Tue, 30 Nov 2010 12:18:09 -0000

* it's empty for > 6 months
* entries were moved to recipes
* SRCREV instead of SRCDATE is preferred anyways http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=8da9744fcdf856abebcfbe9e3bc1b8cf07bc317b

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/angstrom-2008.1.conf      |    1 -
 conf/distro/angstrom-2010.x.conf      |    1 -
 conf/distro/celinux-test.conf         |    3 ---
 conf/distro/foonas.conf               |    1 -
 conf/distro/include/slugos.inc        |    1 -
 conf/distro/jlime-2010.1.conf         |    1 -
 conf/distro/kaeilos-2010.conf         |    1 -
 conf/distro/kaeilos.conf              |    1 -
 conf/distro/mamona.conf               |    1 -
 conf/distro/metano.conf               |    1 -
 conf/distro/micro.conf                |    1 -
 conf/distro/minimal.conf              |    1 -
 conf/distro/openprotium.conf          |    1 -
 conf/distro/oplinux-uclibc.conf       |    1 -
 conf/distro/oplinux.conf              |    1 -
 conf/distro/shr.conf                  |    1 -
 16 files changed, 0 insertions(+), 18 deletions(-)
 delete mode 100644 conf/distro/include/sane-srcdates.inc

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 1fd5ab6..3fa8e3e 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -20,7 +20,6 @@ DISTRO_PR = ".6"
 
 OLDEST_KERNEL ?= "2.6.16"
 
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/angstrom-2008-preferred-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-2010.x.conf
index 1cc9060..2d15670 100644
--- a/conf/distro/angstrom-2010.x.conf
+++ b/conf/distro/angstrom-2010.x.conf
@@ -25,7 +25,6 @@ DISTRO_PR = ".9"
 
 OLDEST_KERNEL ?= "2.6.16"
 
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/angstrom-2010-preferred-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
diff --git a/conf/distro/celinux-test.conf b/conf/distro/celinux-test.conf
index fbc96e1..250fe16 100644
--- a/conf/distro/celinux-test.conf
+++ b/conf/distro/celinux-test.conf
@@ -25,9 +25,6 @@ DISTRO_VERSION = "${DATE}"
 DISTRO_TYPE = "debug"
 # DISTRO_TYPE = "release"
 
-# fixed SRCDATE for many packages
-require conf/distro/include/sane-srcdates.inc
-
 # fix it to one date but allow to override in local.conf if needed
 SRCDATE ?= "20060927"
 
diff --git a/conf/distro/foonas.conf b/conf/distro/foonas.conf
index 57d73a0..3d530a642 100644
--- a/conf/distro/foonas.conf
+++ b/conf/distro/foonas.conf
@@ -41,7 +41,6 @@ IMAGE_PREPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/usr/lib/ipkg/lists/*"
 IMAGE_POSTPROCESS_COMMAND += "${MACHINE}_pack_image;"
 IMAGE_DEVICE_TABLE = "${@bb.which(bb.data.getVar('BBPATH', d, 1), 'files/device_table-slugos.txt')}"
 
-require conf/distro/include/sane-srcdates.inc                                                         
 PREFERRED_VERSION_openlink = "svn"
 PREFERRED_VERSION_dtc = "20070216"
 PREFERRED_VERSION_dtc-native = "20070216"
diff --git a/conf/distro/include/sane-srcdates.inc b/conf/distro/include/sane-srcdates.inc
deleted file mode 100644
index e69de29..0000000
diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
index 4c509c6..eaa50bc 100644
--- a/conf/distro/include/slugos.inc
+++ b/conf/distro/include/slugos.inc
@@ -187,5 +187,4 @@ PREFERRED_PROVIDER_bluez-utils			= "bluez4"
 # Include any package preferred versions and srcrevs:
 
 require conf/distro/include/preferred-slugos-versions.inc
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.conf
index 9741026..f01b949 100644
--- a/conf/distro/jlime-2010.1.conf
+++ b/conf/distro/jlime-2010.1.conf
@@ -88,7 +88,6 @@ require conf/distro/include/arm-thumb.inc
 # Bootstrap & Init
 #
 PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 
 #
diff --git a/conf/distro/kaeilos-2010.conf b/conf/distro/kaeilos-2010.conf
index 618d47c..a9743dd 100644
--- a/conf/distro/kaeilos-2010.conf
+++ b/conf/distro/kaeilos-2010.conf
@@ -18,7 +18,6 @@ DISTRO_PR = ".2"
 
 OLDEST_KERNEL ?= "2.6.28"
 
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/kaeilos-2009-preferred-versions.inc
 require conf/distro/include/preferred-e-versions.inc
diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index 09a48e2..fdec1e9 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -18,7 +18,6 @@ DISTRO_PR = ".6"
 
 OLDEST_KERNEL ?= "2.6.16"
 
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/kaeilos-2009-preferred-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
diff --git a/conf/distro/mamona.conf b/conf/distro/mamona.conf
index 31d6c36..a9df496 100644
--- a/conf/distro/mamona.conf
+++ b/conf/distro/mamona.conf
@@ -11,7 +11,6 @@ MAINTAINER = "Mamona Team <mamona-devel@garage.maemo.org>"
 
 TARGET_VENDOR = "-mamona"
 
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 
 INHERIT += "angstrom-mirrors mamona-mirrors"
diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
index 9bab8d9..d9fb1e9 100644
--- a/conf/distro/metano.conf
+++ b/conf/distro/metano.conf
@@ -88,7 +88,6 @@ require conf/distro/include/arm-thumb.inc
 #############################################################################
 # PREFERRED VERSIONS
 #############################################################################
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index b3f099a..f3b9846 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -77,7 +77,6 @@ MACHINE_OVERRIDES += "${MACHINE_CLASS}"
 #############################################################################
 # PREFERRED VERSIONS
 #############################################################################
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
 
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index afa8ac6..5c7efbd 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -96,7 +96,6 @@ require conf/distro/include/arm-thumb.inc
 #############################################################################
 # PREFERRED VERSIONS
 #############################################################################
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
diff --git a/conf/distro/openprotium.conf b/conf/distro/openprotium.conf
index 4e0f472..749b832 100644
--- a/conf/distro/openprotium.conf
+++ b/conf/distro/openprotium.conf
@@ -76,5 +76,4 @@ PREFERRED_PROVIDER_virtual/db 		?= "db"
 PREFERRED_PROVIDER_virtual/db-native 	?= "db-native"
 PREFERRED_PROVIDER_gconf 		?= "gconf"
 
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-uclibc.conf
index 480602b..432851d 100644
--- a/conf/distro/oplinux-uclibc.conf
+++ b/conf/distro/oplinux-uclibc.conf
@@ -15,7 +15,6 @@
 #-----------------------------------------------------------------------------
 
 require conf/distro/include/oplinux.inc
-require conf/distro/include/sane-srcdates.inc
 
 #
 # Header
diff --git a/conf/distro/oplinux.conf b/conf/distro/oplinux.conf
index c8c7cfd..c20d885 100644
--- a/conf/distro/oplinux.conf
+++ b/conf/distro/oplinux.conf
@@ -18,7 +18,6 @@
 #-----------------------------------------------------------------------------
 
 require conf/distro/include/oplinux.inc
-require conf/distro/include/sane-srcdates.inc
 
 
 #
diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index 04ee301..140a6d3 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -181,7 +181,6 @@ PREFERRED_PROVIDER_frameworkd-config = "frameworkd-config-shr"
 #############################################################################
 # PREFERRED VERSIONS
 #############################################################################
-require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
 require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
-- 
1.7.3.2



