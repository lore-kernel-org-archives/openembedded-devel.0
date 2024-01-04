Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C93C4707C
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 20:16:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.4837.1704399405192005602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jan 2024 12:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hUITSKAH;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d3f29fea66so6108895ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 12:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704399404; x=1705004204; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R2gnM3okNK/8ci/GBxRw0Q7RHp12AggQw7uerg9eABo=;
        b=hUITSKAHfy6L/L5M/UN1qYTA+KFuSdqETksJ/ysiJWvlM3aEy+JxFwUWXj+7BB1rj/
         yoqPy2xNbdvtnW+9AYysa3aJwYWQaPvYgvevC6VyEbGoNbW6aPCuhLII1LI3ypUW6+nR
         /JtGIGdjo9ZrzrgwxhD5v2oc+DfWiSK6ZwRQAYVhcwSkHJSAY/v3nvAN1rMTVZ5KLZYD
         G1Q1Zxa89sM9FEDqWG6xQc764zK9O2tT48m/QAQMepdD22TT4YcI7r6KueyWosptoC4u
         x16pFggGPIpV2Ewn/pR/V+9fGFvmezDiIiZRxfFp6LAVFqkVNqwVeub4d4J9ILpP6FOD
         l+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704399404; x=1705004204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2gnM3okNK/8ci/GBxRw0Q7RHp12AggQw7uerg9eABo=;
        b=vbLBN6aX7Y0I06c70wU6zcAbgYnpA/oXtq25DFqm4jFuInqX7JMncgqj1h16QEA9pz
         6vACJuhmIOcw4z/6WvapoFtaEz0tVWpODzL1v8WbdcnWnrSCYWeRixTxilj009bqDwkF
         T72j82tsIcpLB++knkwH53vK4vp329O1NqvyOmAwRpX4RhsOuRX+/ASAnNFD5amgEoVc
         Za3wFp8eL+MeGB34xcTNKwhLxgSpdFfaWpq/7tazl9xzkT+Vz8OeaG94aPumPoePaTxp
         0ZhxjmI9viVfMuObnQMDs17RVOgtiXb52M/h+wq9vKQqo/KglRY6dFH51bScwSm1Es4N
         uMFA==
X-Gm-Message-State: AOJu0Yxx5Pagtxh2oA9PSbtHbRH6MfKn5TLUGEEp57Omi/wkNkAab9kd
	WO4drjWySC5OZ7kJsuMsROQ9OluzUeywBOde5II=
X-Google-Smtp-Source: AGHT+IG8/HtYm85KiBqpmCnIqCIKvJFgXPjABkHSWdGl3jmRiEFqsUtEDvxc5fwcrb6EEXEVmJjJhnFv4rKKo4j0/vY=
X-Received: by 2002:a17:90a:d3d3:b0:28c:61e9:bc54 with SMTP id
 d19-20020a17090ad3d300b0028c61e9bc54mr1040093pjw.59.1704399403873; Thu, 04
 Jan 2024 12:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20240103065145.170716-1-alperyasinak1@gmail.com> <CAMKF1srZeNTbYU=Oe-1ojyy18cNf4RANKpsSghRPM0E8QfadxA@mail.gmail.com>
In-Reply-To: <CAMKF1srZeNTbYU=Oe-1ojyy18cNf4RANKpsSghRPM0E8QfadxA@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 4 Jan 2024 23:16:32 +0300
Message-ID: <CAGpma=7L_EUSnTFd5vXCcvOh4JwnPx6k49jWEvecJ8qVQqmrow@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] librdkafka: upgrade 1.8.2 -> 2.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000005f85a060e24696c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jan 2024 20:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108041

--00000000000005f85a060e24696c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was going to look but you already solved it. I tried with this commit you
just pushed
https://github.com/openembedded/meta-openembedded/commit/e36e872efc896ba4e3=
80a0580ecaa69409f96485
and it seems to be solved. I guess I don't need to do anything, right? I
just need to understand what you did to learn :)

Khem Raj <raj.khem@gmail.com>, 4 Oca 2024 Per, 22:15 tarihinde =C5=9Funu ya=
zd=C4=B1:

