Return-Path: <chanakya.koppolu@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1307C7A9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 20:25:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Sep 2019 13:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="185619213"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
	by fmsmga007.fm.intel.com with ESMTP; 10 Sep 2019 13:25:09 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
	fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Tue, 10 Sep 2019 13:25:09 -0700
Received: from fmsmsx121.amr.corp.intel.com ([169.254.6.244]) by
	fmsmsx111.amr.corp.intel.com ([169.254.12.8]) with mapi id
	14.03.0439.000; Tue, 10 Sep 2019 13:25:09 -0700
From: "Koppolu, Chanakya" <chanakya.koppolu@intel.com>
To: "Yuan, Chao" <yuanc.fnst@cn.fujitsu.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe]  [meta-python] [PATCH] python-pytest: upgrade 3.4.2 -> 5.1.1
Thread-Index: AQHVXXO5MtgKq3UlmEaRvWLfrMxpmKcfYxdAgAXCNwCAAEsdgA==
Date: Tue, 10 Sep 2019 20:25:09 +0000
Message-ID: <A8B665D90129BB4F9BA49400152BB380ABE5D0EA@fmsmsx121.amr.corp.intel.com>
References: <20190828073827.8930-1-yuanc.fnst@cn.fujitsu.com>
	<A8B665D90129BB4F9BA49400152BB380ABE5AD16@fmsmsx121.amr.corp.intel.com>
	<90B94BBA23AFC744A826A4F23375C2D1018E28BAE8@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <90B94BBA23AFC744A826A4F23375C2D1018E28BAE8@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjkyOTM0NDQtOTEwMS00ZGU0LWEzNmMtZmQ1MmQ5MjQyNjI1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWTdGK1Bob3ByZGZBRVh5K1hYcWRIVVwvV3dhTnpKTXFNeXJINFc5QUw1KzVUMTk0R0JDZlFZbDlBZ0R2SzBQdisifQ==
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
Subject: Re: [meta-python] [PATCH] python-pytest: upgrade 3.4.2 -> 5.1.1
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
X-List-Received-Date: Tue, 10 Sep 2019 20:25:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Chao,

I tried your new patch and it doesn't fix the issue. I still see the same m=
odule('atomicwrites') missing in python modules.=20

Regards,
Chanakya

-----Original Message-----
From: Yuan, Chao [mailto:yuanc.fnst@cn.fujitsu.com]=20
Sent: Tuesday, September 10, 2019 1:55 AM
To: Koppolu, Chanakya <chanakya.koppolu@intel.com>; openembedded-devel@list=
s.openembedded.org
Subject: RE: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2 -> 5.1=
.1

Hi Chanakya,

I have sent a patch(based on pytest 5.1.2) for this runtime error, please t=
ry it again.

Regards,
Chao

