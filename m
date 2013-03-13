Received: from mail-gg0-f178.google.com ([209.85.161.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFot8-0007gu-9q
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:50:57 +0100
Received: by mail-gg0-f178.google.com with SMTP id 21so204135ggh.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Rd0tdYegPbIg2cldPayR8EiKUpRoHivM33DqXuW6Qm4=;
	b=VuqJO/s0RnzHyE1V3GWySWKCa8IepY0wZ+XV+NzZK+8l6rEudnRfylpjtFUR9W4aqk
	54SE+CTjGFcCnRH9rkp87Pi2sJtuf7qUEM3AnGyqNmJdTG5kbqsU6KB9CFUEooestZ5E
	oSCXvRC6hCd/sptBz5Ecfwhxfx9D+hWcAAfxVQxH6v7l/76MeeQG2ka4t0boUTi/i6SH
	yGIIu9a2S/6jLv+wCdlOZlnQ8focz5JcxwMv/S4TzgQXv61PwtmX42BmndTg7FrzGDjA
	krSbW3zeBBw3EL+GcwroWUS4BsamhNtaa94CU1LNHqLOgMZO93/wfrKBrBhtII56waX2
	FocA==
X-Received: by 10.236.86.200 with SMTP id w48mr16350229yhe.5.1363192449048;
	Wed, 13 Mar 2013 09:34:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w2sm36291173yhh.7.2013.03.13.09.34.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:34:08 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:34:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163400.GP3260@jama>
References: <1363046313-22867-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1363046313-22867-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe][PATCH] net-snmp: EXTENDPV is now EXTENDPKGV
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
X-List-Received-Date: Wed, 13 Mar 2013 16:51:05 -0000
X-Groupsio-MsgNum: 43528
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zecZT88ylESpiZX"
Content-Disposition: inline

--9zecZT88ylESpiZX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2013 at 12:58:33AM +0100, Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  meta-oe/recipes-extended/net-snmp/net-snmp.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks!

>=20
> diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/rec=
ipes-extended/net-snmp/net-snmp.inc
> index eb355ab..11b81ad 100644
> --- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
> +++ b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
> @@ -7,8 +7,8 @@ RDEPENDS_${PN}-server-snmpd +=3D "net-snmp-mibs"
>  RDEPENDS_${PN}-server-snmptrapd +=3D "net-snmp-server-snmpd"
>  RDEPENDS_${PN}-server +=3D "net-snmp-server-snmpd net-snmp-server-snmptr=
apd"
>  RDEPENDS_${PN}-client +=3D "net-snmp-mibs"
> -RDEPENDS_${PN}-dev =3D "net-snmp-client (=3D ${EXTENDPV}) net-snmp-serve=
r (=3D ${EXTENDPV})"
> -RRECOMMENDS_${PN}-dbg =3D "net-snmp-client (=3D ${EXTENDPV}) net-snmp-se=
rver (=3D ${EXTENDPV})"
> +RDEPENDS_${PN}-dev =3D "net-snmp-client (=3D ${EXTENDPKGV}) net-snmp-ser=
ver (=3D ${EXTENDPKGV})"
> +RRECOMMENDS_${PN}-dbg =3D "net-snmp-client (=3D ${EXTENDPKGV}) net-snmp-=
server (=3D ${EXTENDPKGV})"
>  INC_PR =3D "r3"
> =20
>  inherit autotools update-rc.d siteinfo
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9zecZT88ylESpiZX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAqngACgkQN1Ujt2V2gBxMMQCfTGa9HAz2Oa18cZEbcnhufxPE
+R8AoK7m0iqBJ+SM7qJevoqurCCxGqfR
=BMGT
-----END PGP SIGNATURE-----

--9zecZT88ylESpiZX--
