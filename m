Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C459C44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 09:56:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33974.1769075760614032047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 01:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LHHej9g4;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so7355745ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 01:56:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769075760; cv=none;
        d=google.com; s=arc-20240605;
        b=I7g2XgZBVi46jjclPyvlpC8sfaJZWmDrAmzQ/ZrizLnCYml3TcSbtZxMC530EbzIDN
         AhAylFB0YMe3VqayadMJDX650XNaP+8SmwKrRsHfKlAHbyaEyBlAAp3i+ThzrEnYSB2F
         l0lhX35oLp98Nzmqgr03uOP2HVo8Ue4D67K7yJXlB1PEf8XWi0JzH24xXGpUGl/36DfR
         mVoXoX0713TQrQ2KQmP1r4UnhoglMQo5S0VtBl1ue8QTenF7rgH5MXz33GX2rwj5LdQi
         66kYwPLdUjWCzwKulJdY5n/T45dliGNkO3REp/IjmxntSP3wJ8lcXWMxi0GAeRnm3C/z
         J+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+r6g6BW6f+tplN0XJEQWVEQOLd49o+rvZYN9dAUqN8=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=NHLI/XhYJ1d4CMOuuLYWmBRzc04Q4vM6fQu4DcgiyVm2h0/pEUH1QyrPni5tHKR5wL
         a1skGqpoULCfUtuQlpRNN/0dPl5L/yGMux1s5FCKOp7R7b+kmUd1+cpYxORHaTtlOvyM
         4tM92QWODHWKP4Tj9fPQrGhWAPAL0AZ2lKJzoFL/Na6cm6cuqwsGlcl+GbIMD5X6Rtwi
         5+pWc8pBzBoDayWWb3LajdbdfrpXAiQHNlme2fp7UmvVZhxDBe4eAHGypEKk6BAUeg8c
         v8wJvqST6xL9jVJF8Lrw2FAPgrhIHJv0juIuhIV+oRsr07hfYxRwIp6ozNdqlSmZyB8m
         s3vA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769075760; x=1769680560; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+r6g6BW6f+tplN0XJEQWVEQOLd49o+rvZYN9dAUqN8=;
        b=LHHej9g4h0BjHnaJLvLJLkERFMm+/71lxkcWeSRnmAv/3qj5tUktVHwgS92SSk6e9X
         gu3fp0rnuALV8cJRHIP58r2xibj4DHX2F7/FWj0qT69jPXd8ZH5ZH9wd6HJuZJpTFgf+
         bq07V4CWcZTk3jelA2IrkE1TGlt2eAsMl2dGwskqdDQn8yNDI5tZq8vpNVh4AD/wOnGK
         5pnNsp1Rf8LPG3qjHxLdB0/7WnbCwyjDkzb6aRAFbkgfUcV0Yd/6T3S9Kgh3Kl2VaHrU
         2hW+XIXVDZ1c+mj3K0rzpDIOFV9ir+c8G7Chz+zHlWhXseSTU75AZ2m3A2qUH/vCE9np
         qUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769075760; x=1769680560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+r6g6BW6f+tplN0XJEQWVEQOLd49o+rvZYN9dAUqN8=;
        b=X+aN1jKKCbtkcCN1bojbewmVyMYJlxBky/FYGzMoI9RQQaGZF34Vw8LG/4Rc73Iorv
         Rq8R33PasgtaU7vT+EfXcDF9usBko9UVI/PDv5XYsxmpo5HlCntiWVlxFLopG+39VhI3
         bXvelpxqdBa9lb0+kYm5cIf70ccmFO4j1j/ePXSN3/IPS6y+hzC8CS3YgqRAQ3fPA6/c
         m8tmRpOROqPTssPksU8H28RkTdIm9blroS9SBtQ7roqZXjbI9hVmSuCbhQsj3T1Ze76I
         xebskCKO3yC/8iJzrl3WOhxPWeSEw71ISzkRxBtnL0bElCiJhylHPrCLO/Z3XXFz+8e4
         vNKw==
X-Gm-Message-State: AOJu0Yyfp6A30zIQyOP3ZJ/qqbJF3x8SMf55/9YT9lDlaUh7b9zIUvVY
	fkzmox6l6aZBbVjUR1rloogKF+P02UivnoXZyoEATMB9jAA2IRr1IdBg+y1IR9b8TzH2heXizVR
	r7aYMho4JsFnwmr9zt+uSB2L4ilxs7rg=
X-Gm-Gg: AZuq6aLxi18CFI9aOk4BNLhehnYXKKnj4BU2ZniFYsR5Zw6p6OZaBNS40/TlwFzfeFj
	I1kYtwtvs2wUWMI57h0FcguT3p+TZ4wZ5Wh3Z/NmLCYvmoorKKXHH6N+W//NslPlcE2Dov5Hs9y
	iOZFAGyNIFPdtQRP3BCwIvITyib9qrCl7tmr/O2PyQAhjtGcT1kQnTk0M4Wt0ugFprWFr2emT35
	Hb2FCWjwuU0/BVHzFFPImrXJDYvpurJmCgM830GgFPB9FjFJI68R8RZCwAIUoVLHL04SDiJHA==
