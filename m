Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CE0C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 23:54:47 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.4643.1667778875048858821
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 06 Nov 2022 15:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pUYvx/Hh;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id ud5so26113076ejc.4
        for <Openembedded-devel@lists.openembedded.org>; Sun, 06 Nov 2022 15:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VNGpfS7bRDEPtKY1cCx2y6qEgQOttn5CPQxfJYHKNxM=;
        b=pUYvx/HhNoJiHr2CQLkhure0pZNhVfaqmk8i94h60Av3IRkyM6J4W+wUq8MmAtJ1O5
         R6Kq9/hZVJf/nu4KxVlwCT5IgV23n0lzZoN0wHAtaeuTLq0O4+yA/LDlUUIpPa/QSU70
         QlV7KW7+sygykI9spNq9OlC6mClJPP3jsL4MleVlOqukp6XpBVz/ffP/bqgfo26yPU0O
         0TqulGGklR4ejJdC68sF9gFoRvFbyEgkWsEHNdLSbcu1HKKZqfM65RUoRgE8HCB4iwZv
         pgySRV2dUvtvEIWUdK/BMk0TFqnCXEBmIqBVaKWYgmRSwQtOOCUq8R2/CGdugy6FQg+k
         iLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNGpfS7bRDEPtKY1cCx2y6qEgQOttn5CPQxfJYHKNxM=;
        b=FQhVlvyU2v9UmMDGT/drK+x0Us5EP/ECO9jn+NoiEjrAbaK5kGddWj/GfZav8/lnlR
         R5gnMycg4ah04myIhur0HNIdnrlGXhcRw1gUSjBpFWVZHx56M6hr6oENHl8OgJ2PVt/0
         jOm5Sxg3TXWd0u5ZsU6GRVo80mS+SFOfWE15OZJZO1KxjMmqV0m2dTLA4O6fVKolM2WO
         NXTwUinlOOrpSlOA7wprIsRWI12bpL8h7iAMNbXBotmbqgMZlQTlRK1BxxqQwXuo82Kg
         qaM9uAD2MrvisXVGlPrnSvlxop1IrptAZHM054yoABxWpA/8mNpqN00tpTILDPPrZlIj
         lOug==
X-Gm-Message-State: ACrzQf2zqiddenlQOCgtMv02TDk3Qdw3pU2TwJ5LoxHc8oty4kOWf87h
	bkpRWKJAgr026g7sxl+BYFq51zNw2tsph34QEVwSSFeKzYA=
X-Google-Smtp-Source: AMsMyM4zBiCrEQgGUuaL2AMjd1uX8SV8sBHpCENRpkhdGsse4QBW6BXGsiLpqLurCrdXWm+1cJZ88wX/28eavK4R5fg=
X-Received: by 2002:a17:907:7704:b0:780:da38:4480 with SMTP id
 kw4-20020a170907770400b00780da384480mr45628401ejc.64.1667778872989; Sun, 06
 Nov 2022 15:54:32 -0800 (PST)
MIME-Version: 1.0
References: <20221105095953.924-1-cp0613@linux.alibaba.com>
In-Reply-To: <20221105095953.924-1-cp0613@linux.alibaba.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 6 Nov 2022 15:54:22 -0800
Message-ID: <CANx9H-A+O46Gdv45aemc+rQknE01c7ktDO83+C5U_jVfnXqc4Q@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] add meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
To: cp0613 <cp0613@linux.alibaba.com>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000049dcaa05ecd6078c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Nov 2022 23:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99434

--00000000000049dcaa05ecd6078c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The signed off by should be a name of a person, not a username.
=E2=80=9C The sign-off is a simple line at the end of the explanation for t=
he patch,
which certifies that you wrote it or otherwise have the right to pass it on
as an open-source patch.=E2=80=9D

See:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


On Sat, Nov 5, 2022 at 3:00 AM cp0613 <cp0613@linux.alibaba.com> wrote:

