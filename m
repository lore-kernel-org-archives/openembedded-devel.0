Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NTFJj-0004al-RG
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 14:55:58 +0100
Received: by fxm4 with SMTP id 4so16120363fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 05:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=cW6t6O9brlhXhEZDr36x9nchPvBc/L8mcHiB/TZMGYQ=;
	b=muwVLL2KVz5fY1bCz7/huAiJlYV03frNay7PrB9ee8UTmm2AQRVFCTfXAnUAMjCh+Q
	tETLXwztNfHcdbvVqc5aSufgDCdpSO4wxAuHd7sIiMYBRRikOhteKX95d8+R1p9/y+Au
	tQiUdAezsVICbygS5D5aRLIPex+RG/fje/OS8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ImkiWXApIGjLmisF8mIZOzWNgPiu5eH0ZzpPxBCshqqDveeneYZYw3r9XHlR3hZ2Qr
	EY9Z0tkdhtxbmnEtBF3ICsajsI4C1jApKXLMwAng+eah2ZgG8Gy2akWvqaa5P10YSSEw
	QXlj20T2G16YitySljyqYGRgZtGVWps2eGCGo=
Received: by 10.223.73.20 with SMTP id o20mr3487498faj.71.1262958829013;
	Fri, 08 Jan 2010 05:53:49 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm8262865fxm.15.2010.01.08.05.53.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Jan 2010 05:53:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jan 2010 14:53:33 +0100
Message-Id: <1262958813-4030-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <20100108132344.GB2156@jama>
References: <20100108132344.GB2156@jama>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] task-boot: use DISTRO_UPDATE_ALTERNATIVES instead of update-alternatives directly
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
X-List-Received-Date: Fri, 08 Jan 2010 13:55:59 -0000

* make opkg RCONFLICTS with update-alternatives-cworth because both
  do the same but installs alternatives to different directory
  (/usr/lib/ipkg/alternatives and /usr/lib/opkg/alternatives)
* Images built after 2009-12-08 9b641bbfed07c075ae5cbe84082a85f1ba703447
  probably use opkg-native, but also ship with u-a-cworth
* Upgrade path is quite difficult, because users should remove cworth
  (RCONFLICT in opkg) and merge alternatives to opkg/alternatives
---
 recipes/opkg/opkg.inc      |    4 +++-
 recipes/tasks/task-boot.bb |   10 ++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index 1716034..caf90e7 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -4,10 +4,12 @@ SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "curl gpgme"
 PV = "0.1.6+svnr${SRCPV}"
-INC_PR = "r18"
+INC_PR = "r19"
 
 FILESPATHPKG =. "opkg:"
 
+RCONFLICTS_${PN} = "update-alternatives-cworth"
+
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 	file://opkg_unarchive.patch;patch=1;maxrev=201 \
 	file://opkg-intercept-cleanup.patch;patch=1;maxrev=241 \
diff --git a/recipes/tasks/task-boot.bb b/recipes/tasks/task-boot.bb
index 04c5535..45d50ef 100644
--- a/recipes/tasks/task-boot.bb
+++ b/recipes/tasks/task-boot.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Basic task to get a device booting"
-PR = "r51"
+PR = "r52"
 
 inherit task
 
@@ -13,6 +13,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
+# update-alternatives script installed in rootfs needs to be the same as
+# u-a script used for building image which is defined with
+# PREFERRED_PROVIDER_virtual/update-alternatives-native
+
+DISTRO_UPDATE_ALTERNATIVES ?= "${PREFERRED_PROVIDER_virtual/update-alternatives}"
+
 # Make sure we build the kernel
 DEPENDS = "virtual/kernel"
 
@@ -26,7 +32,7 @@ RDEPENDS_task-boot = "\
     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     modutils-initscripts \
     netbase \
-    update-alternatives \
+    ${DISTRO_UPDATE_ALTERNATIVES} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS} \
     "
 
-- 
1.6.6



