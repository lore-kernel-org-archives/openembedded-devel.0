Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBF0CA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:26:13 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4662.1791318372509955779
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UwqCF2Jm;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-483a66818edso1571215fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 13:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791318371; cv=none;
        d=google.com; s=arc-20260327;
        b=MjJAgEMJvbc53ryQ2utWV6cbD/i8VRCcnJx4MT5BfFwnvxgqAVisLYpvSvKuYwEDFZ
         iedNEtYZ+22FfwwuiOoSkjL+SoG1xmGqJZ51O1qtBmO5qUKLxa4jI23L3A02gmUj1YrZ
         L3l5OzTq0jod1f4Kahy9HXsqoSHKxLYB86k1YeTmWSyV3gb+2wk2Yasjohc9I2xvLvAD
         nV/zpyQfO5FAzZBkwam7Tci25EAOtKxQWSz4gtD3BcaUyRNDkZ/XIHH9aWl8nsKQ+PcE
         uVgUNT1HwAG0nK5g07mAe8Z+dhdhPWatfGS77pCpKyenY4QVdha7Xum25YThcJMKxlC1
         pA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FSe30C9nuopmWe1imB4fd89GgM0gTjdnTgOkvxSD408=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=eA90/3n8Csx29Q9LyQpaBkHNaBZeKd4deuuYI0g6L/dKtvSj7dQS5JaLCrTxVqXMzD
         awXlwQ0R4DRGkJOHbBHfC1C41yQxycK7Ln3RaNfC3QlviILIk629WLUrgJNzQu3dEHxv
         BmiGLP3aE4EdBcfPtzpQ9hZMYpqnsCMT8t78XSC04cvgudmm64LAHdQjj7P7AGlnFfnR
         cY8ZXJAaH3Fz777odiq6HqwyO1wR2cIQdgfQFy/gD0ndakkcKbpNR9+Qox3HyqSHEOZi
         6n7ENUKrkI79GRlBCyqpiyn14SlBqsaqw0hEwFpYUW9u0Y6JW13jT2ertbEreXLo/tti
         l+3A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791318371; x=1791923171; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FSe30C9nuopmWe1imB4fd89GgM0gTjdnTgOkvxSD408=;
        b=UwqCF2JmuXJTy50roRgdMGlWg2UxoDxfZz3OjyM1GeOKWLB8uwpvA4AwSAs/jw9OcM
         MvRpJy3HJMIV5pJOuqNc7KH2ZxCRBVOGMCHgCxqfJ2Q3pLTELgGX67vmld+RdjJ6w9pV
         JO7VlvTA8lXpb9OWyDVrB8+22RlDS0dWnfOLERE/4DFs2x4stvvr/gqeGALrMWP9h6Xs
         OWze7OHLsGrduODS2mU3eTbVntXopgvvjTWssz6YQCQEAdq8CbsOhZKzVAtc4UiuKZSd
         lbCtWHOmpe5te3qWjj8ASc9pWjJuLFi0h2ETefpiAV0hQZWBQufCWly/Foc+JfX2+WqI
         Xk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318371; x=1791923171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSe30C9nuopmWe1imB4fd89GgM0gTjdnTgOkvxSD408=;
        b=wen/r60bG6SYwbCvKEWdDwYqwJZdHfpVxzU8bhuk2tTbmWoxvQbkGUhTljqR3XGpt+
         J2ldPsJJ08ll+ARB630p/DGTTUGAXC39OxLRH5B8vJYHBcKH90AFnn16agADbkXP7TOg
         AAoInLZpPG+NDWtyO+1oEMKcXjvTdvZbWMl3pNS/QnqjcBOmnf9aE2ixMyt6vcFGlnhb
         cyPiI05P3h9zhlGuzuBD1HJRNEJ8fbIlof/EKUyXeBkmb/c1Vfb3+9S1yU0KmPUiC6we
         m4jNYtIjtBbwPFVpFwDF36olJ6yTReAGDM4xi+zT+HHSXe6ii4Ll7IvbPws8Z++/JvM6
         QaEA==
X-Gm-Message-State: AFuF++lvSeQ7UuM3MSq8BBU3kEDu9X1LknBt4lARk7Gah+/iMYLVpo5h
	1Ox0hcnZCYiQsjhp4R+yCnuD9l3VjO+ujzcLHjEr9S5Dw5KYrfjHS5laTYb7q0BJf97BbJL3I1P
	oLtTdd1nLzz5vlgA1AereSr1xh3ujtHE=
