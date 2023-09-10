Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE52BC71153
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 22:19:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.46378.1694384357983259905
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 15:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gpgww55h;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-401d80f4ef8so40970385e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 15:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694384356; x=1694989156; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QpWei02pixAoNAx16x0rGRPdD9y9GsOniVP8TI/6p2I=;
        b=gpgww55hNhHi5Irdzg2dsHK6jq1XCw5CvAgAG8YhSDOXHWlVFPZOP/qOf/nIBcN1DU
         tavHF7iQEhtf09/gtgCL2r0BEJdI1Jm/5XaNcBhz7pnZsiVwEzTTrJlXcAdVtY2i6ho4
         QRF5J80IuaORWjUim/qOlSHjENx+WR37CvDObnJ55B2hg+E6pfN1MYkNBB0b2xAvFN8R
         ks/DGBHZ+tGLGgXMXkkpQkjclS5BbVuwCnHK7VIJFNA2oBhGgFw4uZjPgeseSebNi5FL
         Zckdjv1Jy4IjrL3oFT0Lag3UoK6dgTWDhYRa2+GupJRohLbVkHF/DMf7ulePA5WjExiQ
         Qc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694384356; x=1694989156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpWei02pixAoNAx16x0rGRPdD9y9GsOniVP8TI/6p2I=;
        b=CoeDxsbn0DoDZXtmKvUS/l3LmNnCoVY2eQOKYQJJ/nvFMI7aRRxCcwvzFFgbdTPOtE
         vO9NXx3eNaoYqM5kNIgOGncWe0nCVO5F5jfQJUry9vcxl81iJN2ZBwgJ4lsqznqC6OmB
         BwY0QH1DyjknFRhWnkXPvT4Ya8Wx8B5haMTtsNZScAD73sd6z6wcdmvkGh1xKRxbIrMM
         dVe5nQG0c7PGfjgDFvkcXy6MjFUaaSZli+o6CTQE6hJpGGZECr6gBYm+2R5+e42yE50y
         T4fGWBAOmvIipJemL+q6bLSquhspiGSzdihgWmfOIWKrlbpJGeEVKbYNqeWjGrBgI83M
         10OQ==
X-Gm-Message-State: AOJu0Yzn3WIu/GZsvNcaC8V71uVDieHAG77hK9ujmwUhHumPuz8apVW9
	KCPvlC14q7/DRUmbKVBRzDTtgS2AqvFqHDqs1gk=
X-Google-Smtp-Source: AGHT+IHKME6u8nbKLTqkyVnDn44+jTzoon74cyfO6/bQfo52FGvQtggo8ZvwV5CNaYBnoUiHgsYqF/MK5JPoZ5LNxkw=
X-Received: by 2002:a7b:ca4d:0:b0:3fe:d71a:d84e with SMTP id
 m13-20020a7bca4d000000b003fed71ad84emr7057865wml.1.1694384356315; Sun, 10 Sep
 2023 15:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230910210811.2335948-1-raj.khem@gmail.com> <1783A6486CA4A416.23877@lists.openembedded.org>
In-Reply-To: <1783A6486CA4A416.23877@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 Sep 2023 00:19:04 +0200
Message-ID: <CA+chaQd6wqP5rVzWc0qp7AYtZ6fQZbf75sadd==138hCZ7fMqw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sharutils: Check for intmax_t using configure
To: Martin.Jansa@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000abd5f5060508995b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 22:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104832

--000000000000abd5f5060508995b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

nevermind, I can confirm that after reverting "gettext: upgrade 0.21.1 ->
0.22"
https://git.openembedded.org/openembedded-core/commit/?id=3D7c29196f8e378cb=
12b82da31ab2a05f5e8d1b831
it built OK, so it was caused by that. Thanks for the fix.

Cheers,

