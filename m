Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90A3C43217
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:19:18 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.81327.1669504749030696267
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OcEqOI4r;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id x2so10913520edd.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 15:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rN5OJrqCrWkFkvEtkdG1pQ+pAUfu3sV8SHFH7j09lok=;
        b=OcEqOI4rEylMzLMOUsmLxeVTAnHCJbVeJ+mpSHvI7MzEK13B2ZFwbsXx3yvDC/L0Df
         BnW6uZbyzf33HJUbCQMacz/YHWPemrBzf2zwwLdy5dyv8ztvYSLMvSA2bJsGtrAKHK/8
         lT1N1Xe8QzQkfpkvtfFhnJfq83aSCElS5ADh10aKGPKIDq0GyZ7FPlmJgGY74QnGPrbx
         FcfgZT8AJZPyQ0Z1NFHHa1lXQItzyWEZyF0x9PnMb4KOo0SFNO/XfiTUjkqllX/7mPlY
         4dJes3zVcfNGScgILEUv4f1PKanrzOk1ZtccxaZo0buToizLpBebupt0a/+maeoPbajN
         m72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rN5OJrqCrWkFkvEtkdG1pQ+pAUfu3sV8SHFH7j09lok=;
        b=MxX78aBEzYPwaXYsuDFIRGGniPU79wCHr0jQRAKKjXBodiJlISJ9Ahym4YBoZCp93R
         UU3n2iCbaTh7x7dnAZjmGM7TaRC0EPEENL4cbXdO8JHpYOOuD6iEvgiGu6oZ3mhEKTna
         BsqtNlMvRQeMquLgqBtHvb7NrA8dzn/vWHAtsy4pF8Pfla4xNFUZmF+djUvO54frELu8
         TA3mZO58Jo7bT3ALonlbp6cBonejE3oQ40dwF7dhQjx64U83qrGpSH9aaJnqi+MGXv9d
         pLBmmIJRjZzBHBsAYPTGPbUdP6YizEGQAbIGV844H1uWMSnBlVmsf+gRDXgZynvLXGXG
         KiAw==
X-Gm-Message-State: ANoB5pmJE0xxEK1NBE+SFOtJM6Mw4Ov/0s9cIwwx0aE1J5jeBCfGb+Fi
	pgA5QjnzlDYySiyPZI6cUZZxeZ9wVMyZUgr8Nxa4aNoP
X-Google-Smtp-Source: AA0mqf5bYy5xI6SbIqpaA7CVcbKIGu9JrMr8lVqkMUN3KetNdd4wp7dGuMQFADVF//mYPZIBg6cdRqW29KHUkyM2CD4=
X-Received: by 2002:aa7:c841:0:b0:45d:2a5:2db8 with SMTP id
 g1-20020aa7c841000000b0045d02a52db8mr26783428edt.105.1669504747102; Sat, 26
 Nov 2022 15:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20221125114411.128952-1-tomasz.zyjewski@3mdeb.com>
In-Reply-To: <20221125114411.128952-1-tomasz.zyjewski@3mdeb.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 26 Nov 2022 15:18:56 -0800
Message-ID: <CANx9H-DEL_Z1BeT8VnPZ9jC0_VHEtQV_O2Vs8UdzdiC77-aCMA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-binwalk: add recipe for
 version 2.3.3
To: tomzy <tomasz.zyjewski@3mdeb.com>
Cc: maciej.pijanowski@3mdeb.com, openembedded-devel@lists.openembedded.org, 
	piotr.krol@3mdeb.com
Content-Type: multipart/alternative; boundary="00000000000066e5e605ee67dd37"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99767

--00000000000066e5e605ee67dd37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2022 at 3:44 AM tomzy <tomasz.zyjewski@3mdeb.com> wrote:

> Install binwalk utility
>
> Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
> ---
>  .../python/python3-binwalk_2.3.3.bb             | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-binwalk_2.3.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
> b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
> new file mode 100644
> index 000000000000..362efa275148
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.3.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Firmware analysis tool"
> +DESCRIPTION =3D "This package contains Python Binwalk tool. Binwalk is a
> fast, \
> +easy to use tool for analyzing, reverse engineering, and extracting
> firmware \
> +images."
> +HOMEPAGE =3D "https://github.com/ReFirmLabs/binwalk"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65bbee055d3ea3bfc475f07aecf4d=
e64"
> +
> +SRC_URI =3D "git://
> github.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=3Dmaster"
> +


Thank you for fetching the git repo which is much newer (and with better
security apparently) than the pypi version.


> +SRCREV =3D "fa0c0bd59b8588814756942fe4cb5452e76c1dcd"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS:${PN} +=3D "python3-core"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99728):
> https://lists.openembedded.org/g/openembedded-devel/message/99728
> Mute This Topic: https://lists.openembedded.org/mt/95252446/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000066e5e605ee67dd37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 25, 2022 at 3:44 AM tomzy &lt;<a href=3D"mailto=
:tomasz.zyjewski@3mdeb.com">tomasz.zyjewski@3mdeb.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Install binwalk utility<br>
<br>
Signed-off-by: Tomasz =C5=BByjewski &lt;<a href=3D"mailto:tomasz.zyjewski@3=
mdeb.com" target=3D"_blank">tomasz.zyjewski@3mdeb.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python3-binwalk_2.3.3.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-binwalk_2.3.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
=C2=A01 file changed, 17 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-binwalk_2.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
binwalk_2.3.3.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
binwalk_2.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-binwalk_2.3.=
3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-bi=
nwalk_2.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-binwalk_2.3.3.=
bb</a><br>
new file mode 100644<br>
index 000000000000..362efa275148<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-binwalk=
_2.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-binwalk_2.3.3.bb</a=
><br>
@@ -0,0 +1,17 @@<br>
+SUMMARY =3D &quot;Firmware analysis tool&quot;<br>
+DESCRIPTION =3D &quot;This package contains Python Binwalk tool. Binwalk i=
s a fast, \<br>
+easy to use tool for analyzing, reverse engineering, and extracting firmwa=
re \<br>
+images.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/ReFirmLabs/binwalk" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/ReFirmLabs/binwalk</a>=
&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D65bbee055d3ea3bfc475f07aec=
f4de64&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/ReFirmLabs/binwalk;pr=
otocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github=
.com/ReFirmLabs/binwalk;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
+</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you for f=
etching the git repo which is much newer (and with better security apparent=
ly) than the pypi version.</div><div dir=3D"auto"><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex" dir=3D"auto"><br>
+SRCREV =3D &quot;fa0c0bd59b8588814756942fe4cb5452e76c1dcd&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit setuptools3<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;python3-core&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99728): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99728" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99728</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95252446/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
95252446/924729</a><br>
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

--00000000000066e5e605ee67dd37--

