Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UHfrI-00077n-TF
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 20:36:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2IJJlgT010172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Mar 2013 12:19:47 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 18 Mar 2013 12:19:47 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id CB3527FE2;
	Mon, 18 Mar 2013 15:19:08 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id C029A22649; Mon,
	18 Mar 2013 15:19:46 -0400 (EDT)
Date: Mon, 18 Mar 2013 15:19:46 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130318191946.GC14025@windriver.com>
References: <1363329716-14169-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1363329716-14169-1-git-send-email-jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jackie.Huang@windriver.com
Subject: Re: [meta-networking][PATCH 1/3] inetutils: fix PN -> BPN in do_install for multilibs
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
X-List-Received-Date: Mon, 18 Mar 2013 19:36:54 -0000
X-Groupsio-MsgNum: 43588
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline

--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jackie,

I merged the three-pack.  Thanks.

-J.

[[oe] [meta-networking][PATCH 1/3] inetutils: fix PN -> BPN in do_install f=
or multilibs] On 13.03.15 (Fri 14:41) jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../inetutils/inetutils_1.9.1.bb                   |   35 ++++++++++----=
-----
>  1 files changed, 18 insertions(+), 17 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> index 81457d7..155befe 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> @@ -8,6 +8,7 @@ LICENSE =3D "GPLv3"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0c7051aef9219dc7237f206c5c417=
9a7"
> =20
> +PR =3D "r1"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>             file://disable-pre-ANSI-compilers.patch \
> @@ -37,27 +38,27 @@ do_configure_prepend () {
>  do_install () {
>  	autotools_do_install
>  	install -d ${D}${base_sbindir} ${D}${base_bindir}
> -	mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${PN}
> -	mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${PN}
> -	mv ${D}${bindir}/logger ${D}${bindir}/logger.${PN}
> -	mv ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${PN}
> -	mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${PN}
> -	mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${PN}
> +	mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${BPN}
> +	mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${BPN}
> +	mv ${D}${bindir}/logger ${D}${bindir}/logger.${BPN}
> +	mv ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${BPN}
> +	mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${BPN}
> +	mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${BPN}
>  }
> =20
>  pkg_postinst_${PN} () {
> -	update-alternatives --install ${bindir}/tftp tftp tftp.${PN} 100
> -	update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 100
> -	update-alternatives --install ${bindir}/logger logger logger.${PN} 100
> -	update-alternatives --install ${bindir}/traceroute traceroute tracerout=
e.${PN} 100
> -	update-alternatives --install ${base_bindir}/hostname hostname hostname=
=2E${PN} 100
> -	update-alternatives --install ${base_sbindir}/ifconfig ifconfig ifconfi=
g.${PN} 100
> +	update-alternatives --install ${bindir}/tftp tftp tftp.${BPN} 100
> +	update-alternatives --install ${bindir}/telnet telnet telnet.${BPN} 100
> +	update-alternatives --install ${bindir}/logger logger logger.${BPN} 100
> +	update-alternatives --install ${bindir}/traceroute traceroute tracerout=
e.${BPN} 100
> +	update-alternatives --install ${base_bindir}/hostname hostname hostname=
=2E${BPN} 100
> +	update-alternatives --install ${base_sbindir}/ifconfig ifconfig ifconfi=
g.${BPN} 100
>  }
> =20
>  pkg_prerm_${PN} () {
> -	update-alternatives --remove tftp tftp.${PN}
> -	update-alternatives --remove telnet telnet.${PN}
> -	update-alternatives --remove logger logger.${PN}
> -	update-alternatives --remove traceroute traceroute.${PN}
> -	update-alternatives --remove ifconfig ifconfig.${PN}
> +	update-alternatives --remove tftp tftp.${BPN}
> +	update-alternatives --remove telnet telnet.${BPN}
> +	update-alternatives --remove logger logger.${BPN}
> +	update-alternatives --remove traceroute traceroute.${BPN}
> +	update-alternatives --remove ifconfig ifconfig.${BPN}
>  }
--=20
-Joe MacDonald.
:wq

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFHaNIACgkQPN8S4W6ZZndjkwCdFrsG74n7btr78lcespxaczvE
raoAn3CzWm/7PBgJg0Uqj4WnYS+X+FXB
=RUu2
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--
