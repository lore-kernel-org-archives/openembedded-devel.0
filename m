Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id A219A60074
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 22:40:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2018 15:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,402,1526367600"; d="scan'208";a="74534781"
Received: from ttorling-mac01.jf.intel.com ([10.24.11.1])
	by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2018 15:40:49 -0700
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <CAMKF1sqG151xO1RvQ_k1cdyW2WuG0Uccycn+1futb2CZN67L0A@mail.gmail.com>
Date: Wed, 25 Jul 2018 15:40:48 -0700
Message-Id: <69B6B6FD-2E8D-4810-8B30-4E4EEACD6E16@linux.intel.com>
References: <1532501104-18601-1-git-send-email-lukaszgardon555@gmail.com>
	<CAMKF1sqG151xO1RvQ_k1cdyW2WuG0Uccycn+1futb2CZN67L0A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
 lukaszgardon555@gmail.com
X-Mailer: Apple Mail (2.3445.9.1)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv2] python-tornado: upgrade to version 5.1
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
X-List-Received-Date: Wed, 25 Jul 2018 22:40:49 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Jul 25, 2018, at 1:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> On Tue, Jul 24, 2018 at 11:45 PM =C5=81ukasz Gardo=C5=84
> <lukaszgardon555@gmail.com> wrote:
>>=20
>> License-Update: Checksum changed due to updation in documentation. =
There
>> are no changes in the license terms.
>=20
> why are we checksumming documentation portions if they are not
> contributing to License terms
> can you take a look and may be limit the checksum to the lines which =
matter ?
>=20

There is a top level LICENSE now. Also, upstream version is 5.1.0.
https://github.com/tornadoweb/tornado/releases

>>=20
>> Signed-off-by: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
>> ---
>> meta-python/recipes-devtools/python/python-tornado.inc              | =
6 +++---
>> .../python/{python-tornado_4.5.3.bb =3D> python-tornado_5.1.bb}       =
| 0
>> .../python/{python3-tornado_4.5.3.bb =3D> python3-tornado_5.1.bb}     =
| 0
>> 3 files changed, 3 insertions(+), 3 deletions(-)
>> rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb =
=3D> python-tornado_5.1.bb} (100%)
>> rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb =
=3D> python3-tornado_5.1.bb} (100%)
>>=20
>> diff --git a/meta-python/recipes-devtools/python/python-tornado.inc =
b/meta-python/recipes-devtools/python/python-tornado.inc
>> index 29d10da..b40d091 100644
>> --- a/meta-python/recipes-devtools/python/python-tornado.inc
>> +++ b/meta-python/recipes-devtools/python/python-tornado.inc
>> @@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can =
scale to tens of thousands of ope
>> polling, WebSockets, and other applications that require a long-lived =
connection to each user."
>> HOMEPAGE =3D "http://www.tornadoweb.org/en/stable/"
>> LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D =
"file://setup.py;beginline=3D3;endline=3D15;md5=3D8d463fc66ff8f275354ffe88=
d1896e12"
>> +LIC_FILES_CHKSUM =3D =
"file://setup.py;beginline=3D3;endline=3D15;md5=3Daff6d41a5e0da5827d149462=
4bbd683d"
>>=20
>> -SRC_URI[md5sum] =3D "a5fc7fd4aea94867609a491ce65786f1"
>> -SRC_URI[sha256sum] =3D =
"6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2bd7ce644287685f0a"
>> +SRC_URI[md5sum] =3D "bd264851c409f926d1dae1ad5055d28d"
>> +SRC_URI[sha256sum] =3D =
"4f66a2172cb947387193ca4c2c3e19131f1c70fa8be470ddbbd9317fd0801582"
>>=20
>> RDEPENDS_${PN} +=3D "${PYTHON_PN}-compression ${PYTHON_PN}-numbers =
${PYTHON_PN}-email \
>>                    ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html =
${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
>> diff --git =
a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb =
b/meta-python/recipes-devtools/python/python-tornado_5.1.bb
>> similarity index 100%
>> rename from =
meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
>> rename to meta-python/recipes-devtools/python/python-tornado_5.1.bb
>> diff --git =
a/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb =
b/meta-python/recipes-devtools/python/python3-tornado_5.1.bb
>> similarity index 100%
>> rename from =
meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
>> rename to meta-python/recipes-devtools/python/python3-tornado_5.1.bb
>> --
>> 1.8.3.1
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


