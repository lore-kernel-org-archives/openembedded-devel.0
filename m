Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 609C66C106
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:15:47 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id r20so8547177qtp.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qBfVsXl3yEF6gJb7XhYa0UU1t2CFpyvoVxii+6U8/f8=;
	b=tGHBs2Gp8gqbjXCyuqN1MkJ586rPpG4sacFgGHLvVF2tMH8ITBT6b1SC3805ubHQcu
	ZRvUmQlY6/o0PaWz8j056btqIMUn+iDZQVcp1PhpAXJDHD1z15fvgCTIUUSKlPIZyfD0
	Mlnp2gAlExp+9VmcjnBsar6wgTc+cGPElhj/Dsm9XokHvV2YTpgd0rRx5ySwsHhPmKdZ
	5/PDcRwXc4Jc1yXzPtrlbtgP+uLmKOBA3k0hNXkifp3etmU3FXHIkLhIV2D85N+xpFXb
	/y9i3Rn4EL/ukNXP+NVIDO4iu6weEeAWugV7+RlbbrNaCNo6r/mDmXqo6nj3t+8NkEjk
	t0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qBfVsXl3yEF6gJb7XhYa0UU1t2CFpyvoVxii+6U8/f8=;
	b=sMsAdK8ixagSpMbduamvwX/tzgm0WdIxa40YlnTScoroYZGhiK44bkoxlvRZyKsAt8
	1xXY/1vPTUc9Hg6FpuG2HyxW2vMt3m2Crhtj1IDFk6fVotJxDX4lrGzswpCcN1YIbzR2
	L49GSPP7+reuWodPTf0v7YgPHRj0fezvildEM/ZXmsQyIme/pPWt2qcYf41zaaqQatHQ
	z/qhmEWSkbNjAMV7HdI7PQM9R++/gaDctx+ROp1Ff3LLjtgOPD+/h245/WXtpOI4bEuo
	crAMfr0jxxbraV8dPRlc1cpUsO/yPf8kT6vQNENjd+sewRhLy37gXjLl9Z6O2AuxpAuk
	6xvA==
X-Gm-Message-State: APjAAAXaSCeTZzfpEA5PhFJWjmz74fRr/sJ/1jfjpNsxq/BDz7btXRCC
	exh1PIAr0qkN+eJjLjhzYjVoI7ybrLmBPjQNu/g=
X-Google-Smtp-Source: APXvYqwAbREnEgzVWso1QsMsn6+jdlqvqwBEzVmZu/UeYw78csLQTHeznFiVj2LXi5Ao4MAXpSGWVAc/7Dhwin1rO6Y=
X-Received: by 2002:aed:2724:: with SMTP id n33mr10758732qtd.194.1573769748337;
	Thu, 14 Nov 2019 14:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20191114202759.26789-1-nick83ola@gmail.com>
In-Reply-To: <20191114202759.26789-1-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 14:15:22 -0800
Message-ID: <CAMKF1sqWJ-6_8ua19e1B6Wx_BOKgmRm+ndTVm_aDS1AVfsLGrA@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/2] python-jsonschema: multiple fixes
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
X-List-Received-Date: Thu, 14 Nov 2019 22:15:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 12:29 PM Nicola Lunghi <nick83ola@gmail.com> wrote:
>
> - remove extra space in python-jsonschema_3.1.1.bb
> - add second license file to LIC_FILES_CHKSUM for json module
> - add missing dependencies: six, datetime, importlib-metadata
> - add HOMEPAGE field
>
> Also:
> - add RDEPENDS for PACKAGECONFIG[format] for optional modules that are
>   not always needed. In particular rfc3987 and strict-rfc3339 are GPLv3
>   modules.
> - add missing idna and jsonpointer modules for PACKAGECONFIG[format]
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  .../python/python-jsonschema.inc              | 20 +++++++++++++++----
>  .../python/python-jsonschema_3.1.1.bb         |  2 +-
>  2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
> index d9ccf1cad..df41f06a2 100644
> --- a/meta-python/recipes-devtools/python/python-jsonschema.inc
> +++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
> @@ -1,15 +1,28 @@
>  SUMMARY = "An implementation of JSON Schema validation for Python"
> +HOMEPAGE = "https://github.com/Julian/jsonschema"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
> +                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
> +DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
> +PR = "r1"

drop PR, pr server takes care of it now a days.

>
>  SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
>  SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
>
> -DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
> +PACKAGECONFIG ??= "format"
> +PACKAGECONFIG[format] = ",,,\
> +    ${PYTHON_PN}-idna \
> +    ${PYTHON_PN}-jsonpointer \
> +    ${PYTHON_PN}-webcolors \
> +    ${PYTHON_PN}-rfc3987 \
> +    ${PYTHON_PN}-strict-rfc3339 \
> +"
>
>  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-attrs \
>      ${PYTHON_PN}-core \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-importlib-metadata \
>      ${PYTHON_PN}-io \
>      ${PYTHON_PN}-json \
>      ${PYTHON_PN}-netclient \
> @@ -17,9 +30,8 @@ RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-pkgutil \
>      ${PYTHON_PN}-pprint \
>      ${PYTHON_PN}-pyrsistent \
> -    ${PYTHON_PN}-rfc3987 \
>      ${PYTHON_PN}-shell \
> -    ${PYTHON_PN}-strict-rfc3339 \
> +    ${PYTHON_PN}-six \
>      ${PYTHON_PN}-unittest \
>      ${PYTHON_PN}-setuptools-scm \
>  "
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb b/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
> index b677c646e..13ed45384 100644
> --- a/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python-jsonschema_3.1.1.bb
> @@ -8,5 +8,5 @@ RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-lang \
>      ${PYTHON_PN}-re \
>      ${PYTHON_PN}-subprocess \
> -    ${PYTHON_PN}-textutils \
> +    ${PYTHON_PN}-textutils \

this change seems not relevant.

>  "
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

