Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1L62fx-0002XA-2M
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Nov 2008 13:42:25 +0100
Received: (qmail invoked by alias); 28 Nov 2008 12:39:14 -0000
Received: from e178108113.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.108.113]
	by mail.gmx.net (mp037) with SMTP; 28 Nov 2008 13:39:14 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/HGIV8ec7HGECSd4W5RRX1rj3hGS+WCbTrvLNYff
	zy2uWCj8k07+Ue
Message-ID: <492FE697.7000201@gmx.net>
Date: Fri, 28 Nov 2008 13:39:51 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20081128090350.6D9BC1893B2@amethyst.openembedded.net>
In-Reply-To: <20081128090350.6D9BC1893B2@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.5600000000000001
Subject: Re: [oe-commits] Koen Kooi : vlc: update 0.9.4 to 0.9.6 to get rid of the "version <foo> has vulnerabilities" nag screen
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
X-List-Received-Date: Fri, 28 Nov 2008 12:42:25 -0000
X-Groupsio-MsgNum: 6779
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig0862DD707D432D93767E8396"

--------------enig0862DD707D432D93767E8396
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

GIT User account schrieb:
> vlc: update 0.9.4 to 0.9.6 to get rid of the "version <foo> has vulnera=
bilities" nag screen

your patch contains undocumented changes - see below. I find it hard to
see from the diff whether you just upgraded the vlc 0.9.4 entries to
0.9.6 or if more was changed.

Regards
Robert

