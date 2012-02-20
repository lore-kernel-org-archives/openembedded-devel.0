Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RzTmq-0001rS-Hz
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 15:00:16 +0100
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id F16CB4B004D;
	Mon, 20 Feb 2012 14:51:56 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2012 14:51:49 +0100
Message-Id: <1329745909-21013-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe] vsftpd: add new package
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
X-List-Received-Date: Mon, 20 Feb 2012 14:00:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- imported 2.0.5 from oe-classic
- upgrade to 2.3.5 which is latest stable
- tested on ARMv5 with Angstrom

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-connectivity/vsftpd/files/init     |   41 ++++++++
 .../recipes-connectivity/vsftpd/files/vsftpd.conf  |  108 ++++++++++++++=
++++++
 .../vsftpd/vsftpd-2.3.5/makefile.patch             |   47 +++++++++
 .../vsftpd/vsftpd-2.3.5/nopam.patch                |   12 ++
 .../recipes-connectivity/vsftpd/vsftpd_2.3.5.bb    |   48 +++++++++
 5 files changed, 256 insertions(+), 0 deletions(-)
 create mode 100755 meta-oe/recipes-connectivity/vsftpd/files/init
 create mode 100755 meta-oe/recipes-connectivity/vsftpd/files/vsftpd.conf
 create mode 100644 meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/make=
file.patch
 create mode 100644 meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/nopa=
m.patch
 create mode 100644 meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb

diff --git a/meta-oe/recipes-connectivity/vsftpd/files/init b/meta-oe/rec=
ipes-connectivity/vsftpd/files/init
new file mode 100755
index 0000000..d0ec010
--- /dev/null
+++ b/meta-oe/recipes-connectivity/vsftpd/files/init
@@ -0,0 +1,41 @@
+#!/bin/sh
+DAEMON=3D/usr/sbin/vsftpd
+NAME=3Dvsftpd
+DESC=3D"FTP Server"
+ARGS=3D""
+FTPDIR=3D/var/lib/ftp
+
+test -f $DAEMON || exit 0
+
+set -e
+
+case "$1" in
+    start)
+        echo -n "* starting $DESC: $NAME... "
+        if ! test -d $FTPDIR; then
+            mkdir -p $FTPDIR/in
+            chown ftp $FTPDIR -R
+            chmod a-w $FTPDIR
+            chmod u+w $FTPDIR/in
+        fi
+        start-stop-daemon -S -b -x $DAEMON -- $ARGS
+        echo "done."
+        ;;
+    stop)
+        echo -n "* stopping $DESC: $NAME... "
+        start-stop-daemon -K -x $DAEMON
+        echo "done."
+        ;;
+    restart)
+        echo "* restarting $DESC: $NAME... "
+        $0 stop
+        $0 start
+        echo "done."
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-connectivity/vsftpd/files/vsftpd.conf b/meta=
-oe/recipes-connectivity/vsftpd/files/vsftpd.conf
new file mode 100755
index 0000000..08f91e0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/vsftpd/files/vsftpd.conf
@@ -0,0 +1,108 @@
+# Example config file /etc/vsftpd.conf
+#
+# The default compiled in settings are fairly paranoid. This sample file
+# loosens things up a bit, to make the ftp daemon more usable.
+# Please see vsftpd.conf.5 for all compiled in defaults.
+#
+# READ THIS: This example file is NOT an exhaustive list of vsftpd optio=
ns.
+# Please read the vsftpd.conf.5 manual page to get a full idea of vsftpd=
's
+# capabilities.
+
+# run standalone
+listen=3DYES
+
+# Allow anonymous FTP? (Beware - allowed by default if you comment this =
out).
+anonymous_enable=3DYES
+#
+# Uncomment this to allow local users to log in.
+#local_enable=3DYES
+#
+# Uncomment this to enable any form of FTP write command.
+write_enable=3DYES
+#
+# Default umask for local users is 077. You may wish to change this to 0=
22,
+# if your users expect that (022 is used by most other ftpd's)
+#local_umask=3D022
+#
+# Uncomment this to allow the anonymous FTP user to upload files. This o=
nly
+# has an effect if the above global write enable is activated. Also, you=
 will
