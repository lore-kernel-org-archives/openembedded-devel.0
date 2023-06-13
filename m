Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A09C77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 05:48:14 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.7084.1686635293160687523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 22:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Rf2TUlKy;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1a6820804abso1680289fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 22:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686635292; x=1689227292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBvaKIRPOf7CTRJKju9TOASlbaXy1oG41J4Xe47uH58=;
        b=Rf2TUlKytFIvVq4rZfHcAtSptRAWIPSHfUHFhNsJYOeA0NCXsUkQHVwqxzEYDauCPW
         nBJG/CfPtN1iF9Rqz5401CnjJpJyn5L0kVYpagptBDHUnNJbmTBmau00ErI2vvsZgJgn
         yAHIQM1ukV4AOA1FAsUuYJd79PTbszMxAYVp7lL482h6+6sv66DeRijD7tGDE/uUf1Uc
         3dVAsTZVlgMWCZ463Lkwde7O5WZLhyaFbGtCs5WF7E7N++4R4mcRL5Stlt4zisJBpUz5
         g6IuQllLpQXQSLx6lYKGCML9GAylbBmmuGVHEJs/gQIlr7SxQVDXs/G29y+9oR4ODcuU
         EG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686635292; x=1689227292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBvaKIRPOf7CTRJKju9TOASlbaXy1oG41J4Xe47uH58=;
        b=VGPWPXc5BcedsPDMv7V+6rb42/z50Qm1canS2jP4rBpAftFz80nmMdoXajyLaVEbPY
         MFnKqFyUp9I+wZ81Epn5lEjDAnEJQkUZNeP/P7CxvLWu51lWvj9ZrUjMuCuEHkJIMuh+
         OcfwG+M18PWXzDc5FJz9x97J/1iaKL/axveJbHiiPnqRa9wm3qZ/XtJZQF0Ods8H0ZU9
         YBIHSY6iWUapqKzto0pe44c49kk4izhybZWr/nrUSwbFnJ44KQheIwMINL7o1rhZomXr
         z5FMWebhN1cBBYZDL2jTSN+kgdaskD87hQKKc/KVQR5UhF2MY6pP73ydNB/2QBE/ACMo
         DzIA==
X-Gm-Message-State: AC+VfDy/dgqeuUNL/JDkG+mIPoGn6pxxzW6Lgz19Wb/1vSWzB8DhngI7
	wClEXms1iKFsW9TupsfdA/tvYmziKL4RMQdkl4gTVWcpUKQ=
X-Google-Smtp-Source: ACHHUZ5ZqDVElBjm4GXGXNNEafFo0kztrg1l6iGvwx5RDOX8TuYN/GMA4UL3Sb3+IPadQT+DPCzoz3F3ry6TX/4mYHc=
X-Received: by 2002:a05:6870:5b32:b0:1a6:811d:f7dc with SMTP id
 ds50-20020a0568705b3200b001a6811df7dcmr4529225oab.2.1686635292201; Mon, 12
 Jun 2023 22:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <1747474539.3138796.1686633366135.ref@mail.yahoo.com> <1747474539.3138796.1686633366135@mail.yahoo.com>
In-Reply-To: <1747474539.3138796.1686633366135@mail.yahoo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jun 2023 22:47:46 -0700
Message-ID: <CAMKF1sq_tn2QHQtjEJ8yg5fZ4gOp_Aj2fNFobJufGEvqBQBoqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] exprtk_git: Fix SRCREV for exprtk_git
To: muhammad.hamzai@yahoo.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 05:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103258

which release is it for ? master branch already is at
f46bffcd6966d38a09023fb37ba9335214c9b959

On Mon, Jun 12, 2023 at 10:16=E2=80=AFPM Muhammad Hamza via
lists.openembedded.org
<muhammad.hamzai=3Dyahoo.com@lists.openembedded.org> wrote:
>
> exprtk_git recipe uses a SRCREV that does not belong
> to any branch and results in a fetcher failure when bitbake
> tries to fetch it.
> This commit updates the SRCREV to fix this issue.
>
> Signed-off-by: Muhammad Hamza <muhammad.hamzai@yahoo.com>
> ---
>  meta-oe/recipes-devtools/exprtk/exprtk_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb b/meta-oe/reci=
pes-devtools/exprtk/exprtk_git.bb
> index 52975c821..557c4f27a 100644
> --- a/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> +++ b/meta-oe/recipes-devtools/exprtk/exprtk_git.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/ArashPartow/exprtk"
>  SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> -SRCREV =3D "281c2ccc65b8f91c012ea3725ebcef406378a225"
> +SRCREV =3D "f46bffcd6966d38a09023fb37ba9335214c9b959"
>
>  SRC_URI =3D "git://github.com/ArashPartow/exprtk.git;branch=3Dmaster;pro=
tocol=3Dhttps"
>
> --
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103256): https://lists.openembedded.org/g/openembedde=
d-devel/message/103256
> Mute This Topic: https://lists.openembedded.org/mt/99499725/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

