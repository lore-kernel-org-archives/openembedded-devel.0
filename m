Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id E1C7B7326D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:11:34 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id g62so36967611wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 08:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=u8wTwtJpdjkmiFM227PQIXYZpQGr5W/PQCANqLco0X0=;
	b=KuASuRRyrCMMp8pgDv60iTcRNoBHKLd76NrZ+PL2nUFyM1UXnSw7FM9p040k7bVtct
	vsUin3FLUJ1MAVvjsVD9f3Kj1+C0K61cfN344dbgUTX2p0XFiz9WorgqyZu5oyNCKZMs
	dr5bImDWtqc2jm85xLSPeztF+97gnfb5AVnqz5efAeiXB6ZJYC42wjnNjOcxMAdZ2ie3
	G/tki3VVAOYIJAzQESY753yGWpER78jpM24XBepiTEInRQqGqoUZEIahbsiAfVtxkot7
	/hqX+Sz8eWGUlqzlZP10jJE8pFVnsNPC9Wj7D3ex9l9KrowbCApH67q3Hedug0e6jcwF
	/K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=u8wTwtJpdjkmiFM227PQIXYZpQGr5W/PQCANqLco0X0=;
	b=KP/d1b8dYl3W5Efd7fLmyGfer9ZWHAHDIX1GUSy3nccAX+ejReHEnifc2/XaXxZzV8
	9wHJFuN8JJcZpR1yqA4WaDM5qpvcAoGf+7DXWyxUPK2PK2w3l0KwPZN5QqZDgBurrEwX
	JqeCxVHei1l2hofPHb+MsFIENSXKf69GS2fOuvqjEQ20ltOn+Ss0kTKi+SfOQJZiykYc
	XfjWMoY799qLBwl7tNuBgLXHI9pXWy/6PRAFjRp0pmmnxgqjJveMTHnCK8JC8vzuDB3l
	UUX6ZsSKtGofnB140nHIY+vzrUWMMeQfK0v7TdyJfIBYXbhHa8eKAM7zqDCeBAlg6/5z
	Uizw==
X-Gm-Message-State: AG10YOSkCkz9zVgC8UTpmqzSGG2orZidDCE/vQeNhWOUed1aiYKEyQjZbu6qqHMqqT3NHw==
X-Received: by 10.195.12.42 with SMTP id en10mr39862739wjd.13.1456330295239;
	Wed, 24 Feb 2016 08:11:35 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id lz5sm3709303wjb.5.2016.02.24.08.11.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 08:11:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 17:12:40 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160224161240.GE2560@jama>
References: <cover.1453589999.git.derek@asterius.io>
	<bdbdb35a7f9f240334cd0954d67ed3e6a084767d.1453589999.git.derek@asterius.io>
	<20160224130533.GE7560@jama>
MIME-Version: 1.0
In-Reply-To: <20160224130533.GE7560@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-python][PATCH 02/13] Update python recipes to use the common pypi package
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
X-List-Received-Date: Wed, 24 Feb 2016 16:11:36 -0000
X-Groupsio-MsgNum: 60188
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Content-Disposition: inline

