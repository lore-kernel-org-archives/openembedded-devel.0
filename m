Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BB4C3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 14:09:46 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.17991.1719583780424662278
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 07:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RJ28YqdM;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-64b417e1511so4838207b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719583779; x=1720188579; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXemWcrLHBslRbNY4K1gdmrO3YE+MsnZJaSZoD0bMVY=;
        b=RJ28YqdMJGQTWtLtSHqcQ2jqouNP94WnHYdhAsqUuZO0I3Il0+oXmGamfZktwz8fnC
         T+tZBhXItDwUTrr/A6bkYmMDcwO/z8G6vNvuQLwuMvon16U1JnZBsf8hbQGi3PbHyoNm
         Gg9w8sQlTNzHjT/MbwQlvfXz40ToOBYOZrXuI8hifPbbs9hnNvJuT9qhhwZGl8Q8URcV
         waR+Yq3thq5Nra6Bu5FFOsXEKr8Nvrum23Tq3umtbANprHcydy5/O7manYgOgB4lzkAF
         KYQS5ZQ8gNVxHPBVnH/foqG0tkF6nVuUYNj9uc7PVDv+otCFCPmzr0DBBhWdUmVHpzmT
         TLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719583779; x=1720188579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXemWcrLHBslRbNY4K1gdmrO3YE+MsnZJaSZoD0bMVY=;
        b=fAXKuu0VejcRReRquzWZgyq0gmdMKWkINejpXCTEOdFhC7EYUJaSZniX8QnJ6cz0U9
         Hc3zpln4t/G/jPqZ5t6Eb5pYt+6JlOyNA5uvw/yk+kyYy7WmsZ3BSaA1fAd1MCT71HYI
         1Z7byU67GEPn6SqIbhtQ9dbdTzF1lxPaPjRMZo2/2qzcp+vRMzz6hZt9jEzyMgoqalPg
         Owu/wmLCkd/nK4CkuJynD7ABwR0VQJoCqqhKKCLXWzo5/7vSwYwkUQrB1TwTfLrqQDJ2
         IrR4F5vnqod2QVc1Ea2g/UMUjeb0qnlodxxT9vdtWV5omSxu3CsHrRg5ndLIRvvWp1XF
         d0aA==
X-Forwarded-Encrypted: i=1; AJvYcCUH3lM1SoBFeRJTN6Z7XXxO8NE+62kP+xi6U5RpiRpO5m8EZS8TwY9tTavroxrlNBgFg6KhrOvy34CsPhUUHI1TlTJmwEnB8Zd32E1ZrB62JaGHmlafO77VhA==
X-Gm-Message-State: AOJu0Yz1jesPhVyuX3d49wIUxPuOCze5+bA+LIBEmniC+DXXsdFJS8Cl
	1pJvxW5SDg+peS24R6n0SKVhwU9gK0GxrDpdfLjjAJTCdU+7axekXe1+tWPSImAoqidPHcecq33
	A/EUmXWYVL4GUW4iKgcqxGmViqWM=
X-Google-Smtp-Source: AGHT+IGAxxZTpr9YIYtjvoR+6QLoKhp2kuOOAS8lAsgi5FISwmVY4Rgh1a8WBCi0wMXn+CTilQEAAd6aFUVzGZTcmfY=
X-Received: by 2002:a81:f101:0:b0:644:6682:a8e3 with SMTP id
 00721157ae682-6446682a9bbmr147687897b3.17.1719583779366; Fri, 28 Jun 2024
 07:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240627224112.198171-1-gudni.m.g@gmail.com> <CAJo0Az7dMaz-F9kKMb4Wdu6nhtAKS_-JXpex9AaNRG1TfsEnRA@mail.gmail.com>
In-Reply-To: <CAJo0Az7dMaz-F9kKMb4Wdu6nhtAKS_-JXpex9AaNRG1TfsEnRA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 28 Jun 2024 07:09:27 -0700
Message-ID: <CANx9H-C610icWnZmP-FCmBUeaHCu_J-_dkYEJaa+maAtJ06oGA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-bleak: upgrade 0.21.1 -> 0.22.2
To: t.f.g.geelen@gmail.com
Cc: gudni.m.g@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000054adff061bf3ccf1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 14:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111151