+# obviously need to create a directory writable by the FTP user.
+#anon_upload_enable=3DYES
+#
+# Uncomment this if you want the anonymous FTP user to be able to create
+# new directories.
+#anon_mkdir_write_enable=3DYES
+#
+# Activate directory messages - messages given to remote users when they
+# go into a certain directory.
+dirmessage_enable=3DYES
+#
+# Activate logging of uploads/downloads.
+xferlog_enable=3DYES
+#
+# Make sure PORT transfer connections originate from port 20 (ftp-data).
+connect_from_port_20=3DYES
+#
+# If you want, you can arrange for uploaded anonymous files to be owned =
by
+# a different user. Note! Using "root" for uploaded files is not
+# recommended!
+#chown_uploads=3DYES
+#chown_username=3Dwhoever
+#
+# You may override where the log file goes if you like. The default is s=
hown
+# below.
+#xferlog_file=3D/var/log/vsftpd.log
+#
+# If you want, you can have your log file in standard ftpd xferlog forma=
t
+#xferlog_std_format=3DYES
+#
+# You may change the default value for timing out an idle session.
+#idle_session_timeout=3D600
+#
+# You may change the default value for timing out a data connection.
+#data_connection_timeout=3D120
+#
+# It is recommended that you define on your system a unique user which t=
he
+# ftp server can use as a totally isolated and unprivileged user.
+#nopriv_user=3Dftpsecure
+#
+# Enable this and the server will recognise asynchronous ABOR requests. =
Not
+# recommended for security (the code is non-trivial). Not enabling it,
+# however, may confuse older FTP clients.
+#async_abor_enable=3DYES
+#
+# By default the server will pretend to allow ASCII mode but in fact ign=
ore
+# the request. Turn on the below options to have the server actually do =
ASCII
+# mangling on files when in ASCII mode.
+# Beware that turning on ascii_download_enable enables malicious remote =
parties
+# to consume your I/O resources, by issuing the command "SIZE /big/file"=
 in
+# ASCII mode.
+# These ASCII options are split into upload and download because you may=
 wish
+# to enable ASCII uploads (to prevent uploaded scripts etc. from breakin=
g),
+# without the DoS risk of SIZE and ASCII downloads. ASCII mangling shoul=
d be
+# on the client anyway..
+#ascii_upload_enable=3DYES
+#ascii_download_enable=3DYES
+#
+# You may fully customise the login banner string:
+#ftpd_banner=3DWelcome to blah FTP service.
+#
+# You may specify a file of disallowed anonymous e-mail addresses. Appar=
ently
+# useful for combatting certain DoS attacks.
+#deny_email_enable=3DYES
+# (default follows)
+#banned_email_file=3D/etc/vsftpd.banned_emails
+#
+# You may specify an explicit list of local users to chroot() to their h=
ome
+# directory. If chroot_local_user is YES, then this list becomes a list =
of
+# users to NOT chroot().
+#chroot_list_enable=3DYES
+# (default follows)
+#chroot_list_file=3D/etc/vsftpd.chroot_list
+#
+# You may activate the "-R" option to the builtin ls. This is disabled b=
y
+# default to avoid remote users being able to cause excessive I/O on lar=
ge
+# sites. However, some broken FTP clients such as "ncftp" and "mirror" a=
ssume
+# the presence of the "-R" option, so there is a strong case for enablin=
g it.
+#ls_recurse_enable=3DYES
+
diff --git a/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/makefile.pa=
tch b/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/makefile.patch
new file mode 100644
index 0000000..3bf8f97
--- /dev/null
+++ b/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/makefile.patch
@@ -0,0 +1,47 @@
+diff -ur vsftpd-2.0.1_org/Makefile vsftpd-2.0.1_patch/Makefile
+--- vsftpd-2.0.1_org/Makefile	2004-06-06 18:21:27.000000000 +0200
++++ vsftpd-2.0.1_patch/Makefile	2004-07-21 09:50:25.245576352 +0200
+@@ -5,7 +5,7 @@
+ #CFLAGS =3D -g
+ CFLAGS	=3D	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
+=20
+-LIBS	=3D	`./vsf_findlibs.sh`
++LIBS	=3D	-lssl -lcrypto -lnsl -lresolv
+ LINK	=3D	-Wl,-s
+=20
+ OBJS	=3D	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o =
\
+@@ -24,21 +24,21 @@
+ 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS)
+=20
+ install:
+-	if [ -x /usr/local/sbin ]; then \
+-		$(INSTALL) -m 755 vsftpd /usr/local/sbin/vsftpd; \
++	if [ -x ${DESTDIR}/usr/local/sbin ]; then \
++		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/local/sbin/vsftpd; \
+ 	else \
+-		$(INSTALL) -m 755 vsftpd /usr/sbin/vsftpd; fi
+-	if [ -x /usr/local/man ]; then \
+-		$(INSTALL) -m 644 vsftpd.8 /usr/local/man/man8/vsftpd.8; \
+-		$(INSTALL) -m 644 vsftpd.conf.5 /usr/local/man/man5/vsftpd.conf.5; \
+-	elif [ -x /usr/share/man ]; then \
+-		$(INSTALL) -m 644 vsftpd.8 /usr/share/man/man8/vsftpd.8; \
+-		$(INSTALL) -m 644 vsftpd.conf.5 /usr/share/man/man5/vsftpd.conf.5; \
++		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/sbin/vsftpd; fi
++	if [ -x ${DESTDIR}/usr/local/man ]; then \
++		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/local/man/man8/vsftpd.8; \
++		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/local/man/man5/vsftpd.=
conf.5; \
++	elif [ -x ${DESTDIR}/usr/share/man ]; then \
++		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/share/man/man8/vsftpd.8; \
++		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/share/man/man5/vsftpd.=
conf.5; \
+ 	else \
+-		$(INSTALL) -m 644 vsftpd.8 /usr/man/man8/vsftpd.8; \
+-		$(INSTALL) -m 644 vsftpd.conf.5 /usr/man/man5/vsftpd.conf.5; fi
+-	if [ -x /etc/xinetd.d ]; then \
+-		$(INSTALL) -m 644 xinetd.d/vsftpd /etc/xinetd.d/vsftpd; fi
++		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/man/man8/vsftpd.8; \
++		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/man/man5/vsftpd.conf.5=
; fi
++	if [ -x ${DESTDIR}/etc/xinetd.d ]; then \
++		$(INSTALL) -m 644 xinetd.d/vsftpd ${DESTDIR}/etc/xinetd.d/vsftpd; fi
+=20
+ clean:
+ 	rm -f *.o *.swp vsftpd
diff --git a/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/nopam.patch=
 b/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/nopam.patch
