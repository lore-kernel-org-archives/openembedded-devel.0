Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8F4C3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 13:45:26 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.17241.1719582325514798034
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 06:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8eDeUdZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-725a7b0fc55so439303a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719582325; x=1720187125; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KNrnL4H0l2L8e8DOURLzvfxSXuRDMLjhsbwWqG/wf2c=;
        b=W8eDeUdZTlJLqW1TH9qzDzNd39CKS+CwYa9Cq2GTxNIX8ekvsqwUW5ztJvKf2tw7Kr
         C+AzO3gPWLFkP0gFyu2vob1+10NoSy81L2JAU3njoLWUtVRYet+gm4MkAtHnzJTes1kL
         U52vFBjh1biu759QP0Sl5jhT5MsIXI8AelCnJu1NjOJ+kWV2mjPNPmQPgsBeXo3Tuxla
         m3NVGLlP8wUjak/gkLT0hq4Khn3nvpy8K+JXWU2sOnhUSho8PEH3/Ve2zgD4aCYnS/cD
         ZHet1gp0UtppVr4Mon6pD8avabOOfGNNNeG9W366tq12V62dzHlPfyEDXLeFk9lfOgVj
         HU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719582325; x=1720187125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNrnL4H0l2L8e8DOURLzvfxSXuRDMLjhsbwWqG/wf2c=;
        b=UFnx9s0noJ82yUH0eLggLkp/zoJz/HNGQ2djgd0YzR4h9U9I7w2GF91mkSm1bRgWmx
         IKJNfjmVkxEH+3Kkf92O8L7N3iiUBll/+pPJAd0U0Y2Vxr2qTB6KTjqI7NEnNBUEpbuo
         OVQacUrjL74VJ0mQrby1i+/ERQ40g66dU1U+4CR0zxe6RM8VY9BPrYbeosa3Mv0fQ61/
         6cNEdjLQsMwh2pNODQ6IXrF7uaL2ZuxIl/eYnNawk9wu+CS147/GxIOfeFye363SIUw1
         YilwdQopuNMvZmPntRqemL24ss4i4Ub/E9I8ZZplzP6O4BBPglfy/1xgZa6+rVtEzxHU
         aTKw==
X-Gm-Message-State: AOJu0YzWlbtqIVQ+Zmw6kvl7OPYthTHGiy1hECgKiByUIaCjvRev00Uu
	ybHsOX0ZSDhvQDUBiGG3GRVvxJV8Fpi4IAxbalkEb5Xp4wQQoEFQGHzBA9+odETfrGShAN7J6wg
	wbnGYpd/0tT/vtrWJUzSuqcg8XgY=
X-Google-Smtp-Source: AGHT+IEnd8W/Jbl5Qj7lhOK2ofFebqU752nfp8Rj3EHp0JdD7gKFKl1AjSYA2Xz3hP8k7vCDuMRDdVNX6f9Fe9aXCR8=
X-Received: by 2002:a05:6a20:bcaf:b0:1bd:2c4e:8d9a with SMTP id
 adf61e73a8af0-1bd2c4e9313mr7256520637.40.1719582324333; Fri, 28 Jun 2024
 06:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240627224112.198171-1-gudni.m.g@gmail.com>
In-Reply-To: <20240627224112.198171-1-gudni.m.g@gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Fri, 28 Jun 2024 15:45:14 +0200
Message-ID: <CAJo0Az7dMaz-F9kKMb4Wdu6nhtAKS_-JXpex9AaNRG1TfsEnRA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-bleak: upgrade 0.21.1 -> 0.22.2
To: gudni.m.g@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009aa260061bf375d5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 13:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111150

--0000000000009aa260061bf375d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This breaks ptest unfortunately as the direct pypi fetch does not include
the tests. Only the direct github link as it was previously.

On Fri, Jun 28, 2024 at 12:41=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org> wrote=
:

