Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id BE6EA745D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 16:55:58 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id n32so23010684qte.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 08:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Pj7NVCgitD5rbBTFc1ouMpBf8fu+ApnzxCNhw3GzwCY=;
	b=RcwWquAonvh6JErqxpuuQM/gJFpBEIpCCHADkshil8WYcwkbnJgThnzB46OBpoThgt
	xf0406ojfuzOuduOMzV8ffSCTsJGCLvyWtzdiwBv1d8zcT8LX9SDOs72iWeVlAafHbV2
	f1kRKvtlPh/IsrFWCrUzapn6jefKoM/8Cb7p/OkWTNY7g93JaDzorEAv33WG07VFO37F
	rGUp8d8HvppNmAhrytISgpVSvutEu4KGxPSnflmSpSiOafylAdt329O8xk6jia2tVDis
	c4XrpECZovr4bETgJgkyGjNqtOAhdN7r3EmMCCMYm7hyawTqKT271fDetu9nZi49Q7sv
	EJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Pj7NVCgitD5rbBTFc1ouMpBf8fu+ApnzxCNhw3GzwCY=;
	b=hyBq/0rIaKe+/K279/e5cE5Ykb5r9pQtcZutbqEHpb9fZuKBVmTFOFGgMYkNn3AwcC
	Lr29FCZuQIhussP/WWVC5YsdFz54ci2SjUJXZ+nYKGOhFeyZSzbPS5i0eR/xBryTdQwP
	vg+wrZ9cu+rTx7KLudgeKzfvPtiLVZdSpBmn2i1y5Q4uOoiwcEXA/hPFAx8Q7yaZ8pAj
	wV2fMqEWzzVsG7oonYV16ILJqfBgVJbAxga/jQVz3o84kVw3kFKmcAt4XTHDRKYcrNwG
	robrBuXheEmnKmjoO2K8iJ5mXIpq9SkocwLRERJ0q2n1J8b+iF5vOHl9C9mlndvlHeIG
	8xWQ==
X-Gm-Message-State: AA+aEWbyZTSLtmXBzoOQ9iu5HXnvMhOtYbmbR5CuURl1CTgv0IFVri2T
	2YUSgdZGRv0e47V8nXHjnXZatzCnibSkBDPVWIaBYRHHnMg=
X-Google-Smtp-Source: AFSGD/VUs3ExtPVFfnNhYNt4dNC4PJ1JDklVJNuwJCQ8yNSc/AxzfNoLI+/5NWU9vFZDE9sTOgm4lBDZXpb+oVbXBEU=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr5720985qvq.55.1544028959294; 
	Wed, 05 Dec 2018 08:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20181205012446.28018-1-hongl.fnst@cn.fujitsu.com>
	<20181205012446.28018-2-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20181205012446.28018-2-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Dec 2018 08:55:33 -0800
Message-ID: <CAMKF1soNSAGuEWey2BiEvE0ekDJ6XC2bE8Kyh1OJ6=-L+kS_RA@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-python][PATCH]python-cryptography:upgrade to 2.4
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
X-List-Received-Date: Wed, 05 Dec 2018 16:55:59 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/203490/ plrase upgrade
py3 version too
On Tue, Dec 4, 2018 at 5:23 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade python-cryptography from 2.3 to 2.4
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
>  .../{python-cryptography_2.3.bb => python-cryptography_2.4.1.bb}      | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cryptography_2.3.bb => python-cryptography_2.4.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
> index dbbfe2c..0e53d95 100644
> --- a/meta-python/recipes-devtools/python/python-cryptography.inc
> +++ b/meta-python/recipes-devtools/python/python-cryptography.inc
> @@ -10,8 +10,8 @@ DEPENDS += " \
>      ${PYTHON_PN}-six \
>  "
>
> -SRC_URI[md5sum] = "a0f3f563ab1c5c3bc02fae8d4aa3ad16"
> -SRC_URI[sha256sum] = "c132bab45d4bd0fff1d3fe294d92b0a6eb8404e93337b3127bdec9f21de117e6"
> +SRC_URI[md5sum] = "464f180ff64622760cca7167f97b3ff4"
> +SRC_URI[sha256sum] = "e85b410885addaeb31a867eabcefc9ef4a7e904ad45eac9e60a763a54b244626"
>
>  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-cffi \
> diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.3.bb b/meta-python/recipes-devtools/python/python-cryptography_2.4.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-cryptography_2.3.bb
> rename to meta-python/recipes-devtools/python/python-cryptography_2.4.1.bb
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

