Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAB57078F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:01:00 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so964848wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 12:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kN/+G0EsBc+2xhNOG2B/COSqZsHE6LKDYcyICYhrMP8=;
	b=sTMsBRNthrKMaMGf7Hl5rsztOAgpGerODu2Ve7rYbHhoAyW98Uvv4hIVsXN49a+b0a
	KoO7KAFnNhyu3YHhQW0bJeAFuzcfw2wDgY0qZ6UTY7BQt5nB/CZz4QeNO6RO29LhAeus
	1I5ggKJCaSLtqsjsIME9MnZbciy0JzHlb3/DqhlcUs/mMd3FZPWufXa3qFT3jVPrxen9
	rO+KwHHKOGSKOap6pSF6Ct2j6OCYDcYJsPUODCIDf7jGirjERGZkDm7blA/kBWWKyFG2
	6qMzTMmmIVjFxM43Uw9MApijqr2pnbm1k88Mk+SfxQS4fycTJ7uWjz6mgBGJI8VEbGDf
	mSDQ==
X-Received: by 10.194.175.41 with SMTP id bx9mr26239947wjc.123.1406055661178; 
	Tue, 22 Jul 2014 12:01:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gq4sm5597208wib.8.2014.07.22.12.00.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 12:01:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 21:01:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140722190116.GY22875@jama>
References: <cover.1405465524.git.TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1405465524.git.TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: paul.eggleton@linux.intel.com
Subject: Re: [meta-oe][PATCH 0/2] meta-python creation
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
X-List-Received-Date: Tue, 22 Jul 2014 19:01:11 -0000
X-Groupsio-MsgNum: 51191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o9w4P0ZCTVHZJ0iX"
Content-Disposition: inline

--o9w4P0ZCTVHZJ0iX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2014 at 04:32:32PM -0700, Tim Orling wrote:
> ********
> This layer is intended to be the home of python modules for OpenEmbedded.
> Modules in this layer need to be independent of openembedded-core and
> meta-openembedded/meta-oe. Because of this, modules required by 'gateone'
> and 'anki' are not included and remain in:
>         meta-openembedded/meta-oe/recipes-devtools/python.

meta-networking/README should be updated to depend on meta-python

ERROR: Nothing PROVIDES 'python-m2crypto-native' (but meta-oe/meta-networki=
ng/recipes-connectivity/crda/crda_1.1.3.bb DEPENDS on or otherwise requires=
 it).

>=20
> Maintainers:
>         Tim "moto-timo" Orling <TicoTimo@gmail.com>
>         Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
> ********
>=20
> The following changes since commit 239debcd8a0359aad64406476b801948f9b8ff=
14:
>=20
>   usleep: add 1.0 recipe (2014-07-15 15:03:43 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib timo/meta-python
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Dtimo/meta-python
>=20
> Tim Orling (2):
>   meta-python: create layer
>   meta-python: move recipes from meta-oe
>=20
>  meta-python/COPYING.MIT                            | 17 +++++++
>  meta-python/README                                 | 53 ++++++++++++++++=
++++++
>  meta-python/conf/layer.conf                        |  9 ++++
>  .../recipes-python}/pyrtm_0.2.bb                   |  0
>  .../recipes-python}/python-autobahn_0.8.6.bb       |  0
>  .../recipes-python}/python-cheetah_2.4.4.bb        |  0
>  .../recipes-python}/python-cloudeebus_0.6.0.bb     |  0
>  .../recipes-python}/python-cython_0.20.2.bb        |  0
>  .../recipes-python}/python-dateutil_1.5.bb         |  0
>  .../recipes-python}/python-epydoc_3.0.1.bb         |  0
>  .../recipes-python}/python-feedparser_5.1.3.bb     |  0
>  .../recipes-python}/python-gdata_1.2.4.bb          |  0
>  .../recipes-python}/python-gevent_0.13.8.bb        |  0
>  .../recipes-python}/python-greenlet_0.4.1.bb       |  0
>  .../recipes-python}/python-ldap/setup.cfg.patch    |  0
>  .../recipes-python}/python-ldap_2.3.9.bb           |  0
>  .../recipes-python}/python-lxml_3.0.2.bb           |  0
>  ...y-link-in-sysroot-not-in-host-directories.patch |  0
>  .../recipes-python}/python-m2crypto_0.21.1.bb      |  0
>  .../python-matplotlib/fix_setup.patch              |  0
>  .../python-matplotlib/fix_setupext.patch           |  0
>  .../recipes-python}/python-matplotlib_1.1.0.bb     |  0
>  .../recipes-python}/python-numeric/no-lapack.patch |  0
>  .../recipes-python}/python-numeric_24.2.bb         |  0
>  .../recipes-python}/python-pexpect_2.3.bb          |  0
>  .../recipes-python}/python-pip_1.3.1.bb            |  0
>  .../recipes-python}/python-psutil_0.6.1.bb         |  0
>  .../recipes-python}/python-pyalsaaudio_0.4.bb      |  0
>  .../recipes-python}/python-pyserial_2.4.bb         |  0
>  .../recipes-python}/python-pyudev_0.16.1.bb        |  0
>  .../recipes-python}/python-pyusb_1.0.0a2.bb        |  0
>  .../recipes-python}/python-pyyaml/setup.py         |  0
>  .../recipes-python}/python-pyyaml_3.10.bb          |  0
>  .../recipes-python}/python-smbus_3.0.3.bb          |  0
>  .../recipes-python}/python-sqlalchemy_0.7.9.bb     |  0
>  .../recipes-python}/python-twisted_13.2.0.bb       |  0
>  .../recipes-python}/python-vobject_0.8.1c.bb       |  0
>  .../recipes-python}/python-webdav_0.1.2.bb         |  0
>  .../recipes-python}/python-zopeinterface_4.1.1.bb  |  0
>  39 files changed, 79 insertions(+)
>  create mode 100644 meta-python/COPYING.MIT
>  create mode 100644 meta-python/README
>  create mode 100644 meta-python/conf/layer.conf
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/pyrtm_0.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-autobahn_0.8.6.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-cheetah_2.4.4.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-cloudeebus_0.6.0.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-cython_0.20.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-dateutil_1.5.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-epydoc_3.0.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-feedparser_5.1.3.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-gdata_1.2.4.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-gevent_0.13.8.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-greenlet_0.4.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-ldap/setup.cfg.patch (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-ldap_2.3.9.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-lxml_3.0.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patc=
h (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-m2crypto_0.21.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-matplotlib/fix_setup.patch (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-matplotlib/fix_setupext.patch (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-matplotlib_1.1.0.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-numeric/no-lapack.patch (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-numeric_24.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pexpect_2.3.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pip_1.3.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-psutil_0.6.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyalsaaudio_0.4.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyserial_2.4.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyudev_0.16.1.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyusb_1.0.0a2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyyaml/setup.py (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-pyyaml_3.10.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-smbus_3.0.3.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-sqlalchemy_0.7.9.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-twisted_13.2.0.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-vobject_0.8.1c.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-webdav_0.1.2.bb (100%)
>  rename {meta-oe/recipes-devtools/python =3D> meta-python/recipes-python}=
/python-zopeinterface_4.1.1.bb (100%)
>=20
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o9w4P0ZCTVHZJ0iX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPOtPwACgkQN1Ujt2V2gBym2wCgnahE6/XJSSCRMCzcCnB1Mzrk
zXAAoICn1aqwH3jtk0Nu/qWZlIePgAbE
=EVf2
-----END PGP SIGNATURE-----

--o9w4P0ZCTVHZJ0iX--
