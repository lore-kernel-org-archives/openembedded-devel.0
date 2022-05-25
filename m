Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48E0C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:04:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.10212.1653501860859832362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 11:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dQf3F/HB;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so3822732wmz.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 11:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iRBqCEmkMH9+ReasrkfEb/088fGxwCWeZBgmcKdfKL8=;
        b=dQf3F/HBUzbyKnQTw/YzyzBZHFonPEXvnSSe0heTr/mZrcbqrbEY/8nXObIBYofLyV
         SI0N782Cp3uV5g+hhTcLg/QQA6lDP/B10FVyvApZKFSjCqKUSqf6c18cLzuZVd6W6hVL
         jQ0oOUisVFpcEUXC9FMsqRHuydU06vWVxO8cxXX7JtyiiLuFX1zDc+rHOtlBu0WyEufe
         S1R/m3dlMstcKojAcAdtAbtI8GleZHEUEqkT6u3Lu1DJhMcEQgC9YWFeUEMb7RapR8Ro
         djhYwOhkpIfkI6GHQRORWxbTWt5mkOI1yWm/vGUhSGoTzuPbtso6ZkAqyyB3DY6mqXCz
         ypiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRBqCEmkMH9+ReasrkfEb/088fGxwCWeZBgmcKdfKL8=;
        b=vF4dpIVUbVhopKKBpSng8EY8vOZnDv9HUwpDFSt0yIc2jwWfe5mqQD2EdH8f5x4aDZ
         PIqIiGOUoPqvsW3G+WnOGOBhO53zbRA51bBKqQ6J+BybBRZanaK5xEmXcXVo3ttmO3NX
         y+nv2yUsPHxEzAMKvfZzUAfQoJicYR3QD/QaO7cCZTurKt5y71TlhAFSMsqCFhirzxtm
         38WGiU9YHNA27cKK5LLbAzV261ARvTfZVgtFNZa3IWjwleNNmODT8wn4PNRMPQjX+8H0
         gCbuOLME+o+N8girDuBMeYikgvqggM9DzDlSuq3h0gHQfMNay3dpASH6WTrB58qpdBmK
         CNUQ==
X-Gm-Message-State: AOAM533q1vzORYEyVFBrvHfg+r4f/UTnMiGRqPsmqHgmhqs1PZ02J8TJ
	SQTzNEgIiWps1h65kmop1QWFwQYiAVa2DMFBsbA=
X-Google-Smtp-Source: 
 ABdhPJxvjiqroioEu0ki6e7hRCbe6J/r17rLvgzxZS9IpI5pJhTxxDZj/ChLyeYzEKHGUciAgQGfv9kUVyR/hygEBmw=
X-Received: by 2002:a7b:ce04:0:b0:394:1f46:213 with SMTP id
 m4-20020a7bce04000000b003941f460213mr9001775wmc.157.1653501859284; Wed, 25
 May 2022 11:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220512234307.1189721-1-denis@denix.org>
 <20220512234307.1189721-3-denis@denix.org>
In-Reply-To: <20220512234307.1189721-3-denis@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 May 2022 20:03:58 +0200
Message-ID: 
 <CA+chaQfKJDOyRQ=Y3GwK5X_XVrSdNoNe5VpBLMdyncooMeHOPA@mail.gmail.com>
Subject: Re: [oe] [kirkstone][PATCH 3/3] devmem2: update SRC_URI according to
 redirect
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f54bfc05dfd9e6b3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 May 2022 18:04:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97270

--000000000000f54bfc05dfd9e6b3
Content-Type: text/plain; charset="UTF-8"

Anyone willing to create a repo for this on github instead of patching this
in metadata?

This is another reproducer for do_patch issue described here
https://lists.yoctoproject.org/g/yocto/message/56602

On Fri, May 13, 2022 at 1:43 AM Denys Dmytriyenko <denis@denix.org> wrote:

> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> http://www.free-electrons.com now redirects to https://bootlin.com
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  meta-oe/recipes-support/devmem2/devmem2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
> b/meta-oe/recipes-support/devmem2/devmem2.bb
> index ba7aad8ab..70d413521 100644
> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> @@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =
> "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
>  PR = "r7"
>
> -SRC_URI = "
> http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c
> \
> +SRC_URI = "
> https://bootlin.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
>
> file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
>
> file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97085):
> https://lists.openembedded.org/g/openembedded-devel/message/97085
> Mute This Topic: https://lists.openembedded.org/mt/91070560/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f54bfc05dfd9e6b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Anyone willing to create a repo for this on github instead=
 of patching this in metadata?<div><br></div><div>This is another reproduce=
r for do_patch issue described here=C2=A0<a href=3D"https://lists.yoctoproj=
ect.org/g/yocto/message/56602">https://lists.yoctoproject.org/g/yocto/messa=
ge/56602</a></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, May 13, 2022 at 1:43 AM Denys Dmytriyenko &lt;<a =
href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Michael Opdenacker &lt=
;<a href=3D"mailto:michael.opdenacker@bootlin.com" target=3D"_blank">michae=
l.opdenacker@bootlin.com</a>&gt;<br>
<br>
<a href=3D"http://www.free-electrons.com" rel=3D"noreferrer" target=3D"_bla=
nk">http://www.free-electrons.com</a> now redirects to <a href=3D"https://b=
ootlin.com" rel=3D"noreferrer" target=3D"_blank">https://bootlin.com</a><br=
>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" tar=
get=3D"_blank">denis@denix.org</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/devmem2/<a href=3D"http://devmem2.bb" rel=3D"=
noreferrer" target=3D"_blank">devmem2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/devmem2/<a href=3D"http://devmem2.bb" =
rel=3D"noreferrer" target=3D"_blank">devmem2.bb</a> b/meta-oe/recipes-suppo=
rt/devmem2/<a href=3D"http://devmem2.bb" rel=3D"noreferrer" target=3D"_blan=
k">devmem2.bb</a><br>
index ba7aad8ab..70d413521 100644<br>
--- a/meta-oe/recipes-support/devmem2/<a href=3D"http://devmem2.bb" rel=3D"=
noreferrer" target=3D"_blank">devmem2.bb</a><br>
+++ b/meta-oe/recipes-support/devmem2/<a href=3D"http://devmem2.bb" rel=3D"=
noreferrer" target=3D"_blank">devmem2.bb</a><br>
@@ -3,7 +3,7 @@ LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://devmem2.c;endline=3D38;md5=3Da9eb9f=
3890384519f435aedf986297cf&quot;<br>
=C2=A0PR =3D &quot;r7&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.free-electrons.com/pub/mirror/devm=
em2.c;downloadfilename=3Ddevmem2-new.c" rel=3D"noreferrer" target=3D"_blank=
">http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=3Ddev=
mem2-new.c</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://bootlin.com/pub/mirror/devmem2.c;down=
loadfilename=3Ddevmem2-new.c" rel=3D"noreferrer" target=3D"_blank">https://=
bootlin.com/pub/mirror/devmem2.c;downloadfilename=3Ddevmem2-new.c</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://devmem2-fixups-2.patch;app=
ly=3Dyes;striplevel=3D0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-devmem.c-ensure-word-=
is-32-bit-and-add-support-for-6.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-devmem2-support-diffe=
rent-page-sizes-at-run-time.patch \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97085): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97085" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97085</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91070560/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91070560/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f54bfc05dfd9e6b3--

