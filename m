Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE430EE36A0
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 02:49:38 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62777.1770950977383651784
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 18:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BtfbTi46;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7974d908318so6601347b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 18:49:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770950976; cv=none;
        d=google.com; s=arc-20240605;
        b=eqS/xSPv4VxiX2oScLYV5/nrrVHNrN4ObnXmsUVQQrfCA13y3x5tmo1VSWWT5e7aoa
         utz2UF8B2SfJtSQq4Jlv6fLi2gFOgOjeupCLn1WUkT2FnCcwfN9OCjYI758b3c4HElFo
         BP07g6mpiOn8RtRQpcbVSzehWoRQik/lpBPEoBL51gjY1XbR6bVtZn+JAIoAV1AOM/IT
         Is18roYOA0tlsJ4RYWAIxzqoAtOJu9IXDN/+0lPc6/xpwR9gUMM2MwUsnarGhQx93Amx
         W1WL3Pb5PTYl4XSBfbYsWOMr9C7yaJ/2jpHf5OAD6TTMhCKcGk8QbhsabIwKU1R01wtT
         EzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7LQQB+JKS3qp5R8YW7dOtwGMJOAK41Wy+y8Vyp/TGN0=;
        fh=XcM6YKs5XohCyQUPXjnlFet9+nD6e72ufuzytl2wGp8=;
        b=d+dcvh/qeiKUehmIwFTqTyyL3W7E08QouEKZEbS841lD1jteVicrbDhKe5lEipPpel
         FJdRo035eQ+JlO3eVse0xpv5bKiozYuiWwh9x7DAPiMgqGMdJvGqposxJm2LMG098YqZ
         3abH9GEjkdu5nK9V4uqmYi8/TSw58P4an7z3Z97/N/7wEWbFa9vMEK3ZXQ7UxlSyLK0f
         dA1J8uVfJc4EBkNu1oK+gYFtFA1OsrYxSJQ9X8EbXbaS/v9y3MiahJivbGk1MpA6nzlx
         3DVrvMQNyc6l3wOsr5+ovvzpQt47U5kCfF1+CqIkinWWm9KLgi79uQML7p9YqHHzN8iy
         nUKg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770950976; x=1771555776; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7LQQB+JKS3qp5R8YW7dOtwGMJOAK41Wy+y8Vyp/TGN0=;
        b=BtfbTi46I595+YUGwa5HbduFhUOGzHHAZgQLU3BHqWUppbJGqKOfzQabbnfARwpKRW
         oEmxqFxuztVrC0D6qhvMH5Lficc/it8udL2Wr3im1nkI7yHwYBUZMHtOojJy1gJeTT2g
         7Cu3r0xQJIg0VtPTS2kz3q9KxPSYFevpgGxm/mo6odVLq9iiLsDKd+9ZuzOFZNdInRr0
         RW6feTR1n8cCsNkyFlb2fNS0x1cPXFUskPMceibZMM2TlvhcZG/UKjwoQ99RAXowz8R/
         Q8gKXID3uMSUd0iSJyM6V+UkDRaEobOR/kK8k97STJ/Y1RU0STDYtvhEUNI0/77u7BDW
         gcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770950976; x=1771555776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LQQB+JKS3qp5R8YW7dOtwGMJOAK41Wy+y8Vyp/TGN0=;
        b=h5+GxJWDpCG7nk1RzybLlm8IaJBea1skK3c9quYL9H2QMbA/uCKK4XhCx2QdTYG5eU
         zXxhBuRA3y8QwvHWwSLifkYlYeCnbwP9HaXtlMSkvAEOCIPN9Tf8ZuIQxmGt8rKnx6Zn
         rJqqxbVY/BRdrd0wcAWmkl1lCkyVB1bfC20gU2XsS/78F12R1Gz8a44C0hThozeftLOZ
         TyXheRd0lApezovzOSCHXfS0ynwGeorgOjKO3HR8m9me1eYlipYTBf8uIDdRgAFv94gD
         YLCXpplWgapBtvno5RNqxmFXEk/YJfpaWFbXtMN7yrRmcNNt2sSSl5M1CTyb9oaWefe2
         eudw==
