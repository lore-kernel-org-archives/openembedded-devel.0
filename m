Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13177.1793717729118038616
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BiyYRu3e;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ac525c1f05so40400897b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 06:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793717728; cv=none;
        d=google.com; s=arc-20260327;
        b=rKHRHOMU62lXuqhP5ZyuvuRYweU8QC1m8DSg3yaWGgTHdvY0sW0rxivFhWiFQ0rv1Z
         2610S6oKTKvqUGaD+zAsr/WTCX6pJzAnYxKHZCoEMmrl3fHsIjmb8pFxzshsAAO40V+U
         8Zt3HPvCtrdDT/lvGhYd2hYV33HaNp9HQENmm3v3y4FynCei4gqWbrd93wCPNmfRJmCc
         JP9B/ZR3dNN26M7pm1qTWwjRgBGOLBtggcI6+3FOniV+ldWgabOLX6udEU/eMJt/Fq7p
         8CW3FTAR1P0kwNsCqJK3pi1Xfd+TWP9UK26TVdsT9BlxZCf22fcIT6pp7xB6c1HZzhpc
         rKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TNhghUbKegyR7vN4L+h5AtQYj0r4noo9L8npG7SO7aQ=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=RVc4F4VwKmVqCCh3tVqppYzyu79lKRPyXVImO0fXlkCHyvdJ8K++FhmnXQ8LM6hsgz
         j84Tl8yk6/PquqrwRIWGigbg1ZHL7XqJFDGfilVFX5jdHiOhfxSQnR5r8Z11WTvKfU3i
         YKqqFHWukyxlonz/JZsuWEOPaupI4Wchn4lUmMGYKIbYZ2yBKVam37YbT2emA9ymOeAq
         Rhf7AAm633iFp0HxLLqJQh2KCXrfzVSIVbGuOsH956g8bUeYafaoX1MjLBwZ8OEtK3Ty
         vJs/yPbaoa0lWAhmY+YopGI9oDXecftARjIHgRG2GqkMLB7i+7hlWzlmhVQdCDCYOGAJ
         2XsA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793717728; x=1794322528; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNhghUbKegyR7vN4L+h5AtQYj0r4noo9L8npG7SO7aQ=;
        b=BiyYRu3ezbQbeMEZ+mu5QWUkkTb36u7QXCAyt2ejjQsWI92gprh9AcXZJiYTyepkAz
         ynvYTYPZSh7AjgJh/ZnmHEGSy4qBE95r3HBk+aGNpPHRbWqsiDisy4je85engLi2H5fz
         MX2nhCmVjMfglGNZqRFrdK85qN+MTsafFYrqs1NDzrzluzcN9LGv9VzECyF+TiGUFFWB
         cdxv84c8ZCNQj5r062B1/wVtfk9Zd8YKfbB3i/0a8jwggp6ZaCljU0f12WvwsOU9I+L1
         /6QraxI8fGIQSFxUVQGYO3vbZR3GlGFi3AlCPRj0OwY9Z+5zKKUreRFIKapqasUFlJdl
         QcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717728; x=1794322528;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TNhghUbKegyR7vN4L+h5AtQYj0r4noo9L8npG7SO7aQ=;
        b=ciXLE4jAtdhG/OohGDEiT9R0ayIXk7SoK+6naqJdUKNVxXL+keRIk5HJlVQ7hp7o+5
         Gbjx9J6gBNdksQSl/lDc4cUGRBkKNsuuNtid6YwhCOMYgT15/6kHBqQSx9gKJz1YTFC8
         Z6oz7FgRlpcJDyBov6ZYtml9eIQNZ8g0y8YE+cxnX7ldoT9j7fo557iBK1Wf1d8FGuRx
         mgAT/XyJRx8MvIDGPtOcTEED+09fkF704tkPJagwaofJK/Q/QhNHzq31Gk4GDRIQm+k8
         hg+fmt9v8dekGcJ9pEOpkAsu12tvFjMMz4LnqTNpBK5Tj1dpRf+te/obUWMgPu+MgMxH
         fxLQ==
