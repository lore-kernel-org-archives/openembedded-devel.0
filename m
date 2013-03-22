Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyTx-0008KW-1Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:41:55 +0100
Received: by mail-da0-f50.google.com with SMTP id t1so660787dae.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lCW7tE4JUe2Dx9h2FIs2T3sR/Z/iL3NXuHE/5aeC2Xg=;
	b=eM3dfeEJnyktXkMvjS8E8k6ctOrPRK6bTMjHUoHazW3iJh+tiXSUUJNidVsgC+rhTs
	mjlMOplEMtQ7NTAvZArIdD4RZ4biW/h9QmgzTikfu2Sc/QxLaIt6kFHMPXnoLV+mjf0D
	quKWv0igDpx7VBw7z9BKfqIriSVXzH5hQxFkOcCtTsVU3/sONUs+Acr/9T7wL+OA8zLx
	+kbZ5vHwJJovQe96gZansZ3vPJptfc5G/RiM6PDAf7wsF9ytFQhnXxtT3ECqkBamwCaa
	UwFS/c1HF0h23FoFUszV4A8CvcmufE+7ehyHuBNapGgDVutX11pW4igi8oWl4DY1PvQ8
	tirw==
X-Received: by 10.68.238.103 with SMTP id vj7mr1450922pbc.181.1363944298834;
	Fri, 22 Mar 2013 02:24:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fh1sm2317831pac.1.2013.03.22.02.24.56
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:24:57 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:24:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322092456.GQ3219@jama>
References: <1363160982-31939-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1363160982-31939-1-git-send-email-b28495@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] lio-utils: initial add 4.1
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
X-List-Received-Date: Fri, 22 Mar 2013 09:41:57 -0000
X-Groupsio-MsgNum: 43658
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WjWU9mUuKzTKEtBb"
Content-Disposition: inline

--WjWU9mUuKzTKEtBb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 03:49:42PM +0800, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> lio-utils (lio-utils.git) provide a simple low-level configuration tool
> set for the Target+iSCSI (LIO).

Applied, thanks!

>=20
> lio-utils use the configFS kernel API that is available with LIO, which
> provides a clean interface for controlling the kernel level Target
> engine and its fabric module subsystems.
>=20
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb |   59 ++++++++++++++=
++++++
>  1 files changed, 59 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
>=20
> diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe=
/recipes-support/lio-utils/lio-utils_4.1.bb
> new file mode 100644
> index 0000000..bbedb78
> --- /dev/null
> +++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "lio-utils"
> +DESCRIPTION =3D "a simple low-level configuration tool set for the Targe=
t+iSCSI (LIO)"
> +HOMEPAGE =3D "http://linux-iscsi.org/index.php/Lio-utils"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dc3ea231a32635cbb5deb=
edf3e88aa3df"
> +
> +PV =3D "4.1+git${SRCPV}"
> +
> +SRC_URI =3D "git://risingtidesystems.com/lio-utils.git"
> +SRCREV =3D "28bd928655bdc7bd3cf380f0196630690c51e05f"
> +S =3D "${WORKDIR}/git"
> +
> +inherit distutils
> +
> +EXTRA_OEMAKE +=3D "DESTDIR=3D${D}"
> +
> +do_compile() {
> +    cd ${S}/tcm-py
> +    distutils_do_compile
> +
> +    cd ${S}/lio-py
> +    distutils_do_compile
> +
> +    if test -d ${S}/tools; then
> +        oe_runmake -C ${S}/tools
> +    fi
> +}
> +
> +do_install() {
> +    cd ${S}/tcm-py
> +    distutils_do_install
> +
> +    cd ${S}/lio-py
> +    distutils_do_install
> +
> +    SITE_PACKAGES=3D${D}/${PYTHON_SITEPACKAGES_DIR}
> +    install -d ${D}/${sbindir}
> +    for var in tcm_node tcm_dump tcm_loop tcm_fabric lio_dump lio_node; =
do
> +        if [ ! -h ${D}/${sbindir}/${var} ];then
> +            chmod a+x ${SITE_PACKAGES}/${var}.py
> +            ln -s ${PYTHON_SITEPACKAGES_DIR}/${var}.py ${D}/${sbindir}/$=
{var}
> +        fi
> +    done
> +
> +    if test -d ${S}/tools; then
> +        oe_runmake -C ${S}/tools install
> +    fi
> +
> +    install -d ${D}/etc/target/
> +    install -d ${D}/etc/init.d/
> +    install -m 755 ${S}/scripts/rc.target ${D}/etc/init.d/
> +    install -m 755 ${S}/conf/tcm_start.default ${D}/etc/target/tcm_start=
=2Esh
> +    install -m 755 ${S}/conf/lio_start.default ${D}/etc/target/lio_start=
=2Esh
> +}
> +
> +RDEPENDS_${PN} +=3D "python-stringold python-subprocess python-shell \
> +    python-datetime python-textutils python-crypt python-netclient pytho=
n-email"
> +
> +FILES_${PN} +=3D "${sbindir}/* /etc/init.d/* /etc/target/*"
> --=20
> 1.7.3.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WjWU9mUuKzTKEtBb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMI2gACgkQN1Ujt2V2gBzi8wCdG0GHMu4D4g5ZT7YJlU37xbSZ
BTYAoI2U0FNO7MWhFEaDMgdxXxGVnrC5
=5EOD
-----END PGP SIGNATURE-----

--WjWU9mUuKzTKEtBb--
