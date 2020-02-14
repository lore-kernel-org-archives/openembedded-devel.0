Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2625B6100E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 01:48:09 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c20so7771817qkm.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 17:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xutVAUzL7N2LT6gEEx6gpziuiYmmXu5/XbB9b4pbzoA=;
	b=pb8AvK5FfrfqOzq3SotzIAYwP6rgnbL96KHH72BVwHz2+k5SaIT6aS/h7S0CJ2PCNj
	UgWnGjpheobQfkz1/PzktiajtNgzqcMV2gVejIQzdxWrUEu/sq+KseY/a5CltGY8g3cu
	G0TXTCGq+FEWPh5wPpmJ5Q958iYCK5LXr2m1nT5jzrIn/Uc27y3IFXNzmes6QV4o2aCE
	gunzUcNCEkocDgLuD70dMRAV5rrxO0oYwXsXGPkQRobWnvMkrrwYH4ctN6oY2IHX7ulG
	d5oQXuwzV/GwfEoU5maj17znpHKT9n1FUZ6tLx3vflEtlwZqhr4AZ7h78OiA5FLU1BNV
	76kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xutVAUzL7N2LT6gEEx6gpziuiYmmXu5/XbB9b4pbzoA=;
	b=HZ3RZPSPLCumSnONLeL/DI2W9nR1j7PxeQiOkypCbIGG1e8SIeuPBA3OlxQcLJ2fD5
	xGWmNVWgNIHZI4rQEjgHxZ9sgIrWT4eP1bdcTTedsL4maCwhgDJ9ujrXABlGBR3buOQJ
	Io9IFFaDp42mykiWKcEgB8SrvquYbACgF0sDn7pvvSrF7YRfFtePvk7bmtDKEhNNwkN9
	LX9hkfa+SgcD4c/iQ0hi14CkwsR2fmclnMNU9GwoEyA57zoZjOUMorvD218JsOzMqK7C
	J0LrFvYyx0O4WJ+PL9PJf3OdOeaJaUP4wcjJZD+k/4Gpe5vJT8SU5hSvNB84naQ4U7hE
	kiHA==
X-Gm-Message-State: APjAAAWf+vnPcBmp+hg1TA8og1Kv/hAD/59uwfl+xBak4E8q3rg6pdGA
	+nQvTbwOtewuq6FpLNYzAkIqXn/ujuAi8PZtXuM=
X-Google-Smtp-Source: APXvYqzLR2zPpvSv9DeeEAiWgCY6VnjDUBUZifjD1tjx4N2siv1eBnYEa0ftqTmQip8ida38w2OUkFQHXqNifHXlZYU=
X-Received: by 2002:ae9:e88e:: with SMTP id a136mr412731qkg.71.1581644889812; 
	Thu, 13 Feb 2020 17:48:09 -0800 (PST)
MIME-Version: 1.0
References: <20200213193536.23301-1-scott.branden@broadcom.com>
In-Reply-To: <20200213193536.23301-1-scott.branden@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 17:47:43 -0800
Message-ID: <CAMKF1srKAWjN9OzU0-37wD+33U8d7wRVmY_PYtDRWGjQJt675g@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] x265: add x265 recipe
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
X-List-Received-Date: Fri, 14 Feb 2020 01:48:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 11:36 AM Scott Branden via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
>
> Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).
>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../recipes-multimedia/x265/x265_3.2.1.bb     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
>
> diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> new file mode 100644
> index 0000000000..68c1a55c8c
> --- /dev/null
> +++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "H.265/HEVC video encoder"
> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
> +
> +LICENSE = "GPLv2"
> +LICENSE_FLAGS = "commercial"
> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
> +
> +DEPENDS = "nasm-native gnutls zlib libpcre"
> +
> +SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
> +
> +S = "${WORKDIR}/x265_${PV}/source"
> +
> +SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
> +SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
> +
> +inherit lib_package pkgconfig cmake
> +
> +AS[unexport] = "1"
> +
> +COMPATIBLE_MACHINE = "^$"
> +COMPATIBLE_MACHINE_x86 = ".*"
> +COMPATIBLE_MACHINE_x86-64 = ".*"

perhaps better to use COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