> Changes to the build:
> - Drop python3-async-timeout which is only required for Python 3.10 and
> older.
>
> Changelogs:
> * https://github.com/hbldh/bleak/releases/tag/v0.22.2
> * https://github.com/hbldh/bleak/releases/tag/v0.22.1
> * https://github.com/hbldh/bleak/releases/tag/v0.22.0
>
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> ---
>  .../{python3-bleak_0.21.1.bb =3D> python3-bleak_0.22.2.bb}  | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-bleak_0.21.1.bb =3D>
> python3-bleak_0.22.2.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> rename to meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
> index 96f3fcbcf..36a823a9b 100644
> --- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
> @@ -3,13 +3,10 @@ HOMEPAGE =3D "https://github.com/hbldh/bleak"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbcbc2069a86cba1b5e47253679f66=
ed7"
>
> -SRCREV =3D "054b092e19c7a45d5ea07d8948022f54117fe5e8"
> -PYPI_SRC_URI =3D "git://
> github.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop"
> +SRC_URI[sha256sum] =3D
> "09010c0f4bd843e7dcaa1652e1bfb2450ce690da08d4c6163f0723aaa986e9fe"
>
>  inherit pypi python_poetry_core ptest
>
> -S =3D "${WORKDIR}/git"
> -
>  SRC_URI +=3D " \
>         file://run-ptest \
>  "
> @@ -26,8 +23,7 @@ do_install_ptest() {
>  }
>
>  RDEPENDS:${PN} +=3D " \
> -       python3-core (>3.7) \
> -       python3-async-timeout \
> +       python3-core (>3.8) \
>         python3-dbus-fast \
>         python3-xml \
>  "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111131):
> https://lists.openembedded.org/g/openembedded-devel/message/111131
> Mute This Topic: https://lists.openembedded.org/mt/106918869/7396403
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> t.f.g.geelen@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009aa260061bf375d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks ptest unfortunately as the direct pypi fetch d=
oes not include the tests. Only the direct github link as it was previously=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, Jun 28, 2024 at 12:41=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;gud=
ni.m.g=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Changes to the build:<br>
- Drop python3-async-timeout which is only required for Python 3.10 and old=
er.<br>
<br>
Changelogs:<br>
* <a href=3D"https://github.com/hbldh/bleak/releases/tag/v0.22.2" rel=3D"no=
referrer" target=3D"_blank">https://github.com/hbldh/bleak/releases/tag/v0.=
22.2</a><br>
* <a href=3D"https://github.com/hbldh/bleak/releases/tag/v0.22.1" rel=3D"no=
referrer" target=3D"_blank">https://github.com/hbldh/bleak/releases/tag/v0.=
22.1</a><br>
* <a href=3D"https://github.com/hbldh/bleak/releases/tag/v0.22.0" rel=3D"no=
referrer" target=3D"_blank">https://github.com/hbldh/bleak/releases/tag/v0.=
22.0</a><br>
<br>
Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert &lt;<a href=3D"mailto:gudni.m.g@=
gmail.com" target=3D"_blank">gudni.m.g@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-bleak_0.21.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3-bleak_0.21.1.bb</a> =3D&gt; <a href=3D"http://pytho=
n3-bleak_0.22.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.22=
.2.bb</a>}=C2=A0 | 8 ++------<br>
=C2=A01 file changed, 2 insertions(+), 6 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-bleak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.21.1=
.bb</a> =3D&gt; <a href=3D"http://python3-bleak_0.22.2.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-bleak_0.22.2.bb</a>} (74%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
bleak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.21.1.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-blea=
k_0.22.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.22.2.bb</=
a><br>
similarity index 74%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-b=
leak_0.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.21.1.b=
b</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-ble=
ak_0.22.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.22.2.bb<=
/a><br>
index 96f3fcbcf..36a823a9b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-bleak_0=
.21.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.21.1.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-bleak_0=
.22.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-bleak_0.22.2.bb</a><=
br>
@@ -3,13 +3,10 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/hbldh/bl=
eak" rel=3D"noreferrer" target=3D"_blank">https://github.com/hbldh/bleak</a=
>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dbcbc2069a86cba1b5e472=
53679f66ed7&quot;<br>
<br>
-SRCREV =3D &quot;054b092e19c7a45d5ea07d8948022f54117fe5e8&quot;<br>
-PYPI_SRC_URI =3D &quot;git://<a href=3D"http://github.com/hbldh/bleak.git;=
protocol=3Dhttps;branch=3Ddevelop" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;09010c0f4bd843e7dcaa1652e1bfb2450ce690da08d4c=
6163f0723aaa986e9fe&quot;<br>
<br>
=C2=A0inherit pypi python_poetry_core ptest<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
@@ -26,8 +23,7 @@ do_install_ptest() {<br>
=C2=A0}<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-core (&gt;3.7) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-async-timeout \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-core (&gt;3.8) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-dbus-fast \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-xml \<br>
=C2=A0&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111131): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111131" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111131</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106918869/739=
6403" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106918869/7396403</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:t.f.g.geelen@gmail.com" =
target=3D"_blank">t.f.g.geelen@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009aa260061bf375d5--