> From: cp0613 <cp0613@linux.alibaba.com>
>
> Signed-off-by: cp0613 <cp0613@linux.alibaba.com>
> ---
>  .../python/python3-brotli_1.0.9.bb             | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-brotli_1.0.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
> b/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
> new file mode 100644
> index 000000000..5dfac5823
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Brotli compression format"
> +HOMEPAGE =3D "https://pypi.org/project/Brotli/"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D941ee9cd1609382f946352712a319=
b4b"
> +
> +PYPI_PACKAGE =3D "Brotli"
> +PYPI_PACKAGE_EXT =3D "zip"
> +
> +SRC_URI[sha256sum] =3D
> "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} =3D "\
> +  ${PYTHON_PN}-cffi \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99431):
> https://lists.openembedded.org/g/openembedded-devel/message/99431
> Mute This Topic: https://lists.openembedded.org/mt/94823730/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000049dcaa05ecd6078c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><br></div><div dir=3D"auto">The signed off by should be a name of=
 a person, not a username.</div><div dir=3D"auto">=E2=80=9C<span style=3D"f=
ont-family:monospace,Courier;font-size:14px;white-space:pre-wrap;background=
-color:rgb(248,249,250);color:rgb(0,0,0)"> The sign-off is a simple line at=
 the end of the explanation for the </span><span style=3D"font-family:monos=
pace,Courier;font-size:14px;white-space:pre-wrap;background-color:rgb(248,2=
49,250);border-color:rgb(234,236,240);color:rgb(0,0,0)">patch, which certif=
ies that you wrote it or otherwise have the right to</span><span style=3D"f=
ont-family:monospace,Courier;font-size:14px;white-space:pre-wrap;background=
-color:rgb(248,249,250);border-color:rgb(234,236,240);color:rgb(0,0,0)"> pa=
ss it on as an open-source patch.=E2=80=9D</span></div><div dir=3D"auto"><s=
pan style=3D"font-family:monospace,Courier;font-size:14px;white-space:pre-w=
rap;background-color:rgb(248,249,250);border-color:rgb(234,236,240);color:r=
gb(0,0,0)"><br></span></div></div><div><div dir=3D"auto">See:</div><div dir=
=3D"auto"><div><a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Me=
ssage_Guidelines">https://www.openembedded.org/wiki/Commit_Patch_Message_Gu=
idelines</a></div><br></div><div dir=3D"auto"><br><div class=3D"gmail_quote=
" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 5, 2022 at=
 3:00 AM cp0613 &lt;<a href=3D"mailto:cp0613@linux.alibaba.com" target=3D"_=
blank">cp0613@linux.alibaba.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
From: cp0613 &lt;<a href=3D"mailto:cp0613@linux.alibaba.com" target=3D"_bla=
nk">cp0613@linux.alibaba.com</a>&gt;<br>
<br>
Signed-off-by: cp0613 &lt;<a href=3D"mailto:cp0613@linux.alibaba.com" targe=
t=3D"_blank">cp0613@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-brotli_1.0.9.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-brotli_1.0.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
=C2=A01 file changed, 18 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-brotli_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-b=
rotli_1.0.9.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
brotli_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-brot=
li_1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.bb</=
a><br>
new file mode 100644<br>
index 000000000..5dfac5823<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-brotli_=
1.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.0.9.bb</a><=
br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Brotli compression format&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/Brotli/" rel=3D"nor=
eferrer" target=3D"_blank">https://pypi.org/project/Brotli/</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D941ee9cd1609382f946352712a=
319b4b&quot;<br>
+<br>
+PYPI_PACKAGE =3D &quot;Brotli&quot;<br>
+PYPI_PACKAGE_EXT =3D &quot;zip&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;4d1b810aa0ed773f81dceda2cc7b403d01057458730e3=
09856356d4ef4188438&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+RDEPENDS:${PN} =3D &quot;\<br>
+=C2=A0 ${PYTHON_PN}-cffi \<br>
+&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99431): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99431" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99431</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94823730/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94823730/924729</a><br>
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
</div>

--00000000000049dcaa05ecd6078c--

