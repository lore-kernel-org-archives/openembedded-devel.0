Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USU0p-0005u6-2m
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 17:11:13 +0200
Received: by mail-pb0-f49.google.com with SMTP id rp2so78703pbb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2013 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OGZaIkXCbXBRKImrGZht07kug9HYOfWLP7VFEOpxbXc=;
	b=xo27LArlQAhPKX34RnqzlfSNlU7lzESVJbqIjcswWzoV7w5JAZigpVd/7GqKj9s3uH
	DsaYONg3Mo0Z5687fgYsTlMmJMCfe9Conj15GVWVetQwYOij7o1hYyQ8eU2LAzl3H7JZ
	PTRufEsFn+y2J1EUsd+Vcw5+i4KdzCCBac2UPz0tptorQGfsXnVyZvWHOmIaNImAha5t
	WTrTo8ZDu+MJNTic/VMFiT9xND0kd32lq2VzpPshJFGO3KC12/WKAIpI74RQfKEno1nr
	4+4kif5r8fgSzPkxyYGOas5YzsT446i72CB39UWTaAQhAI4ipqrDPCWoTg/GedjP5KSC
	TxCA==
X-Received: by 10.66.49.202 with SMTP id w10mr9092104pan.174.1366210414422;
	Wed, 17 Apr 2013 07:53:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wl5sm7379100pac.18.2013.04.17.07.53.31
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 07:53:33 -0700 (PDT)
Date: Wed, 17 Apr 2013 16:53:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130417145332.GI26007@jama>
References: <1366207065-3413-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1366207065-3413-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: Re: [meta-oe][PATCH] net-snmp: add -systemd packages to PACKAGES list to appease systemd.bbclass
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
X-List-Received-Date: Wed, 17 Apr 2013 15:11:16 -0000
X-Groupsio-MsgNum: 44295
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1E1Oui4vdubnXi3o"
Content-Disposition: inline

--1E1Oui4vdubnXi3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 02:57:45PM +0100, Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> ERROR: net-snmp-server-snmpd-systemd does not appear in package list, ple=
ase add it
> ERROR: net-snmp-server-snmptrapd-systemd does not appear in package list,=
 please add it
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb b/meta-o=
e/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> index 81ad6ff..1e1db6a 100644
> --- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> +++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
> @@ -61,7 +61,11 @@ do_install_append() {
>  }
> =20
>  PACKAGES =3D "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static=
 ${PN}-libs \
> -            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN=
}-server-snmptrapd"
> +            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN=
}-server-snmptrapd \
> +            ${PN}-server-snmpd-systemd ${PN}-server-snmptrapd-systemd "
> +
> +SYSTEMD_PACKAGES =3D "${PN}-server-snmpd-systemd \
> +                    ${PN}-server-snmptrapd-systemd"

It should be changed to
SYSTEMD_PACKAGES =3D "${PN}-server-snmpd \
                    ${PN}-server-snmptrapd"
At least to match SYSTEMD_SERVICE, not sure how have we missed that.

>  ALLOW_EMPTY_${PN}-server =3D "1"
> =20
> @@ -91,9 +95,6 @@ INITSCRIPT_PARAMS_${PN}-server =3D "defaults"
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

--1E1Oui4vdubnXi3o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFut2wACgkQN1Ujt2V2gBxUdgCgieof8cZLG/XtXuy/+5dFUj8b
nccAoLHU/tJLQZYVjxjLfCWGX6JAJ+zU
=iV54
-----END PGP SIGNATURE-----

--1E1Oui4vdubnXi3o--