On Sun, Sep 10, 2023 at 11:18=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Hi,
>
> thanks for this, I've seen it in my world builds yesterday as well. Do yo=
u
> know what caused this to fail suddenly? Was it that gettext upgrade? as
> there weren't many changes since last successful build and sharutils
> doesn't depend on much.
>
> Cheers,
>
> On Sun, Sep 10, 2023 at 11:08=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>
>> fixes
>> ../../sharutils-4.15.2/lib/system.h:45:14: error: typedef redefinition
>> with different types ('long' vs '__intmax_t' (aka 'long long'))
>>    45 | typedef long intmax_t;
>>       |              ^
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...re.ac-Check-and-define-intmax_t-type.patch | 32 +++++++++++++++++++
>>  .../sharutils/sharutils_4.15.2.bb             |  1 +
>>  2 files changed, 33 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-and-=
define-intmax_t-type.patch
>>
>> diff --git
>> a/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-an=
d-define-intmax_t-type.patch
>> b/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-an=
d-define-intmax_t-type.patch
>> new file mode 100644
>> index 0000000000..32562a08bc
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-an=
d-define-intmax_t-type.patch
>> @@ -0,0 +1,32 @@
>> +From ea6f7a4c22f1b6f28cf426566cccd65eb9a0e9de Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 10 Sep 2023 13:52:31 -0700
>> +Subject: [PATCH] configure.ac: Check and define intmax_t type
>> +
>> +If stdint.h or inttypes.h defines the type intmax_t, define
>> HAVE_INTMAX_T.
>> +Otherwise, define intmax_t to the widest signed integer type.
>> +
>> +intmax_t is defined in lib/system.h if system is not providing it but i=
t
>> +needs to be checked by configure for existence first.
>> +
>> +Upstream-Status: Submitted [
>> https://savannah.gnu.org/bugs/index.php?64653]
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + configure.ac | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 1242cb7..2ccaac9 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -72,6 +72,7 @@ AC_HEADER_STAT
>> + AC_HEADER_STDC
>> + AC_STRUCT_TIMEZONE
>> + AC_TYPE_SIZE_T
>> ++AC_TYPE_INTMAX_T
>> + AC_CHECK_FUNCS([fchmod isascii strchr])
>> + AC_FUNC_CLOSEDIR_VOID
>> + AC_FUNC_FSEEKO
>> +--
>> +2.42.0
>> +
>> diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
>> b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
>> index bd2776e1bc..2a16b18288 100644
>> --- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
>> +++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
>> @@ -12,6 +12,7 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>>             file://0001-Fix-build-with-recent-gettext.patch \
>>             file://0001-Fix-building-with-GCC-10.patch \
>>             file://0002-Do-not-include-lib-md5.c-into-src-shar.c.patch \
>> +           file://0001-configure.ac-Check-and-define-intmax_t-type.patc=
h
>> \
>>             "
>>  SRC_URI[md5sum] =3D "32a51b23e25ad5e6af4b89f228be1800"
>>  SRC_URI[sha256sum] =3D
>> "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
>> --
>> 2.42.0
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104831):
> https://lists.openembedded.org/g/openembedded-devel/message/104831
> Mute This Topic: https://lists.openembedded.org/mt/101280770/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000abd5f5060508995b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>nevermind, I can confirm that after=
 reverting &quot;gettext: upgrade 0.21.1 -&gt; 0.22&quot;</div><div><a href=
