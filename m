Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 19C4471AD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 19:06:32 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id a43so18196571wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fHtIXgt6VZmKq9ko025c/N+WqM+lPhyCYrZkNgjJ64c=;
	b=jYJzliL3TGMChePrKeg6IZlz0z2ddcuEJn7tDXrjqbNnBnIef2hHEE/cIod0RSeMv/
	SVCYjk168wjIqWnlh+Jv26U5/Urwh9YCibwYhJnVVy8hoXIfVR+mh8LXVdJlcFsYG5+l
	TxRAqkh1oZWORlcH2kW07+6u0RnZ1larXzwPALi0tl+qnoSZT4PwPCILJq/39z63FAtD
	j+gzT6UueLA1eY5Lqx7w7HDGsjhy9WyoF/VnV3Ld2VwvHuKAU1uwer0/7nSq+tx3wY30
	YOdBI2Qfkwl9Tn4gd2uUeSmLNBCuViUOw2QKTRpLjKzep24g+cgPgXXubZh/hy+7IrAn
	HuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fHtIXgt6VZmKq9ko025c/N+WqM+lPhyCYrZkNgjJ64c=;
	b=QINu2iy1aO7ed3g4gTLsU7F3uDpHuuTIhCZW6bS1tp3HxrKqokYFe1TY4OIB9Ox0NJ
	iZrxbomYHEQncZFpOXGW/U2Vj+2De45fLGqktSRTN6geXh8HRnImed9b/MZZ5vMP/6yS
	ZXAWg+uknuGX1U8pwcpYehMq2MaGq3Z04zD85WGpTSyOAONEMi9jG0N/Ivi6/dpf3ZYX
	+6LSpovUWYpL79mX+FBGqq1yj39lo8Yb43P6oC0DRWXsVvbNfJGjRYQCNaGiGzH0Ixtj
	N22ewATIHzVa3oPgW8sRclEZf8DVAEOairHB7qk1jct/JZ1weFB69sELuLHJQHMKZNti
	A6Gw==
X-Gm-Message-State: AHPjjUifzGiXg/1pSGby/h+Mw3/v2BiwJuiJV+Uq3UH0PNsQy9G2RCVU
	rWJoYi0pCJTDGlSbLfio3RIARLd6d3Bbo0EkX1I=
X-Google-Smtp-Source: AOwi7QAtQVh/zNiDOLMwNrk82z7augPyVocqB9AHQO4NoyXYq27iYFWycgur48z/XgKLwqCfafE0JedGNOGpYmom9N8=
X-Received: by 10.223.164.153 with SMTP id g25mr2574804wrb.67.1506539193867;
	Wed, 27 Sep 2017 12:06:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Wed, 27 Sep 2017 12:06:33 -0700 (PDT)
In-Reply-To: <20170922182133.36154-1-raj.khem@gmail.com>
References: <20170922182133.36154-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Sep 2017 21:06:33 +0200
Message-ID: <CA+chaQfBE3Zm7equpeU3eb6d-bKgdHCP-szJ3xaH0h6U5_ppwg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2] mongodb: Pass computed endian variable
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
X-List-Received-Date: Wed, 27 Sep 2017 19:06:33 -0000
Content-Type: text/plain; charset="UTF-8"

Seems to cause following build failure:
http://errors.yoctoproject.org/Errors/Details/156585/

On Fri, Sep 22, 2017 at 8:21 PM, Khem Raj <raj.khem@gmail.com> wrote:

> If not passed to SCon, it will try to guess it
> and do it by poking at build host, which wont
> work in cross environment
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes in V2: Use SITEINFO_ENDIANNESS
>
>  meta-oe/recipes-support/mongodb/mongodb_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> index d44d8d3c7..418d447d7 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -58,6 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
>                   --use-system-zlib \
>                   --js-engine=none \
>                   --nostrip \
> +                 --endian=${@base_conditional('SITEINFO_ENDIANNESS',
> 'le', 'little', 'big', d)} \
>                   ${PACKAGECONFIG_CONFARGS} \
>                   mongod mongos"
>
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

