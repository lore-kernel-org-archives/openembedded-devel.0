Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94770C77B7D
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 13:49:09 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.17616.1683726546355163885
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 06:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GqbDpqMd;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ab1fe13644so1176333a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683726545; x=1686318545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmUsKJcWB7hfQrpgViJNjoFTQqH1XTDilacBdtQTUvc=;
        b=GqbDpqMdiLsVpLUxQOEBn81LFOVoWW0c7sYE4iE9enXdJehqC1g96QB5sQsSg1nuy9
         a4aqTFtaxeVtguorksChbU0XwtCgoYmsjEawgPpAQuHPdZi5c1daufv+usHnPPJXEC85
         BMfyWKk3Zev9R1Vk1AIzgXK9JVd8+PKvU7fAHd2Om9mD8GrWD3YOGXzrCyi0wWk/vkbv
         xBMIoQOw9ZcEeERU2n6rgiRzoPBR5EyGp1eY+xRJz8y9GMoQ7DfyM6oeiQvBwAAYGkbd
         P/y2BEZxtRYfXE4t6Ub8qihdHa9qBH3ywN/G7QaSYSKFLbxr68FsiGVGdKa5hx126Y8V
         dnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683726545; x=1686318545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmUsKJcWB7hfQrpgViJNjoFTQqH1XTDilacBdtQTUvc=;
        b=emBVbqUQt49l2Bgy+qp3FtTxSOTr7/dlnA2opfONFyWzk12etIiFLBcX20VzkKHIPC
         jMi3MWyKKWjPmup5LzXEYKsdDJmskYbXAjY0FZrc5eRSa5KhKxLKzmhupVg3cCltESzB
         pNfkZJTq5GkcktI7BpRp4cwQPl/4bwmygFoX9DyGfDgG82zzeuBBeWLRXeE5aq3bzLOU
         4dcYKzneCJCz7CCKQ7Z0LUADKZzYwu8ehew93FRAT57Gxc9PY84ZHiOEeuFR0SxthQqc
         ur2vuQ3sf6PkaT+31QONXIMXfU5zoiCZWYLvfXBbgB7RN6EiL+9T1LYivFsCBfPw75Er
         c3NA==
X-Gm-Message-State: AC+VfDwiLUpARL33ITs/4fZPR/QMl8h0vSXkmZBkeygMjC4a1bTu9HbW
	Lez3M9DPSneziYBKZFVT0wVh6MiCFOWuot9pjBc=
X-Google-Smtp-Source: ACHHUZ7/oHc3EafK4hATfL8NXNSYa/o82HnfEnBgbnWPQ7NegFWyqAXSxjOFuvLeQYUbkleCFD850ywWakoxtGkTujY=
X-Received: by 2002:a05:6808:7c3:b0:38e:4e3:aada with SMTP id
 f3-20020a05680807c300b0038e04e3aadamr3034359oij.38.1683726545346; Wed, 10 May
 2023 06:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <a50f215b-ca3c-77c9-b14e-2479f2ae8296@gmail.com>
In-Reply-To: <a50f215b-ca3c-77c9-b14e-2479f2ae8296@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 May 2023 06:48:39 -0700
Message-ID: <CAMKF1spR0S_w7o2UB_ciUw=XirAJ2ri5-0uFw-jiCUGahtoZwQ@mail.gmail.com>
Subject: Re: langdale merge request: May 10th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 13:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102532

merged thanks.

On Wed, May 10, 2023 at 4:25=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 3d1ec70ed319c1b7f561fcda7b8cd0c2e0b2c2=
62:
>
>    dleyna-{server,renderer}: fix dev-so QA issue with multilib
> (2023-04-18 06:45:59 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded langdale-next
>
> for you to fetch changes up to cbbaa82238cd60f08c9b9cb58dde59d5f9318c7b:
>
>    python3-gcovr: Add missing runtime dependency (2023-05-08 09:51:05 -04=
00)
>
> ----------------------------------------------------------------
> Arsalan H. Awan (1):
>        meta-networking/licenses/netperf: remove unused license
>
> Changqing Li (1):
>        redis: upgrade 7.0.9 -> 7.0.10
>
> Jasper Orschulko (1):
>        python3-gcovr: Add missing runtime dependency
>
> Valeria Petrov (1):
>        apache2: upgrade 2.4.56 -> 2.4.57
>
>   meta-networking/licenses/netperf                                | 43
> -----------------------------
>   .../recipes-extended/redis/{redis_7.0.9.bb =3D> redis_7.0.10.bb} |  2 +=
-
>   meta-python/recipes-devtools/python/python3-gcovr_5.2.bb        | 2 +-
>   ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 31
> +++++++++++++++++++++
>   .../apache2/{apache2_2.4.56.bb =3D> apache2_2.4.57.bb} |  3 +-
>   5 files changed, 35 insertions(+), 46 deletions(-)
>   delete mode 100644 meta-networking/licenses/netperf
>   rename meta-oe/recipes-extended/redis/{redis_7.0.9.bb =3D>
> redis_7.0.10.bb} (96%)
>   create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9=
.m4-Add-server-directory-to-i.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb =3D>
> apache2_2.4.57.bb} (98%)
>

