Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AF6C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 16:41:40 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.29556.1745772050858446863
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 09:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lOoKQCdr;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-606440d92eeso2163446eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745772050; x=1746376850; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YgTGW8KhshzYShkPQql8qd62BJgu12xHUsmDcudWrtY=;
        b=lOoKQCdrvIKU544wIWWulsrRD22DkQ1j/F7h039vMNBFgdPGWvPCLecQuZAEo1BfML
         9PK1sncLn/HoODaqOGDGdb1lDHJKBPNXkkkWztUpP/iQmhiuhrCjH+7rWtASSPB7U79D
         fC9yeao245UBmm6s7nOd3HxBwjOhpHZGwZ7XA/sZhSdnk/nmCV90rB9oFqEGi+SFt1ac
         H013VBCJ/pacDFC8Hiqa7ZncGy3dt+rjwf5c5BoUi5TLUWgwzOX4LiYpCxxSaI7UwfuC
         p21M+/BP5gN0my4YnJAeY2hGV/kSQbyS3RwjGZqTe6OAxKrLHfRlb5rwSpIbBvCxZHfe
         s+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745772050; x=1746376850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgTGW8KhshzYShkPQql8qd62BJgu12xHUsmDcudWrtY=;
        b=iyH88TLawddo75STLVnbFNxNYnUY4hxXR1gZLt0r9FBCE/83Yg7RxAWjjREjKmj2/c
         5GL8pCq/6dSMqrfHrZx90UR0oJQZCTjOu7DZ9FO1bIkua81dLx9+aCIiNLZgzeaxH2mC
         YMTWGvlxEdHhM3x/efnn0JCadd6ygfXoiNDucUL1ty87/QH749Wx8Py+ckVeqAqYmrYZ
         naczjJf5rP8UpM70oq3DGnssveJ1ObCloBibTZSbxuEUG333RTMjrxVCe8Q43+VzBQQ+
         k8u0yVbxZrz/1+l3zwy5Y4kloNB1kjy/HZUhkT1T9GVIsvoCyrWDcrjZ7vU3i/2XLPAS
         kk7w==
X-Gm-Message-State: AOJu0Yz6WI84hSXuTkGOihiXXRQguHbt2yY6A/SLnrTfEv25w//FwEYP
	NnO/VsdfuMnLto3NbVT2sFG5f9XUY4XGM5j4+NSJZjRSLODY9RZT76IQ0FbdTlmVyQKbV0IVBZR
	r1eV4iSz53MBr6PIEzQtiZ0VlWl2wVc3j
X-Gm-Gg: ASbGncs/Wdrem41FI62+HxqSaqDm0W7UjapwVUsrBhzUy34HUls17/TbD1UhHaAmgvW
	4Tj30dn5dG1jgVF4NAtfkfVBhGJ4Xob/6zFxuxdI2pfnz7fSjFC/Pys0WRS/OoUdHd/0NxlQxl6
	/6Ygou+qDgqhp29+YrCJ2max/SuJRL3CA/+V8t9Op9Yke1Gymug6eyd3g=
X-Google-Smtp-Source: AGHT+IF808YnG+iMaaZpp1NO0YWl5CDHMODna2bH7MpMcxT6tpZDTlP4bFZuLGfcmfVwbK/LfC/On6q5pAeohxD40tI=
X-Received: by 2002:a05:6820:1b1a:b0:603:f29b:85b4 with SMTP id
 006d021491bc7-606527b2a30mr4716038eaf.0.1745772049981; Sun, 27 Apr 2025
 09:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250427163710.14826-1-schonm@gmail.com>
In-Reply-To: <20250427163710.14826-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Apr 2025 09:40:39 -0700
X-Gm-Features: ATxdqUGEQC1sHwiDPYfAyNq7ynZePKk7Bax6GtK060UMCBSYpyFkGrGXePFdfc0
Message-ID: <CAMKF1so_ceGimH+ySHK4QQamSFdVTGgH7mvgo=yo3RK49-WX0g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] pgpool2: upgrade 4.5.1 -> 4.5.2
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e5e4070633c53a2a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 16:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117170

--000000000000e5e4070633c53a2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does this fix build with gcc15 as well or do we still need to stick to c17

