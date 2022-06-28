Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BECBC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 22:12:00 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.4473.1656454310815823109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jun 2022 15:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gDewuCCo;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id s10so16561084ljh.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jun 2022 15:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OMX3Z67wXFCsyxbGYPMh7RiloTTW1O1Uyikr2VqcdmQ=;
        b=gDewuCCo2OgxJ6R9IESAl/98Epp8O49sPKCMUoLRgTxcA+kcTBjr/eU1s9UZhJP1p0
         yaLGEAbQR6UVPH+jXAPQMx0EjTUprCoZMPqPSIsn4KzQz4KDk7p3JF7F2aDcGWamUz1L
         T7Pj9rHwQjn0/lqaEKHG27ABZcfBJec/prNFwWCajFnxZvhCFGGXj/1x0EiqXtlVwM53
         iTSTvfqgBYBRFy5JAEgRe3JqLsHpch1ei2nnUoyGNtNp+Uvdkpi9Xbj8XMdT0TVRnOLG
         /ZZ7d/BCJBIkEHSBVAldHVptlWi55BEF8HVRpiYF7rb+lp0Dd1zp9GftLFDGh7DR21/Z
         4tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OMX3Z67wXFCsyxbGYPMh7RiloTTW1O1Uyikr2VqcdmQ=;
        b=C9JP0oO/GHkzxCTEUGv6Vs7mXA7QW40WTMg9zCXqd7vHRQ7zXMC21zvRi/PECJU62Q
         Ramlz0SWVd8pKzFaS22lthwaFz0HCmjM3F9p0trVkIOREUpewZ7x65UgRSFsBes7fmUB
         FA22Wy/IcyGivwbkjRRh6EdyNuSlOAXvssdACdgzBpFflfh6sa8nS8ZKj7zCSnSMlap7
         t8OGQKa3FDomK7t33AedS2BNkIJPhHuYoYVNHjq8pTq6WZv9Mq/0aYGbeYYUD9Mr/keA
         8bYzsvc/Ph4QZ7QAw3L9sr6RaXXgUEW/dFU1HeEODMOZPlOitrKOTn9yvGII7k5lqHqn
         zgYg==
X-Gm-Message-State: AJIora+PMYRSPbLcBhcESL7zszoKM8O/LeKDZC0HucJ96HrzFaduAcY6
	cKqyYdYdUBEV3p338IkZKjYSI15xWM9kLLszrH4=
X-Google-Smtp-Source: 
 AGRyM1uaXQ1RM4DX3AQiffj/Ylz5R/9zxJIy+CPyfyp0AQp8ZeKJWeeDhPP3VdY8G/vZpbxFrU5F+/wOXl+Jq+1x4Fk=
X-Received: by 2002:a2e:8910:0:b0:25a:7eda:e4df with SMTP id
 d16-20020a2e8910000000b0025a7edae4dfmr37347lji.316.1656454308893; Tue, 28 Jun
 2022 15:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220628204736.2743017-1-noah.t.brewer@gmail.com>
In-Reply-To: <20220628204736.2743017-1-noah.t.brewer@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 28 Jun 2022 23:11:37 +0100
Message-ID: 
 <CANPvuRnyKEoiAKouQQq7_J4mAsBpQD5c0wqdnEuMdxf20bwf=g@mail.gmail.com>
Subject: Re: [oe] [PATCH] libpwquality: Add option to disable python bindings
To: Noah Brewer <noah.t.brewer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ab185605e28952ad"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jun 2022 22:12:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97610

--000000000000ab185605e28952ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Noah,

Noah Brewer <noah.t.brewer@gmail.com> escreveu no dia ter=C3=A7a, 28/06/202=
2
=C3=A0(s) 21:48:

> From: Noah Brewer <noah.t.brewer@gmail.com>
>
> Remove python3-core from RDEPENDS when the appropriate PACKAGECONFIG
> is set using the remove operator. Use bbappend file to set PACKAGECONFIG
> to disable python bindings and to remove python3-core from RDEPENDS.
>
> Signed-off-by: Noah Brewer <noah.t.brewer@gmail.com>
> ---
>  meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
> b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
> index f892cc650..ea3787792 100644
> --- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
> +++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
> @@ -32,9 +32,11 @@ EXTRA_OECONF +=3D
> "--with-python-rev=3D${PYTHON_BASEVERSION} \
>                   --libdir=3D${libdir} \
>  "
>
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
',
> '', d)}"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam=
',
> '', d)} python-bindings"
> +PACKAGECONFIG[python-bindings] =3D "--enable-python-bindings=3Dyes,
> --enable-python-bindings=3Dno"
>  PACKAGECONFIG[pam] =3D "--enable-pam, --disable-pam, libpam"
>
> +RDEPENDS:${PN}:remove =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'python-bindings', '', '${PYTHON_PN}-core', d)}"
>

We can't override the remove operator so if you use remove no one can undo
that.
Please use inverted logic with RDEPENDS:${PN}:append so it is possible to
use remove if needed in bbappend.

