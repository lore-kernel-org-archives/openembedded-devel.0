Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lmr2F-00056O-0e
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 15:58:23 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.115])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lmr0Z-000116-BL
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 17:56:39 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2009 17:56:23 +0300
User-Agent: KMail/1.9.9
References: <200902140035.13820.khimov@altell.ru>
	<200902171525.28995.khimov@altell.ru>
	<877i2g63wr.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <877i2g63wr.fsf@neumann.lab.ossystems.com.br>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200903261756.23906.khimov@altell.ru>
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Thu, 26 Mar 2009 14:58:23 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Otavio Salvador:
> Mind to fix it?

OK, I've fixed that, fixed FTBFS with current autohell thingies (thanks Khe=
m),
corrected defconfig a bit, added init script, fixed QA issues (although
requiring '.so' to be in -dev is a bit strange to me), fixed packaging in
general and I think it is good enough now.

=46rom 962bc0072ab8f5c5b47bb634b596cc3c7ae71d3b Mon Sep 17 00:00:00 2001
=46rom: Roman I Khimov <khimov@altell.ru>
Date: Mon, 23 Mar 2009 20:58:14 +0300
Subject: [PATCH] siproxd: new recipe

New recipe for siproxd 0.7.1
=2D--
 conf/checksums.ini                  |    4 ++
 recipes/siproxd/files/no-docs.patch |   38 ++++++++++++++++++++++
 recipes/siproxd/files/siproxd.init  |   59 +++++++++++++++++++++++++++++++=
++++
 recipes/siproxd/siproxd.inc         |   40 +++++++++++++++++++++++
 recipes/siproxd/siproxd_0.7.1.bb    |    3 ++
 5 files changed, 144 insertions(+), 0 deletions(-)
 create mode 100644 recipes/siproxd/files/no-docs.patch
 create mode 100644 recipes/siproxd/files/siproxd.init
 create mode 100644 recipes/siproxd/siproxd.inc
 create mode 100644 recipes/siproxd/siproxd_0.7.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index d448c2a..e3115e5 100644
=2D-- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -20918,6 +20918,10 @@ sha256=3D7faaccb6f17296399051bd076a7f41e0f6d95a28e=
da3e30468f1bd7cf45898e1
 md5=3D597d7ff7edb42a18421c806ffd18a136
 sha256=3D7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e30468f1bd7cf45898e1
