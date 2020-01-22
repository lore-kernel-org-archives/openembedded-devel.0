Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id D3DF47FDD9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:15:43 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id b15so5273622iln.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DvMXJyAnN3Ce0liooAmnDkV6acgUb2ModJsrNLgAWyc=;
	b=EfnsfnE8odMKFB9tr6awOQq2utI6hVQr15V5jY1TyqkUeHVwVZgZgOkSB/E96Eb+ZP
	k1InXVdtCrRqlnc+jOg+xNFFsZWPBHFMMX9nk4auQIiTcl/E+UiDCh4+46ZIdbtOWSQX
	YZbR6U1uk5LFfOLS2ZhCKq+EjVAMsY/PYIWMsZ0YY6RaWp/grSn7IzsSNNHNxULuJ+jn
	7YY7uD22wd8mshqFSLg62vlfgEsiOnTE1WoWqk+mUL+1h6h6h3mXIAOQSyvbqjubSpjc
	kAScnyHdKHzr+ZuqkmewalUKDOPoxELNKRW4bvS0Pkiuk638p0v4xwCG5aHSDNClVGvL
	hTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DvMXJyAnN3Ce0liooAmnDkV6acgUb2ModJsrNLgAWyc=;
	b=OKyI5VX5XTjJgNoNw7fOAs1/8UNsUyfoqPxjZN6RU2yzkJapBo9AI/M9VYLYM2HCKq
	RXIIdVVpaydXi9gbDLNjsR6EUisJ+79Xjeczt/7VNEki2A2VJMqtvcwZ1a5ezb0cUBH8
	V1zdUsrLwDGPTPx5SX8TXu35wO9bM0tFmkL4zO8nsk4OwnPt6hAXf+Ihu1NU3KPwUyBE
	c6NCWb6nEHD2ZIV96LcHkEeKlXFymQJ7/wAXlFKgj2vQtW4EDHHdt7ppVCiMsL3yxSEv
	oHbogZDWcrf71ziuTavjPy9+EMP3EDeBRztzBxswrQC7u/ANjUpoSoguhfXw9F5NnSTX
	DNJA==
X-Gm-Message-State: APjAAAWIrGh7JEeFCq1oqOQslVCDc6Xxcb9VqwrQ9YJQRU0GeJJ5i52H
	r0Zz7oTvL4jshVUD8+bOmrRrmgSCGwZ7KZ5vzRU=
X-Google-Smtp-Source: APXvYqxzZTY/hMERzkmaV4okjPIKrNcqMZeHn9gVAVLWqkx43RCFgEgbGjLoossLS8mIrhAx0/TSgubgEjYmTzz9Sk4=
X-Received: by 2002:a92:d30d:: with SMTP id x13mr8708533ila.170.1579702544244; 
	Wed, 22 Jan 2020 06:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20200122063823.242098-1-raj.khem@gmail.com>
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 22 Jan 2020 06:15:33 -0800
Message-ID: <CANx9H-AzLAHLqNeTQppafuVFpjZCMWjjt2D7n7SeJxn5mGUzVQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH 01/12] python-m2crypto: Use PYTHON_PN instead of hardcoding python name
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
X-List-Received-Date: Wed, 22 Jan 2020 14:15:44 -0000
Content-Type: text/plain; charset="UTF-8"

We should start merging the inc and bb files now that we do not need to
support more than one python version.

On Tue, Jan 21, 2020 at 10:38 PM Khem Raj <raj.khem@gmail.com> wrote:

> Lets this inc file become usable for py3 module as well
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-m2crypto.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc
> b/meta-python/recipes-devtools/python/python-m2crypto.inc
> index 5f5444f37e..76dd58ce04 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto.inc
> +++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
> @@ -17,7 +17,7 @@ PYPI_PACKAGE = "M2Crypto"
>  inherit pypi siteinfo
>
>  DEPENDS += "openssl swig-native"
> -RDEPENDS_${PN} += "python-typing"
> +RDEPENDS_${PN} += "${PYTHON_PN}-typing"
>
>  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}
> -I${STAGING_INCDIR}"
>  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

