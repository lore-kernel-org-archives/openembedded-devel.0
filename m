Return-Path: <joe@deserted.net>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 759986FA9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 15:23:29 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id m20so373592qcx.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Apr 2014 08:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=YMZue6jZoNT18ig7oaJObSrC0cdkPApHbkzeYl94pMs=;
	b=JOss7h3AoC1YXSvtVIYUTE6+M7FxB44aBxv6bXYlz67tA2+GwAv37jtbQ8V04jqoe2
	TsLNoXbWeUcNbgaw6ClkiCb75vVgY/XIYXLS/KiIOaZcvEXCcJAufw1kd70gRqKl/Krm
	H60gfQHN2C72/tTQ8MfSc7ILx4nep298O6hvqemwjuadOYqDKs483i9Rt940A6ZgQg9C
	TxwAUrWjRVGqVbzcIAnRt12UBXxNgz0K5Q5c/CuW9N3Z/6UsdsoJYOlNhn/cGw+JTDKc
	8NRGjROeyvYxMXO9SuNdH/NMS0h74KmjHwF53uVIXf0gUc6unHGv+M2Tf5sHx8d438N0
	YZhw==
X-Gm-Message-State: ALoCoQks0bSGK51ATfEY0AlkuefkJZRkllJIYh5V9/O8pJ2L9FfT/Ml3QorFtBHHGgyY8SktnnGp
X-Received: by 10.140.33.136 with SMTP id j8mr1171943qgj.97.1396452210417;
	Wed, 02 Apr 2014 08:23:30 -0700 (PDT)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id z8sm4392665qaw.17.2014.04.02.08.23.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 02 Apr 2014 08:23:29 -0700 (PDT)
Date: Wed, 2 Apr 2014 11:23:27 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140402152325.GB4392@deserted.net>
References: <1396423645-26893-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1396423645-26893-1-git-send-email-jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH] inetutils: add -dbg packages for tftpd, telnetd and rshd
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
X-List-Received-Date: Wed, 02 Apr 2014 15:23:32 -0000
X-Groupsio-MsgNum: 49036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] inetutils: add -dbg packages for tftpd, teln=
etd and rshd] On 14.04.02 (Wed 15:27) jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The packages tftpd, telnetd and rshd conflict with the ones
> provided by netkit, so add the corresponding -dbg packages
> for them to avoid the following confliction between the dbg
> package of inetutils and netkit:
>=20
> error: file /usr/sbin/.debug/in.rexecd conflicts between attempted instal=
ls of inetutils-dbg-1.9.1-r1.0.armv7a_vfp_neon and netkit-rsh-dbg-0.17-r0.0=
=2Earmv7a_vfp_neon
> error: file /usr/sbin/.debug/in.telnetd conflicts between attempted insta=
lls of inetutils-dbg-1.9.1-r1.0.armv7a_vfp_neon and netkit-telnet-dbg-0.17-=
r0.0.armv7a_vfp_neon
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../inetutils/inetutils_1.9.1.bb                   |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9=
=2E1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> index e7f1987..0e47015 100644
> --- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> +++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> @@ -80,6 +80,12 @@ ${PN}-tftp ${PN}-logger ${PN}-traceroute ${PN}-syslogd=
 \
>  ${PN}-ftp ${PN}-ftpd ${PN}-tftpd ${PN}-telnet ${PN}-telnetd ${PN}-inetd \
>  ${PN}-rsh ${PN}-rshd"
> =20
> +# The packages tftpd, telnetd and rshd conflict with the ones
> +# provided by netkit, so add the corresponding -dbg packages
> +# for them to avoid the confliction between the dbg package
> +# of inetutils and netkit.
> +PACKAGES +=3D "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-rshd-dbg"
> +
>  ALTERNATIVE_PRIORITY =3D "80"
>  ALTERNATIVE_${PN} =3D "talk whois"
>  ALTERNATIVE_LINK_NAME[talkd]  =3D "${sbindir}/in.talkd"
> @@ -141,18 +147,22 @@ FILES_${PN}-rsh =3D "${bindir}/rsh.${BPN} ${bindir}=
/rlogin.${BPN} ${bindir}/rexec.
> =20
>  FILES_${PN}-rshd =3D "${sbindir}/in.rshd ${sbindir}/in.rlogind ${sbindir=
}/in.rexecd \
>                      ${sysconfdir}/xinetd.d/rsh ${sysconfdir}/xinetd.d/rl=
ogin ${sysconfdir}/xinetd.d/rexec"
> +FILES_${PN}-rshd-dbg =3D "${sbindir}/.debug/in.rshd ${sbindir}/.debug/in=
=2Erlogind ${sbindir}/.debug/in.rexecd"
>  RDEPENDS_${PN}-rshd +=3D "xinetd tcp-wrappers"
>  RCONFLICTS_${PN}-rshd +=3D "netkit-rshd"
>  RPROVIDES_${PN}-rshd =3D "rshd"
> =20
>  FILES_${PN}-ftpd =3D "${bindir}/ftpd.${BPN}"
> +FILES_${PN}-ftpd-dbg =3D "${bindir}/.debug/ftpd.${BPN}"
>  RDEPENDS_${PN}-ftpd +=3D "xinetd"
> =20
>  FILES_${PN}-tftpd =3D "${sbindir}/in.tftpd ${sysconfdir}/xinetd.d/tftpd"
> +FILES_${PN}-tftpd-dbg =3D "${sbindir}/.debug/in.tftpd"
>  RCONFLICTS_${PN}-tftpd +=3D "netkit-tftpd"
>  RDEPENDS_${PN}-tftpd +=3D "xinetd"
> =20
>  FILES_${PN}-telnetd =3D "${sbindir}/in.telnetd ${sysconfdir}/xinetd.d/te=
lnet"
> +FILES_${PN}-telnetd-dbg =3D "${sbindir}/.debug/in.telnetd"
>  RCONFLICTS_${PN}-telnetd +=3D "netkit-telnetd"
>  RPROVIDES_${PN}-telnetd =3D "telnetd"
>  RDEPENDS_${PN}-telnetd +=3D "xinetd"
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlM8K20ACgkQwFvcllog0XysdQCgqZKKHliCHfTQS51P2Mru8Ffj
7NAAnRLJj0uML4Jb1msj3/djQxJpkc1R
=iw4e
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
