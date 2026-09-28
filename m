Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EAACA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 18:42:00 +0000 (UTC)
Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65013.1790620914327012688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 11:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZGl05apH;
 spf=pass (domain: gmail.com, ip: 74.125.224.166, mailfrom: alex.kiernan@gmail.com)
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-675617094f5so29729d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 11:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790620913; cv=none;
        d=google.com; s=arc-20260327;
        b=HbDwv+YV2R382yKOtTBnuEoXlWCvjicSY9h0d7s0OQsrX9pzl73fLMaDr1ZbNDy6h9
         PWodmm3ST+O3xOsEPEqcHNFmL9hjC5Jon8W07U3IhizC3jLuni+c32PHPALmdo3r3+3O
         yHL/1snMOkjzqwrjbICcB0Fw2z5qx9ah49LDdJPnG8gd1OmZ3RF4/gocdWvtP7b3eTdu
         4u2iOubev7s8IfWUIvKFdwfZ8MWS4R0sIc3EbsLvE+0QBkxElKiuY5GnTMwPlStQFw/t
         uyg6ADWk0+NYTaiwn3keB5szD4elh/4I90kq6YtbUDX7PnR1MXcR+3IGSgEy5tryT2OT
         sg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=89MTmuCbIPlPqgfulIOMSU+l1BV94SW68ndu16nYuBs=;
        fh=ZLqV144/sAu1AAGeV0lBhRJFi1qAthtro2+/7AGT5z8=;
        b=AeEy5ogSccAqfYL0ic9X1B+yaZUr/W4Z9JUgq9cPZmR017pLKzFVtLB24lkHPNRDLt
         UPWlqe1CxFKA/GzkVSDyiVRgRXn6hb9mwznkd4AEm2BzDyTwWs/OIdcEILfHTJf5wlrX
         NuaUiLI5GoezUxd9RJMw5m/zWuSuvjRWFRwqpH2QziiN5An7oGn51a7Uh6NvLFl4kntm
         s0Et1KZ4nQQGb4my+4JNa+rlw2m1UE5r+i7bivkvKOaFCOHGuofn6llAQLSZKv3sS46R
         3sPKTcXPA5Vflmo+xyoAJKWpNoK8ENZMgYbGemLUI5ZpO2I1xqhcROAoNdJJB4GlYAYm
         lk/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790620913; x=1791225713; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89MTmuCbIPlPqgfulIOMSU+l1BV94SW68ndu16nYuBs=;
        b=ZGl05apHIdLHtrS3Q9jLf+I+SHkP3DXBOgp7YjqGJdcsI2LdFXblX4IHAaaABWKlma
         raxoH/Glb0yb/xNyfTsthTwBmnZzlcrXDKkkqflhatDHe7vIl29iDmjQJyKFkJ2r4cuE
         rqj1RfNQGgjRz75OtInK/7a6fRZbWPeFqeTazkQTS4YvnBhuSgyFe7XTOW7s77Iwvd7P
         JyIWzfeXb5BuPkYn4bisqktOo2edrnybwlHJSz7kq9UYSTs/HUT7P8uQEUPxrYdKYf/z
         ZTiXXcam43xdA/HTpFrnbyPb8NL7FZT1FiEARxr0DImk9bcDd+G/eLujfnfTvL//z3Xj
         R/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620913; x=1791225713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=89MTmuCbIPlPqgfulIOMSU+l1BV94SW68ndu16nYuBs=;
        b=0mf54wIfNtrBr3jVtpbdYa1Czu3tRBmeUH+eVQL5G9IJpPMPDta4bALafGOoimuGlR
         XmhOk9kZOjc2xrfNwcM/ktow15kdfRWrkm4xXhOh5VElDNXvd/RrV1GoZQvWbt7nrLZX
         yrJw1qJQNYr8cAiT6IJFsR7E7DIyAQQQ228cEO4pe5XRekIH8HWQHg20VzKpllx4C50i
         qUrmB/O4G3dBkxGywTjqL11xtkiS5O+njJcH2su9aqAYqKLz3Gnsb7mUqgDt2HArtwYg
         EdgwEr9jEzmzKaU+A1KV1dNnmdt7iqNYm9E0ha/v8jFjF826VyEck+xg4k+SMH/47F8r
         a1Gw==
X-Gm-Message-State: AFq9FYICCNlZ9sNnEqJAOsZMmwqYJPWZMw7+w1io87alNB540DRx3W4f
	9NthJy98WOwjE6O2zf2e4PoShgIZVLltfpI8W/OL1Dw/GbLNFXTRT3vOhdgVHUm/Dq9Wto6Zifz
	sje3Nh0LqgdBDz//msTmDo4JwS0O2Vqm3zQ==
