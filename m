Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B0FD10C07
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 23:14:19 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.20926.1729984450026267332
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Oct 2024 16:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exm9AHNA;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so27272951fa.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 16:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729984448; x=1730589248; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zfEjrh7renX4fTPdO8XVr5sjQjCAfhiHa6y1J14xoB8=;
        b=exm9AHNAagQs2SeNRu1MB44j8RoeUnadfvQxz1kzFLG4Lhlt6WlyFFR2DPEgQ0aWEG
         f9RDH+7TnXZvW0q6axuJasRV8mY7fZ2utS5WhnwjE+fU2ZKPhzB2FMrtbr54nVHRGh4c
         lWRWk26i4OUYwJw4ds2+VITjTXvKuAseqiJ088ny7bE3tkoO0+Dt/VtZkrguQpY3NcyC
         A0zzIizmaDG/JUSGk4aLYx7eP7XEXd/UeE39mJNulF9QrZeTjFUHCqhjZUfsKlXlKmqx
         xmUMXc/oRjIHS3j/kOLICGEoaU/Tj8sSpv+jz3TRXpMLZg3SVN6stKvGeK0UhiZ9txBL
         hHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729984448; x=1730589248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfEjrh7renX4fTPdO8XVr5sjQjCAfhiHa6y1J14xoB8=;
        b=wuzRbgUdlswGDJD4AjbJucN741CiE2ujlqPQr6blvWvT97YEpVrmbWL6gsMgouZEdZ
         ePx//Bw8bK2/aNo+/F4OzmLyJkhz56ad4vlCGc8L3pKCZwPUU/rMVcquos8wzODzxDwb
         JcoFHBXo9BOvXCH5X7OTi9YClQtVGM7JuSoKiIU3VjqUcapI+TGqFpD3/FPvA7fczQbn
         29Tpp3XPIdyyRmtkx5RUIHodGmAQ7diBXo+viVyYwGQBOqD+EIAvVmrazHe4yztQyhka
         sIq0DKMxQukDPPgxZFn77X1BxhWkgCxE1XyjZWV+IBzRxJI9ke2OYKrk6fRVeskFcw2i
         qYzA==
X-Gm-Message-State: AOJu0YxpPswzyiwTOH8vzZqq5jMpE2KgopH+KMNF9LzUIb2N1qwtGzx8
	+YqbiFFswpsna8qxNmUvx0w8WuSiz7jqrag1Dplc2nm5Fqsjw6x2wuesWU31XYmzgprUT3IG21E
	7UErGZ6nOPF2pu3JnlFryl7QtcSQ=
X-Google-Smtp-Source: AGHT+IFB+oXkyJcDO9mxQlue5zYFEt33ex5xjfcHDbQ6sPMNBO2NJJK+8MCAyprCTMfWwh3sVx6aXYf4zteN8a02uzE=
X-Received: by 2002:a05:6512:687:b0:536:581c:9d9f with SMTP id
 2adb3069b0e04-53b348d6ademr1414207e87.24.1729984447311; Sat, 26 Oct 2024
 16:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241026030453.2517894-1-raj.khem@gmail.com> <20241026030453.2517894-3-raj.khem@gmail.com>
In-Reply-To: <20241026030453.2517894-3-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 26 Oct 2024 16:13:56 -0700
Message-ID: <CANx9H-AVxcPY==V5ZHZxSRzDki65DDeJT5iUnR7SwthOFs87wQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-oauth2client: Remove recipe
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000072f7fe062569643a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 23:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113238

--00000000000072f7fe062569643a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 8:05=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

> This module has been deprecated [1] since 2018 and it recommends to use
> oauth2.googleapis.com variants
>

Thank you for the cleanup Khem!

