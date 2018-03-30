Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id DDAA17475A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 18:23:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2018 11:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,382,1517904000"; d="scan'208";a="29804045"
Received: from ttorling-mac01.jf.intel.com ([10.24.14.201])
	by orsmga008.jf.intel.com with ESMTP; 30 Mar 2018 11:23:07 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <1521603377-34881-12-git-send-email-huangqy.fnst@cn.fujitsu.com>
Date: Fri, 30 Mar 2018 11:23:06 -0700
Message-Id: <E394E8B2-361A-4A23-B2B1-26F7EF09B3D5@linux.intel.com>
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521603377-34881-12-git-send-email-huangqy.fnst@cn.fujitsu.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pytest: 3.4.1 -> 3.4.2
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
X-List-Received-Date: Fri, 30 Mar 2018 18:23:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

You failed to also update the python3-pytest recipe which now breaks my =
builds.

> On Mar 20, 2018, at 8:36 PM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> =
wrote:
>=20
> 1.Upgrade python-pytest from 3.4.1 to 3.4.2.
> 2.Modify pytest_version_fix.patch, since the data has been changed.
>=20
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
> meta-python/recipes-devtools/python/python-pytest.inc                 =
| 4 ++--
> .../recipes-devtools/python/python-pytest/pytest_version_fix.patch    =
| 2 +-
> .../python/{python-pytest_3.4.1.bb =3D> python-pytest_3.4.2.bb}        =
 | 0
> 3 files changed, 3 insertions(+), 3 deletions(-)
> rename meta-python/recipes-devtools/python/{python-pytest_3.4.1.bb =3D> =
python-pytest_3.4.2.bb} (100%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-pytest.inc =
b/meta-python/recipes-devtools/python/python-pytest.inc
> index 60ff830..4feb9a0 100644
> --- a/meta-python/recipes-devtools/python/python-pytest.inc
> +++ b/meta-python/recipes-devtools/python/python-pytest.inc
> @@ -3,8 +3,8 @@ HOMEPAGE =3D "http://pytest.org"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Dc39b24965f4aef64222cb35de9d47cc4"
>=20
> -SRC_URI[md5sum] =3D "6768537cbb150022387c565051904a1c"
> -SRC_URI[sha256sum] =3D =
"9ddcb879c8cc859d2540204b5399011f842e5e8823674bf429f70ada281b3cc6"
> +SRC_URI[md5sum] =3D "1b83a25d45fad893f430fc5031653c56"
> +SRC_URI[sha256sum] =3D =
"117bad36c1a787e1a8a659df35de53ba05f9f3398fb9e4ac17e80ad5903eb8c5"
>=20
> SRC_URI_append =3D " =
file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch =
\
>                    file://pytest_version_fix.patch "
> diff --git =
a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.pat=
ch =
b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.pat=
ch
> index 908f862..b373d93 100644
> --- =
a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.pat=
ch
> +++ =
b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.pat=
ch
> @@ -36,7 +36,7 @@ Index: pytest-3.2.2/setup.py
> +        return version_match.group(1)
> +    raise RuntimeError("Unable to find version string.")
>=20
> - def has_environment_marker_support():
> + def get_environment_marker_support_level():
>      """
> @@ -59,9 +72,7 @@ def main():
>          name=3D'pytest',
> diff --git =
a/meta-python/recipes-devtools/python/python-pytest_3.4.1.bb =
b/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pytest_3.4.1.bb
> rename to meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
> --=20
> 2.7.4
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


