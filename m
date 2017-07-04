Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3630871AC5;
	Tue,  4 Jul 2017 06:24:07 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id v193so12957906ywg.2;
	Mon, 03 Jul 2017 23:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e+CdCFTIUzrOuq1BNzzJC26cn9haGznPHk4WaVCrVGI=;
	b=n0WUr+6oVU9dmNPVZpiT2lHEyxIxfGm6NUaXbSGcqooJkUETZLf/HwpoCr3dVI60gP
	QxlSXTcLfAVB8jP+kXYEGv28CYy4gdsJOG3bD6imTOSOkHmk8xqQMdPXkZWVez+nxI55
	LCuEoYhWUGeCrOq7J+VF11UEKtuC0WezngZXH3Vy79W/TAoN3mdCQUhcF898MAmXWLie
	Z4bIYr1Ck7tqiun1mRJ5OfPS3yPSEq8TgHNUJzI+qJSIM5FdJhStk98tRS3fzO9Tf63e
	zTiVBRwoSTVWQO8AiO9U6Mx9q7M2CDpiT9mepl0kLt7blZHkLzHAKtylzGwHB1xsRGIQ
	E7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e+CdCFTIUzrOuq1BNzzJC26cn9haGznPHk4WaVCrVGI=;
	b=aBMBuej2hiQQVb2OZkXNT0NkB3x+XxW0UTCgUnQ6JpeM7zrqulObyjEyiMHCXaxe4j
	/eHiFrxeERf1whNOvpuU6DXYFDVNbo1NbUDjaeD3V/TlkaMeMijuCro/BGlL25OqzYSW
	Qjbq1Xu4CfPlSjyC/ZgHye4q4gD5w5mw/UFY+sgKFJWI9KZa6iksXVXDXvHhmiJG9sY6
	/WxIJ/wEBExMmpACUX/Xnr222iipt4f8v7LU3Oo+7sblkNSQemlGw4VZSEY5qXBdysFh
	z9kgZ0CEjDT7QL6iGDY1GdumnPiQGrX5SaWOehCjp4bUVlVrN7JzDv81uBAFAUK0tVXh
	mIBg==
X-Gm-Message-State: AKS2vOy1ZgF6feKN4y1ubSGrwc4lz+DrY9BEDHc1aRq1o+z57q32C+Z/
	DzXakeR93T5/h7fEGeKtBGSWvvL1EfYa
X-Received: by 10.13.255.131 with SMTP id p125mr30351356ywf.243.1499149448819; 
	Mon, 03 Jul 2017 23:24:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.172.18 with HTTP; Mon, 3 Jul 2017 23:24:08 -0700 (PDT)
In-Reply-To: <20170619173202.216EB2328FD@git.openembedded.org>
References: <149789352069.8282.14573081186702268358@git.openembedded.org>
	<20170619173202.216EB2328FD@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Jul 2017 08:24:08 +0200
Message-ID: <CA+chaQfGw_QQwM3VV989+62B5GAj5VHMwowgia3tMhkXm+iQZA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 37/44: python-pytest: update to version 3.1.2
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
X-List-Received-Date: Tue, 04 Jul 2017 06:24:08 -0000
Content-Type: text/plain; charset="UTF-8"

Why is setuptools downloading something (bypassing bitbake fetcher _and_
already populated premirror) causing build failures like this:
http://errors.yoctoproject.org/Errors/Details/146740/

On Mon, Jun 19, 2017 at 7:32 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> martin_jansa pushed a commit to branch master
> in repository meta-openembedded.
>
> commit af0e31c58a381c2478435e8d015c142bab58c452
> Author: Derek Straka <derek@asterius.io>
> AuthorDate: Fri Jun 16 16:02:09 2017 -0400
>
>     python-pytest: update to version 3.1.2
>
>     Signed-off-by: Derek Straka <derek@asterius.io>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-pytest.inc                 |
> 4 ++--
>  .../python/{python-pytest_3.0.6.bb => python-pytest_3.1.2.bb}         | 0
>  .../python/{python3-pytest_3.0.6.bb => python3-pytest_3.1.2.bb}       | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-pytest.inc
> b/meta-python/recipes-devtools/python/python-pytest.inc
> index c9c9bbf..2826838 100644
> --- a/meta-python/recipes-devtools/python/python-pytest.inc
> +++ b/meta-python/recipes-devtools/python/python-pytest.inc
> @@ -2,8 +2,8 @@ SUMMARY = "Simple powerful teting with python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
>
> -SRC_URI[md5sum] = "6639592fa430567d024189f097fcdbd7"
> -SRC_URI[sha256sum] = "643434a9f1a188271da35e20064cb8
> b6c5440976c5bb541dc7b5b0e3cf75d940"
> +SRC_URI[md5sum] = "c4d179f89043cc925e1c169d03128e02"
> +SRC_URI[sha256sum] = "795ec29fbba70b22a593691ce8bcd4
> bdde2dc96e8099731f73c7d8bb3ce879bf"
>
>  RDEPENDS_${PN}_class-target += " \
>      ${PYTHON_PN}-argparse \
> diff --git a/meta-python/recipes-devtools/python/python-pytest_3.0.6.bb
> b/meta-python/recipes-devtools/python/python-pytest_3.1.2.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pytest_3.0.6.bb
> rename to meta-python/recipes-devtools/python/python-pytest_3.1.2.bb
> diff --git a/meta-python/recipes-devtools/python/python3-pytest_3.0.6.bb
> b/meta-python/recipes-devtools/python/python3-pytest_3.1.2.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-pytest_3.0.6.bb
> rename to meta-python/recipes-devtools/python/python3-pytest_3.1.2.bb
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

