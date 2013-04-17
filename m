Received: from mail-pd0-f181.google.com ([209.85.192.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USUOZ-0000T8-Lu
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 17:35:54 +0200
Received: by mail-pd0-f181.google.com with SMTP id y10so921826pdj.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DPd1wPYOS+dbbvvkNo5B4p9de9k+ftb2lfClG0v3QSI=;
	b=AO26Fb27H8M2OJohnT4jREMdD59w2bGMkb55Gk7jrztKnM5oIynUtsacBNhrWO6wpP
	zcIjaXdTIGa8tTbo/6butnM1hBNf0kjD95FG0KSJ1jXMX5UYM8eGNeoA/unYGfZXmJD5
	C4kiEy8sXybKpvLWXNVGcty7LonzGpygxpnDeOZSlPBLb5bQu7W/PXpKXdW+kkSuTXPe
	loxxuKlQAaDN1aEeEANqYcqOVpXifQhFZb+97NRpuQJYoG7whN4XfFkzMeHkvS9M9Gcm
	gf3qdiCb17esutQVyd5tNp6VCgVdQxQ3nq3fghoQpH0q+MB1L6OTqbevW80NyFGrwIBa
	v/Cg==
X-Received: by 10.66.163.198 with SMTP id yk6mr9280476pab.2.1366211887177;
	Wed, 17 Apr 2013 08:18:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pa2sm7479944pac.9.2013.04.17.08.18.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 08:18:06 -0700 (PDT)
Date: Wed, 17 Apr 2013 17:18:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130417151805.GJ26007@jama>
References: <1366211350-4830-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1366211350-4830-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [meta-oe][PATCH] net-snmp: set correct SYSTEMD_PACKAGES
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
X-List-Received-Date: Wed, 17 Apr 2013 15:36:13 -0000
X-Groupsio-MsgNum: 44297
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P6YfpwaDcfcOCJkJ"
Content-Disposition: inline

--P6YfpwaDcfcOCJkJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 04:09:10PM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> ERROR: net-snmp-server-snmpd-systemd does not appear in package list, ple=
ase add it
> ERROR: net-snmp-server-snmptrapd-systemd does not appear in package list,=
 please add it
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb b/meta-o=
e/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> index 81ad6ff..f9f1c11 100644
> --- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> +++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> @@ -61,7 +61,10 @@ do_install_append() {
>  }
> =20
>  PACKAGES =3D "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static=
 ${PN}-libs \
> -            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN=
}-server-snmptrapd"
> +            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN=
}-server-snmptrapd"=20
> +

Adding trailing spaces is not cool :)
Please keep SYSTEMD_PACKAGES where they were or move SYSTEMD_SERVICE too

> +SYSTEMD_PACKAGES =3D "${PN}-server-snmpd \
> +                    ${PN}-server-snmptrapd"
> =20
>  ALLOW_EMPTY_${PN}-server =3D "1"
> =20
> @@ -91,9 +94,6 @@ INITSCRIPT_PARAMS_${PN}-server =3D "defaults"
> =20
>  EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', '--wit=
h-systemd', '--without-systemd', d)}"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-server-snmpd-systemd \
> -                    ${PN}-server-snmptrapd-systemd"
> -
>  SYSTEMD_SERVICE_${PN}-server-snmpd =3D "snmpd.service"
>  SYSTEMD_SERVICE_${PN}-server-snmptrapd =3D  "snmptrapd.service"
> =20
> --=20
> 1.8.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--P6YfpwaDcfcOCJkJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFuvS0ACgkQN1Ujt2V2gBzJaACeORCLXs0heHVUg6IQyCfMJfq2
FcYAn3drZ3a2iZVhYr1VRiLWYozvjVYF
=KTZI
-----END PGP SIGNATURE-----

--P6YfpwaDcfcOCJkJ--
