Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D286C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 13:07:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.7019.1750511239509468036
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 06:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Qj+7ZYR5;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54700a46eso1584809f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1750511238; x=1751116038; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mQE3435FgmDvHnFNPGW4OnhdT6JQgBxfkF4vDycLr/A=;
        b=Qj+7ZYR5psgpjq3v51BykBBjZ6/DPBKM4zZq6BDqk2fgtkp6fCC41KEex6Z1jbu0VC
         ZHSiegibKzU14lnWn9DvQwPSXBfOYW2kB5uRqRRS4GBZh0BbGZhgKGCFLdMgAb8Ef58i
         DuczMjrX/pN4FPY5NlGJqBh9FVRZNxIQtmq2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750511238; x=1751116038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQE3435FgmDvHnFNPGW4OnhdT6JQgBxfkF4vDycLr/A=;
        b=EzioB/uxc7BsPjYqW0d6OD1q9kvyqIemPBekHaRDIZyQ7/M6VcnVnYT/xh0jSG3lT2
         rerdGiuG+yCX9Go5Zs4gesbjh+cl1EnhKIVQRusF7stT6lBLMvnAl5pcx0ph/Uu7998A
         +Lrg8Wn96/Ont4LaXWeAJBqMMCi0m/tcEq0dqupHLKrM3umD3gfAzlFzwUC8r407i32l
         3JALFfYUuZ8e4q+X4qlQ5KW6PuAhUft00oTX4e6Xht/18axI0vEnuwEgCkQH9Px63l0v
         c/vQP7SXByrXI8KK3ebvKDNcCJIV+VPCfdv8LMtP8H+a6xObgPGlHpEpavVLR4GzN45n
         e7Fg==
X-Gm-Message-State: AOJu0YxBWLQ6UpNmgftK/Iun7Enj/UElH9QpcD9+wVbSkxMRD++GazsC
	BRn/q4AHGJjRNWCY3Z12NA+7LOL67sLjHbSdbFvjQiEOwN1TU2qFsdhlMYoBeVDnPuaHkDKTUfE
	nvK3xVWw48001y0k3K7/WRDKzgebdZqSDqzlC1qohFEYIktE2RFFEl0/TTQ==
X-Gm-Gg: ASbGncu0o3AE60eVT8QZ/DDq/yLMf0e9W1nl4rziRj390lr9pq5fHIby/zd2hLySIvi
	bkXGTVW0ooG9ACXF3ywONvEg+aHl0lEEyrwxgZVlk6DfQT1VAf6e498++H5C8HvX0T1nHtGG2kI
	OE7pgsklWt+zcRqcso5AQIfyZB2tbBZHbUI9EZGX/ZIYJgyEaU36+mCd7Kv4NJJqqPAY7TRPoQJ
	FnOJw==
X-Google-Smtp-Source: AGHT+IE/LvF4bNapPaPBI/otHMcdWnYH86mHLnasLh7kmfedBO5btoDQa5hZ/YfF8Y78k03OPRbi4PDdsBConbSJTfs=
X-Received: by 2002:a05:6000:25ca:b0:3a4:d6ed:8df8 with SMTP id
 ffacd0b85a97d-3a6d1329a17mr5432895f8f.39.1750511237598; Sat, 21 Jun 2025
 06:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250621111721.1857015-1-alperyasinak1@gmail.com>
In-Reply-To: <20250621111721.1857015-1-alperyasinak1@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 21 Jun 2025 15:06:51 +0200
X-Gm-Features: Ac12FXxeN4TnrKP1O66jjbeN-KuO7ugqvChtDzSXZWMoQIZ1FpplDW4iWydMD2M
Message-ID: <CAMSfU+6SWhgHfMXAm3gfJf2=msp8H1CsZTLNXi+rq-b5kLp23g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] autossh: Replace WORKDIR with
 UNPACKDIR to prevent compile error
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007e2a3b063814a89c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 13:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118007

