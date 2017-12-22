Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 11DF271B27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 19:00:20 +0000 (UTC)
Received: by mail-yb0-f179.google.com with SMTP id w1so10526556ybe.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 11:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1/+43QrgLgl9ahA+jRbwiQtmiCcrAPYkJbiR8n66U4U=;
	b=QKXQTkuzeVberbuM/LiwBtJe08/QOjHQlS98GfDbYEWOxnUSppHsYZZqU5ES3mBfGv
	LCtGDgS1obaa3ak3J6ukZu9FM2XBi0KKhLm9hfG7Mkg13xbWCrVTB4jyl3n/P8yn0nH1
	nymcoW96QxeEw21fHvjXicFcL0jV9yxurQXTkAFdCcD2z9dDyFkcbdx+FX1EHvWHkcKy
	GWl7gofkVfSSCLL10UOu+WOVwwzYsLiVHQupKSpNzZ/G5lGYklInwfk/JXacFMVLxNe4
	d5M3zyxGxKDUaDeGkL8c4rXkvG+SWbPdIlfSw4u5FZL9zpqpIgHX0Gq2Q1DEc60U3gL4
	ABdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=1/+43QrgLgl9ahA+jRbwiQtmiCcrAPYkJbiR8n66U4U=;
	b=TiQHbVUrzfkr7CG78pzt/zQrAKhJFn0rx3xp4A8E3hgpQPHqpJl5l+gmqWZBBwLUA6
	Ml3vu1GmDn0Yzuq16ONsm+sPA5A8jifPUBvyHzGgspzpFFXDe78kfx1gVR/WEoK1/p1r
	ziiz1qOd8xbSlk/SCA/Vxj94clAqa9UW3kej2qOVAu1wOABphKeCTgQqeCrr5t1DODaH
	LIgSvoLP6TsPSY85CpmoDCVph5aqUMNEGyj09iCcqwdUDDSd8bPWDeKyjU2tyfDqbjEU
	Md+N2jXYJAgR7c8Ee3IQEDlxPO5suRwMoPhJq7PgEJJG540kVtxBovEcIygDyVY73KB4
	ynGQ==
X-Gm-Message-State: AKGB3mLWWKtigBzOmGdnZhjk+iWNaYcWlWpte8rA0o6r96SSrJ9+jGUK
	CLpZMvJLWqzE/0jrQQMor3bF0VqRkzxp23DXOWJorg==
X-Google-Smtp-Source: ACJfBosuQk4oe3+rF939QcsLJtYXws7AHrKzgdfYJ9e79KVOHplfZp7PVmli6UmCSeIyGKTCM1fILqHWB0slq3dCyeg=
X-Received: by 10.37.19.69 with SMTP id 66mr11393984ybt.77.1513969221814; Fri,
	22 Dec 2017 11:00:21 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.189.69 with HTTP; Fri, 22 Dec 2017 11:00:21 -0800 (PST)
In-Reply-To: <1513952166-4501-1-git-send-email-derek@asterius.io>
References: <1513952166-4501-1-git-send-email-derek@asterius.io>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 22 Dec 2017 14:00:21 -0500
X-Google-Sender-Auth: wQnSPahYPSq8fG0GzANQy--Nk2o
Message-ID: <CAPuovEK=atyENNhdMSbvi42d7mUdLQcWNnSZ6U5KpcowevMTYw@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-automat: fix build dependencies to avoid download during do_compile
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
X-List-Received-Date: Fri, 22 Dec 2017 19:00:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 22, 2017 at 9:16 AM, Derek Straka <derek@asterius.io> wrote:
> Add the correct version of python{3}-setuptools-scm-native
> Remove the dependency on m2r

Derek,

Can you please ensure this and other fixes for python-automat are
applied to the rocko branch. Recall I had requested this recipe be
cherry-picked to rocko to ensure python-twisted was usable on rocko.

Thanks,
Mark

>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../recipes-devtools/python/python-automat.inc     |  8 ++++
>  ...001-setup.py-remove-the-dependency-on-m2r.patch | 52 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
>
> diff --git a/meta-python/recipes-devtools/python/python-automat.inc b/meta-python/recipes-devtools/python/python-automat.inc
> index 1ac5d3b..43b9ce9 100644
> --- a/meta-python/recipes-devtools/python/python-automat.inc
> +++ b/meta-python/recipes-devtools/python/python-automat.inc
> @@ -3,6 +3,8 @@ HOMEPAGE = "https://github.com/glyph/Automat"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
>
> +FILESEXTRAPATHS_prepend := "${THISDIR}/python-automat:"
> +
>  SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
>  SRC_URI[sha256sum] = "3c1fd04ecf08ac87b4dd3feae409542e9bf7827257097b2b6ed5692f69d6f6a8"
>
> @@ -10,6 +12,12 @@ PYPI_PACKAGE = "Automat"
>
>  inherit pypi
>
> +SRC_URI_append = " \
> +    file://0001-setup.py-remove-the-dependency-on-m2r.patch \
> +"
> +
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
>  RDEPENDS_${PN} += "\
>     ${PYTHON_PN}-attrs \
>     ${PYTHON_PN}-six \
> diff --git a/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch b/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
> new file mode 100644
> index 0000000..0ebb220
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-automat/0001-setup.py-remove-the-dependency-on-m2r.patch
> @@ -0,0 +1,52 @@
> +From d5ebe479fc8fe11c5c75e7f35484849320349222 Mon Sep 17 00:00:00 2001
> +From: Derek Straka <derek@asterius.io>
> +Date: Fri, 22 Dec 2017 09:07:00 -0500
> +Subject: [PATCH] setup.py: remove the dependency on m2r
> +
> +The dependency on m2r is removed here as it only provides the
> +long_description value that is optional.  This item is just the
> +text that would be present on PyPi, so it doesn't provide much
> +value in this case
> +
> +Upstream-Status: Inappropriate (OE specific)
> +
> +Signed-off-by: Derek Straka <derek@asterius.io>
> +---
> + setup.py | 10 ----------
> + 1 file changed, 10 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index d360c64..7b4180a 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -4,14 +4,6 @@ Setup file for automat
> +
> + from setuptools import setup, find_packages
> +
> +-try:
> +-    from m2r import parse_from_file
> +-    long_description = parse_from_file('README.md')
> +-except(IOError, ImportError):
> +-    print("\n\n!!! m2r not found, long_description is bad, don't upload this to PyPI !!!\n\n")
> +-    import io
> +-    long_description = io.open('README.md', encoding="utf-8").read()
> +-
> + setup(
> +     name='Automat',
> +     use_scm_version=True,
> +@@ -19,12 +11,10 @@ setup(
> +     description="""
> +     Self-service finite-state machines for the programmer on the go.
> +     """.strip(),
> +-    long_description=long_description,
> +     packages=find_packages(exclude=[]),
> +     package_dir={'automat': 'automat'},
> +     setup_requires=[
> +         'setuptools-scm',
> +-        'm2r',
> +     ],
> +     install_requires=[
> +         "attrs>=16.1.0",
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