--00000000000054adff061bf3ccf1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gu=C3=B0ni,
In your updates, make sure you are running with ptest enabled in
DISTRO_FEATURES (default with poky) and then
for any recipe that inherits ptest in meta-python (and probably meta-oe)
you should be able to run:

bitbake meta-python-image-ptest-python3-bleak
bitbake -c testimage meta-python-image-ptest-python3-bleak

Any recipes you see where the pypi defaults have been changed were likely
changed for a very good reason. Don't change them back.

On Fri, Jun 28, 2024 at 6:45=E2=80=AFAM Tom Geelen via lists.openembedded.o=
rg
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:

> This breaks ptest unfortunately as the direct pypi fetch does not include
> the tests. Only the direct github link as it was previously.
>

> On Fri, Jun 28, 2024 at 12:41=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
> lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org> wro=
te:
>
>> Changes to the build:
>> - Drop python3-async-timeout which is only required for Python 3.10 and
>> older.
>>
>> Changelogs:
>> * https://github.com/hbldh/bleak/releases/tag/v0.22.2
>> * https://github.com/hbldh/bleak/releases/tag/v0.22.1
>> * https://github.com/hbldh/bleak/releases/tag/v0.22.0
>>
>> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
>> ---
>>  .../{python3-bleak_0.21.1.bb =3D> python3-bleak_0.22.2.bb}  | 8 ++-----=
-
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>  rename meta-python/recipes-devtools/python/{python3-bleak_0.21.1.bb =3D=
>
>> python3-bleak_0.22.2.bb} (74%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>> b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
>> similarity index 74%
>> rename from meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>> rename to meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
>> index 96f3fcbcf..36a823a9b 100644
>> --- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
>> @@ -3,13 +3,10 @@ HOMEPAGE =3D "https://github.com/hbldh/bleak"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbcbc2069a86cba1b5e47253679f6=
6ed7"
>>
>> -SRCREV =3D "054b092e19c7a45d5ea07d8948022f54117fe5e8"
>> -PYPI_SRC_URI =3D "git://
>> github.com/hbldh/bleak.git;protocol=3Dhttps;branch=3Ddevelop"
>> +SRC_URI[sha256sum] =3D
>> "09010c0f4bd843e7dcaa1652e1bfb2450ce690da08d4c6163f0723aaa986e9fe"
>>
>>  inherit pypi python_poetry_core ptest
>>
>> -S =3D "${WORKDIR}/git"
>> -
>>  SRC_URI +=3D " \
>>         file://run-ptest \
>>  "
>> @@ -26,8 +23,7 @@ do_install_ptest() {
>>  }
>>
>>  RDEPENDS:${PN} +=3D " \
>> -       python3-core (>3.7) \
>> -       python3-async-timeout \
>> +       python3-core (>3.8) \
>>         python3-dbus-fast \
>>         python3-xml \
>>  "
>> --
>> 2.34.1
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111150):
> https://lists.openembedded.org/g/openembedded-devel/message/111150
> Mute This Topic: https://lists.openembedded.org/mt/106918869/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000054adff061bf3ccf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Gu=C3=B0ni,<br></div><div>In your updates, make sure =
you are running with ptest enabled in DISTRO_FEATURES (default with poky) a=
nd then</div><div>for any recipe that inherits ptest in meta-python (and pr=
obably meta-oe) you should be able to run:</div><div><br></div><div>bitbake=
 meta-python-image-ptest-python3-bleak</div><div>bitbake -c testimage=C2=A0=
meta-python-image-ptest-python3-bleak</div><div><br></div><div>Any recipes =
you see where the pypi defaults have been changed were likely changed for a=
 very good reason. Don&#39;t change them back.</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 28, 2024 at 6:45=
=E2=80=AFAM Tom Geelen via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;t.f.g.geelen=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">This brea=
ks ptest unfortunately as the direct pypi fetch does not include the tests.=
 Only the direct github link as it was previously.=C2=A0</div></blockquote>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 28, 2024 at 12:41=
=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via <a href=3D"http://lists.openemb=
edded.org" target=3D"_blank">lists.openembedded.org</a> &lt;gudni.m.g=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Changes to the build:<br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111150): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111150" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111150</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106918869/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106918869/924729</a><br>
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

--00000000000054adff061bf3ccf1--

