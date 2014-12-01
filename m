Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id ABC7065CA7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 03:48:19 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1XvHyF-0002sW-9A from Joe_MacDonald@mentor.com ;
	Sun, 30 Nov 2014 19:48:19 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.181.6;
	Sun, 30 Nov 2014 19:48:18 -0800
Received: by burninator (Postfix, from userid 1000)	id 44D2D58044A; Sun, 30
	Nov 2014 22:48:18 -0500 (EST)
Date: Sun, 30 Nov 2014 22:48:18 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20141201034817.GU3886@mentor.com>
References: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 0/2] two more Netkit packages
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
X-List-Received-Date: Mon, 01 Dec 2014 03:48:23 -0000
X-Groupsio-MsgNum: 53111
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dIV3CY5swYZsO92m"
Content-Disposition: inline

--dIV3CY5swYZsO92m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Armin,

I merged netkit-ftp.  Could you put together a pam-optional version of
netkit-rsh?  Or is that going to be a huge pain for you?  I'd really
like to provide a version that uses PAM if available rather than
requires it.

-J.

[[meta-networking][PATCH 0/2] two more Netkit packages] On 14.11.27 (Thu 21=
:34) Armin Kuster wrote:

> Please consider these two packages for inclusion to meta-networking.
> I have placed them in their own recipes location for others from the fami=
ly to be added later.
>=20
> Armin Kuster (2):
>   New package: netkit-rsh
>   New package: Netkit-ftp
>=20
>  .../netkit-ftp/files/Add_ARG_MAX_define.patch      | 28 ++++++++++
>  .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   | 46 ++++++++++++++++
>  .../files/rsh-redone_link_order_file.patch         | 64 ++++++++++++++++=
++++++
>  .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 61 ++++++++++++++++=
+++++
>  4 files changed, 199 insertions(+)
>  create mode 100644 meta-networking/recipes-netkit/netkit-ftp/files/Add_A=
RG_MAX_define.patch
>  create mode 100644 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_=
0.17.bb
>  create mode 100644 meta-networking/recipes-netkit/netkit-rsh/files/rsh-r=
edone_link_order_file.patch
>  create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_=
0.17.bb
>=20
--=20
-Joe MacDonald.
:wq

--dIV3CY5swYZsO92m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUe+UBAAoJEEn8ffcsOfaW3+oH/AwAjkPhlJiHTtl71kbCtP8h
it58lPdNenjy+juDO5xah8rOxhHc5sIj+0w6u6bt/+r9JFLATexiLTGe3MS3coSi
pzoqh3nSdbUqlI9Dqx3D9zoCys9weAAuWUnQvsvUSS4+4z6xzbWqmA3XdVBvFRvX
dn/EPJ5+sFAuvnAjgNte1ZMGSS0t6TxtBsVGS2hab3SsqfZE4ehuV/nJHMtIbVZk
AArTTs5EQ1EIUEySi3G74OODgxvjngsojVHm8HL1kSpkH/l5H4b71V/QADAOqJPu
q1pss7kJi7OEA/9pt2fAttz2lVBb8azxYzsc6f4PmCTcUStmpLMP3HUbq5ltalA=
=KS+X
-----END PGP SIGNATURE-----

--dIV3CY5swYZsO92m--
