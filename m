Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB82C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 16:56:30 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155850.1783356983792618596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 09:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BwDJ9B4+;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6651bc57458so2056563d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783356983; cv=none;
        d=google.com; s=arc-20260327;
        b=pZF9j+koibxxNGdISdrbEIOHQbeRg0X+94VH8zISXGv7Lafa4EadisbjEFaKSSua0M
         bjeMs+2v7Ms5aGu4Wor0BeaOXSjEAmUfGR+5xSnT/IYACwtQaS4tTuB7ZtPgxYH0fuR4
         m2qzcHCGwXYeaQMuLfaqsUE0IIG161GoR5cncZ58W3hz6JNCrFmuxVRhCp1I6UsAMK9c
         dS3mZ8Vfyk5oR1iAnyfpfKCFR4Y9M9lj2eywiHNq36zQk9wkF3gFqZHuYdnrOxZaWJCs
         XvldanY3pObtzBfgkx3jduv5+cDY3gfpnkwGJtwvAt2iXEc+O2foxFvHrmSZmz3J5KFz
         4w3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XeWC322jC9bSzNJJ5XXLWNf+4RQNbfXKgkYYGGdpXkU=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=W5+acG+mdi6RSbyxSw0TYAG6NI1lt7yNhSBPxhdaLhubCUsbnV/tTrYvtAyKQbDUnz
         XhxsrIK/o96o61vfak+L+n6NPsZYlMhvyhfhNObxh7lvSz6fPrb0Jl4oyVeLiIdzZZuF
         OF5CZ80v4YDXA/S+hJRa+qmA/JYNNzpvsmVeLwffsNyqVPq7BbdbBzHwr/8vnDMKkIAr
         HUUON//CL9ral4Y6gURAjmpVhmQTc5KW2gfjukcN8+M/6AzTzNOLo7daNK58+UgKRUkj
         3wx0bmE9ypG+cGtb/SzNNxxGxcQ5cWkoBC7c4PMFVMYP+ar4yErXlplWlW8pOLLFcfsY
         WjAw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783356983; x=1783961783; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeWC322jC9bSzNJJ5XXLWNf+4RQNbfXKgkYYGGdpXkU=;
        b=BwDJ9B4+hSHAt3+Nj8hLXUHg2+JlPN0ie1mQP9deGgVzbxlfIxT7k5+Z+mSTZfVnZX
         q4B47OXvjRFiBXPK9qEGYROURqlrGEXjfpXLGxElE5iBkuZXDrl4pFBhWagYWAQt2XT3
         b6bRv12oPaACSPgMPz8L0LtWx3bkj8mr41NPmitr0AQPqz/pFlGcGtfrcQG2lc89LSg2
         TjDfII+AvZO8YBVQjJ89eQY3LBg00S5fd0a99p1eCvV02dofi0P2UOgE9wIMxlM5QJ7/
         pU7c5elu27Jgsb3WuVYWh4Z3g8RI8J0T/d464M+O6uPS5dJy3jFu9WIXlC6XHbWaiy7F
         1lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356983; x=1783961783;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XeWC322jC9bSzNJJ5XXLWNf+4RQNbfXKgkYYGGdpXkU=;
        b=QMgfrkKpn0eRRFJ1iRyDIuKIJwdvpT05YVouDBJIHT6jjAvZihybr27k90uLUL2C7J
         CUjNSc94AJgooY0tdASGl6AgnGrTMKUEowjGhrY1WN2ikLNi6Z3cJEU0/EP/hTjHpUID
         e/44iy4O4OARyibe9AwPbDvtsogzbX2TjnLzW/tqupV2l/1/nue3QcZQWEATyPJp8p2E
         MFs3dd3Mtgr6xwQX3MRuLHrGSI3wrpd1rvTeX8unKlgXX9vmZWTX6VZEXBws0ks86pFJ
         HppW1ab3AtRmmSTdeuiI79KHLlcG82gFIHktpJNBShDsO0qADzK1+sBrmv0RxZK4SWNs
         mnfA==
X-Gm-Message-State: AOJu0Yxs7HZedSCc7/3EbPJUsvXTlYqgxshPn/XgQ5GYIGKs3A6EAaEH
	+Thiy24KoxMXCYpT4bALvN72FMsWyw8cb18F1JO3dzqu5MR2WUq/Lkt6OOCX3Mj5OxQ8QNjV9hQ
	VoqQGrdh7MgoYKOXQ3Fh6uBwQgle9kAy0Gm6GMtU=