--0000000000007e2a3b063814a89c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 21 juin 2025 =C3=A0 13:17, Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Issue was related to latest UNPACKDIR changes ->
> https://git.openembedded.org/openembedded-core/commit/?id=3D46480a5e66747=
a673041fe4452a0ab14a1736d5e
>
> ERROR: autossh-1.4g-r0 do_compile: Execution of
> '/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-l=
inux/autossh/1.4g/temp/run.do_compile.2252'
> failed with exit code 1
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  .../recipes-connectivity/autossh/autossh_1.4g.bb   | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
> b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
> index 4613ac61f1..2bc302081e 100644
> --- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
> +++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
> @@ -11,19 +11,19 @@ SRC_URI[sha256sum] =3D
> "5fc3cee3361ca1615af862364c480593171d0c54ec156de79fc421e31a
>
>  RDEPENDS:${PN} =3D "ssh"
>
> -CFLAGS:prepend =3D "-I${WORKDIR}/build "
> +CFLAGS:prepend =3D "-I${B} "
>
>  inherit autotools
>
>  EXTRA_OECONF =3D "--with-ssh=3D/usr/bin/ssh"
>
>  do_compile:append() {
> -        cp ${WORKDIR}/autossh-${PV}/CHANGES ${WORKDIR}/build
> -        cp ${WORKDIR}/autossh-${PV}/README ${WORKDIR}/build
> -        cp ${WORKDIR}/autossh-${PV}/autossh.host ${WORKDIR}/build
> -        cp ${WORKDIR}/autossh-${PV}/rscreen ${WORKDIR}/build
> -        cp ${WORKDIR}/autossh-${PV}/autossh.1 ${WORKDIR}/build
> -        cp ${WORKDIR}/autossh-${PV}/autossh.spec ${WORKDIR}/build
> +        cp ${UNPACKDIR}/autossh-${PV}/CHANGES ${B}/
> +        cp ${UNPACKDIR}/autossh-${PV}/README ${B}/
> +        cp ${UNPACKDIR}/autossh-${PV}/autossh.host ${B}/
> +        cp ${UNPACKDIR}/autossh-${PV}/rscreen ${B}/
> +        cp ${UNPACKDIR}/autossh-${PV}/autossh.1 ${B}/
> +        cp ${UNPACKDIR}/autossh-${PV}/autossh.spec ${B}/
>

Hello,

Can those "${UNPACKDIR}/autossh-${PV}/" be replaced by ${S} while you're
changing these lines? (Sounds better to me)

Thanks!



>  }
>
>  do_install:append() {
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118002):
> https://lists.openembedded.org/g/openembedded-devel/message/118002
> Mute This Topic: https://lists.openembedded.org/mt/113756056/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000007e2a3b063814a89c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 21=
 juin 2025 =C3=A0=C2=A013:17, Alper Ak via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;alperyasinak1=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Issue was related to latest UNPACKDIR changes -&gt; <a href=3D"https://=
git.openembedded.org/openembedded-core/commit/?id=3D46480a5e66747a673041fe4=
452a0ab14a1736d5e" rel=3D"noreferrer" target=3D"_blank">https://git.openemb=
edded.org/openembedded-core/commit/?id=3D46480a5e66747a673041fe4452a0ab14a1=
736d5e</a><br>
<br>
ERROR: autossh-1.4g-r0 do_compile: Execution of &#39;/srv/pokybuild/yocto-w=
orker/meta-oe/build/build/tmp/work/core2-64-poky-linux/autossh/1.4g/temp/ru=
n.do_compile.2252&#39; failed with exit code 1<br>
<br>
Signed-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targ=
et=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-connectivity/autossh/<a href=3D"http://autossh_1.4g.bb" r=
el=3D"noreferrer" target=3D"_blank">autossh_1.4g.bb</a>=C2=A0 =C2=A0| 14 ++=
+++++-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/autossh/<a href=3D"http:/=
/autossh_1.4g.bb" rel=3D"noreferrer" target=3D"_blank">autossh_1.4g.bb</a> =
b/meta-networking/recipes-connectivity/autossh/<a href=3D"http://autossh_1.=
4g.bb" rel=3D"noreferrer" target=3D"_blank">autossh_1.4g.bb</a><br>
index 4613ac61f1..2bc302081e 100644<br>
--- a/meta-networking/recipes-connectivity/autossh/<a href=3D"http://autoss=
h_1.4g.bb" rel=3D"noreferrer" target=3D"_blank">autossh_1.4g.bb</a><br>
+++ b/meta-networking/recipes-connectivity/autossh/<a href=3D"http://autoss=
h_1.4g.bb" rel=3D"noreferrer" target=3D"_blank">autossh_1.4g.bb</a><br>
@@ -11,19 +11,19 @@ SRC_URI[sha256sum] =3D &quot;5fc3cee3361ca1615af862364c=
480593171d0c54ec156de79fc421e31a<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;ssh&quot;<br>
<br>
-CFLAGS:prepend =3D &quot;-I${WORKDIR}/build &quot;<br>
+CFLAGS:prepend =3D &quot;-I${B} &quot;<br>
<br>
=C2=A0inherit autotools<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--with-ssh=3D/usr/bin/ssh&quot;<br>
<br>
=C2=A0do_compile:append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/autossh-${PV}/CHANGES ${WORKDIR}=
/build<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/autossh-${PV}/README ${WORKDIR}/=
build<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/autossh-${PV}/autossh.host ${WOR=
KDIR}/build<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/autossh-${PV}/rscreen ${WORKDIR}=
/build<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/autossh-${PV}/autossh.1 ${WORKDI=
R}/build<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/autossh-${PV}/autossh.spec ${WOR=
KDIR}/build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${UNPACKDIR}/autossh-${PV}/CHANGES ${B}/<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${UNPACKDIR}/autossh-${PV}/README ${B}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${UNPACKDIR}/autossh-${PV}/autossh.host ${B=
}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${UNPACKDIR}/autossh-${PV}/rscreen ${B}/<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${UNPACKDIR}/autossh-${PV}/autossh.1 ${B}/<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${UNPACKDIR}/autossh-${PV}/autossh.spec ${B=
}/<br></blockquote><div><br></div><div>Hello,</div><div><br></div><div>Can =
those &quot;${UNPACKDIR}/autossh-${PV}/&quot; be replaced by ${S} while you=
&#39;re changing these lines? (Sounds better to me)</div><div><br></div><di=
v>Thanks!</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0do_install:append() {<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#118002): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/118002" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/118002</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113756056/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113756056/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000007e2a3b063814a89c--

