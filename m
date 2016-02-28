Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E8FEC77234
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 12:34:25 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so27499462wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 04:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=3yHj88GoDY5GG5pw4nSKaM3HyJwxjVcl4hHVYDKt+wc=;
	b=OiEkMMiSMHp8fhMMTq+UCCU2PAqrfrIVHORAdbo4wtEYYefaS1R7/QZBHfDIXDCH3/
	AXZJcg9dzM6Rnv+fYqGIx170NRyfVLs4i5WcUPh1HHyeRUl/Ak/IoFa2yTchSd7atTGn
	faauZx+cIln5IJ5/QHqt3MLq5PJnMS6ZCQJNIYcPt+7tvovbAPoX2BjNsKhxKKHxUVjx
	+tecPIN3bp3ZXL3Oa6z6Z93J7YmGGfK0NbODfo0uwpz091dfcyvnFRvdfSNo5hxxTTU4
	NIF9UFNEmRpsbmmJ1F3gLnuV9JVUBZdEyC2otkeZm+2B3SpydgdMKkaax+En+0+qU4y5
	iDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=3yHj88GoDY5GG5pw4nSKaM3HyJwxjVcl4hHVYDKt+wc=;
	b=X7Bov4hp/6kgU+bajq7RkX3enb+oJiJNKBUJFjFfODXPTCjFYZ4ypm42HQspWMOl+/
	QVozoO6JijjFdfBV4ETQThgDHVqfuprEXBb7M7/+H1ysANaCJ5yqbuqfXpykulKtuIkO
	sua9Ee7Irv73/YL4o6cq2rxb+5jZ3+LtiFAd2pyORF4k0MyEsIAvssnIU3Hys0dopb5/
	E7sVPibUePMdL6OF9+4ncdYuoTAsRLE1UVBZjlePOJ/VkaWXQWnrdgMZrVMNaIjjowV7
	q/H+rfOHQ5pyLVs4LWgkJTAu0zss2I5c8Yp2v0X5papukjEhDlM2Hiplr9Q7gQsfurVQ
	KO/Q==
X-Gm-Message-State: AD7BkJIn9NgULQCua112ROkqkaCZ8qXvEUuJqswA8TIdj/BkC0KgkuQ3dXCdXAN6Z2zhbQ==
X-Received: by 10.28.95.86 with SMTP id t83mr2722283wmb.86.1456662865580;
	Sun, 28 Feb 2016 04:34:25 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	h132sm11378291wmf.9.2016.02.28.04.34.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 04:34:24 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Sun, 28 Feb 2016 13:34:22 +0100
Message-Id: <0527D863-997F-476E-B6EE-FEA9BDD96B0F@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [meta-networking][PATCH] dnsmasq: steal resolvconf support from Ubuntu
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
X-List-Received-Date: Sun, 28 Feb 2016 12:34:26 -0000
X-Groupsio-MsgNum: 60248
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4AA686BD-5D63-4E5A-80D9-7C1ABD1B989E";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_4AA686BD-5D63-4E5A-80D9-7C1ABD1B989E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Add support for resolvconf integration as done in Ubuntu. This implies
updates of start-scripts, resolvconf plugin (on nameserver update ...),
populate-volatiles control file for saved nameserver list.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-support/dnsmasq/dnsmasq.inc            | 10 +++
 .../recipes-support/dnsmasq/files/99_dnsmasq       |  1 +
 .../dnsmasq/files/dnsmasq.resolvconf               | 84 =
++++++++++++++++++++++
 .../recipes-support/dnsmasq/files/dnsmasq.service  |  7 +-
 meta-networking/recipes-support/dnsmasq/files/init | 69 =
+++++++++++++++++-
 5 files changed, 167 insertions(+), 4 deletions(-)
 create mode 100644 =
meta-networking/recipes-support/dnsmasq/files/99_dnsmasq
 create mode 100755 =
meta-networking/recipes-support/dnsmasq/files/dnsmasq.resolvconf

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc =
b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 7fec606..622e630 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -23,6 +23,7 @@ PACKAGECONFIG[dbus] =3D ",,dbus"
 PACKAGECONFIG[idn] =3D ",,libidn"
 PACKAGECONFIG[conntrack] =3D ",,libnetfilter-conntrack"
 PACKAGECONFIG[lua] =3D ",,lua"
