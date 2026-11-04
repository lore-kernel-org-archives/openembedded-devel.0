Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14882.1793813394938170707
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 09:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=etzsE2La;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0dba37a7fso9256007b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 09:29:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793813394; cv=none;
        d=google.com; s=arc-20260327;
        b=f6O+qBHnqxMVIGrHzOppUK2Bd7iSz+Fsyrf2UTbbJR3mIKA9YmOPLVbMffm1si73I5
         BWoIeXz5yyFoAzgVsPgMYHmRNcVUENy+h7vO/kj3MKruahG6I77f235bdNDwC0PU1W/f
         RF4NPZvfaFg6UMfgOYigrO4glaly1/J8KM9FZMclQWQA7amBt3BIvXgydTV+bZJ7COpE
         LMwoFEpLFzTW4Uw8hc7It4NUnGpsHsIjw7ejZ7VSsPkVgcjDzdXuCqibOOERhSApfxEC
         V9gv7sl0RMKl17pZYC6BZQqJS2451rZR8TfJoJET2B+wdNSdcvSvcWuSNaLlA0mcbY1P
         NuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ItFFvObtAvjLENS1Mt/wkdu9TiwBCB6wfsIkhnIeDU4=;
        fh=VxuMlt7ly5kfavXKYfixPQyCH/YH0iyGy+yD75LEUdc=;
        b=CxsoSWI7QAIWcGlwpKk8DtVw5+3OZ/QKWxu1igPggrUAjyPUDYwSwjJel7uLOAIwrB
         SDM0n6mWt5ecY8SdrwMnv8eYAI8SCnygZOzC6C+jz2nqv1DedPYwk3rv7ttGyWgKkvOj
         jrXffNMglKxDUffrwv61RJf8Ixzq86i5gtNHhvNQNtx5cqCEtCiHTycvittNC5cP9jyR
         DhKon5oj4gfsAEo1CTTyCZ1+vnETeK8Cclwplc4ETjwaES/bhQG+YVlmgQVUjVVcZxNy
         zdMlsst11HSNHiIlYPUmZ7KPqdRFZar3GU0Ylls2uSX3/3Qfp17xgh+tVOSXMXP2P7bl
         b3ag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793813394; x=1794418194; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ItFFvObtAvjLENS1Mt/wkdu9TiwBCB6wfsIkhnIeDU4=;
        b=etzsE2LaBKa2ZRK0iJ455tgGR65KZT7pWrQ6HWgUZdVhRmuBTDMtBl7oXN6MyGLJn6
         2qEKqWojA6Wrw9zi9kGY/dkh7BD1rTyTHrx7maBM58zTAVYE9yyG+WycYmKqiJxxS3+D
         SBvHldOK3QXx6RUTfb7iG09nAtpgZA1QdlK5Ouh4C9+IaV02NQntv+vfZRcMguBCS7sQ
         9EeOyjePAMLUqVrn5iIqedQ66grK0H+FdilXZrJNLgjsK3iUsPnu2hLR03V0HhSz8j3C
         jZFWvspxK/ihmLGg9rqHcCH84QaflTkVZotF6tE/kPRhm51xBuf8lrLw9GsTHyMn9fng
         bFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813394; x=1794418194;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ItFFvObtAvjLENS1Mt/wkdu9TiwBCB6wfsIkhnIeDU4=;
        b=akDWHclRFLHxFimYw7FNEhFF8cZWfu3VfJPvrwBgNnibgGtgkt0O95x8eeIbTTx0Gz
         jLmdDvJU+jLp2n4HVt0iHa6JWGMzupjanwajmSQ21UCTMJsig34ilzjGqUMWINZVf88V
         v5/ClaH3eN3ce8zFkqMDpK9kkFxa2uT0QuL953Bwm8AvWFBknyEGu2lvCp+8ixMdPK7F
         qwGa1YA3HHOWyywg+JcL/yaGvcjtep7dIq6/djUSsEpniDETTc5gO4po57ZOXW5h7CP3
         TrmfC3XtOsOEjri+rLg9V3zQvybDV23WqLrHg6Zard3CR0f2kDGJUcyKwnO9cHfBlf2/
         wFaA==