> -----Original Message-----
> From: Koppolu, Chanakya <chanakya.koppolu@intel.com>
> Sent: Saturday, September 7, 2019 8:04 AM
> To: Yuan, Chao/=1B$BjO=1B(B =1B$BD6=1B(B <yuanc.fnst@cn.fujitsu.com>;=20
> openembedded-devel@lists.openembedded.org
> Subject: RE: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2=20
> -> 5.1.1
>=20
> Hello,
>=20
> This pytest upgrade patch fails to test missing runtime modules. Our=20
> recent Yocto build from upstream found that the pytest fails to=20
> execute due to a missing module. Here is the error report:
>=20
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: root@intel-corei7-64:~# python3=20
> -m pytest /tests/smoke/ |& tee smoke_test.log
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: cat smoke_test.log
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: Traceback (most recent call last):
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/runpy.py", line 193, in _run_module_as_main
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: "__main__", mod_spec)
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/runpy.py", line 85, in _run_code
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: exec(code, run_globals)
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/site-packages/pytest.py", line 6, in <module>
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import=20
> register_assert_rewrite
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/site-packages/_pytest/assertion/__init__.py",=20
> line 6, in <module>
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import rewr=
ite
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/site-packages/_pytest/assertion/rewrite.py",=20
> line 20, in <module>
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: import atomicwrites
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: ModuleNotFoundError: No module=20
> named 'atomicwrites'
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: root@intel-corei7-64:~#=20
> Traceback (most recent call last):
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/runpy.py", line 193, in _run_module_as_main
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: "__main__", mod_spec)
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/runpy.py", line 85, in _run_code
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: exec(code, run_globals)
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/site-packages/pytest.py", line 6, in <module>
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import=20
> register_assert_rewrite
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/site-packages/_pytest/assertion/__init__.py",=20
> line 6, in <module>
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import rewr=
ite
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: File=20
> "/usr/lib64/python3.7/site-packages/_pytest/assertion/rewrite.py",=20
> line 20, in <module>
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: import atomicwrites
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: ModuleNotFoundError: No module=20
> named 'atomicwrites'
> 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> @hxj7-eced|jfsrtse02/mbt-02a: console: root@intel-corei7-64:~#
>=20
> Please prove a recipe for the missing module.
>=20
> Regards,
> Chanakya
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=20
> Of Yuan Chao
> Sent: Wednesday, August 28, 2019 12:38 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2 ->=20
> 5.1.1
>=20
> Refresh patch:
> 0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
>=20
> Remove patch: pytest_version_fix.patch since this is not used.
>=20
> License update: Copyright year updated to 2019
>=20
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pytest.inc |  8
> +--  ...he-setup_requires-for-setuptools-scm.patch | 36 +++++++------
>  .../python-pytest/pytest_version_fix.patch    | 51 -------------------
>  ...pytest_3.4.2.bb =3D> python-pytest_5.1.1.bb} |  0  ...ytest_3.4.2.bb=
=20
> =3D> python3-pytest_5.1.1.bb} |  0
>  5 files changed, 24 insertions(+), 71 deletions(-)  delete mode=20
> 100644=20
> meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.p
> atch  rename=20
> meta-python/recipes-devtools/python/{python-pytest_3.4.2.bb =3D>=20
> python-pytest_5.1.1.bb} (100%)  rename=20
> meta-python/recipes-devtools/python/{python3-pytest_3.4.2.bb =3D>=20
> python3-pytest_5.1.1.bb} (100%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-pytest.inc
> b/meta-python/recipes-devtools/python/python-pytest.inc
> index 4c32dfb04..49ef790f0 100644
> --- a/meta-python/recipes-devtools/python/python-pytest.inc
> +++ b/meta-python/recipes-devtools/python/python-pytest.inc
> @@ -1,13 +1,13 @@
>  SUMMARY =3D "Simple powerful teting with python"
>  HOMEPAGE =3D "http://pytest.org"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc39b24965f4aef64222cb35de9d47cc4"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D640061b8cee64b308a4d2f9f556c12f2"
>=20
> -SRC_URI[md5sum] =3D "1b83a25d45fad893f430fc5031653c56"
> -SRC_URI[sha256sum] =3D
> "117bad36c1a787e1a8a659df35de53ba05f9f3398fb9e4ac17e80ad5903eb8c5"
> +SRC_URI[md5sum] =3D "662313b4f539f5b66d2fb77791458e82"
> +SRC_URI[sha256sum] =3D
> "c3d5020755f70c82eceda3feaf556af9a341334414a8eca521a18f463bcead88"
>=20
>  SRC_URI_append =3D "
> file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch \
> -                   file://pytest_version_fix.patch "
> +                   "
>=20
>  inherit update-alternatives
>=20
> diff --git
> a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remo
> ve-t he-setup_requires-for-setuptools-scm.patch
> b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remo
> ve-t he-setup_requires-for-setuptools-scm.patch
> index 06dfcdfc6..c29fb12de 100644
> ---
> a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remo
> ve-t he-setup_requires-for-setuptools-scm.patch
> +++ b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-
> +++ re move-the-setup_requires-for-setuptools-scm.patch
> @@ -1,7 +1,7 @@
> -From 24a901fd17926e8e05be4ed2e01b0113a2e3a852 Mon Sep 17 00:00:00
> 2001
> -From: Derek Straka <derek@asterius.io>
> -Date: Tue, 19 Dec 2017 11:36:39 -0500
> -Subject: [PATCH] [PATCH 1/1] setup.py: remove the setup_requires for
> +From ff784f4803ab33f5e3389e40d038d52d1e211843 Mon Sep 17 00:00:00
> 2001
> +From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> +Date: Wed, 28 Aug 2019 16:12:27 +0900
> +Subject: [PATCH] [PATCH] setup.py: remove the setup_requires for
>   setuptools-scm
>=20
>  The setup_requires argument forces the download of the egg file for=20
> setuptools-scm @@ -12,21 +12,25 @@ file and in the release tarball it=20
> is already correctly created
>  Upstream-Status: Inappropriate [oe specific]
>=20
>  Signed-off-by: Derek Straka <derek@asterius.io>
> +
> +Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>  ---
> - setup.py | 1 -
> - 1 file changed, 1 deletion(-)
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
>  diff --git a/setup.py b/setup.py
> -index 3eb38ef..1163202 100644
> +index adbafb5..75fdd09 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -82,7 +82,6 @@ def main():
> -         keywords=3D"test unittest",
> -         cmdclass=3D{'test': PyTest},
> -         # the following should be enabled for release
> --        setup_requires=3D['setuptools-scm'],
> -         python_requires=3D'>=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*, !=
=3D3.3.*',
> -         install_requires=3Dinstall_requires,
> -         extras_require=3Dextras_require,
> +@@ -19,7 +19,7 @@ INSTALL_REQUIRES =3D [  def main():
> +     setup(
> +         use_scm_version=3D{"write_to": "src/_pytest/_version.py"},
> +-        setup_requires=3D["setuptools-scm", "setuptools>=3D40.0"],
> ++        setup_requires=3D["setuptools>=3D40.0"],
> +         package_dir=3D{"": "src"},
> +         extras_require=3D{
> +             "testing": [
>  --
> -2.7.4
> +2.17.1
> +
> diff --git
> a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix
> .patc
> h
> b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix
> .patc
> h
> deleted file mode 100644
> index b373d93e8..000000000
> ---
> a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix
> .patc
> h
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -Upstream-Status: Inappropriate (OE specific)
> -
> -python-pytest: remove fetch during do_compile phase
> -commit: c974fbf9ebf185552ab65301e07af44f36517abf
> -
> -introduced an issue by making the version 0.0.0 -this fixes that
> -
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> -Index: pytest-3.2.2/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> ---- pytest-3.2.2.orig/setup.py
> -+++ pytest-3.2.2/setup.py
> -@@ -1,5 +1,6 @@
> - import os
> - import sys
> -+import re
> - import setuptools
> - import pkg_resources
> - from setuptools import setup, Command -@@ -22,6 +23,18 @@=20
> classifiers =3D [
> - with open('README.rst') as fd:
> -     long_description =3D fd.read()
> -
> -+def read(*names, **kwargs):
> -+    with open(os.path.join( *names), 'r') as fp:
> -+        return fp.read()
> -+
> -+def find_version(*file_paths):
> -+    version_file =3D read(*file_paths)
> -+    version_match =3D re.search(r"^version =3D ['\']([^'\"]*)['\']",
> -+                              version_file, re.M)
> -+
> -+    if version_match:
> -+        return version_match.group(1)
> -+    raise RuntimeError("Unable to find version string.")
> -
> - def get_environment_marker_support_level():
> -     """
> -@@ -59,9 +72,7 @@ def main():
> -         name=3D'pytest',
> -         description=3D'pytest: simple powerful testing with Python',
> -         long_description=3Dlong_description,
> --        use_scm_version=3D{
> --            'write_to': '_pytest/_version.py',
> --        },
> -+	version=3Dfind_version("_pytest", "_version.py"),
> -         url=3D'http://pytest.org',
> -         license=3D'MIT license',
> -         platforms=3D['unix', 'linux', 'osx', 'cygwin', 'win32'],
> diff --git=20
> a/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
> b/meta-python/recipes-devtools/python/python-pytest_5.1.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
> rename to meta-python/recipes-devtools/python/python-pytest_5.1.1.bb
> diff --git=20
> a/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
> b/meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb
> similarity index 100%
> rename from=20
> meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb
> --
> 2.17.1
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20




