Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48078C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:25:27 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.12413.1743171921119033227
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 07:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IshHoO/G;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3ff0df81fdbso22089b6e.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743171920; x=1743776720; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmkMZc9nB6008EKKYaNcQdON4J9EiophI+cuNGv2itY=;
        b=IshHoO/GxpZW//jFJhsf04n0Q0Bq5wWterDulpbmDv5CrivMKOyD+Pbr0CG7/gzWyx
         7thBLhxvD2NKwsBHGaTN4xtoCpq6KT5J7fWE4ED63qkFa4S024pKYQiGeyLs7md21uQ7
         d09ZabMTzdAE5vA4cEdYUgSj9tKDsLCSBJH7uw9HIAFs4M3r4lsxLesBHTcZ6tXiDk/4
         iTc/usN+hfjzDQii5/0LkyhosnLgl9feI5ORPRYV+a7MkEos6+RvoxqxtSL9f21zr1FS
         J+KTpyIdRR0JjM1LS3gDko/0I05OgkYpSFQUZf3Yjrc6EIgBmRUTp0oYll85jrWb8GFy
         ojTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743171920; x=1743776720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmkMZc9nB6008EKKYaNcQdON4J9EiophI+cuNGv2itY=;
        b=n1kecZzzNOmdy1BIxcBkqRvcY5eQOorWcC0ZZi6H4mVOyiUdsKb3yJqHiXFrHMLpFU
         E0xZPqPIGvfXOnroyyJP5dee+Uu7iBgctZi9PobCv7mH9chSDpM3VKHY3bBmg5djMpIT
         qXt5iXpRqNQZIvCp98CbyBQA+MJZgozPHVsvlPZUEc/tvMS/5AYcMRG5TaLH8P/cl0D4
         PBb/Jzehn2N8d8lVIXdwcESmqq/rWMjCwZw9Ar2o+dt6Z7ffoPX5yh9WF9u9jZYObyUK
         KeAXN0jcJrHro4NIM2sufxCa3HLX2QVehD9ZRykJy2jsByjxxxB+94mFmB0Ohjep2It2
         7UfA==
X-Gm-Message-State: AOJu0YzXFKi51o3P4oZeBq7lAMJZV2fb9wN+dPMXHDbF1biHzFT9nBO2
	AvrAnFGdgetVDSU5HtN1iNaCUjF9dTROlqi/rO4GbUwXxzaZP0wOy9PbExk7ZZyb5/CuAfU8fwK
	6agKW0twj0cc7ptOsLl2NWnwhZ1CAGpr5Uj8=
X-Gm-Gg: ASbGncvmWahsqIDiFAiJYOR/92SdsXKj6oUWmAbaRQcAQ59gsK64t8LyiYRznChxSIH
	UlIt2DnVPA9tDAFEVS/derhdV09i8rXVMXEfHMV6PKDp8iBFxDIM3Cs1Let1VFTt91sV2jsXFqB
	01N0D7B5bPB5R+Mhkh4Olc5rbOkw==
X-Google-Smtp-Source: AGHT+IH3A8ioK45fmreYOslba4feYubscWeI6XfW0dBUyBKdvbI5jkl7c5Xg7FaJqdS1G9dAx9xbd5TfcA/JXU2Dn3g=
X-Received: by 2002:a05:6808:2203:b0:3fb:46cc:e08 with SMTP id
 5614622812f47-3fefa60dacbmr4309954b6e.28.1743171920166; Fri, 28 Mar 2025
 07:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250328095823.3335387-1-martin.jansa@gmail.com>
In-Reply-To: <20250328095823.3335387-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Mar 2025 07:24:54 -0700
X-Gm-Features: AQ5f1Jrh8JuTkHEAYOVkCpzlnLAO1jdClqnNGhol1sBd5D4wIWddV4L6B0lYgug
Message-ID: <CAMKF1spSuapGfujXtTufDyHR95uEtbXYaQ8w9z0dXEgY+m4dEg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xl2tpd: fix build with gcc-15
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 14:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116355

On Fri, Mar 28, 2025 at 2:58=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../xl2tpd/0001-Fix-build-with-GCC-15.patch   | 39 +++++++++++++++++++
>  .../recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb |  4 +-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-=
Fix-build-with-GCC-15.patch
>
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-bui=
ld-with-GCC-15.patch b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001=
-Fix-build-with-GCC-15.patch
> new file mode 100644
> index 0000000000..2ba927bf0e
> --- /dev/null
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd/0001-Fix-build-with=
-GCC-15.patch
> @@ -0,0 +1,39 @@
> +From 754b0ca247b2d789f9f613f8757b9732494e9489 Mon Sep 17 00:00:00 2001
> +From: Yaakov Selkowitz <yselkowi@redhat.com>
> +Date: Thu, 6 Mar 2025 21:03:28 -0500
> +Subject: [PATCH] Fix build with GCC 15
> +
> +GCC 15 defaults to C23, in which the interpretation of function
> +declarations without parameters changed from unspecified to `void`.  Thi=
s
> +results in `control_handle_lac_status` not being compatible with the
> +expected callback function type.  Adding the expected type parameters,
> +albeit unused, fixes the compatibility.
> +
> +Upstream-Status: Submitted [https://github.com/xelerance/xl2tpd/pull/272=
]

Thanks for the fix. There is a similar patch proposed to this project
last year see

https://github.com/xelerance/xl2tpd/pull/269

> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + xl2tpd.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/xl2tpd.c b/xl2tpd.c
> +index 3195988..0d148e9 100644
> +--- a/xl2tpd.c
> ++++ b/xl2tpd.c
> +@@ -74,7 +74,7 @@ static int control_handle_lac_hangup(FILE* resf, char*=
 bufp);
> + static int control_handle_lac_disconnect(FILE* resf, char* bufp);
> + static int control_handle_lac_add_modify(FILE* resf, char* bufp);
> + static int control_handle_lac_remove(FILE* resf, char* bufp);
> +-static int control_handle_lac_status();
> ++static int control_handle_lac_status(FILE*, char*);
> + static int control_handle_lns_remove(FILE* resf, char* bufp);
> +
> + static struct control_requests_handler control_handlers[] =3D {
> +@@ -1541,7 +1541,7 @@ static int control_handle_lac_remove(FILE* resf, c=
har* bufp){
> +     return 1;
> + }
> +
> +-static int control_handle_lac_status(){
> ++static int control_handle_lac_status(FILE*, char*){
> +     show_status ();
> +     return 1;
> + }
> diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb b/=
meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
> index 08bab4a338..0b7887dacb 100644
> --- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
> +++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.16.bb
> @@ -8,7 +8,9 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -SRC_URI =3D "git://github.com/xelerance/xl2tpd.git;branch=3Dmaster;proto=
col=3Dhttps"
> +SRC_URI =3D "git://github.com/xelerance/xl2tpd.git;branch=3Dmaster;proto=
col=3Dhttps \
> +    file://0001-Fix-build-with-GCC-15.patch \
> +"
>  SRCREV =3D "1ef2a025981223c1e16fc833bef226c86ff8c295"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/xelerance/xl2tpd/releases"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116352): https://lists.openembedded.org/g/openembedde=
d-devel/message/116352
> Mute This Topic: https://lists.openembedded.org/mt/111951455/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

