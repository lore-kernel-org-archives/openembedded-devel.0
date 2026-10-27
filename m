Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27804.1793131347660254751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 13:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MI8/tNPz;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0a921ee46so1907557b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793131346; cv=none;
        d=google.com; s=arc-20260327;
        b=ltBDsjG81qIwMuIgfKcCh7uZtlRKQnyD6e4K0PLMTP0mgJFgE9Fa/Mg1K85cXOPix6
         qe/TgYMEsNOmWKB8UkvcDWJ+V/NAZ8LEsX0GnNHuxQYQnJYpTeHTetP1Q3H1YijAQcFu
         KkJfWdgFOgzw5tXOkdDxc2WRpQU4Bh6XQy0OeGIvsdQR2r5Kmya/dG15eCMaCvIyiKCm
         KGOIZbVg5d5YCFJrNLU48E/Ij/XLrVSKtUnMPRVDfscV5fTpJv4KHy08T6IyLSIJQjsH
         JBFu4+QXXys/3OslZjW78Lss4+cY7pByLdcLbUQUCGYqrgZcSJe5F2jrKiJDhdFQsBlj
         Y8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zCaNqtK7QM2FHrcXLAzYHneSVmRWt+VVwDtcbaeiMWs=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=atqMSig9MYXbN68A30qW414dM8VOcyvOABi0J+xM6geqwul/mCxH7jnJ+qSVBjoy0+
         fsQwFg4xzNgJPbon+yP4fT/ht/mtwo/p0kU22IO1+Iy/W+NIwp9Vtzur7dhAHMxsByjI
         LpIrVTzD3QS/ah9s9ehmXxTj1IUcgfXzHBeUNAtYE9iC+v9SQBlVc4gnPdKOw2Nlyz/h
         TaGjEyPgnsYznaOee3q97G1UItnwL/XX9oX/C5HUsQHrCWd54ZOLbo8zb3m9Jv4VyaYv
         ppQkuux/xBJg6LR4m5AEEp9b5rfd4TXU8Nqot81g7GSxzEeyQVsEcIPpS2KIB2HudU6G
         T1aQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793131346; x=1793736146; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCaNqtK7QM2FHrcXLAzYHneSVmRWt+VVwDtcbaeiMWs=;
        b=MI8/tNPzCafs6sFS7yniLe7zpHK0fScHkNFCd3lALkBmWBGkGVWBmGKyTUZYZTmCtc
         pWeRdUp+sqmxCLh3UvCcdMUTG7i75KCBh2lb7sKVhUavazjVgoUW2GRtmdSwscdpvGKW
         MCPUbz3r2J+I3eAlHeB4cSycTfOpVzg8WbSKLrdAbX/7Bzs/m2ACzfcVFiIJxHt12mxr
         BvH7awLoaPP3dTnpEs2sho5BBbbj9DmnWC5V3dLmWkRDhWGvtd28kJlySOltRmlx490/
         +qy2WG6KZcdJs6T+o6WU3Vsg8b1fawVNZGYcqw3LHn+RCfE/hTL5aRxFUCIEaMIXoSHi
         JfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793131346; x=1793736146;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zCaNqtK7QM2FHrcXLAzYHneSVmRWt+VVwDtcbaeiMWs=;
        b=e2S2Mhm2wsTj+1qXsqgZ41Kqn9uTt/zbYVz88m5yUiSehDJsK41Tm5u/WMPvqVCdkZ
         KIFVS53xIuoJIeNShS2UazQW4dpve4NIiVabBgCqwOWKIZav5XPQrRn3qD0BvE4jEkef
         V+IkWhI6PPKIwoqmpLN5GyfKH7QxJ6TPVnr1UeXBosS6/CQmJ4UohdrnS4Xwu56+oNie
         PeIXemfBQU2RPfmnM7xOn/1kVmDj0G+SOFD8mVTNbOCmJNo/m6rvDw+a0E1+fc8ey+t7
         KtFFk5viyGeB2R6b3sAlcfRDQquI5jD1ByuMBUxTHoB9QoM0Ld3AHveIroaIcMX+CYSE
         VJAg==