X-Gm-Gg: AYBFou0PzNBEjJ8DyargLYKKz3fy+guAU0WattTamOEktTtaO+i0tQkyMtGwdUkCMB2
	XJgqeBANNb4zJT3mzYkxEy128wWtBll5gUXFCAkUFSLtGhrZewOAUDtlJIYgRkIx+Bk4L3bTTFu
	poviEfTkLJBQNR0GPTc4qHv1bmxOak/tFsMo5wunyveD1iwealWiFK2L+qJdl4hUO+TM2K+M7ht
	FsBKWsV+6QVACXUrhpuG4UzuAFm87UXg0LjFCokTdhtWddBWm7Pt8Qfjba6Ygt5/32OtakwF7k2
	bFG+YS5JiiCE9JfB00iTZoOxgP01HguFiR+sa3LKMc6yoL+JiuNUNA==
X-Received: by 2002:a05:690e:1448:b0:675:3063:481a with SMTP id
 956f58d0204a3-67530634e30mr3321700d50.12.1790620913016; Mon, 28 Sep 2026
 11:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260928092140.2252231-2-alex.kiernan@gmail.com>
 <20260928092140.2252231-4-alex.kiernan@gmail.com> <CAMKF1soRHUQH11fLC9+Dk4aktcT7+wBGASRNX_7Jzhoq9DQ+cA@mail.gmail.com>
In-Reply-To: <CAMKF1soRHUQH11fLC9+Dk4aktcT7+wBGASRNX_7Jzhoq9DQ+cA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 28 Sep 2026 19:41:44 +0100
X-Gm-Features: AclHuK92vPVgf06D3YASDnZRfoJnqWhV7BGruv3IGZQpuSxC__lxC5wAFf53ZQk
Message-ID: <CAO5Uq5TZ=OxMhKmZ5_i0-eygx2wTqQJziARBw2m6APhuUwJ9Yw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-varlink: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000072a665065c8f6bfa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 18:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130469

