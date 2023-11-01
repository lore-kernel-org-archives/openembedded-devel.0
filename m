Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93735C4167B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 02:38:46 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.48791.1698806321174868264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 19:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VyoPpo/4;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-da30fd994fdso422604276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 19:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698806320; x=1699411120; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Di9dCKc4eM+eSMMO1FusJg2P8gnd29tdmZHeElrGPPc=;
        b=VyoPpo/4AGbeUz5NBDDz6/iYDnt7GELchgBcn7OP4kkVK3zmCf6EH6vKy9h5DR4hdW
         0QVGWRg0xvAzR45wSeYiNxMVFGUaXk1VAloqJI14YaUUwyQEfxRlc6qodulxVXkPl8dB
         Rt9crTv9M3FxGTiLsTgi6d41uge1FDODZYPp9r7QeaCy6Emza6Kv7s4mXAzwMtrHeDnn
         o8HkPFRsgv6maUtSp+hR84MNxfG83hn6Hsoa51pmPFotkoMB1aQ43IPT8hjd20kUI+aI
         0gB6RPvBvTLjzMuDa44PEfcdhkkqD/SsplDZKhR/lL1mFxTdTC1vhL/q9u56WpT9JcDG
         1Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698806320; x=1699411120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Di9dCKc4eM+eSMMO1FusJg2P8gnd29tdmZHeElrGPPc=;
        b=HX7Cl1Vbii8rRbgKCKFvJm76z8sPw1JjzMRzcOGVYyINBrLT/8wi1au4Vr4Wf7/Jvo
         abhpZnCvrNNeVgJ86MpG8UaQ0FU1us7Z4QPKYshwIpAJ8/q4jnVTGvq+Sn8mRBBrKWHJ
         bgi6JDvgXCmeOFj2HVK1Gsf/enZJ5JgS37kCYmVylbZ2nhqqO4u79bytIKJno49E4cqo
         ovrczRMIqwgU3Li5yVtyk9lMwmXMVSoky3g8haFbnoAZj0x7Q4/stPNq8H17P5xoNHW+
         S0cIgeoboHn1/prFw//FoVRVRuTUAcu06JCCYRSBUTt3awJGGUZoBQUDEfCgrxFKvQrY
         jtCA==
X-Gm-Message-State: AOJu0Yz+YoKjPsscjM+RWEiHg0cXDe47AdPHtSg9RiMzRnQtSx6Tby2q
	jk2YrRlWRWCzEMf1ZSz1ApEhJDHOqni+0A6fYzDk6c8NdwI=
X-Google-Smtp-Source: AGHT+IE77zLI7//JXEYTZ/cq2FbMLRRM6+vvbN+hRBvJAfw1kKMulVDcTxw7HlDuSOkFgTHlwFU3z14OwpcuBldS/50=
X-Received: by 2002:a25:d16:0:b0:da3:6ed0:1587 with SMTP id
 22-20020a250d16000000b00da36ed01587mr1224363ybn.2.1698806320189; Tue, 31 Oct
 2023 19:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231031173554.1786139-1-arthur.oliveira@ossystems.com.br> <20231031173554.1786139-2-arthur.oliveira@ossystems.com.br>
In-Reply-To: <20231031173554.1786139-2-arthur.oliveira@ossystems.com.br>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 31 Oct 2023 19:38:29 -0700
Message-ID: <CANx9H-BuD33FPA=r+AcFQzCU4Sw70wdE27R=HHuQ9_8g9UBHRQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-flask-restx: Add
 Flask-RestX Python Recipe
To: arthur.oliveira@ossystems.com.br
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000041dc5f06090e2bea"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 02:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105810

--00000000000041dc5f06090e2bea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 10:36=E2=80=AFAM <arthur.oliveira@ossystems.com.br>=
 wrote:

> From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
>
> This commit introduces the python3-flask-restx recipe, which brings a ful=
ly
> featured framework for fast, easy, and documented API development with
> Flask.
> It is released under the BSD-3 license.
>
> Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
> ---
>  .../python/python3-flask-restx_1.2.0.bb             | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-flask-restx_1.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-restx_1.2.0.bb b/meta-python/recipes-devtools/python/
> python3-flask-restx_1.2.0.bb
> new file mode 100644
> index 000000000..6b15e2535
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "Fully featured framework for fast, easy and documented =
API
> development with Flask"
> +LICENSE =3D "BSD-3"

this is not a valid SPDX license.
You probably mean =E2=80=9CBSD-3-Clause=E2=80=9D
https://spdx.org/licenses/BSD-3-Clause.html

But you are responsible for verification.


> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc96dd911c6d9e32868b6bc667a38a=
3e2"
> +
> +SRC_URI[sha256sum] =3D
> "9a5338b108c57fbed1d24d5d53fe98442b2be7ffa2ff3291305af7a613ce6fc0"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} +=3D " \
> +    python3-isodate \
> +    python3-jsonschema \
> +    python3-pytz \
> +"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105804):
> https://lists.openembedded.org/g/openembedded-devel/message/105804
> Mute This Topic: https://lists.openembedded.org/mt/102302623/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000041dc5f06090e2bea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 31, 2023 at 10:36=E2=80=AFAM &lt;<a href=3D"mai=
lto:arthur.oliveira@ossystems.com.br">arthur.oliveira@ossystems.com.br</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">From: Arthur Oliveira &lt;<a href=3D"m=
ailto:arthur.oliveira@ossystems.com.br" target=3D"_blank">arthur.oliveira@o=
ssystems.com.br</a>&gt;<br>
<br>
This commit introduces the python3-flask-restx recipe, which brings a fully=
<br>
featured framework for fast, easy, and documented API development with Flas=
k.<br>
It is released under the BSD-3 license.<br>
<br>
Signed-off-by: Arthur Oliveira &lt;<a href=3D"mailto:arthur.oliveira@ossyst=
ems.com.br" target=3D"_blank">arthur.oliveira@ossystems.com.br</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-flask-restx_1.2.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-flask-restx_1.2.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-flask-restx_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-flask-restx_1.2.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
flask-restx_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-re=
stx_1.2.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-flask-restx_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-fl=
ask-restx_1.2.0.bb</a><br>
new file mode 100644<br>
index 000000000..6b15e2535<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-flask-r=
estx_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flask-restx_1.2=
.0.bb</a><br>
@@ -0,0 +1,13 @@<br>
+DESCRIPTION =3D &quot;Fully featured framework for fast, easy and document=
ed API development with Flask&quot;<br>
+LICENSE =3D &quot;BSD-3&quot;</blockquote><div dir=3D"auto">this is not a =
valid SPDX license.</div><div dir=3D"auto">You probably mean =E2=80=9CBSD-3=
-Clause=E2=80=9D</div><div dir=3D"auto"><div><a href=3D"https://spdx.org/li=
censes/BSD-3-Clause.html">https://spdx.org/licenses/BSD-3-Clause.html</a></=
div><br></div><div dir=3D"auto">But you are responsible for verification.</=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc96dd911c6d9e32868b6bc667a=
38a3e2&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;9a5338b108c57fbed1d24d5d53fe98442b2be7ffa2ff3=
291305af7a613ce6fc0&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+RDEPENDS:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 python3-isodate \<br>
+=C2=A0 =C2=A0 python3-jsonschema \<br>
+=C2=A0 =C2=A0 python3-pytz \<br>
+&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105804): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105804" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105804</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102302623/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102302623/924729</a><br>
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

--00000000000041dc5f06090e2bea--

