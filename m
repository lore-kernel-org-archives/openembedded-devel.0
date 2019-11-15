Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6BAFD7FAB6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 17:36:28 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id h15so8704711qka.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a+modyYRSGtMQ/17GZoDv8M93/PQ6zD9jvvt9uQeqQw=;
	b=Qnb+gSEF15LBAMGFLp5VZOC2U4A2pFEGr+3v0BtPwJ2kwg3prr3F0cRg3Ac4AAZSOU
	jrrel6C1g2QZ2+7RonIAhUU2jRz23b2HHyQs6aI9spcTYnDDcNSnvyq0vdfq+CzP058X
	T+ckaaQPYvg56Vtp3vhGMLg0M3kbdYqUWo4J6sVesc3sNbxAfafBOySsgC8Wp5of+UG9
	qeTh87lPtH12M/iVXg3Dn6nmCCCLwyv6bdU1EEMxQWWg1XT6R5VLwOt4wYfz0IJPC53F
	c5jOYux2ewTsAsMKcnJvfs6K6NDrA7Php/OUlQrLdQ8AwCbNkZc072cmbOIbcpjZieWd
	Yjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a+modyYRSGtMQ/17GZoDv8M93/PQ6zD9jvvt9uQeqQw=;
	b=fWQm1RLnBN5PIoR3Na3VySu41sjgUgjB4fVFYctMc822nO7BDOGpLRT6uDv83Fj6VL
	klvqhTyjRlNFZS3XV/sFCRHsi0WcApDEqD9wcTI3ZVkgXcca2CByzWOxBKbaLYwPJHsH
	weMSikOHlPqWMYzwEG7UW5Pdrk5Tg/2LR+f5r8Pur6o0A4Syas5OP1qEQnpZEQDlPSna
	tANIuZwC8ZtkGjXOuFdUUAvRyin7ayOqrtq4lOfikFJBPFsXyPVaawdgxklthXlKkbt0
	FOzxPdogsY254/cZfGFVjFe9oUDFYb+CI9djtbRpnpE99/dntL/kT0bI0I1PJptmj/jm
	X24w==
X-Gm-Message-State: APjAAAUYkMiIJiYbnltfH9L9MkgFvOwljgLhovoBcOpd1nbDLuuTSdLP
	9uBDC/C/xKa3xRkhtmp/1iWy2cGrJPjwAvw4c/I=
X-Google-Smtp-Source: APXvYqxWIvTmAaALGsQ7ufPSf+ClfYxAv+ZSuhbqH/l4LJOxGsShyoPXZmNfQ4dlB+s+iINutitSB1/XBXRtMFAvpvE=
X-Received: by 2002:a05:620a:a9a:: with SMTP id
	v26mr8105888qkg.71.1573839388725; 
	Fri, 15 Nov 2019 09:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20191115172024.34819-1-nick83ola@gmail.com>
In-Reply-To: <20191115172024.34819-1-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Nov 2019 09:35:56 -0800
Message-ID: <CAMKF1sr=RqsNta+YMQ85BtX+OjdS+tZ5oqhCGGx-hvg+HsqxZQ@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python-jsonschema: add PACKAGECONFIG format_nongpl
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
X-List-Received-Date: Fri, 15 Nov 2019 17:36:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 15, 2019 at 9:21 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
>
> This is the backport of a patch upstream
> - 10f8a3e Add format validators as separate modules
>
> This will add a PACKAGECONFIG = "nongpl" option to include only dependencies
> not licensed under the GPL license.
>

please rebase on top of master-next and resend these patches

> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  .../python/python-jsonschema.inc              | 11 +++
>  ...-setup.cfg-add-non-GPL-format-option.patch | 96 +++++++++++++++++++
>  2 files changed, 107 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
> index c1b11a2cc..837d5760c 100644
> --- a/meta-python/recipes-devtools/python/python-jsonschema.inc
> +++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
> @@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
>                      file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
>  DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
>
> +FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonschema:"
> +
> +SRC_URI_append = " file://0001-setup.cfg-add-non-GPL-format-option.patch"
> +
>  SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
>  SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
>
> @@ -16,6 +20,13 @@ PACKAGECONFIG[format] = ",,,\
>      ${PYTHON_PN}-rfc3987 \
>      ${PYTHON_PN}-strict-rfc3339 \
>  "
> +PACKAGECONFIG[nongpl] = ",,,\
> +    ${PYTHON_PN}-idna \
> +    ${PYTHON_PN}-jsonpointer \
> +    ${PYTHON_PN}-webcolors \
> +    ${PYTHON_PN}-rfc3986-validator \
> +    ${PYTHON_PN}-rfc3339-validator \
> +"
>
>  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-attrs \
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch b/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
> new file mode 100644
> index 000000000..afc38a30b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
> @@ -0,0 +1,96 @@
> +From 8df0332475991884b8e1801d31f9c3e06d06bf9f Mon Sep 17 00:00:00 2001
> +From: Nicola Lunghi <nick83ola@gmail.com>
> +Date: Thu, 14 Nov 2019 18:58:56 +0000
> +Subject: [PATCH] setup.cfg: add non GPL format option
> +
> +This is a rewrite of the following upstream commits:
> +
> + - 10f8a3e Add format validators as separate modules
> + - af37707 non GPL format option
> +
> +removing all the non necessary bits (tox in particular)
> +
> +Original author: Nicolas Aimetti <naimetti@yahoo.com.ar>
> +
> +Upstream-status: Backported. [ to be removed for releases > 3.1.1 ]
> +---
> + jsonschema/_format.py | 33 ++++++++++++++++++++++++++++-----
> + setup.cfg             |  6 ++++++
> + 2 files changed, 34 insertions(+), 5 deletions(-)
> +
> +diff --git a/jsonschema/_format.py b/jsonschema/_format.py
> +index aa04090..c967d98 100644
> +--- a/jsonschema/_format.py
> ++++ b/jsonschema/_format.py
> +@@ -248,7 +248,26 @@ else:
> + try:
> +     import rfc3987
> + except ImportError:
> +-    pass
> ++    try:
> ++        from rfc3986_validator import validate_rfc3986
> ++    except ImportError:
> ++        pass
> ++    else:
> ++        @_checks_drafts(name="uri",)
> ++        def is_uri(instance):
> ++            if not isinstance(instance, str_types):
> ++                return True
> ++            return validate_rfc3986(instance, rule="URI")
> ++
> ++        @_checks_drafts(
> ++            draft6="uri-reference",
> ++            draft7="uri-reference",
> ++            raises=ValueError,
> ++        )
> ++        def is_uri_reference(instance):
> ++            if not isinstance(instance, str_types):
> ++                return True
> ++            return validate_rfc3986(instance, rule="URI_reference")
> + else:
> +     @_checks_drafts(draft7="iri", raises=ValueError)
> +     def is_iri(instance):
> +@@ -280,15 +299,19 @@ else:
> +
> +
> + try:
> +-    import strict_rfc3339
> ++    from strict_rfc3339 import validate_rfc3339
> + except ImportError:
> +-    pass
> +-else:
> ++    try:
> ++        from rfc3339_validator import validate_rfc3339
> ++    except ImportError:
> ++        validate_rfc3339 = None
> ++
> ++if validate_rfc3339:
> +     @_checks_drafts(name="date-time")
> +     def is_datetime(instance):
> +         if not isinstance(instance, str_types):
> +             return True
> +-        return strict_rfc3339.validate_rfc3339(instance)
> ++        return validate_rfc3339(instance)
> +
> +     @_checks_drafts(draft7="time")
> +     def is_time(instance):
> +diff --git a/setup.cfg b/setup.cfg
> +index 74bc4a7..878221c 100644
> +--- a/setup.cfg
> ++++ b/setup.cfg
> +@@ -40,6 +40,12 @@ format =
> +       rfc3987
> +       strict-rfc3339
> +       webcolors
> ++format_nongpl =
> ++      idna
> ++      jsonpointer>1.13
> ++      webcolors
> ++      rfc3986-validator>0.1.0
> ++      rfc3339-validator
> +
> + [options.entry_points]
> + console_scripts =
> +--
> +2.20.1
> +
> --
> 2.20.1
>

