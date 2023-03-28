Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83CAC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 06:57:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.60282.1679986638768876776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 23:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZiVG5Lgo;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id v1so11024759wrv.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 23:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679986637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XjKLZJ3JAiLAhnv9ut79bhfUsfx2gTRz0nlbiiUOTPM=;
        b=ZiVG5LgoSuMQbpOahs0y/ck2Wkf5jcLf9ErYosK0n0bjYQxq/KmvlawhFm8/QI1jg8
         cyfxCKp8XuKSIhJgbDCbwqJz9/LVGp0AqEaT6+TlxU6ESiBzayDWIJGwK3HCRxMUrKAf
         xIAIuC7VKO4yVa/niszhl+iB/DlRoX+3lHPzcUCIMOuG52gDG7MilM+BzOEM+fteuYoW
         6sxD5cx4KJxm5emMDmg+sfROPZ5sqS1Djd8lW6YPKbKDIU74WQ8JHZ3e0hGFFDtgkmlG
         Z7/PkCWjzMMBJhz7gRVW1dlA86JKxJqzJHOMWtelmt5AzzSm0mrKa3VE6qxrgzd5X8Sz
         9m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679986637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjKLZJ3JAiLAhnv9ut79bhfUsfx2gTRz0nlbiiUOTPM=;
        b=2kn9iztj1poVmfiZxclOp72t1NM74FmxHCIYKdeDUJLH7UmOVSaA2BNxQ6cP1V3vsQ
         zI3VMOURM9Ch4BaECKOWZVymHYSgxyx5SmbgnODXFU/NLKdnIT8MsJgEFqOnGNyokw0z
         K22g5aSNj0DjyVidY7S/ExNo/KSHRvDj3Fqy1FsW4cVqYFatgogl0zOFH1LBjXlu9fEq
         v/5jamD8lZOzaIZZd2u00sUGQ+bld/o9jo9b/UYYIPB8Zly32cgUyHWm5YGIdSNyNokl
         8DnG1TEcOBwGWD6+zAEMcBGeVm+LYU6w4SGfVNT8NBdSeAoFEAcrJfzaBfQASeTvfIIq
         CHPQ==
X-Gm-Message-State: AAQBX9eYYrfuzBOxRWTo0yqSpGZALBFkPVwb+LjvmU/D5w3cMEbgIbYt
	stYbPCwNuU+6Us72Ql0ge0fjOUQiRJ5JK5zJlt4=
X-Google-Smtp-Source: AKy350bGc1UbjPja9NVrjHrrqxTKRTA9HzqTLxkX8abG9+V8aUq00njJB7tuILTD0ibh8gowVZy7Z6IvwOZjqGHm2uE=
X-Received: by 2002:adf:efc7:0:b0:2d6:6af:4893 with SMTP id
 i7-20020adfefc7000000b002d606af4893mr2348700wrp.1.1679986637143; Mon, 27 Mar
 2023 23:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230328064802.42713-1-cvubrugier@fastmail.fm>
In-Reply-To: <20230328064802.42713-1-cvubrugier@fastmail.fm>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Mar 2023 08:57:04 +0200
Message-ID: <CA+chaQeNc-6bhkZX=G6ukdP=KQGSttyxm=3xO8S9WWDyigHN_w@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 1/2] exfatprogs: add new recipe
To: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Cc: openembedded-devel@lists.openembedded.org, 
	Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Content-Type: multipart/alternative; boundary="000000000000bc048a05f7f05e8f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Mar 2023 06:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101800

--000000000000bc048a05f7f05e8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do we need
RPROVIDES:${PN} =3D "exfat-utils"
as well?

It used to be necessary for automatic update from one package to its
replacement at least with opkg (I haven't tried on target migrations for
quite some time now).

On Tue, Mar 28, 2023 at 8:48=E2=80=AFAM Christophe Vu-Brugier <
cvubrugier@fastmail.fm> wrote:

> From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
>
> exfatprogs provides utilities to create, modify, and check exFAT file
> systems on Linux. The developers of exfatprogs also maintain the Linux
> kernel exFAT driver.
>
> exfatprogs has replaced exfat-utils in Debian bookworm.
>
> References:
>  * https://github.com/exfatprogs/exfatprogs/
>  * https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1002871
>
> Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
> ---
>  .../exfatprogs/exfatprogs_1.2.0.bb            | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/exfatprogs/
> exfatprogs_1.2.0.bb
>
> diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.b=
b
> b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb
> new file mode 100644
> index 000000000..0b26a215b
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.2.0.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "exFAT filesystem userspace utilities"
> +DESCRIPTION =3D "\
> +As new exfat filesystem is merged into linux-5.7 kernel, exfatprogs is \
> +created as an official userspace utilities that contain all of the
> standard \
> +utilities for creating and fixing and debugging exfat filesystem in linu=
x
> \
> +system. The goal of exfatprogs is to provide high performance and qualit=
y
> \
> +at the level of exfat utilities in windows. And this software is license=
d
> \
> +under the GNU General Public License Version 2."
> +HOMEPAGE =3D "https://github.com/${BPN}/${BPN}"
> +SECTION =3D "universe/otherosfs"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "
> https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
> +SRC_URI[sha256sum] =3D
> "56d9a49465deafc367d428afc71c8098705a30ee19a3cdf3c5320650b8880742"
> +
> +UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
> +UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
> +
> +inherit autotools
> +
> +RCONFLICTS:${PN} =3D "exfat-utils"
> +RREPLACES:${PN} =3D "exfat-utils"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101798):
> https://lists.openembedded.org/g/openembedded-devel/message/101798
> Mute This Topic: https://lists.openembedded.org/mt/97900208/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bc048a05f7f05e8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do we need<div>RPROVIDES:${PN} =3D &quot;exfat-utils&quot;=
<br></div><div>as well?</div><div><br></div><div>It used to be necessary fo=
r automatic update from one package to its replacement at least with opkg (=
I haven&#39;t tried on target migrations for quite some time now).</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Mar 28, 2023 at 8:48=E2=80=AFAM Christophe Vu-Brugier &lt;<a href=3D"m=
ailto:cvubrugier@fastmail.fm">cvubrugier@fastmail.fm</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">From: Christophe Vu-Bru=
gier &lt;<a href=3D"mailto:christophe.vu-brugier@seagate.com" target=3D"_bl=
ank">christophe.vu-brugier@seagate.com</a>&gt;<br>
<br>
exfatprogs provides utilities to create, modify, and check exFAT file<br>
systems on Linux. The developers of exfatprogs also maintain the Linux<br>
kernel exFAT driver.<br>
<br>
exfatprogs has replaced exfat-utils in Debian bookworm.<br>
<br>
References:<br>
=C2=A0* <a href=3D"https://github.com/exfatprogs/exfatprogs/" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/exfatprogs/exfatprogs/</a><br>
=C2=A0* <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1002=
871" rel=3D"noreferrer" target=3D"_blank">https://bugs.debian.org/cgi-bin/b=
ugreport.cgi?bug=3D1002871</a><br>
<br>
Signed-off-by: Christophe Vu-Brugier &lt;<a href=3D"mailto:christophe.vu-br=
ugier@seagate.com" target=3D"_blank">christophe.vu-brugier@seagate.com</a>&=
gt;<br>
---<br>
=C2=A0.../exfatprogs/<a href=3D"http://exfatprogs_1.2.0.bb" rel=3D"noreferr=
er" target=3D"_blank">exfatprogs_1.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 23 +++++++++++++++++++<br>
=C2=A01 file changed, 23 insertions(+)<br>
=C2=A0create mode 100644 meta-filesystems/recipes-utils/exfatprogs/<a href=
=3D"http://exfatprogs_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">exfatp=
rogs_1.2.0.bb</a><br>
<br>
diff --git a/meta-filesystems/recipes-utils/exfatprogs/<a href=3D"http://ex=
fatprogs_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">exfatprogs_1.2.0.bb=
</a> b/meta-filesystems/recipes-utils/exfatprogs/<a href=3D"http://exfatpro=
gs_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">exfatprogs_1.2.0.bb</a><b=
r>
new file mode 100644<br>
index 000000000..0b26a215b<br>
--- /dev/null<br>
+++ b/meta-filesystems/recipes-utils/exfatprogs/<a href=3D"http://exfatprog=
s_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">exfatprogs_1.2.0.bb</a><br=
>
@@ -0,0 +1,23 @@<br>
+SUMMARY =3D &quot;exFAT filesystem userspace utilities&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+As new exfat filesystem is merged into linux-5.7 kernel, exfatprogs is \<b=
r>
+created as an official userspace utilities that contain all of the standar=
d \<br>
+utilities for creating and fixing and debugging exfat filesystem in linux =
\<br>
+system. The goal of exfatprogs is to provide high performance and quality =
\<br>
+at the level of exfat utilities in windows. And this software is licensed =
\<br>
+under the GNU General Public License Version 2.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D/$%7BBPN%7D" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/${BPN}/${BPN}</a>&quo=
t;<br>
+SECTION =3D &quot;universe/otherosfs&quot;<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D/$%7BBPN%7D/rele=
ases/download/$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz</=
a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;56d9a49465deafc367d428afc71c8098705a30ee19a3c=
df3c5320650b8880742&quot;<br>
+<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D/$%7B=
BPN%7D/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/${=
BPN}/${BPN}/releases</a>&quot;<br>
+UPSTREAM_CHECK_REGEX =3D &quot;${BPN}-(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br=
>
+<br>
+inherit autotools<br>
+<br>
+RCONFLICTS:${PN} =3D &quot;exfat-utils&quot;<br>
+RREPLACES:${PN} =3D &quot;exfat-utils&quot;<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101798): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101798" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101798</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97900208/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97900208/3617156</a><br>
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

--000000000000bc048a05f7f05e8f--

