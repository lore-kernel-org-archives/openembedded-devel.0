Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5A971B99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 15:30:56 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z4so21727414qtc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sm8pqA4paJkhcb0P5xc3/yrWZQRB1QZWNn4tapx7yDY=;
	b=bdsRAMonYXkEK4RtzO8U/c/6uLNshxSoQvv8p62ZZ0UE2lwgGyRE12Fx9gRoxI2/UM
	f0nXh11AI2lzb93R3sbTgXWWYfmgvGKmVSY/yB4KQ2+ay/BxKYvUMRchp62VDqmQVSGs
	SCEl9ALhjXDX907UZ3Loze/pBWFvedYdPSsMnKkO+Hu4tH85xZ7vv/Lh3qZKN6GpbTMC
	kI3IozhJzA+/d2aVF93f1VaUrnEnwTzRjmsaDjQ8h5uAgCe4r0hGv8dpq4kVrsLWZTPa
	mPk349dvWrpqT8vWJTvbr1+9ALfQHZ2S+Gql9mG4MLrCa3Z6veUDF+pUGxBtmDDvW/J/
	ysKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sm8pqA4paJkhcb0P5xc3/yrWZQRB1QZWNn4tapx7yDY=;
	b=I/hFygQCk9AdcweJedoeL0M4u0nvjyoftt+1uPW86a6e8NmthvOQnXSXX+6lKyLxyx
	YJv07nrMqIpDYjqv9VwPzTO4soqeMcTGnHUQ4XbJc/mNfQ3Qsf0nb3iRox9JXKEj9tlp
	pYJIvCxXGnWw3vpJ8R5XHG/K7i7fcTucAn7ARjxcvZeqFWmG8uUxYpzTnZN5HWy1S3Q1
	3ArszzrzaeypAYql6VSiTxgz8/oovX8VPUS5faDm0xFYmE2WOmLCI7y1sYTwrX+7z5s0
	XxlswtdhAq0jeqWTmZj8GwZFZlO8K9z8ki+iKDr1e/krWaoXuWcDTt+GsEED1E7pFwKs
	VCDQ==
X-Gm-Message-State: APjAAAUgcfo6vo3S5dZbY0WTd7C572eXeid4CR61GqQCmnAFMBK+Zs4s
	RR5hCDUt2A7by5/C06IJWEzZ8GYPm5svCadgXrLOMq10LGs=
X-Google-Smtp-Source: APXvYqzNZ/iE4zNp7MxuCEk6SkGBt7sEuF6h+ZCQL8YYRvMzm54Nt74Jhld8z9FzNItksPndQpOXd+UeKHT8cvXsvHc=
X-Received: by 2002:ac8:74d2:: with SMTP id j18mr23249031qtr.378.1566919856452;
	Tue, 27 Aug 2019 08:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <1566554709-22088-1-git-send-email-hongxu.jia@windriver.com>
	<1566554709-22088-2-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1566554709-22088-2-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Aug 2019 08:30:30 -0700
Message-ID: <CAMKF1sr-AZXhaxNzsUW-85bcK=397RuMjo7LwP3n-g6Tk_7hsg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Tue, 27 Aug 2019 15:30:56 -0000
Content-Type: text/plain; charset="UTF-8"

Seeing this https://errors.yoctoproject.org/Errors/Details/265647/
seems to be related

On Fri, Aug 23, 2019 at 3:06 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Since commit [libdevmapper/lvm2: force recipe libdevmapper to populate
> sysroot only] applied, if recipe DEPENDS on libdevmapper, we have to
> add it to packages RDEPENDS
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> index deaede8..c983a9e 100644
> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> @@ -15,6 +15,9 @@ DEPENDS = " \
>      popt \
>      util-linux \
>  "
> +RDEPENDS_${PN} = " \
> +    libdevmapper \
> +"
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>  SRC_URI[md5sum] = "41d8b985ef69242852b93e95d53e8e28"
> --
> 2.7.4
>

