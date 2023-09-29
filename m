Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1F0E80A98
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 11:26:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.14985.1695986786007799776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 04:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLeBv2b/;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32488a22810so1482034f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695986784; x=1696591584; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=keHmZ4nwY/kkTZqf5tDYgmjbdvD72BKtz7YkUMA9bVE=;
        b=fLeBv2b/exTUTesPPzJS+DUFX+DNlCy6bHLF0z8Za4HBDpkbJkFCI0+IX/A0Mu2gyo
         91AFtUbNjoWq4vdhW/gwVnBTmwr9sK6ItOtP3hr+lmLEZe9XUK/P6848buqcZgsyR1At
         mWDRxW3A7bi1y98IkgGUXDsq2e47kqnputZOAisNkjEnXFNSnWIWRmvnLA20ga2GhIPc
         J2kILcC5qcKLxMqiBp5QISFr9vh1rvm/NxyZyYy1GSw9yOmY/lswgWj6A3IYmiB36Cy8
         q9QRtpuM/UB6VVxaNigw22ZC45nPxsswgUttHMkDc3VQl+5mZfaUgxvl0zecI5d4lqPI
         5Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695986784; x=1696591584;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keHmZ4nwY/kkTZqf5tDYgmjbdvD72BKtz7YkUMA9bVE=;
        b=ZPS2BD8BaBXWUriOET00pJGKS7B0zcATQvDH5Wy8M53VFYCpXiYkN2BtN6FGWc+gfA
         ohv0ULZYMYZIJOf7JrMBQf/rg/McsHOPVKbinWdlAWnhRaeuQ2ziyCZyVkGx91+kHe6A
         KNN6v1FIWrLu1v3iYya7cryQET9zHJrAX/k97JDdYBpb1AM8kL9cx+iU4Qk3GLhTHguQ
         FWiXafvFxIQqHm1TCjObSD5l1Vfz+LC7zs4MxtGip8wITlUQUVYRV6tPB4o+da8KqQxm
         XZ5FSOhPwvWFsoCnOW1zczp5nfWx5CagCefp7W5Ckf87MWa0AUcnsJ9rZgkquPNJtktC
         QzNQ==
X-Gm-Message-State: AOJu0Yy3XNhQFkQqH/zYLN5iv6iK0LzmyTDHFJMdZhC8uYYGuMguNEws
	QZJg+Dq8ZsNnzHhEZh9TzNRWvXppyIEDclOnbaKD4KGb
X-Google-Smtp-Source: AGHT+IFgQqJDJRQqdhdHUND+OFBB4w/GrQIQhAjpQd/JsH4iAI6TxSN+olqFhhiz4h05ijsKH7rht8/0v89rHB0Eo/8=
X-Received: by 2002:adf:dec8:0:b0:321:6c90:55f7 with SMTP id
 i8-20020adfdec8000000b003216c9055f7mr3321475wrn.18.1695986784154; Fri, 29 Sep
 2023 04:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230929104808.1980075-1-martin.jansa@gmail.com>
In-Reply-To: <20230929104808.1980075-1-martin.jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 29 Sep 2023 13:26:11 +0200
Message-ID: <CA+chaQcvHnOXCnVxw8uA82sMJ3rmNX52SOrKMZ6qa8ANeBeeww@mail.gmail.com>
Subject: Re: [meta-oe][kirkstone][PATCH] mosquitto, etcd-cpp-apiv3: add
 missing Upstream-Status
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d0378106067db132"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 11:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105235

--000000000000d0378106067db132
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Armin: please ignore this one, wrong branch, will send the right one
shortly (after coffee).

On Fri, Sep 29, 2023 at 12:48=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om>
wrote:

> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 2 ++
>  meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 2 ++
>  .../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch    | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git
> a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> index 3275e57e38..7374cbd26f 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> @@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websockets
> library if needed see:
>
>  Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Daniel
> Engberg <daniel.engberg.lists@pyret.net>
>  ---
> +Upstream-Status: Pending
> +
>   src/CMakeLists.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> index a9e9c97b83..853f881754 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> @@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-online
> when starting
>
>  See: https://github.com/eclipse/mosquitto/issues/2878
>  ---
> +Upstream-Status: Pending
> +
>   service/systemd/mosquitto.service.simple | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git
> a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-=
compiling.patch
> b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-=
compiling.patch
> index d1126aa05b..ce12d4270a 100644
> ---
> a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-=
compiling.patch
> +++
> b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-=
compiling.patch
> @@ -17,6 +17,8 @@ CMake is cross compiling.
>
>  Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>  ---
> +Upstream-Status: Pending
> +
>   CMakeLists.txt | 28 ++++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
>
> --
> 2.42.0
>
>

--000000000000d0378106067db132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Armin: please ignore this one, wrong branch, will send the=
 right one shortly (after coffee).</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 29, 2023 at 12:48=E2=80=AFPM =
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 2 +=
+<br>
=C2=A0meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 2 +=
+<br>
=C2=A0.../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch=C2=A0 =
=C2=A0 | 2 ++<br>
=C2=A03 files changed, 6 insertions(+)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894.patc=
h b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<br>
index 3275e57e38..7374cbd26f 100644<br>
--- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<br>
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<br>
@@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websockets libr=
ary if needed see:<br>
<br>
=C2=A0Patch contributed by Joachim Zobel &lt;<a href=3D"mailto:jz-2017@heut=
e-morgen.de" target=3D"_blank">jz-2017@heute-morgen.de</a>&gt; and=C2=A0 Da=
niel Engberg &lt;<a href=3D"mailto:daniel.engberg.lists@pyret.net" target=
=3D"_blank">daniel.engberg.lists@pyret.net</a>&gt;<br>
=C2=A0---<br>
+Upstream-Status: Pending<br>
+<br>
=C2=A0 src/CMakeLists.txt | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.patc=
h b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br>
index a9e9c97b83..853f881754 100644<br>
--- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br>
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br>
@@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-online whe=
n starting<br>
<br>
=C2=A0See: <a href=3D"https://github.com/eclipse/mosquitto/issues/2878" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/eclipse/mosquitto/issu=
es/2878</a><br>
=C2=A0---<br>
+Upstream-Status: Pending<br>
+<br>
=C2=A0 service/systemd/mosquitto.service.simple | 4 ++--<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-wh=
en-cross-compiling.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/000=
1-cmake-fix-when-cross-compiling.patch<br>
index d1126aa05b..ce12d4270a 100644<br>
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cros=
s-compiling.patch<br>
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cros=
s-compiling.patch<br>
@@ -17,6 +17,8 @@ CMake is cross compiling.<br>
<br>
=C2=A0Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.cl=
em@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
=C2=A0---<br>
+Upstream-Status: Pending<br>
+<br>
=C2=A0 CMakeLists.txt | 28 ++++++++++++++++++++++++++--<br>
=C2=A0 1 file changed, 26 insertions(+), 2 deletions(-)<br>
<br>
-- <br>
2.42.0<br>
<br>
</blockquote></div>

--000000000000d0378106067db132--

