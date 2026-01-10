Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB166D277EE
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 15:10:44 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10020.1768057839996131575
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 07:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nbsU81Kz;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78fdb90b670so49093567b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057839; x=1768662639; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i8giJ9bDdZv46AGgR7scD332XSMGIZP4rDd9XGeyPZY=;
        b=nbsU81Kzxmtt1miEyU8qHtPNha6MC10LSgNg+RgOTVsrrrRu5hedhDFyz3RdkPmsHK
         t9wC+oLOYFDxQ6SHVUs3K2UVRBEOFFmxPXptHodhyJI7cu4FIQWYHBMerjRwaX+yornn
         vcemSEfMWkUfMIOLxE9lBkBL+wruZt1aD9WGOChsqmEYtmG3vyXdd5sADb/SXUBN5xaO
         mnxLJgKzNKgOdPaENI+h92wUqVJwuJTpv2gHrB3jSVe8eDyK+/80bGW3ItQg3Jg2T/Iy
         Roc2WDC/B/cqLHFn4hVVWNAm8Igftq1N+4KxkFzByB54+DgsomnmTURPbWp87ceS0Wsr
         3DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057839; x=1768662639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8giJ9bDdZv46AGgR7scD332XSMGIZP4rDd9XGeyPZY=;
        b=X/NX8YCWQYXBwQcHKZ26kQR2Be7PQvFZBqTJ/UuxaeBMt+nCfZ1w53kvvJk513EMD/
         13cua0zWhedwgNQKe/5yBTOznDGy/haB8LrFo+D8Jw9Nk+NQDWyRlPUsjhlFUuj2LkBM
         J0aA37ryW52eoACxGekV0ekJIeYcoePtmc9rerzhL57ZYipUMYuvmIqw/IzzcCqgfEET
         97lzwo+e8SOOfJqKW5LWj0/OQvZV7tG/0j/N7SYc/oxdNosoC96jGLOr/QKSyVZDf0uc
         8TDQSH6zTE83Aow/VwZWGHlVTFeU54ybwLVbUav3RBOeWsB5eEVG2EK3HnjH511NZKfz
         8zPQ==
X-Gm-Message-State: AOJu0YwL0Hbcr7tqqi7LNbPUQefhC/rvUWj7YyCzPTBMi2ZDcQUEoC9O
	nd9S9X/vejH1Jxr3fKS1PZQ7ne0YrlQ7qtuJKhYY70bvVU3oZ2wpjLvFR3UZRy+xaG4OlvBX8Aq
	6MVRDi9yO5moJZZk9GwKnOzvlB+0MEyA=
X-Gm-Gg: AY/fxX6QE1ThMfTMiD4hRnProq8i1MuUGpuPj8Wbt2+DqyNI3+UdQRtXyi8VoWz2qlA
	eIm+zbJBZDc5j+tzk+e0+pS1lbP6XDrSrh1ucu3uFUWkYeDYScB34Bg6u1cdwg78HGL879M64Km
	X0d+3Npb71ZSezEFfskZ+YmxBVLkosUQrEiZ6BQ3IwOCirDozs8eu08mpJc5EamAFgCJwJpYyXT
	52YZzbvUTdz5SF6YFxTig9rej3v926UBlPIC7eMwFBH2hoM/R7eWqrwHCudPQWTBWK3NX6w/kuG
	cmBdeiTjMbeEhnusPuvWnnV3yrVrOGn96O+p1qDk660fYx79cpcYztHpX5gWOd8F3NPjwvCc8ld
	XirPj2ENt5e17Sokr6xPbgSQgY/mhTptnbHwAbPOg6YSn6+Y/7k8ZwE8=
X-Google-Smtp-Source: AGHT+IErsx+udMAJOAQyc8malYmtPkAx8EjbeogtkeFTsmFDucZTDKyCVzc6r6/cfeSHnS/2tbpyNBen3V9/eqzsmS8=
X-Received: by 2002:a53:5a07:0:b0:646:eb06:f2e2 with SMTP id
 956f58d0204a3-64716c3ebecmr8261407d50.73.1768057838519; Sat, 10 Jan 2026
 07:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20260110133810.515672-1-yi.zhao@windriver.com> <20260110133810.515672-4-yi.zhao@windriver.com>
In-Reply-To: <20260110133810.515672-4-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Jan 2026 07:10:27 -0800
X-Gm-Features: AQt7F2pdqC98AEZkX_3Vlofa2f2BQ6nSDbqCUVKPiKLwRnzjM-puv_LA-sZk8Hk
Message-ID: <CAMKF1soqyV0pSn7d1S3g35J4D=e5TMX_UBiDYuzby+Ha1pEf6g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 4/4] nng: add ptest
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000684b2206480a0b70"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 15:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123330

