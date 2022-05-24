Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023E3C433FE
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:37:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.10989.1653406640093616171
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 08:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TiXvG79q;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso1670995wma.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 08:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQJsIuIdTMV3jmN1NRLPGheX5i29L2Rb+YshL65HYbE=;
        b=TiXvG79qsC1gIqAQNuyCxnU9/l/iJXRo+aDCNp6HBe87GDuTBRC/vHXgszAbxaQ/HL
         jVhfmCd4vNyK2VYN85kb5/3zBM+1j6PEgceOtSkxeS3pPp5Ex5noy57pyNbsiTS/Dyyi
         KXYrE+TyTK7HGNek6SvKXp/yK/rUO/vnuzk8GVG5tyfPRCye0CyRht3MA/UI2Hk0s23F
         cdR+PiBdcIolemkzGRg3odJ9sEDNhmQRxAYn0y6jkFrQPMCWmj3XjEy9BGXpldwBFLlC
         r3QV59erP+252DHJbY2bh+zzYLL0SZnTGlfr5iOc35dDOggarc3UFlRqpaM0R9bgW1IN
         2u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQJsIuIdTMV3jmN1NRLPGheX5i29L2Rb+YshL65HYbE=;
        b=NTO6wSGh8BH3g14tTEstorMqthQTAfnc/h3fxXAYJ3NC6CuN7k2x2nYVAwBmB29pkz
         ODl9q3Wcba+hGz9Mo798X7IqQP37JkWdRzeGiaKCByKqr2q2KZZwRYCDXDTv4hmCz5p8
         Ta9kG7qg5ObSwDNCh3MYoaMkwxBGpCDBbbTswuqnWdG+vIZKLt22cz2UO91tkIpaIHHw
         R5dGFcIITK6VljKKezcHB3uRvaN62x2s9WVuEqk/w5MADP/Ag7LA/9xR5R8Fjde/b52H
         +kQxzwONuheTkqZaGoobvS1h5yJSwYz7HaNKfbOG3DOWryLgjoex8HWkuokxaNv6EbVp
         pswA==
X-Gm-Message-State: AOAM530CFo1Ba3jllQJ5FfhcCQC+DNW43bjQk/euzjtTanmQ+Cdryyy9
	49HTufw9kgpBCA5x2LXvgl2eufNuI7UnColUTtw=
X-Google-Smtp-Source: 
 ABdhPJwsAzSAndRiYMwz3GuYgjnWUL596oGakr8PL0NrG+l5fGq5akhTl/mAddifKMgE8jaeAeAl3c/vyB/P/7riYvY=
X-Received: by 2002:a05:600c:3553:b0:397:4d3d:9082 with SMTP id
 i19-20020a05600c355300b003974d3d9082mr4308032wmq.86.1653406638563; Tue, 24
 May 2022 08:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220524151905.309358-1-f_l_k@t-online.de>
In-Reply-To: <20220524151905.309358-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 24 May 2022 17:36:57 +0200
Message-ID: 
 <CA+chaQeTQRDtypHhZdqK8dTAFpZXEsmFebPfV4wsvdOLcVsQpg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] p8platform: unbreak do_populate_sdk
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c654005dfc3bb5a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 15:37:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97258

--0000000000005c654005dfc3bb5a
Content-Type: text/plain; charset="UTF-8"

Replace this with

RDEPENDS:${PN}-dev = ""

On Tue, May 24, 2022 at 5:19 PM Markus Volk <f_l_k@t-online.de> wrote:

> Error:
>  Problem: package libcec-dev-6.0.2-r0.corei7_64 requires p8platform-dev,
> but none of the providers can be installed
>   - conflicting requests
>   - nothing provides p8platform = 2.1.0.1-r0 needed by
> p8platform-dev-2.1.0.1-r0.corei7_64
> (try to add '--skip-broken' to skip uninstallable packages)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-extended/p8platform/p8platform_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> index 8a0699057..777c6c7ca 100644
> --- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> +++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
> @@ -17,3 +17,5 @@ inherit cmake pkgconfig
>  EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=${libdir}
> -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir}"
>
>  FILES:${PN}-dev += "${libdir}/p8-platform"
> +
> +ALLOW_EMPTY:${PN} = "1"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97251):
> https://lists.openembedded.org/g/openembedded-devel/message/97251
> Mute This Topic: https://lists.openembedded.org/mt/91313260/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005c654005dfc3bb5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Replace this with<div><br></div><div>RDEPENDS:${PN}-dev =
=3D &quot;&quot;</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, May 24, 2022 at 5:19 PM Markus Volk &lt;<a hr=
ef=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Error:<br>
=C2=A0Problem: package libcec-dev-6.0.2-r0.corei7_64 requires p8platform-de=
v, but none of the providers can be installed<br>
=C2=A0 - conflicting requests<br>
=C2=A0 - nothing provides p8platform =3D 2.1.0.1-r0 needed by p8platform-de=
v-2.1.0.1-r0.corei7_64<br>
(try to add &#39;--skip-broken&#39; to skip uninstallable packages)<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/p8platform/<a href=3D"http://p8platform_git.=
bb" rel=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-extended/p8platform/<a href=3D"http://p8platfo=
rm_git.bb" rel=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a> b/met=
a-oe/recipes-extended/p8platform/<a href=3D"http://p8platform_git.bb" rel=
=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a><br>
index 8a0699057..777c6c7ca 100644<br>
--- a/meta-oe/recipes-extended/p8platform/<a href=3D"http://p8platform_git.=
bb" rel=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a><br>
+++ b/meta-oe/recipes-extended/p8platform/<a href=3D"http://p8platform_git.=
bb" rel=3D"noreferrer" target=3D"_blank">p8platform_git.bb</a><br>
@@ -17,3 +17,5 @@ inherit cmake pkgconfig<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DCMAKE_INSTALL_LIBDIR=3D${libdir} -DCMAKE_I=
NSTALL_LIBDIR_NOARCH=3D${libdir}&quot;<br>
<br>
=C2=A0FILES:${PN}-dev +=3D &quot;${libdir}/p8-platform&quot;<br>
+<br>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97251): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97251" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97251</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91313260/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91313260/3617156</a><br>
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

--0000000000005c654005dfc3bb5a--

