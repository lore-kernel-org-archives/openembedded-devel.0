Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.617.1613669299277536333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 09:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ecvNkUVK;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id jt13so7060812ejb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Feb 2021 09:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E49tNB6nUMNEHugCSM5RstA6FTKrGkMT2KVXBUrKyZs=;
        b=ecvNkUVKLih2NIWcEpSk1Bce5B1xW0Y1DQ0EGShLazz48yOIVuQTnNhyidkrZ0m9d8
         sQYkwnWCvavzGUuMRVbmTjycsKT6h9WQnNLlVTF4HYcvdMi/0mM0RD4rlQa60S6jfp/N
         JwDXJhFyjILsRZffkmGpCOoeOqT0thr1wQ6pEGIL3i+PzTQKTqEbkaS3beEMJ4icWbch
         QVM27W/66u7qO/rm+TBqUgdTxtzjDki0rEj1W7YGjPaFh6u2TGBPLP7VxFoCLfce4bbG
         GsPl36ZaEcjxi/n2Pgk4sIJjr0gNgKtrsDYfcsoIXsGqpk2wfm37fvyJAfeG11/T1O63
         W9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E49tNB6nUMNEHugCSM5RstA6FTKrGkMT2KVXBUrKyZs=;
        b=iqOpseeadO9u+jKgQfy8rAbPFzb9zzvWVcVtklP1NmuinyVjQNJdWfWs4IL7BQ0Aqh
         3f+6g28RzNnX/mGiaT1jsuoRPxbkenIjzrx0S+IUMuo1NPBwm1JhnUC9gmupSyaxfI3w
         J26wn1eIUZGOR864faEbC/NrW5uIlMdRVejsdEKIRNTQ4kiOBnFHuIbLLbV8MOIU6b2Q
         TVS4kmg4Q1CGEn65zGwUBiRZ+GZJP/IosSJJ7a0mnlcE6PteWHEkAS4oddKeQ2ZFGZwp
         dOuEHdyYp7kkZ4n16YFmkmJ6kna5sxfOvZApEmneFVWCc2WGpwPyNLm4NDdHcHcVNGgg
         n24g==
X-Gm-Message-State: AOAM532nae1dM3HzV0wYZUnuOhXGYFCVbvj0Xw9sJoJ0nnfJDkJ1yTfP
	2CYlyqxxrBZ9xMGkGZuv4pe6Lyocpm6yf5EwmwA=
X-Google-Smtp-Source: ABdhPJx0eHQZGQOpXmxRsK0yiMh1VzXVaL5OIo0ZuUQTmjAy+9iaTu9ADZG3GGrdTomVD58ocHjVRFpXJg+COONt7JE=
X-Received: by 2002:a17:906:4349:: with SMTP id z9mr5075952ejm.471.1613669297655;
 Thu, 18 Feb 2021 09:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20210216152349.30824-1-Rahul.Taya@kpit.com>
In-Reply-To: <20210216152349.30824-1-Rahul.Taya@kpit.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 18 Feb 2021 18:28:06 +0100
Message-ID: <CA+chaQfrVCttH0nb55=eiwJva=GT0NZyitkVEfaFyigVj+RC8A@mail.gmail.com>
Subject: Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
To: Rahul Taya <Rahul.Taya@kpit.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>, nisha.parrakat@kpit.com, harpritkaur.bhandari@kpit.com
Content-Type: multipart/alternative; boundary="0000000000004592e505bb9fa9d6"

--0000000000004592e505bb9fa9d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"git am" doesn't like those emoticons in the .patch file..

git am ~/py2/cur/16136689*
error: cannot convert from 8bit to UTF-8
fatal: could not parse patch

either drop them or upload it to some git repo so I can cherry-pick it fro=
m
there.

On Thu, Feb 18, 2021 at 3:18 PM Rahul Taya <Rahul.Taya@kpit.com> wrote:

> For python and python-native added patch to fix
> CVE-2019-9674
>
> Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> ---
>  recipes-devtools/python/python.inc            |  1 +
>  .../python/python/CVE-2019-9674.patch         | 83 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 recipes-devtools/python/python/CVE-2019-9674.patch
>
> diff --git a/recipes-devtools/python/python.inc
> b/recipes-devtools/python/python.inc
> index a4ba0c5..787f23e 100644
> --- a/recipes-devtools/python/python.inc
> +++ b/recipes-devtools/python/python.inc
> @@ -8,6 +8,7 @@ INC_PR =3D "r1"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D203a6dbc802ee896020a47161e75=
9642"
>
>  SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz=
 \
