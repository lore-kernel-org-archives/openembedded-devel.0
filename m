Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8865BE82CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:28:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.27371.1695846521314472297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lmZMhv90;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3231dff4343so5407434f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695846519; x=1696451319; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/2J02X4vZWmRnrJ9/vnGPDLYb1rmH9EHmnZgXFxl6k=;
        b=lmZMhv90Uw4yK8inXKfoAKhF8UyFwU7TpTiJqoQNVg07W2mANXVmPGn3az+3+Ftc/5
         C/ehWLqLo57AYctP3fXy6vIJwsKzFmp+Gz9q8d587VdDyDCd4x30cMqCay9jH7LKQoH5
         ZYhvFILmwqjq3T8cfVIj6uYEEImVHZUV5jaM9KkQn2HuRm96ce2uRWetZczw2WjVjD4d
         qQ+Ap+9a0Egdju52ueelE/jjxfUU4D83zSKW+4TT+xxA4qIuIKU+GbAQy90IeEhqzDH8
         +OUxC+/+hI5pwDAwPH0oqOGDbLlOQo64vxM8a/GnUlNooQDsSI/gUrdiTyEg7WqpzbtY
         jhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846519; x=1696451319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/2J02X4vZWmRnrJ9/vnGPDLYb1rmH9EHmnZgXFxl6k=;
        b=wtMq6qi/idDkTcknxfk3jPnwNOrYvlSc0tXqlwQvPVdNkBzyZEqlFxPZvDPMN3VpqR
         On8fhqjuSAPXPYDbcmJPyOJtQuejPkQ0K0/Ld+0CaFW9RZ9o5426OjgKT6lNXE0lYCdA
         P2t2dfndbjtPTT4DWjW2rzJqWn+MCP8sgxnrC1q36pxWycnJcAEEnIwij4YGG054PE9B
         tMzxVdhEVUg3XBNa7JZh5jU1ve0A1N6MdTnkEiTME8B6qB6gK8MGFov3rm3tuyrgq+BK
         bwgv7YGHqflDCjqMNYwJtKS1TdqsJEniGsm1VzFgtWjhJiebB1+/BL/GOxsOxOrCQteg
         /cAg==
X-Gm-Message-State: AOJu0YySItb3NLpYqcdcRZ2Bx0NBYoQv4d4wlpDmDsuPIbiDySJapj/r
	p5IQYoh4YFfkhjrfdnUvJnlSzPKmSWYF+waB/Q4=
X-Google-Smtp-Source: AGHT+IGDskzeLjS80ipc/VDefe+aXAD4EXMQ7W6ZqcZfpzCJfs3XWxWfa6X45xGY8K3Evi3wm2px88TfthEpheV1HZM=
X-Received: by 2002:a5d:58ec:0:b0:31f:ffe3:b957 with SMTP id
 f12-20020a5d58ec000000b0031fffe3b957mr2620971wrd.31.1695846519544; Wed, 27
 Sep 2023 13:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230927201136.2587713-1-martin.jansa@gmail.com>
 <CAJiuCcfBSBzCUjZ3CJkUB3x4DsE8BkQOSOMdfp3z1ZBwSgfkkg@mail.gmail.com> <1788DB1BDDB19F0F.25618@lists.openembedded.org>
In-Reply-To: <1788DB1BDDB19F0F.25618@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Sep 2023 22:28:27 +0200
Message-ID: <CA+chaQcAJ4RN+6dsTw5Yp1gZZr20=qfc=TifKKfSccwMfQFOPA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mosquitto, etcd-cpp-apiv3: add missing Upstream-Status
To: martin.jansa@gmail.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000064214506065d0936"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105207

--00000000000064214506065d0936
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 10:22=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Which one? Can you send v2 of your changes as you clearly know the correc=
t
> status better than me?
>

Sorry, it's clear which one you were referring to (just beer or gmail was
playing games with me), but still please send v2 or follow-up.


