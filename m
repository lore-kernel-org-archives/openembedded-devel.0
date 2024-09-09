Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84B3ECE588
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 19:19:26 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.4696.1725909563109299599
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Sep 2024 12:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZeY1VzAO;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-277efdcfa63so2794543fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 12:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725909562; x=1726514362; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmWle5CudaNWvdiMSa99uRfcGHsRMwa28pRxfS7a02U=;
        b=ZeY1VzAOgkza/FeADcfbd43U+wdHeFt1etUs1rwan8iTps8zuZ3l1AYdBPmHTGyJhl
         osUbE17erpG0eWLd2jvvPgYsGVqR0spv6NZVPby11/ZlwcKm884G2+LaZTD1Yl1Plqal
         NAGnFrbrHAsqCV50hff5sEadDg/tcJQ8ycFBJ3MiD3aBBr7OCADozxFnZwowh1jnSkPh
         fVy5o48LP8DfXDyRjY60iST8iAPir22GPdwEWOYwg41Y9Yp+k3Ptry9/WRl636fr+GyG
         lza7JpFoSBjtHcQVbqVjNIFyQCmNMMshmikJCX1sk+D/RSm1KF4BCpPU7xIQLWLh/Ntb
         zWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725909562; x=1726514362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmWle5CudaNWvdiMSa99uRfcGHsRMwa28pRxfS7a02U=;
        b=ozSR/xZ52cnamCWT6J9nsmRIF7F/sU8gwgHcPgxM1Z3vU4VJzeqq9M2sq0xcyquwg6
         QEAcTG0GRFrM3fPMWqvJc22cKzc8ixLbyPFntTxAY0bU4mE9BrAIvkrFl14PhMKUIgK4
         NxMtYydQ3H7qc1QQ43EFfv+WJRdIRAkczi2UxtWiFNjuk0bjegoM/6QhmEOE4VSlFfit
         7R0c2FrCFzppnGqymrhWhCs8XpGAaFJQkGQW/+VoTJ5AyD/gBAa9ado9yYRc6MEJtJMs
         y/mAQBX65DySWQpLXTb5HPR0i2AXgDOYasPxQtOeKGNd9lda74FtQmivAIFoBNgI+Voe
         CyBQ==
X-Gm-Message-State: AOJu0YxblcjbfQnArAV1x4Mb8M7m8BgLhauCVLwfc/QdXfXV9qxBJF59
	ta5g4EJqASc4GD/Yv+z0Tgb3ebhkYfDNgXn63cXx8TzJTcEcF0jk1qaMOfQt+V6LDlW8s3l8VuB
	bAVcwCGJTBlGIqLv3mQZ4Ghaq3cY=
X-Google-Smtp-Source: AGHT+IFZnj9CgfHV3NxlYskeNjQQ9NCn0J3btoIOpZY33WZw8Ptxg4U3G//a4iQpBv/TOQHzTLGSrWOc/y2w3EzjZcI=
X-Received: by 2002:a05:6870:e30f:b0:270:10df:3b63 with SMTP id
 586e51a60fabf-27b82e139e0mr13463893fac.13.1725909562195; Mon, 09 Sep 2024
 12:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <03a2bd82-a804-4794-9d1d-c42cc2f51cf8@gmail.com>
In-Reply-To: <03a2bd82-a804-4794-9d1d-c42cc2f51cf8@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Sep 2024 12:18:55 -0700
Message-ID: <CAMKF1sp+Dc8TNrLVP==1nMnKA02WpsmGfWcwV1pVFBVHAwi1Lg@mail.gmail.com>
Subject: Re: kirkstone merge request: Sept 9th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 19:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112185

merged thanks Armin

On Mon, Sep 9, 2024 at 12:07=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 52ecd66835dcfd8b4e55c9cb6325908ccea6a4=
e7:
>
>    nss: fix failed test of nss. (2024-07-30 09:45:11 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 9a24b7679810628b594cc5a9b52f77f53d37004f:
>
>    python3-django: Upgrade 4.2.10 -> 4.2.15 (2024-08-25 18:12:52 -0400)
>
> ----------------------------------------------------------------
> Ashish Sharma (1):
>        nginx: Backport fix for CVE-2024-7347
>
> Hitendra Prajapati (1):
>        krb5: fix CVE-2024-26458 and CVE-2024-26461
>
> Soumya Sambu (2):
>        python3-django: Fix CVE-2024-42005
>        python3-django: Upgrade 4.2.10 -> 4.2.15
>
> Vijay Anusuri (1):
>        postgresql: upgrade 14.11 -> 14.13
>
>   .../krb5/krb5/CVE-2024-26458_CVE-2024-26461.patch               | 207
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb                | 1 +
>   .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 4 +-
>   .../postgresql/{postgresql_14.11.bb =3D> postgresql_14.13.bb} |   2 +-
>   .../recipes-devtools/python/python3-django/CVE-2024-42005.patch | 84
> +++++++++++
>   meta-python/recipes-devtools/python/python3-django_2.2.28.bb    | 1 +
>   .../{python3-django_4.2.10.bb =3D> python3-django_4.2.15.bb} |   4 +-
>   meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch  | 34 ++=
+++
>   meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch  | 52
> +++++++
>   meta-webserver/recipes-httpd/nginx/nginx.inc                    | 2 +
>   10 files changed, 386 insertions(+), 5 deletions(-)
>   create mode 100644
> meta-oe/recipes-connectivity/krb5/krb5/CVE-2024-26458_CVE-2024-26461.patc=
h
>   rename meta-oe/recipes-dbs/postgresql/{postgresql_14.11.bb =3D>
> postgresql_14.13.bb} (84%)
>   create mode 100644
> meta-python/recipes-devtools/python/python3-django/CVE-2024-42005.patch
>   rename meta-python/recipes-devtools/python/{python3-django_4.2.10.bb
> =3D> python3-django_4.2.15.bb} (59%)
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch
>   create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch
>

