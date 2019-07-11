Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id D0B697EFF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 13:46:42 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i10so12561411iol.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KJ9e92Lf5webMm1xbfVKWoPB0NikEQtJJoKmvI1tXrE=;
	b=aAjCrk+DfC+WJveNGGbQLb3jgO9853fH4/0fjRw7VkDuIXhhtqgg9NfAXRJCZsqK77
	dwuH2MldjKvBOlEXX9AuDIb+G6N55Bx3ASRKeKyPtY4Rns8lC9AAQTEOq1mgE15MijLm
	3icVLUrnGgvBerHn3bx1ufcZAl77TAfgW+Jgw4+FqQxTwvcOgY9kSGNJMo7iKBIlNq6r
	mLwxKEIVbIRhwQofjSqFCWpbEgbsGuJs0/LVL0T07ugR6iEIoUtDicEKv8BYmKaeaU/6
	BaMquNGrnZayIJFErZvLGinTdYIj5VxXk8nOtadA/RQmCL4oTosVi7CBlQQSeDrCK22q
	7CqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KJ9e92Lf5webMm1xbfVKWoPB0NikEQtJJoKmvI1tXrE=;
	b=UfsDio2VDKDg+/9sYhCIFVvBy2j1tX8dnTeXFjyHTe+6uqIGtTZt+VV/1dSM0y+5jv
	B5JY+vwPhNmtSBD0j16+Fpt6EewbvQBfN1+zG8ebaiddWgKObKH3LWAT8GCy6QG5X5jv
	8VINdDpvY3eEhmAT0UtW3RUb6afcr9Tva5qvOGMd5/Mh+TvGV6xWpqMhlYZVIfRDgsZt
	1GsUQgSt6j2QzRbKp6MfO4DrgYK8GnQhky3C7i4CCDw7sywf97J13V9uxBu/64guiI7d
	M04ny5l1kUO3sbdglrFpuA4L3risy1m772Ja/AhryV2MV6prz2irv3bcIbPuSfOAnsqf
	dzNA==
X-Gm-Message-State: APjAAAU9VbP8OZHZZBPwHDxsFuMubk0lY2i7QWF6aZ/9RlV3ej++44fL
	v5C0v5xgvqTpySoNBVkgOaw1U8b46TFWTu6vWs0=
X-Google-Smtp-Source: APXvYqyXUm/GgKommWZp6z0hJ4CtT+xqBWlKv6PPtFjUZEyASdCazHx7pKrhRUupZC38uqkVh8B0B4gOINvlFicIIts=
X-Received: by 2002:a6b:c9d8:: with SMTP id z207mr4241433iof.184.1562852803760;
	Thu, 11 Jul 2019 06:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190711090803.18931-1-windel.bouwman@gmail.com>
In-Reply-To: <20190711090803.18931-1-windel.bouwman@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 11 Jul 2019 06:46:33 -0700
Message-ID: <CANx9H-AeowZ0OR+yq353qjSsYvGC=6H6eZuDZbvBywDNEyQTCg@mail.gmail.com>
To: Windel Bouwman <windel.bouwman@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python-humanfriendly: Add recipe for the humanfriendly package.
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
X-List-Received-Date: Thu, 11 Jul 2019 13:46:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

You are missing the subject prefix indicating which layer and the fact that
this is a v2.

Add this argument to git send-mail:

--subject-prefix=3D=E2=80=9Cmeta-python][PATCH v2=E2=80=9D

On Thu, Jul 11, 2019 at 2:08 AM Windel Bouwman <windel.bouwman@gmail.com>
wrote:

> Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
> ---
>  .../python/python-humanfriendly.inc           | 25 +++++++++++++++++++
>  .../python/python-humanfriendly_4.18.bb       |  2 ++
>  .../python/python3-humanfriendly_4.18.bb      |  2 ++
>  3 files changed, 29 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python-humanfriendly.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python-humanfriendly_4.18.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-humanfriendly_4.18.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-humanfriendly.inc
> b/meta-python/recipes-devtools/python/python-humanfriendly.inc
> new file mode 100644
> index 000000000..94f7f8b81
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-humanfriendly.inc
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Human friendly output for text interfaces using Python"
> +HOMEPAGE =3D "https://humanfriendly.readthedocs.io/"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D690da298a43805797a4fa7bbe180b3c6"
> +
> +PYPI_PACKAGE =3D "humanfriendly"
> +
> +SRC_URI[md5sum] =3D "9573f9f37a5454d8205cfd1b9b8db9d2"
> +SRC_URI[sha256sum] =3D
> "33ee8ceb63f1db61cce8b5c800c531e1a61023ac5488ccde2ba574a85be00a85"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN}_class-target +=3D " \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-fcntl \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-math \
> +    ${PYTHON_PN}-numbers \
> +    ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-stringold \
> +"
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-python/recipes-devtools/python/
> python-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/
> python-humanfriendly_4.18.bb
> new file mode 100644
> index 000000000..4e03a654c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools
> +require python-humanfriendly.inc
> diff --git a/meta-python/recipes-devtools/python/
> python3-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/
> python3-humanfriendly_4.18.bb
> new file mode 100644
> index 000000000..2ca5fe36f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-humanfriendly.inc
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

