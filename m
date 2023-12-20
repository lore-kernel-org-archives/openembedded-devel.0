Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F484C46CCD
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 22:00:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.33788.1703109634471781105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 14:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dbcBz/Bb;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33666946422so102476f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703109633; x=1703714433; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4gy75B0A3s7QB7uzzi0VpY0zH8S/gxAQ+ltwSUrVz7w=;
        b=dbcBz/BbY570cztmGP9P1v17AuJKJgXzxQO0A+yJMzcJEZpywOuz5DneEo19ytctzB
         FWwYY/NGd7ahg0td+ZYE715TLx0PTMH3/wYag8kcXCsTkUV5KoHhjXdwr5B2lKtBmDL2
         h+s6PRBsbs0OOq+adnRZhHmEhnfggIW6yH2zz2t2KJRkwjUFqs4W9kcEp0j0MMsooyVb
         UfHhw3YyD/ajj9h/b858xkjXqxOaCNdZG45qpspaDYg/yayB2b2O0460mO94jwhkxNK9
         nJ1hFL3IgPZztkryfwanJezNum4kTrEmaR96aOUBUKZE7dNLbuOzMCrR9IyYqrkGa3YB
         zTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703109633; x=1703714433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gy75B0A3s7QB7uzzi0VpY0zH8S/gxAQ+ltwSUrVz7w=;
        b=o5Zi/F6WLdZ4mlTGzAFvSWDeMFbJOIE3iMnCKVC+3kK4I9Ez2zlMSlgLX3h8uaME3L
         tjcfN+hJ+af2Tk41lZi+iCKCkJZ0SBwnaQHB8nuQnzpryauAFdq/Zat2hzhohW5BYCIK
         9Srh0lV2fnLeBvkkRdfPXAH3+YcoWwaDQy4emnWJISY8hacE5nHFDK8RJI4wYf1vnfm7
         day8B9HEjqAXh7euOqJmnEQXK8i3Rm5EnsjCT+Gzh5rb5pYnOAbY3MqKCjjMb24w40JR
         GjKaPyo8i5XAW9xWy8WNDtS9OMS1twkZlMY7S4w/pm9hsN4ejw5YaqJk9738exmecjd/
         n7wQ==
X-Gm-Message-State: AOJu0Ywb7qQdFj/0Noxzve/Thdj7m34kDondwdZDkfw5ZtMpsp76Niip
	+79Hd7EFdiT3x2cHnU20nhS0AZxoNxCqbO1geDU=
X-Google-Smtp-Source: AGHT+IFxthT9+PSpGN/ze8lDwG51G4xnZQ/YhKaJ4hDJ/fa7APKAz5ng/zzATuZfWF3j4HXnDya2TqYMzUFa7IvjnSQ=
X-Received: by 2002:a5d:4587:0:b0:336:5c03:c598 with SMTP id
 p7-20020a5d4587000000b003365c03c598mr202194wrq.58.1703109632655; Wed, 20 Dec
 2023 14:00:32 -0800 (PST)
MIME-Version: 1.0
References: <20231220155334.1055853-1-ross.burton@arm.com> <CAMKF1sqC=LDFtm3eXqeWiSnDo7NW6=BTh3mJHzcFAOxDDSN0+g@mail.gmail.com>
In-Reply-To: <CAMKF1sqC=LDFtm3eXqeWiSnDo7NW6=BTh3mJHzcFAOxDDSN0+g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Dec 2023 23:00:20 +0100
Message-ID: <CA+chaQfTmXgxVmxQkcLEKxbqoK-aCGufyou3M1D4yLvCEMQQWA@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] lemon: upgrade to 3.44.2
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ab0551060cf81cdc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107677

--000000000000ab0551060cf81cdc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 10:42=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> On Wed, Dec 20, 2023 at 7:53=E2=80=AFAM Ross Burton <ross.burton@arm.com>=
 wrote:
> >
> > From: Ross Burton <ross.burton@arm.com>
> >
> > Lemon is packaged as part of sqlite, and sqlite 3.7.3 was released back
> > in 2010[1].
> >
> > As the small source tarballs no longer include the tools, fetch the
> > sqlite github mirror instead.
> >
> > Don't bother installing a pretty minimal manpage, as very few projects
> > use lemon (sqlite itself, and libpbnjson).
> >
> > [1] https://www.sqlite.org/releaselog/3_7_3.html
> >
> ...

