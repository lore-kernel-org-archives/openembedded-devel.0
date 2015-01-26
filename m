Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6B56C60670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 03:10:52 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1YFa4i-0003tD-SS from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jan 2015 19:10:52 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 25 Jan 2015 19:10:52 -0800
Received: by burninator (Postfix, from userid 1000)	id 2043B58067E; Sun, 25
	Jan 2015 22:10:49 -0500 (EST)
Date: Sun, 25 Jan 2015 22:10:49 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150126031048.GE4791@mentor.com>
References: <cover.1422236615.git.liezhi.yang@windriver.com>
	<f4602e4bf5592cf3e39c5897c1ea935972614aaa.1422236615.git.liezhi.yang@windriver.com>
	<54C5A48C.5000609@gmail.com> <54C5AB0E.90303@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54C5AB0E.90303@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH 4/5] wireshark: add PACKAGECONFIG for geoip
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
X-List-Received-Date: Mon, 26 Jan 2015 03:10:57 -0000
X-Groupsio-MsgNum: 53969
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="47eKBCiAZYFK5l32"
Content-Disposition: inline

--47eKBCiAZYFK5l32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking] [PATCH 4/5] wireshark: add PACKAGECONFIG for ge=
oip] On 15.01.26 (Mon 10:48) Robert Yang wrote:

>=20
>=20
> On 01/26/2015 10:21 AM, akuster808 wrote:
> >
> >Robert,
> >
> >thanks.
> >
> >I think there is a fix for this sitting in the patch queue.
> >
> >also there is an update pending in master-next for 1.12.3
>=20
> Thanks, we can drop this patch, then.

Yeah, I'm working through the queue right now and the updated version in
master-next is the one I was looking at.

-J.

>=20
> // Robert
>=20
> >
> >- armin
> >
> >On 01/25/2015 05:45 PM, Robert Yang wrote:
> >>Fixed:
> >>epan/dissectors/packet-ip.c:56:19: fatal error: GeoIP.h: No such file or
> >>directory
> >>
> >>Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>---
> >>  .../recipes-support/wireshark/wireshark_1.12.2.bb  |    1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >>diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.2=
=2Ebb
> >>b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
> >>index 5740730..4fd519e 100644
> >>--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
> >>+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
> >>@@ -36,6 +36,7 @@ PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv=
6,"
> >>  PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes, --with-gnutls=3Dno, g=
nutls"
> >>  PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --with-gcrypt=3Dno, l=
ibgcrypt"
> >>  PACKAGECONFIG[krb5] =3D "--with-krb5=3Dyes, --with-krb5=3Dno, krb5"
> >>+PACKAGECONFIG[geoip] =3D "--with-geoip, --without-geoip, geoip"
> >>
> >>  EXTRA_OECONF =3D "--with-qt=3Dno --enable-usr-local=3Dno --enable-tsh=
ark
> >>--with-c-ares=3Dno"
> >>
> >>
--=20
-Joe MacDonald.
:wq

--47eKBCiAZYFK5l32
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUxbA4AAoJEEn8ffcsOfaWjJsIAI6Ea07gF5MN+KAUrHEX52Ei
/WYjacPpXdja3bN9GcJJuEQANaPDUuBDa0yMvXjKfgEojj75YEd35eEgTJ7c0jIE
Stlu9LS2Qhun3GW8uTR8qAkEhoNPTB0qQPRW2y4jMA3NCfz25EyAPV/Em6HtAfwx
BzZCMQ/Pd/aAX+uu4xHLgzU5ZJqn2/PuJcWeZK4IObc0j1bSTrhdVit6sjo4gwLa
8vXw+nRafvNIN6h9Mx1W+fw2+AO5A0BE65xw44o9iYLGTbFduhCioye//CkCIMvV
8XmJgT9q31RUXLThEDxdH9I9Uvdu7Oz+ZUiGCYrVTbojWjDXhStiMh76bXjUcNA=
=XIXc
-----END PGP SIGNATURE-----

--47eKBCiAZYFK5l32--
