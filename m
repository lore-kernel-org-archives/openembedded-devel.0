Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 587DF6017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 20:10:57 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XlkRN-00025N-Qj from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Nov 2014 12:10:57 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 4 Nov 2014 12:10:57 -0800
Received: by burninator (Postfix, from userid 1000)	id 86731581737; Tue,  4
	Nov 2014 15:10:56 -0500 (EST)
Date: Tue, 4 Nov 2014 15:10:56 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141104201056.GM25009@mentor.com>
References: <1414466854-22119-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1414466854-22119-1-git-send-email-Qi.Chen@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] ntp: make daemon run under ntp:ntp
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
X-List-Received-Date: Tue, 04 Nov 2014 20:10:58 -0000
X-Groupsio-MsgNum: 52729
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E+IgQzR66AIOcbjA"
Content-Disposition: inline

--E+IgQzR66AIOcbjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] ntp: make daemon run under ntp:ntp] On 14.10=
=2E28 (Tue 11:27) Qi.Chen@windriver.com wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Fix the service so that the ntpd daemon is run under ntp:ntp.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/ntp/ntpd.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp/ntpd.service b/meta-=
networking/recipes-support/ntp/ntp/ntpd.service
> index b7c4268..0e3d7cd 100644
> --- a/meta-networking/recipes-support/ntp/ntp/ntpd.service
> +++ b/meta-networking/recipes-support/ntp/ntp/ntpd.service
> @@ -5,7 +5,7 @@ After=3Dnetwork.target
>  [Service]
>  Type=3Dforking
>  PIDFile=3D/run/ntpd.pid
> -ExecStart=3D/usr/sbin/ntpd -p /run/ntpd.pid -g
> +ExecStart=3D/usr/sbin/ntpd -u ntp:ntp -p /run/ntpd.pid -g
> =20
>  [Install]
>  WantedBy=3Dmulti-user.target
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--E+IgQzR66AIOcbjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUWTLQAAoJEEn8ffcsOfaWGGcH/29f7tPvr1h1+fthiKGKVZko
IrAc3PHOBcgUFQliWoEKpe1Cah9OLX/ROw8yL2U+prdtB1w4cXbFY47iO9ZgZ0Yy
3z4+mgBFCT9N2rl73vrzK13lwLnipg0iG/Y5ZY05alAdjzBqK9bCsvduUlOLbXbD
bL+f564cEd3zKx6j9LS3TUfDvRjTHfVavlDN9YeVfP7d2C5WfksTAfo6yNT9F5Dg
xyg+9lrMh/bC36nrOC4mIkdcb7dx3jWLQkUl6MhrRwa2F5+/3Do9Pu9tCWyoHpuf
oV1jWiFDayIiar8OdUhlC6jrlTWDDVKwvbIPksQl8xjtwr3LfoH6v0SOsZZi+VA=
=0vaH
-----END PGP SIGNATURE-----

--E+IgQzR66AIOcbjA--
