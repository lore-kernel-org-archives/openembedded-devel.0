Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00305C3063E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:11:09 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.190219.1692285064544090593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 08:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=akvmwH7A;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1c0fa9dd74fso5286712fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692285064; x=1692889864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oeC7ez/W0wSN+UndcS+R6vPwWSR4rI/F1HC820JkMs=;
        b=akvmwH7AmCxP4HbFg9116iFqBSZWhR8nZNRJ8sZX8flLD4OsFioGVD/xFlkQi/ZGVu
         c/jd2b928wEE7lTtCWlVu6ZP8dFeb/zAKLGAbNK4ia94gOZJ4GnCn5xOzzjAbgCYq1Do
         eGjyH0EGxZvNp/KyPtyL+mw/p7xf8Xt8Yj7YJKRfm+nuFrGbQeoHs3o2OMf7T5RxdzD+
         rZcWLoxLn62g+cgYqCgRhBpDQdSnTkBMFkehI+SdypsFf/2N0YIgtm65ungip2KKa114
         dyG2odXJ7kaFRswjMqG9s1lOGX1W5VVdj+zA/KSnmjdMa9uDc7Z3AnASvRxDP6/0r54o
         UitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692285064; x=1692889864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1oeC7ez/W0wSN+UndcS+R6vPwWSR4rI/F1HC820JkMs=;
        b=FNI5A7CHQuczll2FkACDzwbpzhXTyivXQSsOzOrYXhQYWGStXWpvDU5+yPS28VHkZd
         SRF4zZtnbrNNaSxJy34xRcffUglD3gb0KbFKmQK0LPqvp9DbNfZYhMNmgWBDrdYj8Xq8
         PQqYYOWeKz1YVcSitkPE7wmbrxZFX8DakdJWQGcvoNeMr5gP1EJqxan3WvDYMaA1tFvL
         hUV6s/4eqHqRATCe8oIZf4MuHSfqMszo9zifJ/+YIoPs0cLnvvMGvWraL9zkBP+8rWRL
         qr6EYkJPItDjcQ3MmJIFEosdnwN3FKB33jNTzYlOe2Ik1eMHujTsMokQNO74LgaQ0PSA
         +MFw==
X-Gm-Message-State: AOJu0Yz3GCZnZVoabDE3NTP5x9aFqGqqUhRtVIDX7TWiViw+gUUnDa/N
	hheSWnOrQAA1IulBm4G5oeWokhYLT3QG8rtxh2RAnI/RP5o=
X-Google-Smtp-Source: AGHT+IFSwS+MPRPQn3ncWF5LMQIqPBbWKoVliIPQbqSWWEwXQjBWqDTfejpsFMamBzPV7l2VC6afuZcP0I8C0SSL+sI=
X-Received: by 2002:a05:6870:ac20:b0:1b7:308e:6cd9 with SMTP id
 kw32-20020a056870ac2000b001b7308e6cd9mr6958569oab.5.1692285063513; Thu, 17
 Aug 2023 08:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230817121421.3519563-1-ewa.kujawska@3mdeb.com>
In-Reply-To: <20230817121421.3519563-1-ewa.kujawska@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 08:10:37 -0700
Message-ID: <CAMKF1sqHnuvfYfJO4pvqTzat2Mqog2NWGSJ=pwxO6Ra2ypr4bA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-oauth2client_4.1.2.bb:
 recipe added
To: Ewa Kujawska <ewa.kujawska@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 15:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104465

is this patch on top of last patch ? if so then its not a v2 but
incremental change. Usually I prefer a resend of whole patch with
rework on next version of patch.

On Thu, Aug 17, 2023 at 5:14=E2=80=AFAM Ewa Kujawska <ewa.kujawska@3mdeb.co=
m> wrote:
>
> Signed-off-by: Ewa Kujawska <ewa.kujawska@3mdeb.com>
> ---
>  .../python3-oauth2client_4.1.2.bb             | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python3-oauth2client/python3-oa=
uth2client_4.1.2.bb b/meta-python/recipes-devtools/python3-oauth2client/pyt=
hon3-oauth2client_4.1.2.bb
> index 96508007b2f3..0301763030e0 100644
> --- a/meta-python/recipes-devtools/python3-oauth2client/python3-oauth2cli=
ent_4.1.2.bb
> +++ b/meta-python/recipes-devtools/python3-oauth2client/python3-oauth2cli=
ent_4.1.2.bb
> @@ -1,2 +1,19 @@
> +DESCRIPTION =3D "OAuth 2.0 client library"
> +
> +HOMEPAGE =3D "http://github.com/google/oauth2client/"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D038e1390e94fe637991fa5569daa6=
2bc"
> +
> +inherit pypi
> +
> +SRC_URI[sha256sum] =3D "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c=
90d069cdfc9dadb5"
> +
> +RDEPENDS:${PN} +=3D " \
> +        ${PYTHON_PN}-httplib2 \
> +        ${PYTHON_PN}-pyasn1 \
> +        ${PYTHON_PN}-pyasn1-modules \
> +        ${PYTHON_PN}-rsa \
> +        ${PYTHON_PN}-six \
> +        "
> +
>  inherit setuptools3
> -require python-oauth2client.inc
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104462): https://lists.openembedded.org/g/openembedde=
d-devel/message/104462
> Mute This Topic: https://lists.openembedded.org/mt/100799067/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

