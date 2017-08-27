Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E61E7829B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 01:28:38 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 83so3587718pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MH5HDmxQxBl0j+34rWM191yiNoIkQOKqZYGLx9q7FFU=;
	b=UFEKDhQOHWBAtzL8+nbyHGJSUEKlIu+JyZ2o1IiAbk2fwl7rrGCTnPog2Gp+SNfsyb
	hPUZvdjEA1AYGHoQSs3vMzPMwj+e006HhEDxaFV3n2neC+hVIEGuedKcJmqr3IKwC/vC
	JmSzm6Pnl0sYDyvqtGEXgkJkAtEtyQsM1uaqJRYKAIm7/NAIlybyGbqN6v11Cezn/TmE
	Pw2n0dle4RQwDQC8JyLBZj7do8w3Lr8ru72UbicvFDmiFYpxSMnKlSvT5I8QQOdpFxYy
	CiB2dGJUtw0vT5cvkL0fOT3tf+dwfAVRLMr7HupTBZuIri0rnF/JSaU9nD8jgCtQqrha
	25MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MH5HDmxQxBl0j+34rWM191yiNoIkQOKqZYGLx9q7FFU=;
	b=PgN6SxWfh3/hza0yZUKD+a0EFnxfLolskk0QOlVsVd+GPkrxtfUl+y48GK77cJ315u
	FqTTeydhK+SeAHm22PZBpQKfuXJZ4U5dO93MWvy6WL6FIFQRXARPvmw4soWyB9RfZciU
	n9PT77zJYnk/Br93+K/h/BgY+dAzz63ZOuQhe71RulLVsZPK/cdypJZUSHKuQ0TDM6+c
	cFIARli/jeRhIOO9gEuc0Ui57m4dTOSdvvMuD7jmRge/lfcJWasHjdkjXrQSjUyAraRR
	wlVidjxnt2FfSvJmHjtW/PPnoloG9K9zlxun3hGK8U3AOuZKZLVHmP/kxyUGdFT/BkxW
	AUJA==
X-Gm-Message-State: AHYfb5i9UX+46/8XAtlE6j9/VR1Gk7/QM2jyi1S+d4oiKr9m0Ze2p5HQ
	5a0pvPvzXN3W9y2x
X-Received: by 10.84.209.171 with SMTP id y40mr3582991plh.118.1503797320206;
	Sat, 26 Aug 2017 18:28:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	f123sm19301150pfg.86.2017.08.26.18.28.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 18:28:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 18:28:28 -0700
Message-Id: <20170827012830.11782-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH 1/3] postfix: Fix build with security flags and clang
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
X-List-Received-Date: Sun, 27 Aug 2017 01:28:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...se-native-compiler-to-build-makedefs.test.patch | 64 ++++++++++++++++++++++
 .../recipes-daemons/postfix/files/icu-config.patch | 21 +++++++
 .../postfix/files/postfix-install.patch            | 26 +++++++++
 .../recipes-daemons/postfix/postfix.inc            |  2 +-
 .../recipes-daemons/postfix/postfix_3.2.2.bb       |  3 +
 5 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch
 create mode 100644 meta-networking/recipes-daemons/postfix/files/icu-config.patch
 create mode 100644 meta-networking/recipes-daemons/postfix/files/postfix-install.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch
new file mode 100644
index 000000000..763a4a9b9
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch
@@ -0,0 +1,64 @@
+From a0d0de10e4c5ab55bc2fa48798079e2876b1211d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 10:29:37 -0700
+Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
+
+Its a binary used during build
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ makedefs | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/makedefs b/makedefs
+index 9fd4bc2..5ee7747 100644
+--- a/makedefs
++++ b/makedefs
+@@ -526,7 +526,7 @@ int     main(int argc, char **argv)
+     exit(0);
+ }
+ EOF
+-			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
++			   ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c || exit 1
+ 			   rm -f makedefs.test makedefs.test.[co]
+ 		       fi;;
+ 		esac
+@@ -762,7 +762,7 @@ int     main(int argc, char **argv)
+     exit(0);
+ }
+ EOF
+-		   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
++		   ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c || exit 1
+ 		   ./makedefs.test 2>/dev/null ||
+ 			CCARGS="$CCARGS -DNO_SIGSETJMP"
+ 		   rm -f makedefs.test makedefs.test.[co]
+@@ -796,7 +796,7 @@ int main(int argc, char **argv)
+ 				  &error) != 14);
+ }
+ EOF
+-		    ${CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
++		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
+ 			$icu_ldflags >/dev/null 2>&1
+ 		    if ./makedefs.test 2>/dev/null ; then
+ 			CCARGS="$CCARGS $icu_cppflags"
+@@ -911,7 +911,7 @@ int     main(void)
+     exit(ferror(stdout) ? 1 : 0);
+ }
+ EOF
+-    eval ${CC-gcc} ${CCARGS} -o makedefs.test makedefs.test.c || exit 1
++    eval ${BUILD_CC-gcc} ${CCARGS} -o makedefs.test makedefs.test.c || exit 1
+     ./makedefs.test || exit 1
+     rm -f makedefs.test makedefs.test.[co]
+ }
+@@ -1067,7 +1067,7 @@ int     main(void)
+     exit(ferror(stdout) ? 1 : 0);
+ }
+ EOF
+-	eval ${CC-gcc} ${CCARGS} -o makedefs.test makedefs.test.c || exit 1
++	eval ${BUILD_CC-gcc} ${CCARGS} -o makedefs.test makedefs.test.c || exit 1
+ 	parm_val=`./makedefs.test` || exit 1
+ 	rm -f makedefs.test makedefs.test.[co]
+ 	eval ${parm_name}=\""\$parm_val"\"
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/postfix/files/icu-config.patch b/meta-networking/recipes-daemons/postfix/files/icu-config.patch
new file mode 100644
index 000000000..9bd9c2f03
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/icu-config.patch
@@ -0,0 +1,21 @@
+do not entertain cppflags from icu, this is because
+icu-config feeds the -I path without sysroot which
+caused native headers to be included and build is
+corrupted in any case its just adding -I/usr/include
+to the CCARGS which we loose nothing if its not
+entertained.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: postfix-3.2.2/makedefs
+===================================================================
+--- postfix-3.2.2.orig/makedefs
++++ postfix-3.2.2/makedefs
+@@ -799,7 +799,6 @@ EOF
+ 		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
+ 			$icu_ldflags >/dev/null 2>&1
+ 		    if ./makedefs.test 2>/dev/null ; then
+-			CCARGS="$CCARGS $icu_cppflags"
+ 			SYSLIBS="$SYSLIBS $icu_ldflags"
+ 		    else
+ 			CCARGS="$CCARGS -DNO_EAI"
diff --git a/meta-networking/recipes-daemons/postfix/files/postfix-install.patch b/meta-networking/recipes-daemons/postfix/files/postfix-install.patch
new file mode 100644
index 000000000..45479bd52
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/postfix-install.patch
@@ -0,0 +1,26 @@
+Index: postfix-3.2.2/postfix-install
+===================================================================
+--- postfix-3.2.2.orig/postfix-install
++++ postfix-3.2.2/postfix-install
+@@ -843,7 +843,7 @@ IFS="$BACKUP_IFS"
+ # the wrong place when Postfix is being upgraded.
+ 
+ case "$mail_version" in
+-"") mail_version="`$POSTCONF -dhx mail_version`" || exit 1
++"") mail_version="`$POSTCONF -c $CONFIG_DIRECTORY -dhx mail_version`" || exit 1
+ esac
+ 
+ # Undo MAIL_VERSION expansion at the end of a parameter value. If
+Index: postfix-3.2.2/Makefile.in
+===================================================================
+--- postfix-3.2.2.orig/Makefile.in
++++ postfix-3.2.2/Makefile.in
+@@ -20,7 +20,7 @@ META	= meta/main.cf.proto meta/master.cf
+ EXPAND	= sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
+ 	    -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
+ SHLIB_DIR_OVERRIDE = \
+-	$${shlib_directory:-`$(SHLIB_ENV) bin/postconf -dhx shlib_directory`}
++	$${shlib_directory:-`$(SHLIB_ENV) $(POSTCONF) -dhx shlib_directory`}
+ 
+ default: update
+ 
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index cb9d59f93..a588bd347 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -73,7 +73,7 @@ export CCARGS-sasl_class-native = ""
 export AUXLIBS-sasl_class-native = ""
 
 # PCRE, TLS support default
-export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
+export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
 export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
 export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
index 1118b2ed4..439ede9b6 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
@@ -10,6 +10,9 @@ SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV
            file://aliasesdb \
            file://check_hostname.sh \
            file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch \
+           file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
+           file://postfix-install.patch \
+           file://icu-config.patch \
            "
 SRC_URI[md5sum] = "aea073a9b0bea5bdb590460a270a4aa0"
 SRC_URI[sha256sum] = "d06849418d119d09366997b2b481bb23f737629769b4e4a52da42fb3ad8b0576"
-- 
2.14.1