+PACKAGECONFIG[resolvconf] =3D ",,,resolvconf"
 EXTRA_OEMAKE =3D "\
     'COPTS=3D${@base_contains('PACKAGECONFIG', 'dbus', '-DHAVE_DBUS', =
'', d)} \
            ${@base_contains('PACKAGECONFIG', 'idn', '-DHAVE_IDN', '', =
d)} \
@@ -32,6 +33,8 @@ EXTRA_OEMAKE =3D "\
     'LDFLAGS=3D${LDFLAGS}' \
 "

+SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resolvconf', =
'file://dnsmasq.resolvconf file://99_dnsmasq', '', d)}"
+
 do_compile_append() {
     # build dhcp_release
     cd ${S}/contrib/wrt
@@ -56,6 +59,13 @@ do_install () {
         install -d ${D}${sysconfdir}/dbus-1/system.d
         install -m 644 dbus/dnsmasq.conf =
${D}${sysconfdir}/dbus-1/system.d/
     fi
+    if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', =
'', d)}" !=3D "" ]; then
+	install -d ${D}${sysconfdir}/resolvconf/update.d/
+	install -m 0755 ${WORKDIR}/dnsmasq.resolvconf =
${D}${sysconfdir}/resolvconf/update.d/dnsmasq
+
+	install -d ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${WORKDIR}/99_dnsmasq =
${D}${sysconfdir}/default/volatiles
+    fi
 }

 CONFFILES_${PN} =3D "${sysconfdir}/dnsmasq.conf"
diff --git a/meta-networking/recipes-support/dnsmasq/files/99_dnsmasq =
b/meta-networking/recipes-support/dnsmasq/files/99_dnsmasq
new file mode 100644
index 0000000..f52ce4e
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/99_dnsmasq
@@ -0,0 +1 @@
+d root root 0755 /run/dnsmasq none
diff --git =
a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.resolvconf =
b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.resolvconf
new file mode 100755
index 0000000..7e19686
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.resolvconf
@@ -0,0 +1,84 @@
+#!/bin/sh
+#
+# Script to update the resolver list for dnsmasq
+#
+# N.B. Resolvconf may run us even if dnsmasq is not (yet) running.
+# If dnsmasq is installed then we go ahead and update the resolver list
+# in case dnsmasq is started later.
+#
+# Assumption: On entry, PWD contains the resolv.conf-type files.
+#
+# This file is part of the dnsmasq package.
+#
+
+set -e
+
+RUN_DIR=3D"/run/dnsmasq"
+RSLVRLIST_FILE=3D"${RUN_DIR}/resolv.conf"
+TMP_FILE=3D"${RSLVRLIST_FILE}_new.$$"
+MY_NAME_FOR_RESOLVCONF=3D"dnsmasq"
+
+[ -x /usr/bin/dnsmasq ] || exit 0
+[ -x /lib/resolvconf/list-records ] || exit 1
+
+PATH=3D/bin:/sbin
+
+report_err() { echo "$0: Error: $*" >&2 ; }
+
+# Stores arguments (minus duplicates) in RSLT, separated by spaces
+# Doesn't work properly if an argument itself contains whitespace
+uniquify()
+{
+	RSLT=3D""
+	while [ "$1" ] ; do
+		for E in $RSLT ; do
+			[ "$1" =3D "$E" ] && { shift ; continue 2 ; }
+		done
+		RSLT=3D"${RSLT:+$RSLT }$1"
+		shift
+	done
+}
+
+if [ ! -d "$RUN_DIR" ] && ! mkdir --parents --mode=3D0755 "$RUN_DIR" ; =
then
+	report_err "Failed trying to create directory $RUN_DIR"
+	exit 1
+fi
+
+RSLVCNFFILES=3D""
+for F in $(/lib/resolvconf/list-records --after =
"lo.$MY_NAME_FOR_RESOLVCONF") ; do
+	case "$F" in
+	    "lo.$MY_NAME_FOR_RESOLVCONF")
+		# Omit own record
+		;;
+	    lo.*)
+		# Include no more records after one for a local =
nameserver
+		RSLVCNFFILES=3D"${RSLVCNFFILES:+$RSLVCNFFILES }$F"
+		break
+		;;
+	  *)
+		RSLVCNFFILES=3D"${RSLVCNFFILES:+$RSLVCNFFILES }$F"
+		;;
+	esac
+done
+
+NMSRVRS=3D""
+if [ "$RSLVCNFFILES" ] ; then
+	uniquify $(sed -n -e 's/^[[:space:]]*nameserver[[:space:]]\+//p' =
$RSLVCNFFILES)
+	NMSRVRS=3D"$RSLT"
+fi
+
+# Dnsmasq uses the mtime of $RSLVRLIST_FILE, with a resolution of one =
second,
+# to detect changes in the file. This means that if a resolvconf update =
occurs
+# within one second of the previous one then dnsmasq may fail to notice =
the
+# more recent change. To work around this problem we sleep one second =
here
+# if necessary in order to ensure that the new mtime is different.
+if [ -f "$RSLVRLIST_FILE" ] && [ "$(stat -c %X "$RSLVRLIST_FILE")" =3D =
"$(date +%s)" ] ; then
+	sleep 1
+fi
+
+clean_up() { rm -f "$TMP_FILE" ; }
+trap clean_up EXIT
+: >| "$TMP_FILE"
+for N in $NMSRVRS ; do echo "nameserver $N" >> "$TMP_FILE" ; done
+mv -f "$TMP_FILE" "$RSLVRLIST_FILE"
+
diff --git =
a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service =
b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
index 549e15e..c3637e1 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
@@ -5,8 +5,11 @@ After=3Dnetwork.target
 [Service]
 Type=3Dforking
 PIDFile=3D/run/dnsmasq.pid
