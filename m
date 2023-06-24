Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6B3EB64DA
	for <webhook@archiver.kernel.org>; Sat, 24 Jun 2023 14:11:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.17039.1687615895163363498
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jun 2023 07:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QNeYJpSt;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3113306a595so1925508f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jun 2023 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687615893; x=1690207893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jp6Q18Y4j5t8QLQJ+ZP/WEka74qfcR2rCmFOElOREwE=;
        b=QNeYJpStiPEbigVzsavGMrhwKdOS7t1S6nQvyMsDZK5c1jT6MUxPgT2D7rt2utTrQf
         EP9QGzt4dfKqxO3KrMZISatxST+gJ11f9c7J5oJaHwPWmHRigeb7Gpn7YZ0jEohBwjZD
         qyS/nOBRMO5GHbe2XFwXsOl/PaTPFtDy+nDturbrhFS2AnPhRPckBlHCm/3Rqw5cMT2X
         Eieq+hVknn8VX6KVVY3qVLuCGI1JcA0uLwMTWeHZ8pUK8QTXlzqqK6qzqT8SG3sdy+H7
         rx8iywi7eVbfu5//YfAGJAbxf0RHV7L6Yw8rXzggGd3WmZPTpxg4AQSPGvOAuzheceSx
         jSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687615893; x=1690207893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jp6Q18Y4j5t8QLQJ+ZP/WEka74qfcR2rCmFOElOREwE=;
        b=Bg4CTSQfY0OQFmgiOAmWCH6ydgZrEZfJvnYDfikV2bJCb2yoAxu/PIJfIUZXeURi6p
         LKizj77g76AGlEbtyVakB/li1smALbsSruZJurx+47ReSlWlG32woIesPcllCJ2GJI1S
         dPSfDRVShrZ2MtQ58ETl/nzNJ/QcBsOsyjb6QSognlfv3qdBabBv7cDqxSNJ6WrJShds
         ffJqOmvasIuGoQuC2/Itnlex5077XD2NgU6g5VeCW/21OTycGTzjbN125G8mLi9jo7kX
         tXlfOLJki0WgCG9L/a+oD2BacYPtgWPqe11M1PWSeJCBnBnr54FxxeTm6T3AEBosg6Qa
         Nx2A==
X-Gm-Message-State: AC+VfDyiFYwaN/Y7wpkkD/tIZ7YtGAPud7dGWdEI+bHr/d25rK/+m/Gk
	m6fi3yuo+0Nf99VBndxY1sc11AXIDdn11+DcKes=
X-Google-Smtp-Source: ACHHUZ4X8idsEHbYuNvMZu9toMkJXclLXuGqnF2gGJVwoRSCc7ABgwWiELbqQWXHJXvbhsjCPOU0mLajEIaOKMv1xg8=
X-Received: by 2002:adf:cf02:0:b0:2ff:6906:7169 with SMTP id
 o2-20020adfcf02000000b002ff69067169mr19892304wrj.68.1687615892935; Sat, 24
 Jun 2023 07:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230510134849.562209-1-narpat.mali@windriver.com>
In-Reply-To: <20230510134849.562209-1-narpat.mali@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 24 Jun 2023 16:11:22 +0200
Message-ID: <CA+chaQe7hfFSzZHbSkhDA2qN9dSd8tdr5oAjWTJj5rZqqa1MQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/1] python3-werkzeug: fix for CVE-2023-23934
To: narpat.mali@windriver.com
Cc: openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com
Content-Type: multipart/alternative; boundary="000000000000d0d85b05fee0b10b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jun 2023 14:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103558

--000000000000d0d85b05fee0b10b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This change is now merged in kirkstone and causes:

ERROR: python3-werkzeug-2.1.1-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-23934.patch
patching file CHANGES.rst
Hunk #1 succeeded at 6 with fuzz 2 (offset 5 lines).
patching file src/werkzeug/_internal.py
patching file src/werkzeug/http.py
patching file tests/test_http.py


The context lines in the patches can be updated with devtool:

    devtool modify python3-werkzeug
    devtool finish --force-patch-refresh python3-werkzeug <layer_path>

Don't forget to review changes done by devtool!

ERROR: python3-werkzeug-2.1.1-r0 do_patch: QA Issue: Patch log
indicates that patches do not apply cleanly. [patch-fuzz]


Please send follow-up patch to fix patch-fuzz.


