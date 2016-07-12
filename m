Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC4B6067C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 13:41:37 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1bMxwP-0002Tb-Fy from Joe_MacDonald@mentor.com ;
	Tue, 12 Jul 2016 06:41:37 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 Jul 2016 06:41:36 -0700
Received: by burninator (Postfix, from userid 1000)	id 0D5E5580DC6; Tue, 12
	Jul 2016 09:41:36 -0400 (EDT)
Date: Tue, 12 Jul 2016 09:41:36 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20160712134134.GA4066@mentor.com>
References: <1468324237-13346-1-git-send-email-jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <1468324237-13346-1-git-send-email-jussi.kukkonen@intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] augeas: Move from oe-core
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
X-List-Received-Date: Tue, 12 Jul 2016 13:41:38 -0000
X-Groupsio-MsgNum: 62131
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] augeas: Move from oe-core] On 16.07.12 (Tue =
14:50) Jussi Kukkonen wrote:

> augeas is being removed from oe-core as nothing there uses or tests
> it. Move the recipe to meta-networking where the only meta-oe reverse
> dependency (netcf) lives.

I don't object to this and I always like having all of the things we
need in one place, but I don't know if it makes sense to have this in
meta-networking.  There's nothing (AFAICT) networking-specific about it
and the meta-networking layer already has multiple other layer
dependencies.  I'd suggest it probably has a better fit in meta-oe.

That said, I'll be easily swayed to bring this into meta-networking if
others feel differently.

-J.

