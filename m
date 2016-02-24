Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 30E387725B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:04:27 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id a4so28778987wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8DpAfmFRqdnSIKS5MJ3Vb1DaFSXICTF5Ko4Z0o1EPh0=;
	b=sk58oppATms/cSftS4Bdgb8ToZ7u4DVI3wXgNhYfuZC2H4AhLHactJ7FHIvKewBjct
	bnWWkeyHJ9Y2hRL0iK753r2OGLOsW1r1kjv+P1k2/VHIR99XViNp1lFsUVbFI8U9qoqI
	kQBwDOGZF69D0GUtHN/XMBOzDNmopm9/JlPm2lU9/oKkZSiMf/crzi5fCoriwScC+s5s
	ofadQD4U1KGE16vJbtTqJX5ybPYYtZGXrEaoaqlcgVdkhXRJrwxoHDL9rRt7GAoiRHpC
	Lwqf/J/72P3EJTGZgGKYGXrlDBBzcttkBBAPsjjHNqPfPc6tenyu4MIIX/ygg+7SzYMS
	iikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=8DpAfmFRqdnSIKS5MJ3Vb1DaFSXICTF5Ko4Z0o1EPh0=;
	b=UM2fYjMaNr3MFFd/dm/iKc7h4jdv7x+gpluedXv1qNYAkepQ8bKD6StUoEW9o1xMpf
	40aHxWIWX/HVIItoRd5077kx+OV+FffVZkLlgOTjFicuH99tBwb2yu9Lj3OxDnB3a2+I
	/UVDL4AWBDJ2CQtiQgwoU/ZMxE/FZ7m1Tpe9DrCbDApTNwMfzF5gEGqy5V9kuw7kPDvD
	j2fFS91wzOaairT7PXNPnuf7yMynvgBvFt/TY0aPuu7OCavuoqG1QfFMM8XLW3SasV7t
	JkCiKIvq3RFAtnuWR0Zl4kLWpIQuIr8aLbD1LZAGqdXrs/ttR9xY2uLkuGuj+r9KEixn
	cUeA==
X-Gm-Message-State: AG10YOR1sYhdURTeXAzWjP7LiIPFP04iu0POTYBYnK9HWx6pvTSlUJh1P4gozLvITH/zUA==
X-Received: by 10.194.113.38 with SMTP id iv6mr38944460wjb.126.1456319068060; 
	Wed, 24 Feb 2016 05:04:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v66sm3390253wmb.18.2016.02.24.05.04.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 05:04:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 14:05:33 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160224130533.GE7560@jama>
References: <cover.1453589999.git.derek@asterius.io>
	<bdbdb35a7f9f240334cd0954d67ed3e6a084767d.1453589999.git.derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <bdbdb35a7f9f240334cd0954d67ed3e6a084767d.1453589999.git.derek@asterius.io>
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
X-List-Received-Date: Wed, 24 Feb 2016 13:04:29 -0000
X-Groupsio-MsgNum: 60181
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M/SuVGWktc5uNpra"
Content-Disposition: inline

