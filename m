Received: from [209.85.216.196] (helo=mail-px0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mk7sQ-0007Xa-Jt
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 04:53:14 +0200
Received: by pxi34 with SMTP id 34so1579123pxi.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 19:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=D8XHqlgeDrbNgatONjHh7jS62lGgbd+wA9rgDr6233w=;
	b=Fl3Eeiz1MXGScR6aYwXLl3Axj1qKP8wEG4hNtqG7zMJvqhliKHBu7X22RfZqHcZ6K7
	9tWMm+8iyu6RttA2vrVea37dSjFwTeC/pD/yu2tvvsDwSaaL03N/LNDp1BAH2RgvpNf2
	p/ebAh7/Rc1F2EoFOH3vrxDJeojOgZK50MbNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WZYdBqVi7+0rHZ9uegOsadhWJt6QQ/AD/AyELSiIYovd0UeiyPojTyqBttMS52cQOE
	Ok/Cat3jvLUCLfTGFX5OU4VGd1fnLJnGIbQWl0C4ch9sTde0YAiCDO9OsF4jAqNUWW3Z
	pq3gfZImwxYezm1Yn064ymQzJ9NnVYS28hbMY=
Received: by 10.114.236.32 with SMTP id j32mr12730400wah.141.1252204442262;
	Sat, 05 Sep 2009 19:34:02 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 20sm1681187pxi.12.2009.09.05.19.34.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Sep 2009 19:34:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Sep 2009 19:33:57 -0700
Message-Id: <1252204437-4875-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] autoconf: Fix canadian cross build
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
X-List-Received-Date: Sun, 06 Sep 2009 02:53:15 -0000

* Remove RDEPENDS and DEPENDS duplication.
* path_prog_fixes.patch is not needed for 2.61
* Use INC_PR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/autoconf/autoconf-native_2.59.bb    |    2 ++
 recipes/autoconf/autoconf-native_2.61.bb    |    1 +
 recipes/autoconf/autoconf-native_2.63.bb    |    1 +
 recipes/autoconf/autoconf.inc               |    1 +
 recipes/autoconf/autoconf213-native_2.13.bb |    2 ++
 recipes/autoconf/autoconf213_2.13.bb        |    2 +-
 recipes/autoconf/autoconf_2.57.bb           |    2 +-
 recipes/autoconf/autoconf_2.59.bb           |    4 +---
 recipes/autoconf/autoconf_2.61.bb           |    8 ++------
 recipes/autoconf/autoconf_2.63.bb           |    5 ++---
 10 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/recipes/autoconf/autoconf-native_2.59.bb b/recipes/autoconf/autoconf-native_2.59.bb
index aa4871e..a2b9dfa 100644
--- a/recipes/autoconf/autoconf-native_2.59.bb
+++ b/recipes/autoconf/autoconf-native_2.59.bb
@@ -1,5 +1,7 @@
 require autoconf_${PV}.bb
 
+PR = "${INC_PR}.0"
+
 DEPENDS = "m4-native gnu-config-native"
 RDEPENDS_${PN} = "m4-native gnu-config-native"
 
diff --git a/recipes/autoconf/autoconf-native_2.61.bb b/recipes/autoconf/autoconf-native_2.61.bb
index ad6cb79..b7480cd 100644
--- a/recipes/autoconf/autoconf-native_2.61.bb
+++ b/recipes/autoconf/autoconf-native_2.61.bb
@@ -1,4 +1,5 @@
 require autoconf_${PV}.bb
+PR = "${INC_PR}.0"
 
 DEPENDS = "m4-native gnu-config-native"
 RDEPENDS_${PN} = "m4-native gnu-config-native"
diff --git a/recipes/autoconf/autoconf-native_2.63.bb b/recipes/autoconf/autoconf-native_2.63.bb
index ad6cb79..b7480cd 100644
--- a/recipes/autoconf/autoconf-native_2.63.bb
+++ b/recipes/autoconf/autoconf-native_2.63.bb
@@ -1,4 +1,5 @@
 require autoconf_${PV}.bb
+PR = "${INC_PR}.0"
 
 DEPENDS = "m4-native gnu-config-native"
 RDEPENDS_${PN} = "m4-native gnu-config-native"
diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
index 7761af0..a05f2ae 100644
--- a/recipes/autoconf/autoconf.inc
+++ b/recipes/autoconf/autoconf.inc
@@ -10,3 +10,4 @@ SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
 	   file://program_prefix.patch;patch=1"
 
 inherit autotools
+INC_PR = "r6"
diff --git a/recipes/autoconf/autoconf213-native_2.13.bb b/recipes/autoconf/autoconf213-native_2.13.bb
index 3954ef3..97d4413 100644
--- a/recipes/autoconf/autoconf213-native_2.13.bb
+++ b/recipes/autoconf/autoconf213-native_2.13.bb
@@ -7,3 +7,5 @@ S = "${WORKDIR}/autoconf-${PV}"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/autoconf-${PV}"
 
 inherit native
+PR = "${INC_PR}.0"
+
diff --git a/recipes/autoconf/autoconf213_2.13.bb b/recipes/autoconf/autoconf213_2.13.bb
index 022f696..d06822c 100644
--- a/recipes/autoconf/autoconf213_2.13.bb
+++ b/recipes/autoconf/autoconf213_2.13.bb
@@ -1,5 +1,5 @@
 require autoconf.inc
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz"
-PR = "r1"
 EXTRA_OECONF = "--program-transform-name=s/\$/2.13/"
 EXTRA_OEMAKE = 'acdatadir="${datadir}/autoconf-${PV}" infodir="${datadir}/autoconf-${PV}/info"'
+PR = "${INC_PR}.0"
diff --git a/recipes/autoconf/autoconf_2.57.bb b/recipes/autoconf/autoconf_2.57.bb
index 6c2906a..0fc5f94 100644
--- a/recipes/autoconf/autoconf_2.57.bb
+++ b/recipes/autoconf/autoconf_2.57.bb
@@ -1,2 +1,2 @@
 require autoconf.inc
-PR = "r1"
+PR = "${INC_PR}.0"
diff --git a/recipes/autoconf/autoconf_2.59.bb b/recipes/autoconf/autoconf_2.59.bb
index f59f8fa..a8f357f 100644
--- a/recipes/autoconf/autoconf_2.59.bb
+++ b/recipes/autoconf/autoconf_2.59.bb
@@ -1,8 +1,6 @@
 require autoconf.inc
 
-DEPENDS += "m4-native"
-RDEPENDS_${PN} = "m4 gnu-config"
-PR = "r6"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://autoreconf-include.patch;patch=1 \
 	   file://autoreconf-exclude.patch;patch=1 \
diff --git a/recipes/autoconf/autoconf_2.61.bb b/recipes/autoconf/autoconf_2.61.bb
index 6b92dc8..c3ccacd 100644
--- a/recipes/autoconf/autoconf_2.61.bb
+++ b/recipes/autoconf/autoconf_2.61.bb
@@ -1,16 +1,12 @@
 require autoconf.inc
 
-PR = "r1"
+PR = "${INC_PR}.1"
 
 PARALLEL_MAKE = ""
 
-DEPENDS += "m4-native"
-RDEPENDS_${PN} = "m4 gnu-config"
-
 SRC_URI += "file://autoreconf-include.patch;patch=1 \
 	   file://autoreconf-exclude.patch;patch=1 \
 	   file://autoreconf-foreign.patch;patch=1 \
 	   file://autoreconf-gnuconfigize.patch;patch=1 \
 	   file://autoheader-nonfatal-warnings.patch;patch=1 \
-	   file://config-site.patch;patch=1 \
-	   ${@['file://path_prog_fixes.patch;patch=1', ''][bb.data.inherits_class('native', d)]}"
+	   file://config-site.patch;patch=1 "
diff --git a/recipes/autoconf/autoconf_2.63.bb b/recipes/autoconf/autoconf_2.63.bb
index 0230d79..6963baf 100644
--- a/recipes/autoconf/autoconf_2.63.bb
+++ b/recipes/autoconf/autoconf_2.63.bb
@@ -1,12 +1,11 @@
 require autoconf.inc
 
+PR = "${INC_PR}.0"
+
 DEFAULT_PREFERENCE = "-1"
 
 PARALLEL_MAKE = ""
 
-DEPENDS += "m4-native"
-RDEPENDS_${PN} = "m4 gnu-config"
-
 SRC_URI += " \
 	   file://autoreconf-exclude.patch;patch=1 \
 	   file://autoreconf-foreign.patch;patch=1 \
-- 
1.6.3.3



