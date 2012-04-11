Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SI5eL-00034n-HW
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 00:04:25 +0200
Received: by wibhj13 with SMTP id hj13so1183164wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 14:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5Eq5pXk7UXKHHeaeKmTqJU1fZi9OQA2+yabys5rVpyc=;
	b=dBw+rxSlNjJnz8yx94ZC5D3Ur+zibz1zilKRY+Pbc0snRllkrC8GKc2tirG/w4v2vG
	pGqxMy3FQC+mE8YFZFSza+iY8c8rjHaPqp1TBknLOhlQfryikhVQBKgkjMl4O149wMvz
	f35d3ISA1qShAeimXtsLLJDDvPkCxNxrx4/6JSI2RkOk60roHh/MUwNcftam7BKkOvj/
	hefA2d99D1vl0WPgfc6P4Y+lWmVEP6zNIvSUDW0DG8o61Tbs2yLJvyARzjFUpLpGbWZm
	av6xkeWTmT2ZgMWT6bB3KbRtt7Phz94F1f74+O8JI5+qw84euJoXD0kxIQwfi9pAxWy7
	KwEg==
Received: by 10.216.132.226 with SMTP id o76mr9554751wei.93.1334181306364;
	Wed, 11 Apr 2012 14:55:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm47797148wib.2.2012.04.11.14.55.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 14:55:05 -0700 (PDT)
Date: Wed, 11 Apr 2012 14:55:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120411125503.GB3637@jama.jama.net>
References: <1334180792-20535-1-git-send-email-apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <1334180792-20535-1-git-send-email-apelete@seketeli.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [PATCH] opkg-utils: Update SRC_URI to git.yoctoproject.org
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
X-List-Received-Date: Wed, 11 Apr 2012 22:04:25 -0000
X-Groupsio-MsgNum: 38215
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, 2012 at 11:46:32PM +0200, Apelete Seketeli wrote:
> This updates SRC_URI as the svn.openmoko.org repository is now down.
> All the changes of this patch were picked from oe-core and brought
> over.
>=20
> Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> ---
>  .../opkg-utils/opkg-utils/add-license-field.patch  |   39 ++++++++++++++=
+++
>  .../opkg-utils/arfile_header_split.patch           |   10 +++++
>  .../opkg-utils/index-ignore-filenotfound.patch     |   19 ++++++++
>  recipes/opkg-utils/opkg-utils/mtime-int.patch      |    3 ++
>  recipes/opkg-utils/opkg-utils/shebang.patch        |   46 ++++++++++++++=
++++++
>  recipes/opkg-utils/opkg-utils_git.bb               |   31 +++++++++++++
>  recipes/opkg-utils/opkg-utils_svn.bb               |   27 ------------
>  7 files changed, 148 insertions(+), 27 deletions(-)
>  create mode 100644 recipes/opkg-utils/opkg-utils/add-license-field.patch
>  create mode 100644 recipes/opkg-utils/opkg-utils/shebang.patch
>  create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
>  delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb

All those patches were sent as git patches for git.yoctoproject.org.. so=20
you can ping yocto ML to apply them sooner then after 1.2 release to make t=
his patch
a bit smaller :).

See
https://lists.yoctoproject.org/pipermail/yocto/2012-March/007851.html

Cheers,

