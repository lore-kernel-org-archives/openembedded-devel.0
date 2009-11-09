Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1N7Wgx-0005oI-DX
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 17:02:10 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id 6F91914030; Mon,  9 Nov 2009 16:54:14 +0100 (CET)
Date: Mon, 9 Nov 2009 16:54:14 +0100
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091109155414.GA13145@zlo.nu>
References: <20091104125439.GA20450@zlo.nu>
	<be7a9f3d0911051703p33a3f0e1p223219ead98055eb@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0911051703p33a3f0e1p223219ead98055eb@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add dhcp 3.1.2p1 and fix unneeded bash dependency in 3.0.*
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
X-List-Received-Date: Mon, 09 Nov 2009 16:02:10 -0000
X-Groupsio-MsgNum: 14052
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2009 at 11:03:34PM -0200, Otavio Salvador wrote:
> > In any case: the dhclient/scripts/linux is a #!/bin/bash script which
> > does not use any bashisms. As this was (dependency-wise) the only reason
> > for our image to contain bash, I fixed this and while at it moved from
> > 3.0.2 to 3.1.2p1.
>=20
> While you're on it, it would be better to make it in a patchset doing:
>=20
>  - move it all to a .inc and use INC_PR (to avoid useless duplication)
>  - drop the bash requirement (as you did)
>  - add the new version
>=20
> And please, use format-patch to export those patches so we can easily pus=
h it.

Ok, thanks for the tip, here's the new patch.

Marc

---
 conf/checksums.ini                           |    4 ++
 recipes/dhcp/dhcp3.inc                       |   62 ++++++++++++++++++++++=
++++
 recipes/dhcp/dhcp_3.0.1.bb                   |    3 +-
 recipes/dhcp/dhcp_3.0.2.bb                   |   59 ++--------------------=
--
 recipes/dhcp/dhcp_3.1.2p1.bb                 |   12 +++++
 recipes/dhcp/files/useless-use-of-bash.patch |    8 +++
 6 files changed, 93 insertions(+), 55 deletions(-)
 create mode 100644 recipes/dhcp/dhcp3.inc
 create mode 100644 recipes/dhcp/dhcp_3.1.2p1.bb
 create mode 100644 recipes/dhcp/files/useless-use-of-bash.patch

diff --git a/conf/checksums.ini b/conf/checksums.ini
index ec2651a..4c21e29 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5178,6 +5178,10 @@ sha256=3D043dea4144a93b26358ed73cd8fab79be76834a719f=
13fbb4344a26e8288fc38
 md5=3D04800a111521e7442749b2ce883f962b
 sha256=3D21a6e0476fb880e704e0c3cfe7b2bc6a97f6b2b0654db10b38bdd317f511a03a
