Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id A5E187D785
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 00:39:27 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id k2so957578qtm.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 17:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CJQIApilXOBPKKKuEkkF02ZqLrgh5eRlGw/7yjJ+uTg=;
	b=f18LkgfW730JvGEt5U/6YBsZFu/+JhXnl8cao1mIWaTSF0B6nth3HTPf60uBW9YGn/
	1vJmHDtgBBEhFE7zgjEG7GeHz450CtP42mAhNNNxnBRvqHvDzua4cZ7EKpLwO+uuKRmN
	iqzfXRL7PLD9tMdDrZ9BKj2kNYPk6O87GAa8ddWi/6qcsc3ZFHAKY9zMDXBi403vJbZq
	J0yQSieeuPEx0zWlhtpOWHH2Rk3kltx6YQI6Mwrv5VRKcf/1ahjYcJ0fK0JYDM2zqEwg
	2HG2I6fEVK0DOT0Q1p6w6B/wmC6f6+GR2Eu8UsWKIaVbIVBmUfsnmHxKQ/Xn2HdzefVY
	mLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CJQIApilXOBPKKKuEkkF02ZqLrgh5eRlGw/7yjJ+uTg=;
	b=hmFqhARKhSNk8cQm8l29opi/ZXNfwmRd1rUiSo0LsIu3q/Uitfn4KttMskuNQ6iUnA
	P2RpH6QU/LbcSURzVR4BOArVuLzolxcTQsUwv2gR1MMjgb8TuT/Chm1kESmSvaxf+XZr
	NkiTTZeWNxo8mLc+cEvyunA0BTUzAnSmaLtg2mgF321JfcIKWQdoezI5rHc3LdUNzbR1
	tOkhyWXxgOVzOuGD3afZLpG5ATTNDQB+WUguJjiz8vlpE+c6iie+sb8gaVrLLZ6vOSI2
	4bzB4aq38BEGzv6qgaEDHQzZQ82gnMw7KTBsWLMcKc1O/J3fM3tpm9zSBcoEIT3AKcwF
	vOuA==
X-Gm-Message-State: APjAAAWwsqkdRHr1Th7KfsV2H9Odfoj2IlQ2cYF+zP1NMRTqSN5V7Scd
	hkGSrxsAvK+0gu26l9mr1DO2ZX4K2Xmhhq1py5mTnINuA+E=
X-Google-Smtp-Source: APXvYqyDUyVkgW5ACH61pMr5y8v3Y/GHEX36rCU1GKoKxZ3rxylQCUunmH9d4qc6lR8B94JC4IBrXLz66UdBqE/P/Uw=
X-Received: by 2002:ac8:262c:: with SMTP id u41mr34285081qtu.198.1554856768082;
	Tue, 09 Apr 2019 17:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190407130935.10670-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190407130935.10670-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Apr 2019 17:39:07 -0700
Message-ID: <CAMKF1spjoZeXitjwgFgr882ab+6WjN+C7-DT7K6Hh9YvtWPUFQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] libowfat: update to 0.32
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
X-List-Received-Date: Wed, 10 Apr 2019 00:39:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 7, 2019 at 6:09 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../ncp/{libowfat_0.31.bb => libowfat_0.32.bb}                | 4 ++--

This is causing ncp build failure

| ncp.c:8:10: fatal error: 'dns.h' file not found
| #include "dns.h"
|          ^~~~~~~
| 1 error generated.
| make: *** [<builtin>: ncp.o] Error 1
| make: *** Waiting for unfinished jobs....

Can you check why dns.h can't be found ?

>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/ncp/{libowfat_0.31.bb => libowfat_0.32.bb} (84%)
>
> diff --git a/meta-networking/recipes-support/ncp/libowfat_0.31.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
> similarity index 84%
> rename from meta-networking/recipes-support/ncp/libowfat_0.31.bb
> rename to meta-networking/recipes-support/ncp/libowfat_0.32.bb
> index 4b072f7e7..fba35526d 100644
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
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

