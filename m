Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EA96C73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 14:02:17 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1ZbUKo-0000u5-8g from Joe_MacDonald@mentor.com ;
	Mon, 14 Sep 2015 07:02:18 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 14 Sep 2015 07:02:17 -0700
Received: by burninator (Postfix, from userid 1000)	id 330465828AD; Mon, 14
	Sep 2015 10:01:11 -0400 (EDT)
Date: Mon, 14 Sep 2015 10:01:11 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20150914140110.GB8691@mentor.com>
References: <1441697402-6805-1-git-send-email-rongqing.li@windriver.com>
	<55F623FB.7050805@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55F623FB.7050805@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ypbind-mt: add status command for initscript
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Sep 2015 14:02:18 -0000
X-Groupsio-MsgNum: 57341
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline

--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH] ypbind-mt: add status command for initscript] On 15.09.14=
 (Mon 09:33) Rongqing Li wrote:

> ping;
>=20
> it should be for meta-networking

It should be a moot point now anyway:

commit d3eaede791c121147f1b99db01facd2080019993
Author:     Zhu Yanjun <yanjun.zhu@windriver.com>
AuthorDate: Thu Aug 13 08:38:32 2015 +0800
Commit:     Joe MacDonald <joe_macdonald@mentor.com>
CommitDate: Fri Sep 11 10:27:37 2015 -0400

    ypbind-mt: add status command for initscript
   =20
    Add the "status" command in initscript to check the status of ypbind.
    remove ypbind-yocto.init as ypbind.init, which is the initscript, make
    its name similar to other recipes
   =20
    Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
    Signed-off-by: Roy Li <rongqing.li@windriver.com>
    Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>

-J.

>=20
>=20
> -Roy
>=20
> On 2015=E5=B9=B409=E6=9C=8808=E6=97=A5 15:30, rongqing.li@windriver.com w=
rote:
> >From: Zhu Yanjun <yanjun.zhu@windriver.com>
> >
> >Add the "status" command in initscript to check the status of ypbind.
> >remove ypbind-yocto.init as ypbind.init, which is the initscript, make
> >its name similar to other recipes
> >
> >Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
> >Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >---
> >  .../recipes-support/nis/files/{ypbind-yocto.init =3D> ypbind.init}   |=
 7 +++++++
> >  meta-networking/recipes-support/nis/ypbind-mt_1.38.bb              | 4=
 ++--
> >  meta-networking/recipes-support/nis/ypbind-mt_2.2.bb               | 4=
 ++--
> >  3 files changed, 11 insertions(+), 4 deletions(-)
> >  rename meta-networking/recipes-support/nis/files/{ypbind-yocto.init =
=3D> ypbind.init} (96%)
> >
> >diff --git a/meta-networking/recipes-support/nis/files/ypbind-yocto.init=
 b/meta-networking/recipes-support/nis/files/ypbind.init
> >similarity index 96%
> >rename from meta-networking/recipes-support/nis/files/ypbind-yocto.init
> >rename to meta-networking/recipes-support/nis/files/ypbind.init
> >index 2c50d12..244dc78 100644
> >--- a/meta-networking/recipes-support/nis/files/ypbind-yocto.init
> >+++ b/meta-networking/recipes-support/nis/files/ypbind.init
> >@@ -21,6 +21,9 @@
> >  #	the NIS binding information.
> >  ### END INIT INFO
> >
> >+# Need to use status function
> >+. /etc/init.d/functions
> >+
> >  YPBIND_BIN=3D/usr/sbin/ypbind
> >  pidfile=3D/var/run/ypbind.pid
> >
> >@@ -92,6 +95,10 @@ case "$1" in
> >  	echo -n "Reload service ypbind"
> >  	start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile
> >  	;;
> >+    status)
> >+	echo -n "Checking for ypbind: "
> >+	status $YPBIND_BIN
> >+	;;
> >      *)
> >  	echo "Usage: $0 {start|stop|status|try-restart|restart|force-reload|r=
eload|probe}"
> >  	exit 1
> >diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/met=
a-networking/recipes-support/nis/ypbind-mt_1.38.bb
> >index d25ef5c..5702cd6 100644
> >--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
> >+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
> >@@ -26,7 +26,7 @@ DEPENDS =3D " \
> >  PROVIDES +=3D "ypbind"
> >
> >  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2=
 \
> >-           file://ypbind-yocto.init \
> >+           file://ypbind.init \
> >             file://ypbind.service \
> >  "
> >  SRC_URI[md5sum] =3D "094088c0e282fa7f3b3dd6cc51d0a4e1"
> >@@ -44,7 +44,7 @@ do_install_append () {
> >      install -d ${D}${sysconfdir}/init.d
> >      install -d ${D}${sysconfdir}/rcS.d
> >
> >-    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init=
=2Ed/ypbind
> >+    install -m 0755 ${WORKDIR}/ypbind.init ${D}${sysconfdir}/init.d/ypb=
ind
> >
> >      install -d ${D}${systemd_unitdir}/system
> >      install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/s=
ystem
> >diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta=
-networking/recipes-support/nis/ypbind-mt_2.2.bb
> >index 6a9262a..cee5880 100644
> >--- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> >+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> >@@ -21,7 +21,7 @@ PROVIDES +=3D "ypbind"
> >  PNBLACKLIST[ypbind-mt] ?=3D "BROKEN: Depends on broken yp-tools"
> >
> >  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2=
 \
> >-           file://ypbind-yocto.init \
> >+           file://ypbind.init \
> >             file://ypbind.service \
> >  "
> >  SRC_URI[md5sum] =3D "54e2040d8266ae7d302d081ca310c8a8"
> >@@ -41,7 +41,7 @@ do_install_append () {
> >      install -d ${D}${sysconfdir}/init.d
> >      install -d ${D}${sysconfdir}/rcS.d
> >
> >-    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init=
=2Ed/ypbind
> >+    install -m 0755 ${WORKDIR}/ypbind.init ${D}${sysconfdir}/init.d/ypb=
ind
> >
> >      install -d ${D}${systemd_unitdir}/system
> >      install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/s=
ystem
> >
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li
--=20
-Joe MacDonald.
:wq

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV9tMmAAoJEEn8ffcsOfaW6SMH/2hxhMfRGMrXsiR73h3qu7m2
C57/1ICIy7KPHoYAZ661G1/hetQqA+OktiPs7anX9x57dvmGm5NHL2AjzQ9FUHaS
EfBDOezsW6KnW2AYnzJiH4k9f2BIxnEq1NL0i7bGT6dEmCyWjpc1YHftyvhjoFXD
gmJ0ybo41OJYSv2m6xelT2SYoqtxKs3wdBrTG8M3J/ReJkdlRJQK3N9SCu+um0bG
GWO0eameVnxd+vPkTO00nF/bviZ+cZcxse2MxOpRKF8dG5H3tEVd/ZNI0kAysQEe
DqhGAwZRB2ov2YJZbycifxOHho9pDN38JPY7HQ/aXI+nF4JzUOXjyHT1ponAQZM=
=a7gS
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
