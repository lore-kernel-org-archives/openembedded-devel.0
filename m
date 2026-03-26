Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B90109E535
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 00:53:47 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38304.1774486417420708030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 17:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OtqSDVXa;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64e8cdafeffso493714d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 17:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774486416; cv=none;
        d=google.com; s=arc-20240605;
        b=CHyIi9jJ83kiXp8YriSl29kReSHBRlF/WR9WJkjjRFLY1/WRwHv0o87r2SIlgLGZKB
         o2ZiOrM4+x1wiq/sV81dzZ3yvHHrMw1qhtlLA0O+xg3Z7WoH4bvfe+g5tgJ7irx1+3DI
         R1d1ne7WiWsNLBDOop332w6QlnjrmgQQxN/pCpB0bdptaz6tFuUMPMZjFDTFBMuIqz1o
         LcMu7nvgcS5FrfH6NNks/1bbRZfsCdTGU0Gr25yQ6hy54mbKoIk78RE98j4Ul9jKlnyA
         RHPdXEb4MpKJ0vgNjTdeS09mKO6Ap1ijsZ3+XiLwcAdCEn5IV7cw7/u9MIjR1LO3y1wn
         7jww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c63VFGSUXpF02a/SrntYD5277nNaWz3PofIS5t7lqGM=;
        fh=h4Z+DnHHC+sb76TKyF3D1w2TF0z7VKOqQ//Q9qp7TV0=;
        b=ke73k7+WVsyi9pyRdGpajUFwpHvwucCIvxHxR25TDdxYq1aH9j03YriP9CcJvRmAZF
         Tvce3HsF+yUQzHWZGRTKIbDzQG1mlPd0dPGYCaIJNw5YRFE5Kg0DBJ3gp8AyB0mxnP02
         NYAzUdQPzrsL97kkc0J/IjNtmMRcByJ5kyUZ2c+VMj1n4NGRFYpMjthF6KOMFk/4GvIz
         UMkgcCR18ipiYbPRmDtbmpW5brTUDz1VLPhaUYzxbiTcEyVP2bvE8nA/q7fx1N+cSl/M
         fhFW6iV66xOPP1UfpVeNIbjRm+EaOg4HbL/vbDPQTmTYcZistMK/n3fWtN5s20P1+4nW
         xP+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774486416; x=1775091216; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c63VFGSUXpF02a/SrntYD5277nNaWz3PofIS5t7lqGM=;
        b=OtqSDVXa9VgHYF9OzFPvE/dSawTXo7AHc1tAcTz2XKFK75+PWwX0HU45e6PBPOQ6jp
         5/Uh7Kv58qPXkMkXZ+JaPp7+/HMOZhmQRP+3kL+xoRZuJXIT7YaU4Cij7Nj+WrXEchTi
         A24lmsMrI5+yUyadU/BVCGV0bN9Cb9IkI437ZGpVrcuRuRmUutfrkaJqorRAbqkZdiyd
         rQ6BNYeL+B3u0GBx11US1H+rp3w207W+aPh2cnTwdNDu0CiOkHc6P/SpCToJzhJXt5nH
         8lQTTIA2qufO44wpsfaROfYRar0kYVFMJqoe9Z/3nUnG90cBoAddbbt/MaU5kqF6R/WC
         Jikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774486416; x=1775091216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c63VFGSUXpF02a/SrntYD5277nNaWz3PofIS5t7lqGM=;
        b=aDH0HjJmS7vArPGlVVgwJmizaxOaNmPAWMoavHtBbhwhb1zPcuo3/JhtQsn4hkkkPI
         7lgZ0kr82L4P5jg3FevCOJW4xVCjSxgOJ8WcXmoFvvhdNHpC2nDHgbU1byocVWuZAkjy
         6mvw+qvueDQAmKCs5P9YlPQqxzdrI+kxw703LLh6KYTcVoarchQQn3916s5SQQ/K4mGH
         NRO46jusMRV9jx1BOPUVRMX0FEqJ1L/1ntOs4yLkWvfFPV1YJR+A+YuBFwS4eJsByGK+
         7na1+USCnpv/3DjsIrQvXeBuyHaW7hbJsVBX++VBEW4yyFEcnRu1hN1vPEX7DbDxnHGp
         mwxg==
X-Forwarded-Encrypted: i=1; AJvYcCWufZhk+TvT+s3/XXgA3kJtO7SeC9oVZMDVCnoKUoUmh8fC0idAaSdLgHpm4P60OWTduwq27FXAob0u+5Mn0Y5h81U=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxpk5P+JW/TMUp5A005gqIQRMOZNXJvOJnZgKtgB2aXvMjOWaar
	HR9iN48+XpeVughm1Gs6O+vt/1sgcPTWB1ILeMhNKCq6B+ghKXjitFvt3OzufslVAhawC38gO1k
	bV/n8FW22Hbi66Dl/IcdN4eFgb5e63zQ=
