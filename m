Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 32D11744C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2018 22:03:25 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id d1so6609306wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2018 15:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b1LUppWLM81JNR2Qb5OQBllk+4iarBMFF2mk5uZ5IP4=;
	b=jYlNCWCpyAeVyzTG+U+VcHX9rsZnp5WjPXELy/GZeFLvUSr3x1HPezGPxoiet7/XRx
	ri/axhPHi6xMpVDZt1TSmo3+NfVv4Imo/O+pUyRFK6K/rbX08GVeybuxXhRv9SsIXvHC
	XXBw3rI7nYuNJBSxzkxtpImyUql3p/XrCH57PDqTzcgtDpF9OXxYFmGJNcCbo47DfF+T
	zWTlqZE00DG0RaxDNvlmQZanHlyeCAcFMDOFrAXQeUKV5UWILNWIjeD5XQVx+e7iW7/z
	y1EnuFRpQ8uQUaBqyDN8Wu/dfE1ExedLR41Mrh7+Owr+y0OgJRT3hcs+SduS9eaLjtF1
	C1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b1LUppWLM81JNR2Qb5OQBllk+4iarBMFF2mk5uZ5IP4=;
	b=MA4B1jZklVG+pCGRO+t7mCtnVMu4/TnhB5r2SFoEanURHZ+QR55MQNoq8e3BSXPFED
	safi932xt1/cvUx7KUImafHE/ook1JyIF5hWMzMNTA17nPNJ8IOPk6hBUysVduUCTUCX
	SYZmu/pTj4Vq3Jf05NVipMPzrSVAkMa3arEeBjWjDO3c0WqaNYi1BvHwz9/nDLz9jyiM
	HJNXiapuPt5vOpsTvpXTbRQyFr8xEauBS98VrpHi5+OvMjt1FO4Qd+m+ybhuVWDy7MIv
	amgTPMmlCEbzn263/wbk5lH3ZWYCyW66kThNtxDLym2JAzjNpnR9ED+1es8gl7EQSLpN
	g1fA==
X-Gm-Message-State: AElRT7FaQI6hqFuqkle6Y+McTJD+UFReF4KnHOxB5YKrXvO0HXofR87k
	qLoKB2UqzFsSIy0M6L9j89s2DtoxQn1yNPqA90/05g==
X-Google-Smtp-Source: AIpwx49CbYUtBu898uTZQu1t0UFD4Z41Uisu87viMf2jDqDHMTeWTdMbBiFQ05Ukwx2YjqPkqeA96Kk1+msnqOiQ5Tw=
X-Received: by 10.223.142.13 with SMTP id n13mr7229874wrb.133.1522361006419;
	Thu, 29 Mar 2018 15:03:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Thu, 29 Mar 2018 15:03:25 -0700 (PDT)
In-Reply-To: <1522267841-26264-1-git-send-email-mark.asselstine@windriver.com>
References: <1522267841-26264-1-git-send-email-mark.asselstine@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Mar 2018 00:03:25 +0200
Message-ID: <CA+chaQdHxcNAbn32E+otS_T_y5KCq-WUGD40ihdkfFkDRABOsg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-jsonpatch: fix do_install
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
X-List-Received-Date: Thu, 29 Mar 2018 22:03:26 -0000
Content-Type: text/plain; charset="UTF-8"

This seems to break python3-jsonpatch which won't find this .patch file,
because it's in different directory.

On Wed, Mar 28, 2018 at 10:10 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> The following error is seen when do_install is run
>
> | UnicodeEncodeError: 'ascii' codec can't encode character u'\xf6' in
> | position 16: ordinal not in range(128) ERROR: python setup.py
> | install execution failed.
>
> This is reported in the upstream project as part of pull request #81
> https://github.com/stefankoegl/python-json-patch/pull/81
>
> Since a release is not yet available with the required fix we must
> apply the fix as a patch.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-devtools/python/python-jsonpatch.inc   |  4 +++
>  .../Drop-support-for-EOL-Python-3.3.patch          | 35
> ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/
> python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
>
> diff --git a/meta-python/recipes-devtools/python/python-jsonpatch.inc
> b/meta-python/recipes-devtools/python/python-jsonpatch.inc
> index e559fb1..85483df 100644
> --- a/meta-python/recipes-devtools/python/python-jsonpatch.inc
> +++ b/meta-python/recipes-devtools/python/python-jsonpatch.inc
> @@ -8,5 +8,9 @@ inherit pypi
>  SRC_URI[md5sum] = "0b20d819daf120ed3fef3be608f2ce18"
>  SRC_URI[sha256sum] = "11f5ffdf543a83047a2f54ac28f8ca
> ad7f34724cb1ea26b27547fd974f1a2153"
>
> +SRC_URI += " \
> +    file://Drop-support-for-EOL-Python-3.3.patch \
> +"
> +
>  RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer
> ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
>
> diff --git a/meta-python/recipes-devtools/python/python-
> jsonpatch/Drop-support-for-EOL-Python-3.3.patch b/meta-python/recipes-
> devtools/python/python-jsonpatch/Drop-support-for-EOL-Python-3.3.patch
> new file mode 100644
> index 0000000..ccd8e12
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-
> jsonpatch/Drop-support-for-EOL-Python-3.3.patch
> @@ -0,0 +1,35 @@
> +From 71bdeed8b49390ff14fe8f0434fc8a1038d89128 Mon Sep 17 00:00:00 2001
> +From: Hugo <hugovk@users.noreply.github.com>
> +Date: Tue, 16 Jan 2018 14:22:33 +0200
> +Subject: [PATCH 1/4] Drop support for EOL Python 3.3
> +
> +Upstream-Status: Backport
> +
> +[MA: remove dev only files from patch]
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +
> +---
> + setup.py      | 2 +-
> +
> +diff --git a/setup.py b/setup.py
> +index 0776c41..471c433 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -58,7 +58,6 @@ CLASSIFIERS = [
> +     'Programming Language :: Python :: 2',
> +     'Programming Language :: Python :: 2.7',
> +     'Programming Language :: Python :: 3',
> +-    'Programming Language :: Python :: 3.3',
> +     'Programming Language :: Python :: 3.4',
> +     'Programming Language :: Python :: 3.5',
> +     'Programming Language :: Python :: 3.6',
> +@@ -81,5 +80,6 @@ setup(name=PACKAGE,
> +       package_data={'': ['requirements.txt']},
> +       scripts=['bin/jsondiff', 'bin/jsonpatch'],
> +       classifiers=CLASSIFIERS,
> ++      python_requires='>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*',
> +       **OPTIONS
> + )
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
>