> this is causing libcppkafta builds to fail
>
> | DEBUG: Executing shell function do_compile
> | NOTE: cmake --build
>
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/libcppkafka/0.4.0+git=
/build
> --target all --
> | ninja: error: '/usr/lib/libcurl.so', needed by
> 'src/lib/libcppkafka.so.0.4.0', missing and no known rule to make it
>
> also see
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3484/st=
eps/14/logs/stdio
>
> On Tue, Jan 2, 2024 at 10:51=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com=
> wrote:
> >
> > * License-Update: Copyright year changed
> > * 0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch dropped because fixed in th=
e
> new version
> > * Fix -> WARNING: librdkafka-2.3.0-r0 do_package_qa: QA Issue: File
> /usr/lib/cmake/RdKafka/RdKafkaTargets.cmake in package librdkafka-dev
> contains reference to TMPDIR [buildpaths]
> >
> > Changelog:
> >
> > https://github.com/confluentinc/librdkafka/blob/v2.3.0/CHANGELOG.md
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  .../0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch | 30 -------------------
> >  ...ibrdkafka_1.8.2.bb =3D> librdkafka_2.3.0.bb} | 21 +++++++------
> >  2 files changed, 12 insertions(+), 39 deletions(-)
> >  delete mode 100644
> meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTAL=
L_LIBDIR.patch
> >  rename meta-oe/recipes-support/librdkafka/{librdkafka_1.8.2.bb =3D>
> librdkafka_2.3.0.bb} (59%)
> >
> > diff --git
> a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INST=
ALL_LIBDIR.patch
> b/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INST=
ALL_LIBDIR.patch
> > deleted file mode 100644
> > index 053a4cc2d..000000000
> > ---
> a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INST=
ALL_LIBDIR.patch
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -From ed1dd35e0e23a98e57567718a0d474fd29cc348a Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 19 Mar 2022 21:36:41 -0700
> > -Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR
> > -
> > -this ensures that it is portable across platforms e.g. ppc64/linux
> > -uses lib64 not lib
> > -
> > -Upstream-Status: Submitted [
> https://github.com/edenhill/librdkafka/pull/3770]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - CMakeLists.txt | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index d1129bce..774473fa 100644
> > ---- a/CMakeLists.txt
> > -+++ b/CMakeLists.txt
> > -@@ -219,7 +219,7 @@ configure_file("packaging/cmake/config.h.in"
> "${GENERATED_DIR}/config.h")
> > -
> > - include(GNUInstallDirs)
> > -
> > --set(config_install_dir "lib/cmake/${PROJECT_NAME}")
> > -+set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}=
")
> > -
> > - set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
> > -
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> b/meta-oe/recipes-support/librdkafka/librdkafka_2.3.0.bb
> > similarity index 59%
> > rename from meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> > rename to meta-oe/recipes-support/librdkafka/librdkafka_2.3.0.bb
> > index 6148e7cb0..5b6e94d56 100644
> > --- a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
> > +++ b/meta-oe/recipes-support/librdkafka/librdkafka_2.3.0.bb
> > @@ -5,19 +5,22 @@ HOMEPAGE =3D "https://github.com/edenhill/librdkafka"
> >  SECTION =3D "libs"
> >  LICENSE =3D "BSD-2-Clause"
> >
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2be8675acbfdac48935e73897af=
5f646"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D40b04809b5d6f648f20f45143cb=
cb1ad"
> >
> > -SRC_URI =3D "git://
> github.com/edenhill/librdkafka;protocol=3Dhttps;branch=3Dmaster \
> > -           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch \
> > -          "
> > -SRCREV =3D "063a9ae7a65cebdf1cc128da9815c05f91a2a996"
> > +SRC_URI =3D "git://
> github.com/edenhill/librdkafka;protocol=3Dhttps;branch=3Dmaster"
> > +SRCREV =3D "95a542c87c61d2c45b445f91c73dd5442eb04f3c"
> >
> > -DEPENDS =3D "zlib openssl zstd"
> > -
> > -inherit cmake
> > +DEPENDS =3D "zlib curl zstd openssl"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -FILES:${PN} +=3D "${datadir}"
> > +inherit pkgconfig cmake
> >
> >  EXTRA_OECMAKE +=3D "-DRDKAFKA_BUILD_EXAMPLES=3DOFF
> -DRDKAFKA_BUILD_TESTS=3DOFF"
> > +
> > +do_install:append() {
> > +       # remove absolute paths
> > +       sed -i -e 's|${RECIPE_SYSROOT}||g'
> ${D}${libdir}/cmake/RdKafka/RdKafkaTargets.cmake
> > +}
> > +
> > +FILES:${PN} +=3D "${datadir}"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108024):
> https://lists.openembedded.org/g/openembedded-devel/message/108024
> > Mute This Topic: https://lists.openembedded.org/mt/103497939/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000005f85a060e24696c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was going to look but you already solved it. I tried wit=
h this commit you just pushed <a href=3D"https://github.com/openembedded/me=
ta-openembedded/commit/e36e872efc896ba4e380a0580ecaa69409f96485">https://gi=
thub.com/openembedded/meta-openembedded/commit/e36e872efc896ba4e380a0580eca=
a69409f96485</a> and it seems to be solved. I guess I don&#39;t need to do =
anything, right? I just need to understand what you did to learn :)</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;, 4 Oc=
a 2024 Per, 22:15 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">this is causing libcppkafta builds to fai=
l<br>
<br>
| DEBUG: Executing shell function do_compile<br>
| NOTE: cmake --build<br>
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/libcppkafka/0.4.0+git/b=
uild<br>
--target all --<br>
| ninja: error: &#39;/usr/lib/libcurl.so&#39;, needed by<br>
&#39;src/lib/libcppkafka.so.0.4.0&#39;, missing and no known rule to make i=
t<br>
<br>
also see<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/build=
s/3484/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3484/steps/14/logs/=
stdio</a><br>
<br>
On Tue, Jan 2, 2024 at 10:51=E2=80=AFPM Alper Ak &lt;<a href=3D"mailto:alpe=
ryasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; * License-Update: Copyright year changed<br>
&gt; * 0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch dropped because fixed in t=
he new version<br>
&gt; * Fix -&gt; WARNING: librdkafka-2.3.0-r0 do_package_qa: QA Issue: File=
 /usr/lib/cmake/RdKafka/RdKafkaTargets.cmake in package librdkafka-dev cont=