X-Gm-Gg: AfdE7cl2W3hAQLKGa712kUvTQCyZXnWia7Y0Ps+aeioOMllK6CArUOiXO/0/wsA7QSd
	52i4nidm81TbMGLxzG8IKgORj+5/YRqyof5w/fQks8/YjtiHUWdPovKALv/BW4nYMJW6ZgHDpvQ
	K3XFKwDgAdA0AUef5j0N4MUZCE8WWjamkWjBucNFw6MlTigy5TkhgrTw0LpUTl86RlXNbqCP4CK
	wTKVEMAW0gpId6O0s/X7gAVRCqJLGNGUdE2GGff3dNzX71QGBu33zsvP+5awAESGFDUWcTNiDi1
	8rcjm6299Fz9KPeYucUj9EGbZhhTe9OQez6lIgpjvh/63Od85SuDmdJCtB54+Axe6pbkX7GSBme
	0Musv6cYvGVVlzPrWgwAkXc0BXAig2mnZVJC2zTLdZ/sUJlphaaBjT1vmwto7ezIViuZVT8M=
X-Received: by 2002:a05:690e:4513:10b0:664:d899:e3a9 with SMTP id
 956f58d0204a3-6677fb7f1ebmr915461d50.20.1783356982767; Mon, 06 Jul 2026
 09:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260706090242.2035-1-wangmy@fujitsu.com>
In-Reply-To: <20260706090242.2035-1-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jul 2026 09:55:56 -0700
X-Gm-Features: AVVi8CdAFv8sfLDDwxU-pVeuwhjeyc5fpXqmHjxM4t_ukYNoFsR1X8htUwhzuIA
Message-ID: <CAMKF1sp-cNCZGbB_fPKi5jcZNr0XZeY0nR+bZA6G37h3ogcM0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] fastfetch: drop drm-amdgpu and split vaapi
 into va-drm/va-x11
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007735c70655f42733"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 16:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128051

--0000000000007735c70655f42733
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this patch is confusing, can you clarify if this is needed. Given its also
part of the upgrade patch sent on July 1

