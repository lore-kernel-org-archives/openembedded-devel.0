Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 191B56FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 17:58:22 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1aLx1T-0002Ya-8k from Joe_MacDonald@mentor.com ;
	Wed, 20 Jan 2016 09:58:23 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Jan 2016 09:58:22 -0800
Received: by burninator (Postfix, from userid 1000)	id 2486258058E; Wed, 20
	Jan 2016 12:58:22 -0500 (EST)
Date: Wed, 20 Jan 2016 12:58:22 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20160120175821.GD5068@mentor.com>
References: <1451304855-1444-1-git-send-email-Martin.Jansa@gmail.com>
	<569F5292.5010506@windriver.com>
MIME-Version: 1.0
In-Reply-To: <569F5292.5010506@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][jethro][meta-networking] tcpdump: add PACKAGECONFIG for libcap-ng
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jan 2016 17:58:24 -0000
X-Groupsio-MsgNum: 59617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+jhVVhN62yS6hEJ8"
Content-Disposition: inline

--+jhVVhN62yS6hEJ8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH][jethro][meta-networking] tcpdump: add PACKAGECONFIG for l=
ibcap-ng] On 16.01.20 (Wed 17:25) Rongqing Li wrote:

>=20
>=20
> On 2015=E5=B9=B412=E6=9C=8828=E6=97=A5 20:14, Martin Jansa wrote:
> >From: Roy Li <rongqing.li@windriver.com>
> >
> >Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
>=20
> Hi Martin:
>=20
> Could you cherry-pick this patch to master?
> or merge it from master-next to master, it stay in master-next
> two month.

It looks like you're talking about http://patchwork.openembedded.org/patch/=
106295/

The reason it hasn't been merged yet is it is marked 'accepted /
archived' it patchwork, so it's not even showing up on my radar.

Please don't hesitate to ask about these if the state seems to not match
what you're seeing in the tree.

-J.

>=20
> thanks
>=20
> -Roy
>=20
> >---
> >  meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> >diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb b/=
meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> >index 0ffe589..150e55f 100644
> >--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> >+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> >@@ -23,6 +23,7 @@ PACKAGECONFIG ??=3D "openssl ipv6"
> >  PACKAGECONFIG[openssl] =3D "--with-crypto=3Dyes, --without-openssl --w=
ithout-crypto, openssl"
> >  PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> >  PACKAGECONFIG[smi] =3D "--with-smi, --without-smi,libsmi"
> >+PACKAGECONFIG[libcap-ng] =3D "--with-cap-ng=3Dyes,--with-cap-ng=3Dno,li=
bcap-ng"
> >
> >  EXTRA_AUTORECONF +=3D " -I m4"
> >
> >
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li
--=20
-Joe MacDonald.
:wq

--+jhVVhN62yS6hEJ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWn8q9AAoJEEn8ffcsOfaWn5kH/RZrS/y5ACqstYaE8ldtEEpr
9NqmG2Uyrdz29/beFG3aOQDarijkx15qe82gnFlfIobT7dKcCe55vRPci1qWcwi1
Id8JL5R49l8ubEXzZ0h9X1TTrHxVDoRwfAbMuozeOGVm2dKVqnINLGDgO4LsFP/a
Zc3yEghKiF7Sz9cMtu+tehVl6QuqQ3mRQAYPPkrKShEnG+JnA7Qztcxm9YIP38WX
qoG+YdHIPnrgil1gvRjf0X0s71r4qNgBgmzelxqKDOn/+w/OdLxUaLwvqoX/pNTc
fJ3U3drEoyLsaS0LLzndTEQmAY/NkFFvvEZpYIPMRpTsmF8FylT4FVN7vZXXmFc=
=JGuc
-----END PGP SIGNATURE-----

--+jhVVhN62yS6hEJ8--
