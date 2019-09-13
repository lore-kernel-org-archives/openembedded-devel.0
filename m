Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id A937F7E993
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 16:20:50 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id v11so34498630qto.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 09:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0eFuOhQ4fnLIKYvCeYQvRIr27syXYNedOq4TjJXB0Dw=;
	b=lgyR8PcnCBP0mf/oJdMzqY1bzNQEMh6Kln3n/glbrfvjIGOZx/NueDDjzvIk/dr7Te
	UySGOw0rXjQNOyKk1PjRcRplB/tprHWUOuLqAmdMCUO3CpkgWuXtrjO7V2cpbOvrVBI2
	7lvjA/ZApewm/CyAPooPjTNEeje9hMy0oNfpLNne+l1OaBnbTY3WOMx5jTvrc+t+uTXE
	ogxcL6LRjx//lE2Uq6tW7v/zCQh4BUHMhSFsZwQ7phrG48Lt1GFh9RZTyEME9WZyIM13
	2tp/FIlXX5RGnfB1sP2rr94i8HArrCicnqp2FkUVteNTinD6onugMpNeBjAUSR5k3w5/
	IkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0eFuOhQ4fnLIKYvCeYQvRIr27syXYNedOq4TjJXB0Dw=;
	b=cJa6cn955tva4dLfauU+8SRwUdMsgZhHarlouYf5Pi7p6X8LAsYKj2u3/I54Gu4Cpl
	2FnqELNkTTLxAy2LRuX/I5AKfWb6OurFqMOdUtO7sF4HBEz4rNFFJzjWOFRRVuqnyrTO
	LVXvvLJh3ioI3x0x6TjEGL8KYeFMbImp5y22ZTTgGePSgUwxd+xWD1LsoEi1TAXQZyqd
	B7lOksjrPNE8xeGkp/0dV1DsUotcjbmhNj2KR6XmlM3dOlR+69TNhyAMiXHWxaBiW4HO
	vKQlLpkkX3iFuPfDRIWUxhx8T9d7JmXiqaTCK2Xf7YvvOVk+l+8mILg8T3jrYmovWzyw
	19Vw==
X-Gm-Message-State: APjAAAVTmcVIStsnZNe1ijV55MVr2dXr/c4DJGPWbRsZqFibgr1EeaEV
	Zd5S6COJLrecSpC1wIffoty7ClV1wZ/OmN+C8RvZ871/lmk=
X-Google-Smtp-Source: APXvYqzBJbjt68eEqC942RCHV67yxtYnzIsbwhafA7VKp5Uy/ODF4utb37GxtL+wES/zgL5xUVAcbDTC4itEgotfWUU=
X-Received: by 2002:aed:3c52:: with SMTP id u18mr3906529qte.194.1568391651241; 
	Fri, 13 Sep 2019 09:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190912223713.26895-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190912223713.26895-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 09:20:25 -0700
Message-ID: <CAMKF1sqWfURSkMxAmENpxMqgYLn_gamUGbMnpZ57z3O0GHOE2w@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] pcsc-lite: update to 1.8.25
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
X-List-Received-Date: Fri, 13 Sep 2019 16:20:51 -0000
Content-Type: text/plain; charset="UTF-8"

I think we need to use systemd distro feature to control libsystemd
use see https://errors.yoctoproject.org/Errors/Details/270186/

On Thu, Sep 12, 2019 at 3:37 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> License checksum was changed due to removed license info about remove
> code (see @0984e0f4a03e5e29bb5725b6f149f56c9e9c73c2).
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../pcsc-lite/{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb} | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb} (86%)
>
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
> similarity index 86%
> rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
> index 10f724e6c..1c764f7eb 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
> @@ -8,13 +8,12 @@ LICENSE_${PN}-dev = "BSD"
>  LICENSE_${PN}-dbg = "BSD & GPLv3+"
>  LICENSE_${PN}-spy = "GPLv3+"
>  LICENSE_${PN}-spy-dev = "GPLv3+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
>  DEPENDS = "udev"
>
>  SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
> -SRC_URI[sha256sum] = "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
> -
> +SRC_URI[md5sum] = "c20650a36062ab1689f37f3302c988f2"
> +SRC_URI[sha256sum] = "d76d79edc31cf76e782b9f697420d3defbcc91778c3c650658086a1b748e8792"
>
>  inherit autotools systemd pkgconfig
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

