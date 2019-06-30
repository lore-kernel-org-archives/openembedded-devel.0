Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8397D6D61B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jun 2019 04:03:59 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id r6so8447163qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2019 21:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=89Lc4UmAxWpD3sQzXMBi7Y7x4SJlatxnmzTEleXfZ4M=;
	b=hkF0DzXyVQ5KbNBjT6caQC04J+YahDCoy5m+F+GvWIj8WHWb2XIiBUw2tLWjo4sY0P
	PSDboR+M9aKfeUaH267VYPFvb19Hd0s+1zKOwBq9ylhzDptHVK36HUiEWajnFwyDvA88
	xbs5KCaMPupr2mOFghFiDo8eQl8ksD+A7c0RtDxWa/0Wbg+TfpmSGKOtc2/pDC5hTjfB
	DRRk3IHtd8sz9KoZ8AvJ3YXIiFVJObJb/MyasP8bZ/wHefzvaAu7DlkD/vkDrIUgWsYc
	ojVFFtPujFCBO0+UmceqNRzdGgL9VKa0AP2gJmqRwROWrcvBVk2r664nNGGsjuLCypwb
	cO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=89Lc4UmAxWpD3sQzXMBi7Y7x4SJlatxnmzTEleXfZ4M=;
	b=m2cQgYUxZNaE7+ilKqbqwEtgQRQVdVVAKsXRKA7/fi/JdmYT7mY4eoR67eDLqATzfR
	6mr5apwfM8cWRbx2E2Q7zaF0yuqLPC01AtLEx2grBdIX+K2ZUG5w597k6i8qxvJXx1s2
	7gI5wcuezbzAGa3yirDJnsetMvqo1PCqYJpHrU0tCJgeVZmferyHw11lK/dsUJsPPS/s
	UvjO6+ui/QtfD/Tn8kjrOwmcvM2N0oydiON49mcJJVYPeTMeVo3KSZFQn8m17GX4aD9B
	S9jpVjoFkPTjfwiufc6wXhYj/7KIWfxsgs/9UTziXQqiD1DlYtW/P6zTkDSSJBYl2jQb
	qSQA==
X-Gm-Message-State: APjAAAVypJEaIGqF86mRQbU7+U5z0B2clM9Dnpgy9KBLBWpIcTiQAHgo
	UJ9G5VHQKwYew5kJY/xNhHqQ7FXteScS4pQ4BFE=
X-Google-Smtp-Source: APXvYqwNsc21KVCOn8NFkSIhhHDCwjg77V+vDQ1kPShqYkBY0V55aNOl3axxCpzvrCyLCZ9kLfBKQMyubv4jV5JzmuY=
X-Received: by 2002:a37:7083:: with SMTP id l125mr14719307qkc.71.1561867440231;
	Sat, 29 Jun 2019 21:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190624062213.334-1-douglas.royds@taitradio.com>
In-Reply-To: <20190624062213.334-1-douglas.royds@taitradio.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Jun 2019 00:03:34 -0400
Message-ID: <CAMKF1sqTjcvB1QDRuV6XRK70GjsyQwprLhBYm8P=mxDTLZHwow@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] googletest: The gtest and gmock projects were combined under googletest in 2015
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
X-List-Received-Date: Sun, 30 Jun 2019 04:03:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 2:31 AM Douglas Royds via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
>
> PROVIDES gmock and gtest for backwards-compatibility with existing DEPENDS.
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  .../{gtest/gtest_1.8.1.bb => googletest/googletest_1.8.1.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-test/{gtest/gtest_1.8.1.bb => googletest/googletest_1.8.1.bb} (95%)
>
> diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.1.bb b/meta-oe/recipes-test/googletest/googletest_1.8.1.bb
> similarity index 95%
> rename from meta-oe/recipes-test/gtest/gtest_1.8.1.bb
> rename to meta-oe/recipes-test/googletest/googletest_1.8.1.bb

this is ok in general but please change the entries in packagegroups
as well and rename them from gtest -> googletest
e.g see meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

> index 6e7ab92e5..362d69ff9 100644
> --- a/meta-oe/recipes-test/gtest/gtest_1.8.1.bb
> +++ b/meta-oe/recipes-test/googletest/googletest_1.8.1.bb
> @@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://googlemock/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a \
>                      file://googletest/LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
>
> -PROVIDES += "gmock"
> +PROVIDES += "gmock gtest"
>
>  S = "${WORKDIR}/git"
>  SRCREV = "2fe3bd994b3189899d93f1d5a881e725e046fdc2"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