>  conf/checksums.ini                          |   59 ++++++++++++++-----=
-------
>  packages/vlc/{vlc_0.9.4.bb =3D> vlc_0.9.6.bb} |    4 +-
>  2 files changed, 33 insertions(+), 30 deletions(-)
>=20
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 20f4660..1914ab7 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -1,27 +1,3 @@
> -[http://downloads.sourceforge.net/blackboxwm/blackbox-0.70.1.tar.gz]
> -md5=3D2d173b95ca5e64ef478c6a5d2deee9df
> -sha256=3De394561d4426cf17e21eb5cc32e2972eb1af92d04a41808a41b1fb95320bd=
659
> -
> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-1.tgz]
> -md5=3D4f241a4f867363f40efa2b00dca292af
> -sha256=3D5276b045e154948fce7abba7d686406c65862d90b43b50f2546b33e38378f=
0d7
> -
> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-2.tgz]
> -md5=3D844c2ee908d21dbf8911fd13115bf8b4
> -sha256=3D0afbf41d0f4bcaceb1381fc1882b80f62548845b85c83c3eb0f3a9ac7f7f9=
6ef
> -
> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-3.tgz]
> -md5=3Db82a0443e1b7bf860e4343e6b6766cb6
> -sha256=3D19a830e3657851ad575ca895eb59932f1d90cd03735dec68f900dbc1bb6c3=
b7f
> -
> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-4.tgz]
> -md5=3D567903747018f2534965ab6cb3976b38
> -sha256=3Df62081c6f8a70a35fb0b5b210329f6bba7f5e506e9b809e23ceba21a2c352=
78e
> -
> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-5.tgz]
> -md5=3D4dbdbe9a85c8f7f98dd0ee015a3c7b4f
> -sha256=3D3b732ed179dd34c17d1ba17867b60a36f20d82a3f0eca7b084fcb5396aa2b=
30c
> -
>  [http://www.directfb.org/downloads/Extras/++DFB-0.9.25.tar.gz]
>  md5=3Dc6a2705f6210d8ede50a947b375f1c0b
>  sha256=3Db3dbf01563dd60d63cff543ea8cd0c885381e78ecbbab8ff176e46df3f198=
a88
> @@ -838,22 +814,42 @@ sha256=3D3d92318dadef22b1d1b062925ef66bac2ad48a0f=
d4fc83b88dcabba38c182b7b
>  md5=3D61eed8ed819688663e399b5e79ed006f
>  sha256=3D6a19418a074a7dec6fd67f00df74f3335e85eb38d2d2a17bd0e91cf801053=
7e3
> =20
> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-1.tgz]
> +md5=3D4f241a4f867363f40efa2b00dca292af
> +sha256=3D5276b045e154948fce7abba7d686406c65862d90b43b50f2546b33e38378f=
0d7
> +
>  [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-1.t=
gz]
>  md5=3D4f241a4f867363f40efa2b00dca292af
>  sha256=3D5276b045e154948fce7abba7d686406c65862d90b43b50f2546b33e38378f=
0d7
> =20
> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-2.tgz]
> +md5=3D844c2ee908d21dbf8911fd13115bf8b4
> +sha256=3D0afbf41d0f4bcaceb1381fc1882b80f62548845b85c83c3eb0f3a9ac7f7f9=
6ef
> +
>  [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-2.t=
gz]
>  md5=3D844c2ee908d21dbf8911fd13115bf8b4
>  sha256=3D0afbf41d0f4bcaceb1381fc1882b80f62548845b85c83c3eb0f3a9ac7f7f9=
6ef
> =20
> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-3.tgz]
> +md5=3Db82a0443e1b7bf860e4343e6b6766cb6
> +sha256=3D19a830e3657851ad575ca895eb59932f1d90cd03735dec68f900dbc1bb6c3=
b7f
> +
>  [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-3.t=
gz]
>  md5=3Db82a0443e1b7bf860e4343e6b6766cb6
>  sha256=3D19a830e3657851ad575ca895eb59932f1d90cd03735dec68f900dbc1bb6c3=
b7f
> =20
> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-4.tgz]
> +md5=3D567903747018f2534965ab6cb3976b38
> +sha256=3Df62081c6f8a70a35fb0b5b210329f6bba7f5e506e9b809e23ceba21a2c352=
78e
> +
>  [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-4.t=
gz]
>  md5=3D567903747018f2534965ab6cb3976b38
>  sha256=3Df62081c6f8a70a35fb0b5b210329f6bba7f5e506e9b809e23ceba21a2c352=
78e
> =20
> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-5.tgz]
> +md5=3D4dbdbe9a85c8f7f98dd0ee015a3c7b4f
> +sha256=3D3b732ed179dd34c17d1ba17867b60a36f20d82a3f0eca7b084fcb5396aa2b=
30c
> +
>  [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-5.t=
gz]
>  md5=3D4dbdbe9a85c8f7f98dd0ee015a3c7b4f
>  sha256=3D3b732ed179dd34c17d1ba17867b60a36f20d82a3f0eca7b084fcb5396aa2b=
30c
> @@ -2074,6 +2070,10 @@ sha256=3Dac6a5c3f4aa88f39e8f04fe43f00972f0235674=
ac3edb994c70ac802a1ed0219
>  md5=3D5a6228512bcce7d9fabe8fc2d66269bf
>  sha256=3D5cd1a5aeace83a9305f7221e9ec95127b5a26870c619fd00ae48f1962d59f=
48b
> =20
> +[http://downloads.sourceforge.net/blackboxwm/blackbox-0.70.1.tar.gz]
> +md5=3D2d173b95ca5e64ef478c6a5d2deee9df
> +sha256=3De394561d4426cf17e21eb5cc32e2972eb1af92d04a41808a41b1fb95320bd=
659
> +
>  [http://heanet.dl.sourceforge.net/blackboxwm/blackbox-0.70.1.tar.gz]
>  md5=3D2d173b95ca5e64ef478c6a5d2deee9df
>  sha256=3De394561d4426cf17e21eb5cc32e2972eb1af92d04a41808a41b1fb95320bd=
659
> @@ -12782,6 +12782,10 @@ sha256=3Dd26a1de101692958fbca1d1be40fe52bd6056=
36baea616a3e8ed96e422a3648d
>  md5=3D3f23ad4b69d0a552042d1ed0f4399857
>  sha256=3D413c64fbbcf81244cb5571be4963644a1e81166a2b0f008a016528363b65c=
5d3
> =20
> +[http://kernel.orgpub/linux/kernel/v2.6/linux-2.6.24.tar.bz2]
> +md5=3D3f23ad4b69d0a552042d1ed0f4399857
> +sha256=3D413c64fbbcf81244cb5571be4963644a1e81166a2b0f008a016528363b65c=
5d3
> +
>  [http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2]
>  md5=3D3f23ad4b69d0a552042d1ed0f4399857
>  sha256=3D413c64fbbcf81244cb5571be4963644a1e81166a2b0f008a016528363b65c=
5d3
> @@ -20062,6 +20066,10 @@ sha256=3Db839353694fa5d47b8874573525a6612ce226=
54774c7cd2d9d4a16f7044b7854
>  md5=3D786628aaf8f30a9b812975b67c88b971
>  sha256=3D6e6ce0fc497d380b3ed1b8c77c4ce5d089a90070ef38626b9af71a13e52b4=
faf
> =20
> +[http://download.videolan.org/pub/videolan/vlc/0.9.6/vlc-0.9.6.tar.bz2=
]
> +md5=3Dcd71276ed867029a6d077a40bccd4d05
> +sha256=3Dac091ba9b2e2e9aff293969b3405b145c09789e59ac0caab2247211a19e09=
a8a
> +
>  [http://194.213.43.198/vmedit/vmedit-0.02.tar.gz]
>  md5=3D7550ea1dd951d2f7fb1a54caa88860b2
>  sha256=3Dbca8b0073d9527c0293b831c9b8d8f89fc3dc7b5ab30898e7b748843af07a=
978
> @@ -23538,6 +23546,3 @@ sha256=3D5cc1a53bb909922596bdd0fa967b654fe1bfbe=
0dcf1d34608f0b7c90e0c27867
>  md5=3D5f7b88ebb2bcd7e8044328482d079661
>  sha256=3Df57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd2=
2af
> =20
> -[http://kernel.orgpub/linux/kernel/v2.6/linux-2.6.24.tar.bz2]
> -md5=3D3f23ad4b69d0a552042d1ed0f4399857
> -sha256=3D413c64fbbcf81244cb5571be4963644a1e81166a2b0f008a016528363b65c=
5d3



--------------enig0862DD707D432D93767E8396
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkkv5pcACgkQG9cfwmwwEtpCqwCgiaCaK3XDWXyPrilervGN7rdn
MdMAnR7qj/esEtHOJdxwyBJyvj3IefVn
=iMvS
-----END PGP SIGNATURE-----

--------------enig0862DD707D432D93767E8396--
