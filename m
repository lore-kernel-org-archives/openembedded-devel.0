Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07ED9CD4F24
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 15:33:44 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78756.1778600016531204733
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 08:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=seo/XI8f;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-654672a6d68so6212436d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778600016; cv=none;
        d=google.com; s=arc-20240605;
        b=GpKMSG0iZxVaul0TZjfvBRpcJFSW9pM1x7F10xAYSq0a6SUZh1E7VRIaOatLryvWaN
         as8ZmjEuKeL1HKP7lpkoP7aRRNsnZArHTYaB16ETpkPdssI+MRKSMLPsazTUssqSQY4y
         kOqFEx5/cWAWBjPp7azGPYNOdxbRdfGFjKKBVXk7r0/6aUIXkXoRpKi7GR8f51NV8Dl+
         R79SEGTLzFd1Ilu2EvRuWM/IlcZy26rA0aTFW8cYfO7FkU6fxz/YZvXUAmH9ztKXyjhi
         9dMSjzSFRpepeOf4alvfmZ2gsihNGcAWUM6DjJsMtD0KG3eY1aVFkCPoLwwEJrsPkVEo
         AMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PsdzBiMGgn1jTBbnmlN/ToLemeefc9Cx0y/pA1oYirY=;
        fh=eEkqOCktgdXMYGXEDt8wt2o+Ik2XH2NR/QTlpIIss2w=;
        b=GHo6tV74b7JJhvSNJujyxG7oIXTMqjVFkkbLpN9tiUtSg/UpPh+ayUUjC6MCj6yIMv
         8BwWPjUS5lyUOqoMnCkXTQYld/wjvxHZG9GomdJ7d9xxsLjbuiRfC3FhjHAhC05DV0SN
         SCkqkdJFp8OhSrDClmWN/dpgsTvt99U/cmYHOgGE3LOtXF6xFAEk9NJn66Btlru5SYgM
         vnTh+NcoZNtAq7/gt3kSbOEUtlh/Ojapy5/l79DA7MOzb8ntICriiZumRrqndD6X8d/l
         xGp4BTN4OYu42OB+zOeo/zVPhVJ0BC1yO4JbQDpK6O8qqz/ZdZPMx+X5y+LVVsLi6B66
         x1cQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778600016; x=1779204816; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PsdzBiMGgn1jTBbnmlN/ToLemeefc9Cx0y/pA1oYirY=;
        b=seo/XI8fElYsaDx4v21ray/xEov7LzqkkWJg0ssXUOgnz5TEEqjlxI0yJ5X/FHyexM
         aoraiKpGTE5IXIshxU5SnrTV6H7kFKs7ZepNA5RIzAl4vztz6i5Ccut9yG9BwloGM9hG
         n+di7u/gBU5b5QfDcjG3M9Dg8/v6We4QoQXCIVMS4je95gm+C12SBfqyUUSmQwwwCso1
         HIC721Bsf4ScFHfNN7RBpBtDXXeQ5s+XxoZYFRzu3GAvMAeBuVLJoNId+h14/vIIqPb6
         qd74LbZrVmlTrGFRZonCTg4brrIO7ES6/cqL28Fs1tvcIOXNl76W2XCXXOikQLMQHHfX
         mE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600016; x=1779204816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsdzBiMGgn1jTBbnmlN/ToLemeefc9Cx0y/pA1oYirY=;
        b=UUKAGYTLMb+FHkmei9esTgrxu8yK1thwoRodggrXJkajugbMpGqTqjBX5P/7t9EdjH
         +rojqBT7Rpi9KZR0eFhFbbLvTAgetr1T8zmlkD1wpI/WIQogvpSa1kKx+RTPJkUvaGq1
         qkp0m1AH9L6/cGg3/AGtGOOS68OsIyvI8qNUCmQ+7+97rAGbyHc8wmkiM3XKzUZ7Mq+e
         mBwGkf8ZCmUwSfL1LjEL2SAhwdeQU2B/xD7MVUJyON4Mjqt7StN+77VlJvim33jVLPeK
         nFb4yW5MLK0NndRz6ye74jS2C7lnxF0sCZjQCYbZsGWA3+cjjaaKKbxYaBAS4XyYb0MN
         7h0A==