On Sun, Apr 27, 2025 at 9:37=E2=80=AFAM J. S. via lists.openembedded.org <s=
chonm=3D
gmail.com@lists.openembedded.org> wrote:

> Fixes for memory leaks, uninitialized memory, segmentation faults and
> other fixes.
>
> Changelog: https://www.pgpool.net/docs/latest/en/html/release-4-5-2.html
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../pgpool2/{pgpool2_4.5.1.bb =3D> pgpool2_4.5.2.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.1.bb =3D>
> pgpool2_4.5.2.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
> b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
> similarity index 95%
> rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
> rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
> index a2f7665df1..d3dadfc6d0 100644
> --- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.1.bb
> +++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.2.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D "
> http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
>            file://pgpool.sysconfig \
>            file://pgpool.service \
>             "
> -SRC_URI[sha256sum] =3D
> "8e14b0558a15dae8767c8e1acee3f2f6c7c08ebfffda66a359367eaaa56c3936"
> +SRC_URI[sha256sum] =3D
> "480ac23f01cd7d6c856b29386bf17a848712fb4b4057d4c8abd5c8bf819bdf06"
>
>  S =3D "${WORKDIR}/pgpool-II-${PV}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117169):
> https://lists.openembedded.org/g/openembedded-devel/message/117169
> Mute This Topic: https://lists.openembedded.org/mt/112485538/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e5e4070633c53a2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Does this fix build with gcc15 as well or do we still nee=
d to stick to c17=C2=A0</div><div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 27, 2025 at 9=
:37=E2=80=AFAM J. S. via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;schonm=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Fixes for memory leaks, uninitialized memory, segment=
ation faults and other fixes.<br>
<br>
Changelog: <a href=3D"https://www.pgpool.net/docs/latest/en/html/release-4-=
5-2.html" rel=3D"noreferrer" target=3D"_blank">https://www.pgpool.net/docs/=
latest/en/html/release-4-5-2.html</a><br>
<br>
Signed-off-by: Jason Schonberg &lt;<a href=3D"mailto:schonm@gmail.com" targ=
et=3D"_blank">schonm@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../pgpool2/{<a href=3D"http://pgpool2_4.5.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">pgpool2_4.5.1.bb</a> =3D&gt; <a href=3D"http://pgpool2_4.5=
.2.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.5.2.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-networking/recipes-support/pgpool2/{<a href=3D"http://pgp=
ool2_4.5.1.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.5.1.bb</a> =
=3D&gt; <a href=3D"http://pgpool2_4.5.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">pgpool2_4.5.2.bb</a>} (95%)<br>
<br>
diff --git a/meta-networking/recipes-support/pgpool2/<a href=3D"http://pgpo=
ol2_4.5.1.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.5.1.bb</a> b/m=
eta-networking/recipes-support/pgpool2/<a href=3D"http://pgpool2_4.5.2.bb" =
rel=3D"noreferrer" target=3D"_blank">pgpool2_4.5.2.bb</a><br>
similarity index 95%<br>
rename from meta-networking/recipes-support/pgpool2/<a href=3D"http://pgpoo=
l2_4.5.1.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.5.1.bb</a><br>
rename to meta-networking/recipes-support/pgpool2/<a href=3D"http://pgpool2=
_4.5.2.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.5.2.bb</a><br>
index a2f7665df1..d3dadfc6d0 100644<br>
--- a/meta-networking/recipes-support/pgpool2/<a href=3D"http://pgpool2_4.5=
.1.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.5.1.bb</a><br>
+++ b/meta-networking/recipes-support/pgpool2/<a href=3D"http://pgpool2_4.5=
.2.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.5.2.bb</a><br>
@@ -16,7 +16,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.pgpool.net/mediaw=
iki/images/pgpool-II-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank"=
>http://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pgpool.sysconfig \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pgpool.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;8e14b0558a15dae8767c8e1acee3f2f6c7c08ebfffda6=
6a359367eaaa56c3936&quot;<br>
+SRC_URI[sha256sum] =3D &quot;480ac23f01cd7d6c856b29386bf17a848712fb4b4057d=
4c8abd5c8bf819bdf06&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/pgpool-II-${PV}&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117169): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117169" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117169</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112485538/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112485538/1997914</a><br>
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

--000000000000e5e4070633c53a2a--