X-Gm-Message-State: AOJu0YzEWKT76cvoN6deOBSGVRUbYF+14sbOB9sJmecrsv8kpoDQG8Tf
	L+C+X4cNjxtOUmb29DYMEn4lxYtkLmJa8kkRnMUAHfV5ufKl3VRxBLigQKHz8i9Dsi8tkN0X/nZ
	I3+jOtia5NASUR6Nm0jfN+AqDYl5dU5TTFzSG
X-Gm-Gg: AZuq6aL8Apyir4iYK9Q1rdqnIjtUejsVzGTsmcYyzg3SBVHv3+rm7kMWSsN2EyPeVke
	4hLYUg8uv/36s0+W2vcIG7ZpBoHmuBelGfNfp09fqsoYe595KCdfg7FgkIsmZGMkPdW9F5s9oeD
	7ttQi9a0Y8orqJ8WcqsxkI20HI8Nr3Y2Bbm1N7ZLdqngH7S45ywZw95RKZsyifxgh5NRhcojm14
	86gPOfbfHT3a9SztvsuW9zovAkNMOvZ33hwG8rKtK2wp6KlbM3oAbPsAc54ef6XToFUfl5W7ePy
	NcwCh9xWBVq4QyNdqKvnu6hukm3KYpX1QUeKgZBJrwqNkz5tXOY4okf988eUfNS9s7B1R8yoiWu
	3W7QJ/8Lzyuy7/KVAaFrA4W2v
X-Received: by 2002:a05:690c:60c2:b0:794:f8d4:607 with SMTP id
 00721157ae682-797a0cd013cmr4041517b3.48.1770950976473; Thu, 12 Feb 2026
 18:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20260213023217.19706-1-liuyd.fnst@fujitsu.com> <20260213023217.19706-5-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260213023217.19706-5-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Feb 2026 18:49:10 -0800
X-Gm-Features: AZwV_Qjo9WgLyiJVyvn6lbHc8TvEjASEc5rjuyfOK37JzYlETj27M3yzpCK_fS8
Message-ID: <CAMKF1somn0UxdPS+Np28cwQtXuc1Zmui7jKnLkP0-BQQK4ZA_A@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH 4/5] python3-dbus-deviation: Add new recipe
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000de0eb0064aaba733"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124374

--000000000000de0eb0064aaba733
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 6:32=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> Add this new recipe for runtime dependence of hotdoc.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...o-donwload-requierment-which-will-ca.patch | 27 +++++++++++++++++++
>  .../python/python3-dbus-deviation_0.6.1.bb    | 20 ++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-t=
rying-to-donwload-requierment-which-will-ca.patch
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-dbus-deviation_0.6.1.bb
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent=
-trying-to-donwload-requierment-which-will-ca.patch
> b/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent=
-trying-to-donwload-requierment-which-will-ca.patch
> new file mode 100644
> index 0000000000..b163db772c
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent=
-trying-to-donwload-requierment-which-will-ca.patch
> @@ -0,0 +1,27 @@
> +Subject: [PATCH] Prevent trying to donwload requierment which will cause
> + network error.
> +
> +'NewConnectionError('<pip._vendor.urllib3.connection.HTTPSConnection
> object at 0x7f1e83062ad0>: Failed to establish a new connection: [Errno -=
3]
> Temporary failure in name resolution')': /simple/setuptools-git/
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + setup.py | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 245193f..d899e4c 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -92,7 +92,6 @@ setuptools.setup(
> +     exclude_package_data=3D{'': ['.gitignore']},
> +     zip_safe=3DTrue,
> +     setup_requires=3D[
> +-        'setuptools_git >=3D 0.3',
>

what are side-effects of removing it ?


> +         'sphinx',
> +     ],
> +     install_requires=3D['lxml'],
> +--
> +2.43.0
> +
> diff --git a/meta-python/recipes-devtools/python/
> python3-dbus-deviation_0.6.1.bb b/meta-python/recipes-devtools/python/
> python3-dbus-deviation_0.6.1.bb
> new file mode 100644
> index 0000000000..e969e85465
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "dbus-deviation is a project for parsing D-Bus introspection
> XML and processing it in various ways"
> +HOMEPAGE =3D "https://tecnocode.co.uk/dbus-deviation/"
> +LICENSE =3D "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D90263a49bc1d9a204656fec4d5616=
c66"
> +
> +SRC_URI[sha256sum] =3D
> "e06b88efe223885d2725df51cf7c9b7b463d1c6f04ea49d4690874318d0eb7a3"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI +=3D
> "file://0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch"
> +
> +DEPENDS +=3D "python3-sphinx-native"
> +
> +do_install:append() {
> +    for ss in $(find ${D}${PYTHON_SITEPACKAGES_DIR} -type f -name
> "*.py"); do
> +        sed -i 's,/usr/bin/python$,/usr/bin/env python3,' "$ss"
> +    done
> +}
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124369):
> https://lists.openembedded.org/g/openembedded-devel/message/124369
> Mute This Topic: https://lists.openembedded.org/mt/117786770/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000de0eb0064aaba733
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 12,=
 2026 at 6:32=E2=80=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;liuyd.fnst=3D<a href=3D"mai=
