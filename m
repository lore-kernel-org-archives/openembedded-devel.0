Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PmqGK-0004ky-R5
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 17:17:57 +0100
Received: by yxd5 with SMTP id 5so2316189yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 08:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=k7EmNf0h8IF38JXdoLL6hed7G842zAUJcswL1L79Ko0=;
	b=YvjIa7Q5LQ1kSr2+5i2MMQ9YZ3T028sKb4p0E8IRldLMkVdX5Rta/OxvuCqUir/U4J
	LhVCF69kMKgBkcdw8ldXhn4EtNlg6+qbbAxPp6/aMFw6mNiPyPzt8uHtVGTkgla0y54y
	iJNktLrUgqSpLMSTNAeR18Gq4eRhbO4uaSsUk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=sRNZLPwzsJnB/CvcLTLZOrfIeF2Ljm8kWXH5e0xk4B+8SVyDl3yOb2bw8/gc54ssF9
	N0iT+C+Hl5vTtEUWNPVN7jXFnXB/JnhOLMr16Ae9L6lppDUM3moj0nRhmBHVMC1staRX
	roG3EC2OW5VcRemNGCXYvyukAPVc1TvAu2ibQ=
Received: by 10.90.89.3 with SMTP id m3mr155038agb.120.1297181813533;
	Tue, 08 Feb 2011 08:16:53 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id w6sm7245628anf.6.2011.02.08.08.16.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Feb 2011 08:16:52 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Feb 2011 09:16:39 -0700
Message-Id: <1297181802-18948-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] autotools: cleanup
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
X-List-Received-Date: Tue, 08 Feb 2011 16:17:57 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/autotools.bbclass |   60 +++++++++++++++++---------------------------
 1 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index c8cb0e9..4d7a66b 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -17,7 +17,7 @@ def autotools_deps(d):
 		if (not oe.utils.inherits(d, 'native', 'nativesdk', 'cross',
 		                          'sdk') and
 		    not d.getVar('INHIBIT_DEFAULT_DEPS', True)):
-                    deps += 'libtool-cross '
+			deps += 'libtool-cross '
 
 	return deps + 'gnu-config-native '
 
@@ -110,22 +110,13 @@ oe_runconf () {
 
 autotools_do_configure() {
 	case ${PN} in
-	autoconf*)
-	;;
-	automake*)
+	autoconf*|automake*)
 	;;
 	*)
-		# WARNING: gross hack follows:
-		# An autotools built package generally needs these scripts, however only
-		# automake or libtoolize actually install the current versions of them.
-		# This is a problem in builds that do not use libtool or automake, in the case
-		# where we -need- the latest version of these scripts.  e.g. running a build
-		# for a package whose autotools are old, on an x86_64 machine, which the old
-		# config.sub does not support.  Work around this by installing them manually
-		# regardless.
-		( for ac in `find ${S} -name configure.in -o -name configure.ac`; do
-			rm -f `dirname $ac`/configure
-			done )
+		find ${S} -name configure.in -o -name configure.ac | \
+			while read fn; do
+				rm -f `dirname $fn`/configure
+			done
 		if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
 			olddir=`pwd`
 			cd ${S}
@@ -138,9 +129,7 @@ autotools_do_configure() {
 			else
 				acpaths="${acpaths}"
 			fi
-			AUTOV=`automake --version |head -n 1 |sed "s/.* //;s/\.[0-9]\+$//"`
-			automake --version
-			echo "AUTOV is $AUTOV"
+			AUTOV=`automake --version | head -n 1 | sed "s/.* //;s/\.[0-9]\+$//"`
 			install -d ${STAGING_DATADIR}/aclocal
 			install -d ${STAGING_DATADIR}/aclocal-$AUTOV
 			acpaths="$acpaths -I${STAGING_DATADIR}/aclocal-$AUTOV -I ${STAGING_DATADIR}/aclocal"
@@ -151,34 +140,31 @@ autotools_do_configure() {
 				rm -f aclocal.m4
 			fi
 			if [ -e configure.in ]; then
-			  CONFIGURE_AC=configure.in
+				CONFIGURE_AC=configure.in
 			else
-			  CONFIGURE_AC=configure.ac
+				CONFIGURE_AC=configure.ac
 			fi
-			if grep -q "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC; then
-			  if grep -q "sed.*POTFILES" $CONFIGURE_AC; then
-			    : do nothing -- we still have an old unmodified configure.ac
-			  else
-			    oenote Executing glib-gettextize --force --copy
-			    echo "no" | glib-gettextize --force --copy
-			  fi
-			else if grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
-			  if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
-			    cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
-			  else
-			    oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is not installed.
-			  fi
+			if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+				if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
+					: do nothing -- we still have an old unmodified configure.ac
+				else
+					echo "no" | glib-gettextize --force --copy
+				fi
+			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+				if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
+					cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
+				else
+					oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is not installed.
+				fi
 			fi
 
 			fi
 			for aux in m4 `sed -n -e '/^[[:space:]]*AC_CONFIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
 				mkdir -p ${aux}
 			done
-			oenote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 			autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
-			if grep -q "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC; then
-			  oenote Executing intltoolize --copy --force --automake
-			  intltoolize --copy --force --automake
+			if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
+				intltoolize --copy --force --automake
 			fi
 			cd $olddir
 		fi
-- 
1.7.2.3