>=20
> Also upgrade to 1.5.0: no recipe changes needed.
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta-networking/recipes-support/augeas/augeas.inc  | 30 ++++++++++++++++=
++++++
>  ...need_charset_alias-when-building-for-musl.patch | 30 ++++++++++++++++=
++++++
>  .../augeas/add-missing-argz-conditional.patch      | 20 +++++++++++++++
>  .../augeas/augeas/sepbuildfix.patch                | 22 ++++++++++++++++
>  .../recipes-support/augeas/augeas_1.5.0.bb         |  4 +++
>  5 files changed, 106 insertions(+)
>  create mode 100644 meta-networking/recipes-support/augeas/augeas.inc
>  create mode 100644 meta-networking/recipes-support/augeas/augeas/0001-Un=
set-need_charset_alias-when-building-for-musl.patch
>  create mode 100644 meta-networking/recipes-support/augeas/augeas/add-mis=
sing-argz-conditional.patch
>  create mode 100644 meta-networking/recipes-support/augeas/augeas/sepbuil=
dfix.patch
>  create mode 100644 meta-networking/recipes-support/augeas/augeas_1.5.0.bb
>=20
> diff --git a/meta-networking/recipes-support/augeas/augeas.inc b/meta-net=
working/recipes-support/augeas/augeas.inc
> new file mode 100644
> index 0000000..23d12ca
> --- /dev/null
> +++ b/meta-networking/recipes-support/augeas/augeas.inc
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "Augeas configuration API"
> +HOMEPAGE =3D "http://augeas.net/"
> +BUGTRACKER =3D "https://fedorahosted.org/augeas/report/1"
> +
> +LICENSE =3D "LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbb461211a33b134d42ed5ee802b3=
7ff"
> +
> +SRC_URI =3D "http://download.augeas.net/${BP}.tar.gz \
> +           file://add-missing-argz-conditional.patch \
> +           file://sepbuildfix.patch \
> +           file://0001-Unset-need_charset_alias-when-building-for-musl.p=
atch \
> +          "
> +
> +DEPENDS =3D "readline libxml2"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGES =3D+ "${PN}-lenses lib${BPN}"
> +
> +FILES_${PN}-lenses =3D "${datadir}/augeas/lenses"
> +FILES_lib${BPN} =3D "${libdir}/lib*${SOLIBS}"
> +
> +RDEPENDS_lib${BPN} +=3D "${PN}-lenses"
> +RRECOMMENDS_lib${BPN} +=3D "${PN}"
> +
> +LEAD_SONAME =3D "libaugeas.so"
> +
> +do_install_append() {
> +	rm -fr ${D}${datadir}/vim
> +}
> diff --git a/meta-networking/recipes-support/augeas/augeas/0001-Unset-nee=
d_charset_alias-when-building-for-musl.patch b/meta-networking/recipes-supp=
ort/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
> new file mode 100644
> index 0000000..9a19876
> --- /dev/null
> +++ b/meta-networking/recipes-support/augeas/augeas/0001-Unset-need_chars=
et_alias-when-building-for-musl.patch
> @@ -0,0 +1,30 @@
> +From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 13 Apr 2015 17:02:13 -0700
> +Subject: [PATCH] Unset need_charset_alias when building for musl
> +
> +localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
> +which actually shoudl be fixed in gnulib and then all downstream
> +projects will get it eventually. For now we apply the fix to
> +coreutils
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + lib/gnulib.mk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: augeas-1.2.0/gnulib/lib/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- augeas-1.2.0.orig/gnulib/lib/Makefile.am
> ++++ augeas-1.2.0/gnulib/lib/Makefile.am
> +@@ -463,7 +463,7 @@ install-exec-localcharset: all-local
> + 	  case '$(host_os)' in \
> + 	    darwin[56]*) \
> + 	      need_charset_alias=3Dtrue ;; \
> +-	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
> ++	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
> + 	      need_charset_alias=3Dfalse ;; \
> + 	    *) \
> + 	      need_charset_alias=3Dtrue ;; \
> diff --git a/meta-networking/recipes-support/augeas/augeas/add-missing-ar=
gz-conditional.patch b/meta-networking/recipes-support/augeas/augeas/add-mi=
ssing-argz-conditional.patch
> new file mode 100644
> index 0000000..abbdbaa
> --- /dev/null
> +++ b/meta-networking/recipes-support/augeas/augeas/add-missing-argz-cond=
itional.patch
> @@ -0,0 +1,20 @@
> +Add missing GL_GENERATE_ARGZ_H conditional
> +
> +- GL_GENERATE_ARGZ_H is used in gnulib/lib/Makefile.am
> +
> +Upstream-Status: Pending
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +Index: augeas-1.0.0/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- augeas-1.0.0.orig/configure.ac
> ++++ augeas-1.0.0/configure.ac
> +@@ -55,6 +55,8 @@ AC_ARG_WITH([failmalloc],
> +=20
> + AM_CONDITIONAL([WITH_FAILMALLOC], [test x$with_failmalloc !=3D xno])
> +=20
> ++AM_CONDITIONAL([GL_GENERATE_ARGZ_H], [test -n "$ARGZ_H"])
> ++
> + dnl --enable-debug=3D(yes|no)
> + AC_ARG_ENABLE([debug],
> +               [AC_HELP_STRING([--enable-debug=3Dno/yes],
> diff --git a/meta-networking/recipes-support/augeas/augeas/sepbuildfix.pa=
tch b/meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch
> new file mode 100644
> index 0000000..b82a3ee
> --- /dev/null
> +++ b/meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch
> @@ -0,0 +1,22 @@
> +Ensure that builds in separate builddirs (${B} !=3D ${S}) correctly inst=
all the=20
> +lenses files.
> +
> +Upstream-Status: Pending
> +
> +RP 2013/4/17
> +
> +Index: augeas-1.0.0/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- augeas-1.0.0.orig/Makefile.am	2012-11-02 15:20:11.000000000 +0000
> ++++ augeas-1.0.0/Makefile.am	2013-04-17 10:36:24.033400125 +0000
> +@@ -5,8 +5,8 @@
> + lensdir=3D$(datadir)/augeas/lenses/dist
> + lenstestdir=3D$(datadir)/augeas/lenses/dist/tests
> +=20
> +-dist_lens_DATA=3D$(wildcard lenses/*.aug)
> +-dist_lenstest_DATA=3D$(wildcard lenses/tests/*.aug)
> ++dist_lens_DATA=3D$(wildcard $(top_srcdir)/lenses/*.aug)
> ++dist_lenstest_DATA=3D$(wildcard $(top_srcdir)lenses/tests/*.aug)
> +=20
> + EXTRA_DIST=3Daugeas.spec build/aux/move-if-change Makefile.am HACKING
> +=20
> diff --git a/meta-networking/recipes-support/augeas/augeas_1.5.0.bb b/met=
a-networking/recipes-support/augeas/augeas_1.5.0.bb
> new file mode 100644
> index 0000000..c4f62e7
> --- /dev/null
> +++ b/meta-networking/recipes-support/augeas/augeas_1.5.0.bb
> @@ -0,0 +1,4 @@
> +require augeas.inc
> +
> +SRC_URI[md5sum] =3D "01190e455c513124a2dae29a1182c113"
> +SRC_URI[sha256sum] =3D "223bb6e6fe3e9e92277dafd5d34e623733eb969a72a38299=
8d204feab253f73f"
> --=20
> 2.1.4
>=20
--=20
-Joe MacDonald.
:wq

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXhPOLAAoJEEn8ffcsOfaWLGkH/iCQtFmAN9/ki/OCrMWKelNe
hVrCpP8bW8nbOeRhJHzcdWCWYo2VjRH9EdMaa43l53B/YOdIjabPctN+tQgIbY6F
HeFxYRzVvhgIyHrF2QjrgJ6eqk5dxSlbAimqhwUPBxLGF4ZhY9C+5EEDuDggayyZ
rndqzzmp81gqYEvmj6aeY7tLSluT7PS5D6XDqq9yp1WWakWIV9Dggcb3YZO1bDES
MUGGGhsQzpSek4sxedH7DYQ7QjLZGTEJy9eBUztztVY4hu7Inxw2eiy3fgK3y1IE
8+z74UeekZxcr2XOKXZA1OewNZtZiNmAt5Ygx5webDco9+4WPOhO5Mf6Boly0Co=
=JyM9
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