X-Gm-Message-State: APuU4Z/yLkav+eYR9JBsQmGrJ7/M3wQtu7WCO1sRHUXpWTjC5iiwGYhD
	zBiFDpB1C0Uf76zfE93bBKe4hKmEBKKca1wZXsc75fL/6attORkxbxUvX915B7J0pUMcgJoN5jE
	jWmbPkznwL+H8Nqr1BTmW6e+MRjNrdfs=
X-Gm-Gg: AYBFou12surj2fFlmDH/cOBJx7FZPEmZ7o9bwHSdJEYumfVERZTDv2l7X6N788cdb7K
	QudPh4yk8s4nSL96MTKvT9aNHyT68/RZWKbgLZu0IvW+5WmZ1cjrpgGv9S6QY0HOhUSSIUH7k5B
	BeUs0yeqPYk7GvroCzwM4Ui+9/1lE9uw4a1j2n+Cs0KnduAoaRDezhUH/e7WJLIFB3mTjNZUrEB
	hiw2iUXqxhMRYBT22AMAGCznSnbBqf6Z/9wI3j3fV8pgHSNq2G8oAHOVdRqae6BpJpLjXE52faY
	Y6G3oV/+zMX+Lui45tNrptZdLvZOkDp2cQskbRvysaRjsy7OXAGluY/F7t/AaOkieU6I/C4bwHA
	QlAjUZFNTgZtmyLuGQYXioEllCHbaHhbvL9eMR1XRKLFcjDUKZtL8jawbfDxu6a/JtjRSL/LqgP
	5ijMo/w+ZJ/UqJaGECBulxY1aC8keO5Wf91At5kPpuEeFNp5vvjV73wETklRECO1bALOJcFHm5t
	/BBFR8jh8trQsA/0RlhpPeVJGSb3TGpfHhepSoU1aMtvBexrcqQ5VzB5RHg+KOQ0jLuMKOSK87Q
	xHfdMu0Y1PfXDvoHwgyE3zBBrlWhWinBm825EcJaUREjBmSXZfhG/hjRPIOsQ1LSJ/sHNMXej5x
	O4GiWwr4zQyuyjI6TyK966g==
X-Received: by 2002:a05:690c:7283:b0:8b2:e7dc:dff5 with SMTP id
 00721157ae682-8b2e7dce271mr51879067b3.50.1793813393769; Wed, 04 Nov 2026
 09:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20261104124017.889577-1-martin.jansa@gmail.com>
In-Reply-To: <20261104124017.889577-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Nov 2026 09:29:27 -0800
X-Gm-Features: AclHuK8MFn4lDaBRufRzIwVOQoKx9LAUKNaS8xJheX7x5Xy1iR5BNZYHz38IgjU
Message-ID: <CAMKF1sosUPXfomcbRayHRppyGmEEUCW1T9z4vGbi0WDQ_jv62Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ctags: set CLEANBROKEN
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000210a1d065f76ba2b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 17:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131845

--000000000000210a1d065f76ba2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Martin

there is a version upgrade staged in master-next to 6.2.20261101.0 please
check if this patch is needed with the upgrade as well.