>
> [1]
> https://github.com/googleapis/oauth2client/commit/50d20532a748f18e53f7d24=
ccbe6647132c979a9#diff-06572a96a58dc510037d5efa622f9bec8519bc1beab13c9f251e=
97e657a9d4edR9
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../python3-oauth2client_4.1.3.bb             | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python3_oauth2client/
> python3-oauth2client_4.1.3.bb
>
> diff --git a/meta-python/recipes-devtools/python3_oauth2client/
> python3-oauth2client_4.1.3.bb
> b/meta-python/recipes-devtools/python3_oauth2client/
> python3-oauth2client_4.1.3.bb
> deleted file mode 100644
> index d87e289c5f..0000000000
> --- a/meta-python/recipes-devtools/python3_oauth2client/
> python3-oauth2client_4.1.3.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION =3D "OAuth 2.0 client library"
> -
> -HOMEPAGE =3D "http://github.com/google/oauth2client/"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D038e1390e94fe637991fa5569daa6=
2bc"
> -
> -inherit pypi
> -
> -SRC_URI[sha256sum] =3D
> "d486741e451287f69568a4d26d70d9acd73a2bbfa275746c535b4209891cccc6"
> -
> -RDEPENDS:${PN} +=3D " \
> -        python3-httplib2 \
> -        python3-pyasn1 \
> -        python3-pyasn1-modules \
> -        python3-rsa \
> -        python3-six \
> -        "
> -
> -inherit setuptools3
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113233):
> https://lists.openembedded.org/g/openembedded-devel/message/113233
> Mute This Topic: https://lists.openembedded.org/mt/109220002/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000072f7fe062569643a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 25, 2024 at 8:05=E2=80=AFPM Khem Raj via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;raj.khem=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">This module has been =
deprecated [1] since 2018 and it recommends to use<br>
<a href=3D"http://oauth2.googleapis.com" rel=3D"noreferrer" target=3D"_blan=
k">oauth2.googleapis.com</a> variants<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you for th=
e cleanup Khem!</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1e=
x;border-left-color:rgb(204,204,204)"><br>
[1] <a href=3D"https://github.com/googleapis/oauth2client/commit/50d20532a7=
48f18e53f7d24ccbe6647132c979a9#diff-06572a96a58dc510037d5efa622f9bec8519bc1=
beab13c9f251e97e657a9d4edR9" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/googleapis/oauth2client/commit/50d20532a748f18e53f7d24ccbe6647132=
c979a9#diff-06572a96a58dc510037d5efa622f9bec8519bc1beab13c9f251e97e657a9d4e=
dR9</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../<a href=3D"http://python3-oauth2client_4.1.3.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-oauth2client_4.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 -------------------<br>
=C2=A01 file changed, 19 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python3_oauth2client/=
<a href=3D"http://python3-oauth2client_4.1.3.bb" rel=3D"noreferrer" target=
=3D"_blank">python3-oauth2client_4.1.3.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python3_oauth2client/<a href=3D"h=
ttp://python3-oauth2client_4.1.3.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-oauth2client_4.1.3.bb</a> b/meta-python/recipes-devtools/python3_oau=
th2client/<a href=3D"http://python3-oauth2client_4.1.3.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-oauth2client_4.1.3.bb</a><br>
deleted file mode 100644<br>
index d87e289c5f..0000000000<br>
--- a/meta-python/recipes-devtools/python3_oauth2client/<a href=3D"http://p=
ython3-oauth2client_4.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
oauth2client_4.1.3.bb</a><br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-DESCRIPTION =3D &quot;OAuth 2.0 client library&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://github.com/google/oauth2client/" rel=
=3D"noreferrer" target=3D"_blank">http://github.com/google/oauth2client/</a=
>&quot;<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D038e1390e94fe637991fa5569d=
aa62bc&quot;<br>
-<br>
-inherit pypi<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;d486741e451287f69568a4d26d70d9acd73a2bbfa2757=
46c535b4209891cccc6&quot;<br>
-<br>
-RDEPENDS:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-httplib2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pyasn1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pyasn1-modules \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-rsa \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-six \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-inherit setuptools3<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#113233): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/113233" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/113233</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109220002/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/109220002/924729</a><br>
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

--00000000000072f7fe062569643a--

