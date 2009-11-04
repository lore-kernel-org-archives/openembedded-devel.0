Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1N5fP1-0001cn-0m
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 13:55:58 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 511BC1408F; Wed,  4 Nov 2009 13:54:39 +0100 (CET)
Date: Wed, 4 Nov 2009 13:54:39 +0100
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091104125439.GA20450@zlo.nu>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Add dhcp 3.1.2p1 and fix unneeded bash dependency in 3.0.*
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
X-List-Received-Date: Wed, 04 Nov 2009 12:55:58 -0000
X-Groupsio-MsgNum: 13844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline

--tjCHc7DPkfUGtrlw
Content-Type: multipart/mixed; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The latest stable of the isc dhcp 3.x source is 3.1.2p1. I realize that
there are already 4.x releases out too, but I have not tested any of
them yet.

In any case: the dhclient/scripts/linux is a #!/bin/bash script which
does not use any bashisms. As this was (dependency-wise) the only reason
for our image to contain bash, I fixed this and while at it moved from
3.0.2 to 3.1.2p1.

Attached is the patch for both changes.

Marc

--YiEDa0DAkWCtVeE4
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="dhcp.patch"
Content-Transfer-Encoding: quoted-printable

diff --git a/recipes/dhcp/dhcp_3.0.1.bb b/recipes/dhcp/dhcp_3.0.1.bb
index 7d55dc3..2deee26 100644
--- a/recipes/dhcp/dhcp_3.0.1.bb
+++ b/recipes/dhcp/dhcp_3.0.1.bb
@@ -2,10 +2,11 @@ SECTION =3D "console/network"
 DESCRIPTION =3D "Internet Software Consortium DHCP package"
 HOMEPAGE =3D "http://www.isc.org/"
 LICENSE =3D "BSD"
-PR =3D "r3"
+PR =3D "r4"
 SRC_URI =3D "ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history/dhcp-${PV}.tar.gz=
 \
 	   file://noattrmode.patch;patch=3D1 \
 	   file://fixincludes.patch;patch=3D1 \
+	   file://useless-use-of-bash.patch;patch=3D1 \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
 	   file://dhclient.conf file://dhcpd.conf"
diff --git a/recipes/dhcp/dhcp_3.0.2.bb b/recipes/dhcp/dhcp_3.0.2.bb
index 052fa7e..51ac93d 100644
--- a/recipes/dhcp/dhcp_3.0.2.bb
+++ b/recipes/dhcp/dhcp_3.0.2.bb
@@ -2,10 +2,11 @@ SECTION =3D "console/network"
 DESCRIPTION =3D "Internet Software Consortium DHCP package"
 HOMEPAGE =3D "http://www.isc.org/"
 LICENSE =3D "BSD"
-PR =3D "r10"
+PR =3D "r11"
 SRC_URI =3D "ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history/dhcp-${PV}.tar.gz=
 \
 	   file://noattrmode.patch;patch=3D1 \
 	   file://fixincludes.patch;patch=3D1 \
+	   file://useless-use-of-bash.patch;patch=3D1 \
            file://dhclient-script-exit-status.dpatch;patch=3D1 \
 	   file://dhcp-3.0.3-dhclient-dbus.patch;patch=3D1;pnum=3D0 \
 	   file://init-relay file://default-relay \