> +           file://CVE-2019-9674.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43"
> diff --git a/recipes-devtools/python/python/CVE-2019-9674.patch
> b/recipes-devtools/python/python/CVE-2019-9674.patch
> new file mode 100644
> index 0000000..647d9da
> --- /dev/null
> +++ b/recipes-devtools/python/python/CVE-2019-9674.patch
> @@ -0,0 +1,83 @@
> +From 3ba51d587f6897a45301ce9126300c14fcd4eba2 Mon Sep 17 00:00:00 2001
> +From: JunWei Song <sungboss2004@gmail.com>
> +Date: Wed, 11 Sep 2019 23:04:12 +0800
> +Subject: [PATCH] bpo-36260: Add pitfalls to zipfile module documentatio=
n
> + (#13378)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* bpo-36260: Add pitfalls to zipfile module documentation
> +
> +We saw vulnerability warning description (including zip bomb) in
> Doc/library/xml.rst file.
> +This gave us the idea of documentation improvement.
> +
> +So, we moved a little bit forward :P
> +And the doc patch can be found (pr).
> +
> +* fix trailing whitespace
> +
> +* =F0=9F=93=9C=F0=9F=A4=96 Added by blurb_it.
> +
> +* Reformat text for consistency.
> +
> +Upstream-Status: Backport[
> http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2=
ubuntu0~16.04.12.debian.tar.xz
> ]
> +CVE: CVE-2019-9674
> +Link:
> http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2=
ubuntu0~16.04.12.debian.tar.xz
> +Comment: From the original patch skipped changes for file
> +Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.rst
> +as this file is not present in our source code.
> +---
> + Doc/library/zipfile.rst                       | 41 +++++++++++++++++++
> + 1 files changed, 41 insertions(+)
> +
> +diff --git a/Doc/library/zipfile.rst b/Doc/library/zipfile.rst
> +index b421ea5..2e0a91d 100644
> +--- a/Doc/library/zipfile.rst
> ++++ b/Doc/library/zipfile.rst
> +@@ -574,4 +574,45 @@ Instances have the following attributes:
> +
> +    Size of the uncompressed file.
> +
> ++Decompression pitfalls
> ++----------------------
> ++
> ++The extraction in zipfile module might fail due to some pitfalls liste=
d
> below.
> ++
> ++From file itself
> ++~~~~~~~~~~~~~~~~
> ++
> ++Decompression may fail due to incorrect password / CRC checksum / ZIP
> format or
> ++unsupported compression method / decryption.
> ++
> ++File System limitations
> ++~~~~~~~~~~~~~~~~~~~~~~~
> ++
> ++Exceeding limitations on different file systems can cause decompressio=
n
> failed.
> ++Such as allowable characters in the directory entries, length of the
> file name,
> ++length of the pathname, size of a single file, and number of files, et=
c.
> ++
> ++Resources limitations
> ++~~~~~~~~~~~~~~~~~~~~~
> ++
> ++The lack of memory or disk volume would lead to decompression
> ++failed. For example, decompression bombs (aka `ZIP bomb`_)
> ++apply to zipfile library that can cause disk volume exhaustion.
> ++
> ++Interruption
> ++~~~~~~~~~~~~
> ++
> ++Interruption during the decompression, such as pressing control-C or
> killing the
> ++decompression process may result in incomplete decompression of the
> archive.
> ++
> ++Default behaviors of extraction
> ++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ++
> ++Not knowing the default extraction behaviors
> ++can cause unexpected decompression results.
> ++For example, when extracting the same archive twice,
> ++it overwrites files without asking.
> ++
> ++
> ++.. _ZIP bomb: https://en.wikipedia.org/wiki/Zip_bomb
> + .. _PKZIP Application Note:
> https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only fo=
r
> the person to whom it is addressed. If you are not the intended recipien=
t,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
>=20
>
>

--0000000000004592e505bb9fa9d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;git am&quot; doesn&#39;t like those emoticons in the=
 .patch file..<div><br></div><div>git am ~/py2/cur/16136689*<br>error: cann=
ot convert from 8bit to UTF-8<br>fatal: could not parse patch<br></div><div=
><br></div><div>either drop them or upload it to some git repo so I can che=
rry-pick it from there.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Feb 18, 2021 at 3:18 PM Rahul Taya &=
lt;<a href=3D"mailto:Rahul.Taya@kpit.com">Rahul.Taya@kpit.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">For python and=
 python-native added patch to fix<br>
CVE-2019-9674<br>
<br>
Signed-off-by: Rahul Taya &lt;<a href=3D"mailto:Rahul.Taya@kpit.com" targe=
t=3D"_blank">Rahul.Taya@kpit.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../python/python/CVE-2019-9674.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 83 +++++++++++++++++++<br>
=C2=A02 files changed, 84 insertions(+)<br>
=C2=A0create mode 100644 recipes-devtools/python/python/CVE-2019-9674.patc=
h<br>
<br>
diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/=
python.inc<br>
index a4ba0c5..787f23e 100644<br>
--- a/recipes-devtools/python/python.inc<br>
+++ b/recipes-devtools/python/python.inc<br>
@@ -8,6 +8,7 @@ INC_PR =3D &quot;r1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D203a6dbc802ee896020a=
47161e759642&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/python/$%7BPV=
%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://ww=
w.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-9674.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b62c0e7937551d0cc02b8fd5cb0f544f9405baf=
c9a54d3808ed4594812edef43&quot;<br>
diff --git a/recipes-devtools/python/python/CVE-2019-9674.patch b/recipes-=
devtools/python/python/CVE-2019-9674.patch<br>
new file mode 100644<br>
index 0000000..647d9da<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/python/CVE-2019-9674.patch<br>
@@ -0,0 +1,83 @@<br>
+From 3ba51d587f6897a45301ce9126300c14fcd4eba2 Mon Sep 17 00:00:00 2001<br=
>
+From: JunWei Song &lt;<a href=3D"mailto:sungboss2004@gmail.com" target=3D=
"_blank">sungboss2004@gmail.com</a>&gt;<br>
+Date: Wed, 11 Sep 2019 23:04:12 +0800<br>
+Subject: [PATCH] bpo-36260: Add pitfalls to zipfile module documentation<=
br>
+ (#13378)<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+* bpo-36260: Add pitfalls to zipfile module documentation<br>
+<br>
+We saw vulnerability warning description (including zip bomb) in Doc/libr=
ary/xml.rst file.<br>
+This gave us the idea of documentation improvement.<br>
+<br>
+So, we moved a little bit forward :P<br>
+And the doc patch can be found (pr).<br>
+<br>
+* fix trailing whitespace<br>
+<br>
+* =F0=9F=93=9C=F0=9F=A4=96 Added by blurb_it.<br>
+<br>
+* Reformat text for consistency.<br>
+<br>
+Upstream-Status: Backport[<a href=3D"http://archive.ubuntu.com/ubuntu/poo=
l/main/p/python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz" rel=3D"=
noreferrer" target=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/p/=
python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz</a>]<br>
+CVE: CVE-2019-9674<br>
+Link: <a href=3D"http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/p=
ython3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3=
.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz</a><br>
+Comment: From the original patch skipped changes for file<br>
+Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.rst<b=
r>
+as this file is not present in our source code.<br>
+---<br>
+ Doc/library/zipfile.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 +++++++++++++++++++<br>
+ 1 files changed, 41 insertions(+)<br>
+<br>
+diff --git a/Doc/library/zipfile.rst b/Doc/library/zipfile.rst<br>
+index b421ea5..2e0a91d 100644<br>
+--- a/Doc/library/zipfile.rst<br>
++++ b/Doc/library/zipfile.rst<br>
+@@ -574,4 +574,45 @@ Instances have the following attributes:<br>
+<br>
+=C2=A0 =C2=A0 Size of the uncompressed file.<br>
+<br>
++Decompression pitfalls<br>
++----------------------<br>
++<br>
++The extraction in zipfile module might fail due to some pitfalls listed =
below.<br>
++<br>
++From file itself<br>
++~~~~~~~~~~~~~~~~<br>
++<br>
++Decompression may fail due to incorrect password / CRC checksum / ZIP fo=
rmat or<br>
++unsupported compression method / decryption.<br>
++<br>
++File System limitations<br>
++~~~~~~~~~~~~~~~~~~~~~~~<br>
++<br>
++Exceeding limitations on different file systems can cause decompression =
failed.<br>
++Such as allowable characters in the directory entries, length of the fil=
e name,<br>
++length of the pathname, size of a single file, and number of files, etc.=
<br>
++<br>
++Resources limitations<br>
++~~~~~~~~~~~~~~~~~~~~~<br>
++<br>
++The lack of memory or disk volume would lead to decompression<br>
++failed. For example, decompression bombs (aka `ZIP bomb`_)<br>
++apply to zipfile library that can cause disk volume exhaustion.<br>
++<br>
++Interruption<br>
++~~~~~~~~~~~~<br>
++<br>
++Interruption during the decompression, such as pressing control-C or kil=
ling the<br>
++decompression process may result in incomplete decompression of the arch=
ive.<br>
++<br>
++Default behaviors of extraction<br>
++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
++<br>
++Not knowing the default extraction behaviors<br>
++can cause unexpected decompression results.<br>
++For example, when extracting the same archive twice,<br>
++it overwrites files without asking.<br>
++<br>
++<br>
++.. _ZIP bomb: <a href=3D"https://en.wikipedia.org/wiki/Zip_bomb" rel=3D"=
noreferrer" target=3D"_blank">https://en.wikipedia.org/wiki/Zip_bomb</a><br=
>
+ .. _PKZIP Application Note: <a href=3D"https://pkware.cachefly.net/webdo=
cs/casestudies/APPNOTE.TXT" rel=3D"noreferrer" target=3D"_blank">https://pk=
ware.cachefly.net/webdocs/casestudies/APPNOTE.TXT</a><br>
--<br>
2.17.1<br>
<br>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print, retain copy, disseminate, distribute, =
or use this message or any part thereof. If you receive this message in err=
or, please notify the sender immediately and delete all copies of this mess=
age. KPIT Technologies Ltd. does not accept any liability for virus infecte=
d mails.<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000004592e505bb9fa9d6--
