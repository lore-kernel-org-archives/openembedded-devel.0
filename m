Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FB0C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:03:38 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.4587.1743102208824222494
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aOwZPZAx;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f422d6e3b0so398988b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 12:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743102208; x=1743707008; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWDqKOb6b7T+ZIJ4OGBweUvKtGCoTLmfH5PO9bEyLTw=;
        b=aOwZPZAx3e9orgcMTvj6jvAZrVYI/p/YekHOnz/WWWJIn6+TrR5IYFf5j+Na6ttrL6
         M5F1At6y8/USx42N5WfpR2H/P92oTsvaIAjBoLqhu/KE4ELPj8O/G5YHXMvccr47cKHa
         wA/JrJjjE5YsvorozOeksWk84hoZpKPSJRKZd1+pNof+rt3hu8VZLDQjiGLNXn/NKWGk
         Uvf4aSXf5N9q5p/aHdr7zRrLDT9rF6nvCQ/ORwS+mdAEyUJd5R/yuVI+3E4DhX2r5Wsh
         1hIiyHPA4X9tyYSxJCEBMC285h/y5yyzpFfI6xBzrbG6vt3jDbLVtCPKCuX8YS+6V8M4
         IHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743102208; x=1743707008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWDqKOb6b7T+ZIJ4OGBweUvKtGCoTLmfH5PO9bEyLTw=;
        b=LJQLLrh+mK3++lMNV2plRsp5pAJbJI+UKicZxdYyrIzVKhxPKPHQw4FbgQrjNh/tAU
         zT+gJkF/6rxNk3dtRRW+pqINl3XCuKSpWDeeouJOuWPs+9xwC60hToBS28U6xAECOgww
         c3Vov0GJTbTH+XYRYE61V2WaViIyeNsDP9YsdkEDBJgHHhVd5PqqRA/sd7QtwzrpELYB
         FP0tWhaFojnAiDANaLon/6KcHOuA2+kb5NXvFuLz+00IQfzZLZYm5Q7A+lvvg3lFtfdJ
         8srxmN/lHHWxDby2gxwZntaSRdKdT0dDgDfq35tnDF0aMHbPFpI10rqoyaTbbgsfC84P
         0HKQ==
X-Gm-Message-State: AOJu0Yy3yt64KkYpSY6O4macUmYsGqK4nR4L/RxICfue8UkN6rSK0lvj
	RkoTIx5efbub/udiEmdi4HuD08ipAKDhNyHZCJi5vucWOxsc+fW+Scd3n9IxPHcH4gynsChn54Q
	9mzPuy4uWmOWJpHxjBjALRlIbdWHrAlN+
X-Gm-Gg: ASbGncvmQuaKDKR6e5yDlaaC59HQZYW8XGH2Ae3UWhZVJ0npJI3Y9ktN5B+UYLycG1p
	XPySKaoSnvPzxeA5yGrgOlneK5Gq78F62ArRFq63DwT10SJB0hRR/ticO/yLFgyo45MkYeBaKCo
	Q1Etht9HGsa1CzL9rZITWctWmbXzy3JJLIPa8DSsEZJ/N2rZRQisPqXUo=
X-Google-Smtp-Source: AGHT+IHAjofC/oBZKu0cC+F73bneC1l4aYWutDVnckjGJb9n5KwTa4hdFInh51o7/mCPuhz1ODpk6VIaofUD1eXoMWU=
X-Received: by 2002:a05:6808:1906:b0:3f6:a9ea:eab3 with SMTP id
 5614622812f47-3fefa4f5e78mr3018264b6e.5.1743102207898; Thu, 27 Mar 2025
 12:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <7303f311-13cd-4495-aa15-fbe9d0d95011@gmail.com>
In-Reply-To: <7303f311-13cd-4495-aa15-fbe9d0d95011@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Mar 2025 12:03:01 -0700
X-Gm-Features: AQ5f1Jo8zP6BqYKA_Z9FsYphss7-KiU-bi7CQJXCwX2CdtTbKyAXgwsKn1JMZcY
Message-ID: <CAMKF1soexvn8G2yFt8w+mxZiaKNNrGHbKyGt9AQU88Zc561UmQ@mail.gmail.com>
Subject: Re: kirkstone merge request: March 27th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 19:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116329

merged thanks Armin

On Thu, Mar 27, 2025 at 10:52=E2=80=AFAM akuster808 <akuster808@gmail.com> =
wrote:
>
> The following changes since commit 7e18b3fc774b7efabf9a20ae3cd6abd0e0715b=
59:
>
>    lapack: upgrade 3.10.0 -> 3.10.1 (2025-03-07 19:18:02 -0500)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 084df16f561ebce5aea2ae9241cc500247771ef3:
>
>    Revert "net-snmp: fix memory leak" (2025-03-20 09:56:59 -0400)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>        Revert "net-snmp: fix memory leak"
>
> Peter Marko (1):
>        libmodbus: patch CVE-2024-10918
>
>   ...0001-unload_all_mibs-fix-memory-leak-by-freeing-tclist.patch | 40 --=
---
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb    | 1 -
>   meta-oe/recipes-extended/libmodbus/libmodbus.inc                | 7 +-
>   .../libmodbus/libmodbus/CVE-2024-10918-01.patch                 | 159
> ++++++++++++++++++
>   .../libmodbus/libmodbus/CVE-2024-10918-02.patch                 | 113
> +++++++++++++
>   .../libmodbus/libmodbus/CVE-2024-10918-03.patch                 | 240
> ++++++++++++++++++++++++++++
>   6 files changed, 518 insertions(+), 42 deletions(-)
>   delete mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-unload_all_mibs-=
fix-memory-leak-by-freeing-tclist.patch
>   create mode 100644
> meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-01.patch
>   create mode 100644
> meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-02.patch
>   create mode 100644
> meta-oe/recipes-extended/libmodbus/libmodbus/CVE-2024-10918-03.patch
>