X-Gm-Message-State: AFq9FYJYBIhx6RarcMfBjdGwNbfOTqU+IGzcmWU2yk2G3Mr8ypvGJyJC
	jF4lL/zUmJyPYxet3oj63vbitLwwGr0oaCC9lUL58cQDkHyKoxmhrtW+GYHo78yqx3VUdq8F0Fh
	mADmS0sViORxosgUn/CC7D4VVXVpXJz0=
X-Gm-Gg: AYBFou3zgKNRR5fIQFl7ENoQVOnpdHutJ4oCZwsyPzDHqv8KRo+MUC25BLkSKZY4q21
	vE2rA+pmSw9wOBETSjQhOV66MchiMWwVuWq5OQIUcRriOOAVPvYW7HWEifqgYm4LJYWTJn1UCvh
	Vdd2++P1N0Be6667R+C0Yn0cZvWdUCHQyHdXT+iuKJYYrLAw6U3XXnEkQ8PVAKbULuoSatUIfdn
	4WUVELuVCSleiNXgGzkgsX4JJrhwxPNOj+drxy1B74pkb01L7AsmvXKx9pOhpLXzoRvd8leJGbd
	ctPl4CaPR86aCAtjBRY5PM9iolLcEluOoQYdyqR0CaiSfotKFYUQqtQOUpy7mKdPVlvkUqqelef
	BACgDLdpM3Zic1t/pbgDXI8vNHEsZtTN8EUck2phhW7/0ohFqFWZHaMwY7WRsyoJw01ffvjOqRE
	btqqq8aR31Tprv42+JpDZrtNyHMEW3HBqYo2gs+22PmXM+ORA/CvKZwBfcfoKv30g12NkAHfEIb
	YKGcM+IMyKS+WpkMq5Rmn+D36P0dIOWM7V4BA+K04pvZMOpth2J9erZi3y95oL01o/x7a58Qose
	BIrM+xrzv//fs3DdCbgktATWovfAOo6py6r1cmYlqk+0yOW2aQ65QAy6sHAB0Wlm
X-Received: by 2002:a05:690c:11:b0:873:5ddf:d872 with SMTP id
 00721157ae682-8b1b5d1562amr504737b3.61.1793131346204; Tue, 27 Oct 2026
 13:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261027092028.782979-1-leon.anavi@konsulko.com> <20261027092028.782979-10-leon.anavi@konsulko.com>
In-Reply-To: <20261027092028.782979-10-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Oct 2026 13:01:59 -0700
X-Gm-Features: AclHuK8idMZWhM78NiscclpYCrJNyb1PD4i1SkPyIvrrp--biWoioTupaLkTCxw
Message-ID: <CAMKF1sqSs1C=vbqdA4FK-k55h4q9Ku2hjCKDgsj6fy5Lpx27jw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 10/61] python3-multidict: Upgrade 6.7.1
 -> 7.2.1
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ed1b76065ed7eca4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 20:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131544

--000000000000ed1b76065ed7eca4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing ptest failures on qemux86-64

Failed ptests:
{'python3-multidict': ['tests/test_release_notes_md.py:test_main']}