X-Gm-Gg: ATEYQzxoDQIauHJQRoAdeEKgLBfWcQcQghxoDX5La64/lOGG7phnNQ2xLMPcdTBJB+G
	6//atPgJtkW7GQz48ldc8oUfh0+WqZbnCKOSGymr6RVW7/je6dVYeNbd8vFys3CT/XFPe69yAIW
	ShGMXKMhSts7MVLAy8WiP+aP6f/MX/zjix3TPr6nDpkfca1Of8b8PJIWKVzzQC9GladGQNZBOxi
	TKNtKaF3Bll+eLmYM+M8AJn6qTTwNz39hN77puaP+KmM01Nk6MsryRa/diYOskEqzXXcfiSbVhG
	Req+cgVOCQFxEh/1fSaRxG10c17HcMgZaJuHbkelXvwrcWfVriu4Dt9MYtcuR5pubjAvY/D4gY9
	mWDltsgUF7yGWZf+BAKuDcAqjIhM=
X-Received: by 2002:a53:d013:0:b0:64d:6cac:ecb3 with SMTP id
 956f58d0204a3-64ee54f657bmr5190205d50.35.1774486416441; Wed, 25 Mar 2026
 17:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <13199.1728590787704780404@lists.openembedded.org>
 <22763.1730654002300290010@lists.openembedded.org> <082ff4bf-e4f7-4f51-a403-a862d4551b83@gmail.com>
In-Reply-To: <082ff4bf-e4f7-4f51-a403-a862d4551b83@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 17:53:09 -0700
X-Gm-Features: AaiRm51MFCPA2dcJYKFlOfRm2NGrlatmsOCgFa_idMEXTmHAXuSdErmDLPDstAc
Message-ID: <CAMKF1sqD0iyJ=YHET40Yg41rTxWpfvBCKxDsa2yupXhkPRE5WA@mail.gmail.com>
Subject: Re: [oe] coreutils over uutils-coreutils when selinux in DISTRO_FEATURES
To: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Cc: Vincent Davis Jr <vince@underview.tech>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000082c43f064de2d0dc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 00:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125631

--00000000000082c43f064de2d0dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 4:30=E2=80=AFPM Clayton Casciato <
majortomtosourcecontrol@gmail.com> wrote:

> Vincent-
> I changed my workaround to BBMASK
> "meta-openembedded/meta-oe/recipes-core/uutils-coreutils/".
>
> Raj/all-
>
> This is an issue at parse time:
> uutils-coreutils has a conditional dependency ("selinux") on
> "clang-native" [1], which is provided by meta-clang [2]
>
> This issue could likely be resolved via BBFILES_DYNAMIC[3].
>

I think we can also disable selinux packageconfig by default. I think if
you do not need selinux then I Would suggest to toggle this packageconfig


>
> [1]
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/=
uutils-coreutils/uutils-coreutils_0.0.28.bb?h=3Dscarthgap&id=3Dcc425a989b68=
fc9b52ab37d5178d13d21ee92f39#n32
> [2]
> https://github.com/kraj/meta-clang/blob/b9ef02282197380ef05edbd0eb852e193=
4ceb59b/recipes-devtools/clang/clang_git.bb#L306
> [3]
> https://docs.yoctoproject.org/scarthgap/ref-manual/variables.html#term-BB=
FILES_DYNAMIC
>
> Clayton Casciato
>

--00000000000082c43f064de2d0dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25,=
 2026 at 4:30=E2=80=AFPM Clayton Casciato &lt;<a href=3D"mailto:majortomtos=
ourcecontrol@gmail.com">majortomtosourcecontrol@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Vincent-<br>
I changed my workaround to BBMASK<br>
&quot;meta-openembedded/meta-oe/recipes-core/uutils-coreutils/&quot;.<br>
<br>
Raj/all-<br>
<br>
This is an issue at parse time:<br>
uutils-coreutils has a conditional dependency (&quot;selinux&quot;) on<br>
&quot;clang-native&quot; [1], which is provided by meta-clang [2] <br>
<br>
This issue could likely be resolved via BBFILES_DYNAMIC[3].<br></blockquote=
><div><br></div><div>I think we can also disable selinux packageconfig by d=
efault. I think if you do not need selinux then I Would suggest to toggle=
=C2=A0this packageconfig=C2=A0</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
[1] <a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/=
recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb?h=3Dscarthgap&amp;=
id=3Dcc425a989b68fc9b52ab37d5178d13d21ee92f39#n32" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.openembedded.org/meta-openembedded/tree/meta-oe/re=
cipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb?h=3Dscarthgap&amp;id=
=3Dcc425a989b68fc9b52ab37d5178d13d21ee92f39#n32</a><br>
[2] <a href=3D"https://github.com/kraj/meta-clang/blob/b9ef02282197380ef05e=
dbd0eb852e1934ceb59b/recipes-devtools/clang/clang_git.bb#L306" rel=3D"noref=
errer" target=3D"_blank">https://github.com/kraj/meta-clang/blob/b9ef022821=
97380ef05edbd0eb852e1934ceb59b/recipes-devtools/clang/clang_git.bb#L306</a>=
<br>
[3] <a href=3D"https://docs.yoctoproject.org/scarthgap/ref-manual/variables=
.html#term-BBFILES_DYNAMIC" rel=3D"noreferrer" target=3D"_blank">https://do=
cs.yoctoproject.org/scarthgap/ref-manual/variables.html#term-BBFILES_DYNAMI=
C</a><br>
<br>
Clayton Casciato<br>
</blockquote></div></div>

--00000000000082c43f064de2d0dc--

