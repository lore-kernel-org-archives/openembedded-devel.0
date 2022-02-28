Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1B7C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 16:03:47 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.21858.1646064226094630168
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FH3wAjL+;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id s14so18330820edw.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 08:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OfHrjCJhUrF1bvEMI+q3e+zWuwaoBGdTeJHHGOu8r74=;
        b=FH3wAjL+xpORmkEWHM5pEskaBGmzyrj8oY3WsGsZ2jWtmRNzQDtJBHVPEJ9RP//UpU
         +pBsEyB5F/IucPR8qU7hqx2FKLZZauNdGAtXcrnIx2Wj5+QP0JtzK/iftq3vn8gC7w+i
         neNOk0+GjGzerHHaUsBrWSoMbrhOc6yxcXi06AA0N47pKPIkOZcNPrITU4kN90vQFgTf
         lOWxsotEpvDk1He2IjgmorFyGTImAPA2G2Vh2+ophocrn3tOqrzsVSSOASa6DhC35qxG
         BVjty+nXw0KXemufzrbbkMcHZZpyHnU3BXIuB/sCc05amz4LyKF53T0b3xWO1EKK815l
         bYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OfHrjCJhUrF1bvEMI+q3e+zWuwaoBGdTeJHHGOu8r74=;
        b=3fQmrHSu0BjS1WIXQohSfHteaQsnxzndKZeYbAXh9d4DIu//U5wwh760eB+iyMKzUn
         nmOKjC8Q8+1k8Fc4wigesQEDaroqeBfdQpE4SUI55MrFLIjIiWyArdKjv6kpFPkID23B
         Ok+Q/4GnY8oQzV5mUQ1ca4PlC7c3gYV9qLYChwkzMXs3dJrRu+lMOJcVlNLJrYxKLX/n
         oyoLCtzS307akcLDTmwPwlNrpu3PqVv8Iabot/d3IbCiGn9eTPFrN3OpKE5nEXil3bC5
         27akXh5XFApgSS4HiuqSjp8h7M1TMnyS/3osQMv+4J7nV9ZmdcG4PlJQh83SnNPH8+yW
         EGLQ==
X-Gm-Message-State: AOAM531gJmAHZ0x/RNzgWA6tbT0rU6TIuySgK9qMzUH+LFA2oy0qhICb
	hhK0tq7+pIs59ORjejJnSL/fc8Bi30lnZ4W+G4M=
X-Google-Smtp-Source: 
 ABdhPJzmT5EclB5BM6g7i6nyKqz8P4gBFNbwWyglncuN2DTJJ7fgFu1Xd9eN/tyGSLEQxwVFCy/9YsgLTySgVEJk+0I=
X-Received: by 2002:a05:6402:4c6:b0:410:b8e5:334 with SMTP id
 n6-20020a05640204c600b00410b8e50334mr20003388edw.321.1646064224450; Mon, 28
 Feb 2022 08:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20220228155234.1053650-1-troth@openavr.org>
In-Reply-To: <20220228155234.1053650-1-troth@openavr.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 28 Feb 2022 08:03:33 -0800
Message-ID: 
 <CANx9H-Cw0Ro7bGk=akTNAw_00ghWP-4NYi0ZJGCu1Qbb4TEBsA@mail.gmail.com>
Subject: Re: [oe] [PATCH] python3-marshmallow: fix wheel build
To: "Theodore A. Roth" <troth@openavr.org>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Content-Type: multipart/alternative; boundary="000000000000603dca05d916313e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 16:03:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95586

--000000000000603dca05d916313e
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 7:52 AM Theodore A. Roth <troth@openavr.org> wrote:

> Recipe does not inherit pypi nor would PN be a good guess at the name of
> the wheel. Set PIP_INSTALL_PACKAGE appropriately.
>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
>
Reviewed-by: TIm Orling <tim.orling@konsulko.com>

> ---
>  .../recipes-devtools/python/python3-marshmallow_3.14.1.bb       | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-marshmallow_3.14.1.bb b/meta-python/recipes-devtools/python/
> python3-marshmallow_3.14.1.bb
> index ddfe4b99c..dc5f17388 100644
> --- a/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.14.1.bb
> @@ -15,4 +15,6 @@ S = "${WORKDIR}/git"
>
>  inherit setuptools3
>
> +PIP_INSTALL_PACKAGE = "marshmallow"
> +
>  RDEPENDS:${PN} += "python3-core"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95584):
> https://lists.openembedded.org/g/openembedded-devel/message/95584
> Mute This Topic: https://lists.openembedded.org/mt/89453269/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000603dca05d916313e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 28, 2022 at 7:52 AM Theod=
ore A. Roth &lt;<a href=3D"mailto:troth@openavr.org">troth@openavr.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Recip=
e does not inherit pypi nor would PN be a good guess at the name of<br>
the wheel. Set PIP_INSTALL_PACKAGE appropriately.<br>
<br>
Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:theodore_roth@trimble=
.com" target=3D"_blank">theodore_roth@trimble.com</a>&gt;<br>
Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:troth@openavr.org" ta=
rget=3D"_blank">troth@openavr.org</a>&gt;<br></blockquote><div>Reviewed-by:=
 TIm Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@konsu=
lko.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-marshmallow_3.1=
4.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-marshmallow_3.14.1.bb<=
/a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
marshmallow_3.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-marshma=
llow_3.14.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-marshmallow_3.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-marshmallow_3.14.1.bb</a><br>
index ddfe4b99c..dc5f17388 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-marshma=
llow_3.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-marshmallow_3.=
14.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-marshma=
llow_3.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-marshmallow_3.=
14.1.bb</a><br>
@@ -15,4 +15,6 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit setuptools3<br>
<br>
+PIP_INSTALL_PACKAGE =3D &quot;marshmallow&quot;<br>
+<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;python3-core&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95584): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95584" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95584</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89453269/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89453269/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000603dca05d916313e--

