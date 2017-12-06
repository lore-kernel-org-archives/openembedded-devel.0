Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D5FC971AC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Dec 2017 04:03:07 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 20:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,366,1508828400"; 
   d="scan'208";a="357324"
Received: from janowski-mobl.amr.corp.intel.com ([10.254.184.126])
	by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2017 20:03:07 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <2c075ea2-9526-2e2c-2136-523fecd5419b@gmail.com>
Date: Tue, 5 Dec 2017 22:03:07 -0600
Message-Id: <C4DB09BE-713D-4A21-83E3-FBDEB809547D@linux.intel.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
	<1512020828-4040-8-git-send-email-bill.randle@gmail.com>
	<2c075ea2-9526-2e2c-2136-523fecd5419b@gmail.com>
To: Bill Randle <bill.randle@gmail.com>
X-Mailer: Apple Mail (2.3273)
Cc: ticotim@gmail.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 07/12] python-flask-wtf: move core of recipe to a .inc file
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
X-List-Received-Date: Wed, 06 Dec 2017 04:03:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 5, 2017, at 7:57 PM, akuster808 <akuster808@gmail.com> wrote:
>=20
>=20
>=20
> On 11/29/2017 09:47 PM, Bill Randle wrote:
>> Signed-off-by: Bill Randle <bill.randle@gmail.com>
>> ---
>> .../recipes-devtools/python/python-flask-wtf.inc        | 15 =
+++++++++++++++
>> .../recipes-devtools/python/python-flask-wtf_0.12.bb    | 17 =
+----------------
>> 2 files changed, 16 insertions(+), 16 deletions(-)
>> create mode 100644 =
meta-python/recipes-devtools/python/python-flask-wtf.inc
>=20
> I am getting this error:
>=20
> WARNING:
> =
/home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/pyt=
hon/python3-flask-xstatic_0.0.1.bb:
> Unable to get checksum for python3-flask-xstatic SRC_URI entry
> remove-pip-requires.patch: file could not be found
> WARNING:
> =
/home/akuster/OE/master/meta-openembedded/meta-python/recipes-devtools/pyt=
hon/python3-flask-wtf_0.12.bb:
> Unable to get checksum for python3-flask-wtf SRC_URI entry
> import-simplejson-as-json.patch: file could not be found

If you are trying to use a common patch file in, for instance, =
python-flask-wtf directory, you will need to add FILESEXTRAPATHS_prepend =
to the .inc so that the patch will be picked up by python3 version. One =
of the few cases where we want FILESEXTRAPATHS in an actual recipe, or =
at least the .inc (rather than a bbappend).

=E2=80=94Tim

> ERROR: ParseError in python-flask-migrate: not a BitBake file
>=20
> - armin
>>=20
>> diff --git a/meta-python/recipes-devtools/python/python-flask-wtf.inc =
b/meta-python/recipes-devtools/python/python-flask-wtf.inc
>> new file mode 100644
>> index 0000000..e42f7c1
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-flask-wtf.inc
>> @@ -0,0 +1,15 @@
>> +DESCRIPTION =3D "Simple integration of Flask and WTForms."
>> +LICENSE =3D "BSD"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D507e8635f25a06dc4f041a3a1b3359b3"
>> +
>> +SRC_URI[md5sum] =3D "c53a74e8ba481bf53405fd5efdf0339e"
>> +SRC_URI[sha256sum] =3D =
"bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
>> +
>> +SRC_URI +=3D " file://import-simplejson-as-json.patch"
>> +
>> +PYPI_PACKAGE =3D "Flask-WTF"
>> +
>> +RDEPENDS_${PN} =3D "\
>> +    ${PYTHON_PN}-wtforms \
>> +    ${PYTHON_PN}-simplejson \
>> +"
>> diff --git =
a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb =
b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
>> index 79afaf6..dbf091b 100644
>> --- a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
>> +++ b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
>> @@ -1,17 +1,2 @@
>> -DESCRIPTION =3D "Simple integration of Flask and WTForms."
>> -LICENSE =3D "BSD"
>> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D507e8635f25a06dc4f041a3a1b3359b3"
>> -
>> -SRC_URI[md5sum] =3D "c53a74e8ba481bf53405fd5efdf0339e"
>> -SRC_URI[sha256sum] =3D =
"bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
>> -
>> -SRC_URI +=3D " file://import-simplejson-as-json.patch"
>> -
>> -PYPI_PACKAGE =3D "Flask-WTF"
>> -
>> inherit pypi setuptools
>> -
>> -RDEPENDS_${PN} =3D "\
>> -    python-wtforms \
>> -    python-simplejson \
>> -"
>> +require python-flask-wtf.inc
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


