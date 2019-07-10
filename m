Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 04B2D7EF4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 16:28:17 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m14so2345896qka.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 09:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WEXHl7cRfKTC8hgbZ9BLYT2SSxG2fwoMuiMutdRGe9o=;
	b=ovhk7M0erWl3jSw+rygekOuHyl+08V1vCUirMDxDKIcxg1ntu0x/7t70MacYHHJOEh
	k7QV1903FHJLKpVjBIvTCsJmvbgH/vwrZwC14qlkgpuyfsR/oKRswWcbqRIcJM087MeH
	h/hjn+InZIucoFndgNTCIx2nCJEdB5cf+d0csYI82nU4I3oQ5aDVMR32asWtO0QrmEJl
	uQtnl+YLR3rwmC6EMXCYMdojpSt4BCDWS5VF06sAg9Z+APKrbl55ItV9qexQ8ZxLxuD7
	9jzczptNPfmydUAPd99pWQGIjmXQNFFIc6kJWVBYXzLqiUQl6TIzz8ZJDhq45itZTwH8
	qwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WEXHl7cRfKTC8hgbZ9BLYT2SSxG2fwoMuiMutdRGe9o=;
	b=XjW24FH5NJPwK14jTUDJpGnGbLbRtHAj6N6S03rILQZ057Zowzp6KT0l3v9i5skMk+
	AWnoLzVkCn0Zi6mZVAlpu+y9i13LDsfqipQEYq7eePTBtg4ak3Qk+ZfvaCVuN+/MSJ/H
	EwbCsYgD/BAZPael+1O5Zzt/j7kNlicZj/utmU+3M3dfstJR3L01T82otVN2CVXMalMz
	MEaWtPU9E5OEsBrDdZkh6V4SNbsXxJ43PYNR90tZl7Esj0ncDzygzJyFmHDp8ncYW6QH
	No1kNfY7djfOlp7ivh1Ej1rpkMrid67aZQSg1OIa0lxH9kIXMUBArIrGt7T7mU1CRs6j
	iWaA==
X-Gm-Message-State: APjAAAXGKvQFc5CzwXSR8yyIJOLAOt+XMsexHYcOyv0pYhAxjQSDs9Y7
	vEbI1pd9+xfVJJvBY5JQnuwUCk2ro0ll3AC08wHUwjfrEBM=
X-Google-Smtp-Source: APXvYqzLN9I/z3kW/PCKtqyK5pG4i1p5GFzOxzPysF1TRF/UlVJeQh/WSpIR7kSOyxt5swyMW8deZcTxou23HIDR38c=
X-Received: by 2002:a37:7083:: with SMTP id l125mr23602513qkc.71.1562776098747;
	Wed, 10 Jul 2019 09:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562675891.git.paul.eggleton@linux.intel.com>
	<11d497c0ecd5157b41e0a5e2c24d1778e6bdab63.1562675891.git.paul.eggleton@linux.intel.com>
In-Reply-To: <11d497c0ecd5157b41e0a5e2c24d1778e6bdab63.1562675891.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jul 2019 09:27:52 -0700
Message-ID: <CAMKF1sqoimXah8dJ9Z4s5eJNzPn2Jj-8Z_bN0_iFsEm8tD+E3Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] picocom: update to 3.1
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
X-List-Received-Date: Wed, 10 Jul 2019 16:28:18 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Paul

This fails to build on musl

see
https://errors.yoctoproject.org/Errors/Details/251294/

I think we need a fix similar to this one
https://github.com/serialport/node-serialport/commit/02e2bfecf0b32037121abb5bc2925dcb83785934

can you try it out and send a v2 if it works ?

On Tue, Jul 9, 2019 at 5:39 AM Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> There have been a couple of releases since we last upgraded, including
> a number of additional features. Changelog is here:
>
>   https://github.com/npat-efault/picocom/releases
>
> Also tweak SUMMARY - I don't think this has been 20k in a while; with
> this upgrade the binary alone went from 60k to 70k.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-support/picocom/picocom_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/recipes-support/picocom/picocom_git.bb
> index e091094cf4..0d65453b7c 100644
> --- a/meta-oe/recipes-support/picocom/picocom_git.bb
> +++ b/meta-oe/recipes-support/picocom/picocom_git.bb
> @@ -1,13 +1,13 @@
> -SUMMARY = "Lightweight and minimal (~20K) dumb-terminal emulation program"
> +SUMMARY = "Lightweight and minimal dumb-terminal emulation program"
>  SECTION = "console/utils"
>  LICENSE = "GPLv2+"
> -HOMEPAGE = "http://code.google.com/p/picocom/"
> +HOMEPAGE = "https://github.com/npat-efault/picocom"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000e4830620e310fe65c0eb69df9e8a"
>
> -BASEPV = "2.2"
> +BASEPV = "3.1"
>  PV = "${BASEPV}+git${SRCPV}"
>
> -SRCREV = "deffd18c24145bd6f965f44e735a50b65810ccdc"
> +SRCREV = "90385aabe2b51f39fa130627d46b377569f82d4a"
>
>  SRC_URI = "git://github.com/npat-efault/picocom"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

