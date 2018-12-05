Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5DCB16C118
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 16:57:09 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id z16so23053292qtq.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 08:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QtEfQ5qm5XVMB0OvZnF6Ly5CEaOKRdXxARmX7Oa2Nk8=;
	b=o225r47HM9TjY/MNoQlmGhDFbSQ42mxgpDh8tkEn+ZOKFk8NR/krBOH4YU/ARCCfQY
	1UibUTBnyHFCVNvOGtOsCsPy/kg+LYbH80OnOo0CQzTqXle3fC93YsNQFYBdaRR6QjbE
	dBWJKg9mqAROEYsZKmDPGIQBnFUjFKPTIP0NYNx8J+lIIxkPzMWa8VNfcxHDKZ62VNzF
	OC0PcnZcIKKwsMVJzF7WzNkw03odxKHUopcpMhnxAmNI1YieuIvzX/A2U8H5Dyiq9WG0
	RpeN47Vjok6wjsoP9U71Pijn47mrKlhZuGlneiTRkjh/oWzgj3f4co1yC+8N/QhMx4Gu
	3Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QtEfQ5qm5XVMB0OvZnF6Ly5CEaOKRdXxARmX7Oa2Nk8=;
	b=XgOxJ/hRJvKG0NpFQJ8iOkgGQXjRrDJSaawuOgcPEFCYHi5nqzbtudWBhf7Q4uBhRK
	m3wImZayi7KSv/9OTaCIdVwgbdMMmaskmp1EZ5EfHJmoBAxPXTHMQ6AjUUTljnDZZqgP
	qOw4r4yeBhWrK2FHpcYQcwuIdYD5NHdB8geRLhMC2SBT4g75pGjETCrKorgRoCPbw2kc
	v0wjP5HUhmzseJnjQV7WyDnSNLcUhlV4JiGkYPbdpN/bL6xGo9uosWOheEp3rWoGQpDl
	feNzFkS1GHVbO4mbiyw3T+CHQKG4tDw9z5c4Z7gWducilkFgmxGprbDUgSyVrgyPxOCt
	7AoQ==
X-Gm-Message-State: AA+aEWbxJlH3scQxN9lapUJuki2ptDT6TZJ5hQbykR99pdJ+89HFlVWp
	1LzhqeGVYTA6H+PZsyZlhOxcneFel9fy9jKQrKs=
X-Google-Smtp-Source: AFSGD/XDFDgheXrHlzXhTJjMNcKupzk2lnh3mqvOYSEvATkBIVaGiXG4I1Htz7BscsTrPV+BmOMUb1qCfbvBzt9rSiA=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr24058765qtf.196.1544029030149;
	Wed, 05 Dec 2018 08:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20181205012446.28018-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20181205012446.28018-1-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Dec 2018 08:56:44 -0800
Message-ID: <CAMKF1sqKNQ5TUEgwr4_M=xtZ0Jyd4cONbKmPyHcdj1+brJV0Qg@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-python][PATCH] python-cryptography-vectors:upgrade to 2.4.1
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
X-List-Received-Date: Wed, 05 Dec 2018 16:57:09 -0000
Content-Type: text/plain; charset="UTF-8"

plrase upgrade py3 version too see
http://errors.yoctoproject.org/Errors/Details/203492/
On Tue, Dec 4, 2018 at 5:22 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade python-cryptography-vectors from 2.3 to 2.4.1
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
>  ...yptography-vectors_2.3.bb => python-cryptography-vectors_2.4.1.bb} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.3.bb => python-cryptography-vectors_2.4.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
> index d1e254b..04173f0 100644
> --- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
> +++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
> @@ -8,8 +8,8 @@ DEPENDS += " \
>      ${PYTHON_PN}-cryptography \
>  "
>
> -SRC_URI[md5sum] = "294d44f32885a6b97d5f9cdd7ffc73a3"
> -SRC_URI[sha256sum] = "356a2ded84ae379e556515eec9b68dd74957651a38465d10605bb9fbae280f15"
> +SRC_URI[md5sum] = "e7f44b1678e3071e2044a32f7c353d14"
> +SRC_URI[sha256sum] = "829d43e8066056de8ea7b8ad311db79e47d8d658e23d5f5fc4b0245a1b3baa74"
>
>  PYPI_PACKAGE = "cryptography_vectors"
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.4.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb
> rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.4.1.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