On Wed, May 10, 2023 at 4:16=E2=80=AFPM Narpat Mali via lists.openembedded.=
org
<narpat.mali=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Narpat Mali <narpat.mali@windriver.com>
>
> Werkzeug is a comprehensive WSGI web application library. Browsers may
> allow
> "nameless" cookies that look like `=3Dvalue` instead of `key=3Dvalue`. A
> vulnerable
> browser may allow a compromised application on an adjacent subdomain to
> exploit
> this to set a cookie like `=3D__Host-test=3Dbad` for another subdomain.
> Werkzeug
> prior to 2.2.3 will parse the cookie `=3D__Host-test=3Dbad` as
> __Host-test=3Dbad`.
> If a Werkzeug application is running next to a vulnerable or malicious
> subdomain
> which sets such a cookie using a vulnerable browser, the Werkzeug
> application
> will see the bad cookie value but the valid cookie key. The issue is fixe=
d
> in
> Werkzeug 2.2.3.
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  .../python3-werkzeug/CVE-2023-23934.patch     | 116 ++++++++++++++++++
>  .../python/python3-werkzeug_2.1.1.bb          |   2 +
>  2 files changed, 118 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.pat=
ch
> b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.pat=
ch
> new file mode 100644
> index 0000000000..0be97d2888
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.pat=
ch
> @@ -0,0 +1,116 @@
> +From b070a40ebbd89d88f4d8144a6ece017d33604d00 Mon Sep 17 00:00:00 2001
> +From: David Lord <davidism@gmail.com>
> +Date: Wed, 10 May 2023 11:33:18 +0000
> +Subject: [PATCH] Merge pull request from GHSA-px8h-6qxv-m22q
> +
> +don't strip leading `=3D` when parsing cookie
> +
> +"src/werkzeug/sansio/http.py" file is not available in the current recip=
e
> +version 2.1.1 and this has been introduced from 2.2.0 version. Before
> 2.2.0
> +version, this http.py file was only available in the
> "src/werkzeug/http.py"
> +and we could see the same functions available there which are getting
> modified
> +in the CVE fix commit. Hence, modifying the same at
> "src/werkzeug/http.py" file.
> +
> +CVE: CVE-2023-23934
> +
> +Upstream-Status: Backport [
> https://github.com/pallets/werkzeug/commit/cf275f42acad1b5950c50ffe8ef58f=
e62cdce028
> ]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + CHANGES.rst               |  4 ++++
> + src/werkzeug/_internal.py | 13 +++++++++----
> + src/werkzeug/http.py      |  4 ----
> + tests/test_http.py        |  4 +++-
> + 4 files changed, 16 insertions(+), 9 deletions(-)
> +
> +diff --git a/CHANGES.rst b/CHANGES.rst
> +index a351d7c..23505d3 100644
> +--- a/CHANGES.rst
> ++++ b/CHANGES.rst
> +@@ -1,5 +1,9 @@
> + .. currentmodule:: werkzeug
> +
> ++-   A cookie header that starts with ``=3D`` is treated as an empty key
> and discarded,
> ++    rather than stripping the leading ``=3D=3D``.
> ++
> ++
> + Version 2.1.1
> + -------------
> +
> +diff --git a/src/werkzeug/_internal.py b/src/werkzeug/_internal.py
> +index a8b3523..d6290ba 100644
> +--- a/src/werkzeug/_internal.py
> ++++ b/src/werkzeug/_internal.py
> +@@ -34,7 +34,7 @@ _quote_re =3D re.compile(rb"[\\].")
> + _legal_cookie_chars_re =3D
> rb"[\w\d!#%&\'~_`><@,:/\$\*\+\-\.\^\|\)\(\?\}\{\=3D]"
> + _cookie_re =3D re.compile(
> +     rb"""
> +-    (?P<key>[^=3D;]+)
> ++    (?P<key>[^=3D;]*)
> +     (?:\s*=3D\s*
> +         (?P<val>
> +             "(?:[^\\"]|\\.)*" |
> +@@ -382,16 +382,21 @@ def _cookie_parse_impl(b: bytes) ->
> t.Iterator[t.Tuple[bytes, bytes]]:
> +     """Lowlevel cookie parsing facility that operates on bytes."""
> +     i =3D 0
> +     n =3D len(b)
> ++    b +=3D b";"
> +
> +     while i < n:
> +-        match =3D _cookie_re.search(b + b";", i)
> ++        match =3D _cookie_re.match(b, i)
> ++
> +         if not match:
> +             break
> +
> +-        key =3D match.group("key").strip()
> +-        value =3D match.group("val") or b""
> +         i =3D match.end(0)
> ++        key =3D match.group("key").strip()
> ++
> ++        if not key:
> ++            continue
> +
> ++        value =3D match.group("val") or b""
> +         yield key, _cookie_unquote(value)
> +
> +
> +diff --git a/src/werkzeug/http.py b/src/werkzeug/http.py
> +index 9369900..ae133e3 100644
> +--- a/src/werkzeug/http.py
> ++++ b/src/werkzeug/http.py
> +@@ -1205,10 +1205,6 @@ def parse_cookie(
> +     def _parse_pairs() -> t.Iterator[t.Tuple[str, str]]:
> +         for key, val in _cookie_parse_impl(header):  # type: ignore
> +             key_str =3D _to_str(key, charset, errors,
> allow_none_charset=3DTrue)
> +-
> +-            if not key_str:
> +-                continue
> +-
> +             val_str =3D _to_str(val, charset, errors,
> allow_none_charset=3DTrue)
> +             yield key_str, val_str
> +
> +diff --git a/tests/test_http.py b/tests/test_http.py
> +index 5936bfa..59cc179 100644
> +--- a/tests/test_http.py
> ++++ b/tests/test_http.py
> +@@ -427,7 +427,8 @@ class TestHTTPUtility:
> +     def test_parse_cookie(self):
> +         cookies =3D http.parse_cookie(
> +             "dismiss-top=3D6; CP=3Dnull*;
> PHPSESSID=3D0a539d42abc001cdc762809248d4beed;"
> +-            'a=3D42; b=3D"\\";"; ; fo234{=3Dbar;blub=3DBlah; "__Secure-=
c"=3Dd'
> ++            'a=3D42; b=3D"\\";"; ; fo234{=3Dbar;blub=3DBlah; "__Secure-=
c"=3Dd;'
> ++            "=3D=3D__Host-eq=3Dbad;__Host-eq=3Dgood;"
> +         )
> +         assert cookies.to_dict() =3D=3D {
> +             "CP": "null*",
> +@@ -438,6 +439,7 @@ class TestHTTPUtility:
> +             "fo234{": "bar",
> +             "blub": "Blah",
> +             '"__Secure-c"': "d",
> ++            "__Host-eq": "good",
> +         }
> +
> +     def test_dump_cookie(self):
> +--
> +2.40.0
> diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.b=
b
> b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
> index 476a3a5964..ca8705146e 100644
> --- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
> @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462"
>
>  PYPI_PACKAGE =3D "Werkzeug"
>
> +SRC_URI +=3D "file://CVE-2023-23934.patch"
> +
>  SRC_URI[sha256sum] =3D
> "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
>
>  inherit pypi setuptools3
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102533):
> https://lists.openembedded.org/g/openembedded-devel/message/102533
> Mute This Topic: https://lists.openembedded.org/mt/98806142/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d0d85b05fee0b10b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre style=3D"color:rgb(0,0,0)">This change is now merged =
in kirkstone and causes:</pre><pre style=3D"color:rgb(0,0,0)">ERROR: python=
3-werkzeug-2.1.1-r0 do_patch: Fuzz detected:

Applying patch CVE-2023-23934.patch
patching file CHANGES.rst
Hunk #1 succeeded at 6 with fuzz 2 (offset 5 lines).
patching file src/werkzeug/_internal.py
patching file src/werkzeug/http.py
patching file tests/test_http.py


The context lines in the patches can be updated with devtool:

    devtool modify python3-werkzeug
    devtool finish --force-patch-refresh python3-werkzeug &lt;layer_path&gt=
;

Don&#39;t forget to review changes done by devtool!

ERROR: python3-werkzeug-2.1.1-r0 do_patch: QA Issue: Patch log indicates th=
at patches do not apply cleanly. [patch-fuzz]</pre><pre style=3D"color:rgb(=
0,0,0)"><br></pre><pre style=3D"color:rgb(0,0,0)">Please send follow-up pat=
ch to fix patch-fuzz.</pre></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, May 10, 2023 at 4:16=E2=80=AFPM Narpat M=
ali via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;narpat.mali=3D<a href=3D"mailto:windriver.com@lists.openembedded.org"=
>windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">From: Narpat Mali &lt;<a href=3D"mailt=
o:narpat.mali@windriver.com" target=3D"_blank">narpat.mali@windriver.com</a=
>&gt;<br>
<br>
Werkzeug is a comprehensive WSGI web application library. Browsers may allo=
w<br>
&quot;nameless&quot; cookies that look like `=3Dvalue` instead of `key=3Dva=
lue`. A vulnerable<br>
browser may allow a compromised application on an adjacent subdomain to exp=
loit<br>
this to set a cookie like `=3D__Host-test=3Dbad` for another subdomain. Wer=
kzeug<br>
prior to 2.2.3 will parse the cookie `=3D__Host-test=3Dbad` as __Host-test=
=3Dbad`.<br>
If a Werkzeug application is running next to a vulnerable or malicious subd=
omain<br>
which sets such a cookie using a vulnerable browser, the Werkzeug applicati=
on<br>
will see the bad cookie value but the valid cookie key. The issue is fixed =
in<br>
Werkzeug 2.2.3.<br>
<br>
Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../python3-werkzeug/CVE-2023-23934.patch=C2=A0 =C2=A0 =C2=A0| 116 ++=
++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-werkzeug_2.1.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-werkzeug_2.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A02 files changed, 118 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-werkze=
ug/CVE-2023-23934.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-=
23934.patch b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023=
-23934.patch<br>
new file mode 100644<br>
index 0000000000..0be97d2888<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-werkzeug/CVE-2023-23934.p=
atch<br>
@@ -0,0 +1,116 @@<br>
+From b070a40ebbd89d88f4d8144a6ece017d33604d00 Mon Sep 17 00:00:00 2001<br>
+From: David Lord &lt;<a href=3D"mailto:davidism@gmail.com" target=3D"_blan=
k">davidism@gmail.com</a>&gt;<br>
+Date: Wed, 10 May 2023 11:33:18 +0000<br>
+Subject: [PATCH] Merge pull request from GHSA-px8h-6qxv-m22q<br>
+<br>
+don&#39;t strip leading `=3D` when parsing cookie<br>
+<br>
+&quot;src/werkzeug/sansio/http.py&quot; file is not available in the curre=
nt recipe<br>
+version 2.1.1 and this has been introduced from 2.2.0 version. Before 2.2.=
0<br>
+version, this http.py file was only available in the &quot;src/werkzeug/ht=
tp.py&quot;<br>
+and we could see the same functions available there which are getting modi=
fied<br>
+in the CVE fix commit. Hence, modifying the same at &quot;src/werkzeug/htt=
p.py&quot; file.<br>
+<br>
+CVE: CVE-2023-23934<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/pallets/werkzeug/=
commit/cf275f42acad1b5950c50ffe8ef58fe62cdce028" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/pallets/werkzeug/commit/cf275f42acad1b5950c5=
0ffe8ef58fe62cdce028</a>]<br>
+<br>
+Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com=
" target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
+---<br>
+ CHANGES.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 4 ++++<br>
+ src/werkzeug/_internal.py | 13 +++++++++----<br>
+ src/werkzeug/http.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ----<br>
+ tests/test_http.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
+ 4 files changed, 16 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/CHANGES.rst b/CHANGES.rst<br>
+index a351d7c..23505d3 100644<br>
+--- a/CHANGES.rst<br>
++++ b/CHANGES.rst<br>
+@@ -1,5 +1,9 @@<br>
+ .. currentmodule:: werkzeug<br>
+<br>
++-=C2=A0 =C2=A0A cookie header that starts with ``=3D`` is treated as an e=
mpty key and discarded,<br>
++=C2=A0 =C2=A0 rather than stripping the leading ``=3D=3D``.<br>
++<br>
++<br>
+ Version 2.1.1<br>
+ -------------<br>
+<br>
+diff --git a/src/werkzeug/_internal.py b/src/werkzeug/_internal.py<br>
+index a8b3523..d6290ba 100644<br>
+--- a/src/werkzeug/_internal.py<br>
++++ b/src/werkzeug/_internal.py<br>
+@@ -34,7 +34,7 @@ _quote_re =3D re.compile(rb&quot;[\\].&quot;)<br>
+ _legal_cookie_chars_re =3D rb&quot;[\w\d!#%&amp;\&#39;~_`&gt;&lt;@,:/\$\*=
\+\-\.\^\|\)\(\?\}\{\=3D]&quot;<br>
+ _cookie_re =3D re.compile(<br>
+=C2=A0 =C2=A0 =C2=A0rb&quot;&quot;&quot;<br>
+-=C2=A0 =C2=A0 (?P&lt;key&gt;[^=3D;]+)<br>
++=C2=A0 =C2=A0 (?P&lt;key&gt;[^=3D;]*)<br>
+=C2=A0 =C2=A0 =C2=A0(?:\s*=3D\s*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(?P&lt;val&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;(?:[^\\&quot;]|\\.)*=
&quot; |<br>
+@@ -382,16 +382,21 @@ def _cookie_parse_impl(b: bytes) -&gt; t.Iterator[t.=
Tuple[bytes, bytes]]:<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Lowlevel cookie parsing facility tha=
t operates on bytes.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0i =3D 0<br>
+=C2=A0 =C2=A0 =C2=A0n =3D len(b)<br>
++=C2=A0 =C2=A0 b +=3D b&quot;;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0while i &lt; n:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D _cookie_re.search(b + b&quot;;&quot=
;, i)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D _cookie_re.match(b, i)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not match:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D match.group(&quot;key&quot;).strip()<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D match.group(&quot;val&quot;) or b&q=
uot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D match.end(0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D match.group(&quot;key&quot;).strip()<=
br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not key:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D match.group(&quot;val&quot;) or b&q=
uot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield key, _cookie_unquote(value)<br>
+<br>
+<br>
+diff --git a/src/werkzeug/http.py b/src/werkzeug/http.py<br>
+index 9369900..ae133e3 100644<br>
+--- a/src/werkzeug/http.py<br>
++++ b/src/werkzeug/http.py<br>
+@@ -1205,10 +1205,6 @@ def parse_cookie(<br>
+=C2=A0 =C2=A0 =C2=A0def _parse_pairs() -&gt; t.Iterator[t.Tuple[str, str]]=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for key, val in _cookie_parse_impl(heade=
r):=C2=A0 # type: ignore<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0key_str =3D _to_str(key, c=
harset, errors, allow_none_charset=3DTrue)<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not key_str:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val_str =3D _to_str(val, c=
harset, errors, allow_none_charset=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield key_str, val_str<br>
+<br>
+diff --git a/tests/test_http.py b/tests/test_http.py<br>
+index 5936bfa..59cc179 100644<br>
+--- a/tests/test_http.py<br>
++++ b/tests/test_http.py<br>
+@@ -427,7 +427,8 @@ class TestHTTPUtility:<br>
+=C2=A0 =C2=A0 =C2=A0def test_parse_cookie(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cookies =3D http.parse_cookie(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;dismiss-top=3D6; CP=
=3Dnull*; PHPSESSID=3D0a539d42abc001cdc762809248d4beed;&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;a=3D42; b=3D&quot;\\&quot;=
;&quot;; ; fo234{=3Dbar;blub=3DBlah; &quot;__Secure-c&quot;=3Dd&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;a=3D42; b=3D&quot;\\&quot;=
;&quot;; ; fo234{=3Dbar;blub=3DBlah; &quot;__Secure-c&quot;=3Dd;&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=3D=3D__Host-eq=3Dbad;__H=
ost-eq=3Dgood;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert cookies.to_dict() =3D=3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;CP&quot;: &quot;null=
*&quot;,<br>
+@@ -438,6 +439,7 @@ class TestHTTPUtility:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;fo234{&quot;: &quot;=
bar&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;blub&quot;: &quot;Bl=
ah&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&quot;__Secure-c&quot=
;&#39;: &quot;d&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;__Host-eq&quot;: &quot;go=
od&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0def test_dump_cookie(self):<br>
+--<br>
+2.40.0<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
werkzeug_2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-werkzeug_2.=
1.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
werkzeug_2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-werkzeug_2.=
1.1.bb</a><br>
index 476a3a5964..ca8705146e 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-werkzeu=
g_2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-werkzeug_2.1.1.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-werkzeu=
g_2.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-werkzeug_2.1.1.bb<=
/a><br>
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.rst;md5=3D5dc88=
300786f1c214c1e9827a5229462&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Werkzeug&quot;<br>
<br>
+SRC_URI +=3D &quot;file://CVE-2023-23934.patch&quot;<br>
+<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;f8e89a20aeabbe8a893c24a461d3ee5dad2123b0=
5cc6abd73ceed01d39c3ae74&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#102533): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/102533" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/102533</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98806142/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98806142/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d0d85b05fee0b10b--