ains reference to TMPDIR [buildpaths]<br>
&gt;<br>
&gt; Changelog:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/confluentinc/librdkafka/blob/v2.3.0/CHAN=
GELOG.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/confluent=
inc/librdkafka/blob/v2.3.0/CHANGELOG.md</a><br>
&gt;<br>
&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" =
target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch | 30 -------------=
------<br>
&gt;=C2=A0 ...<a href=3D"http://ibrdkafka_1.8.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ibrdkafka_1.8.2.bb</a> =3D&gt; <a href=3D"http://librdkafka_2=
.3.0.bb" rel=3D"noreferrer" target=3D"_blank">librdkafka_2.3.0.bb</a>} | 21=
 +++++++------<br>
&gt;=C2=A0 2 files changed, 12 insertions(+), 39 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/librdkafka/librdkafka=
/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-support/librdkafka/{<a href=3D"http://lib=
rdkafka_1.8.2.bb" rel=3D"noreferrer" target=3D"_blank">librdkafka_1.8.2.bb<=
/a> =3D&gt; <a href=3D"http://librdkafka_2.3.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">librdkafka_2.3.0.bb</a>} (59%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-=
Use-CMAKE_INSTALL_LIBDIR.patch b/meta-oe/recipes-support/librdkafka/librdka=
fka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 053a4cc2d..000000000<br>
&gt; --- a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMA=
KE_INSTALL_LIBDIR.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,30 +0,0 @@<br>
&gt; -From ed1dd35e0e23a98e57567718a0d474fd29cc348a Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Sat, 19 Mar 2022 21:36:41 -0700<br>
&gt; -Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR<br>
&gt; -<br>
&gt; -this ensures that it is portable across platforms e.g. ppc64/linux<br=
>
&gt; -uses lib64 not lib<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/edenhill/li=
brdkafka/pull/3770" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/edenhill/librdkafka/pull/3770</a>]<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - CMakeLists.txt | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; -index d1129bce..774473fa 100644<br>
&gt; ---- a/CMakeLists.txt<br>
&gt; -+++ b/CMakeLists.txt<br>
&gt; -@@ -219,7 +219,7 @@ configure_file(&quot;packaging/cmake/<a href=3D"h=
ttp://config.h.in" rel=3D"noreferrer" target=3D"_blank">config.h.in</a>&quo=
t; &quot;${GENERATED_DIR}/config.h&quot;)<br>
&gt; -<br>
&gt; - include(GNUInstallDirs)<br>
&gt; -<br>
&gt; --set(config_install_dir &quot;lib/cmake/${PROJECT_NAME}&quot;)<br>
&gt; -+set(config_install_dir &quot;${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT=
_NAME}&quot;)<br>
&gt; -<br>
&gt; - set(generated_dir &quot;${CMAKE_CURRENT_BINARY_DIR}/generated&quot;)=
<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.35.1<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-support/librdkafka/<a href=3D"http://libr=
dkafka_1.8.2.bb" rel=3D"noreferrer" target=3D"_blank">librdkafka_1.8.2.bb</=
a> b/meta-oe/recipes-support/librdkafka/<a href=3D"http://librdkafka_2.3.0.=
bb" rel=3D"noreferrer" target=3D"_blank">librdkafka_2.3.0.bb</a><br>
&gt; similarity index 59%<br>
&gt; rename from meta-oe/recipes-support/librdkafka/<a href=3D"http://librd=
kafka_1.8.2.bb" rel=3D"noreferrer" target=3D"_blank">librdkafka_1.8.2.bb</a=
><br>
&gt; rename to meta-oe/recipes-support/librdkafka/<a href=3D"http://librdka=
fka_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">librdkafka_2.3.0.bb</a><=
br>
&gt; index 6148e7cb0..5b6e94d56 100644<br>
&gt; --- a/meta-oe/recipes-support/librdkafka/<a href=3D"http://librdkafka_=
1.8.2.bb" rel=3D"noreferrer" target=3D"_blank">librdkafka_1.8.2.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/librdkafka/<a href=3D"http://librdkafka_=
2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">librdkafka_2.3.0.bb</a><br>
&gt; @@ -5,19 +5,22 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/ede=
nhill/librdkafka" rel=3D"noreferrer" target=3D"_blank">https://github.com/e=
denhill/librdkafka</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;BSD-2-Clause&quot;<br>
&gt;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2be8675acbfdac48935e7=
3897af5f646&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D40b04809b5d6f648f20f4=
5143cbcb1ad&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/edenhill/librdka=
fka;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
github.com/edenhill/librdkafka;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cmake-Use-CMAKE_=
INSTALL_LIBDIR.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; -SRCREV =3D &quot;063a9ae7a65cebdf1cc128da9815c05f91a2a996&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/edenhill/librdka=
fka;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
github.com/edenhill/librdkafka;protocol=3Dhttps;branch=3Dmaster</a>&quot;<b=
r>
&gt; +SRCREV =3D &quot;95a542c87c61d2c45b445f91c73dd5442eb04f3c&quot;<br>
&gt;<br>
&gt; -DEPENDS =3D &quot;zlib openssl zstd&quot;<br>
&gt; -<br>
&gt; -inherit cmake<br>
&gt; +DEPENDS =3D &quot;zlib curl zstd openssl&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -FILES:${PN} +=3D &quot;${datadir}&quot;<br>
&gt; +inherit pkgconfig cmake<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECMAKE +=3D &quot;-DRDKAFKA_BUILD_EXAMPLES=3DOFF -DRDKAFK=
A_BUILD_TESTS=3DOFF&quot;<br>
&gt; +<br>
&gt; +do_install:append() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# remove absolute paths<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s|${RECIPE_SYSROOT}||g&#39;=
 ${D}${libdir}/cmake/RdKafka/RdKafkaTargets.cmake<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES:${PN} +=3D &quot;${datadir}&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#108024): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/108024" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/108024</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10349793=
9/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103497939/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000005f85a060e24696c--