@@ -53,7 +54,6 @@ FILES_dhcp-server =3D "${sbindir}/dhcpd ${sysconfdir}/ini=
t.d/dhcp-server ${sysconf
 FILES_dhcp-relay =3D "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay =
${sysconfdir}/default/dhcp-relay"
=20
 FILES_dhcp-client =3D "${base_sbindir}/dhclient ${base_sbindir}/dhclient-s=
cript ${sysconfdir}/dhcp/dhclient.conf /var/lib/dhcp3"
-RDEPENDS_dhcp-client =3D "bash"
=20
 FILES_dhcp-omshell =3D "${bindir}/omshell"
=20
diff --git a/recipes/dhcp/dhcp_3.1.2p1.bb b/recipes/dhcp/dhcp_3.1.2p1.bb
new file mode 100644
index 0000000..8d1f991
--- /dev/null
+++ b/recipes/dhcp/dhcp_3.1.2p1.bb
@@ -0,0 +1,61 @@
+SECTION =3D "console/network"
+DESCRIPTION =3D "Internet Software Consortium DHCP package"
+HOMEPAGE =3D "http://www.isc.org/"
+LICENSE =3D "BSD"
+
+SRC_URI =3D "ftp://ftp.isc.org/isc/dhcp/dhcp-3.1-history/dhcp-${PV}.tar.gz=
 \
+	   file://fixincludes.patch;patch=3D1 \
+	   file://useless-use-of-bash.patch;patch=3D1 \
+           file://dhclient-script-exit-status.dpatch;patch=3D1 \
+	   file://dhcp-3.0.3-dhclient-dbus.patch;patch=3D1;pnum=3D0 \
+	   file://init-relay file://default-relay \
+	   file://init-server file://default-server \
+	   file://dhclient.conf file://dhcpd.conf"
+
+
+inherit update-rc.d
+
+INITSCRIPT_PACKAGES =3D "dhcp-server"
+INITSCRIPT_NAME_dhcp-server =3D dhcp-server
+INITSCRIPT_PARAMS_dhcp-server =3D "start 30 2 3 4 5 . stop 30 0 1 6 ."
+
+TARGET_CC_ARCH +=3D "${LDFLAGS}"
+
+do_configure() {
+	./configure
+}
+
+do_compile() {
+	make RANLIB=3D${RANLIB} PREDEFINES=3D'-D_PATH_DHCPD_DB=3D\"/var/lib/dhcp/=
dhcpd.leases\" \
+        -D_PATH_DHCLIENT_DB=3D\"/var/lib/dhcp/dhclient.leases\" \
+        -D_PATH_DHCLIENT_SCRIPT=3D\"/sbin/dhclient-script\" \
+        -D_PATH_DHCPD_CONF=3D\"/etc/dhcp/dhcpd.conf\" \
+        -D_PATH_DHCLIENT_CONF=3D\"/etc/dhcp/dhclient.conf\"'
+}
+
+do_install() {
+	make -e DESTDIR=3D${D} USRMANDIR=3D${mandir}/man1 ADMMANDIR=3D${mandir}/m=
an8 FFMANDIR=3D${mandir}/man5 LIBMANDIR=3D${mandir}/man3 LIBDIR=3D${libdir}=
 INCDIR=3D${includedir} install
+	install -d ${D}${sysconfdir}/init.d
+	install -d ${D}${sysconfdir}/default
+	install -d ${D}${sysconfdir}/dhcp
+	install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
+	install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-r=
elay
+	install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-serv=
er
+	install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-=
server
+	install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.=
conf
+	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
+	install -d ${D}/var/lib/dhcp3
+}
+
+PACKAGES +=3D "dhcp-server dhcp-client dhcp-relay dhcp-omshell"
+FILES_${PN} =3D ""
+FILES_dhcp-server =3D "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server $=
{sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
+FILES_dhcp-relay =3D "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay =
${sysconfdir}/default/dhcp-relay"
+
+FILES_dhcp-client =3D "${base_sbindir}/dhclient ${base_sbindir}/dhclient-s=
cript ${sysconfdir}/dhcp/dhclient.conf /var/lib/dhcp3"
+
+FILES_dhcp-omshell =3D "${bindir}/omshell"
+
+CONFFILES_dhcp-server_nylon =3D "/etc/dhcp/dhcpd.conf"
+CONFFILES_dhcp-relay_nylon =3D "/etc/default/dhcp-relay"
+CONFFILES_dhcp-client_nylon =3D "/etc/dhcp/dhclient.conf"
diff --git a/recipes/dhcp/files/useless-use-of-bash.patch b/recipes/dhcp/fi=
les/useless-use-of-bash.patch
new file mode 100644
index 0000000..6628fe7
--- /dev/null
+++ b/recipes/dhcp/files/useless-use-of-bash.patch
@@ -0,0 +1,8 @@
+--- dhcp-3.0.2p1/client/scripts/linux	2006-07-22 04:24:16.000000000 +0200
++++ dhcp-3.0.2p1/client/scripts/linux	2009-11-03 17:51:55.000000000 +0100
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # dhclient-script for Linux. Dan Halbert, March, 1997.
+ # Updated for Linux 2.[12] by Brian J. Murrell, January 1999.
+ # No guarantees about this. I'm a novice at the details of Linux

--YiEDa0DAkWCtVeE4--

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrxeY8ACgkQezjnobFOgrE2LwCgnfg0ItrW5kbLSw8hqvdRZDx+
tfwAn1m9JmNkgxZY/H30rAn/COt9oNT0
=wh1E
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