X-Gm-Message-State: AOJu0YxfYZ7x9lX3C/nUXWy4INfFh7+DUeTCNG4Vg8R2S2TGOQBReIbn
	d5S8c1dWepXIozrKxKARzphcnn8iD6gNDVchdEVdLcNGlLlTySSxBsRyfnWmrk4CenslV1eIHmJ
	iJggusWvqUk0429THx5EFNbrcBX3lJGI=
X-Gm-Gg: Acq92OHD6HqXxOjrcRVL8MvbS6aCdX2GgcY1tMFy9G9M3u3irZZhaYlGh41X84EDIZZ
	zDJhA3fe1D9kJmGR7/n7DPxU/tm8ufxDWdb8GlergIoJ+P5zykBobKBGxnWFw6yY62WTWkw2puK
	GZlIwbaMYbr2FE63sf84ZjxiP2VE2JUmG9TQpoui2g1wyXzBgUal6Qt4oBUdv2bI5lS26LT8It5
	ir4T0jWwPju6Ep1GiFNPSYWwYUT+fEPhCungLpSxYMdzuCE5JR6N9wKukQuiSDvns+UsCxAPu5w
	CkEXohkNzb1LnGaa/La7D5SuBlkcL5hefmkSaM43fgQonuDSj/GtIqsx3UEN8b6pTQII21pn+DE
	ghny8F5fDTy1dD6njBt1uBL8jDNE6fugsFwYYMs6gHACfl91y5poA9p917tjgHJYnrG20hFXzjk
	UOvWcDtJ0=
X-Received: by 2002:a05:690e:d51:b0:65c:5b88:84b5 with SMTP id
 956f58d0204a3-65de0fda22amr2648805d50.6.1778600015238; Tue, 12 May 2026
 08:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260509030739.1773307-1-zhe.he@windriver.com>
In-Reply-To: <20260509030739.1773307-1-zhe.he@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 May 2026 08:33:08 -0700
X-Gm-Features: AVHnY4Lmp58WVaWHliH8DCkClTtZAdRE6JJsMKtSN5Nc9VIC4ycJE2Ovy36DoC0
Message-ID: <CAMKF1sqEqZqnXH-1AjJO8kAow8iRjOPp1DzPYDF04d=cEiVfuQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] bpftool-native: Fix -Wdiscarded-qualifiers errors
 for glibc 2.42+
To: zhe.he@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001b17b90651a096a4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126870

--0000000000001b17b90651a096a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 8:08=E2=80=AFPM He Zhe via lists.openembedded.org <z=
he.he=3D
windriver.com@lists.openembedded.org> wrote:

> Backport a patch from kernel to fix the following build errors.
>
> bbpf.c: In function =E2=80=98kallsyms_cb=E2=80=99:
> | libbpf.c:8192:13: error: assignment discards =E2=80=98const=E2=80=99 qu=
alifier from
> pointer target type [-Werror=3Ddiscarded-qualifiers]
> |  8192 |         res =3D strstr(sym_name, ".llvm.");
> |       |             ^
> | libbpf.c: In function =E2=80=98avail_kallsyms_cb=E2=80=99:
> | libbpf.c:11497:31: error: assignment discards =E2=80=98const=E2=80=99 q=
ualifier from
> pointer target type [-Werror=3Ddiscarded-qualifiers]
> | 11497 |                 if (!(sym_sfx =3D strstr(sym_name, ".llvm.")))
> |       |                               ^
> | libbpf.c: In function =E2=80=98resolve_full_path=E2=80=99:
> | libbpf.c:12085:35: error: assignment discards =E2=80=98const=E2=80=99 q=
ualifier from
> pointer target type [-Werror=3Ddiscarded-qualifiers]
> | 12085 |                         next_path =3D strchr(s, ':');
> |       |
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../bpftool/bpftool-native_6.16.bb            |  5 +-
>  ...-Fix-Wdiscarded-qualifiers-under-C23.patch | 69 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-qualifi=
ers-under-C23.patch
>
> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
> b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
> index fe3ad6138e..edc635517a 100644
> --- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
> +++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
> @@ -9,7 +9,10 @@ DEPENDS =3D "binutils-native elfutils-native"
>
>  inherit native bash-completion
>
> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz"
> +SRC_URI =3D "\
> +    ${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz \
> +    file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch \
> +"
>  SRC_URI[sha256sum] =3D
> "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83"
>
>  S =3D "${UNPACKDIR}/linux-${PV}"
> diff --git
> a/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-quali=
fiers-under-C23.patch
> b/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-quali=
fiers-under-C23.patch
> new file mode 100644
> index 0000000000..76b9aabb54
> --- /dev/null
> +++
> b/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-quali=
fiers-under-C23.patch
> @@ -0,0 +1,69 @@
> +From ab21cf885fb2af179c44d8beeabd716133b9385d Mon Sep 17 00:00:00 2001
> +From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> +Date: Sat, 6 Dec 2025 14:28:25 +0500
> +Subject: [PATCH] libbpf: Fix -Wdiscarded-qualifiers under C23
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +commit d70f79fef65810faf64dbae1f3a1b5623cdb2345 upstream.
> +
> +glibc =E2=89=A5 2.42 (GCC 15) defaults to -std=3Dgnu23, which promotes
> +-Wdiscarded-qualifiers to an error.
> +
> +In C23, strstr() and strchr() return "const char *".
> +
> +Change variable types to const char * where the pointers are never
> +modified (res, sym_sfx, next_path).
> +
> +Suggested-by: Florian Weimer <fweimer@redhat.com>
> +Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> +Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> +Link:
> https://lore.kernel.org/r/20251206092825.1471385-1-mikhail.v.gavrilov@gma=
il.com
> +Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> +[ shung-hsi.yu: needed to fix kernel build failure due to libbpf since
> glibc
> +  2.43+ (which adds 'const' qualifier to strstr) ]
> +Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
> +Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +
> +Upstream-Status: Backport[
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dlinux-6.18.y&id=3Dab21cf885fb2af179c44d8beeabd716133b9385d
> ]
>

This seems to be malformed ( add a space after 'Backport' )


> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + tools/lib/bpf/libbpf.c | 7 ++++---
> + 1 file changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> +index dd3b2f57082d..9c98c6adb6d0 100644
> +--- a/tools/lib/bpf/libbpf.c
> ++++ b/tools/lib/bpf/libbpf.c
> +@@ -8245,7 +8245,7 @@ static int kallsyms_cb(unsigned long long sym_addr=
,
> char sym_type,
> +       struct bpf_object *obj =3D ctx;
> +       const struct btf_type *t;
> +       struct extern_desc *ext;
> +-      char *res;
> ++      const char *res;
> +
> +       res =3D strstr(sym_name, ".llvm.");
> +       if (sym_type =3D=3D 'd' && res)
> +@@ -11574,7 +11574,8 @@ static int avail_kallsyms_cb(unsigned long long
> sym_addr, char sym_type,
> +                *
> +                *   [0] fb6a421fb615 ("kallsyms: Match symbols exactly
> with CONFIG_LTO_CLANG")
> +                */
> +-              char sym_trim[256], *psym_trim =3D sym_trim, *sym_sfx;
> ++              char sym_trim[256], *psym_trim =3D sym_trim;
> ++              const char *sym_sfx;
> +
> +               if (!(sym_sfx =3D strstr(sym_name, ".llvm.")))
> +                       return 0;
> +@@ -12159,7 +12160,7 @@ static int resolve_full_path(const char *file,
> char *result, size_t result_sz)
> +               if (!search_paths[i])
> +                       continue;
> +               for (s =3D search_paths[i]; s !=3D NULL; s =3D strchr(s, =
':')) {
> +-                      char *next_path;
> ++                      const char *next_path;
> +                       int seg_len;
> +
> +                       if (s[0] =3D=3D ':')
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126828):
> https://lists.openembedded.org/g/openembedded-devel/message/126828
> Mute This Topic: https://lists.openembedded.org/mt/119225487/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001b17b90651a096a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 8, =
2026 at 8:08=E2=80=AFPM He Zhe via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;zhe.he=3D<a href=3D"mailto:windriver.com@l=
ists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Backport a patch=
 from kernel to fix the following build errors.<br>
<br>
bbpf.c: In function =E2=80=98kallsyms_cb=E2=80=99:<br>
| libbpf.c:8192:13: error: assignment discards =E2=80=98const=E2=80=99 qual=
ifier from pointer target type [-Werror=3Ddiscarded-qualifiers]<br>
|=C2=A0 8192 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D strstr(sym_name, &q=
uot;.llvm.&quot;);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^<br>
| libbpf.c: In function =E2=80=98avail_kallsyms_cb=E2=80=99:<br>
| libbpf.c:11497:31: error: assignment discards =E2=80=98const=E2=80=99 qua=
lifier from pointer target type [-Werror=3Ddiscarded-qualifiers]<br>
| 11497 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
!(sym_sfx =3D strstr(sym_name, &quot;.llvm.&quot;)))<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
| libbpf.c: In function =E2=80=98resolve_full_path=E2=80=99:<br>
| libbpf.c:12085:35: error: assignment discards =E2=80=98const=E2=80=99 qua=
lifier from pointer target type [-Werror=3Ddiscarded-qualifiers]<br>
| 12085 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0next_path =3D strchr(s, &#39;:&#39;);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../bpftool/<a href=3D"http://bpftool-native_6.16.bb" rel=3D"noreferr=
er" target=3D"_blank">bpftool-native_6.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
=C2=A0...-Fix-Wdiscarded-qualifiers-under-C23.patch | 69 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 73 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf=
-Fix-Wdiscarded-qualifiers-under-C23.patch<br>
<br>
diff --git a/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool-nativ=
e_6.16.bb" rel=3D"noreferrer" target=3D"_blank">bpftool-native_6.16.bb</a> =
b/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool-native_6.16.bb" =
rel=3D"noreferrer" target=3D"_blank">bpftool-native_6.16.bb</a><br>
index fe3ad6138e..edc635517a 100644<br>
--- a/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool-native_6.16.=
bb" rel=3D"noreferrer" target=3D"_blank">bpftool-native_6.16.bb</a><br>
+++ b/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool-native_6.16.=
bb" rel=3D"noreferrer" target=3D"_blank">bpftool-native_6.16.bb</a><br>
@@ -9,7 +9,10 @@ DEPENDS =3D &quot;binutils-native elfutils-native&quot;<br=
>
<br>
=C2=A0inherit native bash-completion<br>
<br>
-SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz=
&quot;<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 ${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz \<b=
r>
+=C2=A0 =C2=A0 file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch=
 \<br>
+&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d=
08b46ab48516bcc1befbcd83&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/linux-${PV}&quot;<br>
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscar=
ded-qualifiers-under-C23.patch b/meta-oe/recipes-kernel/bpftool/bpftool/000=
1-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch<br>
new file mode 100644<br>
index 0000000000..76b9aabb54<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-qua=
lifiers-under-C23.patch<br>
@@ -0,0 +1,69 @@<br>
+From ab21cf885fb2af179c44d8beeabd716133b9385d Mon Sep 17 00:00:00 2001<br>
+From: Mikhail Gavrilov &lt;<a href=3D"mailto:mikhail.v.gavrilov@gmail.com"=
 target=3D"_blank">mikhail.v.gavrilov@gmail.com</a>&gt;<br>
+Date: Sat, 6 Dec 2025 14:28:25 +0500<br>
+Subject: [PATCH] libbpf: Fix -Wdiscarded-qualifiers under C23<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+commit d70f79fef65810faf64dbae1f3a1b5623cdb2345 upstream.<br>
+<br>
+glibc =E2=89=A5 2.42 (GCC 15) defaults to -std=3Dgnu23, which promotes<br>
+-Wdiscarded-qualifiers to an error.<br>
+<br>
+In C23, strstr() and strchr() return &quot;const char *&quot;.<br>
+<br>
+Change variable types to const char * where the pointers are never<br>
+modified (res, sym_sfx, next_path).<br>
+<br>
+Suggested-by: Florian Weimer &lt;<a href=3D"mailto:fweimer@redhat.com" tar=
get=3D"_blank">fweimer@redhat.com</a>&gt;<br>
+Suggested-by: Andrii Nakryiko &lt;<a href=3D"mailto:andrii@kernel.org" tar=
get=3D"_blank">andrii@kernel.org</a>&gt;<br>
+Signed-off-by: Mikhail Gavrilov &lt;<a href=3D"mailto:mikhail.v.gavrilov@g=
mail.com" target=3D"_blank">mikhail.v.gavrilov@gmail.com</a>&gt;<br>
+Link: <a href=3D"https://lore.kernel.org/r/20251206092825.1471385-1-mikhai=
l.v.gavrilov@gmail.com" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/r/20251206092825.1471385-1-mikhail.v.gavrilov@gmail.com</a><br>
+Signed-off-by: Alexei Starovoitov &lt;<a href=3D"mailto:ast@kernel.org" ta=
rget=3D"_blank">ast@kernel.org</a>&gt;<br>
+[ shung-hsi.yu: needed to fix kernel build failure due to libbpf since gli=
bc<br>
+=C2=A0 2.43+ (which adds &#39;const&#39; qualifier to strstr) ]<br>
+Signed-off-by: Shung-Hsi Yu &lt;<a href=3D"mailto:shung-hsi.yu@suse.com" t=
arget=3D"_blank">shung-hsi.yu@suse.com</a>&gt;<br>
+Signed-off-by: Greg Kroah-Hartman &lt;<a href=3D"mailto:gregkh@linuxfounda=
tion.org" target=3D"_blank">gregkh@linuxfoundation.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport[<a href=3D"https://git.kernel.org/pub/scm/linux/=
kernel/git/stable/linux.git/commit/?h=3Dlinux-6.18.y&amp;id=3Dab21cf885fb2a=
f179c44d8beeabd716133b9385d" rel=3D"noreferrer" target=3D"_blank">https://g=
it.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=3Dlinux-6=
.18.y&amp;id=3Dab21cf885fb2af179c44d8beeabd716133b9385d</a>]<br></blockquot=
e><div><br></div><div>This seems to be malformed ( add a space after &#39;B=
ackport&#39; )=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=
=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
+---<br>
+ tools/lib/bpf/libbpf.c | 7 ++++---<br>
+ 1 file changed, 4 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c<br>
+index dd3b2f57082d..9c98c6adb6d0 100644<br>
+--- a/tools/lib/bpf/libbpf.c<br>
++++ b/tools/lib/bpf/libbpf.c<br>
+@@ -8245,7 +8245,7 @@ static int kallsyms_cb(unsigned long long sym_addr, =
char sym_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bpf_object *obj =3D ctx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct btf_type *t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct extern_desc *ext;<br>
+-=C2=A0 =C2=A0 =C2=A0 char *res;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *res;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D strstr(sym_name, &quot;.llvm.&quot;);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sym_type =3D=3D &#39;d&#39; &amp;&amp; res)=
<br>
+@@ -11574,7 +11574,8 @@ static int avail_kallsyms_cb(unsigned long long sy=
m_addr, char sym_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0[0] =
fb6a421fb615 (&quot;kallsyms: Match symbols exactly with CONFIG_LTO_CLANG&q=
uot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char sym_trim[256], *psy=
m_trim =3D sym_trim, *sym_sfx;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char sym_trim[256], *psy=
m_trim =3D sym_trim;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *sym_sfx;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(sym_sfx =3D s=
trstr(sym_name, &quot;.llvm.&quot;)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return 0;<br>
+@@ -12159,7 +12160,7 @@ static int resolve_full_path(const char *file, cha=
r *result, size_t result_sz)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!search_paths[i=
])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (s =3D search_p=
aths[i]; s !=3D NULL; s =3D strchr(s, &#39;:&#39;)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char *next_path;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *next_path;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int seg_len;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (s[0] =3D=3D &#39;:&#39;)<br>
+-- <br>
+2.34.1<br>
+<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126828): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126828" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126828</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119225487/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119225487/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001b17b90651a096a4--

