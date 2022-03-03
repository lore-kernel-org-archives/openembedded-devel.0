Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325CAC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 15:07:49 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.11870.1646320067512575359
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M/+oFb9q;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a23so11320183eju.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KyhMkx2aWUApImSxsSwHXenkGHzNs9AfsXm8qShj9g=;
        b=M/+oFb9q1oEFSYFZW5Wcjj8tQLK+ZNojdIJuO1p0q0/Lz3chdDwIWhDzEfhcNIRgxN
         V2Aknv0rDpT/c8/QXW5EPI3bi6NoBPBn4z1wEEk9d4wwcUh/29jQLfjN86iDPK0PknmD
         XL7dk2Ascib+0lr3PLS42+kSmbJabKPEEPvnsi/VDRfEnkEVdmFDa4sFQXec9duPjz8f
         XbHxLDoO2fmnymAtCzywRZWGPiXbFqGmv/SO+IE7N41JlDzZEFVAHBJKwsn5BUj8wZZ/
         H4/DtaTHNw68F+NSgyEkqClar6LyWJm9zfWIg7a0CY+0kvznQ8uii0CyUIlx9TeoGrtG
         gDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KyhMkx2aWUApImSxsSwHXenkGHzNs9AfsXm8qShj9g=;
        b=rhAJ9FYk8DInXVOI3SNHMFeTmpEwRUJFK/pUT6wZnnhthV0M7eZMGy+cK9uCCI6WcW
         gw1rS9ZS8K+3p3phg4dobhvnAWS4fD9KOBuH3PwJR3inYWQzSNUhYgc1LfVNJD5zA7qf
         vZSAz2zhiG0akLBWUTmh/NnSsOD6VdWrWHpB1GtXP84HuKqrBsrY0KRiGnz4QzXJUii/
         JQZL/oEOlmAmiIfAujryL9IOJA4BXOctVZe+WYEeL8yNeWQLis888J+CHl1Rli38aH+Y
         foJ+Es4PV3rgtK64EgEOdwgpZdJ0A1ETUzlSwzN0mv1w0TZQKHRQRbCR/39RaP2u3ghu
         WCwA==
X-Gm-Message-State: AOAM531lgOGYzoT06cfssggUnu3dcPZd738sKLuwkk1mHlgpzRcsRC/T
	gU7k04JQIDMiAEy4tXFFMC5nW5FaZDtK61Utrzc=
X-Google-Smtp-Source: 
 ABdhPJzS/g5mpb9Bd7WFCdQNdJiqVIJI1HFMVUgq3XU0pC4V4jj8ddjKXmPec/ZaMEHtW8Ccr83WQXoSCwajnWcy2nY=
X-Received: by 2002:a17:907:6e07:b0:6da:9722:8796 with SMTP id
 sd7-20020a1709076e0700b006da97228796mr1745243ejc.610.1646320065481; Thu, 03
 Mar 2022 07:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20220303140833.5374-1-kai.kang@windriver.com>
 <20220303140833.5374-2-kai.kang@windriver.com>
In-Reply-To: <20220303140833.5374-2-kai.kang@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 3 Mar 2022 07:07:34 -0800
Message-ID: 
 <CANx9H-CRb+TrzJCA5_8RF7TfxWi0L2tLVg63_-bZ1A84LL=ybQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] python3-pyparsing: add recipe
To: kai <kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b08ecf05d951c2ae"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 15:07:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95750

--000000000000b08ecf05d951c2ae
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 6:08 AM kai <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../python3-pyparsing/python3-pyparsing_3.0.7.bb      | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-python/recipes-extended/python3-pyparsing/
> python3-pyparsing_3.0.7.bb
>

python3-pyparsing is in oe-core
https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb


> diff --git a/meta-python/recipes-extended/python3-pyparsing/
> python3-pyparsing_3.0.7.bb
> b/meta-python/recipes-extended/python3-pyparsing/
> python3-pyparsing_3.0.7.bb
> new file mode 100644
> index 000000000..30db080e8
> --- /dev/null
> +++ b/meta-python/recipes-extended/python3-pyparsing/
> python3-pyparsing_3.0.7.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "The pyparsing module is an alternative approach to creating
> and executing simple grammars."
> +HOMEPAGE = "https://github.com/pyparsing/pyparsing/"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
> +
> +SRC_URI[sha256sum] =
> "18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} = "python3-pprint"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95747):
> https://lists.openembedded.org/g/openembedded-devel/message/95747
> Mute This Topic: https://lists.openembedded.org/mt/89525383/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b08ecf05d951c2ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 3, 2022 at 6:08 AM kai &lt;<a href=3D"mailto:ka=
i.kang@windriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" tar=
get=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../python3-pyparsing/<a href=3D"http://python3-pyparsing_3.0.7.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pyparsing_3.0.7.bb</a>=C2=A0 =
=C2=A0 =C2=A0 | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-extended/python3-pyparsing/<a =
href=3D"http://python3-pyparsing_3.0.7.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-pyparsing_3.0.7.bb</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">python3-pyparsin=
g is in oe-core</div><div dir=3D"auto"><div><a href=3D"https://git.yoctopro=
ject.org/poky/tree/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb"=
>https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/python/python=
3-pyparsing_3.0.7.bb</a></div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
diff --git a/meta-python/recipes-extended/python3-pyparsing/<a href=3D"http=
://python3-pyparsing_3.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pyparsing_3.0.7.bb</a> b/meta-python/recipes-extended/python3-pyparsing/<a=
 href=3D"http://python3-pyparsing_3.0.7.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-pyparsing_3.0.7.bb</a><br>
new file mode 100644<br>
index 000000000..30db080e8<br>
--- /dev/null<br>
+++ b/meta-python/recipes-extended/python3-pyparsing/<a href=3D"http://pyth=
on3-pyparsing_3.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-pypars=
ing_3.0.7.bb</a><br>
@@ -0,0 +1,11 @@<br>
+SUMMARY =3D &quot;The pyparsing module is an alternative approach to creat=
ing and executing simple grammars.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/pyparsing/pyparsing/" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/pyparsing/pyparsing/</=
a>&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D657a566233888513e1f07ba13e=
2f47f1&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;18ee9022775d270c55187733956460083db60b37d0d0f=
b357445f3094eed3eea&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+RDEPENDS:${PN} =3D &quot;python3-pprint&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95747): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95747" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95747</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89525383/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89525383/924729</a><br>
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

--000000000000b08ecf05d951c2ae--

