Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 264D277A62
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 15:24:11 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id 85so151633ith.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2017 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WWndw8d+kWrwWD852V3R71oP7UDhccZk0OHlC9Qo8Q0=;
	b=i4EqjhTNL6a+AFTjCVlgIugyKCNFDGj1sPNxKYyiJlmwSUSn5OHQDkUrnsJgszHCdv
	CZFFqmvE3BryTrC+wnpyccLi8sfID+ayp3FnunNgdq+ykYHuWD9Kjlz2jHrV6gIaqvUf
	ISP9xCm/B7zZbexYiuTQDsXXmORKNmYa92BOJZr8UPltMsowsilz+SaPqwEL5L18dcnA
	mx7Ho35iDvQLoeROZ4wtB+xT3Ce3LzIHnTjl9MmftmwtvvMW23vMFWrr+9uXb2l/Fg+i
	hS+O+D9Qj3/T22Kf67IIUjsSU55kLmOtg8eQO25Wvd7Ej/D9z5TsVG2WH7rJ/J7Sf8Zq
	9MMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WWndw8d+kWrwWD852V3R71oP7UDhccZk0OHlC9Qo8Q0=;
	b=IWzQFnCfO96QpEHO18KT7IZdxrX8fDjgGq5mas6UNwVIVigqicjCWN0vm80X0vSqiC
	LZsiOZ7s7ZuoEZb44ZDwm5/0Llm3W3aDQKRH3UFi+9CRp+YqL2WJ69pkkoM6hYpLhy/P
	AW0F95ukQqclBfhU99wkZvqGfJVKUp8DWCiyiuehjkUB013GRzwiUwuG4vHO54Sv5F7G
	wHekThIPOSAxUj/VzdJSsejrsowbVRh9vR9PiGmgOp1M5+EiHawiMMmUXD0X2oVam2Rc
	5liVWgHlHTSP6Ps03t6F50+tZxyB+6WO4Jbqv5lsRwCGWOPQmsD7v0PMeNx9S9Pp06TY
	mYCw==
X-Gm-Message-State: AHPjjUibchatu+hx0yOaxjW94BmETBXHDm6+G42MC6b1LctWCYPcOH0n
	bJc5jNS8UDgmpGBqdFAqzkq6eVUKirsd1UFsRBeKxQ==
X-Google-Smtp-Source: AOwi7QATLGrGDlKkrlqCzEDsRgQ0dO95aBopDaJmO0mLh9IWGEjsIB+C4HOZUFe6H7DsaSYDgTlBaQHcQjT4JFXc9Zw=
X-Received: by 10.36.26.87 with SMTP id 84mr7602593iti.38.1506698652393; Fri,
	29 Sep 2017 08:24:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 29 Sep 2017 08:23:51 -0700 (PDT)
In-Reply-To: <1506697932-26778-1-git-send-email-pascal.bach@siemens.com>
References: <1506697932-26778-1-git-send-email-pascal.bach@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Sep 2017 16:23:51 +0100
Message-ID: <CAJTo0LYm6XzboyicUgqana0FvHVwJJ7yasZWAxMBEPWfxyMCrg@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-mono][PATCHv2] libgdiplus: use tarball from mono project instead of github
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
X-List-Received-Date: Fri, 29 Sep 2017 15:24:12 -0000
Content-Type: text/plain; charset="UTF-8"

The checksums didn't change?  Are you sure that bitbake wasn't finding the
tarballs you'd downloaded with v1 of this patch and using those (as the
checksums are only validated at fetch, not unpack).

(I guess its possible that the release tarballs were github /archive/
tarballs uploaded, but I'd be surprised)

Ross

On 29 September 2017 at 16:12, Pascal Bach <pascal.bach@siemens.com> wrote:

> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-mono/libgdiplus/libgdiplus-native_4.2.bb | 3 +--
>  recipes-mono/libgdiplus/libgdiplus_4.2.bb        | 6 +++---
>  2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
> b/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
> index 4dee6a0..e169105 100644
> --- a/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
> +++ b/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
> @@ -6,8 +6,7 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fe7364dfce9f3689eb6995e7cdd56879"
>
> -SRC_URI = "https://github.com/mono/libgdiplus/archive/${PV}.tar.gz \
> -       "
> +SRC_URI = "https://download.mono-project.com/sources/
> libgdiplus/libgdiplus-${PV}.tar.gz"
>
>  inherit autotools pkgconfig native
>
> diff --git a/recipes-mono/libgdiplus/libgdiplus_4.2.bb
> b/recipes-mono/libgdiplus/libgdiplus_4.2.bb
> index 00eb406..6fb4988 100644
> --- a/recipes-mono/libgdiplus/libgdiplus_4.2.bb
> +++ b/recipes-mono/libgdiplus/libgdiplus_4.2.bb
> @@ -12,9 +12,9 @@ PACKAGECONFIG[tiff] = "--with-libtiff,--without-
> libtiff,tiff"
>  PACKAGECONFIG[gif] = "--with-libgif,--without-libgif,giflib"
>  PACKAGECONFIG[exif] = "--with-libexif,--without-libexif,libexif"
>
> -SRC_URI = "https://github.com/mono/libgdiplus/archive/${PV}.tar.gz \
> -          file://01-remove-libjpeg-path.patch \
> -       "
> +SRC_URI = "https://download.mono-project.com/sources/
> libgdiplus/libgdiplus-${PV}.tar.gz \
> +           file://01-remove-libjpeg-path.patch \
> +          "
>
>  inherit autotools pkgconfig
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