X-Gm-Message-State: APuU4Z+LNDicAukPcbSpcMs88FaLI8Z4pTrassgdNm0N1E/KV6HYbGvt
	VrVAuCk0Gn7TDurlrJXRpaHSfcxy5rCFfBrk2iEX6v4+hL7vfu8NuB+v9rJkkY2LiaH/AbC/LuI
	iAPQqwbFR0hwfLDj7pkhfw0HpridZEyo=
X-Gm-Gg: AYBFou0WGKAagRdkaWbFDDeUv3sFUBonBUBsahDxPuVkQZ01JaEFBNzP68R4eib9ipV
	Q8nk5qDFmsrL7P6c+TRwtq4d//zUyoqKrCwpbb1GYI7n7s8F9Rillq4WSJQRwWXjGAuo7MH+yLf
	PFgdCilXotYdb750aHBg97nsLc96HpwOVkB+c4XofOU+2GTlXfJZWh1vb+et3diQkKfIRJMenh8
	lHHpPuMVZ/khObBKLdhmNtClLeZsujxCSa7Dc5xiEBkVMTrSWMsTQL6u3uXVF76+aHDRAzW7eBD
	ZtZpgDMucM/mIdU+CS8B4dUc4Pl2yBPKidnP57hLGOG3O6BCBwbjQB0Em4NusdaGgH+HcloEj7K
	QX4JmLM6cgtd46ht18/CuEmp37jWYE34eRv3HVNgfBem/2UWoh2TEF7HYVBcb+w8coGOXN9nOjb
	sLMeYvZPDzQZfnyX9Aj0qh/gqENPaEpcMthcQHKqO0iFMn9l7qp8NBUzTX8cRju892EnZimoJT/
	Krkr+RjlPP/ihU7sU0XeUk2v+T8dMBZRW668m+gTnh5eNZiFdZWAkryKRe68sm9Wqprlk03BDWQ
	/Hz0dWCjrsCcau2Gq6I2UKo33sfhC+b2HggcVfMcRbGE/9lNlHoXsABvG471N3trpuVTTVgEODF
	mkpE3+cjxUbzjpIhT9KQk+A==
X-Received: by 2002:a05:690c:39b:b0:8b1:46a1:2893 with SMTP id
 00721157ae682-8b2b6597d22mr106886507b3.6.1793717728125; Tue, 03 Nov 2026
 06:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20261103145328.1973965-1-leon.anavi@konsulko.com> <20261103145328.1973965-3-leon.anavi@konsulko.com>
In-Reply-To: <20261103145328.1973965-3-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Nov 2026 06:55:00 -0800
X-Gm-Features: AclHuK8bbIP2jW4g5HLs_Krf5qTcuzKRcD89BVtGPKcdHPJ2OGLl1AhXm0lFV60
Message-ID: <CAMKF1soPVRZnP2TMvtwU1KOgsndQjJmNZbVgsFxncDu+-oO20Q@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 3/3] overlayfs-tools: Upgrade
 2025.01 -> 2026.10
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000328a1065f6074c4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 14:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131794

--0000000000000328a1065f6074c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 6:53=E2=80=AFAM Leon Anavi via openembedded-devel
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 2026.10:
>
> - meson: Disable tests build by default
> - Define attr dependency
> - Test if merged overlay is usable after mounting
> - Remove trusted xattrs from upperdir metacopies before copying
>   attributes
> - Add Option To Use rsync for merge Operation
> - Support merge metacopy file
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...verlayfs-tools_2025.01.bb =3D> overlayfs-tools_2026.10.bb} | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>  rename meta-filesystems/recipes-utils/overlayfs/{
> overlayfs-tools_2025.01.bb =3D> overlayfs-tools_2026.10.bb} (68%)
>
> diff --git a/meta-filesystems/recipes-utils/overlayfs/
> overlayfs-tools_2025.01.bb b/meta-filesystems/recipes-utils/overlayfs/
> overlayfs-tools_2026.10.bb
> similarity index 68%
> rename from meta-filesystems/recipes-utils/overlayfs/
> overlayfs-tools_2025.01.bb
> rename to meta-filesystems/recipes-utils/overlayfs/
> overlayfs-tools_2026.10.bb
> index 3b5963bb26..6a3d609567 100644
> --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
> +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.10.bb
> @@ -7,14 +7,10 @@ SRC_URI =3D "\
>      git://
> github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;branch=3Dmaster;tag=
=3Dv${PV}
> <http://github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;branch=3Dmas=
ter;tag=3Dv$%7BPV%7D>
> \
>  "
>
> -SRCREV =3D "6e925bbbe747fbb58bc4a95a646907a2101741f6"
> +SRCREV =3D "950d0cf35e4f917b6836565d76e38bcf7fcf2d5f"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>
>  inherit meson pkgconfig
>
>  DEPENDS:append:libc-musl =3D " fts"
> -
> -do_configure:prepend() {
> -       sed -i '/Custom targets for testing overlay function/,/command :
> .*permanent...changes/ d' ${S}/meson.build
> -}
>

