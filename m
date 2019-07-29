Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id CBAA46BCE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 13:56:14 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id v22so44167550qkj.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VuSsfsWNLxlqUUqMRkwXv4bfL5gClSg9trgQf1q8i3M=;
	b=CmcEzlAKmSptBthkJ7rXZwTd9A3mh/4QyHk4qZ84lLwRa9ehHzrxOk71FSq2bPpDgh
	SI0QPR27UO5n6oxUoxh/U2TRO4wSThSUxyjzulajs8A1bjFUFypmo3T6CYNUvaC6E7D3
	FsTcQg4yFGHgi2ur3wTOgGir22ZwvN0M1JMKkr8+GJABrDSO+3uJvBZeYHB5FXsTwKaK
	PtJPD44+rsmA87OptprldkS+Lo6nirmVW4SOR1kH+houHmTW4dkTky75f55TLapcd//D
	VAEYeKAt78wifWh27xZkH67mGIdw/QQqQPgk+vbAJB+w2nhivUpAgWxngx+7AZZ7kbJJ
	ApOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VuSsfsWNLxlqUUqMRkwXv4bfL5gClSg9trgQf1q8i3M=;
	b=H8ylrXtyXo+WZjpyPeOqUeLUGBvAmurAM+uQlGWGM/2KrkjyaWNnnieuCOrKcyFgqS
	VN7/ZaR0ht0LF0rjPa0TIVnrRoev5LDRXGznQK6eOvPLd06YXcJ1STpm+SzKiNrdpQo/
	6uR/mv1dPNTruQVDzCpP+qT+XMGba3fWsqK61xI9/WSMVGxoR+YBUcaSg0oJcCZzBdR7
	8eiRwOtMq1IsQVfFi0WtNqtLgnAwvY9VgormwYf1pQZ6OKz5dhdgLcpxLFgE9iIjyiOw
	T3vPKF1V1padmZIQ96oSFecu6GRF/EprhlUYLIaTm8gAovnb4ciSE4djGdewg0uXcoSH
	1akw==
X-Gm-Message-State: APjAAAX/Kgw/rSMvHVXC1rj4xYB8MLhHxove05KsP3c8uglTG1fmdRbt
	r9OU2xPw7fo6zyGYTbiBHDlDzw0zIfMOktHqq0k=
X-Google-Smtp-Source: APXvYqwb3qXQSU9c0iPmT4lg9c+S25VprFeFhhn42qihj9szGlZAgzUcd/m+PU4O+B6iNGzM5ix1uYutHHFhGNaveYA=
X-Received: by 2002:a37:c81:: with SMTP id 123mr75310242qkm.474.1564408575378; 
	Mon, 29 Jul 2019 06:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190729062509.9367-1-windel.bouwman@gmail.com>
In-Reply-To: <20190729062509.9367-1-windel.bouwman@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jul 2019 06:55:59 -0700
Message-ID: <CAMKF1soGZ1urgWXjvoqBMccjagW3fbnmM-nNzXdtgK2TF_WgOA@mail.gmail.com>
To: Windel Bouwman <windel.bouwman@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] Add recipe for the coloredlogs python package.
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
X-List-Received-Date: Mon, 29 Jul 2019 13:56:15 -0000
Content-Type: text/plain; charset="UTF-8"

There are packaging errors found see

https://errors.yoctoproject.org/Errors/Details/255454/
https://errors.yoctoproject.org/Errors/Details/255455/

On Sun, Jul 28, 2019 at 11:26 PM Windel Bouwman
<windel.bouwman@gmail.com> wrote:
>
> Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
> ---
>  .../python/python-coloredlogs.inc             | 24 +++++++++++++++++++
>  .../python/python-coloredlogs_10.0.bb         |  2 ++
>  .../python/python3-coloredlogs_10.0.bb        |  2 ++
>  3 files changed, 28 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-coloredlogs.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-coloredlogs.inc b/meta-python/recipes-devtools/python/python-coloredlogs.inc
> new file mode 100644
> index 000000000..2a4ccb37a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-coloredlogs.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Colored terminal output for Python's logging module"
> +HOMEPAGE = "https://coloredlogs.readthedocs.io"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
> +
> +SRC_URI[md5sum] = "0a186966a1955fff8cf9489373e691d9"
> +SRC_URI[sha256sum] = "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36"
> +
> +inherit pypi
> +
> +do_compile_prepend() {
> +    sed -ie "s/find_pth_directory(),/'',/g" setup.py
> +}
> +
> +do_install_append() {
> +    rm -rf ${D}${prefix}${datadir}
> +}
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-humanfriendly \
> +"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
> new file mode 100644
> index 000000000..0fc1b258c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools
> +require python-coloredlogs.inc
> diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
> new file mode 100644
> index 000000000..387239966
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-coloredlogs.inc
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

