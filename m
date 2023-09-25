Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C83CD54BE
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:59:11 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.356.1695668345547586346
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mZXfANOb;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso48001645ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 11:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695668345; x=1696273145; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1wF6abe1nzCqA/TME6qNVClMgdAopL0RUuAHftP7dfg=;
        b=mZXfANObOIz8ouebbaps10wNaURwOCEdUott6ni1IJF6c2iBI4OQWgkiPHnebNzjxW
         CuRUEH28ynHZsB9fpAsDeW3SrpUgd2gDt0f9L+DhGYQpp88OdGjt2Aacvh7E7gFlacV/
         u+kfh5mHr8dOcxx0BFLZjBz9lV7KTFAA4Gt0+4h5/XhkWJEZJNT3Dw+SjxdkVVKctCNQ
         u8Y7FFGDFJwKDAHhPD2DprrQplhF+1XDN5pQ610iW0e2kMMIvrq1V74JCPcjxzDArfTs
         ddP7gmQU+qJeDrnfatL+typXsG/z8qn1C98fza5oPv09x3fQghVbepoowKkJuOQsR2Un
         b9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695668345; x=1696273145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wF6abe1nzCqA/TME6qNVClMgdAopL0RUuAHftP7dfg=;
        b=e1s7qlT0Jvull7hwo+h7Eb/O0zxOqC3LY8VBc/Ip1vwdaTNw1kilKAMmEqBCGBsNs1
         tUtMCciSfCjXzLsXSEzqeITwgeK9G9m+/uCZaJ+w3/I7fLRD6z5/339uVtB83wwkdg8J
         8gzJVzFRwTKA4TJWjFR036E/MUEotXjeX3E4W0S9qNGlEPZIHBZjPacwkon2KrrSyPtp
         jXhikcWWgIOhWXoieaCSrLK29dM41WnPvw7X+wlweeNs54fPl1k0K7rqJFCWnqi77xeW
         DTPGw7wVSRWFoflrbIgboTc/bBORwSuGbGBFw8GkeDxG3nfUxVDCvhwda4Xz+7KrT1zX
         pLtQ==
X-Gm-Message-State: AOJu0YwZsaY0MFbSUgXrx5pU6l44jKJmMhfScA2SkScsGtNlNfnp3FU1
	0t9R4YwrkdVIOo1wAMaX/AMghhF+zsVYvl6uINk=
X-Google-Smtp-Source: AGHT+IGPfilMTr+HOKX7FpMxSCnA5RbRPDaiLfeXHNOBzp7MzTg13f0ZeYv0ICKkpKvSH6G4w/SSrgwjPNR060QlO+s=
X-Received: by 2002:a17:903:41cc:b0:1c1:d4f4:cd3c with SMTP id
 u12-20020a17090341cc00b001c1d4f4cd3cmr6789639ple.31.1695668344705; Mon, 25
 Sep 2023 11:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230925131349.12941-1-costamagnagianfranco@yahoo.it> <CAMKF1soBhLJudUsZ0MLcC2Xhg4nkm7Li12Akz0KBRy8dD6fKwg@mail.gmail.com>
In-Reply-To: <CAMKF1soBhLJudUsZ0MLcC2Xhg4nkm7Li12Akz0KBRy8dD6fKwg@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Mon, 25 Sep 2023 20:58:51 +0200
Message-ID: <CAATN8PVgOT9EGiDrUnWiWtvjvOhydyog2Y-zme1r-GEjs3hFgg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mosquitto: upgrade 2.0.17 -> 2.0.18
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Content-Type: multipart/alternative; boundary="00000000000057d85d0606338d41"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 18:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105132

--00000000000057d85d0606338d41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, since I maintain the same patch set for both Debian, Ubuntu and
meta-oe, I would prefer to use cp to keep them in sync between releases...
(whenever possible, specially for upstream proposed PRs)

If you want me to add it anyway, please let me know!

G.