-ExecStart=3D/usr/bin/dnsmasq -x /run/dnsmasq.pid
-ExecReload=3D/bin/kill -HUP $(/bin/cat /run/dnsmasq.pid)
+ExecStartPre=3D/usr/sbin/dnsmasq --test
+ExecStart=3D/etc/init.d/dnsmasq systemd-exec
+ExecStartPost=3D/etc/init.d/dnsmasq systemd-start-resolvconf
+ExecStopPre=3D/etc/init.d/dnsmasq systemd-stop-resolvconf
+ExecReload=3D/bin/kill -HUP $MAINPID

 [Install]
 WantedBy=3Dmulti-user.target
diff --git a/meta-networking/recipes-support/dnsmasq/files/init =
b/meta-networking/recipes-support/dnsmasq/files/init
index d1aa9e5..e4ca3d8 100644
--- a/meta-networking/recipes-support/dnsmasq/files/init
+++ b/meta-networking/recipes-support/dnsmasq/files/init
@@ -8,15 +8,68 @@ test -f $DAEMON || exit 0

 set -e

+if [ -r /etc/default/$NAME ]
+then
+	. /etc/default/$NAME
+fi
+
+DNSMASQ_CONF=3D"/etc/dnsmasq.conf"
+test "/etc/dnsmasq.d/*" !=3D '/etc/dnsmasq.d/*' && =
DNSMASQ_CONF=3D"${DNSMASQ_CONF} /etc/dnsmasq.d/*"
+
+test -z "${PIDFILE}" && PIFILE=3D"/run/dnsmasq.pid"
+
+if [ -z "$IGNORE_RESOLVCONF" ]
+then
+	egrep -h -q '^no-resolv' ${DNSMASQ_CONF} && =
IGNORE_RESOLVCONF=3D"yes"
+fi
+
+# RESOLV_CONF:
+# If the resolvconf package is installed then use the resolv conf file
+# that it provides as the default.  Otherwise use /etc/resolv.conf as
+# the default.
+#
+# If IGNORE_RESOLVCONF is set in /etc/default/dnsmasq or an explicit
+# filename is set there then this inhibits the use of the =
resolvconf-provided
+# information.
+#
+# Note that if the resolvconf package is installed it is not possible =
to
+# override it just by configuration in /etc/dnsmasq.conf, it is =
necessary
+# to set IGNORE_RESOLVCONF=3Dyes in /etc/default/dnsmasq.
+
+test -z "$RESOLV_CONF" -a "$IGNORE_RESOLVCONF" !=3D "yes" -a -x =
/sbin/resolvconf && \
+	RESOLV_CONF=3D/run/dnsmasq/resolv.conf
+
+start_resolvconf()
+{
+        if [ "$IGNORE_RESOLVCONF" !=3D "yes" -a -x /sbin/resolvconf ]
+	then
+		echo "nameserver 127.0.0.1" | /sbin/resolvconf -a =
lo.$NAME
+	fi
+	:
+}
+
+stop_resolvconf()
+{
+	if [ "$IGNORE_RESOLVCONF" !=3D "yes" -a -x /sbin/resolvconf ]
+	then
+		/sbin/resolvconf -d lo.$NAME
+	fi
+	:
+}
+
 case "$1" in
     start)
         echo -n "starting $DESC: $NAME... "
 	test -d /var/lib/misc/ || mkdir /var/lib/misc/
