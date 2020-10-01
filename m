Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.1146.1601565143404633764
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2020 08:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iH/CQ+/g;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id g4so6045286edk.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2020 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kD388I2snWLAUN6UrS7o9eZ2POMg3XVKuyFIM6f0JT0=;
        b=iH/CQ+/gN09LlXwGAHnwDZ4Oq1bHq//nFB8SxcLAISEmT/p+9TpHvLM+AGki5LSPEW
         ZBWfSADzYFrUVtFNExndM764txnE2YM2VXBFFjn+pyX23WB05FmStw9XQ1FMyv8s/l/7
         Axa1tE0IwrAQLkzuC/YKNPNpFTNGwsFEvF7lCqKeGpCA+UHc2AQ/piuOMmxR2F3dm6MO
         PGI9bROPKYUCdj6hU1I8gbXiukMPoVOpoN8V2bxB2S4dHxNjVCDHyDJhB6CnRkRu3Zee
         hi6KYr6SVxE2ip0C1gcR5mqLv0lAWAY8gZbZfi3Z2+KwZZvfOTOuFONDi1ACEquWobrD
         3A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kD388I2snWLAUN6UrS7o9eZ2POMg3XVKuyFIM6f0JT0=;
        b=WJTM639SYCdtxxT5nzLVWwdJgyl1u0wv+7m6bSLqNhLLiuiLxPNkkLXunz96nYxXWN
         6bJwDeKxDQIIY4tBD09BBDs+aLmSW5TsMBQlrltZi9oTKbZNHXEoucD4Y3my1gg1niR4
         hQdxF+Im9pgLhOanqBlfuOV47SrsTjBo6/r+umPvc6aqYCVbuyDTUjC7hX2Gk51j1CQD
         clH6adAC0vMKqmmho/mMhU4g3n9shXmamVk03fpY8ZBXsX+3o6YY0+j1Qz3zwG7fdz5T
         ZHAy+1+XEPVnvO994dCdZ3j1Jf0PQR/ScLDDPHu2+OsYQfe/i0ZWmBbGDUCIEk7omexs
         ILEA==
X-Gm-Message-State: AOAM532sD1SCcOeyZ6lMBjpeT2BCXWPlkoBNTOblSIjYnkzds/f2WOQc
	ivn5H/0LX9YCmpAl2BXF5zMY91If+2E4DNEi+tY=
X-Google-Smtp-Source: ABdhPJw6/jn7Ny4Zu4hju7k+qCpTxo6GSQZoGJOL3vHEgKwkcvr+KuyilAARxV7SwNDiRp7b5dkl7CcaVkW5Fxmd4ZI=
X-Received: by 2002:a05:6402:2214:: with SMTP id cq20mr4443908edb.311.1601565141751;
 Thu, 01 Oct 2020 08:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200930232008.1342160-1-zig@zigsystem.com> <CAHQecY7n9s1JXXwxLScCVp58qSF60ggmz5a=Ji2ucuKRKDBHRw@mail.gmail.com>
In-Reply-To: <CAHQecY7n9s1JXXwxLScCVp58qSF60ggmz5a=Ji2ucuKRKDBHRw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 1 Oct 2020 17:12:10 +0200
Message-ID: <CA+chaQcHN8fNEZCnTfyg6fYOe8JfAC=cbXGhi3P_LB8uZ8uryw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] libuvc: add recipe
To: tom king <ka6sox@gmail.com>
Cc: Zig Globulin <zig@zigsystem.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005bde7e05b09d71f9"

--0000000000005bde7e05b09d71f9
Content-Type: text/plain; charset="UTF-8"

Why? It's fetching from git which doesn't use checksums, just SRCREV.

On Thu, Oct 1, 2020 at 5:10 PM tom king <ka6sox@gmail.com> wrote:

> Please add SRC_URI[md5sum] and SRC_URI[sha256sum] to recipe
>
> Thanks
>
> Tom
>
> On Wed, Sep 30, 2020 at 4:20 PM Zig Globulin <zig@zigsystem.com> wrote:
>
>> Signed-off-by: Zig Globulin <zig@zigsystem.com>
>> ---
>>  meta-multimedia/recipes-multimedia/libuvc/libuvc.bb | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>  create mode 100644 meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
>>
>> diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
>> b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
>> new file mode 100644
>> index 000000000..27cc17bc6
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc.bb
>> @@ -0,0 +1,13 @@
>> +SUMMARY = "library for USB video devices built atop libusb"
>> +HOMEPAGE = "https://github.com/libuvc/libuvc.git"
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE.txt;md5=2f1963e0bb88c93463af750daf9ba0c2"
>> +DEPENDS = "libusb jpeg"
>> +
>> +SRC_URI = "git://github.com/libuvc/libuvc.git"
>> +SRCREV = "ad6c72a4e390367f0d2be81aac00cfc0b6680d74"
>> +PV = "v0.0.6+git${SRCPV}"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit cmake
>> --
>> 2.28.0
>>
>>
>>
>>
>>
>>
> 
>
>

--0000000000005bde7e05b09d71f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why? It&#39;s fetching from git which doesn&#39;t use chec=
ksums, just SRCREV.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Oct 1, 2020 at 5:10 PM tom king &lt;<a href=3D"m=
ailto:ka6sox@gmail.com">ka6sox@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Please add SRC_URI=
[md5sum] and SRC_URI[sha256sum] to recipe<div><br></div><div>Thanks</div><d=
iv><br></div><div>Tom</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Sep 30, 2020 at 4:20 PM Zig Globulin &lt=
;<a href=3D"mailto:zig@zigsystem.com" target=3D"_blank">zig@zigsystem.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Si=
gned-off-by: Zig Globulin &lt;<a href=3D"mailto:zig@zigsystem.com" target=
=3D"_blank">zig@zigsystem.com</a>&gt;<br>
---<br>
=C2=A0meta-multimedia/recipes-multimedia/libuvc/<a href=3D"http://libuvc.b=
b" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a> | 13 +++++++++++++<br=
>
=C2=A01 file changed, 13 insertions(+)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libuvc/<a href=
=
=3D"http://libuvc.bb" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a><b=
r>
<br>
diff --git a/meta-multimedia/recipes-multimedia/libuvc/<a href=3D"http://l=
ibuvc.bb" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a> b/meta-multime=
dia/recipes-multimedia/libuvc/<a href=3D"http://libuvc.bb" rel=3D"noreferre=
r" target=3D"_blank">libuvc.bb</a><br>
new file mode 100644<br>
index 000000000..27cc17bc6<br>
--- /dev/null<br>
+++ b/meta-multimedia/recipes-multimedia/libuvc/<a href=3D"http://libuvc.b=
b" rel=3D"noreferrer" target=3D"_blank">libuvc.bb</a><br>
@@ -0,0 +1,13 @@<br>
+SUMMARY =3D &quot;library for USB video devices built atop libusb&quot;<b=
r>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/libuvc/libuvc.git" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/libuvc/libuvc.git</a>=
&quot;<br>
+LICENSE =3D &quot;BSD&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D2f1963e0bb88c93463af7=
50daf9ba0c2&quot;<br>
+DEPENDS =3D &quot;libusb jpeg&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/libuvc/libuvc.git" r=
el=3D"noreferrer" target=3D"_blank">github.com/libuvc/libuvc.git</a>&quot;<=
br>
+SRCREV =3D &quot;ad6c72a4e390367f0d2be81aac00cfc0b6680d74&quot;<br>
+PV =3D &quot;v0.0.6+git${SRCPV}&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit cmake<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--0000000000005bde7e05b09d71f9--
