Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id DDA1A60034;
	Sat, 21 Mar 2015 15:34:23 +0000 (UTC)
Received: by weop45 with SMTP id p45so103849275weo.0;
	Sat, 21 Mar 2015 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pgLM5fH9AyMyrLKFfQz4xh/sENs4QVkhZWnbXpxvZb4=;
	b=ez3ySyrLW5H5KfhvI7+cmexw/XpQozSvVY3hlEmLU4tPjRsX6au58hNGd8QdM4JD1X
	4iI9j5WUkJgb7hsQo5KxiMUbNjBqre/3oZU7QriJB3u2XV2uJY0bJRQAcnzrGlUdWvVb
	pn0HvxmGUcSOFFkg+ZL1gmvLNT689jIEAlyxV3rsRRkYg6v24594Br3ns9gTZoq89nXg
	5K6h7JQHlRqu23ukn0+hJLawsFJiof66VBpDmJk2/gHfyWCfwKZVJJlK47Pj7gBEB5HG
	oSIaIZJP6zOp1YROX1EmKYa1U/lzAmtWChajKhBb1Tt2sywBzE0n6azSCggXas7AoQca
	RVyQ==
X-Received: by 10.194.77.230 with SMTP id v6mr173338659wjw.25.1426952064760;
	Sat, 21 Mar 2015 08:34:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z13sm11033929wjr.44.2015.03.21.08.34.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Mar 2015 08:34:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Mar 2015 16:34:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150321153434.GM4738@jama>
References: <20150301200217.0D5625019A@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150301200217.0D5625019A@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Joe MacDonald : nis: update yp-tools and ypbind
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
X-List-Received-Date: Sat, 21 Mar 2015 15:34:24 -0000
X-Groupsio-MsgNum: 54840
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BHMq0+oGliEfCAkH"
Content-Disposition: inline

--BHMq0+oGliEfCAkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2015 at 08:02:17PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: 1013f586c5a338b8be00b38056005881bef92d52
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D1013f586c5a338b8be00b38056005881bef92d52
>=20
> Author: Joe MacDonald <joe_macdonald@mentor.com>
> Date:   Fri Feb 27 09:53:51 2015 -0500
>=20
> nis: update yp-tools and ypbind
>=20
> Both yp-tools and ypbind-mt were out of date with their latest released
> versions, so bump them up to current.  Remove two dead patches at the same
> time and reorganize the recipes to better follow the preferred OE style.
> Finally, the new release includes a new version of the GPLv2 COPYING file,
> with a significant amount of whitespace fixes, so update the license
> checksum.

Can you please fix this qa:
ypbind-mt-1.38: ypbind-mt rdepends on libsystemd, but it isn't a build depe=
ndency? [build-deps]

