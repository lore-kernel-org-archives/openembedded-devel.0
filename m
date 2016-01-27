Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 034F775E80
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 12:13:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p63so2987149wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 04:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZPsqEFctFCmlWpmrLyUIuu1AW3ttWjKk04sRVrM0Iwg=;
	b=mJdarmhjnXF41LDRVIOteRiXgPIH6otcVYPVIscSWA1kmcdalm1sS3fgoE8c2qI5P9
	RlDeib995UJccUXptLVCj4EYFiWUfJOyYm7tua05KgjIhSXHyW3koHQE7ERTKQYj57SY
	6Tui4bAAyFZHZGh4fSLDgBBOyytjseWzjHDfRW+/BCKmsgy3h9UG48UKAKylg/ZRE5ty
	1eb+ED+dCuVncORJPMx8I79DRuLDOHT9fvvGnVC5090X9N4g/zEk3Y8PBBdbT3YHsk91
	GnQ/lw0GpXylukcg3C3NQ6Jsf0XIolnRVl9f1T2jZUU2XKLWFcCmm3frgiUJI21pQksL
	f+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ZPsqEFctFCmlWpmrLyUIuu1AW3ttWjKk04sRVrM0Iwg=;
	b=Dl8sPkAPraWJ06PrssmImyW/fULRjn9oUDtYHbDYVuBTGljtbtJn9LRE4d87eij8au
	Dl9jNNqEKieaaMF1q848UyC0n4ZMwUCw35mt4WagQzOgCr093Oh4jgJdKjynqVR5vns/
	1x0OFoBjVuniiFus+diYj0EQS52pfKcuf4lsRSpyALq6CcjFT4lBUtOqE7ff4RVs3Rkd
	ZM3rqEM1vy5L1Ll1YRqeMVmMOaib7jOAnNh2zmzSioUs58V2aZrbS04YFe8xgYR8qZmK
	dfbJHvzVkLWA7tAlgyokIiiUHZyenSNADF8O6NRy8DctNEOZE6855s71GQ83oeefLgz4
	kGxA==
X-Gm-Message-State: AG10YORhgFJ7TCa45ug3GwxR/EVAId7cy4g4TfOias9+B4ijln/f6H1k1btiEoLFQVR6hA==
X-Received: by 10.28.136.148 with SMTP id k142mr31297148wmd.41.1453896781109; 
	Wed, 27 Jan 2016 04:13:01 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ei9sm5913764wjd.40.2016.01.27.04.12.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jan 2016 04:13:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2016 13:15:12 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160127121512.GD2574@jama>
References: <cover.1453589999.git.derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-python][PATCH 00/13] Python pypi standardization and recipe updates
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
X-List-Received-Date: Wed, 27 Jan 2016 12:13:01 -0000
X-Groupsio-MsgNum: 59719
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Content-Disposition: inline

--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2016 at 08:17:33AM -0500, Derek Straka wrote:
> Updates to the python recipes to standardize on pypi class for all packag=
es having sources hosted on pypi
>=20
> Bring several recipes up to latest releases of their respective packages
>=20
> The following changes since commit b866e0ac90075f9b12f2c9486bd7baed5f1376=
d9:
>=20
>   dhcpcd: add recipe for dhcpcd (2016-01-20 19:13:43 +0100)

Hi,

patches from:
[meta-python][PATCH 00/21] Add recipes for different python and python3 pac=
kages

are already in master-next, can you please review it and rebase your
changes on top of master-next?

Thanks

