Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B58C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 20:32:55 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.5168.1742502768873041904
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 13:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lY6E8dSN;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f8ae3ed8adso597107b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742502768; x=1743107568; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEY5nRHkXOKQuL9R6/RbgR8pCLdKVksKk3qqO4iw5JA=;
        b=lY6E8dSN/ymuYVY03uAzgPaIdZUr4qPvfBbymgG3adTZ8f30kQAOFIsCOVQMEApkEt
         9VGobHq3izFU/64D+g2JjgHKJp8srGHDtY8j3BO6zt3usgxYhldaZAx+liDT1zMgO8qh
         u/TZXHo14GApDa26rJF2bVIszb0TKNI0nr7de6cw292zG5P14ZxtsnrX32DqrgKvLDJI
         CNgxM3XKX6NsQh3tcLIzPaMi1wuscFHLC/weRzdVpEQxvviQcmI6B207BgGMNcly+mB/
         fdAhHDzu3Q46oVKXAc2xjc2wUdRBO40OkwEebi2PHSqMkRJvHxUA7IqJrm9xOrubCZDi
         ibjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742502768; x=1743107568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEY5nRHkXOKQuL9R6/RbgR8pCLdKVksKk3qqO4iw5JA=;
        b=E9k3kuDKr8J2nPmsmsSp3/LNpfYKCv1vyjsjzOr43R7vgbg13mRXHKBi1y63oqpvDA
         y8I2jJaxsqX+v9BbYoErCEh9dOKMMr7dAbqStAkds4QXBd91TKJtu04KuaPaV2w3uGC4
         LRE/8Q2us8zc2AWR9wRpQwS6RS5b5sjraupBN7a1jdxo5TLO1tOLOhv0d1AIrLf7Mcn6
         GxiaeC22dE3WbNtVOx61quWRDhMMbqgnYaIPOdt86iFtGCGd0aoxKEfV2dJItKxi1ePQ
         jSTxMS7tar6K9Y88YR5XrqWsJ8GdbgN16y3yesilALxQnEqKGrKnZqMxwqYSc9+Io2zp
         X7tQ==
X-Gm-Message-State: AOJu0YxrIDlZRbZO8UFbM2iH6zMgnhclvkGLJnCCnXWUwfJTYkIANuQK
	v3TEO9xL5KyPBP5+GhhDkPf2IXiRNSTgoDCxI+EGla2L168cR9obbs5XcqzNhG4JRUlzNWaMLT8
	jANtbslg6FhzDJEer9bqBaEJPuww=
X-Gm-Gg: ASbGnctlAuKW9d/Z23fQy5Osgk/XfGG0UNrrjnLZK9XqzXe+ga9FzAhsTik9XhqV3RP
	9aJBRQKP69LTyUXaaBeQSBu2d8ZzTS2HE5s71MucVeWCGNsWGwXxVxLhPyu56iy4Cjt/anZhs3d
	9dcyQw/8xWu3CDQnTfLxEl9ZaGf6tJwnaMQEQOOAnh52LLNuLere/3gLs=
X-Google-Smtp-Source: AGHT+IEMDHUro2Mmn+9DP3kYR86GR6lww7aFezejXOE4Qm5TSGqzp/52zVpucSZlpWh533N+noOm03HkOHw0oJ7yA2M=
X-Received: by 2002:a05:6808:2199:b0:3f4:1838:50d with SMTP id
 5614622812f47-3febf79794fmr449792b6e.35.1742502767970; Thu, 20 Mar 2025
 13:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250320202606.1679616-1-peter.marko@siemens.com>
In-Reply-To: <20250320202606.1679616-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2025 13:32:21 -0700
X-Gm-Features: AQ5f1JrKHLmzlEPtZ5t9IeocXM9Z83fKUo_GQCkypCF1hq7ETVoRvH4cIHH2FWQ
Message-ID: <CAMKF1soQLwxn6cOiNcHYEBP_o=bUFoU_9wft4Ve3oY5s_JTtDw@mail.gmail.com>
Subject: Re: [oe] [meta-something][PATCH 1/3] freerdp: patch CVE-2024-32661
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 20:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116145

Thanks for the patches, I noticed the subject line says meta-something
for the layer name which I did not understand, is that a typo?

On Thu, Mar 20, 2025 at 1:26=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick commit [1] as mentioned in [2] or [3].
>
> [1] https://github.com/FreeRDP/FreeRDP/commit/71e463e31b4d69f4022d36bfc81=
4592f56600793
> [2] https://nvd.nist.gov/vuln/detail/CVE-2024-32661
> [3] https://security-tracker.debian.org/tracker/CVE-2024-32661
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../freerdp/freerdp/CVE-2024-32661.patch      | 27 +++++++++++++++++++
>  .../recipes-support/freerdp/freerdp_2.11.7.bb |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-3266=
1.patch
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch=
 b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
> new file mode 100644
> index 0000000000..002135b5e4
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32661.patch
> @@ -0,0 +1,27 @@
> +From 71e463e31b4d69f4022d36bfc814592f56600793 Mon Sep 17 00:00:00 2001
> +From: akallabeth <akallabeth@posteo.net>
> +Date: Sun, 21 Apr 2024 13:56:13 +0200
> +Subject: [PATCH] [core,info] fix missing check in rdp_write_logon_info_v=
1
> +
> +CVE: CVE-2024-32661
> +Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/71e=
463e31b4d69f4022d36bfc814592f56600793]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + libfreerdp/core/info.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c
> +index 7d6eec137..3395e4d2e 100644
> +--- a/libfreerdp/core/info.c
> ++++ b/libfreerdp/core/info.c
> +@@ -1322,6 +1322,10 @@ static BOOL rdp_write_logon_info_v1(wStream* s, l=
ogon_info* info)
> +               return FALSE;
> +
> +       /* domain */
> ++      WINPR_ASSERT(info);
> ++      if (!info->domain || !info->username)
> ++              return FALSE;
> ++
> +       ilen =3D ConvertToUnicode(CP_UTF8, 0, info->domain, -1, &wString,=
 0);
> +
> +       if (ilen < 0)
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/=
recipes-support/freerdp/freerdp_2.11.7.bb
> index ee4d4530d6..870c3ffe2f 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> @@ -20,6 +20,7 @@ SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branc=
h=3Dstable-2.0;protocol=3Dhttps
>             file://0001-Fix-const-qualifier-error.patch \
>             file://0002-Do-not-install-tools-a-CMake-targets.patch \
>             file://0001-Fixed-compilation-warnings-in-ainput-channel.patc=
h \
> +           file://CVE-2024-32661.patch \
>             "
>
>  S =3D "${WORKDIR}/git"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116142): https://lists.openembedded.org/g/openembedde=
d-devel/message/116142
> Mute This Topic: https://lists.openembedded.org/mt/111816531/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

