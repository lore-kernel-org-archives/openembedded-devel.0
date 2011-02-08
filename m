Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PmqGO-0004l6-DF
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 17:18:00 +0100
Received: by ywi6 with SMTP id 6so2318948ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 08:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+MsguTvlmoeR19dmXOWphtOt3CL6J/HiLymNPgyGrnc=;
	b=G0jqmwkmFwigJap0rkFgB+borwpYb3bPW02GjwntJlNXC4wZok96NQUqdCgRQTCWMN
	ntmu08Xti0DnPTFnvMOySztE/ZrmpM3JUz70oAhRrMN9qfO/aCkBQughjinFYPq+4WdT
	vEDMd1T6Of+qL7g5fSfLlC5ig5E3Oa37bnGzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TmtyAfZkzkPmhGSIuPgj2Xj5pqtyKWFkvtp+UVMq6jM8I27/brmOZcg5iyCksUWdxE
	CUSib+JJBZiTxcNvZ0OuJrifUoJaTOm9DZ5+iI0yz7FOoxoNcdIXfdGCJIGmgzw9/3vD
	n0zETvs0x30MhlbVTnEUtFOuzCEp2QTNDIUcI=
Received: by 10.100.58.12 with SMTP id g12mr8339831ana.206.1297181816302;
	Tue, 08 Feb 2011 08:16:56 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id w6sm7245628anf.6.2011.02.08.08.16.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Feb 2011 08:16:54 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Feb 2011 09:16:40 -0700
Message-Id: <1297181802-18948-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297181802-18948-1-git-send-email-kergoth@gmail.com>
References: <1297181802-18948-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] autotools: split out a oe_autoreconf function
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
X-List-Received-Date: Tue, 08 Feb 2011 16:18:00 -0000

From: Chris Larson <chris_larson@mentor.com>

This functionality logically belongs in its own function, and it makes it
easier to explicitly run against subdirs in certain cases.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/autotools.bbclass |   96 +++++++++++++++++++++++---------------------
 1 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 4d7a66b..9744589 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -108,6 +108,55 @@ oe_runconf () {
 	fi
 }
 
+oe_autoreconf () {
+	if [ x"${acpaths}" = xdefault ]; then
+		acpaths=
+		for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
+			grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
+			acpaths="$acpaths -I $i"
+		done
+	else
+		acpaths="${acpaths}"
+	fi
+	AUTOV=`automake --version | head -n 1 | sed "s/.* //;s/\.[0-9]\+$//"`
+	install -d ${STAGING_DATADIR}/aclocal
+	install -d ${STAGING_DATADIR}/aclocal-$AUTOV
+	acpaths="$acpaths -I${STAGING_DATADIR}/aclocal-$AUTOV -I ${STAGING_DATADIR}/aclocal"
+	# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
+	# like it was auto-generated.  Work around this by blowing it away
+	# by hand, unless the package specifically asked not to run aclocal.
+	if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
+		rm -f aclocal.m4
+	fi
+	if [ -e configure.in ]; then
+		CONFIGURE_AC=configure.in
+	else
+		CONFIGURE_AC=configure.ac
+	fi
+	if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+		if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
+			: do nothing -- we still have an old unmodified configure.ac
+		else
+			echo "no" | glib-gettextize --force --copy
+		fi
+	else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
+		if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
+			cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
+		else
+			oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is not installed.
+		fi
+	fi
+
+	fi
+	for aux in m4 `sed -n -e '/^[[:space:]]*AC_CONFIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
+		mkdir -p ${aux}
+	done
+	autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
+	if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
+		intltoolize --copy --force --automake
+	fi
+}
+
 autotools_do_configure() {
 	case ${PN} in
 	autoconf*|automake*)
@@ -120,52 +169,7 @@ autotools_do_configure() {
 		if [ -e ${S}/configure.in -o -e ${S}/configure.ac ]; then
 			olddir=`pwd`
 			cd ${S}
-			if [ x"${acpaths}" = xdefault ]; then
-				acpaths=
-				for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
-					grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
-					acpaths="$acpaths -I $i"
-				done
-			else
-				acpaths="${acpaths}"
-			fi
-			AUTOV=`automake --version | head -n 1 | sed "s/.* //;s/\.[0-9]\+$//"`
-			install -d ${STAGING_DATADIR}/aclocal
-			install -d ${STAGING_DATADIR}/aclocal-$AUTOV
-			acpaths="$acpaths -I${STAGING_DATADIR}/aclocal-$AUTOV -I ${STAGING_DATADIR}/aclocal"
-			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
-			# like it was auto-generated.  Work around this by blowing it away
-			# by hand, unless the package specifically asked not to run aclocal.
-			if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal"; then
-				rm -f aclocal.m4
-			fi
-			if [ -e configure.in ]; then
-				CONFIGURE_AC=configure.in
-			else
-				CONFIGURE_AC=configure.ac
-			fi
-			if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-				if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
-					: do nothing -- we still have an old unmodified configure.ac
-				else
-					echo "no" | glib-gettextize --force --copy
-				fi
-			else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
-				if [ -e ${STAGING_DATADIR}/gettext/config.rpath ]; then
-					cp ${STAGING_DATADIR}/gettext/config.rpath ${S}/
-				else
-					oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is not installed.
-				fi
-			fi
-
-			fi
-			for aux in m4 `sed -n -e '/^[[:space:]]*AC_CONFIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
-				mkdir -p ${aux}
-			done
-			autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
-			if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
-				intltoolize --copy --force --automake
-			fi
+			oe_autoreconf
 			cd $olddir
 		fi
 	;;
-- 
1.7.2.3