>=20
> diff --git a/recipes/opkg-utils/opkg-utils/add-license-field.patch b/reci=
pes/opkg-utils/opkg-utils/add-license-field.patch
> new file mode 100644
> index 0000000..0d33459
> --- /dev/null
> +++ b/recipes/opkg-utils/opkg-utils/add-license-field.patch
> @@ -0,0 +1,39 @@
> +Add knowledge about License field in ipk headers
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: opkg-utils/opkg.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- opkg-utils.orig/opkg.py	2010-11-01 04:52:35.000000000 -0700
> ++++ opkg-utils/opkg.py	2011-07-13 15:18:03.900037344 -0700
> +@@ -145,6 +145,7 @@
> +         self.priority =3D None
> +         self.tags =3D None
> +         self.fn =3D fn
> ++        self.license =3D None
> +=20
> +         if fn:
> +             # see if it is deb format
> +@@ -319,6 +320,12 @@
> +     def get_section(self, section):
> +         return self.section
> +=20
> ++    def set_license(self, license):
> ++        self.license =3D license
> ++
> ++    def get_license(self, license):
> ++        return self.license
> ++
> +     def get_file_list(self):
> +         if not self.fn:
> +             return []
> +@@ -425,6 +432,7 @@
> +         if self.description: out =3D out + "Description: %s\n" % (self.=
description)
> +         if self.oe: out =3D out + "OE: %s\n" % (self.oe)
> +         if self.homepage: out =3D out + "HomePage: %s\n" % (self.homepa=
ge)
> ++        if self.license: out =3D out + "License: %s\n" % (self.license)
> +         if self.priority: out =3D out + "Priority: %s\n" % (self.priori=
ty)
> +         if self.tags: out =3D out + "Tags: %s\n" % (self.tags)
> +         out =3D out + "\n"
> diff --git a/recipes/opkg-utils/opkg-utils/arfile_header_split.patch b/re=
cipes/opkg-utils/opkg-utils/arfile_header_split.patch
> index 4640367..b679f8b 100644
> --- a/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
> +++ b/recipes/opkg-utils/opkg-utils/arfile_header_split.patch
> @@ -1,3 +1,13 @@
> +From: Scott Anderson <o2e@saaworld.com>
> +Subject: ipkg-utils: Make arfile.py handle six digit UIDs
> +   =20
> +    Essentially, the problem is that arfile.py is splitting the ar heade=
r with
> +    white-space instead of fixed-width fields, so two fields would get t=
reated
> +    as a single field.  This makes things better than before as it now h=
onors
> +    the fixed field widths.
> +   =20
> +Upstream-Status: Pending (there is no upstream after openmoko imploded)
> +
>  --- ipkg-utils/arfile.py.orig	2010-09-29 13:38:15.000000000 -0700
>  +++ ipkg-utils/arfile.py	2010-10-01 16:06:00.000000000 -0700
>  @@ -74,7 +74,12 @@
> diff --git a/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patc=
h b/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
> index e4a5481..f0f0fcf 100644
> --- a/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
> +++ b/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
> @@ -5,6 +5,8 @@ error out.
> =20
>  RP - 26/8/09
> =20
> +Upstream-Status: Inappropriate [embedded specific]
> +
>  Index: opkg-utils/opkg-make-index
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- opkg-utils.orig/opkg-make-index	2009-08-26 17:21:26.000000000 +0100
> @@ -52,3 +54,20 @@ Index: opkg-utils/opkg-make-index
>   if packages_filename:
>        sys.stdout.close()
>        sys.stdout =3D old_stdout
> +@@ -197,7 +197,15 @@
> + names =3D packages.packages.keys()
> + names.sort()
> + for name in names:
> +-     for fn in packages[name].get_file_list():
> ++     try:
> ++          fnlist =3D packages[name].get_file_list()
> ++     except OSError, e:
> ++          sys.stderr.write("Package %s disappeared on us!\n" % (name))
> ++          continue
> ++     except IOError, e:
> ++          sys.stderr.write("Package %s disappeared on us!\n" % (name))
> ++          continue
> ++     for fn in fnlist:
> +           (h,t) =3D os.path.split(fn)
> +           if not t: continue
> +           if not files.has_key(t): files[t] =3D name+':'+fn
> diff --git a/recipes/opkg-utils/opkg-utils/mtime-int.patch b/recipes/opkg=
-utils/opkg-utils/mtime-int.patch
> index efec3c0..483a62a 100644
> --- a/recipes/opkg-utils/opkg-utils/mtime-int.patch
> +++ b/recipes/opkg-utils/opkg-utils/mtime-int.patch
> @@ -12,6 +12,9 @@ gain by this change.
> =20
>  Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> =20
> +Upstream-Status: Pending
> +(Contacting the original author, no response yet.)
> +
>  Index: opkg-utils/opkg-make-index
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- opkg-utils.orig/opkg-make-index
> diff --git a/recipes/opkg-utils/opkg-utils/shebang.patch b/recipes/opkg-u=
tils/opkg-utils/shebang.patch
> new file mode 100644
> index 0000000..f6a2ef9
> --- /dev/null
> +++ b/recipes/opkg-utils/opkg-utils/shebang.patch
> @@ -0,0 +1,46 @@
> +Use python via the PATH, rather than hardcoding /usr/bin/python
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Christopher Larson <kergoth@gmail.com>
> +
> +--- opkg-utils.orig/opkg-list-fields
> ++++ opkg-utils/opkg-list-fields
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python
> +=20
> + import sys, opkg
> +=20
> +--- opkg-utils.orig/opkg-make-index
> ++++ opkg-utils/opkg-make-index
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python
> +=20
> + import sys, os, posixpath
> + from glob import glob
> +--- opkg-utils.orig/opkg-show-deps
> ++++ opkg-utils/opkg-show-deps
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python
> +=20
> + import sys, os, posixpath
> + from glob import glob
> +--- opkg-utils.orig/opkg-unbuild
> ++++ opkg-utils/opkg-unbuild
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python
> ++#!/usr/bin/env python
> +=20
> + import sys, os, re
> +=20
> +--- opkg-utils.orig/opkg-update-index
> ++++ opkg-utils/opkg-update-index
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python2.1
> ++#!/usr/bin/env python
> +=20
> + import sys, os
> + from glob import glob
> diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/op=
kg-utils_git.bb
> new file mode 100644
> index 0000000..d2dfda6
> --- /dev/null
> +++ b/recipes/opkg-utils/opkg-utils_git.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION =3D "OPKG Package Manager Utilities"
> +SECTION =3D "base"
> +HOMEPAGE =3D "http://wiki.openmoko.org/wiki/Opkg"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> +                    file://opkg.py;beginline=3D1;endline=3D18;md5=3D1591=
7491ad6bf7acc666ca5f7cc1e083"
> +RDEPENDS_${PN} =3D "python"
> +RDEPENDS_${PN}_virtclass-native =3D ""
> +SRCREV =3D "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
> +PV =3D "0.1.8+git${SRCPV}"
> +PR =3D "r0"
> +
> +SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dgit \
> +           file://index-ignore-filenotfound.patch \
> +           file://mtime-int.patch \
> +           file://add-license-field.patch \
> +           file://arfile_header_split.patch \
> +           file://shebang.patch \
> +           "
> +
> +S =3D "${WORKDIR}/git"
> +
> +# Avoid circular dependencies from package_ipk.bbclass
> +PACKAGES_virtclass-native =3D ""
> +
> +do_install() {
> +	oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/op=
kg-utils_svn.bb
> deleted file mode 100644
> index 3ddafdb..0000000
> --- a/recipes/opkg-utils/opkg-utils_svn.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION =3D "OPKG Package Manager Utilities"
> -SECTION =3D "base"
> -HOMEPAGE =3D "http://wiki.openmoko.org/wiki/Opkg"
> -PRIORITY =3D "optional"
> -LICENSE =3D "GPLv2"
> -RDEPENDS_${PN} =3D "python"
> -RDEPENDS_${PN}_virtclass-native =3D ""
> -SRCREV =3D "4747"
> -PV =3D "0.1.8+svnr${SRCPV}"
> -PR =3D "r7"
> -
> -SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host/;module=3Dopkg-utils;=
proto=3Dhttp \
> -           file://index-ignore-filenotfound.patch \
> -           file://arfile_header_split.patch \
> -           file://mtime-int.patch"
> -
> -S =3D "${WORKDIR}/opkg-utils"
> -
> -# Avoid circular dependencies from package_ipk.bbclass
> -PACKAGES_virtclass-native =3D ""
> -
> -do_install() {
> -        oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> -}
> -
> -BBCLASSEXTEND =3D "native"
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+FfycACgkQN1Ujt2V2gByHBwCdH/Ljj0cz6dm5BRXQyO1H+ZmN
kUsAnA02nENwa+Us0+Toq95zaLRF9BOA
=eehN
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
