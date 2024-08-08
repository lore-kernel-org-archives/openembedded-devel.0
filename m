Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DFBC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 13:40:18 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.60284.1723124410251824729
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 06:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aDa0amJg;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-66c7aeac627so10270187b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723124409; x=1723729209; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwwV9FiGtsH/heZ4jb+rYpV9AMMRDugvCwA/gxClPN4=;
        b=aDa0amJgLRdsAzy+s1l9hI33ZCz5NotSBiXJ+x5GrN3IKeMcckLASqZGbWRYRvEmXm
         mNaFjK8iKkjf2WLb4Acrfo5xgchVWyCUjr0a1fsfv/WO1tNiDeGjEa3sJgkd8t6I1srY
         aUZ3uoRQlYCzFqTgeiurJ7WM6hv+eCaEzujOVqvwV01m78jGP+0QfjWp7H3w4OWz8NBu
         u2fQKWbh4l2Ms45CtqYnDyrG3iaLNupT4woKj0HxaJqkTH+dkJsjAhQOYbS6gT7KQ24q
         5y2r0EnT5MkiZ2xBZe3oGMYv3/r0qZiQU/ZNbGmsVfgTr2QoQ3ZBw+xSTQDT+N4rKd/u
         vpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124409; x=1723729209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwwV9FiGtsH/heZ4jb+rYpV9AMMRDugvCwA/gxClPN4=;
        b=E+VUoUxargCd7VjX2QSXhiizfnqIZESGaXvdr0jm31stFeSS+eYL5zUCq1kPGfX2QX
         k7CmI0xLOHbrNY57M4HsOAZ66mbzvN+yIQuCkYrwzng7SFlq7oJA/7X6ey2ZZTqR+Dk6
         vryay2HF2ijOmDvl+5QyNCjNTKDHoyqWNFlPhEIV0+PR8SPkdOywAJ6U1Iu+ta6gOaIt
         mC8P+2luxZiSuiqcS/vGCfvVcwrj5+K4v2Kstf3Wo4o2cXpNVsRQGLUs1QDypSP1qF8Y
         IJ4IjRyivD6qh5qGt2853jTzXt5gqhsGDA130A7HYPTM9BOfe0um4uqmu69cJIA9gVIQ
         z4Fw==
X-Gm-Message-State: AOJu0YxskhULrf/e7D/unMvQf/xeiM+gVu9bYIP+hMgANyziA9ZHy4vx
	P9/5BUKaNHWFEpFXLNHk+FavYZRdMKzACZJn84UHb9+7t4z/KpJLAYTrwN+PUE/QdTivnQIshKt
	1zmV/ZNMNcz3z4zHpYZm2Jnw3DW8=
X-Google-Smtp-Source: AGHT+IHQ4bIHrurw3bkUMHT72t0sCusap3lOLwkPVs382DY5/yMxMjhqTuIQKUExqHoqHxYGvVzAL6Soe0llIQ4cbvw=
X-Received: by 2002:a05:690c:4687:b0:64b:7e17:b339 with SMTP id
 00721157ae682-69bf7dfdd4emr19075487b3.15.1723124409360; Thu, 08 Aug 2024
 06:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240808094358.1236-1-debrabander@gmail.com>
In-Reply-To: <20240808094358.1236-1-debrabander@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 8 Aug 2024 06:39:58 -0700
Message-ID: <CANx9H-Cgi1664d=5cK5mYAn=piyJGPeWJOFdyRf4zsyxp-wN4g@mail.gmail.com>
Subject: Re: [oe] [meta-python][master][PATCH] python3-pydantic-core: add
 missing RDEPENDS for ptest
To: debrabander@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000052e97b061f2c2ae9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 13:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111662

--00000000000052e97b061f2c2ae9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm in the middle of an upgrade to python3-pydantic and
python3-pydantic-core. I'd prefer we hold of on this one so I can keep my
tree clean and get this out the door.

On Thu, Aug 8, 2024 at 2:44=E2=80=AFAM Frank de Brabander via lists.openemb=
edded.org
<debrabander=3Dgmail.com@lists.openembedded.org> wrote:

> ---
>  .../recipes-devtools/python/python3-pydantic-core_2.18.4.bb     | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.18.4.bb b/meta-python/recipes-devtools/python/
> python3-pydantic-core_2.18.4.bb
> index 0ab1873a0..37a4440ca 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.18.4.bb
> @@ -37,6 +37,8 @@ RDEPENDS:${PN}-ptest +=3D "\
>      python3-pytest-timeout \
>      python3-pytest-benchmark \
>      python3-unittest-automake-output \
> +    python3-zoneinfo \
> +    tzdata \
>  "
>
>  do_install_ptest() {
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111649):
> https://lists.openembedded.org/g/openembedded-devel/message/111649
> Mute This Topic: https://lists.openembedded.org/mt/107786709/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000052e97b061f2c2ae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m in the middle of an upgrade to python3-pydantic an=
d python3-pydantic-core. I&#39;d prefer we hold of on this one so I can kee=
p my tree clean and get this out the door.</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 2:44=E2=80=
=AFAM Frank de Brabander via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;debrabander=3D<a href=3D"mailto:gmail.com@lists.=
openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pydantic-core_2=
.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-core_2.18.4=
.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydan=
tic-core_2.18.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pydantic-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pydantic-core_2.18.4.bb</a><br>
index 0ab1873a0..37a4440ca 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.18.4.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-cor=
e_2.18.4.bb</a><br>
@@ -37,6 +37,8 @@ RDEPENDS:${PN}-ptest +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-timeout \<br>
=C2=A0 =C2=A0 =C2=A0python3-pytest-benchmark \<br>
=C2=A0 =C2=A0 =C2=A0python3-unittest-automake-output \<br>
+=C2=A0 =C2=A0 python3-zoneinfo \<br>
+=C2=A0 =C2=A0 tzdata \<br>
=C2=A0&quot;<br>
<br>
=C2=A0do_install_ptest() {<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111649): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111649" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111649</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107786709/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107786709/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000052e97b061f2c2ae9--

