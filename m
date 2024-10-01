Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756ACCEACF1
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 17:36:21 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.87880.1727804175871444282
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 10:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLEv0Wws;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2877d7ae3f6so422839fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 10:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727804175; x=1728408975; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTVD83Pyl+HcCjd22L0bjXHAtzPkM0dBB7Iu+GHkPIw=;
        b=cLEv0WwsrBxVKlZODTGzQ4aih7mKJdW6Roi8M4AKFdb9ObV8X9XuY3F8MNcWbhHbj6
         CXtqzwWlDsSBWaefLhg6mR1I4OnF0fEOnYEraNiQEl6Y2CUkKE66KaHdajDE1YkfUR8s
         NrvajEtkY7HNFWS2pD21tnY3/x1g6HKGXH5pveIdns4BFQDHeJe5bgPquazlBX2JV/am
         MX+NfUXJDUdjVEu3JJtDvTlkyXvBuhjL5aJp44hFXZTY68aCX9du21oKHZBgG/zieGHJ
         qDM/Bm1RnQNLXGnLZQDUe39ZjjgER06qCSWYqoE27k2JG/H+cV3I8DW7n4Cg1I58RzuN
         6DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727804175; x=1728408975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTVD83Pyl+HcCjd22L0bjXHAtzPkM0dBB7Iu+GHkPIw=;
        b=KsiQ4Ys5278OTJh6x0C3Zkp/Dipp1cAgi66b/Pxf7GMEXekrM9TaCJL85mxsGBQfhP
         e7ZEOphB0BGDkYmeVUGgDwpDtND99QmVwNQFYYq9DHOqJE2LDhs2dlxezAdpl3TBVmNq
         TyS1rIYE9Qw4jBmXxjRd5rXffh6NSINLb3Dvn5x/I5rTKguj18nxVFoCd/CprmlmnbFU
         aS8ADM/smh/v6SM2DWMeMiUNzzpNQ8NomX4GqTMxFcMkrHPhcE/1VdMTI50PCXdWxKZ5
         ivdqimXouZ5RdgGpqQZjc5iUTj3h32t+EN1w5Dv1mH3aOp2g6yBfZGxSeWjdGOXGCFjx
         BmPA==
X-Gm-Message-State: AOJu0Yxb5EuMSL2m2Qw//86GxrHBjJQRRJsPNEqQWe0x5PXORiskuBuD
	zE2OGg+hZWS+cE+iM39UmHuVfBK+0eGeeGAVRO2yX+pbqBdvjRKIIwVlphHkEMuuhjwf0XhLU2z
	DSxo/tcqnRHwWztJ4cdrtnjEfXmg=
X-Google-Smtp-Source: AGHT+IEKdYuWybc/nlbsvwQGpduPMoPpJVTbjQ5c4I+mcBdMV8kuMdLCiBM5WYNr+3DMKcb2IaXzwijNJSbwFkLrvhQ=
X-Received: by 2002:a05:6870:8a0a:b0:287:29a0:cfe4 with SMTP id
 586e51a60fabf-28788f2b104mr203093fac.32.1727804174886; Tue, 01 Oct 2024
 10:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241001165743.1061735-1-alperyasinak1@gmail.com>
In-Reply-To: <20241001165743.1061735-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Oct 2024 10:35:48 -0700
Message-ID: <CAMKF1soJx38rQmuyctmu+mFpJNzroN4JH-VLcrf=6mfHg9rnTw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] curlpp: Fix build issue
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 17:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112637

On Tue, Oct 1, 2024 at 9:57=E2=80=AFAM Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  ...id-conversion-from-int-to-CURLoption.patch | 36 +++++++++++++++++++
>  .../recipes-support/curlpp/curlpp_0.8.1.bb    |  3 +-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/curlpp/curlpp/0002-fi=
x-invalid-conversion-from-int-to-CURLoption.patch
>
> diff --git a/meta-networking/recipes-support/curlpp/curlpp/0002-fix-inval=
id-conversion-from-int-to-CURLoption.patch b/meta-networking/recipes-suppor=
t/curlpp/curlpp/0002-fix-invalid-conversion-from-int-to-CURLoption.patch
> new file mode 100644
> index 000000000..1712a5346
> --- /dev/null
> +++ b/meta-networking/recipes-support/curlpp/curlpp/0002-fix-invalid-conv=
ersion-from-int-to-CURLoption.patch
> @@ -0,0 +1,36 @@
> +From ebe9144fdfdc8154661b93322cec4a1c43aa75ff Mon Sep 17 00:00:00 2001
> +From: alperak <alperyasinak1@gmail.com>
> +Date: Tue, 1 Oct 2024 19:45:38 +0300
> +Subject: [PATCH] Fix invalid conversion from int to CURLoption
> +
> +Options.hpp:281:74: error: invalid conversion from 'int' to 'CURLoption'=
 [-fpermissive]
> +  281 |         typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CL=
OSEPOLICY> ClosePolicy;
> +      |                                                                 =
         ^
> +      |                                                                 =
         |
> +      |                                                                 =
         int
> +
> +Fix invalid conversion by adding explicit cast to CURLoption
> +
> +Upstream-Status: Pending

Thanks for fixing this, I would suggest sending this patch upstream so
we get it reviewed.

> +
> +Signed-off-by: alperak <alperyasinak1@gmail.com>
> +---
> + include/curlpp/Options.hpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/curlpp/Options.hpp b/include/curlpp/Options.hpp
> +index c705c9d..7c9a501 100644
> +--- a/include/curlpp/Options.hpp
> ++++ b/include/curlpp/Options.hpp
> +@@ -278,7 +278,7 @@ namespace options
> +       typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_LIMIT> LowSpe=
edLimit;
> +       typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_TIME> LowSpee=
dTime;
> +       typedef curlpp::OptionTrait<long, CURLOPT_MAXCONNECTS> MaxConnect=
s;
> +-      typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY=
> ClosePolicy;
> ++      typedef curlpp::OptionTrait<curl_closepolicy, (CURLoption)CURLOPT=
_CLOSEPOLICY> ClosePolicy;
> +       typedef curlpp::OptionTrait<bool, CURLOPT_FRESH_CONNECT> FreshCon=
nect;
> +       typedef curlpp::OptionTrait<bool, CURLOPT_FORBID_REUSE> ForbidReu=
se;
> +       typedef curlpp::OptionTrait<long, CURLOPT_CONNECTTIMEOUT> Connect=
Timeout;
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/met=
a-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> index 131f1873a..cacdc9773 100644
> --- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> +++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> @@ -8,7 +8,8 @@ DEPENDS =3D "curl"
>  DEPENDS:class-native =3D "curl-native"
>
>  SRC_URI =3D "git://github.com/jpbarrette/curlpp.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> -           file://0001-curlpp-config.in-Remove-references-to-absolute-bu=
ild.patch"
> +           file://0001-curlpp-config.in-Remove-references-to-absolute-bu=
ild.patch \
> +           file://0002-fix-invalid-conversion-from-int-to-CURLoption.pat=
ch"
>
>  SRCREV =3D "592552a165cc569dac7674cb7fc9de3dc829906f"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112636): https://lists.openembedded.org/g/openembedde=
d-devel/message/112636
> Mute This Topic: https://lists.openembedded.org/mt/108763095/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