On Mon, Sep 25, 2023, 19:58 Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Sep 25, 2023 at 6:15=E2=80=AFAM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Add two patches from Debian, pull requests proposed upstream as 2894 an=
d
> 2895
> > to make it start only when board is online, and to fix dynamic
> websockets link failure
> > ---
> >  .../mosquitto/files/2894.patch                | 23 +++++++++++++++++
> >  .../mosquitto/files/2895.patch                | 25 +++++++++++++++++++
> >  ...osquitto_2.0.17.bb =3D> mosquitto_2.0.18.bb} |  4 ++-
> >  3 files changed, 51 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> >  create mode 100644
> meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> >  rename meta-networking/recipes-connectivity/mosquitto/{
> mosquitto_2.0.17.bb =3D> mosquitto_2.0.18.bb} (95%)
> >
> > diff --git
> a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> > new file mode 100644
> > index 000000000..3275e57e3
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> > @@ -0,0 +1,23 @@
> > +From: Joachim Zobel <jz-2017@heute-morgen.de>
> > +Date: Wed, 13 Sep 2023 09:55:34 +0200
> > +Subject: [PATCH] Link correctly with shared websockets library if
> needed see:
> > + https://github.com/eclipse/mosquitto/pull/2751
> > +
> > +Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and
> Daniel Engberg <daniel.engberg.lists@pyret.net>
>
> It will be good to annotate the patch with Signed-off-by and
> Upstream-Status:
>
>
> https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.ht=
ml?highlight=3Dupstream+status#patch-upstream-status
>
> > +---
> > + src/CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> > +index 9380a04..dce8313 100644
> > +--- a/src/CMakeLists.txt
> > ++++ b/src/CMakeLists.txt
> > +@@ -200,7 +200,7 @@ if (WITH_WEBSOCKETS)
> > +                       link_directories(${mosquitto_SOURCE_DIR})
> > +               endif (WIN32)
> > +       else (STATIC_WEBSOCKETS)
> > +-              set (MOSQ_LIBS ${MOSQ_LIBS} websockets)
> > ++              set (MOSQ_LIBS ${MOSQ_LIBS} websockets_shared)
> > +       endif (STATIC_WEBSOCKETS)
> > + endif (WITH_WEBSOCKETS)
> > +
> > diff --git
> a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> > new file mode 100644
> > index 000000000..a9e9c97b8
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> > @@ -0,0 +1,25 @@
> > +From: Joachim Zobel <jz-2017@heute-morgen.de>
> > +Date: Wed, 13 Sep 2023 10:05:43 +0200
> > +Subject: [PATCH] Mosquitto now waits for network-online when starting
> > + (Closes: #1036450)
> > +
> > +See: https://github.com/eclipse/mosquitto/issues/2878
> > +---
> > + service/systemd/mosquitto.service.simple | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/service/systemd/mosquitto.service.simple
> b/service/systemd/mosquitto.service.simple
> > +index 15ee0d6..c2a330b 100644
> > +--- a/service/systemd/mosquitto.service.simple
> > ++++ b/service/systemd/mosquitto.service.simple
> > +@@ -1,8 +1,8 @@
> > + [Unit]
> > + Description=3DMosquitto MQTT Broker
> > + Documentation=3Dman:mosquitto.conf(5) man:mosquitto(8)
> > +-After=3Dnetwork.target
> > +-Wants=3Dnetwork.target
> > ++After=3Dnetwork-online.target
> > ++Wants=3Dnetwork-online.target
> > +
> > + [Service]
> > + ExecStart=3D/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
> > diff --git a/meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.0.17.bb b/meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.0.18.bb
> > similarity index 95%
> > rename from meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.0.17.bb
> > rename to meta-networking/recipes-connectivity/mosquitto/
> mosquitto_2.0.18.bb
> > index 690b6bc12..0c9ccc810 100644
> > --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.b=
b
> > +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.18.b=
b
> > @@ -17,9 +17,11 @@ DEPENDS =3D "uthash cjson"
> >  SRC_URI =3D "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz =
\
> >             file://mosquitto.init \
> >             file://1571.patch \
> > +           file://2894.patch \
> > +           file://2895.patch \
> >  "
> >
> > -SRC_URI[sha256sum] =3D
> "3be7a911236567c1a9fbe25baf3e3167004ba4a0c151a448ef1f7fc077dba52f"
> > +SRC_URI[sha256sum] =3D
> "d665fe7d0032881b1371a47f34169ee4edab67903b2cd2b4c083822823f4448a"
> >
> >  inherit systemd update-rc.d useradd cmake pkgconfig
> >
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105128):
> https://lists.openembedded.org/g/openembedded-devel/message/105128
> > Mute This Topic: https://lists.openembedded.org/mt/101573484/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000057d85d0606338d41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello, since I maintain the same patch set for both Debia=
n, Ubuntu and meta-oe, I would prefer to use cp to keep them in sync betwee=
n releases... (whenever possible, specially for upstream proposed PRs)<div =
dir=3D"auto"><br></div><div dir=3D"auto">If you want me to add it anyway,=
=C2=A0please let me know!</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">G.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, Sep 25, 2023, 19:58 Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Mon, Sep 25, 2023 at 6:15=E2=80=AFAM Gianfranco<br>
&lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">costamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add two patches from Debian, pull requests proposed upstream as 2894 a=
nd 2895<br>
&gt; to make it start only when board is online, and to fix dynamic websock=
ets link failure<br>
&gt; ---<br>
&gt;=C2=A0 .../mosquitto/files/2894.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 23 +++++++++++++++++<br>
&gt;=C2=A0 .../mosquitto/files/2895.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 25 +++++++++++++++++++<br>
&gt;=C2=A0 ...<a href=3D"http://osquitto_2.0.17.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">osquitto_2.0.17.bb</a> =3D&gt; <a href=3D"http://m=
osquitto_2.0.18.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mosquit=
to_2.0.18.bb</a>} |=C2=A0 4 ++-<br>
&gt;=C2=A0 3 files changed, 51 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/mosquitt=
o/files/2894.patch<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-connectivity/mosquitt=
o/files/2895.patch<br>
&gt;=C2=A0 rename meta-networking/recipes-connectivity/mosquitto/{<a href=
=3D"http://mosquitto_2.0.17.bb" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">mosquitto_2.0.17.bb</a> =3D&gt; <a href=3D"http://mosquitto_2.0.18.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">mosquitto_2.0.18.bb</a>} (=
95%)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894=
.patch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 000000000..3275e57e3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<=
br>
&gt; @@ -0,0 +1,23 @@<br>
&gt; +From: Joachim Zobel &lt;<a href=3D"mailto:jz-2017@heute-morgen.de" ta=
rget=3D"_blank" rel=3D"noreferrer">jz-2017@heute-morgen.de</a>&gt;<br>
&gt; +Date: Wed, 13 Sep 2023 09:55:34 +0200<br>
&gt; +Subject: [PATCH] Link correctly with shared websockets library if nee=
ded see:<br>
&gt; + <a href=3D"https://github.com/eclipse/mosquitto/pull/2751" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://github.com/eclipse/mosquitto=
/pull/2751</a><br>
&gt; +<br>
&gt; +Patch contributed by Joachim Zobel &lt;<a href=3D"mailto:jz-2017@heut=
e-morgen.de" target=3D"_blank" rel=3D"noreferrer">jz-2017@heute-morgen.de</=
a>&gt; and=C2=A0 Daniel Engberg &lt;<a href=3D"mailto:daniel.engberg.lists@=
pyret.net" target=3D"_blank" rel=3D"noreferrer">daniel.engberg.lists@pyret.=
net</a>&gt;<br>
<br>
It will be good to annotate the patch with Signed-off-by and Upstream-Statu=
s:<br>
<br>
<a href=3D"https://docs.yoctoproject.org/dev/contributor-guide/recipe-style=
-guide.html?highlight=3Dupstream+status#patch-upstream-status" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev/contr=
ibutor-guide/recipe-style-guide.html?highlight=3Dupstream+status#patch-upst=
ream-status</a><br>
<br>
&gt; +---<br>
&gt; + src/CMakeLists.txt | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt<br>
&gt; +index 9380a04..dce8313 100644<br>
&gt; +--- a/src/CMakeLists.txt<br>
&gt; ++++ b/src/CMakeLists.txt<br>
&gt; +@@ -200,7 +200,7 @@ if (WITH_WEBSOCKETS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0link_directories(${mosquitto_SOURCE_DIR})<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0endif (WIN32)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else (STATIC_WEBSOCKETS)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set (MOSQ_LIBS ${MO=
SQ_LIBS} websockets)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set (MOSQ_LIBS ${MO=
SQ_LIBS} websockets_shared)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0endif (STATIC_WEBSOCKETS)<br>
&gt; + endif (WITH_WEBSOCKETS)<br>
&gt; +<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895=
.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 000000000..a9e9c97b8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<=
br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +From: Joachim Zobel &lt;<a href=3D"mailto:jz-2017@heute-morgen.de" ta=
rget=3D"_blank" rel=3D"noreferrer">jz-2017@heute-morgen.de</a>&gt;<br>
&gt; +Date: Wed, 13 Sep 2023 10:05:43 +0200<br>
&gt; +Subject: [PATCH] Mosquitto now waits for network-online when starting=
<br>
&gt; + (Closes: #1036450)<br>
&gt; +<br>
&gt; +See: <a href=3D"https://github.com/eclipse/mosquitto/issues/2878" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/eclipse/mos=
quitto/issues/2878</a><br>
&gt; +---<br>
&gt; + service/systemd/mosquitto.service.simple | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/service/systemd/mosquitto.service.simple b/service/syste=
md/mosquitto.service.simple<br>
&gt; +index 15ee0d6..c2a330b 100644<br>
&gt; +--- a/service/systemd/mosquitto.service.simple<br>
&gt; ++++ b/service/systemd/mosquitto.service.simple<br>
&gt; +@@ -1,8 +1,8 @@<br>
&gt; + [Unit]<br>
&gt; + Description=3DMosquitto MQTT Broker<br>
&gt; + Documentation=3Dman:mosquitto.conf(5) man:mosquitto(8)<br>
&gt; +-After=3Dnetwork.target<br>
&gt; +-Wants=3Dnetwork.target<br>
&gt; ++After=3Dnetwork-online.target<br>
&gt; ++Wants=3Dnetwork-online.target<br>
&gt; +<br>
&gt; + [Service]<br>
&gt; + ExecStart=3D/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mosquitto/<a href=3D=
"http://mosquitto_2.0.17.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
">mosquitto_2.0.17.bb</a> b/meta-networking/recipes-connectivity/mosquitto/=
<a href=3D"http://mosquitto_2.0.18.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">mosquitto_2.0.18.bb</a><br>
&gt; similarity index 95%<br>
&gt; rename from meta-networking/recipes-connectivity/mosquitto/<a href=3D"=
http://mosquitto_2.0.17.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>mosquitto_2.0.17.bb</a><br>
&gt; rename to meta-networking/recipes-connectivity/mosquitto/<a href=3D"ht=
tp://mosquitto_2.0.18.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">m=
osquitto_2.0.18.bb</a><br>
&gt; index 690b6bc12..0c9ccc810 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/mosquitto/<a href=3D"http:/=
/mosquitto_2.0.17.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mosqu=
itto_2.0.17.bb</a><br>
&gt; +++ b/meta-networking/recipes-connectivity/mosquitto/<a href=3D"http:/=
/mosquitto_2.0.18.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mosqu=
itto_2.0.18.bb</a><br>
&gt; @@ -17,9 +17,11 @@ DEPENDS =3D &quot;uthash cjson&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://mosquitto.org/files/source/m=
osquitto-$%7BPV%7D.tar.gz" rel=3D"noreferrer noreferrer" target=3D"_blank">=
http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mosquitto.init \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://1571.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://2894.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://2895.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;3be7a911236567c1a9fbe25baf3e3167004ba4a0=
c151a448ef1f7fc077dba52f&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;d665fe7d0032881b1371a47f34169ee4edab6790=
3b2cd2b4c083822823f4448a&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit systemd update-rc.d useradd cmake pkgconfig<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#105128): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105128" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/105=
128</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10157348=
4/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/101573484/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000057d85d0606338d41--