-	start-stop-daemon -S -x $DAEMON -- $ARGS
+	start-stop-daemon -S -x $DAEMON -- $ARGS \
+		${RESOLV_CONF:+ -r $RESOLV_CONF} \
+		${PIDFILE:+ -x $PIDFILE}
+	test $? -eq 0 && start_resolvconf
 	echo "done."
 	;;
     stop)
         echo -n "stopping $DESC: $NAME... "
+	stop_resolvconf
 	start-stop-daemon -K -x $DAEMON
 	echo "done."
 	;;
@@ -25,7 +78,7 @@ case "$1" in
 	start-stop-daemon -q -K -t -x $DAEMON
 	RET=3D$?
 	if [ "$RET" =3D "0" ]; then
-		PID=3D`cat /var/run/dnsmasq.pid`
+		PID=3D`cat ${PIDFILE}`
 		echo "($PID) is running"
 	else
 		echo "is not running"
@@ -43,6 +96,18 @@ case "$1" in
     	killall -HUP $(basename ${DAEMON})
 	echo "done."
 	;;
+    systemd-start-resolvconf)
+	start_resolvconf
+	;;
+    systemd-stop-resolvconf)
+	stop_resolvconf
+	;;
+    systemd-exec)
+	test -d /var/lib/misc/ || mkdir /var/lib/misc/
+	exec $DAEMON --keep-in-foreground $ARGS \
+		${RESOLV_CONF:+ -r $RESOLV_CONF} \
+		${PIDFILE:+ -x $PIDFILE}
+	;;
     *)
 	echo "Usage: $0 {start|stop|status|restart|reload}"
 	exit 1
--
2.6.3


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_4AA686BD-5D63-4E5A-80D9-7C1ABD1B989E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW0ulPAAoJEESZlq7c5Qqd1vgP/0ry7LYSH1XkCDAOX733sBzX
kthq4Lso8ZOvwuzgTs025jRRbUwbeGlbIr4QI9lJAwpwWHz3gtMYEzcqLX0C3jIA
qLHpBJuuEoEL6snbXlXDHzvcbS26LNeNExoTKMBnYGzY+mBbkPxHf398FtbJ1l92
UPcQD58MCntoB42Dx8tk0xxB6RubWAPmxpm/fH86LijkA5wF6fYyNoZ1Bb+iQ2ku
7+QVgncz1jkqxZuKCRmTXxOiqZz7ieL5UEmQrJQJ334gjLUFj8tPOzpWNhZ6IwVA
dpv8H5O9aGryPfdSE/qUFBu5YY9xlEu++v8q+i6a4/XUugFWu2JVv9RQvjYaVxHR
Vw8S3OmIIwF7trVe1jH5+FU4RW6ykKxbR5pg6Z3FB3Pd9kZOT5SiMj4gb5UDKf8j
n0VQu2psJNp2b9DcozliWU1NFdT1iV+QUX8UrYCcYtRJdqzF6ddfJCAp/ybVqeKQ
alhFLwZNtsfJtHCu2/dVFxrWp4x62ksIpre20PkyEttpyL0TNSRYWjIoWNPuG9iH
cSYrSe9IyIoBSUV8y62xNTx22VtHyuXyIyn5Mf4mdhMoT4DIJLVXB9foYY5g7/34
ycgsD15Dam0HM7EjSmRmOsSGci8O+2oSWqQtPmGmcVmgxt3u7fpBbIEkh69sN1RB
tp1tj9J9tdVlkKy37JQe
=8S8e
-----END PGP SIGNATURE-----

--Apple-Mail=_4AA686BD-5D63-4E5A-80D9-7C1ABD1B989E--
