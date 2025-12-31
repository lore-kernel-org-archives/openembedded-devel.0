Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BADEE644C
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 16:28:33 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88149.1767198509020514230
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Dec 2025 08:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cXhdKwWv;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fdb90b670so66158777b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767198508; x=1767803308; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YJEWsKjIB5q1X/0hYAPzHwQ8fXjBS0apk3Z06WzIk4w=;
        b=cXhdKwWvVPyawaABD3jP9blNJ/erlZZyEMonYx3/hzfUydiPbDogTARiHtbN9x3HkB
         nZMgxzEhEutiuS4UzbZ9w0izuE5ZUbIQIbJug8B5oWT46fuNNbXW60i5hPoasGUylSzI
         ZvJf+b8crCOrCARWOHsvCr3Xif6HhSI0UfjfSBt/2f9+RIGsL48Mzz3hD7VjTQDMrSXf
         N0CkRYjoOJQc3NZL9rTv9NQep29EByWfLCmF/UCoKOFbJmAkQIrrPyh3F/cMKAdc+5B7
         gcp0lztAsUbY2d5H6HUmhAq9I0HnwODuV9P2ORlsdrKcGRvU7OYYOi2/L7fWQcfxOZ4H
         h/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767198508; x=1767803308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJEWsKjIB5q1X/0hYAPzHwQ8fXjBS0apk3Z06WzIk4w=;
        b=Yi6WJQkNKwbEjpSHMU0Fa2G4lU6roaFsdE8KrbGctsaKFzwbXH0WiChxLB7it7zql+
         7fB4zT5qerupJJ0jslDTAC3hxEVGDIiJgh4odXQQfOny9WyXJKZ27e0aTgayGAQC6E3m
         ol/jDmXYiIdXbsLKUhJxxs4eEvoPTFLdWOEep1WH4G5cvvdDb75V4Yk6/SaNSr2b0k1a
         tSE4ikxjf2ycKzuoIql8tVNP/472ktZfMsqDMk7/IpxtLYwcsXN3qTe80vMgCqh5qjoH
         e/023JJB92cndt5uuAkzW51dDtvucshN2MPNlhf2BI9pdgraQmsbw8Jg8ZY2ihAHPErI
         qm3w==
X-Gm-Message-State: AOJu0YyMEJFrHU2fI/LIr9JKEJPXgNGZVi+eoENQsQSW4+aG3FQUoEDJ
	YMXYdV0q+S0d1OobNxB0EMUaq7z5Yrs6MEfxkj4kR53YobOle1l9xnOMV0+watlGPZBSJmywP9O
	iB8Tn2w4qF3PE+doJPC9aY28fNHsTrQc=
X-Gm-Gg: AY/fxX5ls93LDnu+gf2ElVRzbM5kMmrih74pUYh1QwHM+4kOfH6H8BiHO14PjUVkywE
	krvH5o5XN7cqKVJuUKPK37ouKd1CniNwpyFyg/fj4pW61QFOjktcemSz6Kb6DG5/LGsZu1+wW/B
	p9nmRbWKQP2DzZGP8Cn7g2e8pgw3ciU/6J/lEPa9ZR3FO7PVEUEtN8eocdpB2DrbwCnzoYt83QP
	leAo9IJpzyFWS9dsaXOtxkimO10FdeTpTteVHWrhlImy6FVfqEvcfif1CGxmFiUrJhzeZqPfl8L
	kfLYKJRxPUi46oPsF1kck1cIk23VOb+fbriIeVKK7/xLW77B1fsFsGnvgh+S/97PobUpeT3nGtc
	SsjF2GtnwXkfK8eEPkioZLA==
X-Google-Smtp-Source: AGHT+IEN2OQY8k/rj2vaPhy8byeeRGlmPrypRYjVd6o/D4TbHsl407Nt3QBS978pDR8O4cBnUsqHNXFJWKEQ4/X3P3w=
X-Received: by 2002:a05:690c:490d:b0:78f:ad0b:245d with SMTP id
 00721157ae682-78fb41c6ab2mr321396067b3.62.1767198507979; Wed, 31 Dec 2025
 08:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20251229092936.1483-1-wangmy@fujitsu.com> <20251229092936.1483-4-wangmy@fujitsu.com>
In-Reply-To: <20251229092936.1483-4-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Dec 2025 08:28:01 -0800
X-Gm-Features: AQt7F2rtNZWYD6akHTQ9cUo5nJi6IZgyAOB8nV6JekRRJcygBldW3jV5sGHsoxA
Message-ID: <CAMKF1sqmzs+B3YdhGY=6xSoDe7zUXQpxNwX6b5_c1+bnU2dbBw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 04/10] python3-bleak: upgrade 2.0.0 -> 2.1.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000050d95e064741f779"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 16:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123080

