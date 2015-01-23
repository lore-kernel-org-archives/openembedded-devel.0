Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7ABE972D3C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 12:42:17 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1YEdZ3-0003pK-Av from Joe_MacDonald@mentor.com ;
	Fri, 23 Jan 2015 04:42:17 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 23 Jan 2015 04:42:17 -0800
Received: by burninator (Postfix, from userid 1000)	id B616E580AD7; Fri, 23
	Jan 2015 07:42:13 -0500 (EST)
Date: Fri, 23 Jan 2015 07:42:13 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150123124213.GB4791@mentor.com>
References: <3131686.1jEHazhdRQ@gyurco.localdomain>
	<1443677.77tJzovrQh@gyurco.localdomain>
	<1475068.2YaKjJgxm5@gyurco.localdomain>
	<3857819.a4dzGtPs1K@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3857819.a4dzGtPs1K@peggleto-mobl5.ger.corp.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH]ntp: fix perl path
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
X-List-Received-Date: Fri, 23 Jan 2015 12:42:19 -0000
X-Groupsio-MsgNum: 53940
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline

--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][PATCH]ntp: fix perl path] On 15.01.23 (Fri 11:22) Paul =
Eggleton wrote:

> On Wednesday 21 January 2015 21:05:12 Szombathelyi Gy=F6rgy wrote:
> > ...more precisely, without the patch ntp-utils will have a /bin/perl
> > dependency, so it becomes uninstallable (nothing provides /bin/perl).
>=20
> We do definitely want to fix this, yes - and the breakage may have been m=
y=20
> fault, sorry about that.
>=20
> I think one reason your patch hasn't been picked up yet may be that it sh=
ould=20
> have been marked as [meta-networking] rather than [meta-oe] since meta-
> networking is the layer in which the ntp recipe resides.
>=20
> Joe, can you please apply this?

Yep, no problem.  I'll grab it right now.  I did notice it last night,
finally, but never thought to check the status as I thought it was
typically the sort of thing Martin would grab.

--=20
-Joe MacDonald.
:wq

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUwkGlAAoJEEn8ffcsOfaWnsYIALSguxUMuGREF+ZCRT1713Gw
DIgnYfBSb69vjUHU0In7yi93YZb6fr2FR/GpJ7hOfqCOGIV0LukA6+tadzwQLTz4
i1T0o0VGWFS3zTaHSv7We9ItPj17FPwYR6vPcgYS6cW4gr6cLwfkB94WU+Z8yabv
htfMQ7sPqeGsh7pfKuj26lLtZxVDjNqcoc7jhDinxfh0p/SwD5GBRlV/bYtvTdhF
GNUSSGrvHihkHeLQRTnj97AFLRol60hDS0csN+5xYGAVkFxswHlkd787i1HdYOPu
WaCYxqpBmYE43ftrN+rr3zBexVJ5e68XRwdekDH8qrQQnxX00EMMX9PDqJNWnVo=
=wxtW
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
