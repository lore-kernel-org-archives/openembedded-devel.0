Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4D4C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 07:01:18 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.7982.1648105277219324253
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 00:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TYkzVmxS;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id p25so2870456qkj.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 00:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xxrR4FfpbdtKCgkVPHblxhYussghLJtU2KLXFWEJC64=;
        b=TYkzVmxSXoBvfx4jkDHSlppL84qHDe0575PvKmKPp4ag4aCQDcERiXYmEazX7GILpI
         T9VYeLE5sOiEq9BX3lR3eM8cOcYVLQ17JXBg9QGWUnVq0hfkhLeK4VQ3H7O+zFiyEi9J
         AhSVYdg1avVPDmIiD5ceqCs+uzk75JHJg0GRPNK7PFPR80tFSof1gifB1hhJ6+H0WdqR
         +W6KP/0lFiNLC0lzOwUFXgDbKzuR9LQFcyLZo09bwD21UaZWr5nyPnKTik23Jyt9JWcH
         no8pzPQoigEusKhlqaIAF46eSFJFrOnJC9aciSjY6VpGZRj5vdbrS2mxzgjRwhuxY1GE
         nPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xxrR4FfpbdtKCgkVPHblxhYussghLJtU2KLXFWEJC64=;
        b=hoW6Ckx3Ou2zmyyPE/uChB/ubxwgb82CjnautMMfpRFaRx9BRMnBPqnMBtJovyW7pQ
         RSB+tDuu2iIOUyI/XyFxdmJBRheEvy0MYuiPHmEfnkgiogszriEzXWy+WOc8shcebkwd
         SPX9+8HYjaTrmpeTrdRgeU6rzVw1gyO6LNsdUWqoWw8yQwrzCfRtdAJtSUrdR77Z8jOR
         hz1vIsnJ5myVRVixgxOE2e4TeaSADgE8ibn50PaIpwQL4D+MWNabhJuMbTrWmZsRY8jP
         Vqes919ZCj9znv5dgSrmtXLsJJmizfo1iLICbD+QDIu3fRJZwWQfIqK3S7VHf9YHqV1Z
         mH2g==
X-Gm-Message-State: AOAM532LT1pEsRpwMDLoIhu71dKRTCY28QFUY9mKLbyNZk9l5EIGQDAS
	RjEnISf1uP63EBxVhYnkh0h9b4GyIxmvdVF4mV4=
X-Google-Smtp-Source: 
 ABdhPJy/CsdZCWmi6fn6WxGveCdZRuKNQNS/dFVIG8C8vxnJ6yg5HjFBYGmJBc74ryNtQBQB/WiviiJgLUAdKvrYeiw=
X-Received: by 2002:a05:620a:29ce:b0:67e:d7be:3491 with SMTP id
 s14-20020a05620a29ce00b0067ed7be3491mr2338377qkp.463.1648105276283; Thu, 24
 Mar 2022 00:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220324065811.2785011-1-dominik.peklo@rode.com>
In-Reply-To: <20220324065811.2785011-1-dominik.peklo@rode.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Mar 2022 00:01:05 -0700
Message-ID: 
 <CAMKF1spcSodm-PWYfX0WwcjSGiNFTQ7xPWESHrd-BTy2nrU-zw@mail.gmail.com>
Subject: Re: [oe] [meta-python][dunfell][PATCH] python3-fasteners: fix typo in
 RDEPENDS
To: Dominik Peklo <dominik.peklo@rode.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008ba08705daf16942"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 07:01:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96182

--0000000000008ba08705daf16942
Content-Type: text/plain; charset="UTF-8"

Colon is fine I guess you need to update bitbake to latest dunfell as well

On Wed, Mar 23, 2022 at 11:59 PM Dominik Peklo <dominik.peklo@rode.com>
wrote:

> The RDEPENDS statement contained syntax error - using colon instead
> of underscore.
>
> Signed-off-by: Dominik Peklo <dominik.peklo@rode.com>
> ---
>  meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-fasteners_0.16.3.bb b/meta-python/recipes-devtools/python/
> python3-fasteners_0.16.3.bb
> index 1ba2c6f20..7ebaa4590 100644
> --- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =
> "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
>
>  inherit pypi setuptools3
>
> -RDEPENDS:${PN} += "\
> +RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-logging \
>      ${PYTHON_PN}-fcntl \
>  "
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96181):
> https://lists.openembedded.org/g/openembedded-devel/message/96181
> Mute This Topic: https://lists.openembedded.org/mt/89994245/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008ba08705daf16942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Colon is fine I guess you need to update bitbake to lates=
t dunfell as well=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 23, 2022 at 11:59 PM Dominik Pekl=
o &lt;<a href=3D"mailto:dominik.peklo@rode.com">dominik.peklo@rode.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">The RDEPENDS statement contained synta=
x error - using colon instead<br>
of underscore.<br>
<br>
Signed-off-by: Dominik Peklo &lt;<a href=3D"mailto:dominik.peklo@rode.com" =
target=3D"_blank">dominik.peklo@rode.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-fastene=
rs_0.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fasteners_0.16.3=
.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
fasteners_0.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fasteners=
_0.16.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-fasteners_0.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-faste=
ners_0.16.3.bb</a><br>
index 1ba2c6f20..7ebaa4590 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-fastene=
rs_0.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fasteners_0.16.3=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-fastene=
rs_0.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-fasteners_0.16.3=
.bb</a><br>
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D &quot;b1ab4e5adfbc28681ce44b3024421c=
4f567e705cc3963c732bf1cba334<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-RDEPENDS:${PN} +=3D &quot;\<br>
+RDEPENDS_${PN} +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-logging \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-fcntl \<br>
=C2=A0&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96181): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96181" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/96181</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89994245/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89994245/1997914</a><br>
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

--0000000000008ba08705daf16942--

