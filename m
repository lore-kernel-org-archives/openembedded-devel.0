Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F1B3360034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 16:16:02 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1YqkwV-0002uv-3f from Joe_MacDonald@mentor.com ;
	Fri, 08 May 2015 09:16:03 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2; Fri, 8 May 2015
	09:16:02 -0700
Received: by burninator (Postfix, from userid 1000)	id F2AC45806FD; Fri,  8
	May 2015 12:16:06 -0400 (EDT)
Date: Fri, 8 May 2015 12:16:06 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <rongqing.li@windriver.com>
Message-ID: <20150508161606.GB7280@mentor.com>
References: <1430201100-15248-1-git-send-email-rongqing.li@windriver.com>
	<1430201100-15248-3-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1430201100-15248-3-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3][meta-networking] opensaf: create the node_name configuration file after install pkg
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
X-List-Received-Date: Fri, 08 May 2015 16:16:06 -0000
X-Groupsio-MsgNum: 55405
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roy,

[[oe] [PATCH 3/3][meta-networking] opensaf: create the node_name configurat=
ion file after install pkg] On 15.04.28 (Tue 14:05) rongqing.li@windriver.c=
om wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> not create the node_name file when building by calling "hostname -s",
> and create it after install pkg, since it works on cross-compile
> environment
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../opensaf/0001-not-install-node_name.patch       | 30 ++++++++++++++++=
++++++
>  .../recipes-daemons/opensaf/opensaf_4.5.0.bb       | 13 +++++++++-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-=
not-install-node_name.patch
>=20
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-not-ins=
tall-node_name.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001=
-not-install-node_name.patch
> new file mode 100644
> index 0000000..d152de0
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-not-install-no=
de_name.patch
> @@ -0,0 +1,30 @@
> +[PATCH] not install node_name
> +
> +Upstream-Status: Inappropriate [cross compiling specific]
> +
> +when cross-compile, the compile host name is written into node_name file,
> +but target host name should be written, so not install node_name, and cr=
eate
> +it when pkg-install
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + osaf/services/saf/clmsv/config/Makefile.am | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/osaf/services/saf/clmsv/config/Makefile.am b/osaf/services/=
saf/clmsv/config/Makefile.am
> +index 15b8702..88c8d24 100644
> +--- a/osaf/services/saf/clmsv/config/Makefile.am
> ++++ b/osaf/services/saf/clmsv/config/Makefile.am
> +@@ -39,9 +39,3 @@ dist_pkgimmxml_svc_DATA +=3D \
> + endif
> +=20
> + endif
> +-
> +-install-data-hook:
> +-	hostname -s > $(DESTDIR)$(pkgsysconfdir)/node_name
> +-
> +-uninstall-hook:
> +-	rm -f $(DESTDIR)$(pkgsysconfdir)/node_name
> +--=20
> +1.9.1
> +
> diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/m=
eta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> index 6d31b1c..fc77f2f 100644
> --- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> +++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> @@ -14,7 +14,9 @@ HOMEPAGE =3D "http://www.opensaf.org"
>  inherit autotools useradd systemd pkgconfig
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
> -           file://install-samples-from-srcdir.patch"
> +           file://install-samples-from-srcdir.patch \
> +           file://0001-not-install-node_name.patch \
> +"
> =20
>  SRC_URI[md5sum] =3D "534c0a99438a62c4c8dda56cfa67300c"
>  SRC_URI[sha256sum] =3D "2f5ba57fe67e94099c0df82d0a0dd207b5c583c93030035b=
a354c97b5471b590"
> @@ -45,3 +47,12 @@ do_install_append() {
>      install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensaf=
d.service \
>          ${D}${systemd_unitdir}/system
>  }
> +
> +pkg_postinst_${PN} () {
> +    if [ "x$D" !=3D "x" ]; then
> +        exit 1
> +    fi
> +
> +    hostname -s > /etc/opensaf/node_name
> +}
> +

Can you convert this to 'if [ -n "$D" ]; then ... fi' logic and check
for the existence of node_name before over-writing it, since this could
also run on a package upgrade?

For that matter, if you need a node_name and it's always going to be
hostname, couldn't you just dump ${hostname} into
${D}${sysconfdir}/node_name in the do_install_append() that's already
there and then there's no need for a postinst step?

--=20
-Joe MacDonald.
:wq

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVTOFGAAoJEEn8ffcsOfaWrXIH/A4slxwkDKdGKWMGbrOENTl5
hZcN8PmnmKm3qSt/DUJaYKnWvS5pYITQqAmlNFKVFuhAlZNR8XLWCevmmevo9gx+
clfpAJDOY4+niOyyu5YUCGB1X5QLJch3ifwss1Pm18OAIAoHD9s0BR0JwFqcXr5W
lEuADTEhNXvTKF01vZFGDPbT06yaexpB3pCnafY7B98hdU9neJOSLW3ng1uD7AvY
fSI/fHkEVKYuHmMJlgottzj8Mym7rVtdJr4x71TXs/FgImeAym6/7tdwqQYfzmYg
Wgdiiiz9p3tGuV3rsGeMkxTVSomgh72D8D/y/ZK2xFDM87GVbzOpKdkw49FRf7s=
=VV4S
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