>=20
> are available in the git repository at:
>=20
>   git://github.com/derekstraka/meta-openembedded update-python-recipes
>   https://github.com/derekstraka/meta-openembedded/tree/update-python-rec=
ipes
>=20
> Derek Straka (13):
>   meta-python: update pypi class to avoid setuptool inherit to be more
>     flexible
>   Update python recipes to use the common pypi package
>   pyrtm: update to 0.4.2
>   python-cython: update to 0.23.4
>   python-decorator: update to 4.0.6
>   python-lxml: update to 3.5.0
>   python-pyserial: update to 3.0.1
>   python-backports-ssl: update to 3.5.0.1
>   python-certifi: update to 2015.11.20.1
>   python-cmd2: update to 0.6.8
>   python-daemonize: update to 2.4.2
>   python-feedparser: update to 5.2.1
>   python-flufl-enum: update to 4.1
>=20
>  meta-python/classes/pypi.bbclass                       |  8 ++++----
>  .../python/{pyrtm_0.2.bb =3D> pyrtm_0.4.2.bb}            | 11 +++++------
>  .../recipes-devtools/python/python-autobahn_0.8.6.bb   |  8 ++------
>  ...-ssl_3.4.0.2.bb =3D> python-backports-ssl_3.5.0.1.bb} | 18 ++++++----=
--------
>  .../recipes-devtools/python/python-bitarray_0.8.1.bb   |  9 +--------
>  ...tifi_14.05.14.bb =3D> python-certifi_2015.11.20.1.bb} | 15 ++++------=
-----
>  .../recipes-devtools/python/python-cffi_1.3.1.bb       |  3 +--
>  .../recipes-devtools/python/python-chardet_2.3.0.bb    |  2 +-
>  .../recipes-devtools/python/python-cheetah_2.4.4.bb    | 12 ++++--------
>  .../{python-cmd2_0.6.7.bb =3D> python-cmd2_0.6.8.bb}     | 15 +++-------=
-----
>  .../recipes-devtools/python/python-cryptography_1.1.bb | 10 +++-------
>  meta-python/recipes-devtools/python/python-cython.inc  | 14 +++++++-----=
--
>  ...python-cython_0.23.1.bb =3D> python-cython_0.23.4.bb} |  0
>  ...on-daemonize_2.4.1.bb =3D> python-daemonize_2.4.2.bb} |  7 +++----
>  .../recipes-devtools/python/python-decorator.inc       | 11 ++++-------
>  ...on-decorator_4.0.2.bb =3D> python-decorator_4.0.6.bb} |  0
>  .../python/python-django-south_1.0.2.bb                |  9 ++-------
>  .../recipes-devtools/python/python-django_1.6.10.bb    |  9 ++-------
>  .../recipes-devtools/python/python-enum34_1.0.4.bb     |  2 +-
>  .../recipes-devtools/python/python-feedparser_5.1.3.bb | 14 ------------=
--
>  .../recipes-devtools/python/python-feedparser_5.2.1.bb |  9 +++++++++
>  ...on-flufl-enum_4.0.1.bb =3D> python-flufl-enum_4.1.bb} | 18 +++++-----=
--------
>  .../recipes-devtools/python/python-gevent_0.13.8.bb    |  7 +------
>  .../recipes-devtools/python/python-greenlet_0.4.7.bb   | 11 ++++-------
>  .../recipes-devtools/python/python-html5lib_0.999.bb   |  8 +-------
>  .../recipes-devtools/python/python-iso8601_0.1.10.bb   |  2 +-
>  .../recipes-devtools/python/python-jinja2_2.7.3.bb     | 10 ++--------
>  .../recipes-devtools/python/python-jsonpatch_1.12.bb   | 14 ++----------=
--
>  .../recipes-devtools/python/python-jsonpointer_1.10.bb | 13 ++-----------
>  .../recipes-devtools/python/python-ldap_2.3.9.bb       |  6 ++----
>  .../recipes-devtools/python/python-ldap_2.4.10.bb      |  2 --
>  meta-python/recipes-devtools/python/python-lxml.inc    | 11 +++++------
>  .../{python-lxml_3.4.4.bb =3D> python-lxml_3.5.0.bb}     |  0
>  .../recipes-devtools/python/python-m2crypto_0.21.1.bb  |  8 ++++----
>  .../recipes-devtools/python/python-markupsafe_0.23.bb  |  9 ++-------
>  .../recipes-devtools/python/python-mccabe_0.2.1.bb     | 11 +----------
>  .../recipes-devtools/python/python-mock_1.0.1.bb       | 12 +-----------
>  .../recipes-devtools/python/python-monotonic_0.4.bb    |  2 +-
>  .../recipes-devtools/python/python-msgpack_0.4.5.bb    | 10 ++--------
>  .../recipes-devtools/python/python-paho-mqtt_1.1.bb    |  2 +-
>  .../recipes-devtools/python/python-paste_2.0.2.bb      | 13 ++++---------
>  .../recipes-devtools/python/python-pep8_1.4.6.bb       | 11 +----------
>  .../recipes-devtools/python/python-pip_7.1.2.bb        |  6 +-----
>  .../recipes-devtools/python/python-pretend_1.0.8.bb    |  2 +-
>  .../python/python-prettytable_0.7.2.bb                 | 11 ++---------
>  .../recipes-devtools/python/python-psutil_2.2.1.bb     |  2 +-
>  .../recipes-devtools/python/python-py_1.4.26.bb        |  2 +-
>  .../recipes-devtools/python/python-pyasn1_0.1.9.bb     |  7 +------
>  .../recipes-devtools/python/python-pycparser_2.10.bb   |  2 +-
>  .../recipes-devtools/python/python-pyflakes_0.7.3.bb   | 11 +----------
>  .../recipes-devtools/python/python-pygpgme_0.3.bb      |  7 ++-----
>  .../recipes-devtools/python/python-pyinotify.inc       |  8 +++-----
>  .../recipes-devtools/python/python-pyopenssl_0.15.1.bb |  9 ++-------
>  .../recipes-devtools/python/python-pyparsing_2.0.3.bb  | 11 ++---------
>  .../recipes-devtools/python/python-pyroute2_0.3.14.bb  |  2 +-
>  .../recipes-devtools/python/python-pyserial.inc        | 15 +++++++-----=
---
>  ...python-pyserial_2.7.bb =3D> python-pyserial_3.0.1.bb} |  0
>  .../recipes-devtools/python/python-pytest_2.7.0.bb     |  2 +-
>  .../recipes-devtools/python/python-pytz_2015.4.bb      |  6 +-----
>  .../recipes-devtools/python/python-pyudev_0.16.1.bb    |  8 +-------
>  .../recipes-devtools/python/python-pyzmq_14.7.0.bb     | 10 +++-------
>  .../recipes-devtools/python/python-requests_2.7.0.bb   |  9 +--------
>  .../recipes-devtools/python/python-six_1.9.0.bb        |  2 +-
>  .../recipes-devtools/python/python-snakefood_1.4.bb    |  7 +------
>  .../recipes-devtools/python/python-tornado_4.3.bb      |  9 +--------
>  .../recipes-devtools/python/python-twisted_13.2.0.bb   |  8 ++++----
>  .../recipes-devtools/python/python-ujson_1.33.bb       | 12 +++---------
>  .../python/python-vcversioner_2.14.0.0.bb              |  5 +----
>  .../python/python-zopeinterface_4.1.1.bb               |  8 +++-----
>  ...thon3-cython_0.23.1.bb =3D> python3-cython_0.23.4.bb} |  0
>  ...3-decorator_4.0.2.bb =3D> python3-decorator_4.0.6.bb} |  0
>  .../{python3-lxml_3.4.4.bb =3D> python3-lxml_3.5.0.bb}   |  0
>  ...thon3-pyserial_2.7.bb =3D> python3-pyserial_3.0.1.bb} |  0
>  73 files changed, 151 insertions(+), 396 deletions(-)
>  rename meta-python/recipes-devtools/python/{pyrtm_0.2.bb =3D> pyrtm_0.4.=
2.bb} (40%)
>  rename meta-python/recipes-devtools/python/{python-backports-ssl_3.4.0.2=
=2Ebb =3D> python-backports-ssl_3.5.0.1.bb} (57%)
>  rename meta-python/recipes-devtools/python/{python-certifi_14.05.14.bb =
=3D> python-certifi_2015.11.20.1.bb} (54%)
>  rename meta-python/recipes-devtools/python/{python-cmd2_0.6.7.bb =3D> py=
thon-cmd2_0.6.8.bb} (40%)
>  rename meta-python/recipes-devtools/python/{python-cython_0.23.1.bb =3D>=
 python-cython_0.23.4.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-daemonize_2.4.1.bb =
=3D> python-daemonize_2.4.2.bb} (67%)
>  rename meta-python/recipes-devtools/python/{python-decorator_4.0.2.bb =
=3D> python-decorator_4.0.6.bb} (100%)
>  delete mode 100644 meta-python/recipes-devtools/python/python-feedparser=
_5.1.3.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-feedparser=
_5.2.1.bb
>  rename meta-python/recipes-devtools/python/{python-flufl-enum_4.0.1.bb =
=3D> python-flufl-enum_4.1.bb} (57%)
>  rename meta-python/recipes-devtools/python/{python-lxml_3.4.4.bb =3D> py=
thon-lxml_3.5.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-pyserial_2.7.bb =3D> =
python-pyserial_3.0.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-cython_0.23.1.bb =3D=
> python3-cython_0.23.4.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-decorator_4.0.2.bb =
=3D> python3-decorator_4.0.6.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-lxml_3.4.4.bb =3D> p=
ython3-lxml_3.5.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pyserial_2.7.bb =3D>=
 python3-pyserial_3.0.1.bb} (100%)
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaotM8ACgkQN1Ujt2V2gBzjGgCeNUsUxbixDGpFtdjF8lsWwEtC
xyYAn1zd73/Djc8uvoln/XW2DYRq7Gb6
=Q0rZ
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
