Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6B65660017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:27:26 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1aLxTW-0003hz-EE from Joe_MacDonald@mentor.com ;
	Wed, 20 Jan 2016 10:27:22 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Jan 2016 10:27:22 -0800
Received: by burninator (Postfix, from userid 1000)	id 2540258058E; Wed, 20
	Jan 2016 13:27:21 -0500 (EST)
Date: Wed, 20 Jan 2016 13:27:21 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160120182720.GA11074@mentor.com>
References: <1451304855-1444-1-git-send-email-Martin.Jansa@gmail.com>
	<569F5292.5010506@windriver.com> <20160120175821.GD5068@mentor.com>
	<20160120181757.GA2610@jama>
MIME-Version: 1.0
In-Reply-To: <20160120181757.GA2610@jama>
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
X-List-Received-Date: Wed, 20 Jan 2016 18:27:32 -0000
X-Groupsio-MsgNum: 59619
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH][jethro][meta-networking] tcpdump: add PACKAGECONFIG for l=
ibcap-ng] On 16.01.20 (Wed 19:17) Martin Jansa wrote:

> On Wed, Jan 20, 2016 at 12:58:22PM -0500, Joe MacDonald wrote:
> > [Re: [oe] [PATCH][jethro][meta-networking] tcpdump: add PACKAGECONFIG f=
or libcap-ng] On 16.01.20 (Wed 17:25) Rongqing Li wrote:
> >=20
> > >=20
> > >=20
> > > On 2015=E5=B9=B412=E6=9C=8828=E6=97=A5 20:14, Martin Jansa wrote:
> > > >From: Roy Li <rongqing.li@windriver.com>
> > > >
> > > >Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > > >Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >=20
> > >=20
> > > Hi Martin:
> > >=20
> > > Could you cherry-pick this patch to master?
> > > or merge it from master-next to master, it stay in master-next
> > > two month.
> >=20
> > It looks like you're talking about http://patchwork.openembedded.org/pa=
tch/106295/
> >=20
> > The reason it hasn't been merged yet is it is marked 'accepted /
> > archived' it patchwork, so it's not even showing up on my radar.
> >=20
> > Please don't hesitate to ask about these if the state seems to not match
> > what you're seeing in the tree.
>=20
> Joe:
>=20
> what about these?
> They are all (except waf-samba which should probably be moved) in
> meta-networking and some of them are waiting in master-next for long
> time.
>=20
> pick ed1468e postfix: premission of /var/spool/mail seems incorrect
> pick 7b10fc4 wireshark: update SRC_URI link to sources
> pick 406208e nbd: use BPN in Files
> pick e9f8f88 cim-schema-exper: fix host-user-contaminated
> pick 7dc6531 ctdb: add PACKAGECONFIG for libtdb
> pick db009ba netkit-ftp: fixed invalid symlink
> pick 0d52cfe iscsitarget: split the kernel module into separate package
> pick 4e844c5 iscsitarget: skip the arch test for kernel modules
> pick 2b52016 ncftp: fix build failures with ccdv
> pick bf0d1ae postfix: fix clean broken issue
> pick 4d64758 lowpan-tools: add missing flex/bison deps
> pick 07847fa samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
> pick 757422e dnsmasq: Listen only on loopback and disable DHCP
> pick d57cf3c rp-pppoe: 3.11 -> 3.12
> pick 513d01e postfix: 3.0.2 -> 3.0.3
> pick c7f66db stunnel: 5.21 -> 5.28
> pick 3dd8ad0 libtdb: upgrade to 1.3.7
> pick 3a30f23 libldb: upgrade to 1.1.21
> pick 6a714ad libtevent: upgrade to 0.9.25
> pick 43c0e27 libtalloc: upgrade to 2.1.3
> pick c777835 samba: fix the incorrect tmpfiles installed directory
> pick 40b09a6 samba: backport patches for cross-compiling
> pick a3ab6ca waf-samba.bbclass: add cross-answers option and files
> pick 03da6a8 dovecot: 2.2.18 -> 2.2.21
> pick 9c85f1f xl2tpd: modify recipes to avoid forced internet access
> pick adbc64f recipes-connectivity/samba: Only rmdir directories that exist
> pick 6569323 openvpn: 2.3.7 -> 2.3.8
> pick 92c55d9 geoip: add ptest functionality
> pick 49660e0 opensaf: 4.6.0 -> 4.7.0
> pick 311d79c ctdb: Fix rootfs creation errors
> pick b866e0a dhcpcd: add recipe for dhcpcd

I'll review the list today and let you know.  At least a couple of them
seem to me that they were either still in discussion (the iscsitarget
arch patch) or no longer applicable (postfix, clean broken issue), but
I'll look over the lot of them.

I know I'd been avoiding the waf-samba ones because I thought they were
being looked after in meta-oe since that's where the waf-samba class is.

-J.

>=20
> >=20
> > -J.
> >=20
> > >=20
> > > thanks
> > >=20
> > > -Roy
> > >=20
> > > >---
> > > >  meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > >diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.b=
b b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> > > >index 0ffe589..150e55f 100644
> > > >--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> > > >+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
> > > >@@ -23,6 +23,7 @@ PACKAGECONFIG ??=3D "openssl ipv6"
> > > >  PACKAGECONFIG[openssl] =3D "--with-crypto=3Dyes, --without-openssl=
 --without-crypto, openssl"
> > > >  PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> > > >  PACKAGECONFIG[smi] =3D "--with-smi, --without-smi,libsmi"
> > > >+PACKAGECONFIG[libcap-ng] =3D "--with-cap-ng=3Dyes,--with-cap-ng=3Dn=
o,libcap-ng"
> > > >
> > > >  EXTRA_AUTORECONF +=3D " -I m4"
> > > >
> > > >
> > >=20
> > > --=20
> > > Best Reagrds,
> > > Roy | RongQing Li
> > --=20
> > -Joe MacDonald.
> > :wq
>=20
>=20
>=20
--=20
-Joe MacDonald.
:wq

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWn9GIAAoJEEn8ffcsOfaWMicH/1WYPVKRybVb4KHvWsp7R12l
4Jg5k31+U7Yh98//+NmyGjstAUfTIGptgEPsIWNvjFURyF1FDCDBSRR8hcIhHyFk
V1I34jJpN20VS4jC1CznQphwDhoIm3QomLMT8Xi10xKzinehD2/fQYZ3+QygG0ht
Z/gl812Km4RD9+/Kl+ZXRgSCbp4UbeQ4+gP7aEPEl9k9JKIOTQHzxdtOdZ3hM8cD
0v6alhiASp8MaCnIOeX8PTiUCwuMfNBwp6iTVYhB046VaUHq5GOcLqkxpt2r214Q
3T73l1HQDklquljMkdIDzeJpyb5Hy/nZdTRPNSSBXof+ARIAvPvPOi4j/ylzAoo=
=XVaq
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
