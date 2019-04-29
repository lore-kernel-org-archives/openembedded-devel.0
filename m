Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 55A717DC48
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 17:14:03 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id h16so7137203qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 10:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5HU+RsTO1saJm+X1QUJAMN1Z6aEWkfZOOaHIVVeQzd0=;
	b=S8h/WxUlbwxcBFbCfGMOigLzSxipNypKAKsKBAk2JO7O6n4e1kWnKKHI+43NHjqouB
	/Zl+AW7mNKV/6XTxv1a1m2K0XS8IVTAf8T+WsYA5o1CW3cHnjPEJZpQjnTOVaawOKBuL
	skpwQI3Jx/QJ5K37Gf8jiK+ULw2mqGqmmrd60wuOZD8ToPoZaJvD4eVbdr2DBDLGramW
	4t5iNPDuG774syCxwEzJys9QSeb5Rc+OMU9JCI92+oagic0ZZlhjS6fkXnEd29mcW1xJ
	9TXk6M/yAZIOnmlFwPExVoQbnqWRc1Kme9dRwkBgeVJdX9UQd4K3WrghXaRDO1SrDWoe
	HhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5HU+RsTO1saJm+X1QUJAMN1Z6aEWkfZOOaHIVVeQzd0=;
	b=Dpdp/2mSWlB30lG51k/gaYsWTaJ34pGdigqteJmSR/Dh9XBjD6kzs1rEixMcHEN/mL
	uXav0TOd+BT1XdQ+wQFApKFT2TXqxZuvkssN6vFLaELBSu/kmXtGH+rV3xVFNbiNAJdJ
	ChbmxM0+1fStHatXrJYB5fhUTFgpnrSZp8tm2hq6Lr4WU+et0j9VR/Lii2qhdNOqp9ha
	5nlOy6cv3P08sukuoG5nS0J/p8Cx0ZgnsMEZ/6ZeZc6m/c1mc295IvfpM6nmUYSNaRjN
	o207E1455tHQ7c9YSW4Ki9tsBniFXKTb4SNsGPjtvFYdtUNYjJjbF7ycHEcDgFzN4Zt6
	s1EA==
X-Gm-Message-State: APjAAAX3nXk9r+qiGH2jdVxiyigqU+3qGx8kVMChbneQDvbm1dtwLZpl
	gxm+0i8st/naVyN+V5ql1mAczWzDYzIxcTBA6SCgxTQC6vM=
X-Google-Smtp-Source: APXvYqyxqXajeYUTMOUEDsABVdCCYD7Bfy+3k1mOj6s4Cd/IL+CbIAX4qjv7FF2IlP9VokASgIlCvuPuIe+5vDteDGQ=
X-Received: by 2002:a0c:92f9:: with SMTP id c54mr19106970qvc.194.1556558044079;
	Mon, 29 Apr 2019 10:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190421193713.4794-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190421193713.4794-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Apr 2019 10:13:38 -0700
Message-ID: <CAMKF1spAU4_2bYaizv_McRWV_SvgKH8-aiNS3jmC7X+47QKh7w@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] xl2tpd: update to 1.3.14
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
X-List-Received-Date: Mon, 29 Apr 2019 17:14:03 -0000
Content-Type: text/plain; charset="UTF-8"

Fails on rpi3

https://errors.yoctoproject.org/Errors/Details/238633/


On Sun, Apr 21, 2019 at 12:37 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> License checksum changed due to formatting change (see @1611d6f028fe3).
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc       | 2 +-
>  .../xl2tpd/{xl2tpd_1.3.6.bb => xl2tpd_1.3.14.bb}          | 0
>  meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb    | 8 --------
>  3 files changed, 1 insertion(+), 9 deletions(-)
>  rename meta-networking/recipes-protocols/xl2tpd/{xl2tpd_1.3.6.bb => xl2tpd_1.3.14.bb} (100%)
>  delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
>
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> index d037c7cfc..b3d466c3b 100644
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
> @@ -6,7 +6,7 @@ DEPENDS = "ppp virtual/kernel"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
>
>  SRC_URI = "git://github.com/xelerance/xl2tpd.git \
>  "
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
> similarity index 100%
> rename from meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
> rename to meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
> deleted file mode 100644
> index 88ae5d6f8..000000000
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require xl2tpd.inc
> -
> -# This is v1.3.6 plus some commits.  There is no tag for this commit.
> -#
> -PV = "1.3.9+git${SRCPV}"
> -
> -SRCREV = "f114c10ac532051badeca0132b144a2f1596f047"
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

