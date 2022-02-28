Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7FDC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 15:49:38 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.21156.1646063376336011275
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hwY+uI+a;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id vz16so25749760ejb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YvtK8D5phSDHWDQA5bK5/xWCNTS1bC1wgAJmiaoStiA=;
        b=hwY+uI+aw/Jbnm4hns7UHO+N7Fb5I4XNsIiDUqZFPVRZgmU/2vH8XywYhb+dXhGFhM
         /Kh3ssJdOdejuVyxPUxfoHSdCH0GVngRIXheFH2W/eGi81zObt6XQtTPTltKaKspfnFc
         k/cTzdOdtRWTtBT+lYJinJwgsIcCJ6BFlGkCeu66BPC7wgxOs0iMcy1Rjjt556NP2OTb
         JWlADKRbhb/mDS18JXnZhJhSVWQOEoK6njktjUc2Jbv8VO1/dIfF+EiXleptkmuYe7gW
         auM5Frws6uvmW7x9K29kHXPGrLyo/B78X0nERpNt9QarnTw31Z/ya09rckyj9vd66ATr
         xHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YvtK8D5phSDHWDQA5bK5/xWCNTS1bC1wgAJmiaoStiA=;
        b=aM0vRRdNvjFaUvCcWaQ2XSrGDimlHAAVxxG0eXyQx0BdEhSeC702prpRzSqqO09tk4
         J+YhiuUIAXgM6+rFpPg6USebMPKxL1q7zU6BFrLx0LBsKhxXSLLk9yt8IVUKxl8Kj+3M
         veuE9vY9V6FGZbtpm2UmcN4g3l6ShwxX86YnmhP7OaM80hrcn738PAfTksn6j0Hul9VA
         FtcNgrPx+tYipKXkmMVJsWue6qw3rIFzQksMiAo82WaDjlHw/k/tiVgN/ZeD/O49tWWu
         NwsogEazWleRqAQPh3BTeedH6DPuQbA2evnY+5NIS6YOQKoSoL+FOqqCR8Hv1A1LMB6l
         8npw==
X-Gm-Message-State: AOAM533hox8p4o/b7okNkZgEbf2gxACwPwsVGtzqr9ZMt1r/A+hTBvmA
	6NT/SamL7DrkvqTR58hll+8ad6zbvZ2A9buABFA=
X-Google-Smtp-Source: 
 ABdhPJyr1Nfx5lUT9i5OgtZHpBChKSUfuK2nbG8qwuQfc6HJqHMBeodfoVGIq5K3tPclhLTYVCHGoJuj9k4AjrdQbdw=
X-Received: by 2002:a17:906:3e4b:b0:6cf:7f02:9332 with SMTP id
 t11-20020a1709063e4b00b006cf7f029332mr15543470eji.404.1646063374676; Mon, 28
 Feb 2022 07:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20220228152231.1050011-1-troth@openavr.org>
In-Reply-To: <20220228152231.1050011-1-troth@openavr.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 28 Feb 2022 07:49:23 -0800
Message-ID: 
 <CANx9H-AZqJHFbGiY_ft4OFGPp4O1HbDQsNeu98zP2Y_LMjkK7w@mail.gmail.com>
Subject: Re: [oe] [PATCH] pyhton3-marshmallow: fix wheel build
To: "Theodore A. Roth" <troth@openavr.org>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Content-Type: multipart/alternative; boundary="000000000000b9b53405d915feb8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 15:49:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95583

--000000000000b9b53405d915feb8
Content-Type: text/plain; charset="UTF-8"

Typo in the subject line (pyhton)

On Mon, Feb 28, 2022 at 7:22 AM Theodore A. Roth <troth@openavr.org> wrote:

> Recipe does not inherit pypi nor would PN be a good guess at the name of
> the wheel. Set PIP_INSTALL_PACKAGE appropriately.
>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
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
> View/Reply Online (#95579):
> https://lists.openembedded.org/g/openembedded-devel/message/95579
> Mute This Topic: https://lists.openembedded.org/mt/89452513/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b9b53405d915feb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Typo in the subject line (pyhton)</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 28, 2022 at 7=
:22 AM Theodore A. Roth &lt;<a href=3D"mailto:troth@openavr.org">troth@open=
avr.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Recipe does not inherit pypi nor would PN be a good guess at the nam=
e of<br>
the wheel. Set PIP_INSTALL_PACKAGE appropriately.<br>
<br>
Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:theodore_roth@trimble=
.com" target=3D"_blank">theodore_roth@trimble.com</a>&gt;<br>
Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:troth@openavr.org" ta=
rget=3D"_blank">troth@openavr.org</a>&gt;<br>
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
View/Reply Online (#95579): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95579" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95579</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89452513/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89452513/924729</a><br>
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

--000000000000b9b53405d915feb8--

