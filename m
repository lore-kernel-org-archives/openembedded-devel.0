Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 28CEA7ECC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 21:29:32 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id r5so8905796qtd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=33vWE1NLxKiOZV4CNUbc2/QVppAXV3FzzLRWd3zaVM8=;
	b=CBCybIyl09nfIBQ9sa2mTLhZofWc1DB54lwPLCMW8bVLc1ua4Vk8RAoO2W8KcoA12J
	KVHaJZcwDUHM+6DN4nUg6QCONe2Uoxk1SSul//Kq1ga+SmQc4mKCrtkMUF55ZcUA7qKB
	Z7o3VIVoinqp7eaxfrhNd6LFsuQ6w6PErAMm1R4R4be+6IToztqTV3DvJBtb3sZLTyhr
	MtGK9ZhQvIc/X2r3zed8SQSjRojdiT62UWaTb29zmEnBjwllcBarS+8oEwhtAzEv7a9D
	AZebnwNp9nvkOeT0/oPACWBGeN/ZHYiUpd8TtQuXb6Czpl8WQSInxptoZ6eqVQVoL6mL
	CbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=33vWE1NLxKiOZV4CNUbc2/QVppAXV3FzzLRWd3zaVM8=;
	b=DEnSdZOdpeP/tvYCksSz/xZy0RPy87LtSBUlDxGcfgn2QfBvcmz3xS4WdQUEIr5nwX
	Nsgm1X1Yh2DmUvqKi9oYHOo9zAt1Xnt2Ca8sRtFzYyEYMLD9bYsDtuL3kcQp7Ic3htUh
	+BplqVTaD39R6psl9+pHS430DD2gP2wERMdY2aSATnqZvrWGEbkQtE8weh+BaWTGm1EC
	NbDnLXl+UUyr7uzKGy0Gd4U6d67RNRJ39jv28bZg9loHkGFcq5WEt6N3Yq74055oyyHl
	rV+aTZuCNsQ58aCaQ46/BXZJG8Da3hrFeGRDA0n7f/QPukVLhJVf6dVFdZIQUm6jyZBy
	srcg==
X-Gm-Message-State: APjAAAXVHKXE0JZDtO4Wu1imtBjup6eR0+U8OGnUAJZhpC6Ee5pHn6dr
	oOqLSnfFlQSEAcRH7GPtL46gUobfqETaNNuATosRq5J+
X-Google-Smtp-Source: APXvYqzd3l/R3kYkA2jpQJMsRukK66tKpJnK+BCkPJZPdZsMl3fp/HOskV8I2t5bMjEbxbFtuXiOMVn3xzNC2S7Et9w=
X-Received: by 2002:ac8:d4c:: with SMTP id r12mr11310119qti.88.1567805372868; 
	Fri, 06 Sep 2019 14:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190906205120.19040-1-alistair.francis@wdc.com>
	<20190906205120.19040-2-alistair.francis@wdc.com>
In-Reply-To: <20190906205120.19040-2-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 14:29:06 -0700
Message-ID: <CAMKF1so6GXyLz03+6Tn7PYU_6Qn9_BWk3ngxG0-4MJ5CkceeZg@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/3] python3-six: Initial commit of 1.12.0
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
X-List-Received-Date: Fri, 06 Sep 2019 21:29:33 -0000
Content-Type: text/plain; charset="UTF-8"

this package is already in oe-core

On Fri, Sep 6, 2019 at 2:02 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta-python/recipes-devtools/python/python-six.inc       | 9 +++++++++
>  .../recipes-devtools/python/python3-six_1.12.0.bb        | 2 ++
>  2 files changed, 11 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-six.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-six_1.12.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
> new file mode 100644
> index 000000000..92df2b486
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-six.inc
> @@ -0,0 +1,9 @@
> +DESCRIPTION = "Six is a Python 2 and 3 compatibility library"
> +HOMEPAGE = "https://github.com/benjaminp/six"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=f9a0f1a5bcc65f1b7de7339906282610"
> +
> +SRC_URI[md5sum] = "9ae5d1feed8c0215f4ae4adcd9207fcb"
> +SRC_URI[sha256sum] = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
> +
> +inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-six_1.12.0.bb b/meta-python/recipes-devtools/python/python3-six_1.12.0.bb
> new file mode 100644
> index 000000000..8795313be
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-six_1.12.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-six.inc
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

