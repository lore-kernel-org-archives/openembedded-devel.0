Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5E0817E271
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 09:15:34 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z24so1618410qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V3tFnpB/LKX94lH/Pf6qNq4XZBvryX1DPXnxioqMbAU=;
	b=cyVFvm9FwYt+A4fbA/OlaYUxFYOuR7q9dFN7GbfomaWvBqTDndboBrwYS8mS5PExMR
	+sDZU1qtzqc3qe/q4nyHeWsR5Z8JHB+TCgklZdZ/r06XAf6PfkMGzeMHO8R6mDuguarI
	d3vOurjbgXWySeI0Us5S2AH59i9BIS6SnwOF8X0WVH7hpKrsXBHwmp13t6f+5T0BylLB
	VtuvIPDWOAxmrb9wu7fajiPHaJG05N9ev00KE6iKodqmZlZQk5DE3RU3e/2UBTBXmhPo
	D2jPyVPYk8EXEH9T5+/zdOqc9u0t67+jtnIBWt9XckozJ4Y/meRXVdRwMFo1YTxxDfvF
	WhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V3tFnpB/LKX94lH/Pf6qNq4XZBvryX1DPXnxioqMbAU=;
	b=i54Ln6jGTLO3YAHLelamZ/pGDQnlaaU9I5IqS+t97FTtEIpAg72VtSOxCzpb7o6/j1
	lBb+s33ExhoyVEdCP0DIMOG+z3El1Pc3F6ij10yiLAmKTw0ZCa0edguIVo4lS942ve2x
	L/MQT5Gshbr4+NzTcyfHTlwV87/d5dhe/JwqV8NtI11tiyQ/Jjj4LOTAc/jz+ytgoqG6
	5/l6g1wP8IkOKiVhDjbgbGQCRkz33aEXHuzrAd+DOwRKupSb2gLmV8Doy/OgyCYRObm6
	jrZ13449RM2bHWH9SjirpQESvU0AZunACJsyx0x8YHzxj2ZrduTwrXS+sC1vVu1/4n4S
	ETNw==
X-Gm-Message-State: APjAAAWW07UNyHIKWx6byQUj7gbF8knY6pDWXCrLErUCAg9yAbyIsp6X
	Z5PYY9Z2msaqaVepmClUzQy6ggw9uuzA/B5CFDs=
X-Google-Smtp-Source: APXvYqz4nSWGGm27ilksKjxjAwedDXPGJtRPZ22Z91qm4MZM6oP3/Y6xPMnukGfWbOwJ6I9+OnQEhZD4F040zQDgd+Y=
X-Received: by 2002:a0c:876c:: with SMTP id 41mr83402414qvi.175.1559121334880; 
	Wed, 29 May 2019 02:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190529084806.13342-1-ankit.tarot@gmail.com>
In-Reply-To: <20190529084806.13342-1-ankit.tarot@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2019 11:15:08 +0200
Message-ID: <CAMKF1soiTZwgAQM3-RD6PttxUJw88rLqpvomL-0j9X1sCJn9qQ@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] safec: Initial recipe for safe C library
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
X-List-Received-Date: Wed, 29 May 2019 09:15:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 29, 2019 at 10:48 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Add generic recipe for safe C library.
> This library implements the secure C11 Annex K functions on top of most libc
> implementations, which are missing from them.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  meta-oe/recipes-core/safec/safec_3.4.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
>
> diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
> new file mode 100644
> index 000000000..d55d081f3
> --- /dev/null
> +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
> @@ -0,0 +1,15 @@
> +SUMMARY  = "Safe C Library"
> +
> +LICENSE  = "safec"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
> +SECTION = "lib"
> +
> +inherit autotools pkgconfig
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
> +SRC_URI = "git://github.com/rurban/safeclib.git"
> +
> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
> +

I see its excluding mips/mips64 from core supported architectures, is
that intentional ?

> +RDEPENDS_${PN} = "perl"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