=20
+[http://downloads.sourceforge.net/siproxd/siproxd-0.7.1.tar.gz]
+md5=3D45e5a44803181e2bf3361d562060c904
+sha256=3D5eef70f4e0a8f0f4628550807da3036f8b3086864bf4bcf5ab6d22ac3a6efd81
+
 [http://download.berlios.de/sipsak/sipsak-0.9.6-1.tar.gz]
 md5=3Dc4eb8e282902e75f4f040f09ea9d99d5
 sha256=3D5064c56d482a080b6a4aea71821b78c21b59d44f6d1aa14c27429441917911a9
diff --git a/recipes/siproxd/files/no-docs.patch b/recipes/siproxd/files/no=
=2Ddocs.patch
new file mode 100644
index 0000000..499a5bb
=2D-- /dev/null
+++ b/recipes/siproxd/files/no-docs.patch
@@ -0,0 +1,38 @@
+Taken from siproxd snapshot
+
+--- siproxd-0.7.1/configure.in	2008-02-02 20:13:31.000000000 +0300
++++ siproxd-0.7.2/configure.in	2009-03-01 18:41:27.000000000 +0300
+@@ -135,6 +141,33 @@
+=20
+=20
+ dnl **********************************************
++dnl * Building doc
++dnl **********************************************
++
++dnl
++dnl --enable-doc
++dnl
++
++   build_docs=3D"yes";
++   AC_MSG_CHECKING(build documentation)
++   AC_ARG_ENABLE(doc,
++      [  --disable-doc               build pdf/html doc (default=3Denable=
d)],
++      if test "x$enableval" =3D "xno"; then
++         build_docs=3D"no";
++      fi
++      AC_MSG_RESULT($build_docs), AC_MSG_RESULT($build_docs))
++   if test "x$build_docs" =3D "xyes"; then
++      AC_CHECK_PROG(docbook2pdf,docbook2pdf,yes,)
++      AM_CONDITIONAL(have_docbook2pdf,test "$docbook2pdf" =3D "yes")
++      AC_CHECK_PROG(docbook2html,docbook2html,yes,)
++      AM_CONDITIONAL(have_docbook2html,test "$docbook2html" =3D "yes")
++   else
++      AM_CONDITIONAL(have_docbook2pdf,false)
++      AM_CONDITIONAL(have_docbook2html,false)
++   fi
++
++
++dnl **********************************************
+ dnl * Selection of static build variants
+ dnl **********************************************
+=20
diff --git a/recipes/siproxd/files/siproxd.init b/recipes/siproxd/files/sip=
roxd.init
new file mode 100644
index 0000000..ae19f32
=2D-- /dev/null
+++ b/recipes/siproxd/files/siproxd.init
@@ -0,0 +1,59 @@
+#!/bin/bash
+#
+#	/etc/rc.d/init.d/siproxd
+#
+# Starts the siproxd daemon
+#
+# description: Listen and dispatch SIP messages=20
+# processname: siproxd=20
+
+
+DAEMON=3D/usr/sbin/siproxd
+NAME=3Dsiproxd
+
+test -x $DAEMON || exit 0
+
+start() {
+	echo -n $"Starting sip proxy: "
+	start-stop-daemon --start --quiet --pidfile /var/run/$NAME.pid \
+		--exec $DAEMON -- $DAEMON_OPTS || true
+	echo "$NAME."
+}
+
+stop() {
+	echo -n $"Stopping sip proxy: "
+	start-stop-daemon --stop --quiet --pidfile /var/run/$NAME.pid \
+		--exec $DAEMON || true
+	echo "$NAME."
+}
+
+
+restart() {
+	stop
+	start
+}=09
+
+reload() {
+	trap "" SIGHUP
+	killall -HUP siproxd
+}=09
+
+case "$1" in
+start)
+	start
+	;;
+stop)
+	stop
+	;;
+reload)
+	reload
+	;;
+restart)
+	restart
+	;;
+*)
+	echo $"Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit 0
diff --git a/recipes/siproxd/siproxd.inc b/recipes/siproxd/siproxd.inc
new file mode 100644
index 0000000..1e7f3ae
=2D-- /dev/null
+++ b/recipes/siproxd/siproxd.inc
@@ -0,0 +1,40 @@
+DESCRIPTION =3D "SIP proxy/masquerading daemon"
+SECTION =3D "net"
+DEPENDS =3D "libosip2"
+LICENSE =3D "GPL"
+
+SRC_URI =3D " \
+	${SOURCEFORGE_MIRROR}/siproxd/siproxd-${PV}.tar.gz \
+	file://siproxd.init \
+	"
+
+inherit autotools update-rc.d
+
+INITSCRIPT_NAME =3D "siproxd"
+
+EXTRA_OECONF =3D "--disable-doc"
+
+do_configure() {
+	gnu-configize
+	aclocal
+	libtoolize --copy --force
+	automake --add-missing
+	autoreconf
+	oe_runconf
+}
+
+do_install_append() {
+	cp ${D}/${sysconfdir}/siproxd.conf.example ${D}/${sysconfdir}/siproxd.conf
+	sed -ri "s,^#?(pid_file)\ *=3D\ *.*$,\1 =3D /var/run/siproxd.pid," ${D}/$=
{sysconfdir}/siproxd.conf
+	sed -ri "s,^#?(plugindir)\ *=3D\ *.*$,\1 =3D ${libdir}/siproxd/," ${D}/${=
sysconfdir}/siproxd.conf
+	install -d ${D}/${sysconfdir}/init.d
+	install -m 755 ${WORKDIR}/siproxd.init ${D}/${sysconfdir}/init.d/siproxd
+}
+
+CONFFILES_${PN} =3D " \
+	${sysconfdir}/siproxd.conf \
+	${sysconfdir}/siproxd_passwd.cfg \
+	"
+
+FILES_${PN} =3D "${sysconfdir} ${sbindir} ${libdir}/siproxd/*.so.*"
+FILES_${PN}-dev +=3D "${libdir}/siproxd/*.so ${libdir}/siproxd/*.a ${libdi=
r}/siproxd/*.la"
diff --git a/recipes/siproxd/siproxd_0.7.1.bb b/recipes/siproxd/siproxd_0.7=
=2E1.bb
new file mode 100644
index 0000000..66c36d1
=2D-- /dev/null
+++ b/recipes/siproxd/siproxd_0.7.1.bb
@@ -0,0 +1,3 @@
+require siproxd.inc
+
+SRC_URI +=3D "file://no-docs.patch;patch=3D1"
=2D-=20
1.6.2.1


