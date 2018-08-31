Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CDC95795CF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:40:05 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id f17-v6so1789643qkh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YlgvIm6xv6YnwazBQ4jH3bFw81Tf0q4lG4zVzbEV3kQ=;
	b=I2eLuc4C9y7QficIxHe8jz3VGDYLQpiCZWK4bVz6t5XcayScChmE+4msEVNINSoej2
	Z6zKgGGNoc/HYRlr9ajK+sT80SLo5n/U6klJr7EbWOZC0LCj/hCa++xfjxuPEx8f/5uy
	D4nTbUuwnMr9D565pH2tPVbFatpUkyx8YYL2ngEIKQwr51iM4Mkks6Dp/GOzaAG+Mxdb
	xH+MYtY/Cu8c9g3IU4YzrBl838iOBvlbKM2LtsW6s5KBGzrrqsDV39SyFmDq9TespVdn
	62ncAm9oL1u9XoXED2d7d74nCrpeffwxhmDmc0HTYp2Tc800HAXaI32RNK8PSkXpT2FY
	tjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YlgvIm6xv6YnwazBQ4jH3bFw81Tf0q4lG4zVzbEV3kQ=;
	b=RHCTbbaVK588E9lYbaHJPclR7Keml1GYQKy1/wTkoqGTg603jOc1yXUGXqZG5sdkaB
	G210nfEIYap5B7ASMOmjy0BW7wUk9+GFGEG8ozlfDk4qxRKUIYYTHCx9uEC21ch/EVn9
	AVXZk/Rc59rQ6eyNYhM8YSgTBugf4K15ERjAEBW7eD5qDUcZEv1R2uvDHPsuMvQYaM8n
	5LL/lXqZQgxiqyKRaWn2vlRL5c5BygD62zOj2M2e2qCSFlnlAoE2QBn07kVbVJNsop/E
	XlqqEJOpa7L5MgQS0k+xcg9UAWOQ9jPTAvmBn++hRAQHcglkd9U0UNnAmbEHlXVDhObF
	c5xg==
X-Gm-Message-State: APzg51B4T8IrY+vW6O6p+pRZyP9mKUR6LXEzRFpehSmhNXzslG8ekR18
	irsZSxtjKyom1QQ3BMnRWEtOEavPrjOZnNDJXMh456bq
X-Google-Smtp-Source: ANB0VdajqLgz9IhQtkapLjbvVPbo6I8K9hiMa31RDHshG0ZMlICqDmG2LlIowe3MYl5YCvimexdLMaMws7UFvLrOG4A=
X-Received: by 2002:a37:c5d2:: with SMTP id
	k79-v6mr12655821qkl.206.1535733606598; 
	Fri, 31 Aug 2018 09:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180831145430.21569-1-ross.burton@intel.com>
In-Reply-To: <20180831145430.21569-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2018 09:39:40 -0700
Message-ID: <CAMKF1sq82iqCFuBt0C77GqLaoJRtvoM5bBpX=jj1uyVTE6M+CQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] python-pbr: add python3-pbr variant
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
X-List-Received-Date: Fri, 31 Aug 2018 16:40:06 -0000
Content-Type: text/plain; charset="UTF-8"

python3-pbr is already added to OE-Core see
http://git.openembedded.org/openembedded-core/commit/?id=4cc30de57d
On Fri, Aug 31, 2018 at 7:54 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-python/recipes-devtools/python/python-pbr.inc     | 14 ++++++++++++++
>  .../recipes-devtools/python/python-pbr_3.1.1.bb        | 18 ++----------------
>  .../recipes-devtools/python/python3-pbr_3.1.1.bb       |  2 ++
>  3 files changed, 18 insertions(+), 16 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python-pbr.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pbr.inc b/meta-python/recipes-devtools/python/python-pbr.inc
> new file mode 100644
> index 0000000000..d8847f6502
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pbr.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
> +HOMEPAGE = "https://pypi.python.org/pypi/pbr"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> +
> +SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
> +SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-pip"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
> index bdff867f30..8f7f924dab 100644
> --- a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
> @@ -1,16 +1,2 @@
> -DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
> -HOMEPAGE = "https://pypi.python.org/pypi/pbr"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> -
> -SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
> -SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
> -
> -inherit pypi setuptools
> -
> -RDEPENDS_${PN}_class-target += " \
> -        python-pip \
> -        "
> -
> -BBCLASSEXTEND = "native"
> +inherit setuptools
> +require python-pbr.inc
> diff --git a/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb
> new file mode 100644
> index 0000000000..97e7361b16
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pbr_3.1.1.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-pbr.inc
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

