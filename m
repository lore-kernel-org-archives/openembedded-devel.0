Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BCBC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 16:39:27 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.10239.1641919166427156039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a616TI3B;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id kc16so19003001qvb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G8Cj6i0eN9eSzpNJ+ZGZ6D6TlCnxlON5Sn8faNLBX0g=;
        b=a616TI3BtmiWfWVuYU1pxul+gLTPf1BGJTisY9vUB2VVjZJgvygLiiI5I2V4+PM6go
         0sT2lCQDHtY+Mud43edqCJNMFArg11kbg6GJLlZhCSa+b10qzztGQYAoJQQ/H1pzk0U9
         ROvmfuBtxTB0klg7nIiMHqNKeQ4JK1M9PGMqeh58xRuVVxjpkv5Dz/mk6VmOqtKthsti
         TyVf4D/2/Qsg2oS348/0GjZULb42nDA8AKvVlo7ILNru4hGrpx3hSrWu+qsRwhHi6RRT
         Ck3JAYEvcuuP90lnc2+KaWGdTcgdPaZDEmnppENYyXgVmd6tsINjMJ2Mc+O05taTnGaN
         AHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G8Cj6i0eN9eSzpNJ+ZGZ6D6TlCnxlON5Sn8faNLBX0g=;
        b=kcHu8oIjg0K31W2V4tt7D+h13tbc1PYUE/U8nMP2p2oMxefc+DGD9hNWmYikbU6xrq
         E+DPR0A7kf+5MV51RfQkeRgmFWFaeojykXH4qYLiBbihS2cx0n8Uneqs8GMbfj9zdZBL
         LaOETXEonryh4drUs9isxF0muDa+M1ejkMBIV8Q7oKqn+1j5FZx8RgSxaSDo2ZGpgEYh
         zy3JkMCnU5ig/JI1uXXkKBG1vx21uYWVH4QqJkMn9IbSI1z2EGwIzRaYcDNy2JbEtfx5
         ytx6d8lDPehQ57/qe2/pzxRZZnqffMriTZtdTVG1guooZ/24WygDu2i+o51qThOMj+FW
         SZLQ==
X-Gm-Message-State: AOAM532sgs+UJg3tDbdW3YGF4gp1i1ic6r4WvILFl9f98XwLi80Rd1kk
	kfWaQWqwKb84Lu7VI0OQL5J1mS8kEUOsamj6jEY=
X-Google-Smtp-Source: 
 ABdhPJzmeS1XITzT/XltU30uW5C/gBHjCUSy5IgTLHyuY6VihiOZGa1sin+ZJNcZZNPCkKBsE/mxxnuVRul0YWPhXOQ=
X-Received: by 2002:a05:6214:21e3:: with SMTP id
 p3mr4606919qvj.63.1641919165514;
 Tue, 11 Jan 2022 08:39:25 -0800 (PST)
MIME-Version: 1.0
References: 
 <c8e43ea446a08e64fa028a1b74bb6f529a5d3cfe.camel@lists.verisure.com>
In-Reply-To: 
 <c8e43ea446a08e64fa028a1b74bb6f529a5d3cfe.camel@lists.verisure.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jan 2022 08:39:14 -0800
Message-ID: 
 <CAMKF1spWmhaEmVFcJzzGbONTL0HR4Ghh84pm2ZzkXMaTZBfNcQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] c-ares: Bump PV to 1.16.1
To: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernst.sjostrand@lists.verisure.com>
Cc: "akuster808@gmail.com" <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009c45eb05d5511816"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 16:39:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94751

--0000000000009c45eb05d5511816
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 4:54 AM Ernst Sj=C3=B6strand <
ernst.sjostrand@lists.verisure.com> wrote:

> Signed-off-by: Ernst Sj=C3=B6strand <ernst.sjostrand@verisure.com>
> ---
>  meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
> b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
> index b77604797..692a5f0d6 100644
> --- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
> +++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
> @@ -5,7 +5,7 @@ SECTION =3D "libs"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.md;md5=3Dfb997454c8d62aa6a47f07a8cd48b006"
>
> -PV =3D "1.16.0+gitr${SRCPV}"
> +PV =3D "1.16.1+gitr${SRCPV}"


If it is release tag which is being used for srcrev then drop the part
after +

>
>
>  SRC_URI =3D "\
>      git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps \
> --
> 2.34.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94744):
> https://lists.openembedded.org/g/openembedded-devel/message/94744
> Mute This Topic: https://lists.openembedded.org/mt/88347585/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009c45eb05d5511816
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 11, 2022 at 4:54 AM Ernst Sj=C3=B6strand &lt;<a=
 href=3D"mailto:ernst.sjostrand@lists.verisure.com">ernst.sjostrand@lists.v=
erisure.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-o=
ff-by: Ernst Sj=C3=B6strand &lt;<a href=3D"mailto:ernst.sjostrand@verisure.=
com" target=3D"_blank">ernst.sjostrand@verisure.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/c-ares/<a href=3D"http://c-ares_1.16.1.bb" re=
l=3D"noreferrer" target=3D"_blank">c-ares_1.16.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/c-ares/<a href=3D"http://c-ares_1.16.1=
.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.16.1.bb</a> b/meta-oe/re=
cipes-support/c-ares/<a href=3D"http://c-ares_1.16.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">c-ares_1.16.1.bb</a><br>
index b77604797..692a5f0d6 100644<br>
--- a/meta-oe/recipes-support/c-ares/<a href=3D"http://c-ares_1.16.1.bb" re=
l=3D"noreferrer" target=3D"_blank">c-ares_1.16.1.bb</a><br>
+++ b/meta-oe/recipes-support/c-ares/<a href=3D"http://c-ares_1.16.1.bb" re=
l=3D"noreferrer" target=3D"_blank">c-ares_1.16.1.bb</a><br>
@@ -5,7 +5,7 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3Dfb997454c8d62aa6a4=
7f07a8cd48b006&quot;<br>
<br>
-PV =3D &quot;1.16.0+gitr${SRCPV}&quot;<br>
+PV =3D &quot;1.16.1+gitr${SRCPV}&quot;</blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto">If it is release tag which is being used for srcrev =
then drop the part after +</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"=
><br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/c-ares/c-ares.git;br=
anch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.c=
om/c-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps</a> \<br>
-- <br>
2.34.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94744): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94744" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94744</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88347585/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88347585/1997914</a><br>
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

--0000000000009c45eb05d5511816--