Why is this hunk removed ?


> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131793):
> https://lists.openembedded.org/g/openembedded-devel/message/131793
> Mute This Topic: https://lists.openembedded.org/mt/122076983/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000328a1065f6074c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 3, =
2026 at 6:53=E2=80=AFAM Leon Anavi via openembedded-devel &lt;leon.anavi=3D=
<a href=3D"mailto:konsulko.com@lists.openembedded.org">konsulko.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Upgrade to release 2026.10:<br>
<br>
- meson: Disable tests build by default<br>
- Define attr dependency<br>
- Test if merged overlay is usable after mounting<br>
- Remove trusted xattrs from upperdir metacopies before copying<br>
=C2=A0 attributes<br>
- Add Option To Use rsync for merge Operation<br>
- Support merge metacopy file<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://verlayfs-tools_2025.01.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">verlayfs-tools_2025.01.bb</a> =3D&gt; <a href=3D"http://ove=
rlayfs-tools_2026.10.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-too=
ls_2026.10.bb</a>} | 6 +-----<br>
=C2=A01 file changed, 1 insertion(+), 5 deletions(-)<br>
=C2=A0rename meta-filesystems/recipes-utils/overlayfs/{<a href=3D"http://ov=
erlayfs-tools_2025.01.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-to=
ols_2025.01.bb</a> =3D&gt; <a href=3D"http://overlayfs-tools_2026.10.bb" re=
l=3D"noreferrer" target=3D"_blank">overlayfs-tools_2026.10.bb</a>} (68%)<br=
>
<br>
diff --git a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://ove=
rlayfs-tools_2025.01.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-too=
ls_2025.01.bb</a> b/meta-filesystems/recipes-utils/overlayfs/<a href=3D"htt=
p://overlayfs-tools_2026.10.bb" rel=3D"noreferrer" target=3D"_blank">overla=
yfs-tools_2026.10.bb</a><br>
similarity index 68%<br>
rename from meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://over=
layfs-tools_2025.01.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tool=
s_2025.01.bb</a><br>
rename to meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overla=
yfs-tools_2026.10.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tools_=
2026.10.bb</a><br>
index 3b5963bb26..6a3d609567 100644<br>
--- a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overlayfs-=
tools_2025.01.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tools_2025=
.01.bb</a><br>
+++ b/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overlayfs-=
tools_2026.10.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tools_2026=
.10.bb</a><br>
@@ -7,14 +7,10 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/kmxz/overlayfs-tools=
.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" =
target=3D"_blank">github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;bran=
ch=3Dmaster;tag=3Dv${PV}</a> \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;6e925bbbe747fbb58bc4a95a646907a2101741f6&quot;<br>
+SRCREV =3D &quot;950d0cf35e4f917b6836565d76e38bcf7fcf2d5f&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
<br>
=C2=A0inherit meson pkgconfig<br>
<br>
=C2=A0DEPENDS:append:libc-musl =3D &quot; fts&quot;<br>
-<br>
-do_configure:prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/Custom targets for testing overlay=
 function/,/command : .*permanent...changes/ d&#39; ${S}/meson.build<br>
-}<br></blockquote><div><br></div><div>Why is this hunk removed ?</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131793): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131793" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131793</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122076983/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122076983/1997914</a><br>
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

--0000000000000328a1065f6074c4--