> diff --git a/meta-oe/recipes-devtools/lemon/lemon.inc
> b/meta-oe/recipes-devtools/lemon/lemon.inc
> > deleted file mode 100644
> > index 57b9fb710e..0000000000
> > --- a/meta-oe/recipes-devtools/lemon/lemon.inc
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -DESCRIPTION =3D "The Lemon Parser Generator"
> > -HOMEPAGE =3D "http://www.hwaci.com/sw/lemon/"
> > -LICENSE =3D "PD"
> > -SECTION =3D "devel"
> > -
> > -SRC_URI =3D "http://www.sqlite.org/sqlite-${PV}.tar.gz \
> > -           file://lemon.1"
> > -
> > -S =3D "${WORKDIR}/sqlite-${PV}/tool"
> > -
> > -do_compile() {
> > -    ${CC} ${CFLAGS} lemon.c -c -o lemon.o
> > -    ${CCLD} ${LDFLAGS} lemon.o -o lemon
> > -}
> > -
> > -do_install() {
> > -    install -d ${D}${bindir}
> > -    install -m 0755 lemon ${D}${bindir}
> > -    install -m 0644 lempar.c ${D}${bindir}
> > -    install -d ${D}${mandir}/man1
> > -    install -m 0644 ${WORKDIR}/lemon.1 ${D}${mandir}/man1/
> > -}
> > -
> > -BBCLASSEXTEND =3D "native"
> > -
> > diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
> b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
> > new file mode 100644
> > index 0000000000..1b849922a6
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
> > @@ -0,0 +1,24 @@
> > +DESCRIPTION =3D "The Lemon Parser Generator"
> > +HOMEPAGE =3D "https://sqlite.org/src/file/doc/lemon.html"
> > +LICENSE =3D "PD"
> > +SECTION =3D "devel"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://tool/lemon.c;endline=3D8;md5=3Dc7551a78fa3fdecd96d1ad6761d205ee"
> > +
> > +SRC_URI =3D "git://
> github.com/sqlite/sqlite;protocol=3Dhttps;branch=3Dbranch-3.44"
> > +
> > +SRCREV =3D "c8f9803dc32bfee78a9ca2b1abbe39499729219b"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_compile() {
> > +    ${CC} ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} tool/lemon.c -o lemon
>
> why do we need CPPFLAGS here ?
>
> > +}
> > +
> > +do_install() {
> > +    install -d ${D}${bindir}
> > +    install -m 0755 lemon ${D}${bindir}
> > +    install -m 0644 tool/lempar.c ${D}${bindir}
>
> .c file in bindir seems odd.
>

I was wondering about it as well, but looks like lemon binary looks for
this as a default template next to lemon binary in:
https://github.com/sqlite/sqlite/blob/master/tool/lemon.c#L3654

that's why it's in bindir and was there before this upgrade as well.

> +}
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb
> b/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb
> > deleted file mode 100644
> > index 354db17e6e..0000000000
> > --- a/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb
> > +++ /dev/null
> > @@ -1,7 +0,0 @@
> > -require lemon.inc
> > -
> > -LIC_FILES_CHKSUM =3D
> "file://lemon.c;endline=3D8;md5=3Dc7551a78fa3fdecd96d1ad6761d205ee"
> > -
> > -SRC_URI[md5sum] =3D "5437978aae90350cf984993091e0d695"
> > -SRC_URI[sha256sum] =3D
> "dbf352e8fbb74829f5e7a88f9f6ceeb80a709537f668c36e4b6cdfb271309ef6"
> > -
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107675):
> https://lists.openembedded.org/g/openembedded-devel/message/107675
> Mute This Topic: https://lists.openembedded.org/mt/103283009/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ab0551060cf81cdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 20, 2023 at 10:42=E2=80=
=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, Dec 20, 2023 at 7:53=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:r=
oss.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D=
"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;<br>
&gt; Lemon is packaged as part of sqlite, and sqlite 3.7.3 was released bac=
k<br>
&gt; in 2010[1].<br>
&gt;<br>
&gt; As the small source tarballs no longer include the tools, fetch the<br=
>
&gt; sqlite github mirror instead.<br>
&gt;<br>
&gt; Don&#39;t bother installing a pretty minimal manpage, as very few proj=
ects<br>
&gt; use lemon (sqlite itself, and libpbnjson).<br>
&gt;<br>
&gt; [1] <a href=3D"https://www.sqlite.org/releaselog/3_7_3.html" rel=3D"no=
referrer" target=3D"_blank">https://www.sqlite.org/releaselog/3_7_3.html</a=
><br>
&gt;<br>...=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt; diff --git a/meta-oe/recipes-devtools/lemon/lemon.inc b/meta-oe/recipe=
s-devtools/lemon/lemon.inc<br>
&gt; deleted file mode 100644<br>
&gt; index 57b9fb710e..0000000000<br>
&gt; --- a/meta-oe/recipes-devtools/lemon/lemon.inc<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,25 +0,0 @@<br>
&gt; -DESCRIPTION =3D &quot;The Lemon Parser Generator&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://www.hwaci.com/sw/lemon/" rel=3D"=
noreferrer" target=3D"_blank">http://www.hwaci.com/sw/lemon/</a>&quot;<br>
&gt; -LICENSE =3D &quot;PD&quot;<br>
&gt; -SECTION =3D &quot;devel&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://www.sqlite.org/sqlite-$%7BPV%7D.t=
ar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.sqlite.org/sqlite-${=
PV}.tar.gz</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lemon.1&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/sqlite-${PV}/tool&quot;<br>
&gt; -<br>
&gt; -do_compile() {<br>
&gt; -=C2=A0 =C2=A0 ${CC} ${CFLAGS} lemon.c -c -o lemon.o<br>
&gt; -=C2=A0 =C2=A0 ${CCLD} ${LDFLAGS} lemon.o -o lemon<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_install() {<br>
&gt; -=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 install -m 0755 lemon ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 install -m 0644 lempar.c ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 install -d ${D}${mandir}/man1<br>
&gt; -=C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/lemon.1 ${D}${mandir}/man1/<=
br>
&gt; -}<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-devtools/lemon/<a href=3D"http://lemon_3.=
44.2.bb" rel=3D"noreferrer" target=3D"_blank">lemon_3.44.2.bb</a> b/meta-oe=
/recipes-devtools/lemon/<a href=3D"http://lemon_3.44.2.bb" rel=3D"noreferre=
r" target=3D"_blank">lemon_3.44.2.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1b849922a6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/lemon/<a href=3D"http://lemon_3.44.2.bb=
" rel=3D"noreferrer" target=3D"_blank">lemon_3.44.2.bb</a><br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +DESCRIPTION =3D &quot;The Lemon Parser Generator&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://sqlite.org/src/file/doc/lemon.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://sqlite.org/src/file/doc/l=
emon.html</a>&quot;<br>
&gt; +LICENSE =3D &quot;PD&quot;<br>
&gt; +SECTION =3D &quot;devel&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://tool/lemon.c;endline=3D8;md5=3Dc755=
1a78fa3fdecd96d1ad6761d205ee&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/sqlite/sqlite;pr=
otocol=3Dhttps;branch=3Dbranch-3.44" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/sqlite/sqlite;protocol=3Dhttps;branch=3Dbranch-3.44</a>&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;c8f9803dc32bfee78a9ca2b1abbe39499729219b&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +do_compile() {<br>
&gt; +=C2=A0 =C2=A0 ${CC} ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} tool/lemon.c -o =
lemon<br>
<br>
why do we need CPPFLAGS here ?<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 lemon ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 install -m 0644 tool/lempar.c ${D}${bindir}<br>
<br>
.c file in bindir seems odd.<br></blockquote><div><br></div><div>I was wond=
ering about it as well, but looks like lemon binary looks for this as a def=
ault template next to lemon binary in:</div><div><a href=3D"https://github.=
com/sqlite/sqlite/blob/master/tool/lemon.c#L3654">https://github.com/sqlite=
/sqlite/blob/master/tool/lemon.c#L3654</a></div><div><br></div><div>that&#3=
9;s why it&#39;s in bindir and was there before this upgrade as well.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +}<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta-oe/recipes-devtools/lemon/<a href=3D"http://lemon_3.=
7.3.bb" rel=3D"noreferrer" target=3D"_blank">lemon_3.7.3.bb</a> b/meta-oe/r=
ecipes-devtools/lemon/<a href=3D"http://lemon_3.7.3.bb" rel=3D"noreferrer" =
target=3D"_blank">lemon_3.7.3.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 354db17e6e..0000000000<br>
&gt; --- a/meta-oe/recipes-devtools/lemon/<a href=3D"http://lemon_3.7.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">lemon_3.7.3.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,7 +0,0 @@<br>
&gt; -require lemon.inc<br>
&gt; -<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://lemon.c;endline=3D8;md5=3Dc7551a78f=
a3fdecd96d1ad6761d205ee&quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;5437978aae90350cf984993091e0d695&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;dbf352e8fbb74829f5e7a88f9f6ceeb80a709537=
f668c36e4b6cdfb271309ef6&quot;<br>
&gt; -<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107675): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107675" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107675</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103283009/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103283009/3617156</a><br>
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

--000000000000ab0551060cf81cdc--

