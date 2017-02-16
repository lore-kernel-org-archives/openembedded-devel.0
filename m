Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF26665CB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 03:27:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1G3R4VW029294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 19:27:09 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Wed, 15 Feb 2017 19:27:06 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 1/2] python-funcsigs: add now recipe
Thread-Index: AQHSiABY7S66v9XL8UCzzcmdQuPydKFq+NRw
Date: Thu, 16 Feb 2017 03:27:05 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013F516DCA@ALA-MBC.corp.ad.wrs.com>
References: <cover.1487213217.git.jackie.huang@windriver.com>
	<dca6fffd41b7879f5db35351105a37c0606045a3.1487213217.git.jackie.huang@windriver.com>
In-Reply-To: <dca6fffd41b7879f5db35351105a37c0606045a3.1487213217.git.jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.163.133]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] python-funcsigs: add now recipe
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
X-List-Received-Date: Thu, 16 Feb 2017 03:27:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Thursday, February 16, 2017 10:49 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH 1/2] python-funcsigs: add now recipe

s/now/new/

Sorry for the typo, I will send v2 for this.

Thanks,
Jackie

>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> python-funcsigs is required by python-mock.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-devtools/python/python-funcsigs_1.0.2.bb   | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-funcsigs_1=
.0.2.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb=
 b/meta-python/recipes-
> devtools/python/python-funcsigs_1.0.2.bb
> new file mode 100644
> index 0000000..dad15ee
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-funcsigs_1.0.2.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Python function signatures from PEP362 for Python 2.6, 2.7 =
and 3.2+"
> +DESCRPTION =3D " \
> +funcsigs is a backport of the `PEP 362`_ function signature features fro=
m \
> +Python 3.3's `inspect`_ module. The backport is compatible with Python 2=
.6, \
> +2.7 as well as 3.3 and up. 3.2 was supported by version 0.4, but with \
> +setuptools and pip no longer supporting 3.2, we cannot make any statemen=
t \
> +about 3.2 compatibility. \
> +"
> +
> +HOMEPAGE =3D "http://funcsigs.readthedocs.org"
> +SECTION =3D "devel/python"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6bc91dc8e5793892189fe7481a2d=
354"
> +
> +SRC_URI[md5sum] =3D "7e583285b1fb8a76305d6d68f4ccc14e"
> +SRC_URI[sha256sum] =3D "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4=
abce3b87022a8f50"
> +
> +inherit pypi setuptools
> --
> 2.8.3
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

