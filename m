Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D9DF578F5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:50:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h10-v6so14837253wre.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 09:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=U/YF7N95kU8qWxkmYzrovRWOi67XgA1HuEgQreYLqyc=;
	b=UwEIVL0SgIlBXwH0lGO/rmkpiL+CAv/q/UTjp/gGOEGGjfdBAtYYG88IT10hgDL/ua
	Zp3yxdcmgAJxmSD6cr6qIyWARGdKC5vLnFDmGM45ug+8BC+BpgaBwSWqjydP/N2VBdkJ
	Wznorcvr/B0Pq35ID4nLA7PLHuB0Qj7Tiht0BCAHxAz124UGtPZs7XwxiBeddcwLGGZ7
	99BT6qXIXbzl1TRNRHuZT2t8VfFLw1E0TNuABQHEvLVl0k2ZfG0LhI1t/USK6pkQBY6J
	bxh6LRp8j45X8hHYYud51iJYS2eHlaM12sTHZ9ONLrFvEmjEGexaJmVewMt2lB5jnNEA
	Rf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U/YF7N95kU8qWxkmYzrovRWOi67XgA1HuEgQreYLqyc=;
	b=ZZJyJx9PUE8wqRBs4dkgQURoNdkUh4H9A4IPOrwFg2kKpvKvep8mTlkXYP7RyRKIt8
	EVuv+xKQj4/ja5TRcUiLMeacAx4+4hvah8tXxDFlVRr2K26Pw1cIlaFR5y8RcwwVCT4E
	fH59HsNUQgkCNh/ObRSXCQeVhVAPBIfznDPh7bQvtSy/2DhT/OOwERAq61+IZstCCTrn
	tjKXIeuRCj4zBhkIEzyiM/FM4+LfgCgF7Ke4oh5B1XHeUKuzdodjrXQCgPUAJCDoLQsi
	GQvx7QA2HGtDEuA10xHRQgxZMmRgj3HuZoBGTzi+teN///E7twztc/XnUGTwrW9i6TZ7
	KBKw==
X-Gm-Message-State: AOUpUlEbJBcUfHeKp7jRzOxdbesIw/pWroxSH9zjBhHkvF+ZMOhxKCW1
	CvOfDkqrL/c7MLfqi5Eo8um8UpTBfmw=
X-Google-Smtp-Source: AA+uWPzwuJIRv1Ic8xNiuMtBZomDt3wnYd3a0VOE7wmSIb/ZkbRZNiI8a0DVqbmncSVNCPZTGoH/UQ==
X-Received: by 2002:a5d:4c4c:: with SMTP id
	n12-v6mr11493736wrt.71.1534179006219; 
	Mon, 13 Aug 2018 09:50:06 -0700 (PDT)
Received: from yevgeny-lnx.localdomain ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	b2-v6sm11776410wmh.3.2018.08.13.09.50.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Aug 2018 09:50:05 -0700 (PDT)
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 19:49:53 +0300
Message-Id: <1534178993-13146-1-git-send-email-yevgenyp@pointgrab.com>
X-Mailer: git-send-email 2.7.4
Cc: Yevgeny Popovych <yevgenyp@pointgrab.com>
Subject: [meta-java][PATCH] dbus-java: Do not build any documentation
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
X-List-Received-Date: Mon, 13 Aug 2018 16:50:06 -0000

Support for respective docbook tools has been removed in pyro release.

Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
Cc: Henning Heinold <henning@itconsulting-heinold.de>
Cc: Maxin John <maxin.john@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-extended/dbus/dbus-java_2.7.bb | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/recipes-extended/dbus/dbus-java_2.7.bb b/recipes-extended/dbus/dbus-java_2.7.bb
index 4964cf8..0b093a0 100644
--- a/recipes-extended/dbus/dbus-java_2.7.bb
+++ b/recipes-extended/dbus/dbus-java_2.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://dbus.freedesktop.org/doc/dbus-java"
 SECTION = "libs"
 LICENSE = "LGPL-2.1 & AFL-2.1"
 
-DEPENDS = "libmatthew docbook-utils-native docbook-sgml-dtd-4.1-native fastjar-native"
+DEPENDS = "libmatthew gettext-native fastjar-native"
 RDEPENDS_${PN}-viewer = "java2-runtime libunixsocket-java ${PN}-bin libmatthew-debug-java ${JPN}"
 RDEPENDS_${PN}-bin = "java2-runtime libunixsocket-java libmatthew-debug-java ${JPN}"
 RSUGGESTS_${JPN} = "libunixsocket-java"
@@ -49,15 +49,6 @@ do_compile () {
 		JAVAUNIXJARDIR=${datadir_java} \
 		JAVAUNIXLIBDIR=${libdir_jni} \
 		bin
-
-	# Generate man pages.
-	oe_runmake \
-		JAVAC="oefatal \"No Java compilation expected here.\"" \
-		JAR="oefatal \"No jar invocation expected here.\"" \
-		JARPREFIX=${datadir_java} \
-		JAVAUNIXJARDIR=${datadir_java} \
-		JAVAUNIXLIBDIR=${libdir_jni} \
-		man
 }
 
 JARFILENAME = "${JPN}-${PV}.jar"
@@ -73,20 +64,11 @@ do_install () {
   install bin/CreateInterface ${D}${bindir}
   install bin/ListDBus ${D}${bindir}
   install bin/DBusDaemon ${D}${bindir}
-
-	oe_runmake \
-		JAVAC="oefatal \"No Java compilation expected here.\"" \
-		JAR="oefatal \"No jar invocation expected here.\"" \
-		MANPREFIX=${D}${mandir} \
-		DOCPREFIX=${D}${docdir}/${JPN} \
-		install-man
 }
 
 # ${JPN} must be last otherwise it would pick up dbus-viewer*.jar
 # and dbus-bin*.jar
-PACKAGES = "${PN}-viewer ${PN}-viewer-doc ${PN}-bin ${PN}-bin-doc ${JPN}"
+PACKAGES = "${PN}-viewer ${PN}-bin ${JPN}"
 
 FILES_${PN}-viewer = "${datadir}/java/dbus-java-viewer*.jar ${bindir}/DBusViewer"
-FILES_${PN}-viewer-doc = "${mandir}/DBusViewer*"
 FILES_${PN}-bin = "${datadir}/java/dbus-java-bin*.jar ${bindir}"
-FILES_${PN}-bin-doc = "${mandir} ${docdir}/${JPN}"
-- 
2.7.4


