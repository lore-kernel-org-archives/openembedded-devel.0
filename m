Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0BF987FA37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:17:29 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id e187so6494206qkf.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xNR969wTFNJRFXav1LssQ2GtJkRrlTMJTJMBCHx8AOM=;
	b=oqmycJ56rxs1TB8T0vn+QRmwR/BPWj7+oKZQGxBhTZYWRLZavXiLStke6tqYD3hjh/
	n4jAF26PYHj4GOHTv1vAOwSnbS+ggZGU2M9AmfKFH7l5jKphKov5kMsbc3cILQYXYqkK
	r6Z4kpLrvpPtb0kLa70DdICGe0gHFCZbIf25qpYZ1EbjG46EQFkMEOj7THPsNEbv/aGx
	GSUyOXhsjHHhIxTZn8X1Q1XC8/4+sZ/FDSb5ZlhydJa6lvEQKIh4ZcV/+cTIXZc7mbrX
	XxZYf6CiPOlTZ8GoEEv1ds6EB50gSWp3enVo87sGdKnIRfncAtleo2zMFab5s9GzOgcF
	SHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xNR969wTFNJRFXav1LssQ2GtJkRrlTMJTJMBCHx8AOM=;
	b=Uvpu0MykGfTYtpEeW7l/29Hi/v6bjzP4d1Yn3ye2Oe5Pgfjf8t013HKoFn7l/zm6Kx
	+vwgp6medWNgS4bm47rqsiZ2dDr/FX4tAXKgk3tccPDsMLBMaO5awvyoyMramt6gkadf
	Jpv8Xml6LhIWkc0Zm4yajrxQ3L5ZQNUlfVITQeGc5A6tL7y6O74BQTJmUEPhlxJiKwfi
	BunZZDQ3Y8wAVHQy5MFO3eEHPcpeTPLkuJr60M+fSM5+uxHCETeuMMi/rwMEWiZN4MiI
	r8fqc3oFRgQxUd7KxXJdEvz6JCU5uYJmvhRj6Sb2k3xad72KpTw0rv4/Qmo0UTR9mjdm
	u5nQ==
X-Gm-Message-State: APjAAAU+QtMd4Hdp1dW+egpiUlNpgLCoOrtHJ5lKEhBFEOJnenO1QvZZ
	E6fbiHkluzaXiJ0leUSyoMUiZMdotsFw0qhApmk8PAcz
X-Google-Smtp-Source: APXvYqwIv+bULKasElg3H3XSOYB5Em2bwpkWPM+wbAh2CV87/Fq16sI9ihA8fjgXonrsdaHfJjKgzE8EvEFbWQ/+EwQ=
X-Received: by 2002:a37:a2c3:: with SMTP id l186mr9827349qke.337.1573769850569;
	Thu, 14 Nov 2019 14:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20191114202759.26789-1-nick83ola@gmail.com>
	<20191114202759.26789-2-nick83ola@gmail.com>
In-Reply-To: <20191114202759.26789-2-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 14:17:04 -0800
Message-ID: <CAMKF1spJJPSZ148dPfbAPLpAj+PNeAqvdjpW_+uyCC+ZVeekow@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] python-jsonschema: add PACKAGECONFIG format_nongpl
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
X-List-Received-Date: Thu, 14 Nov 2019 22:17:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 12:30 PM Nicola Lunghi <nick83ola@gmail.com> wrote:
>
> This is the backport of a patch upstream
> - 10f8a3e Add format validators as separate modules
>
> that add an option permit to use validator that don't contain GPLv3 code.
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  .../python/python-jsonschema.inc              | 12 +++
>  ...-setup.cfg-add-non-GPL-format-option.patch | 96 +++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-jsonschema/0001-setup.cfg-add-non-GPL-format-option.patch
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
> index df41f06a2..9b81b7ad4 100644
> --- a/meta-python/recipes-devtools/python/python-jsonschema.inc
> +++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
> @@ -6,10 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
>  DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
>  PR = "r1"
>
> +FILESEXTRAPATHS_prepend := "${THISDIR}/python-jsonschema:"
> +
> +SRC_URI_append = " file://0001-setup.cfg-add-non-GPL-format-option.patch"
> +
>  SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
>  SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
>
>  PACKAGECONFIG ??= "format"
> +# PACKAGECONFIG ??= "format_nongpl"
>  PACKAGECONFIG[format] = ",,,\
>      ${PYTHON_PN}-idna \
>      ${PYTHON_PN}-jsonpointer \
> @@ -17,6 +22,13 @@ PACKAGECONFIG[format] = ",,,\
>      ${PYTHON_PN}-rfc3987 \
>      ${PYTHON_PN}-strict-rfc3339 \
>  "
> +PACKAGECONFIG[format_nongpl] = ",,,\

perhaps call it nongpl ( avoid underscores if you can )

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
> index 000000000..96fd48447
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
> +Upstream-status: Invalid.

what does invalid state here? Perhaps inapproprite is what you meant ?

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
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