On Mon, Jul 6, 2026 at 2:02=E2=80=AFAM wangmy via lists.openembedded.org <w=
angmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
> b/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
> index cf1410a96d..fb56556ff3 100644
> --- a/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
> +++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
> @@ -35,7 +35,6 @@ PACKAGECONFIG[chafa] =3D
> "-DENABLE_CHAFA=3DON,-DENABLE_CHAFA=3DOFF,chafa"
>  PACKAGECONFIG[dbus] =3D "-DENABLE_DBUS=3DON,-DENABLE_DBUS=3DOFF,dbus"
>  PACKAGECONFIG[dconf] =3D "-DENABLE_DCONF=3DON,-DENABLE_DCONF=3DOFF,dconf=
"
>  PACKAGECONFIG[ddcutil] =3D
> "-DENABLE_DDCUTIL=3DON,-DENABLE_DDCUTIL=3DOFF,ddcutil"
> -PACKAGECONFIG[drm-amdgpu] =3D
> "-DENABLE_DRM_AMDGPU=3DON,-DENABLE_DRM_AMDGPU=3DOFF,"
>  PACKAGECONFIG[drm] =3D "-DENABLE_DRM=3DON,-DENABLE_DRM=3DOFF,libdrm"
>  PACKAGECONFIG[egl] =3D "-DENABLE_EGL=3DON,-DENABLE_EGL=3DOFF,virtual/egl=
"
>  PACKAGECONFIG[elf] =3D "-DENABLE_ELF=3DON,-DENABLE_ELF=3DOFF,elfutils"
> @@ -49,7 +48,8 @@ PACKAGECONFIG[opencl] =3D
> "-DENABLE_OPENCL=3DON,-DENABLE_OPENCL=3DOFF,opencl-headers v
>  PACKAGECONFIG[pulseaudio] =3D
> "-DENABLE_PULSE=3DON,-DENABLE_PULSE=3DOFF,pulseaudio"
>  PACKAGECONFIG[rpm] =3D "-DENABLE_RPM=3DON,-DENABLE_RPM=3DOFF,rpm"
>  PACKAGECONFIG[sqlite3] =3D
> "-DENABLE_SQLITE3=3DON,-DENABLE_SQLITE3=3DOFF,sqlite3"
> -PACKAGECONFIG[vaapi] =3D "-DENABLE_VA=3DON,-DENABLE_VA=3DOFF,libva"
> +PACKAGECONFIG[va-drm] =3D "-DENABLE_VADRM=3DON,-DENABLE_VADRM=3DOFF,libv=
a"
> +PACKAGECONFIG[va-x11] =3D "-DENABLE_VAX11=3DON,-DENABLE_VAX11=3DOFF,libv=
a"
>  PACKAGECONFIG[vdpau] =3D "-DENABLE_VDPAU=3DON,-DENABLE_VDPAU=3DOFF,libvd=
pau"
>  PACKAGECONFIG[vulkan] =3D
> "-DENABLE_VULKAN=3DON,-DENABLE_VULKAN=3DOFF,vulkan-loader"
>  PACKAGECONFIG[wayland] =3D
> "-DENABLE_WAYLAND=3DON,-DENABLE_WAYLAND=3DOFF,wayland"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128035):
> https://lists.openembedded.org/g/openembedded-devel/message/128035
> Mute This Topic: https://lists.openembedded.org/mt/120136754/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007735c70655f42733
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this patch is confusing, can you clarify if this is needed=
. Given its also part of the upgrade patch sent on July 1</div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Jul 6, 2026 at 2:02=E2=80=AFAM wangmy via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mai=
lto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank=
">wangmy@fujitsu.com</a>&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.65.2.=
bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.65.2.bb</a> | 4 ++--<b=
r>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_=
2.65.2.bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.65.2.bb</a> b/m=
eta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.65.2.bb" rel=
=3D"noreferrer" target=3D"_blank">fastfetch_2.65.2.bb</a><br>
index cf1410a96d..fb56556ff3 100644<br>
--- a/meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.65.2.=
bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.65.2.bb</a><br>
+++ b/meta-oe/recipes-support/fastfetch/<a href=3D"http://fastfetch_2.65.2.=
bb" rel=3D"noreferrer" target=3D"_blank">fastfetch_2.65.2.bb</a><br>
@@ -35,7 +35,6 @@ PACKAGECONFIG[chafa] =3D &quot;-DENABLE_CHAFA=3DON,-DENAB=
LE_CHAFA=3DOFF,chafa&quot;<br>
=C2=A0PACKAGECONFIG[dbus] =3D &quot;-DENABLE_DBUS=3DON,-DENABLE_DBUS=3DOFF,=
dbus&quot;<br>
=C2=A0PACKAGECONFIG[dconf] =3D &quot;-DENABLE_DCONF=3DON,-DENABLE_DCONF=3DO=
FF,dconf&quot;<br>
=C2=A0PACKAGECONFIG[ddcutil] =3D &quot;-DENABLE_DDCUTIL=3DON,-DENABLE_DDCUT=
IL=3DOFF,ddcutil&quot;<br>
-PACKAGECONFIG[drm-amdgpu] =3D &quot;-DENABLE_DRM_AMDGPU=3DON,-DENABLE_DRM_=
AMDGPU=3DOFF,&quot;<br>
=C2=A0PACKAGECONFIG[drm] =3D &quot;-DENABLE_DRM=3DON,-DENABLE_DRM=3DOFF,lib=
drm&quot;<br>
=C2=A0PACKAGECONFIG[egl] =3D &quot;-DENABLE_EGL=3DON,-DENABLE_EGL=3DOFF,vir=
tual/egl&quot;<br>
=C2=A0PACKAGECONFIG[elf] =3D &quot;-DENABLE_ELF=3DON,-DENABLE_ELF=3DOFF,elf=
utils&quot;<br>
@@ -49,7 +48,8 @@ PACKAGECONFIG[opencl] =3D &quot;-DENABLE_OPENCL=3DON,-DEN=
ABLE_OPENCL=3DOFF,opencl-headers v<br>
=C2=A0PACKAGECONFIG[pulseaudio] =3D &quot;-DENABLE_PULSE=3DON,-DENABLE_PULS=
E=3DOFF,pulseaudio&quot;<br>
=C2=A0PACKAGECONFIG[rpm] =3D &quot;-DENABLE_RPM=3DON,-DENABLE_RPM=3DOFF,rpm=
&quot;<br>
=C2=A0PACKAGECONFIG[sqlite3] =3D &quot;-DENABLE_SQLITE3=3DON,-DENABLE_SQLIT=
E3=3DOFF,sqlite3&quot;<br>
-PACKAGECONFIG[vaapi] =3D &quot;-DENABLE_VA=3DON,-DENABLE_VA=3DOFF,libva&qu=
ot;<br>
+PACKAGECONFIG[va-drm] =3D &quot;-DENABLE_VADRM=3DON,-DENABLE_VADRM=3DOFF,l=
ibva&quot;<br>
+PACKAGECONFIG[va-x11] =3D &quot;-DENABLE_VAX11=3DON,-DENABLE_VAX11=3DOFF,l=
ibva&quot;<br>
=C2=A0PACKAGECONFIG[vdpau] =3D &quot;-DENABLE_VDPAU=3DON,-DENABLE_VDPAU=3DO=
FF,libvdpau&quot;<br>
=C2=A0PACKAGECONFIG[vulkan] =3D &quot;-DENABLE_VULKAN=3DON,-DENABLE_VULKAN=
=3DOFF,vulkan-loader&quot;<br>
=C2=A0PACKAGECONFIG[wayland] =3D &quot;-DENABLE_WAYLAND=3DON,-DENABLE_WAYLA=
ND=3DOFF,wayland&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128035): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128035" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128035</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120136754/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120136754/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007735c70655f42733--

