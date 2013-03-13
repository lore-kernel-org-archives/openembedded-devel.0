Received: from mail-ye0-f172.google.com ([209.85.213.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFpHk-0001oi-I6
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 18:17:25 +0100
Received: by mail-ye0-f172.google.com with SMTP id q9so210614yen.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=88tF6r/fuWfyMOfBsxPOehNIOi4Ky9ABSOsXxaPlhrA=;
	b=GQpaNfjXhGoomEPyqpzmd3g+Xvhhg8vIy6vsPgAjqrgfPxLXrhvgZIw97xm01UMxgF
	GihnyFZYv2KIe7ximKymyO6PltWfU2vsqVEd8NQOJnIstWIbIei49I6ngAdAkR1Cfl7i
	MTUJrngTBiGeHrMO0G5qVsbpcByNQKzfCROJuFSrjYlyqldOwW5VR8qNyE+WNCnDnPou
	LJvHwIgAmfTgLVAGPscvwj/nr0A99RPDmlCBwCM9YCwKw3Jg4lKQZ/tUfnum8UhRarJj
	AL47Afh+3ozaLfPcYg/3mut4xRf/GxtV+bxrCtJKWAcrRjk58bDACnMUKR4nwdzhrEKF
	RKHA==
X-Received: by 10.236.128.116 with SMTP id e80mr1277622yhi.111.1363193975271; 
	Wed, 13 Mar 2013 09:59:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u41sm36422395yhb.20.2013.03.13.09.59.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:59:34 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:59:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313165927.GB3260@jama>
References: <1362859144-336-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1362859144-336-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] gedit build fix
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
X-List-Received-Date: Wed, 13 Mar 2013 17:18:42 -0000
X-Groupsio-MsgNum: 43541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RQRqO9v0HfCoqppm"
Content-Disposition: inline

--RQRqO9v0HfCoqppm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 08:59:03PM +0100, Andreas M=FCller wrote:
> The following changes since commit 6c9ac38e8b998e6739383ba91e0c4e0c0ed009=
4b:
>=20
>   modphp5: use ${baselib} instead of hardcoded "lib" (2013-03-07 11:44:11=
 +0000)

Applied, thanks!

>=20
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git gedit-f=
ix
>=20
> Andreas M=FCller (1):
>       gedit: fix compile
>=20
>  .../0001-workaround-void-pointer-arithmetic.patch  |   57 ++++++++++++++=
++++++
>  meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |    3 +-
>  2 files changed, 59 insertions(+), 1 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-workaround-=
void-pointer-arithmetic.patch
>=20
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RQRqO9v0HfCoqppm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAsG8ACgkQN1Ujt2V2gBxxHQCgjyNuvivlg4Q3egqKykArPe7x
g5sAniCXMC4mJ694/2asKyCASk6nC++N
=qVbN
-----END PGP SIGNATURE-----

--RQRqO9v0HfCoqppm--
