Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id AD4E57E133
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 05:23:10 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k24so19087555qtq.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 22:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3xO4lBYydySoM61zsneYEbw6zJHZHyO+NLeOgLdtQZU=;
	b=qXhN3qtMUnz6+oqUJ1xnZWDerUpYZwgFKAsGxZnRtBXhyZhnK6CbBwSQ+LyQMySMDJ
	sJtmjS32Qa5AFIaGr+OXagClzae4pZ9gKaVeX3AcCQt/kD7pnF3D79ZKdVKUasP8c3Wk
	cFe9CAM8q1dgBE2q0ctgzHEecYHzx/dlXh4OYYIu8K4sALO50oxGf7BZKHsMtqfOD0Zj
	fwggVPnbL0heL+tm3ovil8ag86uasWy31HSe2/atg0m2nZCkka+oeQ0M9YwPvMb6JrQ3
	m3dXtl6fDdVoX+4m+e/MovAvWqM+QE16Q3uI+4TmZxQaWR3iOwU69wJ+/Yu4lKkw3Qdk
	tYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3xO4lBYydySoM61zsneYEbw6zJHZHyO+NLeOgLdtQZU=;
	b=ikJBJa+h9/sq/gyuzQVsD8PjQTTtaWiXlg9xnsQyXH9q7M6xU2BsyLJUMsUKszPQQA
	845cN8Soct2rU5bA3ZJeiXZlQlNLSBSiGUQCOzDIF2KUIqfyN4Af7QloXCGGgu8aSKuC
	M8bqN+hRMUxR+oF/ECF4R3jE2kOQVTkaSyRaYvGzZ6zWSzfV26611TbPCdk9uxvqy0w+
	EMWgrfZ1a430iL+E1gBaw+NyWQX7yO6MoDYr8+eYsV4OHzNW/nDVHSlutWI1z+RKb10G
	H8AB9LRzCkpItfvlVuwo8cey6T7e3RjRnQhv4MZhc+PS7HUGkjSyLq7YmAlkix5wa3zB
	yy0w==
X-Gm-Message-State: APjAAAUnd+4RN0CPaRTbeQSoHoE+spi4MT7w40ySositwx7dtcBqbSmQ
	0lwyE8yZim2ycmVfG5Z0UV1SFDI6KKYH6jchRS4=
X-Google-Smtp-Source: APXvYqxyCj6+V2k7M8KxkArUJn/ebmXwsldJFq3fJEQivp8oEISyJgVQAFhwK4Px2X4+JLWDUG7I0mUE1ecZcPUUkvA=
X-Received: by 2002:aed:23a8:: with SMTP id j37mr27951542qtc.53.1558416191437; 
	Mon, 20 May 2019 22:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190519153935.15357-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190519153935.15357-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2019 22:22:45 -0700
Message-ID: <CAMKF1spg0FiC+wNY2QCxqvEau5pjPyA3YaSNN3pBuYR2tifDFg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2][meta-networking] libowfat: update to 0.32
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
X-List-Received-Date: Tue, 21 May 2019 05:23:10 -0000
Content-Type: text/plain; charset="UTF-8"

Fails on musl

https://errors.yoctoproject.org/Errors/Details/241414/

On Sun, May 19, 2019 at 8:40 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../ncp/{libowfat_0.31.bb => libowfat_0.32.bb}              | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-support/ncp/{libowfat_0.31.bb => libowfat_0.32.bb} (80%)
>
> diff --git a/meta-networking/recipes-support/ncp/libowfat_0.31.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
> similarity index 80%
> rename from meta-networking/recipes-support/ncp/libowfat_0.31.bb
> rename to meta-networking/recipes-support/ncp/libowfat_0.32.bb
> index 4b072f7e7..a5e2c21cf 100644
> --- a/meta-networking/recipes-support/ncp/libowfat_0.31.bb
> +++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
> @@ -7,8 +7,8 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
>  SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz"
> -SRC_URI[md5sum] = "120798fab86cfd72dc6b12284d248dd0"
> -SRC_URI[sha256sum] = "d1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12"
> +SRC_URI[md5sum] = "ee015ccf45cb2bc61c942642038c2bdc"
> +SRC_URI[sha256sum] = "f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"
>
>  EXTRA_OEMAKE = "\
>      DIET= \
> @@ -19,7 +19,7 @@ EXTRA_OEMAKE = "\
>  do_install() {
>      make install \
>          DESTDIR=${D} \
> -        INCLUDEDIR=${includedir}/${BPN} \
> +        INCLUDEDIR=${includedir} \
>          LIBDIR=${libdir} \
>          MAN3DIR=${mandir}/man3
>  }
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

