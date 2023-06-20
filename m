Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32640EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 18:04:04 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.1278.1687284239530374664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jun 2023 11:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Wh+mAO2Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3942c6584f0so3280988b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687284239; x=1689876239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVHpOb9IMH8U1gEzQ2sm2FBGKmsiPtxDlsmg9VeCCCI=;
        b=Wh+mAO2YHZEa+SDmxsqjHd/N3mSCfwvYPGuPQ6ub/ejx/ucvEfqyy+zMoKMC0Pn0F7
         GBsSqYnIiKitXknfVISgTrZ90+todtjsRH5HFnxUL1MI7vz4bccVP1Dg9CB5AzocEYDs
         iN7AWo1947Nsa0ri7WIfllRDQzEdjD3ZSt1cBRL713wJ93PXwq321NnD3qNntmPeaf55
         7HpcQ2tuC9rmbMWmiObNmjxmZHXXAtmjGofgtf/Gv5Th0GvlF7k6KcxRFplUyymtTMv6
         s266HXNhwyu9gl8cQsqC2i5XdiXNEwWWc/k5DSAvBREUFZOGNBInH35liClCsoYspTKe
         mckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687284239; x=1689876239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVHpOb9IMH8U1gEzQ2sm2FBGKmsiPtxDlsmg9VeCCCI=;
        b=SpmdA3YehL/tvRBlg6Y38Tai5DvRAbJbq5rYBQBCdGaRqVogbyixgfsGfmgp51Hjf0
         JY6mvGlOxPqNZg8SzHib6Im7kop3zFw0Ok+kd0ZF9VO+IDLlmYsIXO4WOujJ1v/Oyigu
         lQjOkDN7JuouxlpKC2TEnlki/TCAGuDLDt8VI2/DwDs2VM2azLg9q36GBqNS/yObkSSi
         8/b/zmspqKf4VR+AUySaqg3NcEum//vyRSuZmOKPoSmPOaayTHNpPLDQCaWDzwXU3WPj
         TMb7dmUomzBZwI5cSrTAj4+0YFHer6hHT5R4ZMETp+astKN+KPBmyxlJmrjr0zXmw8vz
         Cnng==
X-Gm-Message-State: AC+VfDySqqUpcg2BUzfFGCSj62T7DtQN8y01yyPgjFsVSkOqkGWcDUZp
	jjZDhYJ2rLSdV/9pN94OlrDfaz6yo54UEN2dIVQ=
X-Google-Smtp-Source: ACHHUZ7LBM8ExqBX893xANwkE9chjp/eItU+kBbjrtd3yMxl2ohJwethWmqYWjI+gVMchajyyiYREd7ZKPD/pxzZ6IY=
X-Received: by 2002:a05:6808:438e:b0:398:268a:1d00 with SMTP id
 dz14-20020a056808438e00b00398268a1d00mr15222796oib.51.1687284238674; Tue, 20
 Jun 2023 11:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230619132214.213417-1-brgl@bgdev.pl> <20230619132214.213417-2-brgl@bgdev.pl>
 <5a677745-c6a2-bd0a-5507-98bc3b185877@gmail.com>
In-Reply-To: <5a677745-c6a2-bd0a-5507-98bc3b185877@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Jun 2023 11:03:32 -0700
Message-ID: <CAMKF1sq=L-GyguojmkSd4KD9Aq5mAEaM9O-pUnECZqhzdrfetQ@mail.gmail.com>
Subject: Re: [meta-python][RESEND PATCH 01/54] python3-pywbem: drop unneeded
 class from RDEPENDS
To: Bartosz Golaszewski <brgl@bgdev.pl>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 18:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103466

here are some failures

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2841

On Mon, Jun 19, 2023 at 6:16=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On 6/19/23 6:21 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The native package has the same dependencies. Even if normally they are
> > satisfied by python3-native, we should still use a global RDEPENDS.
> >
>
> This will deepen the dependency list for native packages. Why should we
> do this ?
>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.b=
b b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > index 71af06881..8b0383cf6 100644
> > --- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > @@ -27,7 +27,7 @@ DEPENDS +=3D " \
> >       ${PYTHON_PN}-wheel-native \
> >   "
> >
> > -RDEPENDS:${PN}:class-target +=3D "\
> > +RDEPENDS:${PN} +=3D "\
> >       ${PYTHON_PN}-datetime \
> >       ${PYTHON_PN}-io \
> >       ${PYTHON_PN}-netclient \

