Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A0D9860119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 17:07:25 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id w130so8267733lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=642izPNONkplOcUtZcCs0YVnu9jAp6S+8iVSjd7Gn6s=;
	b=SsCtGWW4QKunqJWRi47QaXGqgi4nQRB9Pn1rrXGATmSWfvgFHhhG8zmyGT98qcMOVy
	WSUdYbl/kkIaubLKW3EV6iv2yKfnGndOqlckirqOTcx+9qgZNm8qJ93lBVck17PaWGLo
	w0wW2oWKY0eFr59ep4bFmhD+qIGnV8dtyzL8P3+9o20DjPfFaU9fmMwUoM9RtX083zzq
	7umLrbycgJvm8zXg5CL6glnlzyzSd2UpM7Rp2EFxH6JMPlVSixGG0hHzyuaz5JmNJOp9
	reIkGdRccV08Q173QUtsDmxFKgfJ2fGIkJ1N3hG2f9YJvyzYi2ayvJWY33Dbo2W/HOq2
	XnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=642izPNONkplOcUtZcCs0YVnu9jAp6S+8iVSjd7Gn6s=;
	b=Ys3unqgo/CUlp7379UorSefkozsWmB++gf7/+bOkaQ8alT1h5/SiSzXGnl6WwGak1/
	5qEqC5QjnpZd8auCefZDf3sWqPBWX7gUUR+BEovGTnjxZH0fc/zuiEcOLZsikVf8bmat
	FBqAGZptvmk8hzx/lwIX22gnOBFXtzSxwIQJZHwz6F1OENjGjbPvZXpR3MItxLCDtW3S
	wOwUSV5xMdRhuiDyF0mt+gXkA/t1wWoj23zFmYtWye37s2L7gcYvh6TLZWVzOU7Ma5jV
	LNo6xSUNfHSC2vLaohLbXnIcLl/4iDIQHxVuXDpuqeAdpa8TL7UBpIOKAzz9B9y0uGAC
	cKfg==
X-Gm-Message-State: ALyK8tJDSlMiBMl4yovNGuQTmMgrp16OriBRIaZ5OSx96QsP/W2kCgdD4nzui5aPtppHqzsAQ+Jw6RW4/HNm6w==
X-Received: by 10.46.5.211 with SMTP id 202mr608064ljf.16.1467997645872; Fri,
	08 Jul 2016 10:07:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.10.10 with HTTP; Fri, 8 Jul 2016 10:07:25 -0700 (PDT)
In-Reply-To: <1467619576-13899-5-git-send-email-mingli.yu@windriver.com>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
	<1467619576-13899-5-git-send-email-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 Jul 2016 10:07:25 -0700
Message-ID: <CANx9H-BSGrcTHTiyreukh5xNgyNLORFMjef48dqLOKSSXpGVdw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2 4/5] python-pytest-runner: Add python-pytest-runner bb
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
X-List-Received-Date: Fri, 08 Jul 2016 17:07:26 -0000
Content-Type: text/plain; charset=UTF-8

Built ok for beaglebone.

Acked-by: Tim Orling (Intel OpenSource Technology Center) <
ticotimo@gmail.com>

On Mon, Jul 4, 2016 at 1:06 AM, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Add python-pytest-runner bb as python-mccabe depends
>   on python-pytest-runner
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../recipes-devtools/python/python-pytest-runner_2.8.bb    | 14
> ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pytest-runner_2.8.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python-pytest-runner_2.8.bb b/meta-python/recipes-devtools/python/
> python-pytest-runner_2.8.bb
> new file mode 100644
> index 0000000..a4685ec
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pytest-runner_2.8.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Invoke py.test as distutils command with dependency resolution"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e38b971c2b4c33b978d1b9c9ece9ae63"
> +
> +SRC_URI[md5sum] = "041f3624f450d87a242e3907d7f90e8f"
> +SRC_URI[sha256sum] =
> "1ec44deddaa551f85fd563c40a4c483a2609aca1f284a95399566a74d0680d5c"
> +PYPI_PACKAGE_HASH =
> "466cff61a9e0d513222afa3529bdb565a465812b7e50b218a5afd705f46b258c"
> +
> +DEPENDS += " \
> +    python-setuptools-scm"
> +
> +RDEPENDS_${PN} = "python-py python-setuptools python-argparse
> python-debugger python-json"
> +
> +inherit pypi setuptools
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

