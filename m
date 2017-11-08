Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C4B796E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 19:02:53 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n74so19075906wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Nov 2017 11:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NW6pAdTcsVYvVZS4Xc/G0/4slJG1wKkLvdPytrjRou0=;
	b=f81rLCtjcV0DMMKI7vwKyuyDdt6NDRpJ8m5nD8J5w17A2OKXEYtEI6zmaY1kZEHYrS
	GsYGjcAN0OIXx4WYQN2PfzBWsF84cjJonRD6RCipoXmcfF9B4H8zgvzM9PxifV5FAWtL
	BFBKwwaZF2doGVWtlyCdsxF0w/1qXIwC1CNH8R+ghZpGuHIfQ0hYvV6YiAbDsWVD/Nbj
	cxLfYCka7i6NGt2K1djdQW3+9u3EWWui81r7HxgqBgsibNfD4NyVQzb+2xrNaM6s5UG0
	BSxDxsjWedOe3euLTrTbDxi0bbe2QTs3m7M/H+bVb6hE+q3az541xj3BGn+Wue1dgNn1
	Zi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NW6pAdTcsVYvVZS4Xc/G0/4slJG1wKkLvdPytrjRou0=;
	b=R4GV72BZJCYyrIOiwqAdb1Uo7n8RckviJ4Mc4lC2lHnJ06qTdZfbmkSbAqXZgRO65U
	UNBdev5FfN4uQwknz7feHJOlQJhT7L4QQwYAiO77lJgoqQOCEK84n1bJz8oKZL0g2Nr4
	vtdponDNjReyEgBQwqYzcBZizXhRgPNJnDhG+QGRAJYir0Kz21pE2ahC+wlemKDzs+2P
	QgbRHQtLoDI6h0mDzJoiq1Z/yADg7M4zV4rPccs9337le12zb6k1ev40moFPJvVtsVmT
	d/ug7w6VK8lUd5+v0oHPa4eNusoYGZ9l1KK3n8p6UdJYpiwgTSSRa9IXI+VwD3f8m9QP
	z0AQ==
X-Gm-Message-State: AJaThX4EopMkK4SfmqmRBreJyN3X642QpTpxq5dXhqD/nD9RE9Rvu8CF
	EmDBUX4ozS5671KGehUpyAhDtxVadPqPEleYQX8=
X-Google-Smtp-Source: ABhQp+QVfGEM8EJurrUY5ydSbKb9pJ35BkxXifBlUyywBcnEVhkgDaMdIofrnql96KrZdYqsqXpyM+By+mgEjKVlkBw=
X-Received: by 10.28.93.200 with SMTP id r191mr1129133wmb.141.1510167774309;
	Wed, 08 Nov 2017 11:02:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Wed, 8 Nov 2017 11:02:53 -0800 (PST)
In-Reply-To: <20171105110639.8103-1-dariusz.pelowski@gmail.com>
References: <20171105110639.8103-1-dariusz.pelowski@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Nov 2017 20:02:53 +0100
Message-ID: <CA+chaQduXEtKdXNdO-X3zACkBb_0iR3LZ5xsQh=nnwRmOYO_iQ@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] android-tools: do_unpack_extra task removed
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
X-List-Received-Date: Wed, 08 Nov 2017 19:02:54 -0000
Content-Type: text/plain; charset="UTF-8"

If you care about android-tools then can you please fix also this one:
http://errors.yoctoproject.org/Errors/Details/158219/

it's broken since android-tools were imported from meta-android to meta-oe.

On Sun, Nov 5, 2017 at 12:06 PM, Dariusz Pelowski <
dariusz.pelowski@gmail.com> wrote:

> When user don't have properly configured git user.email and user.name
> compilation fails on do_unpack_extra step when executing "git commit"
> command.
>
> This patch removes whole do_unpack_extra task as it's unusual operation
> for the recipe to remove .git directories and initialize new git repository
> after do_unpack task.
>
> Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> ---
>  .../android-tools/android-tools_5.1.1.r37.bb           | 18
> ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.
> 1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.
> 1.1.r37.bb
> index 75f5b9e26..d3ccd1d06 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> @@ -54,24 +54,6 @@ inherit systemd
>
>  SYSTEMD_SERVICE_${PN} = "android-tools-adbd.service"
>
> -# Get rid of files uneeded to build Android tools
> -do_unpack_extra() {
> -    cd ${S}
> -    rm -rf \
> -      system/core/.git \
> -      system/extras/.git \
> -      hardware/libhardware/.git \
> -      external/libselinux/.git \
> -      build/.git
> -    git init
> -    git add .
> -    git commit -m \
> -      "Initial import - committed ${ANDROID_TAG}"
> -    git clean -fdx
> -}
> -
> -addtask unpack_extra after do_unpack before do_patch
> -
>  # Find libbsd headers during native builds
>  CC_append_class-native = " -I${STAGING_INCDIR}"
>  CC_append_class-nativesdk = " -I${STAGING_INCDIR}"
> --
> 2.14.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