Anyway we can add RDEPENDS with the PACKAGECONFIG (it is the argument
number 4)
https://docs.yoctoproject.org/ref-manual/variables.html?highlight=3Dpackage=
config#term-PACKAGECONFIG

+PACKAGECONFIG[python-bindings] =3D "--enable-python-bindings=3Dyes,
--enable-python-bindings=3Dno,,python3-core"

Jose

 FILES:${PN} +=3D "${libdir}/security/pam_pwquality.so"
>  FILES:${PN}-dbg +=3D "${libdir}/security/.debug"
>  FILES:${PN}-staticdev +=3D "${libdir}/security/pam_pwquality.a"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97609):
> https://lists.openembedded.org/g/openembedded-devel/message/97609
> Mute This Topic: https://lists.openembedded.org/mt/92052665/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ab185605e28952ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Noah,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Noah Brewer &lt;<a href=3D"mailto:noah.t.brew=
er@gmail.com">noah.t.brewer@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 2=
8/06/2022 =C3=A0(s) 21:48:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Noah Brewer &lt;<a href=3D"mailto:noah.t.brewer@gmail.com"=
 target=3D"_blank">noah.t.brewer@gmail.com</a>&gt;<br>
<br>
Remove python3-core from RDEPENDS when the appropriate PACKAGECONFIG<br>
is set using the remove operator. Use bbappend file to set PACKAGECONFIG<br=
>
to disable python bindings and to remove python3-core from RDEPENDS.<br>
<br>
Signed-off-by: Noah Brewer &lt;<a href=3D"mailto:noah.t.brewer@gmail.com" t=
arget=3D"_blank">noah.t.brewer@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/libpwquality/<a href=3D"http://libpwquality_=
1.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libpwquality_1.4.4.bb</a> | =
4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-extended/libpwquality/<a href=3D"http://libpwq=
uality_1.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libpwquality_1.4.4.bb=
</a> b/meta-oe/recipes-extended/libpwquality/<a href=3D"http://libpwquality=
_1.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libpwquality_1.4.4.bb</a><b=
r>
index f892cc650..ea3787792 100644<br>
--- a/meta-oe/recipes-extended/libpwquality/<a href=3D"http://libpwquality_=
1.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libpwquality_1.4.4.bb</a><br=
>
+++ b/meta-oe/recipes-extended/libpwquality/<a href=3D"http://libpwquality_=
1.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libpwquality_1.4.4.bb</a><br=
>
@@ -32,9 +32,11 @@ EXTRA_OECONF +=3D &quot;--with-python-rev=3D${PYTHON_BAS=
EVERSION} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libdir=3D$=
{libdir} \<br>
=C2=A0&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;pam&#39;, &#39;pam&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;pam&#39;, &#39;pam&#39;, &#39;&#39;, d)} python-bindings&quot;<br>
+PACKAGECONFIG[python-bindings] =3D &quot;--enable-python-bindings=3Dyes, -=
-enable-python-bindings=3Dno&quot;<br>
=C2=A0PACKAGECONFIG[pam] =3D &quot;--enable-pam, --disable-pam, libpam&quot=
;<br>
<br>
+RDEPENDS:${PN}:remove =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#3=
9;, &#39;python-bindings&#39;, &#39;&#39;, &#39;${PYTHON_PN}-core&#39;, d)}=
&quot;<br></blockquote><div><br></div><div>We can&#39;t override=C2=A0the r=
emove operator so if you use remove no one can undo that.</div><div>Please =
use inverted logic with RDEPENDS:${<span class=3D"" id=3D":wa0.10" tabindex=
=3D"-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D"">PN</span>}:appe=
nd so it is possible to use remove if needed in <span class=3D"" id=3D":wa0=
.11" tabindex=3D"-1" role=3D"menuitem" aria-haspopup=3D"true" style=3D"">bb=
append</span>.</div><div><br></div><div>Anyway we can add=C2=A0RDEPENDS wit=
h the PACKAGECONFIG (it is the argument number 4)</div><div><a href=3D"http=
s://docs.yoctoproject.org/ref-manual/variables.html?highlight=3Dpackageconf=
ig#term-PACKAGECONFIG">https://docs.yoctoproject.org/ref-manual/variables.h=
tml?highlight=3Dpackageconfig#term-PACKAGECONFIG</a><br></div><div><br></di=
v><div>+PACKAGECONFIG[python-bindings] =3D &quot;--enable-python-bindings=
=3Dyes, --enable-python-bindings=3Dno,,python3-core&quot;<br></div><div><br=
></div><div><span class=3D"" id=3D":wa0.12" tabindex=3D"-1" role=3D"menuite=
m" aria-haspopup=3D"true" style=3D"">Jose</span></div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
=C2=A0FILES:${PN} +=3D &quot;${libdir}/security/pam_pwquality.so&quot;<br>
=C2=A0FILES:${PN}-dbg +=3D &quot;${libdir}/security/.debug&quot;<br>
=C2=A0FILES:${PN}-staticdev +=3D &quot;${libdir}/security/pam_pwquality.a&q=
uot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97609): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97609" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97609</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92052665/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92052665/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000ab185605e28952ad--