On Wed, Nov 4, 2026 at 4:40=E2=80=AFAM Martin Jansa via openembedded-devel
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> Tries to call sphinx-build during clean in docs directory and fails when
> not installed on host nor included in HOSTTOOLS
>
> Fixes do_configure failure when re-executed in existing WORKDIR
>
> ...
> rm -f ./*.gcov
> make[2]: Entering directory
> '/OE/tmp/work/x86_64-linux/ctags-native/6.2.20261011.0/sources/ctags-6.2.=
20261011.0/docs'
> /bin/sh: 1: sphinx-build: not found
> make[2]: Leaving directory
> '/OE/tmp/work/x86_64-linux/ctags-native/6.2.20261011.0/sources/ctags-6.2.=
20261011.0/docs'
> make[2]: *** [Makefile:20: clean] Error 127
> make[1]: *** [Makefile:8218: clean-local] Error 2
> make[1]: Leaving directory
> '/OE/tmp/work/x86_64-linux/ctags-native/6.2.20261011.0/sources/ctags-6.2.=
20261011.0'
> make: *** [Makefile:7175: clean-recursive] Error 1
> ERROR: oe_runmake failed
> WARNING: exit code 1 from a shell command.
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
> b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
> index e2f6b309ef..b419a158c0 100644
> --- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
> +++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261011.0.bb
> @@ -33,3 +33,6 @@ PACKAGECONFIG[yaml] =3D
> "--enable-yaml,--disable-yaml,libyaml"
>  PACKAGECONFIG[manpages] =3D ",,python3-docutils-native"
>
>  BBCLASSEXTEND =3D "native"
> +
> +# calls sphinx-build during clean
> +CLEANBROKEN =3D "1"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131843):
> https://lists.openembedded.org/g/openembedded-devel/message/131843
> Mute This Topic: https://lists.openembedded.org/mt/122091537/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000210a1d065f76ba2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Martin<div><br></div><div>there is a version upgrade stage=
d in master-next to=C2=A06.2.20261101.0 please check if this patch is neede=
d with the upgrade as well.</div></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 4, 2026 =
at 4:40=E2=80=AFAM Martin Jansa via openembedded-devel &lt;martin.jansa=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<br>
Tries to call sphinx-build during clean in docs directory and fails when<br=
>
not installed on host nor included in HOSTTOOLS<br>
<br>
Fixes do_configure failure when re-executed in existing WORKDIR<br>
<br>
...<br>
rm -f ./*.gcov<br>
make[2]: Entering directory &#39;/OE/tmp/work/x86_64-linux/ctags-native/6.2=
.20261011.0/sources/ctags-6.2.20261011.0/docs&#39;<br>
/bin/sh: 1: sphinx-build: not found<br>
make[2]: Leaving directory &#39;/OE/tmp/work/x86_64-linux/ctags-native/6.2.=
20261011.0/sources/ctags-6.2.20261011.0/docs&#39;<br>
make[2]: *** [Makefile:20: clean] Error 127<br>
make[1]: *** [Makefile:8218: clean-local] Error 2<br>
make[1]: Leaving directory &#39;/OE/tmp/work/x86_64-linux/ctags-native/6.2.=
20261011.0/sources/ctags-6.2.20261011.0&#39;<br>
make: *** [Makefile:7175: clean-recursive] Error 1<br>
ERROR: oe_runmake failed<br>
WARNING: exit code 1 from a shell command.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/ctags/<a href=3D"http://ctags_6.2.20261011.0=
.bb" rel=3D"noreferrer" target=3D"_blank">ctags_6.2.20261011.0.bb</a> | 3 +=
++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-devtools/ctags/<a href=3D"http://ctags_6.2.202=
61011.0.bb" rel=3D"noreferrer" target=3D"_blank">ctags_6.2.20261011.0.bb</a=
> b/meta-oe/recipes-devtools/ctags/<a href=3D"http://ctags_6.2.20261011.0.b=
b" rel=3D"noreferrer" target=3D"_blank">ctags_6.2.20261011.0.bb</a><br>
index e2f6b309ef..b419a158c0 100644<br>
--- a/meta-oe/recipes-devtools/ctags/<a href=3D"http://ctags_6.2.20261011.0=
.bb" rel=3D"noreferrer" target=3D"_blank">ctags_6.2.20261011.0.bb</a><br>
+++ b/meta-oe/recipes-devtools/ctags/<a href=3D"http://ctags_6.2.20261011.0=
.bb" rel=3D"noreferrer" target=3D"_blank">ctags_6.2.20261011.0.bb</a><br>
@@ -33,3 +33,6 @@ PACKAGECONFIG[yaml] =3D &quot;--enable-yaml,--disable-yam=
l,libyaml&quot;<br>
=C2=A0PACKAGECONFIG[manpages] =3D &quot;,,python3-docutils-native&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+# calls sphinx-build during clean<br>
+CLEANBROKEN =3D &quot;1&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131843): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131843" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131843</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122091537/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122091537/1997914</a><br>
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

--000000000000210a1d065f76ba2b--
