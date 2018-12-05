Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 983916C113
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 13:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 08:45:38 -0500
Message-Id: <20181205134538.24646-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Cc: anoo@us.ibm.com, dkodihal@in.ibm.com
Subject: [meta-oe][PATCH] rsyslog: curl-less build with fmhttp PACKAGECONFIG
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
X-List-Received-Date: Wed, 05 Dec 2018 13:46:09 -0000
Content-Transfer-Encoding: quoted-printable

With all other configure options at their defaults, the dependency on
libcurl can be removed if fmhttp is configured out.  Add an fmhttp
PACKAGECONFIG, still enabled by default, to enable this.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.37.0.bb
index fbdf2818c..1fb439015 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
@@ -9,7 +9,7 @@ Rsyslog is an enhanced syslogd supporting, among others, =
MySQL,\
  encryption protected syslog relay chains while at the same time being\
  very easy to setup for the novice user."
=20
-DEPENDS =3D "zlib libestr libfastjson bison-native flex-native libloggin=
g curl"
+DEPENDS =3D "zlib libestr libfastjson bison-native flex-native libloggin=
g"
 HOMEPAGE =3D "http://www.rsyslog.com/"
 LICENSE =3D "GPLv3 & LGPLv3 & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D51d9635e646fb75e1b74c074f788e=
973 \
@@ -43,7 +43,7 @@ EXTRA_OECONF +=3D "--disable-generate-man-pages ap_cv_a=
tomic_builtins=3Dyes"
 # first line is default yes in configure
 PACKAGECONFIG ??=3D " \
     rsyslogd rsyslogrt klog inet regexp uuid libgcrypt \
-    imdiag gnutls imfile \
+    fmhttp imdiag gnutls imfile \
     ${@bb.utils.filter('DISTRO_FEATURES', 'snmp systemd', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench relp ${V=
ALGRIND}', '', d)} \
 "
@@ -52,6 +52,7 @@ PACKAGECONFIG ??=3D " \
 PACKAGECONFIG[relp] =3D "--enable-relp,--disable-relp,librelp,"
 PACKAGECONFIG[rsyslogd] =3D "--enable-rsyslogd,--disable-rsyslogd,,"
 PACKAGECONFIG[rsyslogrt] =3D "--enable-rsyslogrt,--disable-rsyslogrt,,"
+PACKAGECONFIG[fmhttp] =3D "--enable-fmhttp,--disable-fmhttp,curl,"
 PACKAGECONFIG[inet] =3D "--enable-inet,--disable-inet,,"
 PACKAGECONFIG[klog] =3D "--enable-klog,--disable-klog,,"
 PACKAGECONFIG[regexp] =3D "--enable-regexp,--disable-regexp,,"
--=20
2.19.2