>=20
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>=20
> ---
>=20
>  .../recipes-support/nis/files/libdl.patch          | 12 -------
>  .../recipes-support/nis/files/no-selinux.patch     | 16 ----------
>  meta-networking/recipes-support/nis/nis.inc        |  2 +-
>  .../nis/{yp-tools_2.12.bb =3D> yp-tools_2.14.bb}     | 23 ++++++++------
>  .../nis/{ypbind-mt_1.36.bb =3D> ypbind-mt_1.38.bb}   | 37 +++++++++++---=
--------
>  5 files changed, 33 insertions(+), 57 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/nis/files/libdl.patch b/meta=
-networking/recipes-support/nis/files/libdl.patch
> deleted file mode 100644
> index 605af31..0000000
> --- a/meta-networking/recipes-support/nis/files/libdl.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> ---- pwdutils-2.6/configure.in.orig	2005-04-19 20:22:36.603052192 -0700
> -+++ pwdutils-2.6/configure.in	2005-04-19 21:09:45.308023672 -0700
> -@@ -178,6 +178,9 @@
> -     AC_CHECK_LIB(ldap, main, LDAP_LIBS=3D"-lldap $LDAP_LIBS" found_ldap=
_lib=3Dyes,,$LDAP_LIBS)
> -   fi
> -=20
> -+  dnl this always needs dl
> -+  AC_CHECK_LIB(dl, dlopen, LDAP_LIBS=3D"$LDAP_LIBS -ldl")
> -+
> -   if test -z "$found_ldap_lib" -a \( $with_ldap_lib =3D auto -o $with_l=
dap_lib =3D netscape5 \); then
> -     AC_CHECK_LIB(ldap50, main, LDAP_LIBS=3D"-lldap50 -lssldap50 -lssl3 =
-lnss3 -lnspr4 -lprldap50 -lplc4 -lplds4" found_ldap_lib=3Dyes need_pthread=
=3Dtrue,, -lpthread)
> -   fi
> diff --git a/meta-networking/recipes-support/nis/files/no-selinux.patch b=
/meta-networking/recipes-support/nis/files/no-selinux.patch
> deleted file mode 100644
> index 71da3e3..0000000
> --- a/meta-networking/recipes-support/nis/files/no-selinux.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> ---- pwdutils-2.6/lib/copy_xattr.c.orig	2005-04-16 17:15:52.916660880 -07=
00
> -+++ pwdutils-2.6/lib/copy_xattr.c	2005-04-16 17:18:10.345768480 -0700
> -@@ -127,8 +127,11 @@
> -=20
> - 	  if (lsetxattr (to, name, value, size, 0) !=3D 0)
> - 	    {
> --	      if (strcmp (name, "security.selinux") =3D=3D 0 &&
> --		  is_selinux_enabled() =3D=3D 0)
> -+	      if (strcmp (name, "security.selinux") =3D=3D 0
> -+#if defined(WITH_SELINUX)
> -+				  && is_selinux_enabled() =3D=3D 0
> -+#endif
> -+				  )
> - 		fprintf (stderr,
> - 			 _("SELinux not enabled, ignore attribute %s for `%s'.\n"),
> - 			 name, to);
> diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networkin=
g/recipes-support/nis/nis.inc
> index 075d275..eaff949 100644
> --- a/meta-networking/recipes-support/nis/nis.inc
> +++ b/meta-networking/recipes-support/nis/nis.inc
> @@ -7,7 +7,7 @@ DESCRIPTION =3D "NIS Server and Tools"
>  HOMEPAGE =3D "http://www.linux-nis.org/nis/"
>  SECTION =3D "console/network"
>  LICENSE =3D "GPL-2.0"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> =20
>  inherit autotools gettext pkgconfig
> =20
> diff --git a/meta-networking/recipes-support/nis/yp-tools_2.12.bb b/meta-=
networking/recipes-support/nis/yp-tools_2.14.bb
> similarity index 73%
> rename from meta-networking/recipes-support/nis/yp-tools_2.12.bb
> rename to meta-networking/recipes-support/nis/yp-tools_2.14.bb
> index 0017845..8c6837b 100644
> --- a/meta-networking/recipes-support/nis/yp-tools_2.12.bb
> +++ b/meta-networking/recipes-support/nis/yp-tools_2.14.bb
> @@ -1,29 +1,32 @@
>  # This package builds tools to manage NIS
>  # The source package is utils/net/NIS/yp-tools
>  #
> -PR =3D "r3"
> -DESCRIPTION=3D"\
> +require nis.inc
> +
> +SUMMARY =3D "NIS client programs"
> +DESCRIPTION =3D " \
>  Network Information Service tools.  \
>  This package contains ypcat, ypmatch, ypset, \
>  ypwhich, yppasswd, domainname, nisdomainname \
> -and ypdomainname."
> +and ypdomainname. \
> +\
> +This is the final IPv4-only version of yp-tools. \
> +"
> =20
> -require nis.inc
>  SRC_URI =3D "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
>             file://domainname.service \
>  "
> -
> -SRC_URI[md5sum] =3D "ce1e06d86caa285fa8cd76fdf103f51e"
> -SRC_URI[sha256sum] =3D "6ae8321666eea7837da343eea90ea30273fb74943ad111d5=
a4befd2afb252063"
> -
> -CACHED_CONFIGUREVARS +=3D "ac_cv_prog_STRIP=3D/bin/true"
> +SRC_URI[md5sum] =3D "ba1f121c17e3ad65368be173b977cd13"
> +SRC_URI[sha256sum] =3D "d01f70fadc643a55107a0edc47c6be99d0306bcc4f66df56=
f65e74238b0124c9"
> =20
>  inherit systemd
> +SYSTEMD_SERVICE_${PN} =3D "domainname.service"
> =20
>  RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "domainname.service"
> +
> +CACHED_CONFIGUREVARS +=3D "ac_cv_prog_STRIP=3D/bin/true"
> =20
>  do_install_append() {
>      install -d ${D}${systemd_unitdir}/system
> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb b/meta=
-networking/recipes-support/nis/ypbind-mt_1.38.bb
> similarity index 74%
> rename from meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
> rename to meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
> index 35ef16a..f7e6b43 100644
> --- a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
> +++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
> @@ -1,8 +1,9 @@
>  # This package builds the NIS ypbind daemon
>  # The source package is utils/net/NIS/ypbind-mt
>  #
> -PR =3D "r3"
> -DESCRIPTION=3D"\
> +require nis.inc
> +
> +DESCRIPTION =3D " \
>  Multithreaded NIS bind service (ypbind-mt).  \
>  ypbind-mt is a complete new implementation of a NIS \
>  binding daemon for Linux. It has the following \
> @@ -11,23 +12,28 @@ Uses threads for better response.  Supports multiple \
>  domain bindings.  Supports /var/yp/binding/* file \
>  for Linux libc 4/5 and glibc 2.x.  Supports a list \
>  of known secure NIS server (/etc/yp.conf) Binds to \
> -the server which answered as first."
> -HOMEPAGE=3D"http://www.linux-nis.org/nis/ypbind-mt/index.html"
> -
> -require nis.inc
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D082c9a0886c7c3db1bc862b5b62ff=
e08"
> +the server which answered as first. \
> +\
> +This is the final IPv4-only version of ypbind-mt. \
> +"
> +HOMEPAGE =3D "http://www.linux-nis.org/nis/ypbind-mt/index.html"
> +DEPENDS =3D "yp-tools"
> +# ypbind-mt now provides all the functionality of ypbind
> +# and is used in place of it.
> +PROVIDES +=3D "ypbind"
> =20
>  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
>             file://ypbind-yocto.init \
>             file://ypbind.service \
>  "
> -SRC_URI[md5sum] =3D "135834db97d78ff6d79fdee2810b4056"
> -SRC_URI[sha256sum] =3D "0eff76c1849f4b38ea1a60280d8397c4240369c641fe5402=
ce57edf1a90958c7"
> +SRC_URI[md5sum] =3D "094088c0e282fa7f3b3dd6cc51d0a4e1"
> +SRC_URI[sha256sum] =3D "1930ce19f6ccfe10400f3497b31867f71690d2bcd3f5b575=
199fa915559b7746"
> =20
> -# ypbind-mt now provides all the functionality of ypbind
> -# and is used in place of it.
> -PROVIDES +=3D "ypbind"
> +inherit systemd update-rc.d
> +
> +SYSTEMD_SERVICE_${PN} =3D "ypbind.service"
> +INITSCRIPT_NAME =3D "ypbind"
> +INITSCRIPT_PARAMS =3D "start 44 3 5 . stop 70 0 1 2 6 ."
> =20
>  CACHED_CONFIGUREVARS =3D "ac_cv_prog_STRIP=3D/bin/true"
> =20
> @@ -37,16 +43,11 @@ do_install_append () {
> =20
>      install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.=
d/ypbind
> =20
> -    # TODO, use update-rc.d
> -    ln -s ../init.d/ypbind ${D}${sysconfdir}/rcS.d/S44ypbind
> -
>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/sys=
tem
>  }
> =20
> -inherit systemd
> =20
>  RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "ypbind.service"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BHMq0+oGliEfCAkH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUNj4oACgkQN1Ujt2V2gBzI0gCggwPmYdMgA+ifWic1WQVfrGmH
zIAAn1kVkmrG1J/MVrNSjDOz7G8Wbu5e
=8Y+P
-----END PGP SIGNATURE-----

--BHMq0+oGliEfCAkH--
