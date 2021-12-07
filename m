Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ED5C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 12:35:45 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.66162.1638880544471304586
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 04:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hs0znL8o;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id x7so10235580pjn.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 04:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p747mSIQIITjgJqgxoFL8yL7y06ZJDCc94MiM5gcKtg=;
        b=Hs0znL8oBs/K/JvMJG6OozLsw0NmPZ4LS10MRr2sKtIntv3sNIJ4HJAh4v2FOVQrPQ
         I3nLQlZEsSEH/4NImd+Yrs/SKNPTPLzN+SjkWQjvKGwiR3XFDaViDJ4QoVjo+RZlh7Wt
         z0gmRkAAig4DStlnTx89wqcCImP8uS5qhT00l3SLS869OfazoMUtvWyHXOdo4WWXxNSK
         IRPpbNR+5J5vxeU/drFbLVyW97WzXiwZHr71G56d1Nd3iZaSjrQRK3Z+2aEWProf5jJ3
         ftgGpfTHn66KDrkdGPHhaDIKRZi2qrQi7BcKUrDwNL359sSa6maZRU8pWLuHSVWKtxVV
         ECvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p747mSIQIITjgJqgxoFL8yL7y06ZJDCc94MiM5gcKtg=;
        b=DDLC9KmzmPF+d+UkeGiYyixadUyGwBWLBkHvm+dkWb0x8VzoJjZLKprIra7d/05+wy
         6n/Z5JAdDwo8rmXBVE4mET4RRGPQ+Jq5VbVE3jUzlpsdX7wHzhuWZGj8OcAWJglnEJLm
         REYtj0BiStjgTgLMpujapHhcVZKFFfNaDbA6EnL3lUEquUuyGecRInd1Wg618i3oZPXJ
         odAn2BHFwrrsfguNRvUJWAZ1GN7i3j4Ui/vg+Lxk7oiUyZSqlorg0ToM1xUu2eTt1Mbg
         y17ijMfwb/3qURqmjl7vsJROAH45mIRggirMrILYlKb/q9oJ1rYYnjihmuh5TGe0Cyvm
         mvLg==
X-Gm-Message-State: AOAM532VJvHNv3g+EgdhKkdoJNNr36IS58IZ1xrLW3Pr6WCqcPLtporE
	59ZXV+HOgDzDwAP8YKA3vbH+LxeKAKBOYVZX5Zg=
X-Google-Smtp-Source: 
 ABdhPJwSzjCuvUATqeEmYdwV8atigxYWem6GVR0FGXAD3b2rvfeSBau6095rtX4L3rSgMKGNIDH0HhW8i3kDfHidA2U=
X-Received: by 2002:a17:902:e852:b0:143:8152:26c7 with SMTP id
 t18-20020a170902e85200b00143815226c7mr51410690plg.75.1638880543838; Tue, 07
 Dec 2021 04:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20211207113954.8959-1-marex@denx.de>
In-Reply-To: <20211207113954.8959-1-marex@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 7 Dec 2021 13:35:33 +0100
Message-ID: 
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000a514a805d28d9cd9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 12:35:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94230

--000000000000a514a805d28d9cd9
Content-Type: text/plain; charset="UTF-8"

> The build system might have put something into DEPENDS already

There is only copyright notice before this chunk, so this doesn't make much
sense to me (and no other recipe does this).

On Tue, Dec 7, 2021 at 12:40 PM Marek Vasut <marex@denx.de> wrote:

> The build system might have put something into DEPENDS already,
> adhere to the recommended best practice and use DEPENDS:append
> to avoid overriding the DEPENDS set by the build system.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Kanavin <alex@linutronix.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
> b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
> index 571ba5fcb..1604838f1 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.4.1.bb
> @@ -3,7 +3,7 @@
>
>  DESCRIPTION = "FreeRDP RDP client & server library"
>  HOMEPAGE = "http://www.freerdp.com"
> -DEPENDS = "openssl alsa-lib libusb1"
> +DEPENDS:append = " openssl alsa-lib libusb1"
>  SECTION = "net"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94227):
> https://lists.openembedded.org/g/openembedded-devel/message/94227
> Mute This Topic: https://lists.openembedded.org/mt/87562882/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a514a805d28d9cd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; The build system might have put something into DEPEND=
S already<div><br></div><div>There is only copyright notice before this chu=
nk, so this doesn&#39;t make much sense to me (and no other recipe does thi=
s).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, Dec 7, 2021 at 12:40 PM Marek Vasut &lt;<a href=3D"mailto:=
marex@denx.de">marex@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">The build system might have put something into =
DEPENDS already,<br>
adhere to the recommended best practice and use DEPENDS:append<br>
to avoid overriding the DEPENDS set by the build system.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_=
blank">alex@linutronix.de</a>&gt;<br>
Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp_2.4.1.bb" r=
el=3D"noreferrer" target=3D"_blank">freerdp_2.4.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp_2.4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">freerdp_2.4.1.bb</a> b/meta-oe/r=
ecipes-support/freerdp/<a href=3D"http://freerdp_2.4.1.bb" rel=3D"noreferre=
r" target=3D"_blank">freerdp_2.4.1.bb</a><br>
index 571ba5fcb..1604838f1 100644<br>
--- a/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp_2.4.1.bb" r=
el=3D"noreferrer" target=3D"_blank">freerdp_2.4.1.bb</a><br>
+++ b/meta-oe/recipes-support/freerdp/<a href=3D"http://freerdp_2.4.1.bb" r=
el=3D"noreferrer" target=3D"_blank">freerdp_2.4.1.bb</a><br>
@@ -3,7 +3,7 @@<br>
<br>
=C2=A0DESCRIPTION =3D &quot;FreeRDP RDP client &amp; server library&quot;<b=
r>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.freerdp.com" rel=3D"noreferr=
er" target=3D"_blank">http://www.freerdp.com</a>&quot;<br>
-DEPENDS =3D &quot;openssl alsa-lib libusb1&quot;<br>
+DEPENDS:append =3D &quot; openssl alsa-lib libusb1&quot;<br>
=C2=A0SECTION =3D &quot;net&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94227): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94227" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94227</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87562882/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87562882/3617156</a><br>
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

--000000000000a514a805d28d9cd9--