new file mode 100644
index 0000000..8e0559c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/nopam.patch
@@ -0,0 +1,12 @@
+diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
+--- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
++++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
+@@ -2,7 +2,7 @@
+ #define VSF_BUILDDEFS_H
+=20
+ #undef VSF_BUILD_TCPWRAPPERS
+-#define VSF_BUILD_PAM
++#undef VSF_BUILD_PAM
+ #undef VSF_BUILD_SSL
+=20
+ #endif /* VSF_BUILDDEFS_H */
diff --git a/meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb b/meta-o=
e/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb
new file mode 100644
index 0000000..e5fd7ee
--- /dev/null
+++ b/meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb
@@ -0,0 +1,48 @@
+DESCRIPTION =3D "Secure ftp server"
+HOMEPAGE=3D"https://security.appspot.com/vsftpd.html"
+SECTION =3D "network"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6067ad950b28336613aed9dd47b1=
271"
+
+DEPENDS =3D "libcap"
+
+SRC_URI =3D "https://security.appspot.com/downloads/vsftpd-2.3.5.tar.gz =
\
+           file://makefile.patch \
+           file://nopam.patch \
+           file://init \
+           file://vsftpd.conf"
+
+inherit update-rc.d useradd
+
+CONFFILES_${PN} =3D "${sysconfdir}/vsftpd.conf"
+LDFLAGS_append =3D" -lcrypt -lcap"
+
+do_configure() {
+        # Fix hardcoded /usr, /etc, /var mess.
+        cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${local=
statedir}:g \
+        |sed s:\"${prefix}/share/empty:\"${localstatedir}/share/empty:g =
|sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new
+        mv tunables.c.new tunables.c
+}
+
+do_install() {
+        install -d ${D}${sbindir}
+        install -d ${D}${mandir}/man8
+        install -d ${D}${mandir}/man5
+        oe_runmake 'DESTDIR=3D${D}' install
+        install -d ${D}${sysconfdir}
+        install -m 0755 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.=
conf
+        install -d ${D}${sysconfdir}/init.d/
+        install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
+}
+
+INITSCRIPT_PACKAGES =3D "${PN}"
+INITSCRIPT_NAME_${PN} =3D "vsftpd"
+INITSCRIPT_PARAMS_${PN} =3D "defaults 80"
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM_${PN} =3D "--system --home-dir /var/lib/ftp --no-create-ho=
me -g ftp \
+                       --shell /bin/false ftp "
+GROUPADD_PARAM_${PN} =3D "-r ftp"
+                    =20
+SRC_URI[md5sum] =3D "01398a5bef8e85b6cf2c213a4b011eca"
+SRC_URI[sha256sum] =3D "d87ee2987df8f03e1dbe294905f7907b2798deb89c67ca96=
5f6e2f60879e54f1"
--=20
1.7.7.6



