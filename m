Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E77C77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 14:56:03 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.24144.1684248953273858851
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 07:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gNOa5nA8;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-199c95698baso2033783fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684248952; x=1686840952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJCmJUtGjf05/4o4JTPFzPzuJ9jLhuVE2O9DxWQ/Zq8=;
        b=gNOa5nA8wedJA/px08rfCd+Dlwo0bSqX4YBSO7i5pYZdNkTRCKgmSWkMTNJYV7oLI6
         DUlodfCZFTxURq+suvnz4jakxAwsPzmT1LDbCLsCbCKIv0jjybla15uGutfHSeVVVwfy
         F8Oq6DxPqbvHAQwZeKj5PM2jPm2bsvfflkNLWRcML8N3M3myiZrM3lV34rH9sG4WpXjL
         awvwqKg7/uXZYGR4v1xvi14fvakh4ir9Tswp+tGpFKbHZHgiobWQocnhePEDLMS+qsKQ
         Ycq1U+FSrM3PxuqI9eA5Wb9VVGYBnYY9B4gL2uE3oUkxw37NbOLP9B+CnAYBS+rW+4XW
         EaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684248952; x=1686840952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJCmJUtGjf05/4o4JTPFzPzuJ9jLhuVE2O9DxWQ/Zq8=;
        b=LszdIlpRRD3cHVqvNxW3OIFyHo65Gh/1830g7ZxPC3VZRcZMftO+gmN1YsVUTOsZsW
         IQU2C72AFcuxaFkDD1Bt58mN0YthQhXEgRczCjMpnk8ihXyotnCKVWRESfqy0VojEMcA
         D3MFKR8aA4+C/cnUmzjaRxkhK1BMmqlZaKzcopS2BMagqpU9g9zm9HT/e8oSy0zXZf9S
         yVSjV5Nlilauj82WHRyEAu087JHrc0MWcXtMou41x1yuiLcSYRcHyi9xrMHx79Gs/hdW
         ZqaRPFYANUwM7+SeLdbX2ybAOp2iSCkvwbaAWYAYxQiLzZXq9wt4kvg6w0GBgh8yQrs0
         SF5w==
X-Gm-Message-State: AC+VfDyOy4XXD+6O6qVCrP/fVtqbWj+VPl0WOH16ai5NqSViCWgkXo5w
	kvDkafkSSjiY5VDlufomkNBVEy3tQVY2qpJ+7Us=
X-Google-Smtp-Source: ACHHUZ7JJMaL+xmM4YRldAKI+7WB+FLzdIGE2+sMR9m78CpC6d6ts8xO4800K2oDVCUb577AuQmrEBxIH+5ZzFEB63E=
X-Received: by 2002:a05:6870:5316:b0:183:cc50:f7e2 with SMTP id
 j22-20020a056870531600b00183cc50f7e2mr8234178oan.49.1684248952351; Tue, 16
 May 2023 07:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <095ad873-2d15-5f66-52fc-5c4e34be3348@gmail.com>
In-Reply-To: <095ad873-2d15-5f66-52fc-5c4e34be3348@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 May 2023 07:55:26 -0700
Message-ID: <CAMKF1sr8uampG5S7vDymeMdf3EsRaMFVLCQr6+b1rLVMTWOhTw@mail.gmail.com>
Subject: Re: dunfell merge request: May 16th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 14:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102630

merged thanks Armin

On Tue, May 16, 2023 at 4:12=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit e39b002df9675776cc99dccdcac07607ce783b=
15:
>
>    multipath-tools: CVE-2022-41973 Symlink attack multipathd operates
> insecurely (2023-05-05 07:20:59 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 116bfe8d5e5851e7fc5424f40da8691a19c5b5ee:
>
>    nodejs: make 14.18.1 available but not default (2023-05-16 07:09:25
> -0400)
>
> ----------------------------------------------------------------
> Jack Mitchell (2):
>        nss: backport fix for native build failure due to implicit
> casting with gcc13
>        nss: backport fix for native build failure due to dangling
> pointer with gcc13
>
> Narpat Mali (1):
>        nodejs: make 14.18.1 available but not default
>
> Valeria Petrov (1):
>        apache2: upgrade 2.4.56 -> 2.4.57
>
>   ...01-Disable-running-gyp-files-for-bundled-deps-nodejs14.patch | 22 ++=
+
>   .../nodejs/0001-jinja-tests.py-add-py-3.10-fix-nodejs14.patch   | 40
> ++++++
>   ...0001-ppc64-Do-not-use-mminimal-toc-with-clang-nodejs14.patch | 27 ++=
++
>   .../nodejs/nodejs/0002-Using-native-binaries-nodejs14.patch     | 62
> +++++++++
>   .../0003-Install-both-binaries-and-use-libdir-nodejs14.patch    | 84
> ++++++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14.patch | 21 ++=
+
>   .../nodejs/nodejs/mips-less-memory-nodejs14.patch               | 32 ++=
+++
>   meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb               | 205
> ++++++++++++++++++++++++++++
>   ...1-Bug-1812671-build-failure-while-implicitly-casting-S.patch | 46
> +++++++
>   ...1-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch | 75
> ++++++++++
>   meta-oe/recipes-support/nss/nss_3.51.1.bb                       | 2 +
>   ...1-modules-mappers-config9.m4-Add-server-directory-to-i.patch | 31 ++=
+++
>   .../apache2/{apache2_2.4.56.bb =3D> apache2_2.4.57.bb} |   3 +-
>   13 files changed, 649 insertions(+), 1 deletion(-)
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for=
-bundled-deps-nodejs14.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3.10-fi=
x-nodejs14.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc=
-with-clang-nodejs14.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries-nodejs1=
4.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-use=
-libdir-nodejs14.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14.patch
>   create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory-nodejs14.patch
>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
>   create mode 100644
> meta-oe/recipes-support/nss/nss/0001-Bug-1812671-build-failure-while-impl=
icitly-casting-S.patch
>   create mode 100644
> meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dangling-=
pointer-warning-.patch
>   create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9=
.m4-Add-server-directory-to-i.patch
>   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb =3D>
> apache2_2.4.57.bb} (98%)
>

