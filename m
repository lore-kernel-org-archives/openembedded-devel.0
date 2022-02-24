Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD21C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 17:00:40 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.12941.1645722039686644840
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 09:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bAlkOkZX;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id bc10so6530qtb.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 09:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dekMrWQRVWCrfCN0JJjypvovsB72Q+ELHyY24OZ4SD8=;
        b=bAlkOkZXSfv4dylx+iWS4rZu9aS4yjoCuGFMA8yY/TrpV6YJL2DqRmiu7MgqTNn2t6
         AO/Z1lT0uGLCDYEtgcWU8EUW1bK/FRed2msTezqdjgji1cvqyM27pWsQevEH+4XwPYqe
         0nSeVvx5DDN9vSx6NgRLrJ/85cWWhOA5xTHBReVvSLKii8jxJwdhu2ZiWQXNMK++l2j6
         gMHv6FqUkX5jwhZaZwH2IrJCY6qYCKMo6uLUP0Rg5SY/vdQMxj/PFrsgwblLtRjtMHMW
         fxXEeLmH0c3TGlgW0LKpndMAT0F327JA9fYf98i6UaxCLJT/plfv8lhXmXmherWPJ2KD
         a6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dekMrWQRVWCrfCN0JJjypvovsB72Q+ELHyY24OZ4SD8=;
        b=R1eQBuK3EczSj12HEqxjwcAnxa3BtmP8jHhSQM1Cd6ES6pHGv6Y3WfM/3V/e/lkXYz
         T/ws8ZbcCw2SBnP3WI1zyuSUasA7n8VPH0dcnh6MOLiozo/Qa4Y2GlgIDzCLtj1UeIin
         p2vG+3Zoc60r2rS3hZnS4ygxDPc2U1hAyv+BE50nikLkdN29t9qH1gGcHc6iGwYW5n9n
         EuGBBm8+yMnuQHwjj839ZG1ZpEyM+MlEdi8um0Lnnwp8lmLSxE5u/s6f16DczVv1rkZu
         s1RWXnX8BcUSN2U8zlMqPgUaujmiI9ZqcRFl6/mVkGwX/EVvi9/fwRxsiGa0GdT5/TpT
         f/2A==
X-Gm-Message-State: AOAM532EY77VbBDJylojCHc7EFsI7Bt8z2OlP1FEIyovh1j5ceYTQNZV
	r0IHcjSP2GWvy12RKqBD9/YKx+TscB1px6kNgz8=
X-Google-Smtp-Source: 
 ABdhPJzL/srdNExLd90+iPn1a+CFyIhyqm1URoAbGuamG3aVaFAmUpN3J27vs4AY/+AXXDFAVsV3Hq8DfsTn+6ugAG8=
X-Received: by 2002:ac8:584c:0:b0:2dd:aaa6:7865 with SMTP id
 h12-20020ac8584c000000b002ddaaa67865mr3322942qth.330.1645722038613; Thu, 24
 Feb 2022 09:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20220207003045.3300116-1-shin.matsunaga@fujitsu.com>
 <TY2PR01MB3289EAE650652B4AAF588E11923D9@TY2PR01MB3289.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY2PR01MB3289EAE650652B4AAF588E11923D9@TY2PR01MB3289.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Feb 2022 09:00:12 -0800
Message-ID: 
 <CAMKF1spZrnrwv-nmksVNzcvF+=YX2M9hA2jW8Czg23+ZxUmwog@mail.gmail.com>
Subject: Re: [oe] FW: [PATCH] openldap: add CVE-2015-3276 to allowlist
To: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 17:00:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95509

On Thu, Feb 24, 2022 at 12:40 AM Matsunaga-Shinji
<shin.matsunaga@fujitsu.com> wrote:
>
> Ping.
>
> -----Original Message-----
> From: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
> Sent: Monday, February 7, 2022 9:31 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Matsunaga, Shinji/=E6=9D=BE=E6=B0=B8 =E6=85=8E=E5=8F=B8 <shin.matsuna=
ga@fujitsu.com>
> Subject: [PATCH] openldap: add CVE-2015-3276 to allowlist
>
> CVE-2015-3276 has no target code.
>
> Signed-off-by: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
> ---
>  meta-oe/recipes-support/openldap/openldap_2.5.9.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe=
/recipes-support/openldap/openldap_2.5.9.bb
> index f3b8c6c98..a170b135f 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
> @@ -236,3 +236,6 @@ python populate_packages:prepend () {  }
>
>  BBCLASSEXTEND =3D "native"
> +
> +# CVE-2015-3276 has no target code.
> +CVE_CHECK_WHITELIST +=3D "CVE-2015-3276"

this needed to be called CVE_CHECK_IGNORE, I have fixed it locally and
oindtaslled this patch

> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95502): https://lists.openembedded.org/g/openembedded=
-devel/message/95502
> Mute This Topic: https://lists.openembedded.org/mt/89361403/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

