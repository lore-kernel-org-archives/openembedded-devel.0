Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC1BEB8FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 08:46:50 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.4170.1693990004261255003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 01:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=j7q992/h;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so55907781fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693990002; x=1694594802; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CBBoQcOtcK7cr8NM36KFwp9iZ11AQhXLW7PizarItuE=;
        b=j7q992/h4grgjobXiwK+5REqNV+XhnD0TBkm+yUB/jeXyJdFoerdwqVQmT+AsyH52C
         ACwbhni1bL0Xkel9ps99EI1KPkKwcGHZie+pf8hd/Q/Bqg8c+hluoOL4x0eEUoBW+r0I
         y1bby+53iM/B8/F7ZQtKxX3QdwIu3Jdpbx5I9kPbEeAHRVUqZeODUC3oRqnOHjDMtXI3
         MJD9AkeZZ0ZXEGc/5b4Jb2w9OVEPwWvXFL9vJtz10KEIr5IWKKxidKUAzW4PDQm9KIcG
         RE+ic5ca883yT2EK3zXr7uhPOiFnOwMZhfMf2LDyJYRK8Q2T/kkzUch9UfDCb3pP1s1J
         fOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693990002; x=1694594802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBBoQcOtcK7cr8NM36KFwp9iZ11AQhXLW7PizarItuE=;
        b=C3CgM1S1BGAhMH8z/VAQuqQYBggoYmXx/H91UayMB5Rc7PJvznyKNW2bV1P2TiE0ox
         7CqotNt6plrefRURy46qCK7kZMj6r6Nr76moARIMSwawA52ZxPPeRqT7zaZMRCOxuwmG
         1B1+mVFQCMm2irT/qIAC36ArGzb+Ork/0QISFGISUz5zo0qgxY9bt26S8+njKFxtuKzt
         t4vLKrzPxYGM3CfHCX8f1BhSaoXpm1WlxiSEh7wbbOzvyaOzw28e769xnKjJQfbC2jCR
         lsaKIv/wwZn1rMgZPpwFZVlF4JN8e9DCsoVxAPCxoB1OB2Jf7QzmOHSwKe9dMvuCecdc
         IX6A==
X-Gm-Message-State: AOJu0YyAi7h7+ADK76XpnenjKpkYLU2zhL19YPJKenerCIr4W3G1P0tV
	u2um21v24OrfU6jHsncD+WLUjq4PhExhMvLGFlcn+IMUDnU=
X-Google-Smtp-Source: AGHT+IF6T64FoPATWJDMBQTvJeLJpXNbCCmY6Y3oaQGaztn0Oylk7V+ZaGtTSfC7YRMj8LHMrMPbj9Gy0ui1Q231Ehk=
X-Received: by 2002:a2e:860b:0:b0:2bc:f756:341 with SMTP id
 a11-20020a2e860b000000b002bcf7560341mr1593059lji.35.1693990001914; Wed, 06
 Sep 2023 01:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <1693965700-14701-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1693965700-14701-1-git-send-email-wangmy@fujitsu.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 6 Sep 2023 10:46:29 +0200
Message-ID: <CAJiuCcdg_U8PdQFFL-+y4b5Dy6HjTUs8ON13gSN7Xs3pewrfkQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.24.1 -> 4.24.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000513be80604acc8cd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 08:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104771

--000000000000513be80604acc8cd
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 6 Sept 2023 at 04:02, wangmy <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>  Fixes for 32-bit MSVC.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-protobuf_4.24.1.bb => python3-protobuf_4.24.2.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-protobuf_4.24.1.bb
> => python3-protobuf_4.24.2.bb} (92%)
>

Does it make sense to continue bumping the python3 protobuf package without
bumping protobuf itself?

The protobuf is stuck at 3.21.12.

Regards,
Clement



>
> diff --git a/meta-python/recipes-devtools/python/
> python3-protobuf_4.24.1.bb b/meta-python/recipes-devtools/python/
> python3-protobuf_4.24.2.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb
> rename to meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
> index 6322ec1f30..3014884a33 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_4.24.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_4.24.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
>
>  inherit pypi setuptools3
>  SRC_URI +=
> "file://0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch"
> -SRC_URI[sha256sum] =
> "44837a5ed9c9418ad5d502f89f28ba102e9cd172b6668bc813f21716f9273348"
> +SRC_URI[sha256sum] =
> "7fda70797ddec31ddfa3576cbdcc3ddbb6b3078b737a1a87ab9136af0570cd6e"
>
>  # http://errors.yoctoproject.org/Errors/Details/184715/
>  # Can't find required file: ../src/google/protobuf/descriptor.proto
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104754):
> https://lists.openembedded.org/g/openembedded-devel/message/104754
> Mute This Topic: https://lists.openembedded.org/mt/101185171/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> peron.clem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000513be80604acc8cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">Hi,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 6 Sept 2023 at 04:02, wangmy &lt;<a h=
ref=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &lt;<=
a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</=
a>&gt;<br>
<br>
Changelog:<br>
=C2=A0Fixes for 32-bit MSVC. <br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-protobuf_4.24.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-protobuf_4.24.1.bb</a> =3D&gt; <a href=3D"http:/=
/python3-protobuf_4.24.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-p=
rotobuf_4.24.2.bb</a>}=C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-protobuf_4.24.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_=
4.24.1.bb</a> =3D&gt; <a href=3D"http://python3-protobuf_4.24.2.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-protobuf_4.24.2.bb</a>} (92%)<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-fam=
ily:monospace">Does it make sense to continue bumping the python3 protobuf =
package without bumping protobuf itself?</div><div class=3D"gmail_default" =
style=3D"font-family:monospace"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:monospace">The protobuf is stuck at 3.21.12.</div><div cla=
ss=3D"gmail_default" style=3D"font-family:monospace"><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace">Regards,</div><div class=
=3D"gmail_default" style=3D"font-family:monospace">Clement</div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
protobuf_4.24.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_4=
.24.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-protobuf_4.24.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf=
_4.24.2.bb</a><br>
similarity index 92%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
rotobuf_4.24.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_4.=
24.1.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pro=
tobuf_4.24.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_4.24=
.2.bb</a><br>
index 6322ec1f30..3014884a33 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-protobu=
f_4.24.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_4.24.1.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-protobu=
f_4.24.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_4.24.2.b=
b</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D8;en=
dline=3D8;md5=3D53dbfa56f61b90215a<br>
<br>
=C2=A0inherit pypi setuptools3<br>
=C2=A0SRC_URI +=3D &quot;file://0001-message.c-Cast-uintptr_t-types-to-upb_=
MessageDef.patch&quot;<br>
-SRC_URI[sha256sum] =3D &quot;44837a5ed9c9418ad5d502f89f28ba102e9cd172b6668=
bc813f21716f9273348&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7fda70797ddec31ddfa3576cbdcc3ddbb6b3078b737a1=
a87ab9136af0570cd6e&quot;<br>
<br>
=C2=A0# <a href=3D"http://errors.yoctoproject.org/Errors/Details/184715/" r=
el=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/D=
etails/184715/</a><br>
=C2=A0# Can&#39;t find required file: ../src/google/protobuf/descriptor.pro=
to<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104754): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104754" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104754</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101185171/424=
0582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101185171/4240582</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:peron.clem@gmail.com" ta=
rget=3D"_blank">peron.clem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000513be80604acc8cd--