=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D7c29196f8e3=
78cb12b82da31ab2a05f5e8d1b831">https://git.openembedded.org/openembedded-co=
re/commit/?id=3D7c29196f8e378cb12b82da31ab2a05f5e8d1b831</a><br></div><div>=
it built OK, so it was caused by that. Thanks for the fix.<br></div><div><b=
r></div><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, Sep 10, 2023 at 11:18=E2=80=AFPM Martin J=
ansa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">g=
mail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>th=
anks for this, I&#39;ve seen it in my world builds yesterday as well. Do yo=
u know what caused this to fail suddenly? Was it that gettext upgrade? as t=
here weren&#39;t many changes since last successful build and sharutils doe=
sn&#39;t depend on much.</div><div><br></div><div>Cheers,</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep =
10, 2023 at 11:08=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">fixes<br>
../../sharutils-4.15.2/lib/system.h:45:14: error: typedef redefinition with=
 different types (&#39;long&#39; vs &#39;__intmax_t&#39; (aka &#39;long lon=
g&#39;))<br>
=C2=A0 =C2=A045 | typedef long intmax_t;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br=
>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...re.ac-Check-and-define-intmax_t-type.patch | 32 ++++++++++++++++++=
+<br>
=C2=A0.../sharutils/<a href=3D"http://sharutils_4.15.2.bb" rel=3D"noreferre=
r" target=3D"_blank">sharutils_4.15.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 33 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-c=
onfigure.ac-Check-and-define-intmax_t-type.patch<br>
<br>
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-=
Check-and-define-intmax_t-type.patch b/meta-oe/recipes-support/sharutils/sh=
arutils/0001-configure.ac-Check-and-define-intmax_t-type.patch<br>
new file mode 100644<br>
index 0000000000..32562a08bc<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-a=
nd-define-intmax_t-type.patch<br>
@@ -0,0 +1,32 @@<br>
+From ea6f7a4c22f1b6f28cf426566cccd65eb9a0e9de Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Sun, 10 Sep 2023 13:52:31 -0700<br>
+Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a>: Check and define intmax_t type<br>
+<br>
+If stdint.h or inttypes.h defines the type intmax_t, define HAVE_INTMAX_T.=
<br>
+Otherwise, define intmax_t to the widest signed integer type.<br>
+<br>
+intmax_t is defined in lib/system.h if system is not providing it but it<b=
r>
+needs to be checked by configure for existence first.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://savannah.gnu.org/bugs/index=
.php?64653" rel=3D"noreferrer" target=3D"_blank">https://savannah.gnu.org/b=
ugs/index.php?64653</a>]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 1242cb7..2ccaac9 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -72,6 +72,7 @@ AC_HEADER_STAT<br>
+ AC_HEADER_STDC<br>
+ AC_STRUCT_TIMEZONE<br>
+ AC_TYPE_SIZE_T<br>
++AC_TYPE_INTMAX_T<br>
+ AC_CHECK_FUNCS([fchmod isascii strchr])<br>
+ AC_FUNC_CLOSEDIR_VOID<br>
+ AC_FUNC_FSEEKO<br>
+-- <br>
+2.42.0<br>
+<br>
diff --git a/meta-oe/recipes-support/sharutils/<a href=3D"http://sharutils_=
4.15.2.bb" rel=3D"noreferrer" target=3D"_blank">sharutils_4.15.2.bb</a> b/m=
eta-oe/recipes-support/sharutils/<a href=3D"http://sharutils_4.15.2.bb" rel=
=3D"noreferrer" target=3D"_blank">sharutils_4.15.2.bb</a><br>
index bd2776e1bc..2a16b18288 100644<br>
--- a/meta-oe/recipes-support/sharutils/<a href=3D"http://sharutils_4.15.2.=
bb" rel=3D"noreferrer" target=3D"_blank">sharutils_4.15.2.bb</a><br>
+++ b/meta-oe/recipes-support/sharutils/<a href=3D"http://sharutils_4.15.2.=
bb" rel=3D"noreferrer" target=3D"_blank">sharutils_4.15.2.bb</a><br>
@@ -12,6 +12,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/${BPN}/${BP}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-build-with-recent=
-gettext.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-building-with-GCC=
-10.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Do-not-include-lib-md=
5.c-into-src-shar.c.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-Check-an=
d-define-intmax_t-type.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;32a51b23e25ad5e6af4b89f228be1800&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ee336e68549664e7a19b117adf02edfdeac6307f=
22e5ba78baca457116914637&quot;<br>
-- <br>
2.42.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104831): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104831" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104831</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101280770/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101280770/3617156</a><br>
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

--000000000000abd5f5060508995b--

