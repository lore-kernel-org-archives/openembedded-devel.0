Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6a03-0000cV-66
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Feb 2013 06:07:47 +0100
Received: by mail-da0-f51.google.com with SMTP id n15so1711299dad.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 20:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ILUr/XkufUF69/QZFnCI7mZwx0hgCwv1jySC956aYfw=;
	b=vTzHA8SVhIiYg6BArZ0JNnpYnDRCxeueDYtmHL0krT3D12Q0ko0F6zTpZ6tD8CfHyh
	Qq4xzH0wVd0hZxMfghX2NGKOKP3YkN1kLCzAxUt6UiIHcPPZu/KrxvBWAy2A2w4PQNCi
	1I4sPFlW5fseZ2gjYW2c9BXXQKlwwDJ9PZNyc5c2EyTFCYaKlx1MDDwm62+bzWxtzUGw
	pJXp6woQu7VBFtA6adJJKDtkMjL2hcdtyqO9xrEQvhnHm8A9Vju4o4u/DWarPysPQxgs
	YEFEoCPTuiAtoosHtSBRnHakWqVMCEKWp34F79cCwDdKMdxjpNLJo58TwLpAvL9lTIuZ
	bOQQ==
X-Received: by 10.68.125.169 with SMTP id mr9mr11793145pbb.74.1360990301759;
	Fri, 15 Feb 2013 20:51:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ni3sm6826261pbc.31.2013.02.15.20.51.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 20:51:40 -0800 (PST)
Date: Sat, 16 Feb 2013 05:51:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130216045138.GR3300@jama>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
	<d27fbed307bc6afc4e260622a8c36b32fc2d89ce.1360337212.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <d27fbed307bc6afc4e260622a8c36b32fc2d89ce.1360337212.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/6] python-feedparser: add new recipe for version 5.1.3
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
X-List-Received-Date: Sat, 16 Feb 2013 05:07:47 -0000
X-Groupsio-MsgNum: 43192
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sf3MmCJcUNNLokcm"
Content-Disposition: inline

--Sf3MmCJcUNNLokcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 08, 2013 at 03:33:08PM +0000, Paul Eggleton wrote:
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../recipes-devtools/python/python-feedparser_5.1.3.bb   |   14 ++++++++=
++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/python/python-feedparser_5.1=
=2E3.bb
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb b=
/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
> new file mode 100644
> index 0000000..86e4fd6
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Python Atom and RSS feed parser"
> +HOMEPAGE =3D "http://code.google.com/p/feedparser"
> +SECTION =3D "devel/python"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39082dbc030b4a3ee3e48e162eab4=
08e"
> +
> +SRC_URI =3D "http://feedparser.googlecode.com/files/feedparser-${PV}.tar=
=2Ebz2"
> +SRC_URI[md5sum] =3D "f8790accd379b578261cb5b0047bd20c"
> +SRC_URI[sha256sum] =3D "91a28a76b5cbaf7457a22e47e04347568a1f21fac85c8068=
67ac72d32aabe718"
> +
> +S =3D "${WORKDIR}/feedparser-${PV}"
> +
> +inherit distutils

Can you please check if the checksum was changed?

ERROR: Fetcher failure for URL: 'http://feedparser.googlecode.com/files/fee=
dparser-5.1.3.tar.bz2'. Checksum mismatch!
File: '/home/jenkins/oe/shr-core-branches/shr-core/downloads/feedparser-5.1=
=2E3.tar.bz2' has md5 checksum 6fb6372a1dc2f56d4d79d740b8f49f25 when f8790a=
ccd379b578261cb5b0047bd20c was expected
File: '/home/jenkins/oe/shr-core-branches/shr-core/downloads/feedparser-5.1=
=2E3.tar.bz2' has sha256 checksum 7f6507d400d07edfd1ea8205da36808009b0c539f=
5b8a6e0ab54337b955e6dc3 when 91a28a76b5cbaf7457a22e47e04347568a1f21fac85c80=
6867ac72d32aabe718 was expected
If this change is expected (e.g. you have upgraded to a new version without=
 updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] =3D "6fb6372a1dc2f56d4d79d740b8f49f25"
SRC_URI[sha256sum] =3D "7f6507d400d07edfd1ea8205da36808009b0c539f5b8a6e0ab5=
4337b955e6dc3"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Sf3MmCJcUNNLokcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEfEFoACgkQN1Ujt2V2gBwJBQCcDSgrsRD4LNT71Uv3qHYJy5Yf
ZGMAoIbICREmbTV9eOCpBfekR8SA0bkX
=Jeqp
-----END PGP SIGNATURE-----

--Sf3MmCJcUNNLokcm--
