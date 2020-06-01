Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.35189.1591012140190784088
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 04:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BXoE3mRP;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id g14so3235511uaq.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W3QIAybSI69OyKhpRz1WWvJjBJRRvP/L7oCA71lqqZI=;
        b=BXoE3mRPAQQcwfDhHA8kAv4bq1llzuboTsUsB1T0Bb/Gi9LVR1e9UZPWn9GOZDcuaK
         VYm7zTLXr72bfle1+axzdKh5v0CbMaW/6bSJhIP32CCC5jLm5fTQumSkjJiRcoSKAbjO
         wtZB92dJ2y2rklcKiMrDCIxgSi8ZzRkvdOw/RsMKuE50sQK/AvAlTeYB3fDxFuasdUMm
         +giEujAj/vk98YiN2wRhHrGHxaOTfGR4MwpP6em0HcXd+euUNUflgVOaDqTzFif63Lm8
         mlH8lr4Lb0T4FvfUhn6ytFAE+vtj4ENcyUcdACUjiSTiBFwd5Aly9alRlUa7byNrURog
         rD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3QIAybSI69OyKhpRz1WWvJjBJRRvP/L7oCA71lqqZI=;
        b=ZArdpVGc9gBzTrXVx4/xartEemz9GKxKaB6LPq/nfu56VIta6KWyBdGRW9dQR2NwNI
         Zkqr/fbhH67/M+L64tdxFSiCTZ15rUiQd54cwx1vKURMb6Ccd/6NplobNgg7G/CcvAs5
         eVapX9m6ZeiMBZUmQqElF6vzSsydgIpisX4O0OVWBrY19psm5DlUTLpDUC9cYhPAz1Tn
         RxVqHDjW5qbEdgPudqVswPIADx8jgBMHDAuAgPVDZY0PPZ7p6ocTjGUzR7rqTQwEj+kz
         Vb7bgf1hfRPPMIkXCiuQH58ZAkR+b3IpS81H7xc+xI2I05z1A5c7QNpy5hbSoq8st+Lk
         z5Cw==
X-Gm-Message-State: AOAM530ocEArZsIFb8/+09kn6jlj+7zPN1yGoIezu8UlP8MRfUAQ2PTb
	HZ+AzBJ1d8jC7puiflElhTewUrZt63z4E/Xcvjk=
X-Google-Smtp-Source: ABdhPJy14rfWFHDBh3yWDYh6M3+96DOf3eEyi9aqHfGO3UxLXOKSlOF+bcd01lCjt/mGm7vgay5MjzWFUcOVaiCMiEo=
X-Received: by 2002:a9f:3701:: with SMTP id z1mr14401442uad.100.1591012139375;
 Mon, 01 Jun 2020 04:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAKm+giO0HyHER+MkPyiN0GQou9j2Jsc6AuGTp6TyVBeHQSZ9qg@mail.gmail.com>
In-Reply-To: <CAKm+giO0HyHER+MkPyiN0GQou9j2Jsc6AuGTp6TyVBeHQSZ9qg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2020 13:48:48 +0200
Message-ID: <CANNYZj8dY=UPEqW6apNYMWQVofG7omUuyECdBhyZ-WcvtO=iPw@mail.gmail.com>
Subject: Re: [oe] Rootfs conflicts when using multilib and doc-pkgs
To: =?UTF-8?Q?Jonatan_P=C3=A5lsson?= <jonatan.p@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000066a1d005a70461e1"

--00000000000066a1d005a70461e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is intentional. We do not want to special case multilib variants of
packages, and they should all be co-installable. The correct behavior is t=
o
fix manpage generation in foo, so that it is reproducible, and either does
not write the build timestamp at all into the file, or writes it based on
SOURCE_DATE_EPOCH (not sure if the latter works as intended in 2.6 though)=
.

Alex

On Mon, 1 Jun 2020 at 13:20, Jonatan P=C3=A5lsson <jonatan.p@gmail.com> wr=
ote:

> Hello,
>
> I have a Yocto 2.6 build with multilib enabled. I also have the
> doc-pkgs IMAGE_FEATURE enabled. I have issues with lib32-foo-doc and
> foo-doc both installing manpages into the same location in the rootfs,
> which causes conflicts during do_rootfs of my image recipe.
>
> The way I understand it, there shouldn't be any issues with having
> lib32-foo-doc and foo-doc installing the same manpage, as long as the
> manpages from both packages are identical. My problem is that in some
> cases, the foo package is cached in sstate, but the lib32-foo package
> is not, and the manpage contains a timestamp of when it was built.
> This if course gives two different versions of the manpage.
>
> When the doc-pkgs IMAGE_FEATURE is enabled,
> IMAGE_INSTALL_COMPLEMENTARY is populated with "*-doc", which matches
> both lib32-foo-doc and foo-doc. This happens in image.bbclass. My
> current work-around for this is to set PACKAGE_EXCLUDE_COMPLEMENTARY
> to "lib32-*-doc" - which filters out all lib32 versions of the
> manpages. In the vast majority of cases, I suspect that the lib32
> version of the docs and the "normal" version should have the same
> contents, which means that keeping only one version of the manpages
> would work.
>
> Is the inclusion of both lib32-foo-doc and foo-doc intentional in
> IMAGE_INSTALL_COMPLEMENTARY, or is this a mistake? If it is a mistake,
> do you have any suggestions on what the correct behavior would be?
> Excluding all packages with the MLPREFIX seems to work in my case, but
> it seems like an inelegant approach.
>
> Thanks,
> Jonatan
>=20
>

--00000000000066a1d005a70461e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is intentional. We do not want to special case m=
ultilib variants of packages, and they should all be co-installable. The co=
rrect behavior is to fix manpage generation in foo, so that it is reproduci=
ble, and either does not write the build timestamp at all into the file, or=
 writes it based on SOURCE_DATE_EPOCH (not sure if the latter works as inte=
nded in 2.6 though).</div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 1 Jun 2=
020 at 13:20, Jonatan P=C3=A5lsson &lt;<a href=3D"mailto:jonatan.p@gmail.co=
m">jonatan.p@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello,<br>
<br>
I have a Yocto 2.6 build with multilib enabled. I also have the<br>
doc-pkgs IMAGE_FEATURE enabled. I have issues with lib32-foo-doc and<br>
foo-doc both installing manpages into the same location in the rootfs,<br>
which causes conflicts during do_rootfs of my image recipe.<br>
<br>
The way I understand it, there shouldn&#39;t be any issues with having<br>
lib32-foo-doc and foo-doc installing the same manpage, as long as the<br>
manpages from both packages are identical. My problem is that in some<br>
cases, the foo package is cached in sstate, but the lib32-foo package<br>
is not, and the manpage contains a timestamp of when it was built.<br>
This if course gives two different versions of the manpage.<br>
<br>
When the doc-pkgs IMAGE_FEATURE is enabled,<br>
IMAGE_INSTALL_COMPLEMENTARY is populated with &quot;*-doc&quot;, which mat=
ches<br>
both lib32-foo-doc and foo-doc. This happens in image.bbclass. My<br>
current work-around for this is to set PACKAGE_EXCLUDE_COMPLEMENTARY<br>
to &quot;lib32-*-doc&quot; - which filters out all lib32 versions of the<b=
r>
manpages. In the vast majority of cases, I suspect that the lib32<br>
version of the docs and the &quot;normal&quot; version should have the sam=
e<br>
contents, which means that keeping only one version of the manpages<br>
would work.<br>
<br>
Is the inclusion of both lib32-foo-doc and foo-doc intentional in<br>
IMAGE_INSTALL_COMPLEMENTARY, or is this a mistake? If it is a mistake,<br>
do you have any suggestions on what the correct behavior would be?<br>
Excluding all packages with the MLPREFIX seems to work in my case, but<br>
it seems like an inelegant approach.<br>
<br>
Thanks,<br>
Jonatan<br>
<br>
</blockquote></div>

--00000000000066a1d005a70461e1--