X-Gm-Gg: AYBFou17wP2I35Wm948ac2vYRQHith6L8+uMlpimT+G1iI9kFn4ds53dZRbYAD7ACbW
	wTi1VCFk1dbK+gDOXpY0ILVxF6UwIwrCfc3IM/YYoCHZLHC0EA49+gAiL7mg99bN9RDSJ1nAmSW
	dlxGKd951E18a6GpS9Le3VKWtikvEp6/8siL1r81WfarWIr39zg5tP9jfVfv9Xi6D3tgdlztGyb
	ub5VItweJ241+DWDkHW3dz6/WhbPQ/FWbiLjahQhxYQ+KuWYygMqI/j05pORUrpuGOKdnmZPu/8
	mw6YpNlIw6UPhJ9Ggw27FmizzaPFGyDLza1X4uFdf8E0Tai7Zf8escpdU067nxIN5jg0LQ==
X-Received: by 2002:a05:6871:287:b0:448:cf96:25c7 with SMTP id
 586e51a60fabf-4a25947177dmr89149fac.17.1791318371475; Tue, 06 Oct 2026
 13:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
 <20260924043315.1663186-12-ankur.tyagi85@gmail.com> <CA+s=J=yDWh+q+D0eC10Gu0SWPjEXipA3w9RJScaXoRM4tLhnFQ@mail.gmail.com>
In-Reply-To: <CA+s=J=yDWh+q+D0eC10Gu0SWPjEXipA3w9RJScaXoRM4tLhnFQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 7 Oct 2026 09:25:58 +1300
X-Gm-Features: AclHuK8QVOWMz_5k44eBVB6pXLRwkswa5dhkMAOfdYjG8oXXq237zabRyWRgSX8
Message-ID: <CADySD0EVsBQj+wUC-F49EvGHRCOZtPsUGQAboNmhBOxkbBGrRA@mail.gmail.com>
Subject: Re: [oe][meta-networking][wrynose][PATCH 12/24] strongswan: patch CVE-2026-78130
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 20:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130638

On Mon, Oct 5, 2026 at 10:49=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> On Thu, Sep 24, 2026 at 12:34=E2=80=AFPM Ankur Tyagi via
> lists.openembedded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Use patch[1] provided by strongSwan[2]
> >
> > Details:
> > https://nvd.nist.gov/vuln/detail/cve-2026-78130
> >
> > [1]https://download.strongswan.org/security/CVE-2026-78130/strongswan-5=
.1.3-6.0.7_x509_ac_issuer_null.patch
> > [2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-=
(cve-2026-78130).html
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../strongswan/CVE-2026-78130.patch           | 49 +++++++++++++++++++
> >  .../strongswan/strongswan_6.0.6.bb            |  1 +
> >  2 files changed, 50 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/strongswan/strongsw=
an/CVE-2026-78130.patch
> >
> > diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-=
2026-78130.patch b/meta-networking/recipes-support/strongswan/strongswan/CV=
E-2026-78130.patch
> > new file mode 100644
> > index 0000000000..36025c8093
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78=
130.patch
> > @@ -0,0 +1,49 @@
> > +From 254d971bbe7479fe5fffc34cd1dd1e349a48e7aa Mon Sep 17 00:00:00 2001
> > +From: Tobias Brunner <tobias@strongswan.org>
> > +Date: Fri, 19 Jun 2026 11:57:48 +0200
> > +Subject: [PATCH] x509: Avoid NULL-pointer dereference if issuerName is=
 missing
> > + in attribute certificate
> > +
> > +If neither authoritiyKeyIdentifier nor issuerName are encoded in an
> > +attribute certificate, the validation in `acert_validator.c:verify()`
> > +will cause a NULL-pointer dereference via `issued_by()` (the lookup
> > +with NULL identity will enumerate all trusted certificates).
> > +
> > +Fixes: 26930a8c3e42 ("certificate factory can load certs from file")
> > +Fixes: CVE-2026-78130
> > +
> > +CVE: CVE-2026-78130
> > +Upstream-Status: Backport [https://github.com/strongiswan/strongswan/c=
ommit/bee6ce27761e1f38958be36ebe6688ef963c3d22]
>
> Some of the patches in this series had typo in URL. strongiswan ->
> strongswan. I've fixed these locally, so no need to re-send.
>

Thanks Anuj !

> Thanks,
>
> Anuj

