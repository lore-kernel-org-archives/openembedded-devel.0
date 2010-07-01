Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OU8Cn-0006Jz-AS
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 03:05:08 +0200
Received: by pvg13 with SMTP id 13so665998pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 17:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=1n9lqkjMnZ9G9hLByUco7pysb5cbtfLe8Zc+MvJ/bKE=;
	b=VcR4/r8sr+hUgB5vdOqfWi4pL6YoXjTnHtkb/w/rGA1cH1fmp8v4G6XE3hYUOFQowZ
	N4aAUfCqubwCV+hI/i0VlPSpAxlAAPGO848InP6buUUarSFtSu0R9lPzGuZRKzhC/wF/
	8fv6QYizVWMA6qhynQ2tremyo0mp1aWApjSXs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=cH76CtwXIQCxFMJvfGSSwESf9lsHOpTFrojib4lQUHp13APRsePfE0zCWknJohMNNy
	e7nVoM1+0V2Rz3DD5Zen+0sZ+3CY8neMIxE/D1Iuuu3nApJ6xAPIdxx61WJURZpOFG1q
	20Xa91iIbN1JSN4G940pKUCkMlIGpDTk0v+HU=
Received: by 10.142.177.6 with SMTP id z6mr2261485wfe.122.1277945996091;
	Wed, 30 Jun 2010 17:59:56 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	i19sm6461039rvn.16.2010.06.30.17.59.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Jun 2010 17:59:55 -0700 (PDT)
Message-ID: <4C2BE886.8000900@gmail.com>
Date: Thu, 01 Jul 2010 10:29:50 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] xserver-kdrive_1.5.3.bb: enable the XCALIBRATE extension.
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
X-List-Received-Date: Thu, 01 Jul 2010 01:05:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../xserver-kdrive-1.5.3/enable-xcalibrate.patch   |   58 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-kdrive_1.5.3.bb       |    3 +-
 2 files changed, 60 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-kdrive-1.5.3/enable-xcalibrate.patch

diff --git a/recipes/xorg-xserver/xserver-kdrive-1.5.3/enable-xcalibrate.patch b/recipes/xorg-xserver/xserver-kdrive-1.5.3/enable-xcalibrate.patch
new file mode 100644
index 0000000..ed6c5dc
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-kdrive-1.5.3/enable-xcalibrate.patch
@@ -0,0 +1,58 @@
+diff -ur xorg-server-1.5.3-blah/configure.ac xorg-server-1.5.3/configure.ac
+--- xorg-server-1.5.3-blah/configure.ac	2010-07-01 09:54:18.000000000 +0930
++++ xorg-server-1.5.3/configure.ac	2010-07-01 09:59:24.000000000 +0930
+@@ -544,6 +544,7 @@
+ AC_ARG_ENABLE(xace,           AS_HELP_STRING([--disable-xace], [Build X-ACE extension (default: enabled)]), [XACE=$enableval], [XACE=yes])
+ AC_ARG_ENABLE(xselinux,       AS_HELP_STRING([--disable-xselinux], [Build SELinux extension (default: disabled)]), [XSELINUX=$enableval], [XSELINUX=no])
+ AC_ARG_ENABLE(xcsecurity,     AS_HELP_STRING([--disable-xcsecurity], [Build Security extension (default: disabled)]), [XCSECURITY=$enableval], [XCSECURITY=no])
++AC_ARG_ENABLE(xcalibrate,     AS_HELP_STRING([--enable-xcalibrate], [Build XCalibrate extension (default: disabled)]), [XCALIBRATE=$enableval], [XCALIBRATE=no])
+ AC_ARG_ENABLE(appgroup,       AS_HELP_STRING([--disable-appgroup], [Build XC-APPGROUP extension (default: disabled)]), [APPGROUP=$enableval], [APPGROUP=$XCSECURITY])
+ AC_ARG_ENABLE(xcalibrate,     AS_HELP_STRING([--enable-xcalibrate], [Build XCalibrate extension (default: disabled)]), [XCALIBRATE=$enableval], [XCALIBRATE=no])
+ AC_ARG_ENABLE(tslib,          AS_HELP_STRING([--enable-tslib], [Build kdrive tslib touchscreen support (default: disabled)]), [TSLIB=$enableval], [TSLIB=no])
+@@ -906,6 +907,12 @@
+ 	AC_DEFINE(XCSECURITY, 1, [Build Security extension])
+ fi
+ 
++AM_CONDITIONAL(XCALIBRATE, [test "x$XCALIBRATE" = xyes])
++if test "x$XCALIBRATE" = xyes; then
++	AC_DEFINE(XCALIBRATE, 1, [Build XCalibrate extension])
++	REQUIRED_MODULES="$REQUIRED_MODULES xcalibrateproto"
++fi
++
+ AM_CONDITIONAL(XEVIE, [test "x$XEVIE" = xyes])
+ if test "x$XEVIE" = xyes; then
+ 	AC_DEFINE(XEVIE, 1, [Build XEvIE extension])
+diff -ur xorg-server-1.5.3-blah/include/kdrive-config.h.in xorg-server-1.5.3/include/kdrive-config.h.in
+--- xorg-server-1.5.3-blah/include/kdrive-config.h.in	2010-07-01 09:54:18.000000000 +0930
++++ xorg-server-1.5.3/include/kdrive-config.h.in	2010-07-01 09:55:02.000000000 +0930
+@@ -31,4 +31,7 @@
+ /* Have execinfo.h for backtrace(). */
+ #undef HAVE_EXECINFO_H
+ 
++/* Enable XCalibrate extension */
++#undef XCALIBRATE
++
+ #endif /* _KDRIVE_CONFIG_H_ */
+diff -ur xorg-server-1.5.3-blah/mi/miinitext.c xorg-server-1.5.3/mi/miinitext.c
+--- xorg-server-1.5.3-blah/mi/miinitext.c	2010-07-01 09:54:17.000000000 +0930
++++ xorg-server-1.5.3/mi/miinitext.c	2010-07-01 09:55:02.000000000 +0930
+@@ -374,6 +374,9 @@
+ #ifdef DMXEXT
+ extern void DMXExtensionInit(INITARGS);
+ #endif
++#ifdef XCALIBRATE
++extern void XCalibrateExtensionInit(INITARGS);
++#endif
+ #ifdef XEVIE
+ extern void XevieExtensionInit(INITARGS);
+ #endif
+@@ -664,6 +667,9 @@
+     GlxPushProvider(&__glXDRISWRastProvider);
+     if (!noGlxExtension) GlxExtensionInit();
+ #endif
++#ifdef  XCALIBRATE
++    XCalibrateExtensionInit ();
++#endif
+ }
+ 
+ void
diff --git a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb b/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
index 7fbdff2..9fa5579 100644
--- a/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
+++ b/recipes/xorg-xserver/xserver-kdrive_1.5.3.bb
@@ -6,7 +6,7 @@ RDEPENDS_${PN} += "hal"
 DEFAULT_PREFERENCE = "-99" 
 
 PE = "1"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	${KDRIVE_COMMON_PATCHES} \
@@ -21,6 +21,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
 	file://drmfix.patch \
 	file://no_xkb.patch \
 	file://keyboard_device.patch \
+	file://enable-xcalibrate.patch \
         "
 
 S = "${WORKDIR}/xorg-server-${PV}"
-- 
1.7.1