--000000000000684b2206480a0b70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 5:38=E2=80=AFAM Yi Zhao via lists.openembedded.org =
<yi.zhao=3D
eng.windriver.com@lists.openembedded.org> wrote:

> Ptest results:
>
> $ run-ptest
> PASS: compat_block
> PASS: compat_bug777
> PASS: compat_bus
> PASS: compat_cmsg
> PASS: compat_device
> PASS: compat_iovec
> PASS: compat_msg
> PASS: compat_options
> PASS: compat_pair
> PASS: compat_pipeline
> PASS: compat_poll
> PASS: compat_reqrep
> PASS: compat_reqttl
> PASS: compat_shutdown
> PASS: compat_survey
> PASS: compat_surveyttl
> PASS: cplusplus_pair
> PASS: device
> PASS: files
> FAIL: httpclient
> PASS: httpserver
> PASS: inproc
> PASS: ipc
> PASS: ipcsupp
> PASS: multistress
> PASS: nonblock
> PASS: options
> PASS: pipe
> PASS: pollfd
> PASS: reqctx
> PASS: reqstress
> PASS: scalability
> PASS: synch
> PASS: tcp
> FAIL: tcp6
> PASS: tcpsupp
> PASS: tls
> PASS: ws
> PASS: wss
>

There are couple of failures here. Have you
Looked into them ? It would be good to document
That for future if we get back to fixing them


> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../recipes-connectivity/nanomsg/nng/run-ptest   | 16 ++++++++++++++++
>  .../recipes-connectivity/nanomsg/nng_1.11.bb     | 16 +++++++++++++---
>  2 files changed, 29 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
>
> diff --git a/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
> b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
> new file mode 100644
> index 0000000000..57888a77c9
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +RET=3D0
> +cd tests
> +
> +for t in $(ls *); do
> +    ./$t > /dev/null
> +    if [ $? -eq 0 ]; then
> +        echo PASS: $t
> +    else
> +        echo FAIL: $t
> +        RET=3D1
> +    fi
> +done
> +
> +exit $RET
> diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
> b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
> index e59b7f34e2..031827a5c0 100644
> --- a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
> +++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
> @@ -5,16 +5,26 @@ SECTION =3D "libs/networking"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Da41e579bb4326c21c774f8e51e41d8a3"
>
> -SRC_URI =3D "git://github.com/nanomsg/nng.git;branch=3Dstable;protocol=
=3Dhttps"
> +SRC_URI =3D "git://github.com/nanomsg/nng.git;branch=3Dstable;protocol=
=3Dhttps
> \
> +           file://run-ptest \
> +          "
> +
>  SRCREV =3D "84aa701f42968bf536141a24e826da66963b571a"
>
> -inherit cmake pkgconfig
> +inherit cmake pkgconfig ptest
>
> -EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DNNG_ENABLE_NNGCAT=3DON"
> +EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON -DNNG_ENABLE_NNGCAT=3DON \
> +                 ${@bb.utils.contains('PTEST_ENABLED', '1',
> '-DNNG_TESTS=3DON', '', d)} \
> +                "
>
>  PACKAGECONFIG ??=3D ""
>
>  PACKAGECONFIG[mbedtls] =3D
> "-DNNG_ENABLE_TLS=3DON,-DNNG_ENABLE_TLS=3DOFF,mbedtls"
>
> +do_install_ptest(){
> +    install -d ${D}/${PTEST_PATH}/tests
> +    find ${B}/tests -type f -executable -exec install {}
> ${D}${PTEST_PATH}/tests/ \;
> +}
> +
>  PACKAGES =3D+ "${PN}-tools"
>  FILES:${PN}-tools =3D "${bindir}/*"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123329):
> https://lists.openembedded.org/g/openembedded-devel/message/123329
> Mute This Topic: https://lists.openembedded.org/mt/117190746/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000684b2206480a0b70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 10, 2026 at 5:38=E2=80=AFAM=
 Yi Zhao via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@lists.openembedded=