> On Wed, Sep 27, 2023 at 10:21=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.c=
lem@gmail.com>
> wrote:
>
>> Hi Martin
>>
>> On Wed, 27 Sept 2023 at 22:11, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> >
>> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> > ---
>> >  meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 2 +=
+
>> >  meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 2 +=
+
>> >  .../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch    | 2 +=
+
>> >  3 files changed, 6 insertions(+)
>> >
>> > diff --git
>> a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>> b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>> > index 3275e57e38..7374cbd26f 100644
>> > --- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
>> > @@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websockets
>> library if needed see:
>> >
>> >  Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and
>> Daniel Engberg <daniel.engberg.lists@pyret.net>
>> >  ---
>> > +Upstream-Status: Pending
>> > +
>> >   src/CMakeLists.txt | 2 +-
>> >   1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git
>> a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>> b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>> > index a9e9c97b83..853f881754 100644
>> > --- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
>> > @@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-onlin=
e
>> when starting
>> >
>> >  See: https://github.com/eclipse/mosquitto/issues/2878
>> >  ---
>> > +Upstream-Status: Pending
>> > +
>> >   service/systemd/mosquitto.service.simple | 4 ++--
>> >   1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git
>> a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross=
-compiling.patch
>> b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross=
-compiling.patch
>> > index d1126aa05b..ce12d4270a 100644
>> > ---
>> a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross=
-compiling.patch
>> > +++
>> b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross=
-compiling.patch
>> > @@ -17,6 +17,8 @@ CMake is cross compiling.
>> >
>> >  Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>> >  ---
>> > +Upstream-Status: Pending
>>
>> It has been accepted and merged.
>>
>> Thanks
>>
>> > +
>> >   CMakeLists.txt | 28 ++++++++++++++++++++++++++--
>> >   1 file changed, 26 insertions(+), 2 deletions(-)
>> >
>> > --
>> > 2.42.0
>> >
>> >
>> >
>> >
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105206):
> https://lists.openembedded.org/g/openembedded-devel/message/105206
> Mute This Topic: https://lists.openembedded.org/mt/101625428/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000064214506065d0936
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Sep 27, 2023 at 10:22=E2=80=AFPM =
Martin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Which one? Can you send v2 of your changes as you clearly know the=
 correct status better than me?</div></blockquote><div><br></div><div>Sorry=
, it&#39;s clear which one you were referring to (just beer or gmail was pl=
aying games with me), but still please send v2 or follow-up.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 27, 2023 at 10=
:21=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gma=
il.com" target=3D"_blank">peron.clem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hi Martin<br>
<br>
On Wed, 27 Sept 2023 at 22:11, Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-networking/recipes-connectivity/mosquitto/files/2894.patch =
| 2 ++<br>
&gt;=C2=A0 meta-networking/recipes-connectivity/mosquitto/files/2895.patch =
| 2 ++<br>
&gt;=C2=A0 .../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch=C2=
=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 3 files changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894=
.patch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<br=
>
&gt; index 3275e57e38..7374cbd26f 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<=
br>
&gt; +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<=
br>
&gt; @@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websockets=
 library if needed see:<br>
&gt;<br>
&gt;=C2=A0 Patch contributed by Joachim Zobel &lt;<a href=3D"mailto:jz-2017=
@heute-morgen.de" target=3D"_blank">jz-2017@heute-morgen.de</a>&gt; and=C2=
=A0 Daniel Engberg &lt;<a href=3D"mailto:daniel.engberg.lists@pyret.net" ta=
rget=3D"_blank">daniel.engberg.lists@pyret.net</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0src/CMakeLists.txt | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895=
.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br=
>
&gt; index a9e9c97b83..853f881754 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<=
br>
&gt; +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<=
br>
&gt; @@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-onlin=
e when starting<br>
&gt;<br>
&gt;=C2=A0 See: <a href=3D"https://github.com/eclipse/mosquitto/issues/2878=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/eclipse/mosquitto=
/issues/2878</a><br>
&gt;=C2=A0 ---<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0service/systemd/mosquitto.service.simple | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-f=
ix-when-cross-compiling.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv=
3/0001-cmake-fix-when-cross-compiling.patch<br>
&gt; index d1126aa05b..ce12d4270a 100644<br>
&gt; --- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when=
-cross-compiling.patch<br>
&gt; +++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when=
-cross-compiling.patch<br>
&gt; @@ -17,6 +17,8 @@ CMake is cross compiling.<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:per=
on.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; +Upstream-Status: Pending<br>
<br>
It has been accepted and merged.<br>
<br>
Thanks<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0CMakeLists.txt | 28 ++++++++++++++++++++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 26 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.42.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105206): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105206" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105206</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101625428/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101625428/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000064214506065d0936--

