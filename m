Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 078B172491
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 23:13:06 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Z10nT-0000U5-HM from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2015 16:13:07 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Fri, 5 Jun 2015
	16:13:07 -0700
Received: by burninator (Postfix, from userid 1000)	id D893158256C; Fri,  5
	Jun 2015 19:12:58 -0400 (EDT)
Date: Fri, 5 Jun 2015 19:12:58 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150605231258.GB27123@mentor.com>
References: <1433410587-20478-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1433410587-20478-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-networking] proftpd: upgrade to 1.3.5a
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
X-List-Received-Date: Fri, 05 Jun 2015 23:13:08 -0000
X-Groupsio-MsgNum: 55805
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline

--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roy,

I'm seeing this when I merge this submission:

ERROR: QA Issue: package proftpd contains bad RPATH /home/jjm/external/yoct=
o-networking/build-qemux86-64/tmp/sysroots/qemux86-64/lib in file /home/jjm=
/external/yocto-networking/build-qemux86-64/tmp/work/core2-64-poky-linux/pr=
oftpd/1.3.5a-r0/packages-split/proftpd/usr/sbin/proftpd [rpaths]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: /home/jjm/external/yocto-networking/bu=
ild-qemux86-64/tmp/work/core2-64-poky-linux/proftpd/1.3.5a-r0/temp/log.do_p=
ackage_qa.18006
ERROR: Task 48 (/home/jjm/external/yocto-networking/meta-openembedded/meta-=
networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb, do_package_qa) failed=
 with exit code '1'

Can you take another look at it to make sure there aren't RPATH issues?

-J.

[[oe] [PATCH][meta-networking] proftpd: upgrade to 1.3.5a] On 15.06.04 (Thu=
 17:36) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1.3.5a includes the fix for CVE-2015-3306:
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2015-3306
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../recipes-daemons/proftpd/{proftpd_1.3.5.bb =3D> proftpd_1.3.5a.bb}   =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.5.bb =3D> pr=
oftpd_1.3.5a.bb} (96%)
>=20
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/m=
eta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
> similarity index 96%
> rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
> index 13c9410..9a1852c 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
> @@ -14,8 +14,8 @@ SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BPN=
}-${PV}.tar.gz \
>             file://proftpd.service \
>             "
> =20
> -SRC_URI[md5sum] =3D "aff1bff40e675244d72c4667f203e5bb"
> -SRC_URI[sha256sum] =3D "c10316fb003bd25eccbc08c77dd9057e053693e6527ffa2e=
a2cc4e08ccb87715"
> +SRC_URI[md5sum] =3D "b9d3092411478415b31d435f8e26d173"
> +SRC_URI[sha256sum] =3D "a1f48df8539c414ec56e0cea63dcf4b8e16e606c05f10156=
f030a4a67fae5696"
> =20
>  inherit autotools-brokensep useradd update-rc.d systemd
> =20
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVciz6AAoJEEn8ffcsOfaWldUH/0Mon8IrWbukjEAEeQp7oyJd
khjADebvKiR5ANPYJwlQCqUxMhIpSbBayIiA+UAAwoE0thicgUWdQ1Cd5ig7PI4V
IVejcO8uDx3vUkubmsi6lb8XCds39njlIbFP3utKpmEE78mmsCH4zIfVDFaiCZAA
oZsn8u18fsNb/xGOYGF9Zxe+Tfv7e2YIq2rPtbiPG7wuPcB8JWitjIUMcarW24Qj
BwBnwZcVZDcm2+E2j4Db66EhyTTXtgx0738RUMNdFusPYvjMvpK+gFK7NKUEPAbF
GsmFHX08k88YBHiSA1hXYA23MNhYHMUfr1Zum9Alr4BDb5YNGEDBxlqcDFNV7ok=
=TldN
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
