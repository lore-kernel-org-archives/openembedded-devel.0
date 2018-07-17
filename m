Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7C35A789A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 17:00:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2018 10:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,366,1526367600"; d="scan'208";a="73537958"
Received: from ttorling-mac01.ra.intel.com ([10.72.60.175])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2018 10:00:32 -0700
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <1531156122-14173-1-git-send-email-derek@asterius.io>
Date: Tue, 17 Jul 2018 10:00:32 -0700
Message-Id: <BA7DC9DB-441C-4CBE-87E6-731B1A532D70@linux.intel.com>
References: <1531156122-14173-1-git-send-email-derek@asterius.io>
To: Derek Straka <derek@asterius.io>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-py: update to version 1.5.4
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
X-List-Received-Date: Tue, 17 Jul 2018 17:00:41 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

A recent change upstream added a dependency on =
${PYTHON_PN}-setuptools-scm:

=
https://github.com/pytest-dev/py/commit/aebd1abcc4e4ae69fe69bc0c4fd273fcbf=
d32731#diff-2eeaed663bd0d25b7e608891384b7298

> On Jul 9, 2018, at 10:08 AM, Derek Straka <derek@asterius.io> wrote:
>=20
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
> meta-python/recipes-devtools/python/python-py.inc                     =
| 4 ++--
> .../python/{python-py_1.5.2.bb =3D> python-py_1.5.4.bb}                =
 | 0
> .../python/{python3-py_1.5.2.bb =3D> python3-py_1.5.4.bb}              =
 | 0
> 3 files changed, 2 insertions(+), 2 deletions(-)
> rename meta-python/recipes-devtools/python/{python-py_1.5.2.bb =3D> =
python-py_1.5.4.bb} (100%)
> rename meta-python/recipes-devtools/python/{python3-py_1.5.2.bb =3D> =
python3-py_1.5.4.bb} (100%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-py.inc =
b/meta-python/recipes-devtools/python/python-py.inc
> index c7d6727..495becf 100644
> --- a/meta-python/recipes-devtools/python/python-py.inc
> +++ b/meta-python/recipes-devtools/python/python-py.inc
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://py.readthedocs.io/"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Da6bb0320b04a0a503f12f69fea479de9"
>=20
> -SRC_URI[md5sum] =3D "279ca69c632069e1b71e11b14641ca28"
> -SRC_URI[sha256sum] =3D =
"ca18943e28235417756316bfada6cd96b23ce60dd532642690dcfdaba988a76d"
> +SRC_URI[md5sum] =3D "7502d66fa68ea4ae5b61c511cd177d6a"
> +SRC_URI[sha256sum] =3D =
"3fd59af7435864e1a243790d322d763925431213b6b8529c6ca71081ace3bbf7"
>=20
> BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python-py_1.5.2.bb =
b/meta-python/recipes-devtools/python/python-py_1.5.4.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-py_1.5.2.bb
> rename to meta-python/recipes-devtools/python/python-py_1.5.4.bb
> diff --git a/meta-python/recipes-devtools/python/python3-py_1.5.2.bb =
b/meta-python/recipes-devtools/python/python3-py_1.5.4.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-py_1.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-py_1.5.4.bb
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