--00000000000072a665065c8f6bfa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will do. I have a terrible feeling that what I thought I was building
wasn't actually what I submitted as the layer I picked these out of was
still in my bilayers :(


On Mon, 28 Sept 2026, 18:30 Khem Raj, <raj.khem@gmail.com> wrote:

> Can these tests be make to run as part of ptest image framework in this
> layer e.g. Can I execute it as part of meta-python-image-ptest-all
>
> On Mon, Sep 28, 2026 at 2:22=E2=80=AFAM Alex Kiernan via lists.openembedd=
ed.org
> <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Reference Python Varlink binding. Fetched from git as 32.1.0 was never
>> published to PyPI (latest there is 31.0.0 from 2021).
>>
>> AI-Generated: Claude Opus 5 (Claude Code)
>> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> ---
>>  .../packagegroups/packagegroup-meta-python.bb |  1 +
>>  .../python/python3-varlink_32.1.0.bb          | 27 +++++++++++++++++++
>>  2 files changed, 28 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/
>> python3-varlink_32.1.0.bb
>>
>> diff --git a/meta-python/recipes-core/packagegroups/
>> packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/
>> packagegroup-meta-python.bb
>> index 9d07fc44e27a..f84941daf08b 100644
>> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
>> @@ -440,6 +440,7 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
>>      python3-ujson \
>>      python3-unidiff \
>>      python3-uritemplate \
>> +    python3-varlink \
>>      python3-vcversioner \
>>      python3-versioneer \
>>      python3-versiontools \
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-varlink_32.1.0.bb b/meta-python/recipes-devtools/python/
>> python3-varlink_32.1.0.bb
>> new file mode 100644
>> index 000000000000..8c532371d0a2
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb
>> @@ -0,0 +1,27 @@
>> +SUMMARY =3D "Python implementation of the Varlink protocol"
>> +HOMEPAGE =3D "https://github.com/varlink/python"
>> +SECTION =3D "devel/python"
>> +
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D
>> "file://LICENSE.txt;md5=3De3fc50a88d0a364313df4b21ef20c29e"
>> +
>> +# 32.1.0 is not published on PyPI
>> +SRC_URI =3D "git://
>> github.com/varlink/python.git;protocol=3Dhttps;branch=3Dmaster"
>> +SRCREV =3D "8b3ba4e8206b098c524f538036a941b47797840d"
>> +
>> +inherit python_setuptools_build_meta
>> +
>> +# Keep the bundled test suite, and its python3-unittest dependency,
>> separate
>> +PACKAGES =3D+ "${PN}-tests"
>> +FILES:${PN}-tests =3D "${PYTHON_SITEPACKAGES_DIR}/varlink/tests"
>> +RDEPENDS:${PN}-tests =3D "${PN} python3-unittest"
>> +
>> +RDEPENDS:${PN} =3D "\
>> +    python3-core \
>> +    python3-datetime \
>> +    python3-io \
>> +    python3-json \
>> +    python3-netclient \
>> +    python3-netserver \
>> +    python3-shell \
>> +"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#130428):
>> https://lists.openembedded.org/g/openembedded-devel/message/130428
>> Mute This Topic: https://lists.openembedded.org/mt/121468544/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--00000000000072a665065c8f6bfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Will do. I have a terrible feeling that what I thoug=
ht I was building wasn&#39;t actually what I submitted as the layer I picke=
d these out of was still in my bilayers :(</div><div><br></div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, 28 Sept 2026, 18:30 Khem Raj, &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">Can these tests be make to run as part of pt=
est image framework in this layer e.g. Can I execute it as part of=C2=A0met=
a-python-image-ptest-all</div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Sep 28, 2026 at 2:22=E2=80=AFAM Alex Kierna=
n via <a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"no=
referrer">lists.openembedded.org</a> &lt;alex.kiernan=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">gmail=
.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Reference Python Varlink binding. Fetched from g=
it as 32.1.0 was never<br>
published to PyPI (latest there is 31.0.0 from 2021).<br>
<br>
AI-Generated: Claude Opus 5 (Claude Code)<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-python.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">packagegroup-meta-python.bb</a=
> |=C2=A0 1 +<br>
=C2=A0.../python/<a href=3D"http://python3-varlink_32.1.0.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">python3-varlink_32.1.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 27 +++++++++++++++++++<br>
=C2=A02 files changed, 28 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-varlink_32.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">python3-varlink_32.1.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-core/packagegroups/<a href=3D"http://packa=
gegroup-meta-python.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pac=
kagegroup-meta-python.bb</a> b/meta-python/recipes-core/packagegroups/<a hr=
ef=3D"http://packagegroup-meta-python.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">packagegroup-meta-python.bb</a><br>
index 9d07fc44e27a..f84941daf08b 100644<br>
--- a/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packagegro=
up-meta-python.bb</a><br>
+++ b/meta-python/recipes-core/packagegroups/<a href=3D"http://packagegroup=
-meta-python.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">packagegro=
up-meta-python.bb</a><br>
@@ -440,6 +440,7 @@ RDEPENDS:packagegroup-meta-python3 =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-ujson \<br>
=C2=A0 =C2=A0 =C2=A0python3-unidiff \<br>
=C2=A0 =C2=A0 =C2=A0python3-uritemplate \<br>
+=C2=A0 =C2=A0 python3-varlink \<br>
=C2=A0 =C2=A0 =C2=A0python3-vcversioner \<br>
=C2=A0 =C2=A0 =C2=A0python3-versioneer \<br>
=C2=A0 =C2=A0 =C2=A0python3-versiontools \<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
varlink_32.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-=
varlink_32.1.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-varlink_32.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">python3-varlink_32.1.0.bb</a><br>
new file mode 100644<br>
index 000000000000..8c532371d0a2<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-varlink=
_32.1.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-varlink=
_32.1.0.bb</a><br>
@@ -0,0 +1,27 @@<br>
+SUMMARY =3D &quot;Python implementation of the Varlink protocol&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/varlink/python" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://github.com/varlink/python</a=
>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3De3fc50a88d0a364313df4b=
21ef20c29e&quot;<br>
+<br>
+# 32.1.0 is not published on PyPI<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/varlink/python.git;pr=
otocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">github.com/varlink/python.git;protocol=3Dhttps;branch=3Dmaster</a>&quo=
t;<br>
+SRCREV =3D &quot;8b3ba4e8206b098c524f538036a941b47797840d&quot;<br>
+<br>
+inherit python_setuptools_build_meta<br>
+<br>
+# Keep the bundled test suite, and its python3-unittest dependency, separa=
te<br>
+PACKAGES =3D+ &quot;${PN}-tests&quot;<br>
+FILES:${PN}-tests =3D &quot;${PYTHON_SITEPACKAGES_DIR}/varlink/tests&quot;=
<br>
+RDEPENDS:${PN}-tests =3D &quot;${PN} python3-unittest&quot;<br>
+<br>
+RDEPENDS:${PN} =3D &quot;\<br>
+=C2=A0 =C2=A0 python3-core \<br>
+=C2=A0 =C2=A0 python3-datetime \<br>
+=C2=A0 =C2=A0 python3-io \<br>
+=C2=A0 =C2=A0 python3-json \<br>
+=C2=A0 =C2=A0 python3-netclient \<br>
+=C2=A0 =C2=A0 python3-netserver \<br>
+=C2=A0 =C2=A0 python3-shell \<br>
+&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130428): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130428" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/130428</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121468544/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/121468544/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--00000000000072a665065c8f6bfa--

