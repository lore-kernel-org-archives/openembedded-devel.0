Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0244CAC5A0
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 06:00:40 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.4637.1758348035069855591
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 23:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=is4wTjpa;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-30cce892b7dso1813442fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 23:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758348034; x=1758952834; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtIZFYWtu9+i1bz5he5vRVwf9lj8fZ3jeQQhS+dgp1o=;
        b=is4wTjpa3LWNJllnV1xZVo8CAvls8OgeEwL/TjDBKxt9RQMj9tQqybCpXDM2csGzx8
         sQ5TfoEskQjlvuBujFU8BW09TYLLjRXFX3sLJUZEV9ekmFUpRmMv5v+4WDqtARP0vqDa
         Ed/UVBprSqgQqwpJLz/wHoufQHqI/0qbsJ5kQfFCtTCgR/1fdlu4Behmwuha9N/Zjahi
         LUz5XNdlu/2N7ZpsMcV/Q6JJFIBrkVimajL2l+WXRsvjxHhN68HNed0SJ74ZduADVAyw
         q6fN0LDBY6yjgcPAqviHGVB6Uq2kwgbd8KjIw7Xp8fA+4Bj1ZYcYAwBowhiO6hHewk/B
         bqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758348034; x=1758952834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtIZFYWtu9+i1bz5he5vRVwf9lj8fZ3jeQQhS+dgp1o=;
        b=QWkE3WIQ4XRThNEy/ekXbW/zV5Km4KGcFOspxkApU3GfuzPfvyEbUaZ+MNgUfhDiuW
         7BHe50BvBMyZEZ7sOdvGs4TLjbbp8QPnoHIa8yqKEjQWJ/+H6QK8JnnhOFJCqiFuhRYu
         or78kQJWCeCYtwWc11pvL4RqGQ/vjHhJkklFxnLfADULI8DWqLnUrvBf9P3V+UZsAnDo
         9KExsrBmC1Bk4ukNtbk5XjafRMjDI5+Zq2KwQGHT69wYD18YJpwIctJ6n4V5YMEhMl5F
         Ssbpib84K5ilYEUBe6Y+VUbbEgPQ6lLrk1Ro73QM4uDlkJQJpzTildwwhZrWtnI7tlg/
         yH2A==
X-Gm-Message-State: AOJu0Yz7A0WiJnsA2+KjB3GlgBL1guTSfwbpj5t5UngtpcK91XwDtY2j
	L2StFSYbyCZAPBPUSJrTiZmJjTAXyEswUaMRvrvbxrQow22EP89BKfhacWB9S7mAuyOJygKZ1B/
	nSlUypvZLqwj7uRinrOf1L+T4pCU8Z/M=
X-Gm-Gg: ASbGncszBroJzRAK4OnmBhnEWHUJJGR4sJlVLSV7ASpQFcMUO+EeUY2/FHSe1z2vNUe
	jpceoVNTjVxF3/2MeMfc6fdAfOv/nEUOh7fv/6NKUFyTff0sy3ybOYa+v9HyxjvRftfVVk7tRKT
	vjIPVuOftD6pX2+NgNK7XZ4tlgz2/+Hlw/dThqo9MiA4Z9Wu1FqdENxOInr6lFbCVwCKfh5/X3d
	TrAiWDfbw==
X-Google-Smtp-Source: AGHT+IHPgiEjf4RygfzTabRQ7SpUxBmbK/MtClhd+nHW3zo8SgZ7yR3c+ZUTChOX4hdgEk+S8dbz9KUGdd9NrWHQvME=
X-Received: by 2002:a05:6871:5884:b0:2ff:a27f:9c67 with SMTP id
 586e51a60fabf-33bb4316634mr2969505fac.30.1758348034159; Fri, 19 Sep 2025
 23:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250919113331.2357-1-spushpka@cisco.com>
In-Reply-To: <20250919113331.2357-1-spushpka@cisco.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 20 Sep 2025 18:00:23 +1200
X-Gm-Features: AS18NWA44ix7huTonP8ZBm2AQBKKpABVBdUGe5FvMjomBd1YfNjAlzWYZptnxPk
Message-ID: <CADySD0EYS=JhDU8VUH_LEbkiTY0pHcz=CtymDG=0wzVWGYaQAQ@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded] [scarthgap] [PATCH] cjson 1.7.18: Fix CVE-2025-57052
To: spushpka@cisco.com
Cc: openembedded-devel@lists.openembedded.org, vchavda@cisco.com, 
	deeratho@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 06:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119618

Please send this patch for kirkstone and walnascar branch as well

On Fri, Sep 19, 2025 at 11:33=E2=80=AFPM Shubham Pushpkar via
lists.openembedded.org <spushpka=3Dcisco.com@lists.openembedded.org>
wrote:
>
> Upstream Repository: https://github.com/DaveGamble/cJSON.git
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57052
> Type: Security Fix
> CVE: CVE-2025-57052
> Score: 9.8
> Patch: https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa
>
> Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> ---
>  .../cjson/cjson/CVE-2025-57052.patch          | 33 +++++++++++++++++++
>  .../recipes-devtools/cjson/cjson_1.7.18.bb    |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.p=
atch
>
> diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch b/=
meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
> new file mode 100644
> index 0000000000..ed3d4a7eba
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
> @@ -0,0 +1,33 @@
> +From e53a1413304382d562176bed91609e00b4fcf87e Mon Sep 17 00:00:00 2001
> +From: Lee <peteralfredlee@gmail.com>
> +Date: Fri, 5 Sep 2025 14:53:20 +0800
> +Subject: [PATCH] fix the incorrect check in decode_array_index_from_poin=
ter
> + (#957)
> +
> +this fixes CVE-2025-57052
> +
> +CVE: CVE-2025-57052
> +Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/74=
e1ff4994aa]
> +
> +(cherry picked from commit 74e1ff4994aa4139126967f6d289b675b4b36fef)
> +Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> +---
> + cJSON_Utils.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cJSON_Utils.c b/cJSON_Utils.c
> +index 63651df..8fa24f8 100644
> +--- a/cJSON_Utils.c
> ++++ b/cJSON_Utils.c
> +@@ -282,7 +282,7 @@ static cJSON_bool decode_array_index_from_pointer(co=
nst unsigned char * const po
> +         return 0;
> +     }
> +
> +-    for (position =3D 0; (pointer[position] >=3D '0') && (pointer[0] <=
=3D '9'); position++)
> ++    for (position =3D 0; (pointer[position] >=3D '0') && (pointer[posit=
ion] <=3D '9'); position++)
> +     {
> +         parsed_index =3D (10 * parsed_index) + (size_t)(pointer[positio=
n] - '0');
> +
> +--
> +2.44.1
> +
> diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/rec=
ipes-devtools/cjson/cjson_1.7.18.bb
> index bdeab3055c..67d536cf24 100644
> --- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> +++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D218947f77e8cb8=
e2fa02918dc41c50d0"
>
>  SRC_URI =3D "git://github.com/DaveGamble/cJSON.git;branch=3Dmaster;proto=
col=3Dhttps \
>             file://run-ptest \
> +           file://CVE-2025-57052.patch \
>           "
>  SRCREV =3D "acc76239bee01d8e9c858ae2cab296704e52d916"
>
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119593): https://lists.openembedded.org/g/openembedde=
d-devel/message/119593
> Mute This Topic: https://lists.openembedded.org/mt/115326142/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