X-Received: by 2002:a17:902:cf41:b0:2a2:b293:27d2 with SMTP id
 d9443c01a7336-2a76b1695f7mr77855355ad.53.1769075759959; Thu, 22 Jan 2026
 01:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20260121112921.857-1-wangmy@fujitsu.com> <20260121112921.857-4-wangmy@fujitsu.com>
In-Reply-To: <20260121112921.857-4-wangmy@fujitsu.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 22 Jan 2026 22:55:47 +1300
X-Gm-Features: AZwV_QjpsMJpco45soTxuu9bgciZP-hShow6eqhqDVssWH9VhoD_t_HzDczN9AY
Message-ID: <CADySD0G3r1RB+YF_RzwrwrZF2KG8=BmKMFzGfTCWwLadE3oqEQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 04/30] pahole: upgrade 1.29 -> 1.31
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 09:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123735

On Thu, Jan 22, 2026 at 12:29=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
> revemoed since it's included in 1.31
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...r-Fix-elf_functions-cleanup-on-error.patch | 54 -------------------
>  .../pahole/{pahole_1.29.bb =3D> pahole_1.31.bb} |  4 +-
>  2 files changed, 2 insertions(+), 56 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encode=
r-Fix-elf_functions-cleanup-on-error.patch
>  rename meta-oe/recipes-devtools/pahole/{pahole_1.29.bb =3D> pahole_1.31.=
bb} (88%)
>
> diff --git a/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-e=
lf_functions-cleanup-on-error.patch b/meta-oe/recipes-devtools/pahole/files=
/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
> deleted file mode 100644
> index dad5a9646a..0000000000
> --- a/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_func=
tions-cleanup-on-error.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 6fa2b7de3e647e64c5d693aea7f3bacbfa964f53 Mon Sep 17 00:00:00 2001
> -From: Ihor Solodari <ihor.solodrai@linux.dev>
> -Date: Wed, 20 Aug 2025 09:00:03 +0100
> -Subject: [PATCH] btf_encoder: Fix elf_functions cleanup on error
> -
> -When elf_functions__new() errors out and jumps to
> -elf_functions__delete(), pahole segfaults on attempt to list_del() the
> -elf_functions instance from a list, to which it was never added.
> -
> -Fix this by moving list_del() call out of elf_functions__delete().
> -Remove from the list only on normal cleanup in
> -elf_functions_list__clear().
> -
> -v1:
> -https://lore.kernel.org/dwarves/979a1ac4-21d3-4384-8ce4-d10f41887088@lin=
ux.dev/
> -
> -Closes:
> -https://lore.kernel.org/dwarves/24bcc853-533c-42ab-bc37-0c13e0baa217@win=
driver.com/
> -Reported-by: Changqing Li <changqing.li@windriver.com>
> -Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> -Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> -Link: https://lore.kernel.org/dwarves/acef4a0e-7d3b-4e05-b3ca-1007580f27=
54@linux.dev/
> -Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> -
> -Upstream-Status: Backport [https://git.kernel.org/pub/scm/devel/pahole/p=
ahole.git/commit/?h=3Dnext&id=3Dfe6738f4b46b63dcdc5b15b252a014b3eaba16a4]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - btf_encoder.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/btf_encoder.c b/btf_encoder.c
> -index 511c1ea..2f8c6bb 100644
> ---- a/btf_encoder.c
> -+++ b/btf_encoder.c
> -@@ -162,7 +162,6 @@ static inline void elf_functions__delete(struct elf_=
functions *funcs)
> -               free(funcs->entries[i].alias);
> -       free(funcs->entries);
> -       elf_symtab__delete(funcs->symtab);
> --      list_del(&funcs->node);
> -       free(funcs);
> - }
> -
> -@@ -204,6 +203,7 @@ static inline void elf_functions_list__clear(struct =
list_head *elf_functions_lis
> -
> -       list_for_each_safe(pos, tmp, elf_functions_list) {
> -               funcs =3D list_entry(pos, struct elf_functions, node);
> -+              list_del(&funcs->node);
> -               elf_functions__delete(funcs);
> -       }
> - }
> ---
> -2.34.1
> -
> diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/rec=
ipes-devtools/pahole/pahole_1.31.bb
> similarity index 88%
> rename from meta-oe/recipes-devtools/pahole/pahole_1.29.bb
> rename to meta-oe/recipes-devtools/pahole/pahole_1.31.bb
> index 4f2737767b..ea4237c4aa 100644
> --- a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
> +++ b/meta-oe/recipes-devtools/pahole/pahole_1.31.bb
> @@ -9,10 +9,10 @@ DEPENDS =3D "elfutils zlib libbpf"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  COMPATIBLE_HOST =3D "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|=
mips64).*-linux"
>
> -SRCREV =3D "b9cc7963051b2099795129450f9b70c81950d02f"
> +SRCREV =3D "1f2805b6eef104df3125143c949b391f6122e5b9"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=
=3Dmaster \
>             file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-p=
yth.patch \
> -           file://0001-btf_encoder-Fix-elf_functions-cleanup-on-error.pa=
tch"
> +           "

can please also include tag=3Dv${PV} in the SRC_URI

>
>
>  inherit cmake pkgconfig
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123695): https://lists.openembedded.org/g/openembedde=
d-devel/message/123695
> Mute This Topic: https://lists.openembedded.org/mt/117379498/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

