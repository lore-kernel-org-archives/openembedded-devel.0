Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7bm9-0002NM-3f
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 02:13:41 +0100
Received: by mail-pa0-f42.google.com with SMTP id kq12so3072948pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 16:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HR+d2xQoC4CGsQZQOA8f3FsC3psDMhJdmSYolSUxuw0=;
	b=s1glY4JAhItrLO1eDU1SB9P+0Q+BBgWL45YM7sPaWm8+bKzfZOo52ab++pJ4KauBIW
	y8zfsmB+mnFVM3sQZdzLb7CI7HF0xl9STUgMLj/UncCziQE6DmfawgCwWHn6i7GztalM
	D+8Rvua4RM69Yc8OL8ik5FaFzLuB6qyo7zTnnJ9kpeH1BJZ6Ingnj/3Ty9dgp8fW9peC
	uRqLbakOY8uSurwx/i+i7NDBWQx2+qA+BIL4B13MBE0vCN4h3igXFhPYPAGiNF7G5hwA
	1klDkOG0xtMPQQGwsZFN6Z99S3BWWsKWzpPblhm1L5Jt/JbDwNrl86qJouoyTigyxmPP
	k9ew==
X-Received: by 10.68.143.99 with SMTP id sd3mr35111788pbb.53.1361235451681;
	Mon, 18 Feb 2013 16:57:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ix6sm16018903pbc.17.2013.02.18.16.57.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 16:57:30 -0800 (PST)
Date: Tue, 19 Feb 2013 01:57:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130219005732.GN3300@jama>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 0/6] Python library additions/improvements
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
X-List-Received-Date: Tue, 19 Feb 2013 01:13:43 -0000
X-Groupsio-MsgNum: 43231
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Fj8Y87PmZ4bKoDi"
Content-Disposition: inline

--/Fj8Y87PmZ4bKoDi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 08, 2013 at 03:33:07PM +0000, Paul Eggleton wrote:
> Some additional recipes and updates for some Python libraries, in
> preparation for supporting an Ajenti recipe (which will be sent
> separately.)

All merged now, thanks!

>=20
> Kevin Strasser <kevin.strasser@linux.intel.com> helped to test and
> improve these.
>=20
>=20
> The following changes since commit 61911b23099c2658186179504ded318c987b52=
76:
>=20
>   ttf: introduce update-fonts bbclass and change all ttf recipes to use i=
t (2013-02-06 15:16:01 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib paule/python-bits
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dpaule/python-bits
>=20
> Paul Eggleton (6):
>   python-feedparser: add new recipe for version 5.1.3
>   python-greenlet: add new recipe for version 0.3.4
>   python-gevent: add new recipe for version 0.13.8
>   python-psutil: add new recipe for version 0.6.1
>   python-pyopenssl: tweak recipe
>   python-lxml: update to 3.0.2 and tweak
>=20
>  .../python/python-feedparser_5.1.3.bb               |   14 ++++++++++++++
>  .../recipes-devtools/python/python-gevent_0.13.8.bb |   19 +++++++++++++=
++++++
>  .../python/python-greenlet_0.3.4.bb                 |   14 ++++++++++++++
>  .../{python-lxml_2.2.8.bb =3D> python-lxml_3.0.2.bb}  |   13 ++++++-----=
--
>  .../recipes-devtools/python/python-psutil_0.6.1.bb  |   14 ++++++++++++++
>  .../python/python-pyopenssl_0.13.bb                 |    4 ++--
>  6 files changed, 69 insertions(+), 9 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/python/python-feedparser_5.1=
=2E3.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-gevent_0.13.8.=
bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-greenlet_0.3.4=
=2Ebb
>  rename meta-oe/recipes-devtools/python/{python-lxml_2.2.8.bb =3D> python=
-lxml_3.0.2.bb} (76%)
>  create mode 100644 meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
>=20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Fj8Y87PmZ4bKoDi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEizfwACgkQN1Ujt2V2gBy7YQCfQr8SEz0QTlx2GqiMmfJMuNJv
GTUAnjQM/3mV8eTV/dBR9dhIhPwBXIVj
=C5MX
-----END PGP SIGNATURE-----

--/Fj8Y87PmZ4bKoDi--