=20
+[ftp://ftp.isc.org/isc/dhcp/dhcp-3.1-history/dhcp-3.1.2p1.tar.gz]
+md5=3D787b2924a1965f0d8558521b36dca73d
+sha256=3De0cb405e0fef0ecebec7aaed294032a06178ff28be87498596e6069ccda4341e
+
 [http://savannah.nongnu.org/download/dhcp-fwd/dhcp-forwarder-0.6.tar.bz2]
 md5=3Dcbe60c8c904394a8e38e12ac42c02284
 sha256=3D45b708fb49a9fab10d814eb1e340a0960dac91f92800b3d39ddf0245ac913e30
diff --git a/recipes/dhcp/dhcp3.inc b/recipes/dhcp/dhcp3.inc
new file mode 100644
index 0000000..f099003
--- /dev/null
+++ b/recipes/dhcp/dhcp3.inc
@@ -0,0 +1,62 @@
+SECTION =3D "console/network"
+DESCRIPTION =3D "Internet Software Consortium DHCP package"
+HOMEPAGE =3D "http://www.isc.org/"
+LICENSE =3D "BSD"
+INC_PR =3D "r11"
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
index 052fa7e..7955c8e 100644
--- a/recipes/dhcp/dhcp_3.0.2.bb
+++ b/recipes/dhcp/dhcp_3.0.2.bb
@@ -1,62 +1,13 @@
-SECTION =3D "console/network"
-DESCRIPTION =3D "Internet Software Consortium DHCP package"
-HOMEPAGE =3D "http://www.isc.org/"
-LICENSE =3D "BSD"
-PR =3D "r10"
+require dhcp3.inc
+
 SRC_URI =3D "ftp://ftp.isc.org/isc/dhcp/dhcp-3.0-history/dhcp-${PV}.tar.gz=
 \
 	   file://noattrmode.patch;patch=3D1 \
 	   file://fixincludes.patch;patch=3D1 \
-           file://dhclient-script-exit-status.dpatch;patch=3D1 \
+	   file://useless-use-of-bash.patch;patch=3D1 \
+	   file://dhclient-script-exit-status.dpatch;patch=3D1 \
 	   file://dhcp-3.0.3-dhclient-dbus.patch;patch=3D1;pnum=3D0 \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
 	   file://dhclient.conf file://dhcpd.conf"
=20
-
-inherit update-rc.d
-
-INITSCRIPT_PACKAGES =3D "dhcp-server"
-INITSCRIPT_NAME_dhcp-server =3D dhcp-server
-INITSCRIPT_PARAMS_dhcp-server =3D "start 30 2 3 4 5 . stop 30 0 1 6 ."
-
-TARGET_CC_ARCH +=3D "${LDFLAGS}"
-
-do_configure() {
-	./configure
-}
-
-do_compile() {
-	make RANLIB=3D${RANLIB} PREDEFINES=3D'-D_PATH_DHCPD_DB=3D\"/var/lib/dhcp/=
dhcpd.leases\" \
-        -D_PATH_DHCLIENT_DB=3D\"/var/lib/dhcp/dhclient.leases\" \
-        -D_PATH_DHCLIENT_SCRIPT=3D\"/sbin/dhclient-script\" \
-        -D_PATH_DHCPD_CONF=3D\"/etc/dhcp/dhcpd.conf\" \
-        -D_PATH_DHCLIENT_CONF=3D\"/etc/dhcp/dhclient.conf\"'
-}
-
-do_install() {
-	make -e DESTDIR=3D${D} USRMANDIR=3D${mandir}/man1 ADMMANDIR=3D${mandir}/m=
an8 FFMANDIR=3D${mandir}/man5 LIBMANDIR=3D${mandir}/man3 LIBDIR=3D${libdir}=
 INCDIR=3D${includedir} install
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${sysconfdir}/default
-	install -d ${D}${sysconfdir}/dhcp
-	install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
-	install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-r=
elay
-	install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-serv=
er
-	install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-=
server
-	install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.=
conf
-	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
-	install -d ${D}/var/lib/dhcp3
-}
-
-PACKAGES +=3D "dhcp-server dhcp-client dhcp-relay dhcp-omshell"
-FILES_${PN} =3D ""
-FILES_dhcp-server =3D "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server $=
{sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
-FILES_dhcp-relay =3D "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay =
${sysconfdir}/default/dhcp-relay"
-
-FILES_dhcp-client =3D "${base_sbindir}/dhclient ${base_sbindir}/dhclient-s=
cript ${sysconfdir}/dhcp/dhclient.conf /var/lib/dhcp3"
-RDEPENDS_dhcp-client =3D "bash"
-
-FILES_dhcp-omshell =3D "${bindir}/omshell"
-
-CONFFILES_dhcp-server_nylon =3D "/etc/dhcp/dhcpd.conf"
-CONFFILES_dhcp-relay_nylon =3D "/etc/default/dhcp-relay"
-CONFFILES_dhcp-client_nylon =3D "/etc/dhcp/dhclient.conf"
+PR =3D "${INC_PR}"
diff --git a/recipes/dhcp/dhcp_3.1.2p1.bb b/recipes/dhcp/dhcp_3.1.2p1.bb
new file mode 100644
index 0000000..df3c9b9
--- /dev/null
+++ b/recipes/dhcp/dhcp_3.1.2p1.bb
@@ -0,0 +1,12 @@
+require dhcp3.inc
+
+SRC_URI =3D "ftp://ftp.isc.org/isc/dhcp/dhcp-3.1-history/dhcp-${PV}.tar.gz=
 \
+	   file://fixincludes.patch;patch=3D1 \
+	   file://useless-use-of-bash.patch;patch=3D1 \
+	   file://dhclient-script-exit-status.dpatch;patch=3D1 \
+	   file://dhcp-3.0.3-dhclient-dbus.patch;patch=3D1;pnum=3D0 \
+	   file://init-relay file://default-relay \
+	   file://init-server file://default-server \
+	   file://dhclient.conf file://dhcpd.conf"
+
+PR =3D "${INC_PR}"
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
--=20
1.6.3.1

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkr4OyYACgkQezjnobFOgrEDzQCgnsjMtI2FTnKf3VVCtZAdqpIw
K+IAn13LhkKsnX/Yl1+B4PMuRNvf5xjj
=DgfL
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
