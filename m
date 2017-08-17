Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 00AA877E89
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 02:08:27 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id r9so10873891uad.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 19:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5YmdXfBnvtzpnp5OGuIuhzVTkNXbPyabShbFpIizWt8=;
	b=ECVJI7aEd0g8EkAeJf04B6oQGwnEnHqAe8xEYWYpPBlU5g7ia/Z3ErZqyNhxDev8l+
	4ZnSLKlHO5SmkI6Btqsn4B9TGycPyfruHFh25D31CXWCNexxxaYHGUeUiAWq/fB+AC1c
	8MH4RsOnV8BFlA+QQhIlD9EMGXZQ2tIDmO/hogiRCiy2qf0LbZjxrL6q66EM2wWADr7F
	uleaGFkzbq1zOhwChCZtsu8sRPiMTs2HzJ2igNax2JcOJoF9fZRCbXrPSziT0ZKjK1RD
	YIEka/ft9DVyodF1xAjIDrKuJsKraMsoSyKIckgoTP7XX2VeSkzepuE6ZCdgdKkSJxEM
	qy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5YmdXfBnvtzpnp5OGuIuhzVTkNXbPyabShbFpIizWt8=;
	b=MaKUWZISuyhwDqbXO2tS1W99tnVhuVXFiS3ju8O6VTyNeGSa8EjBZBPpnr1OnRHct/
	9c0eE2pjTyy1D9ueHcHwcKeFFZmVtOWCWmW2w+7sPJV4w7bVepmhsbHqJTbkQfeC20ne
	bHvn39zfxdDCkR29DN3kH60MCT1rQAk7WuuOKPx8AJ7h3Omb9weRQKNVa8COHTRU0Aur
	I4to3J0rk/THOgWZFL0RsdCITqAgP4xTLNReNjDub/pSduCq+4xWwDJ1/ZAAKn+eHLb8
	6YYGlBL0/NvZOq/S96FaLnAZrsURLv+i6bxm4AxRUQuJkYj/OSGPO+zDMHdi4yclBeDw
	T5Wg==
X-Gm-Message-State: AHYfb5gouVpQGMGARexo/Hhx8qMb+NvxSYaFmvyPNx/ufk+0D891NRh7
	tCbfpzAqw42PE+6pYCppqrPQBxgM/g==
X-Received: by 10.176.8.25 with SMTP id a25mr2523913uaf.13.1502935708751; Wed,
	16 Aug 2017 19:08:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Wed, 16 Aug 2017 19:08:28 -0700 (PDT)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF732B003BBC@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <33D4DBCAC5F2D74E96B07F6E7632BF732B003BBC@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 Aug 2017 03:08:28 +0100
Message-ID: <CA+chaQdv5wn+PaXjFecboFiiVMPdj3_jBWFYZ3zqpJBHxSsrGw@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] net-snmp: do_compile error
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
X-List-Received-Date: Thu, 17 Aug 2017 02:08:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

openssl was upgrade in oe-core and net-snmp probably isn't compatible with
new version 1.1, you need to update DEPENDS to use openssl10 and try if it
helps.

On Thu, Aug 17, 2017 at 2:27 AM, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com=
>
wrote:

> When bitbake net-snmp 5.7.3, I will meet this error, who knows the reason=
?
>
> i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=3Di586
> -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed --sysroot=3D=E2=80=A6=E2=
=80=A6/build/tmp/work/
> i586-poky-linux/net-snmp/5.7.3-r0/recipe-sysroot -I../include -I.
> -I../snmplib -DNETSNMP_ENABLE_IPV6 -fno-strict-aliasing -O2 -pipe -g
> -feliminate-unused-debug-types -fdebug-prefix-map=3D=E2=80=A6=E2=80=A6/bu=
ild/
> tmp/work/i586-poky-linux/net-snmp/5.7.3-r0=3D/usr/src/debug/net-snmp/5.7.=
3-r0
> -fdebug-prefix-map=3D=E2=80=A6=E2=80=A6/build/tmp/work/i586-poky-linux/ne=
t-
> snmp/5.7.3-r0/recipe-sysroot-native=3D -fdebug-prefix-map=3D=E2=80=A6=E2=
=80=A6/build/
> tmp/work/i586-poky-linux/net-snmp/5.7.3-r0/recipe-sysroot=3D -Ulinux
> -Dlinux=3Dlinux -c keytools.c  -fPIC -DPIC -o .libs/keytools.o
> keytools.c: In function 'generate_Ku':
> keytools.c:155:25: error: dereferencing pointer to incomplete type
> 'EVP_MD_CTX {aka struct evp_md_ctx_st}'
>      ctx =3D malloc(sizeof(*ctx));
>                          ^~~~
> keytools.c:264:9: warning: implicit declaration of function
> 'EVP_MD_CTX_cleanup'; did you mean 'EVP_MD_CTX_create'?
> [-Wimplicit-function-declaration]
>          EVP_MD_CTX_cleanup(ctx);
>          ^~~~~~~~~~~~~~~~~~
>          EVP_MD_CTX_create
> Makefile:98: recipe for target 'keytools.lo' failed
>
> --
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