.org">eng.windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">Ptest results:<br>
<br>
$ run-ptest<br>
PASS: compat_block<br>
PASS: compat_bug777<br>
PASS: compat_bus<br>
PASS: compat_cmsg<br>
PASS: compat_device<br>
PASS: compat_iovec<br>
PASS: compat_msg<br>
PASS: compat_options<br>
PASS: compat_pair<br>
PASS: compat_pipeline<br>
PASS: compat_poll<br>
PASS: compat_reqrep<br>
PASS: compat_reqttl<br>
PASS: compat_shutdown<br>
PASS: compat_survey<br>
PASS: compat_surveyttl<br>
PASS: cplusplus_pair<br>
PASS: device<br>
PASS: files<br>
FAIL: httpclient<br>
PASS: httpserver<br>
PASS: inproc<br>
PASS: ipc<br>
PASS: ipcsupp<br>
PASS: multistress<br>
PASS: nonblock<br>
PASS: options<br>
PASS: pipe<br>
PASS: pollfd<br>
PASS: reqctx<br>
PASS: reqstress<br>
PASS: scalability<br>
PASS: synch<br>
PASS: tcp<br>
FAIL: tcp6<br>
PASS: tcpsupp<br>
PASS: tls<br>
PASS: ws<br>
PASS: wss<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">There are couple=
 of failures here. Have you</div><div dir=3D"auto">Looked into them ? It wo=
uld be good to document</div><div dir=3D"auto">That for future if we get ba=
ck to fixing them=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-connectivity/nanomsg/nng/run-ptest=C2=A0 =C2=A0| 16 +++++=
+++++++++++<br>
=C2=A0.../recipes-connectivity/nanomsg/<a href=3D"http://nng_1.11.bb" rel=
=3D"noreferrer" target=3D"_blank">nng_1.11.bb</a>=C2=A0 =C2=A0 =C2=A0| 16 +=
++++++++++++---<br>
=C2=A02 files changed, 29 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-connectivity/nanomsg/nng/r=
un-ptest<br>
<br>
diff --git a/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest b/m=
eta-networking/recipes-connectivity/nanomsg/nng/run-ptest<br>
new file mode 100644<br>
index 0000000000..57888a77c9<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest<br>
@@ -0,0 +1,16 @@<br>
+#!/bin/sh<br>
+<br>
+RET=3D0<br>
+cd tests<br>
+<br>
+for t in $(ls *); do<br>
+=C2=A0 =C2=A0 ./$t &gt; /dev/null<br>
+=C2=A0 =C2=A0 if [ $? -eq 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo PASS: $t<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo FAIL: $t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RET=3D1<br>
+=C2=A0 =C2=A0 fi<br>
+done<br>
+<br>
+exit $RET<br>
diff --git a/meta-networking/recipes-connectivity/nanomsg/<a href=3D"http:/=
/nng_1.11.bb" rel=3D"noreferrer" target=3D"_blank">nng_1.11.bb</a> b/meta-n=
etworking/recipes-connectivity/nanomsg/<a href=3D"http://nng_1.11.bb" rel=
=3D"noreferrer" target=3D"_blank">nng_1.11.bb</a><br>
index e59b7f34e2..031827a5c0 100644<br>
--- a/meta-networking/recipes-connectivity/nanomsg/<a href=3D"http://nng_1.=
11.bb" rel=3D"noreferrer" target=3D"_blank">nng_1.11.bb</a><br>
+++ b/meta-networking/recipes-connectivity/nanomsg/<a href=3D"http://nng_1.=
11.bb" rel=3D"noreferrer" target=3D"_blank">nng_1.11.bb</a><br>
@@ -5,16 +5,26 @@ SECTION =3D &quot;libs/networking&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Da41e579bb4326c21c=
774f8e51e41d8a3&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/nanomsg/nng.git;branc=
h=3Dstable;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/nanomsg/nng.git;branch=3Dstable;protocol=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/nanomsg/nng.git;branc=
h=3Dstable;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/nanomsg/nng.git;branch=3Dstable;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
=C2=A0SRCREV =3D &quot;84aa701f42968bf536141a24e826da66963b571a&quot;<br>
<br>
-inherit cmake pkgconfig<br>
+inherit cmake pkgconfig ptest<br>
<br>
-EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON -DNNG_ENABLE_NNGCAT=3DON&=
quot;<br>
+EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON -DNNG_ENABLE_NNGCAT=3DON =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.=
contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;, &#39;-DNNG_TESTS=3DON&#39;, =
&#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
<br>
=C2=A0PACKAGECONFIG[mbedtls] =3D &quot;-DNNG_ENABLE_TLS=3DON,-DNNG_ENABLE_T=
LS=3DOFF,mbedtls&quot;<br>
<br>
+do_install_ptest(){<br>
+=C2=A0 =C2=A0 install -d ${D}/${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 find ${B}/tests -type f -executable -exec install {} ${D}${P=
TEST_PATH}/tests/ \;<br>
+}<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-tools&quot;<br>
=C2=A0FILES:${PN}-tools =3D &quot;${bindir}/*&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123329): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123329" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123329</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117190746/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117190746/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000684b2206480a0b70--

