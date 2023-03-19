Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FA6C7618A
	for <webhook@archiver.kernel.org>; Sun, 19 Mar 2023 16:20:22 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.20083.1679242817691108285
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Mar 2023 09:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RFNWRnJ2;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-17997ccf711so10885406fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Mar 2023 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679242817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3zmBbWLh7v7HgjJGc7JPq8sk99V+WPWUmTa7qcTp98=;
        b=RFNWRnJ2bsAhGxk5RUJ14lxjrx9NqYoR2bfsR2CSQ5NA8nwlsM3VctdcuEiD8jJNba
         f2y54LVjlZSaDiZiCkAIy5xJQMn374wDYpTOo9qJFRJ66aKqzPHXEEsvYnlRSVLO7tGa
         oiG4g2Z2OqKNn5G8Dh7mwNCjX1DpPCAbKbWNGXugobAlNNkwaVzVKTJ0z78nEzbx0Mzd
         eB0rFly40adwKLaiXqxCmonfqAXWYU4LaKrASJU9tI0N4a34lXKNG2rWBMEipZ+SXNXR
         E7wfz7oKRKGwru0KS52eqoQkG28/hHuZJCIciNuQxqjVy7mF9Yx7aImnYNj/8f99jMcG
         4MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679242817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3zmBbWLh7v7HgjJGc7JPq8sk99V+WPWUmTa7qcTp98=;
        b=EMb0yDA3rk2Sqq0kPiX1tsJjpb2AbnHrDzwbaHha70CZEL45TmiRGVOdSPV8LE0Y06
         d/en3Ck2SQHnh8JvAHa4Ydtk3LWojzb85yZqwHWvJCOfXNve5+BCcKuffMqAuqGa8lcW
         MuPJaXsfIImu7+ApkcBCUEnZCRrdxlXmyYMr8VAbaSoTn3k4fMjXl5AjLtWtn2V/F7im
         swXD76K7D33cixsxgiwAGaCvwxMcJxtjOFyifSa6Z5jmcr/4cicI2msDhkrpBEeiuWLQ
         +lqRnSnTiELjHIKDuhCRMH1sSwK4jQhrrBUAE57Jmv6I/vOKMn0WL5YVNzqCEJ4aUcXt
         COPQ==
X-Gm-Message-State: AO0yUKVEIEyaZWEh0lLnfqyCj6hHs7JzuJMo6xfjaeAlCi9MCGGVuL5w
	56yxmWK1YcJHWJv/1WnP/HGAzJZmAdd95EyNLpQ=
X-Google-Smtp-Source: AK7set/X4DUbWEgDcakP/31vmRJdETAPjl9kR6R5pYX7oRshgZQ+ASHA6uy7NOS0osHSrtosIN2dnbxfuKqQnbp45QI=
X-Received: by 2002:a05:6870:ab85:b0:17a:b1f4:860b with SMTP id
 gs5-20020a056870ab8500b0017ab1f4860bmr1886040oab.2.1679242816844; Sun, 19 Mar
 2023 09:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <dcbbd8eb-4864-7514-563b-a79f722e820e@gmail.com>
In-Reply-To: <dcbbd8eb-4864-7514-563b-a79f722e820e@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Mar 2023 09:19:50 -0700
Message-ID: <CAMKF1spQsAAR1bHA=LQpY9STjHo=o4fZ7YWPxdVAjVseRS=SXw@mail.gmail.com>
Subject: Re: dunfell merge request: March 19th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Mar 2023 16:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101598

applied thanks.

On Sun, Mar 19, 2023 at 5:08=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 87571345059f82fb7599e3aa82e6fdcfbd3610=
98:
>
>    zeromq: 4.3.2 -> 4.3.4 (2023-02-22 11:24:23 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 7ae42df58f2bcc730153715c3339a6875b0b2497:
>
>    xterm: Remove undeclared variables introduced by backport (2023-03-18
> 16:16:42 -0400)
>
> ----------------------------------------------------------------
> Chris Rogers (1):
>        xterm: Remove undeclared variables introduced by backport
>
> Poonam Jadhav (4):
>        nodejs: Fix CVE-2022-32212
>        nodejs: Fix CVE-2022-35255
>        nodejs: Fix CVE-2022-43548
>        nodejs: Fix CVEs for nodejs
>
> Priyal Doshi (1):
>        open-vm-tools: Security fix for CVE-2022-31676
>
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-32212.patch     | 133 +
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-35255.patch     | 237 +=
+
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-43548.patch     | 214 +=
+
>   meta-oe/recipes-devtools/nodejs/nodejs/CVE-llhttp.patch         | 4348
> +++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb |    4 +
>   meta-oe/recipes-graphics/xorg-app/xterm/CVE-2022-45063.patch    | 21 +-
>   ...1-Properly-check-authorization-on-incoming-guestOps-re.patch | 39 +
>   meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb |    1 +
>   8 files changed, 4982 insertions(+), 15 deletions(-)
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-32212.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-35255.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-43548.patch
>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-llhttp.pa=
tch
>   create mode 100644
> meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Properly-check-a=
uthorization-on-incoming-guestOps-re.patch
>