lto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
dd this new recipe for runtime dependence of hotdoc.<br>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...o-donwload-requierment-which-will-ca.patch | 27 ++++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-dbus-deviation_0.6.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-dbus-deviation_0.6.1.bb</a>=C2=A0 =C2=
=A0 | 20 ++++++++++++++<br>
=C2=A02 files changed, 47 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-dbus-d=
eviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch<br=
>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-dbus-deviation_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-dbus-deviation_0.6.1.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-dbus-deviation/000=
1-Prevent-trying-to-donwload-requierment-which-will-ca.patch b/meta-python/=
recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwl=
oad-requierment-which-will-ca.patch<br>
new file mode 100644<br>
index 0000000000..b163db772c<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Preve=
nt-trying-to-donwload-requierment-which-will-ca.patch<br>
@@ -0,0 +1,27 @@<br>
+Subject: [PATCH] Prevent trying to donwload requierment which will cause<b=
r>
+ network error.<br>
+<br>
+&#39;NewConnectionError(&#39;&lt;pip._vendor.urllib3.connection.HTTPSConne=
ction object at 0x7f1e83062ad0&gt;: Failed to establish a new connection: [=
Errno -3] Temporary failure in name resolution&#39;)&#39;: /simple/setuptoo=
ls-git/<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" ta=
rget=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt; <br>
+---<br>
+ setup.py | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+index 245193f..d899e4c 100755<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -92,7 +92,6 @@ setuptools.setup(<br>
+=C2=A0 =C2=A0 =C2=A0exclude_package_data=3D{&#39;&#39;: [&#39;.gitignore&#=
39;]},<br>
+=C2=A0 =C2=A0 =C2=A0zip_safe=3DTrue,<br>
+=C2=A0 =C2=A0 =C2=A0setup_requires=3D[<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;setuptools_git &gt;=3D 0.3&#39;,<br></bl=
ockquote><div><br></div><div>what are side-effects of removing it ?</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sphinx&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0],<br>
+=C2=A0 =C2=A0 =C2=A0install_requires=3D[&#39;lxml&#39;],<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
dbus-deviation_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-=
deviation_0.6.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-dbus-deviation_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-dbus-deviation_0.6.1.bb</a><br>
new file mode 100644<br>
index 0000000000..e969e85465<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-dbus-de=
viation_0.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-dbus-deviati=
on_0.6.1.bb</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;dbus-deviation is a project for parsing D-Bus introspect=
ion XML and processing it in various ways&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://tecnocode.co.uk/dbus-deviation/" rel=
=3D"noreferrer" target=3D"_blank">https://tecnocode.co.uk/dbus-deviation/</=
a>&quot;<br>
+LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D90263a49bc1d9a204656fec4d5=
616c66&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;e06b88efe223885d2725df51cf7c9b7b463d1c6f04ea4=
9d4690874318d0eb7a3&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI +=3D &quot;file://0001-Prevent-trying-to-donwload-requierment-whic=
h-will-ca.patch&quot;<br>
+<br>
+DEPENDS +=3D &quot;python3-sphinx-native&quot;<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 for ss in $(find ${D}${PYTHON_SITEPACKAGES_DIR} -type f -nam=
e &quot;*.py&quot;); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,/usr/bin/python$,/usr/bin/env py=
thon3,&#39; &quot;$ss&quot;<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124369): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124369" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124369</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117786770/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117786770/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000de0eb0064aaba733--