--00000000000050d95e064741f779
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

its failing ptests, it seems to need bumble module now. I do have local
patches to add the recipe for bumble but that does not solve the problem
with ptest failures here.

On Mon, Dec 29, 2025 at 1:29=E2=80=AFAM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Added bluez parameter to BleakClient.start_notify() to allow forcing
> using
>   "StartNotify" instead of "AcquireNotify" on BlueZ backend.
> - Added bleak.args.SizedBuffer type for better type hinting of buffer
> protocol
>   parameters.
> - Fixed calling logging.debug() in WinRT backend.
> - Fixed calling logging.warning() in BlueZ backend.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-bleak_2.0.0.bb =3D> python3-bleak_2.1.0.bb}   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-bleak_2.0.0.bb =3D>
> python3-bleak_2.1.0.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
> b/meta-python/recipes-devtools/python/python3-bleak_2.1.0.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-bleak_2.1.0.bb
> index 161b21b88c..1825a45843 100644
> --- a/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-bleak_2.1.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/hbldh/bleak"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbcbc2069a86cba1b5e47253679f66=
ed7"
>
> -SRCREV =3D "718e5d76cd051910a9d5266266af632c2529c03c"
> +SRCREV =3D "3ddfc34c66c42631d1d194b8f65854f5f1141849"
>  PYPI_SRC_URI =3D "git://
> github.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop;destsuffix=
=3D${S}
> <http://github.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop;dest=
suffix=3D$%7BS%7D>
> "
>
>  inherit pypi python_poetry_core ptest-python-pytest
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122968):
> https://lists.openembedded.org/g/openembedded-devel/message/122968
> Mute This Topic: https://lists.openembedded.org/mt/116981940/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000050d95e064741f779
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">its failing ptests, it seems to need bumble module now. I =
do have local patches to add the recipe for bumble but that does not solve =
the problem with ptest failures here.</div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 29, =
2025 at 1:29=E2=80=AFAM wangmy via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lis=
ts.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &l=
t;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.co=
m</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- Added bluez parameter to BleakClient.start_notify() to allow forcing usin=
g<br>
=C2=A0 &quot;StartNotify&quot; instead of &quot;AcquireNotify&quot; on Blue=
Z backend.<br>
- Added bleak.args.SizedBuffer type for better type hinting of buffer proto=
col<br>
=C2=A0 parameters.<br>
- Fixed calling logging.debug() in WinRT backend.<br>
- Fixed calling logging.warning() in BlueZ backend.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-bleak_2.0.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-bleak_2.0.0.bb</a> =3D&gt; <a href=3D"http://=
python3-bleak_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_=
2.1.0.bb</a>}=C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-bleak_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_2.0.0.b=
b</a> =3D&gt; <a href=3D"http://python3-bleak_2.1.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-bleak_2.1.0.bb</a>} (91%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
bleak_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_2.0.0.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-bleak_=
2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_2.1.0.bb</a><b=
r>
similarity index 91%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-b=
leak_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_2.0.0.bb<=
/a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-ble=
ak_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_2.1.0.bb</a=
><br>
index 161b21b88c..1825a45843 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-bleak_2=
.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_2.0.0.bb</a><br=
>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-bleak_2=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_2.1.0.bb</a><br=
>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/hbldh/blea=
k" rel=3D"noreferrer" target=3D"_blank">https://github.com/hbldh/bleak</a>&=
quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dbcbc2069a86cba1b5e472=
53679f66ed7&quot;<br>
<br>
-SRCREV =3D &quot;718e5d76cd051910a9d5266266af632c2529c03c&quot;<br>
+SRCREV =3D &quot;3ddfc34c66c42631d1d194b8f65854f5f1141849&quot;<br>
=C2=A0PYPI_SRC_URI =3D &quot;git://<a href=3D"http://github.com/hbldh/bleak=
.git;protocol=3Dhttps;branch=3Ddevelop;destsuffix=3D$%7BS%7D" rel=3D"norefe=
rrer" target=3D"_blank">github.com/hbldh/bleak.git;protocol=3Dhttps;branch=
=3Ddevelop;destsuffix=3D${S}</a>&quot;<br>
<br>
=C2=A0inherit pypi python_poetry_core ptest-python-pytest<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122968): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122968" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122968</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116981940/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116981940/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000050d95e064741f779--

