Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 9103F600E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 07:03:09 +0000 (UTC)
Received: from arch-club.local (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id EF86C46715;
	Thu, 29 Sep 2016 07:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1475132591;
	bh=84ZLa4zIpWs5pH4q4soAWU0t6I0MEZA2dCQ0vd+PcV0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=C0gE2mScJVQN7BtUy2814k54YL0IwuHuPu/TTDbLYVKxamFnZClLY6cuqTH0bsM/G
	/AiBw79fah8ZOMG+Fc2ss8RVf62S6QP2A2rlp0aUeqM3OvZq4UrGzpyjQJhwOg72e+
	HAGRt+aZaJVcfVtmU+JYN6MWnpn/v1J9wAer1uAk=
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
	<75048f87-6738-f678-b085-7bdc337b89e6@rubdos.be>
	<9d9e512d-a454-e917-a6f0-d3bd0ba381e7@gmail.com>
From: Ruben De Smet <ruben.de.smet@rubdos.be>
Message-ID: <8ca5d779-dd4a-e01c-a34c-3110ccf9fcf0@rubdos.be>
Date: Thu, 29 Sep 2016 09:03:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <9d9e512d-a454-e917-a6f0-d3bd0ba381e7@gmail.com>
Subject: Re: [meta-oe][krogoth][PATCH] python-cassandra-driver: add recipe for version 3.6.0
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
X-List-Received-Date: Thu, 29 Sep 2016 07:03:11 -0000
X-Groupsio-MsgNum: 63346
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="vjjlbRwqwA2uQtPw82CPmFf5fef7BnvWM"

--vjjlbRwqwA2uQtPw82CPmFf5fef7BnvWM
Content-Type: multipart/mixed; boundary="nJSMSu8Ecd7h2wbmjQEDhjids6undPHrR";
 protected-headers="v1"
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <8ca5d779-dd4a-e01c-a34c-3110ccf9fcf0@rubdos.be>
Subject: Re: [meta-oe][krogoth][PATCH] python-cassandra-driver: add recipe for
 version 3.6.0
References: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
 <75048f87-6738-f678-b085-7bdc337b89e6@rubdos.be>
 <9d9e512d-a454-e917-a6f0-d3bd0ba381e7@gmail.com>
In-Reply-To: <9d9e512d-a454-e917-a6f0-d3bd0ba381e7@gmail.com>

--nJSMSu8Ecd7h2wbmjQEDhjids6undPHrR
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 09/29/2016 02:10 AM, akuster808 wrote:
>=20
> Ruben,
>=20
> On 09/28/2016 12:26 PM, Ruben De Smet wrote:
>> Hi,
>>
>> Any chance these things could get merged? Would be for both upstream a=
nd
>> krogoth.
>=20
> Sorry, Stable releases do not accept the addition of new packages.

Oh. Would it be possible to have them in the next unstable then?

Ruben

>=20
> regards,
> Armin
>>
>> They do depend on my
>>
>>   pypi: update the base pypi url to use the package info without
>> requiring the hash
>>
>> backport.
>>
>> Ruben
>>
>> On 08/22/2016 04:34 PM, Ruben De Smet wrote:
>>> A Python library for Apache Cassandra
>>>
>>> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
>>> ---
>>>   .../python/python-cassandra-driver.inc              | 21 ++++++++++=
+++++++++++
>>>   .../python/python3-cassandra-driver_3.6.0.bb        | 16 ++++++++++=
++++++
>>>   2 files changed, 37 insertions(+)
>>>   create mode 100644 meta-python/recipes-devtools/python/python-cassa=
ndra-driver.inc
>>>   create mode 100644 meta-python/recipes-devtools/python/python3-cass=
andra-driver_3.6.0.bb
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python-cassandra-dri=
ver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc=

>>> new file mode 100644
>>> index 0000000..d3e4cf6
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc=

>>> @@ -0,0 +1,21 @@
>>> +SUMMARY =3D "DataStax Python Driver for Apache Cassandra"
>>> +DESCRIPTION =3D "A modern, feature-rich and highly-tunable Python cl=
ient \
>>> +library for Apache Cassandra (1.2+) and DataStax Enterprise (3.1+) u=
sing \
>>> +exclusively Cassandra's binary protocol and Cassandra Query Language=
 v3."
>>> +HOMEPAGE =3D "https://github.com/datastax/python-driver"
>>> +SECTION =3D "devel/python"
>>> +LICENSE =3D "Apache-2.0"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26=
468ba93"
>>> +SRCNAME =3D "cassandra-driver"
>>> +
>>> +SRC_URI[md5sum] =3D "756a3b235c5766c3072ed62e1083c9ef"
>>> +SRC_URI[sha256sum] =3D "049c8a871e49052c7b72fddb6569f1bfe738bbfea0a5=
62eeeb5404abeff015ab"
>>> +
>>> +DISTUTILS_BUILD_ARGS +=3D " \
>>> +    --no-libev \
>>> +"
>>> +DISTUTILS_INSTALL_ARGS +=3D " \
>>> +    --no-libev \
>>> +"
>>> +
>>> +inherit pypi
>>> diff --git a/meta-python/recipes-devtools/python/python3-cassandra-dr=
iver_3.6.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-dri=
ver_3.6.0.bb
>>> new file mode 100644
>>> index 0000000..65fd2c0
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.=
6.0.bb
>>> @@ -0,0 +1,16 @@
>>> +inherit setuptools3
>>> +require python-cassandra-driver.inc
>>> +
>>> +RDEPENDS_${PN} +=3D "\
>>> +    python3-cython \
>>> +    python3-multiprocessing \
>>> +    python3-six \
>>> +    python3-json \
>>> +    libevent \
>>> +"
>>> +RDEPENDS_${PN}_class-native =3D ""
>>> +
>>> +DEPENDS_${PN} +=3D "\
>>> +    python3-setuptools \
>>> +    python3-cython \
>>> +"
>>>
>>



--nJSMSu8Ecd7h2wbmjQEDhjids6undPHrR--

--vjjlbRwqwA2uQtPw82CPmFf5fef7BnvWM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQE2BAEBCAAgBQJX7LypGRxydWJlbi5kZS5zbWV0QGdseWNvcy5vcmcACgkQ+CZa
iBIT3BB+oAf/ZMHvR0R32SLCKhkSRbVt2MyST+yikTTLH0IHobhyRNXajb6Nl358
vXDd9cAHt5ISwZbwqn2UdV0+0ud5RxpZqu1hSX7DozQfthv7k1WPLNAxlw5J1/Fk
GwEak5svYoG5piL0ssfYmCXBIp5xS4eP/eiIQX9Y57thGoQkqCkwqwfRAmSIwabf
LXoZepE0n875uYvl2l5qD+3pX5AOGrGXJ605BcaS++ah4r2JNi3o2EHPhvyWA2oe
RXt8h7zTVsnStJNIvFLt1kyLiRfqDy6OLsduWfKgLcVFvCngY59wXROb5FRcgdGY
yoRhfjpzI/eR2R5Fg9HnCFJhFwkCxOG2RQ==
=FqDw
-----END PGP SIGNATURE-----

--vjjlbRwqwA2uQtPw82CPmFf5fef7BnvWM--
