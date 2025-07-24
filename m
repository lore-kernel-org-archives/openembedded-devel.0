Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12602C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 15:56:19 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.199.1753372574724304017
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jul 2025 08:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGS72q9Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-712be7e034cso12694957b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753372574; x=1753977374; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1uBFY8D7tzwfk0RjKH9IKS11+RMdlcQFvxAflc3vJ8=;
        b=VGS72q9Q7WJGMARcZIcHLapXD5iLGCehiIWmUGgQY8/h78iBNPtD4yu9i2pzYVpmuF
         gF3XekjEr3v+dbIX7LmJWBk8GStw/D219Gcf18bSUK76bg5ZcEQBG5R3bH3hHAn4JpI/
         NY5d2JMi/LNGSX5hxZ1kiP3dMEmpY8Z1OAnK+zk9NOaohb8zwcWNvqXJaFna0jJEP+hv
         FWJIt8O7uRI+kAp1LeKZBhfRz6ZaUCzpvUqYmlZjCx/CvRBkT/2F3e3GFyOPvyBNul53
         bj0Bvdfon2bycqY0QRIL1e3RUUyVcsoKhcZbXFvyllRUDipqVM2Ebpdoj1El/pRmdQ0D
         iS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372574; x=1753977374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1uBFY8D7tzwfk0RjKH9IKS11+RMdlcQFvxAflc3vJ8=;
        b=lTMLQ4ALypKWpldOF+uV/cQsWQ7BcKBCBtS1of/CT7z13+KbK1IIokATSs8akOZFbS
         5J+cCeuBJkwJiaoxVhc49v2Baj4nwSVsxLt8T8WQYvt0XJg5FiutcOtzk2PY/XPTgHPr
         qgI0gxUe70IzPA/UI0t2mHE69eo7f/5osY1bImBqY/lSq7+wLFWJc9iupV2vzqqgnA+I
         rpIjIYLb2xmSlNi8UGjbw4s0T44TkHJXZmqrD6kC4n+Jc1k7WciuTUQfeIKcfHQjA81T
         768v2ceQTzsZQQcVpqg45y3VzMiEtja5jLqHDypu2e26KSbTVRNaUo4IU2hXIeBANYGn
         AEwg==
X-Gm-Message-State: AOJu0Yzynxzs+qD98NoVUCsK1CLq6SSiP/2hEsqIqXeZP/yQSZELoPMm
	6YYyja67LYWS66+e/jzRIz0j6zTFf9GcyIWB0mqvARFjXVAHrG91wdv4SalL3tAQi5yhQBy1VH9
	F61AHP2uxfuZYjOZWAq533pEyzfSF1BA=
X-Gm-Gg: ASbGnctGqvNr/loR7LpHmk7X7HTysv/J+1fK+MQefzEYvZYd+fb+Q0UNLAwdA8Z+nR0
	W9IWR1q/okV35rNrV4qwXSh1XB/ocdPCH5fpCbViwk1uGk3bfPQ5NYGFILbf9aYhrgpeLHxi9pZ
	Hrit6cUp4bUnK2IcWUTvsfOCmrrPZmyzGKxIxxirRdyGQcviLRmoL4DpMVwqRl1EmWTIYjvsiuC
	89oOTg5SH55cNeGs3TaG1Daw/v0d0Zcx5qCgCGN
X-Google-Smtp-Source: AGHT+IEqBmdlrx3elwezRG6NBUOg8VYwr6U4cb7MGH/mgb3twpKlnExndgASbnA3F1lAgYVOyfuM9WcFEx4FWCuRQx4=
X-Received: by 2002:a05:690c:3347:b0:70e:1874:b914 with SMTP id
 00721157ae682-719b4133d40mr100717507b3.9.1753372573340; Thu, 24 Jul 2025
 08:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250724074411.2903317-1-bo.sun.cn@windriver.com>
In-Reply-To: <20250724074411.2903317-1-bo.sun.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jul 2025 08:55:46 -0700
X-Gm-Features: Ac12FXwHHkLS05lhpaWX7prUvTM5qiuzb1rTMEuFQu8GUdynBGE6GTBYG1-qrbA
Message-ID: <CAMKF1sq63BjGgAdbnD=KD3N7tvt3vzXTivTPobB4O=TO1MaNvw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][walnascar][PATCH] thin-provisioning-tools: fix
 bindgen build error with clang on octeontx2
To: Bo.Sun.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Jul 2025 15:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118725

while this fixes it for one recipe, we have to fix it as tune level in
oe-core so remove it globally if we are using clang compiler. so
perhaps adding it to clang.bbclass might be a good idea

On Thu, Jul 24, 2025 at 4:44=E2=80=AFAM Bo Sun via lists.openembedded.org
<Bo.Sun.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Remove unsupported '-mcpu=3Docteontx2+crypto' from BINDGEN_EXTRA_CLANG_AR=
GS
> as clang does not recognize 'octeontx2' as a valid target CPU, causing
> bindgen to fail when generating Rust bindings.
>
> Since bindgen only parses headers using Clang, CPU-specific options
> like -mcpu are generally unnecessary.
>
> Fixes build failure:
> |   error: unsupported argument 'octeontx2+crypto' to option '-mcpu=3D'
> |   error: unknown target CPU 'octeontx2'
>
> Signed-off-by: Bo Sun <bo.sun.cn@windriver.com>
> ---
>  .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-prov=
isioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/cl=
ang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1=
.1.0.bb
> index a60ca11244..4ed885f8b3 100644
> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.1.0.bb
> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.1.0.bb
> @@ -23,7 +23,10 @@ inherit pkgconfig
>  DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
>
>  export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
> -export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}=
 --target=3D${TARGET_SYS}"
> +# Remove octeontx2 specific CPU flags that may cause issues with bindgen
> +BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --targ=
et=3D${TARGET_SYS}"
> +BINDGEN_EXTRA_CLANG_ARGS:remove =3D "-mcpu=3Docteontx2+crypto"
> +export BINDGEN_EXTRA_CLANG_ARGS
>
>  require ${BPN}-crates.inc
>  require ${BPN}-git-crates.inc
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118723): https://lists.openembedded.org/g/openembedde=
d-devel/message/118723
> Mute This Topic: https://lists.openembedded.org/mt/114317423/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

