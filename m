Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id C61D878DD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 08:07:26 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id y19-v6so1346870qto.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Aug 2018 01:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eAByzU4TB6pc9xK8U+g+nxKZ0MVhVbB/4AvbesGLdFA=;
	b=PPyC9aYxCxzbGmKUGHxkbC51tWb3nMNWhgB/+Ja8Bl1kULTClLVYCUFiOeJsqfCnHR
	1834ypIus1jWHb7Q3QvEcr+k2EZcMBBA3T+tC5v6ziKrUgBkX7CvpA3AgFa8SkYPKGyM
	+oAZCT6g5ur/KqI0BJLB6pm9w5h07lqi7lTEvUIUlp3n+nqW4+EH3JLfr12AW8yJoL1I
	CRBNeufpJjWD1aja1UcJD1Uau2d+vcauOjP2sgfEu4zcpY1JcCg9mP3pMU5emV02rCjN
	7jaiet1S5cDmzq9aCjkxCtqisOrhSfaRdgDU+rB9sVLrQ4IIjenmPA1ZpRaydn2bgCRM
	0oRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eAByzU4TB6pc9xK8U+g+nxKZ0MVhVbB/4AvbesGLdFA=;
	b=MIU58GhMIXnJwPyouR06DyY3wddlV6yJsFK24n5xp3UyytS3b8K/vOoYH5b/SPqMT/
	E1qqapDf2ykeMjA0lxSDHz2lQqr93U25xQrEZp/ZXHnFQiDggrM5vDr6TkEh7blZLnUp
	KiPWVEMKpr2SfrFXaKTBCVdjjBlI4V85rSNrLx4XjCKffgkbLwU8i9zd3X1g8WjDT9Tw
	FoqUWQjMUD7RKHmHe/eh5fukaFhxiPG4fK4R9kK4Kiz9UX1UpsVUOdQalaXlwI8l4/Xt
	Epu22RO/EAxUn2omGj17Ceua5jpNDMUOphU/yu8zwepgjrAMUQzLltqXzBgUz9lVVF2q
	dbHQ==
X-Gm-Message-State: AOUpUlH/+ebvjFyowH9kNp6d3WePifHEihcEAm/lXCqjYtPUeUF2s2uA
	6+kK8WdLehqB+xNY8hfCOhk0gxdzO5QdOaLQE0eXRg==
X-Google-Smtp-Source: AAOMgpfJiyOhuN6g/pq5kS/xDWyQhLKVv91+Twp2kMgekAtYu9G+uq2m2XxBLsxL+M0mT3yamogmHmKh4xcukd8VndQ=
X-Received: by 2002:ac8:91d:: with SMTP id
	t29-v6mr1578009qth.188.1533197247376; 
	Thu, 02 Aug 2018 01:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180731030937.3685-1-robert.joslyn@redrectangle.org>
	<20180731030937.3685-4-robert.joslyn@redrectangle.org>
In-Reply-To: <20180731030937.3685-4-robert.joslyn@redrectangle.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 01:07:01 -0700
Message-ID: <CAMKF1spvEf1-PeC1+zUVvR9TU4eLBBNYwhP3Rkcg+7E38mwxiw@mail.gmail.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 3/5] python-parse: Update to 1.8.4 and add Python 3 version
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
X-List-Received-Date: Thu, 02 Aug 2018 08:07:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 30, 2018 at 8:11 PM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
> Correct the license to MIT. The PyPI metadata says BSD, but the license
> text in the code is actually MIT.

Part of this patch is already applied by another pull. Please rebase
on top of current master and resend.

> ---
>  meta-python/recipes-devtools/python/python-parse.inc       | 13 +++++++++++++
>  meta-python/recipes-devtools/python/python-parse_1.8.2.bb  | 13 -------------
>  meta-python/recipes-devtools/python/python-parse_1.8.4.bb  |  2 ++
>  meta-python/recipes-devtools/python/python3-parse_1.8.4.bb |  2 ++
>  4 files changed, 17 insertions(+), 13 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-parse.inc
>  delete mode 100644 meta-python/recipes-devtools/python/python-parse_1.8.2.bb
>  create mode 100644 meta-python/recipes-devtools/python/python-parse_1.8.4.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-parse_1.8.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-parse.inc b/meta-python/recipes-devtools/python/python-parse.inc
> new file mode 100644
> index 000000000..2510b27ae
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-parse.inc
> @@ -0,0 +1,13 @@
> +SUMMARY = "Parse strings using a specification based on the Python format() syntax"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://parse.py;beginline=1273;endline=1291;md5=5147afdd9b3615290ad8733f0137a1a1"
> +
> +SRC_URI[md5sum] = "fa69ab2fe846f9b183411391f7c6897b"
> +SRC_URI[sha256sum] = "c3cdf6206f22aeebfa00e5b954fcfea13d1b2dc271c75806b6025b94fb490939"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-logging \
> +    "
> diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb b/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
> deleted file mode 100644
> index 8e16372c5..000000000
> --- a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "Parse strings using a specification based on the Python format() syntax"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://parse.py;beginline=1191;endline=1209;md5=5147afdd9b3615290ad8733f0137a1a1"
> -
> -SRC_URI[md5sum] = "42002338551bdfa0f01bbe4e679a17dd"
> -SRC_URI[sha256sum] = "8048dde3f5ca07ad7ac7350460952d83b63eaacecdac1b37f45fd74870d849d2"
> -
> -inherit pypi setuptools
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-logging \
> -    "
> diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.4.bb b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
> new file mode 100644
> index 000000000..d31ccc72a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-parse_1.8.4.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools
> +require python-parse.inc
> diff --git a/meta-python/recipes-devtools/python/python3-parse_1.8.4.bb b/meta-python/recipes-devtools/python/python3-parse_1.8.4.bb
> new file mode 100644
> index 000000000..b1242545c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-parse_1.8.4.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-parse.inc
> --
> 2.16.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