--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 24, 2016 at 08:17:35AM -0500, Derek Straka wrote:
> ---
>  meta-python/classes/pypi.bbclass                           |  4 +++-
>  meta-python/recipes-devtools/python/pyrtm_0.2.bb           |  5 +----
>  .../recipes-devtools/python/python-autobahn_0.8.6.bb       |  8 ++------
>  .../python/python-backports-ssl_3.4.0.2.bb                 | 10 ++------=
--
>  .../recipes-devtools/python/python-bitarray_0.8.1.bb       |  9 +--------
>  .../recipes-devtools/python/python-certifi_14.05.14.bb     | 10 +-------=
--
>  .../recipes-devtools/python/python-cheetah_2.4.4.bb        | 12 ++++----=
----
>  meta-python/recipes-devtools/python/python-cmd2_0.6.7.bb   | 11 +-------=
---
>  .../recipes-devtools/python/python-cryptography_1.1.bb     |  6 +-----
>  meta-python/recipes-devtools/python/python-decorator.inc   |  9 ++-------
>  .../recipes-devtools/python/python-django-south_1.0.2.bb   |  9 ++-------
>  .../recipes-devtools/python/python-django_1.6.10.bb        |  9 ++-------
>  .../recipes-devtools/python/python-flufl-enum_4.0.1.bb     | 12 ++------=
----
>  .../recipes-devtools/python/python-gevent_0.13.8.bb        |  7 +------
>  .../recipes-devtools/python/python-greenlet_0.4.7.bb       | 11 ++++----=
---
>  .../recipes-devtools/python/python-html5lib_0.999.bb       |  8 +-------
>  meta-python/recipes-devtools/python/python-jinja2_2.7.3.bb | 10 ++------=
--
>  .../recipes-devtools/python/python-jsonpatch_1.12.bb       | 14 ++------=
------
>  .../recipes-devtools/python/python-jsonpointer_1.10.bb     | 13 ++------=
-----
>  meta-python/recipes-devtools/python/python-ldap_2.3.9.bb   |  6 ++----
>  meta-python/recipes-devtools/python/python-ldap_2.4.10.bb  |  2 --
>  meta-python/recipes-devtools/python/python-lxml.inc        |  7 ++-----
>  .../recipes-devtools/python/python-m2crypto_0.21.1.bb      |  8 ++++----
>  .../recipes-devtools/python/python-markupsafe_0.23.bb      |  9 ++-------
>  meta-python/recipes-devtools/python/python-mccabe_0.2.1.bb | 11 +-------=
---
>  meta-python/recipes-devtools/python/python-mock_1.0.1.bb   | 12 +-------=
----
>  .../recipes-devtools/python/python-msgpack_0.4.5.bb        | 10 ++------=
--
>  meta-python/recipes-devtools/python/python-paste_2.0.2.bb  | 13 ++++----=
-----
>  meta-python/recipes-devtools/python/python-pep8_1.4.6.bb   | 11 +-------=
---
>  meta-python/recipes-devtools/python/python-pip_7.1.2.bb    |  6 +-----
>  .../recipes-devtools/python/python-prettytable_0.7.2.bb    | 11 ++------=
---
>  meta-python/recipes-devtools/python/python-pyasn1_0.1.9.bb |  7 +------
>  .../recipes-devtools/python/python-pyflakes_0.7.3.bb       | 11 +-------=
---
>  meta-python/recipes-devtools/python/python-pygpgme_0.3.bb  |  7 ++-----
>  meta-python/recipes-devtools/python/python-pyinotify.inc   |  8 +++-----
>  .../recipes-devtools/python/python-pyopenssl_0.15.1.bb     |  9 ++-------
>  .../recipes-devtools/python/python-pyparsing_2.0.3.bb      | 11 ++------=
---
>  meta-python/recipes-devtools/python/python-pytz_2015.4.bb  |  6 +-----
>  .../recipes-devtools/python/python-pyudev_0.16.1.bb        |  8 +-------
>  meta-python/recipes-devtools/python/python-pyzmq_14.7.0.bb | 10 +++-----=
--
>  .../recipes-devtools/python/python-requests_2.7.0.bb       |  9 +--------
>  .../recipes-devtools/python/python-snakefood_1.4.bb        |  7 +------
>  meta-python/recipes-devtools/python/python-tornado_4.3.bb  |  9 +--------
>  .../recipes-devtools/python/python-twisted_13.2.0.bb       |  8 ++++----
>  meta-python/recipes-devtools/python/python-ujson_1.33.bb   | 12 +++-----=
----
>  .../recipes-devtools/python/python-vcversioner_2.14.0.0.bb |  5 +----
>  .../recipes-devtools/python/python-zopeinterface_4.1.1.bb  |  8 +++-----
>  47 files changed, 88 insertions(+), 330 deletions(-)

This is probably better place to report this:

Do we need to use https for pypi? All these new versions are failing=20
with:

WARNING: python-mock-1.3.0-r0 do_fetch: Failed to fetch URL https://pypi.py=
thon.org/packages/source/m/mock/mock-1.3.0.tar.gz, attempting MIRRORS if av=
ailable
ERROR: python-mock-1.3.0-r0 do_fetch: Fetcher failure: Fetch command failed=
 with exit code 4, output:
OpenSSL: error:140770FC:SSL routines:SSL23_GET_SERVER_HELLO:unknown protocol
Unable to establish SSL connection.

ERROR: python-mock-1.3.0-r0 do_fetch: Function failed: Fetcher failure for =
URL: 'https://pypi.python.org/packages/source/m/mock/mock-1.3.0.tar.gz'. Un=
able to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/python-mock/1.3.0-r0/temp/log.do_fetch.22=
652
NOTE: recipe python-mock-1.3.0-r0: task do_fetch: Failed

  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-mock_1.3.0.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-tornado-redis_2.4.18.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-ujson_1.35.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-monotonic_0.6.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-msgpack_0.4.7.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-flufl-enum_4.1.bb, do_fetch
  /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes-dev=
tools/python/python-feedparser_5.2.1.bb, do_fetch

--M/SuVGWktc5uNpra
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNqp0ACgkQN1Ujt2V2gBw+hACgnHvq/qcS6Jk+uKLKLOu1bjBp
MD8An1YHerUOSPmXY6oe1ZVmh7EgK45C
=Gvll
-----END PGP SIGNATURE-----

--M/SuVGWktc5uNpra--
