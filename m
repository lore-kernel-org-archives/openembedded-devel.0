Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D54D2C55D
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 14:11:35 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.19319.1729606291789936572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 07:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKauwAvj;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5ebbed44918so1504551eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729606291; x=1730211091; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxpdOPfDAb+iAG4VDzWtYOSyNLZr6Ev82jjVayAjAZM=;
        b=bKauwAvjxvfuDv5WuLkKUGhmw1EE5Khc5Tqf3THHECyitwaA2Yh9I/ZpWYxoYT5hNs
         rOz079SYiSTzT5pWzykvfqD4c0EmHaTn8wqS06HT7f7nP8eYMF1lrYwihQxYxuoqgCML
         MLm15Nw4/6muxHPU7jeBiTCh6xArFknmfpE4Ox8NkPb3e9AcGi1iCj84qW9InadCgy5i
         Fqy4Nc/KVLyInlws6wdRgaXACqrtuTRVCKWC9C00/bOxGkmqQM2gTD63nunGUakAPPrp
         H0Gjgq0XO1wOrkbXvOyRt1tJyfYGMg+2MdivbplipEhQHZDIWHJoyW6ltZkzknOrBCZ2
         EcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729606291; x=1730211091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxpdOPfDAb+iAG4VDzWtYOSyNLZr6Ev82jjVayAjAZM=;
        b=VPw7JaGBLzsAamDHsd7wzzdh+nxT4+zrjkVE0u0ljht0dTcYdd2JlpZ+WmKAuvTefE
         Lc5vSEIgytROvrCGbh8T+Z/my7iKBCauAHFZEyEjHcbQvek6IwYnj8RXcD0XkUt0E5ax
         xxnM6gx0iT8h9iDQpR4Gw6+ySZgvThNcYHx/r7eznNJX/JLYQCAlukSPXXNoUCvW1o+W
         eis4zHHzN0EnHbj5E6x+4+Rqf30zZTIYoltmf5b86Ml6S/Q/VENLCsfm3ZS7KGOYxWzM
         KAoesLTOWDh9SFDGKfyQK5rfeRXKT5fYpJveNxA/ERG3sUZcySd2qz+pDxwM50aCRQRX
         6D+A==
X-Gm-Message-State: AOJu0YzXwPggI+S0AsQtJpIMeMFhpsvUOdVlO8WN50AotydVVUTfKrzw
	v5GK/h8LX7bhQjA0t/u4hocM2WY8CIyEBfxc4eu0vmBzoAdEZNePZd4gPLqD7AQax0j+WKlsqh9
	fTnTGyCAY61eZpmiieXTx8J2Fmck=
X-Google-Smtp-Source: AGHT+IFbIOrMsr7wukfC+CvlQ6uHdQIcwHI8kytjbtQiET1gQaYKc9hyDD3iMAlQSGRMtWPR7uLms0hInathNzcyb2M=
X-Received: by 2002:a05:6820:1629:b0:5e5:c073:9ea5 with SMTP id
 006d021491bc7-5ebd77c38bemr2537081eaf.6.1729606290996; Tue, 22 Oct 2024
 07:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241022101526.4114268-1-mingli.yu@windriver.com>
In-Reply-To: <20241022101526.4114268-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Oct 2024 07:11:03 -0700
Message-ID: <CAMKF1srbzr5Y=ojBORL27GunwUAbb1ezorbZ1fAuW3yueCW_fg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: Upgrade 3.6.1 -> 3.6.2
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 14:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113089

On Tue, Oct 22, 2024 at 3:15=E2=80=AFAM Yu, Mingli via lists.openembedded.o=
rg
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Mbed TLS 3.6.2 provides the fix for a security vulnerability [1].
>
>  # ./run-ptest
> PASS: test_suite_aes.cbc
> PASS: test_suite_aes.cfb
> PASS: test_suite_aes.ctr
> PASS: test_suite_aes.ecb
> PASS: test_suite_aes.ofb
> PASS: test_suite_aes.rest
> PASS: test_suite_aes.xts
> PASS: test_suite_alignment
> PASS: test_suite_aria
> [snip]
>
> [1] https://github.com/Mbed-TLS/mbedtls/releases
>

Other than commit msg how is it different from prior patch
https://lore.kernel.org/openembedded-devel/20241021093900.3891154-1-yi.zhao=
@windriver.com/T/#u
?
its also from your colleague at WRS

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../mbedtls/{mbedtls_3.6.1.bb =3D> mbedtls_3.6.2.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.1.bb =
=3D> mbedtls_3.6.2.bb} (98%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.b=
b b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
> similarity index 98%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
> index 62c3add2a5..168ee1b5de 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.2.bb
> @@ -27,7 +27,7 @@ SRC_URI =3D "git://github.com/Mbed-TLS/mbedtls.git;prot=
ocol=3Dhttps;branch=3Dmbedtls-3
>         git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=3Dhttps;=
branch=3Dmain;destsuffix=3Dgit/framework;name=3Dframework \
>         file://run-ptest"
>
> -SRCREV =3D "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
> +SRCREV =3D "107ea89daaefb9867ea9121002fbbdf926780e98"
>  SRCREV_framework =3D "94599c0e3b5036e086446a51a3f79640f70f22f6"
>  SRCREV_FORMAT .=3D "_framework"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113086): https://lists.openembedded.org/g/openembedde=
d-devel/message/113086
> Mute This Topic: https://lists.openembedded.org/mt/109149384/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

