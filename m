Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF907DEC6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 02:38:46 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id d25so50977408iob.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 19:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dntgDX/kSYtcOSDVEhZfTUhYlVwoSprfJQQ6+lmwtzE=;
	b=YxzQ0W7jM/bQ8IeiinQ3HYM1XOlRhpZypnjXEy2ZwxsWKUURiNqNGp7mNoh0Yr4PrU
	gEvLvVYDoGKkq/+lQR+CMCCGJsqp5pDaMw3LXa/FGIXWfhDFSQhlvED4ypUZblVcMOhT
	+K+tI4ZBtqMtMT6Tn5y/xWm/RwZnnCZhG5bMYfl/7S2ZpdcXjBPLZODEOX3R+fC1FzIf
	6CHYCAKDN1RIBcyqVMKIPuGXYELP5GFVCp0gYExw+fEe0dBwMKMHpT2IkSdjAXzz7jU0
	ID1gcFzuVixHjTZua+xZt9cc/FETq431due0Vn6lESauJ96z0gZy5x5b8TssIrpbBfPm
	AYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dntgDX/kSYtcOSDVEhZfTUhYlVwoSprfJQQ6+lmwtzE=;
	b=ZDQFdg36YIKU7H1HUAKSgX6e+JokNSAKJWY3PRLrM14ytXGBrjnRmly6hupUUj1sUU
	7n13315aqlftmvOi3zbBK2Ld7qorgRGM1hhnS8bAqmzDGTeSQFWZU7i1r+zmZjQGNG9Y
	2gqfUcMguDUfv9VmDOyUeV4Hj0x4eY33m9FxMKD1ZrW9leQJuEkDZcN7X47WNDv2u7Rr
	6Lk6W8pjuxr7NNOlHIlKmg3s/YfhQJ+4VCpQUXtQwq2qW3NKEjV0nhLPPW+H+FuM85ON
	4lhZUWKlJYULcJfb7GbE20JGD7p1+o3UCY9diATAwqcnssZ5laWZ1QnQtQNmN44xhZ/V
	46uQ==
X-Gm-Message-State: APjAAAXjVb48b0zPoclXytlM8Vzg4EmMV2+chiO7YpKodpcv8z73lU+j
	S6C7tewA3SR+jh7g4BrmspHeBIYwzJT0nO5VrEI=
X-Google-Smtp-Source: APXvYqxSdJu/E7ei5qrxteQE27Z0pcJnrIou10b+zVl0o9SgVq66u04aN69KiRgANpvcitVoPcWZMGgr+Q3W/zmCel4=
X-Received: by 2002:a02:c790:: with SMTP id n16mr42441874jao.10.1568255927142; 
	Wed, 11 Sep 2019 19:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190828073827.8930-1-yuanc.fnst@cn.fujitsu.com>
	<A8B665D90129BB4F9BA49400152BB380ABE5AD16@fmsmsx121.amr.corp.intel.com>
	<90B94BBA23AFC744A826A4F23375C2D1018E28BAE8@G08CNEXMBPEKD01.g08.fujitsu.local>
	<A8B665D90129BB4F9BA49400152BB380ABE5D0EA@fmsmsx121.amr.corp.intel.com>
In-Reply-To: <A8B665D90129BB4F9BA49400152BB380ABE5D0EA@fmsmsx121.amr.corp.intel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 11 Sep 2019 19:38:36 -0700
Message-ID: <CANx9H-A2LzC7CU1UzMyHFfXDQ+KOcjt+GbOZpsHfQc0ELBRAnA@mail.gmail.com>
To: "Koppolu, Chanakya" <chanakya.koppolu@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 12 Sep 2019 02:38:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We are missing ${PYTHON_PN}-atomicwrites recipe in meta-python. Fujitsu,
please provide recipe for this missing RDEPENDS and runtime test future
upgrades. You have broken functionality for others with your upgrade.

In the future, please runtime test all your changes to prevent this from
happening from again. We all depend on these packages working.

On Tue, Sep 10, 2019 at 1:25 PM Koppolu, Chanakya <
chanakya.koppolu@intel.com> wrote:

> Hi Chao,
>
> I tried your new patch and it doesn't fix the issue. I still see the same
> module('atomicwrites') missing in python modules.
>
> Regards,
> Chanakya
>
> -----Original Message-----
> From: Yuan, Chao [mailto:yuanc.fnst@cn.fujitsu.com]
> Sent: Tuesday, September 10, 2019 1:55 AM
> To: Koppolu, Chanakya <chanakya.koppolu@intel.com>;
> openembedded-devel@lists.openembedded.org
> Subject: RE: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2 ->
> 5.1.1
>
> Hi Chanakya,
>
> I have sent a patch(based on pytest 5.1.2) for this runtime error, please
> try it again.
>
> Regards,
> Chao
>
> > -----Original Message-----
> > From: Koppolu, Chanakya <chanakya.koppolu@intel.com>
> > Sent: Saturday, September 7, 2019 8:04 AM
> > To: Yuan, Chao/=E8=A2=81 =E8=B6=85 <yuanc.fnst@cn.fujitsu.com>;
> > openembedded-devel@lists.openembedded.org
> > Subject: RE: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2
> > -> 5.1.1
> >
> > Hello,
> >
> > This pytest upgrade patch fails to test missing runtime modules. Our
> > recent Yocto build from upstream found that the pytest fails to
> > execute due to a missing module. Here is the error report:
> >
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: root@intel-corei7-64:~# python3
> > -m pytest /tests/smoke/ |& tee smoke_test.log
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: cat smoke_test.log
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: Traceback (most recent call last=
):
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/runpy.py", line 193, in _run_module_as_main
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: "__main__", mod_spec)
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/runpy.py", line 85, in _run_code
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: exec(code, run_globals)
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/pytest.py", line 6, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import
> > register_assert_rewrite
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/_pytest/assertion/__init__.py",
> > line 6, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import
> rewrite
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/_pytest/assertion/rewrite.py",
> > line 20, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: import atomicwrites
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: ModuleNotFoundError: No module
> > named 'atomicwrites'
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: root@intel-corei7-64:~#
> > Traceback (most recent call last):
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/runpy.py", line 193, in _run_module_as_main
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: "__main__", mod_spec)
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/runpy.py", line 85, in _run_code
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: exec(code, run_globals)
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/pytest.py", line 6, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import
> > register_assert_rewrite
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/_pytest/assertion/__init__.py",
> > line 6, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import
> rewrite
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/_pytest/assertion/rewrite.py",
> > line 20, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: import atomicwrites
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: ModuleNotFoundError: No module
> > named 'atomicwrites'
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: root@intel-corei7-64:~#
> >
> > Please prove a recipe for the missing module.
> >
> > Regards,
> > Chanakya
> >
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > Of Yuan Chao
> > Sent: Wednesday, August 28, 2019 12:38 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2 ->
> > 5.1.1
> >
> > Refresh patch:
> > 0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> >
> > Remove patch: pytest_version_fix.patch since this is not used.
> >
> > License update: Copyright year updated to 2019
> >
> > Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> > ---
> >  .../recipes-devtools/python/python-pytest.inc |  8
> > +--  ...he-setup_requires-for-setuptools-scm.patch | 36 +++++++------
> >  .../python-pytest/pytest_version_fix.patch    | 51 -------------------
> >  ...pytest_3.4.2.bb =3D> python-pytest_5.1.1.bb} |  0  ...ytest_3.4.2.b=
b
> > =3D> python3-pytest_5.1.1.bb} |  0
> >  5 files changed, 24 insertions(+), 71 deletions(-)  delete mode
> > 100644
> > meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.p
> > atch  rename
> > meta-python/recipes-devtools/python/{python-pytest_3.4.2.bb =3D>
> > python-pytest_5.1.1.bb} (100%)  rename
> > meta-python/recipes-devtools/python/{python3-pytest_3.4.2.bb =3D>
> > python3-pytest_5.1.1.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-pytest.inc
> > b/meta-python/recipes-devtools/python/python-pytest.inc
> > index 4c32dfb04..49ef790f0 100644
> > --- a/meta-python/recipes-devtools/python/python-pytest.inc
> > +++ b/meta-python/recipes-devtools/python/python-pytest.inc
> > @@ -1,13 +1,13 @@
> >  SUMMARY =3D "Simple powerful teting with python"
> >  HOMEPAGE =3D "http://pytest.org"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Dc39b24965f4aef64222cb35de9d47cc4"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D640061b8cee64b308a4d2f9f556c12f2"
> >
> > -SRC_URI[md5sum] =3D "1b83a25d45fad893f430fc5031653c56"
> > -SRC_URI[sha256sum] =3D
> > "117bad36c1a787e1a8a659df35de53ba05f9f3398fb9e4ac17e80ad5903eb8c5"
> > +SRC_URI[md5sum] =3D "662313b4f539f5b66d2fb77791458e82"
> > +SRC_URI[sha256sum] =3D
> > "c3d5020755f70c82eceda3feaf556af9a341334414a8eca521a18f463bcead88"
> >
> >  SRC_URI_append =3D "
> > file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch=
 \
> > -                   file://pytest_version_fix.patch "
> > +                   "
> >
> >  inherit update-alternatives
> >
> > diff --git
> > a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remo
> > ve-t he-setup_requires-for-setuptools-scm.patch
> > b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remo
> > ve-t he-setup_requires-for-setuptools-scm.patch
> > index 06dfcdfc6..c29fb12de 100644
> > ---
> > a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remo
> > ve-t he-setup_requires-for-setuptools-scm.patch
> > +++ b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-
> > +++ re move-the-setup_requires-for-setuptools-scm.patch
> > @@ -1,7 +1,7 @@
> > -From 24a901fd17926e8e05be4ed2e01b0113a2e3a852 Mon Sep 17 00:00:00
> > 2001
> > -From: Derek Straka <derek@asterius.io>
> > -Date: Tue, 19 Dec 2017 11:36:39 -0500
> > -Subject: [PATCH] [PATCH 1/1] setup.py: remove the setup_requires for
> > +From ff784f4803ab33f5e3389e40d038d52d1e211843 Mon Sep 17 00:00:00
> > 2001
> > +From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> > +Date: Wed, 28 Aug 2019 16:12:27 +0900
> > +Subject: [PATCH] [PATCH] setup.py: remove the setup_requires for
> >   setuptools-scm
> >
> >  The setup_requires argument forces the download of the egg file for
> > setuptools-scm @@ -12,21 +12,25 @@ file and in the release tarball it
> > is already correctly created
> >  Upstream-Status: Inappropriate [oe specific]
> >
> >  Signed-off-by: Derek Straka <derek@asterius.io>
> > +
> > +Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> >  ---
> > - setup.py | 1 -
> > - 1 file changed, 1 deletion(-)
> > + setup.py | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/setup.py b/setup.py
> > -index 3eb38ef..1163202 100644
> > +index adbafb5..75fdd09 100644
> >  --- a/setup.py
> >  +++ b/setup.py
> > -@@ -82,7 +82,6 @@ def main():
> > -         keywords=3D"test unittest",
> > -         cmdclass=3D{'test': PyTest},
> > -         # the following should be enabled for release
> > --        setup_requires=3D['setuptools-scm'],
> > -         python_requires=3D'>=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*, =
!=3D3.3.*',
> > -         install_requires=3Dinstall_requires,
> > -         extras_require=3Dextras_require,
> > +@@ -19,7 +19,7 @@ INSTALL_REQUIRES =3D [  def main():
> > +     setup(
> > +         use_scm_version=3D{"write_to": "src/_pytest/_version.py"},
> > +-        setup_requires=3D["setuptools-scm", "setuptools>=3D40.0"],
> > ++        setup_requires=3D["setuptools>=3D40.0"],
> > +         package_dir=3D{"": "src"},
> > +         extras_require=3D{
> > +             "testing": [
> >  --
> > -2.7.4
> > +2.17.1
> > +
> > diff --git
> > a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix
> > .patc
> > h
> > b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix
> > .patc
> > h
> > deleted file mode 100644
> > index b373d93e8..000000000
> > ---
> > a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix
> > .patc
> > h
> > +++ /dev/null
> > @@ -1,51 +0,0 @@
> > -Upstream-Status: Inappropriate (OE specific)
> > -
> > -python-pytest: remove fetch during do_compile phase
> > -commit: c974fbf9ebf185552ab65301e07af44f36517abf
> > -
> > -introduced an issue by making the version 0.0.0 -this fixes that
> > -
> > -Signed-off-by: Armin Kuster <akuster@mvista.com>
> > -
> > -Index: pytest-3.2.2/setup.py
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D
> > ---- pytest-3.2.2.orig/setup.py
> > -+++ pytest-3.2.2/setup.py
> > -@@ -1,5 +1,6 @@
> > - import os
> > - import sys
> > -+import re
> > - import setuptools
> > - import pkg_resources
> > - from setuptools import setup, Command -@@ -22,6 +23,18 @@
> > classifiers =3D [
> > - with open('README.rst') as fd:
> > -     long_description =3D fd.read()
> > -
> > -+def read(*names, **kwargs):
> > -+    with open(os.path.join( *names), 'r') as fp:
> > -+        return fp.read()
> > -+
> > -+def find_version(*file_paths):
> > -+    version_file =3D read(*file_paths)
> > -+    version_match =3D re.search(r"^version =3D ['\']([^'\"]*)['\']",
> > -+                              version_file, re.M)
> > -+
> > -+    if version_match:
> > -+        return version_match.group(1)
> > -+    raise RuntimeError("Unable to find version string.")
> > -
> > - def get_environment_marker_support_level():
> > -     """
> > -@@ -59,9 +72,7 @@ def main():
> > -         name=3D'pytest',
> > -         description=3D'pytest: simple powerful testing with Python',
> > -         long_description=3Dlong_description,
> > --        use_scm_version=3D{
> > --            'write_to': '_pytest/_version.py',
> > --        },
> > -+    version=3Dfind_version("_pytest", "_version.py"),
> > -         url=3D'http://pytest.org',
> > -         license=3D'MIT license',
> > -         platforms=3D['unix', 'linux', 'osx', 'cygwin', 'win32'],
> > diff --git
> > a/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
> > b/meta-python/recipes-devtools/python/python-pytest_5.1.1.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python-pytest_3.4.2.bb
> > rename to meta-python/recipes-devtools/python/python-pytest_5.1.1.bb
> > diff --git
> > a/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
> > b/meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb
> > similarity index 100%
> > rename from
> > meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb
> > rename to meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb
> > --
> > 2.17.1
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

