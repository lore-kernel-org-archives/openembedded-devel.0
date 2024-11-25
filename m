Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D33D58D7F
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:46:36 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.26491.1732560386874258898
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 10:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kqHgQ0by;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3ea49150430so616981b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 10:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732560386; x=1733165186; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0aG75YdzlGzkFp9v705/iI2i+IovdxZ90UdCE2itSQ=;
        b=kqHgQ0bykE3Qtpfre0Vx4dAdNHuTMZpXHAInA2ZeknSVgacJHsJQMVKmYJig8XEPP+
         D8ijXIQcfNz6rSHNvsuEh8ic7AINTzornadqW2qnda60oE1OImtHHXyBOAPRBNdPdejt
         LlLnz3Ws1mLqNqMu2Yzv0ZswM5/00SoUVk8nvk0XOrfRiyKKi7ZRvc5PYy8V8nDv+PMf
         Oz4e8BDbXvY0CBVUUCOStQ/Tk7XqfN7BOrSaXID3J7aZ2alXZt2+Op6A5Kn+H9o0OCvr
         46McPJbSRY+B9dSsZdzzJcYT2jUizizE/YqZtGl6kVJB7sF71zyOeWE41iT2yydg18Rr
         nDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732560386; x=1733165186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0aG75YdzlGzkFp9v705/iI2i+IovdxZ90UdCE2itSQ=;
        b=UJpH84IbWCVBkXN2JIROexV8SuSze3q2eWnC+y1iH39j6WurThA3PxGlZneCBCLMPz
         wbvD3MIreGogscc2pbSyroHyZ2+/Xb0E5GZLQSXfEyrjVeDO1wquQUT4i14PgB8HKUsc
         7V3K02vKvrqP6rc43tURcFc/gIEv5AuUt2WfhbM2JWptsrGOczLlWSho4Miaez+HDLLC
         6E72XljGXRmYdAJ0+o/i6kO7OaRM1O6FIR0e0d/lfgI/Fv5oa2q9YXNv83p+8rhiw+xS
         oqXSIZ/BexwiRyKehhPcIGAUo7q8oAOPxkJbzcqaDzkXYVm1JW/FM3N1e9aHUimlzTSg
         Qa8Q==
X-Gm-Message-State: AOJu0YxNXk/asnd5xp2efPrnZQcJLUe1VKZdWzMzALH2v48bf5MZ2jXA
	1WQ9r8T3uQ9fODGxlbr+6Mstxsme+Pc0ffAOwA0UdGnugSspW6+OCJHZcUwjqQrgbKQfshs7RbE
	IxcB5aVYeXG+scsoR28UJSaWqErU/e/Ho
X-Gm-Gg: ASbGncvzM5to/y7tjChBoYMQyw8sAb3GhTAW3a6m/mSaHy7FkK2ebTL6UP+AY9lgZpW
	syRD6c2bYg98DluqMVrg0SL87QFhwzw==
X-Google-Smtp-Source: AGHT+IE8LzsnVSCg3Zjo24gzJkG6IUV9fHg1hFwefeyKkmtvXWiOIcvL3BJcgtvavnYYme96qCpGzfyi5JE7IGuNuuI=
X-Received: by 2002:a05:6808:170c:b0:3e7:b632:2a8 with SMTP id
 5614622812f47-3e915823eb2mr12856344b6e.17.1732560386141; Mon, 25 Nov 2024
 10:46:26 -0800 (PST)
MIME-Version: 1.0
References: <20241125145307.5479-1-schonm@gmail.com> <20241125145307.5479-3-schonm@gmail.com>
In-Reply-To: <20241125145307.5479-3-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2024 10:46:00 -0800
Message-ID: <CAMKF1sqgczUcaBXVYdZfF8vyJBhYb8sDA-hxvWF4s1zBE0HCDw@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 3/7] libxfce4ui: Upgrade 4.19.3 -> 4.19.4
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 18:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114047

with lld linker I see errors like

   | riscv32-yoe-linux-ld.lld: error: undefined reference: IceSetIOErrorHan=
dler
   | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
--no-allow-shlib-undefined)
   |
   | riscv32-yoe-linux-ld.lld: error: undefined reference: IceAddConnection=
Watch
   | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
--no-allow-shlib-undefined)
   |
   | riscv32-yoe-linux-ld.lld: error: undefined reference: IceConnectionNum=
ber
   | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
--no-allow-shlib-undefined)
   |
   | riscv32-yoe-linux-ld.lld: error: undefined reference: IceProcessMessag=
es
   | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
--no-allow-shlib-undefined)
   |
   | riscv32-yoe-linux-ld.lld: error: undefined reference:
IceSetShutdownNegotiation
   | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
--no-allow-shlib-undefined)
   |
   | riscv32-yoe-linux-ld.lld: error: undefined reference: IceCloseConnecti=
on
   | >>> referenced by ./.libs/libxfce4ui-2.so (disallowed by
--no-allow-shlib-undefined)

On Mon, Nov 25, 2024 at 6:54=E2=80=AFAM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> Changelog: https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.19=
.4
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../libxfce4ui/{libxfce4ui_4.19.3.bb =3D> libxfce4ui_4.19.4.bb}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.19.3.bb =3D> libx=
fce4ui_4.19.4.bb} (92%)
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb b/met=
a-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> similarity index 92%
> rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> index e53d01d00..ce711eb36 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.3.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.19.4.bb
> @@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
>  # TODO: Check if 0001-... can go
>  SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.x=
ml-fix.patch"
> -SRC_URI[sha256sum] =3D "16815eef494ba9bac9c854e95c205c0bc5568c8022c31604=
348f9edadb02f227"
> +SRC_URI[sha256sum] =3D "c873ec46d5dd448df60a8385e029892f85b40ad66200cc3c=
055ab7156d718796"
>
>  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
>  EXTRA_OECONF +=3D "--disable-vala"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114040): https://lists.openembedded.org/g/openembedde=
d-devel/message/114040
> Mute This Topic: https://lists.openembedded.org/mt/109772240/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

