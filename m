Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3C2E78292
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 00:20:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t138so679782wmt.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 17:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZQUGXyhqiqHsMq5zERK85axN+Whc/6RCtBb6jpC2Gm0=;
	b=J6TzH2MtZPhpl4TtadZAy67ABsFmrG3ujhQmxysapBhRLwx285DYc8KHEWUdT8mQDq
	uMyQS4OFDkRf/31vKinMNug0rb4s64fqoX/UlsNX6gTKRYZIIpxqsClMsACotOCQELbw
	SdoJvsmCLI1LtI25qLDbx6p6DdcZaoB3UQ7j/8lgrRG1ZI60Yh/oJNLThwLsQyulqgaZ
	EoQ0rjm1t+RbUKR1zzPn4jAkaBXZcCi7yzCoMFBdFeXbDmE6FiC93pjVqmuOMQileD8i
	8ayI5VXeQJMRLNjWMNB8rfPt+dFTqE3IZfi2CERHMw5eTQqq75RqwekO38XZOrT+jO3Y
	SPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZQUGXyhqiqHsMq5zERK85axN+Whc/6RCtBb6jpC2Gm0=;
	b=h5aHVeOBi4Rv6pLIeRamjP/zpiDE7kkhygtzqwIhhpvTl5VSU+NpBSKAxdmlFxr4Gn
	39tRIQhQdVuwIDTgRyCgIjpeIqTlgxanbBW3AlqeDhlp5WoeOoNOjwueNAcSca1XnDq0
	lnT3Q2Mrj4urQiF+tZg2gDkUMFeLUow2NNG5+CrUaW08rkWvf/neGMZVaYZjeDMb7lmm
	8Jl3zqrAqplcMycUv6n6UvxjUf4E/29SOfKntYA5lnZAnTUQp3r3vql1qFfVrcFFs1mg
	7TUnMWB0Dyt0eQPSy9pFbWQI5G20pefMsrPaV16c7HTc9Dn1zB8lFDyfohMF5yDD+5ZH
	WrKg==
X-Gm-Message-State: AHYfb5gVZOYjM4Eo2B+P+hzbQbej+ldgiqOHKiCLeNfZrYwDnkXr1UB4
	s3OOHxE+ma0atU7szvdBpU2ds1LxVA==
X-Received: by 10.28.13.140 with SMTP id 134mr595891wmn.176.1503447655528;
	Tue, 22 Aug 2017 17:20:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Tue, 22 Aug 2017 17:20:54 -0700 (PDT)
In-Reply-To: <20170822070258.27716-1-jackie.huang@windriver.com>
References: <20170822070258.27716-1-jackie.huang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 22 Aug 2017 17:20:54 -0700
Message-ID: <CAJ86T=WihaULMmH5uQwtxsgDfsXFy4YH=PznYGm-uz=g2q9O8w@mail.gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: customize HOST_CFLAGS
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
X-List-Received-Date: Wed, 23 Aug 2017 00:20:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2017 at 12:02 AM,  <jackie.huang@windriver.com> wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Customize HOST_CFLAGS, HOST_CXXFLAGS and HOST_LDFLAGS
> to fix do_configure error as previously use the common
> CFLAGS and CXXFLAGS in both cross-compile env and host env,
> and the option -fstack-protector-strong which not
> recognized in host env can result in do_configure
> error as below.

That should already be solved by:

  http://git.openembedded.org/meta-openembedded/commit/?id=3Da0b2e6f4fca7ac=
907eb7d6e06ca4c1581a5c553f

Which version of meta-oe are you testing with?

> | checking whether the host c compiler (gcc -O2 -pipe -g -fstack-protecto=
r-strong -D_FORTIFY_SOURCE=3D2 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-need=
ed -fstack-protector-strong -Wl,-z,relro,-z,now) works... configure: error:=
 installation or configuration problem: host compiler gcc cannot create exe=
cutables.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/rec=
ipes-extended/mozjs/mozjs_17.0.0.bb
> index b6744395f..b72ee7bb3 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
> @@ -51,6 +51,9 @@ PACKAGECONFIG[x11] =3D "--with-x --x-includes=3D${STAGI=
NG_INCDIR} --x-libraries=3D${ST
>
>  # mozjs requires autoreconf 2.13
>  do_configure() {
> +    export HOST_CFLAGS=3D"${BUILD_CFLAGS}"
> +    export HOST_CXXFLAGS=3D"${BUILD_CPPFLAGS}"
> +    export HOST_LDFLAGS=3D"${BUILD_LDFLAGS}"
>      ( cd ${S}
>        gnu-configize --force
>        mv config.guess config.sub build/autoconf )
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