On Tue, Oct 27, 2026 at 2:20=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 7.2.1:
>
> - Fixed a regression in 7.2.0 where a subclass of MultiDictProxy or
>   CIMultiDictProxy that converted its argument in its own
>   __init__() raised TypeError before that __init__() ran; such a
>   subclass got an empty multidict until its __init__() set the
>   proxied one --.
>
> License-Update: Update LICENSE file. The license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...ython3-multidict_6.7.1.bb =3D> python3-multidict_7.2.1.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-multidict_6.7.1.bb
> =3D> python3-multidict_7.2.1.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-multidict_6.7.1.bb b/meta-python/recipes-devtools/python/
> python3-multidict_7.2.1.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-multidict_6.7.1.b=
b
> rename to meta-python/recipes-devtools/python/python3-multidict_7.2.1.bb
> index 15848fefec..895988c725 100644
> --- a/meta-python/recipes-devtools/python/python3-multidict_6.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-multidict_7.2.1.bb
> @@ -1,12 +1,12 @@
>  SUMMARY =3D "Multidicts are useful for working with HTTP headers, URL qu=
ery
> args etc."
> +DESCRIPTION =3D "multidict implementation"
>  HOMEPAGE =3D "https://github.com/aio-libs/multidict/"
> -
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db4fef6e4b0828c2401fb983363985=
b39"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db5e9e27554f71f0f132919037cb96=
7b2"
>
>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>
> -SRC_URI[sha256sum] =3D
> "ec6652a1bee61c53a3e5776b6049172c53b6aaba34f18c9ad04f82712bac623d"
> +SRC_URI[sha256sum] =3D
> "e8af3e6f1bdbc31fd762b094133b478b89988eaebc63cbe82b1d9e3bbd15cede"
>
>  RDEPENDS:${PN}-ptest +=3D " \
>      python3-objgraph \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131474):
> https://lists.openembedded.org/g/openembedded-devel/message/131474
> Mute This Topic: https://lists.openembedded.org/mt/121956749/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ed1b76065ed7eca4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>seeing ptest failures=C2=A0on qemux86-64</div><div><b=
r></div><div>Failed ptests:<br>{&#39;python3-multidict&#39;: [&#39;tests/te=
st_release_notes_md.py:test_main&#39;]}<br></div></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Oct 27, 2026 at 2:20=E2=80=AFAM Leon Anavi via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D"ma=
ilto:konsulko.com@lists.openembedded.org">konsulko.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Upgrade to release 7.2.1:<br>
<br>
- Fixed a regression in 7.2.0 where a subclass of MultiDictProxy or<br>
=C2=A0 CIMultiDictProxy that converted its argument in its own<br>
=C2=A0 __init__() raised TypeError before that __init__() ran; such a<br>
=C2=A0 subclass got an empty multidict until its __init__() set the<br>
=C2=A0 proxied one --.<br>
<br>
License-Update: Update LICENSE file. The license remains the same.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ython3-multidict_6.7.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ython3-multidict_6.7.1.bb</a> =3D&gt; <a href=3D"http://pyt=
hon3-multidict_7.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-multi=
dict_7.2.1.bb</a>} | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-multidict_6.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-multidict=
_6.7.1.bb</a> =3D&gt; <a href=3D"http://python3-multidict_7.2.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-multidict_7.2.1.bb</a>} (65%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
multidict_6.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-multidict_=
6.7.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-multidict_7.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-multidic=
t_7.2.1.bb</a><br>
similarity index 65%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-m=
ultidict_6.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-multidict_6=
.7.1.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-mul=
tidict_7.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-multidict_7.2=
.1.bb</a><br>
index 15848fefec..895988c725 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-multidi=
ct_6.7.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-multidict_6.7.1.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-multidi=
ct_7.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-multidict_7.2.1.b=
b</a><br>
@@ -1,12 +1,12 @@<br>
=C2=A0SUMMARY =3D &quot;Multidicts are useful for working with HTTP headers=
, URL query args etc.&quot;<br>
+DESCRIPTION =3D &quot;multidict implementation&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/aio-libs/multidict/"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/aio-libs/multidict=
/</a>&quot;<br>
-<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db4fef6e4b0828c2401fb983363=
985b39&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db5e9e27554f71f0f132919037c=
b967b2&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
<br>
-SRC_URI[sha256sum] =3D &quot;ec6652a1bee61c53a3e5776b6049172c53b6aaba34f18=
c9ad04f82712bac623d&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e8af3e6f1bdbc31fd762b094133b478b89988eaebc63c=
be82b1d9e3bbd15cede&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-objgraph \<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131474): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131474" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131474</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121956749/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121956749/1997914</a><br>
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

--000000000000ed1b76065ed7eca4--