--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 02:05:33PM +0100, Martin Jansa wrote:
> On Sun, Jan 24, 2016 at 08:17:35AM -0500, Derek Straka wrote:
> > ---
> >  meta-python/classes/pypi.bbclass                           |  4 +++-
> >  meta-python/recipes-devtools/python/pyrtm_0.2.bb           |  5 +----
> >  .../recipes-devtools/python/python-autobahn_0.8.6.bb       |  8 ++----=
--
> >  .../python/python-backports-ssl_3.4.0.2.bb                 | 10 ++----=
----
> >  .../recipes-devtools/python/python-bitarray_0.8.1.bb       |  9 +-----=
---
> >  .../recipes-devtools/python/python-certifi_14.05.14.bb     | 10 +-----=
----
> >  .../recipes-devtools/python/python-cheetah_2.4.4.bb        | 12 ++++--=
------
> >  meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb   | 11 +-----=
-----
> >  .../recipes-devtools/python/python-cryptography_1.1.bb     |  6 +-----
> >  meta-python/recipes-devtools/python/python-decorator.inc   |  9 ++----=
---
> >  .../recipes-devtools/python/python-django-south_1.0.2.bb   |  9 ++----=
---
> >  .../recipes-devtools/python/python-django_1.6.10.bb        |  9 ++----=
---
> >  .../recipes-devtools/python/python-flufl-enum_4.0.1.bb     | 12 ++----=
------
> >  .../recipes-devtools/python/python-gevent_0.13.8.bb        |  7 +------
> >  .../recipes-devtools/python/python-greenlet_0.4.7.bb       | 11 ++++--=
-----
> >  .../recipes-devtools/python/python-html5lib_0.999.bb       |  8 +-----=
--
> >  meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb | 10 ++----=
----
> >  .../recipes-devtools/python/python-jsonpatch_1.12.bb       | 14 ++----=
--------
> >  .../recipes-devtools/python/python-jsonpointer_1.10.bb     | 13 ++----=
-------
> >  meta-python/recipes-devtools/python/python-ldap_2.3.9.bb   |  6 ++----
> >  meta-python/recipes-devtools/python/python-ldap_2.4.10.bb  |  2 --
> >  meta-python/recipes-devtools/python/python-lxml.inc        |  7 ++-----
> >  .../recipes-devtools/python/python-m2crypto_0.21.1.bb      |  8 ++++--=
--
> >  .../recipes-devtools/python/python-markupsafe_0.23.bb      |  9 ++----=
---
> >  meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb | 11 +-----=
-----
> >  meta-python/recipes-devtools/python/python-mock_1.0.1.bb   | 12 +-----=
------
> >  .../recipes-devtools/python/python-msgpack_0.4.5.bb        | 10 ++----=
----
> >  meta-python/recipes-devtools/python/python-paste_2.0.2.bb  | 13 ++++--=
-------
> >  meta-python/recipes-devtools/python/python-pep8_1.4.6.bb   | 11 +-----=
-----
> >  meta-python/recipes-devtools/python/python-pip_7.1.2.bb    |  6 +-----
> >  .../recipes-devtools/python/python-prettytable_0.7.2.bb    | 11 ++----=
-----
> >  meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb |  7 +------
> >  .../recipes-devtools/python/python-pyflakes_0.7.3.bb       | 11 +-----=
-----
> >  meta-python/recipes-devtools/python/python-pygpgme_0.3.bb  |  7 ++-----
> >  meta-python/recipes-devtools/python/python-pyinotify.inc   |  8 +++---=
--
> >  .../recipes-devtools/python/python-pyopenssl_0.15.1.bb     |  9 ++----=
---
> >  .../recipes-devtools/python/python-pyparsing_2.0.3.bb      | 11 ++----=
-----
> >  meta-python/recipes-devtools/python/python-pytz_2015.4.bb  |  6 +-----
> >  .../recipes-devtools/python/python-pyudev_0.16.1.bb        |  8 +-----=
--
> >  meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb | 10 +++---=
----
> >  .../recipes-devtools/python/python-requests_2.7.0.bb       |  9 +-----=
---
> >  .../recipes-devtools/python/python-snakefood_1.4.bb        |  7 +------
> >  meta-python/recipes-devtools/python/python-tornado_4.3.bb  |  9 +-----=
---
> >  .../recipes-devtools/python/python-twisted_13.2.0.bb       |  8 ++++--=
--
> >  meta-python/recipes-devtools/python/python-ujson_1.33.bb   | 12 +++---=
------
> >  .../recipes-devtools/python/python-vcversioner_2.14.0.0.bb |  5 +----
> >  .../recipes-devtools/python/python-zopeinterface_4.1.1.bb  |  8 +++---=
--
> >  47 files changed, 88 insertions(+), 330 deletions(-)
>=20
> This is probably better place to report this:
>=20
> Do we need to use https for pypi? All these new versions are failing=20
> with:

FWIW: using http:// doesn't help because it's redirected to https://
and it fails also outside bitbake build:

$ curl https://pypi.python.org/packages/source/m/mock/mock-1.3.0.tar.gz
curl: (35) error:140770FC:SSL routines:SSL23_GET_SERVER_HELLO:unknown proto=
col

$ curl --sslv2 https://pypi.python.org/packages/source/m/mock/mock-1.3.0.ta=
r.gz
curl: (4) OpenSSL was built without SSLv2 support

It's probably caused by Ubuntu 14.04 openssl being built without SSLv2
support

If you don't want to re-build openssl yourself:
https://www.duncanwinfrey.com/openssl-1-0-1f-on-ubuntu-14-04-x64-with-sslv2=
-enabled/

you can use some open proxy as work around
e.g. from this list http://www.sslproxies.org/
there are checksums in the recipes so you don't need to worry (so much)
that they will be modified by proxy - at least you know that you got the
same archive as recipe author when he was updating the SRC_URI checksums

e.g.:
curl --proxy http://5.135.254.35:3128/ https://pypi.python.org/packages/sou=
rce/m/mock/mock-1.3.0.tar.gz -o mock-1.3.0.tar.gz

That's what I've used and now these packages will be added to http://source=
s.openembedded.org/
which should resolve it for other people as well.

> WARNING: python-mock-1.3.0-r0 do_fetch: Failed to fetch URL https://pypi.=
python.org/packages/source/m/mock/mock-1.3.0.tar.gz, attempting MIRRORS if =
available
> ERROR: python-mock-1.3.0-r0 do_fetch: Fetcher failure: Fetch command fail=
ed with exit code 4, output:
> OpenSSL: error:140770FC:SSL routines:SSL23_GET_SERVER_HELLO:unknown proto=
col
> Unable to establish SSL connection.
>=20
> ERROR: python-mock-1.3.0-r0 do_fetch: Function failed: Fetcher failure fo=
r URL: 'https://pypi.python.org/packages/source/m/mock/mock-1.3.0.tar.gz'. =
Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-=
glibc/work/armv5te-oe-linux-gnueabi/python-mock/1.3.0-r0/temp/log.do_fetch.=
22652
> NOTE: recipe python-mock-1.3.0-r0: task do_fetch: Failed
>=20
>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/python-mock_1.3.0.bb, do_fetch
>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/python-tornado-redis_2.4.18.bb, do_fetch
>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/python-ujson_1.35.bb, do_fetch
>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/python-monotonic_0.6.bb, do_fetch
>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/python-msgpack_0.4.7.bb, do_fetch
>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/python-flufl-enum_4.1.bb, do_fetch
>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-d=
evtools/python/python-feedparser_5.2.1.bb, do_fetch



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbN1ncACgkQN1Ujt2V2gBzRDwCfXXhhAA+BKvz5QrFD7AlwkuiG
iwEAoJCi7rEaIVR1VL/fdDEkh3gkiOj0
=EALc
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--
