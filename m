Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.24754.1589730381260404955
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 08:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XhT5SjPz;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id l21so6722062eji.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2020 08:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lLfKDuaV4S+DVIOBzz3PhivWKAys78Xng1rCUP02sgs=;
        b=XhT5SjPzCxjogU521RpbM99vE9lxLds7pL5tTmVTbpiZG1DSiAxXmsckx/5pG0ssrV
         0gtm7D6s2CJL+v12GLe6Rc4X+cyPMlIwoB+qzu5sGJ06Ss/ogVFVjDFmWkSbAkV3mR4Q
         RlgN4iUPjPWs7HTl6y6vM+48JBtvwazfYfRRTNyqDtylAOqS4hz5Om9DCHmSDbIdLxSc
         2E4RRreth4dkGArSi+xFrWiW8Rg3civB73ESwMdAdvqf5R3SQiITbLEeUET4tpA9hGYU
         KONLMN974wiJfub5v8VLCcRf755YStvzz6bJ0tzPw5iNdAioU6hljpXVgi1GQVF1WmdU
         LVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lLfKDuaV4S+DVIOBzz3PhivWKAys78Xng1rCUP02sgs=;
        b=U9riEirp88rcvObY4NobuzrxclORYA5SVdbngwXnJ07kgInRnPIz6zKpLnm24Mu3r9
         7Dj9uRbmTlaQnC0Xwuc57Un9IcW3bG6WwhaubnCFPkpb+oHiLsGmWIP3KoNs8gvz2Mm0
         yfkxJmZBZ35cupL+mCASmP69Qra9peYE44wnkjC0F7HKGtsPBKbGiS8znnT3h25qRXM6
         OjFQz9suaP6kSCPriA4RG5QFaFDWeMLZidt8SUmH0IOy+lcNkAYUvBwlQuX09AXoV/RS
         wvpFsMEI71swzDjk/oUoO2NWRygwbVJ69AFDX/RZHq/VUqRV3Z982LoRfpskZlsS+kMv
         nylw==
X-Gm-Message-State: AOAM530pveW743NzGjfyrLEs+VqFuClRcfMe0PL0EqjaG/rNHZU7VZrL
	l3BL0fd6kxcrShkCR3ySD+BGJZLzboIWbsoN12I=
X-Google-Smtp-Source: ABdhPJxJ21dK4XAR8NlMBVHv4bF0xj+p9Faxtyf35uy3WBI0gEpgU6uE7WxDpA7Xf4HqMMcIzF+9Bn3h0aQCw6bYmes=
X-Received: by 2002:a17:907:4096:: with SMTP id nm6mr12072449ejb.30.1589730379711;
 Sun, 17 May 2020 08:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200516162631.1862339-1-raj.khem@gmail.com> <401b0d008f8444da8613ba2102d614d4@XBOX03.axis.com>
 <CAMKF1sra2Z9S5cQiTOzt84FPcNkFUDBwgjY+wGHTmv8BN8LigQ@mail.gmail.com>
In-Reply-To: <CAMKF1sra2Z9S5cQiTOzt84FPcNkFUDBwgjY+wGHTmv8BN8LigQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 17 May 2020 17:46:08 +0200
Message-ID: <CA+chaQc_u6mzPx-T=8eB-puoDuTHCwfrtoJMS8KFEmha67w2xQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/3] netplan: Depend on systemd if its in distro
To: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009249b505a5d9f258"

--0000000000009249b505a5d9f258
Content-Type: text/plain; charset="UTF-8"

Acked-by: Martin Jansa <martin.jansa@gmail.com>

It's needed in dunfell as well.

FWIW: the error message is complaining about glib.h, because it's calling
pkg-config directly in Makefile and the libsystemd fails first

netplan-dbus: src/dbus.c
        $(CC) $(BUILDFLAGS) $(CFLAGS) -o $@ $^ `pkg-config --cflags --libs
libsystemd glib-2.0`

ERROR: netplan-0.98+gitAUTOINC+5d22e9d22c-r0 do_configure: Execution of
'/jenkins/mjansa/build/nodistro/dunfell/BUILD/work/core2-32-oe-linux/netplan/0.98+gitAUTOINC+5d22e9d22c-r0/temp/run.do_configure.76533'
failed with exit code 1:
i686-oe-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
--sysroot=/jenkins/mjansa/build/nodistro/dunfell/BUILD/work/core2-32-oe-linux/netplan/0.98+gitAUTOINC+5d22e9d22c-r0/recipe-sysroot
-std=c99 -D_XOPEN_SOURCE=500 -DSBINDIR=\"/usr/sbin\" -Wall -Werror   -O2
-pipe -g -feliminate-unused-debug-types
-fmacro-prefix-map=/jenkins/mjansa/build/nodistro/dunfell/BUILD/work/core2-32-oe-linux/netplan/0.98+gitAUTOINC+5d22e9d22c-r0=/usr/src/debug/netplan/0.98+gitAUTOINC+5d22e9d22c-r0

 -fdebug-prefix-map=/jenkins/mjansa/build/nodistro/dunfell/BUILD/work/core2-32-oe-linux/netplan/0.98+gitAUTOINC+5d22e9d22c-r0=/usr/src/debug/netplan/0.98+gitAUTOINC+5d22e9d22c-r0

 -fdebug-prefix-map=/jenkins/mjansa/build/nodistro/dunfell/BUILD/work/core2-32-oe-linux/netplan/0.98+gitAUTOINC+5d22e9d22c-r0/recipe-sysroot=

 -fdebug-prefix-map=/jenkins/mjansa/build/nodistro/dunfell/BUILD/work/core2-32-oe-linux/netplan/0.98+gitAUTOINC+5d22e9d22c-r0/recipe-sysroot-native=
 -o netplan-dbus src/dbus.c `pkg-config --cflags --libs libsystemd glib-2.0`
Package libsystemd was not found in the pkg-config search path.
Perhaps you should add the directory containing `libsystemd.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libsystemd' found
src/dbus.c:9:10: fatal error: glib.h: No such file or directory
    9 | #include <glib.h>
      |          ^~~~~~~~
compilation terminated.
Makefile:35: recipe for target 'netplan-dbus' failed
make: *** [netplan-dbus] Error 1
WARNING: exit code 1 from a shell command.


On Sat, May 16, 2020 at 11:55 PM Khem Raj <raj.khem@gmail.com> wrote:

> Updated.
>
> On Sat, May 16, 2020 at 1:05 PM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > > -----Original Message-----
> > > From: openembedded-devel@lists.openembedded.org <openembedded-
> > > devel@lists.openembedded.org> On Behalf Of Khem Raj
> > > Sent: den 16 maj 2020 18:26
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Khem Raj <raj.khem@gmail.com>
> > > Subject: [oe] [meta-networking][PATCH 1/3] netplan: Depend on systemd
> if its in distro
> >
> > Change "its"  to "it is".
> >
> > >
> > > it needs to link with libsystemd when using systemd as init system
> > > Fixes
> > > Package libsystemd was not found in the pkg-config search path.
> > > Perhaps you should add the directory containing `libsystemd.pc'
> > > to the PKG_CONFIG_PATH environment variable
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta-networking/recipes-connectivity/netplan/netplan_0.98.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-networking/recipes-connectivity/netplan/
> netplan_0.98.bb
> > > b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> > > index db029a4b8a..15c4968132 100644
> > > --- a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> > > +++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> > > @@ -18,7 +18,8 @@ SRC_URI = " \
> > >          git://github.com/CanonicalLtd/netplan.git \
> > >  "
> > >
> > > -DEPENDS = "glib-2.0 libyaml"
> > > +DEPENDS = "glib-2.0 libyaml
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
> >
> > That can be simplified to:
> >
> > DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES',
> 'systemd', d)}"
> >
> > > +
> > >  RDEPENDS_${PN} = "python3 python3-core python3-pyyaml
> python3-netifaces python3-nose python3-coverage python3-pycodestyle
> python3-pyflakes util-linux-libuuid"
> > >
> > >  inherit pkgconfig systemd
> > > --
> > > 2.26.2
> >
> > //Peter
> >
> 
>

--0000000000009249b505a5d9f258
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by:=C2=A0Martin Jansa &lt;<a href=3D"mailto:martin.j=
ansa@gmail.com">martin.jansa@gmail.com</a>&gt;<div><br></div><div>It&#39;s =
needed in dunfell as well.</div><div><br></div><div>FWIW: the error message=
 is complaining about glib.h, because it&#39;s calling pkg-config directly =
in Makefile and the libsystemd fails first</div><div><br></div><div>netplan=
-dbus: src/dbus.c<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) $(BUILDFLAGS) $(CFLA=
GS) -o $@ $^ `pkg-config --cflags --libs libsystemd glib-2.0`<br></div><div=
><br></div><div>ERROR: netplan-0.98+gitAUTOINC+5d22e9d22c-r0 do_configure: =
Execution of &#39;/jenkins/mjansa/build/nodistro/dunfell/BUILD/work/core2-3=
2-oe-linux/netplan/0.98+gitAUTOINC+5d22e9d22c-r0/temp/run.do_configure.7653=
3&#39; failed with exit code 1:<br>i686-oe-linux-gcc =C2=A0-m32 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed --sysroot=3D/jenkins/mjansa/build/nodistro/dunfell/BUILD/work/=
core2-32-oe-linux/netplan/0.98+gitAUTOINC+5d22e9d22c-r0/recipe-sysroot -std=
=
=3Dc99 -D_XOPEN_SOURCE=3D500 -DSBINDIR=3D\&quot;/usr/sbin\&quot; -Wall -We=
rror =C2=A0 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=
=3D/jenkins/mjansa/build/nodistro/dunfell/BUILD/work/core2-32-oe-linux/net=
plan/0.98+gitAUTOINC+5d22e9d22c-r0=3D/usr/src/debug/netplan/0.98+gitAUTOINC=
+5d22e9d22c-r0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/jenkins/mjansa/build/nodistro/dunfe=
ll/BUILD/work/core2-32-oe-linux/netplan/0.98+gitAUTOINC+5d22e9d22c-r0=3D/us=
r/src/debug/netplan/0.98+gitAUTOINC+5d22e9d22c-r0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/=
jenkins/mjansa/build/nodistro/dunfell/BUILD/work/core2-32-oe-linux/netplan/=
0.98+gitAUTOINC+5d22e9d22c-r0/recipe-sysroot=3D =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/jenk=
ins/mjansa/build/nodistro/dunfell/BUILD/work/core2-32-oe-linux/netplan/0.98=
+gitAUTOINC+5d22e9d22c-r0/recipe-sysroot-native=3D =C2=A0-o netplan-dbus sr=
c/dbus.c `pkg-config --cflags --libs libsystemd glib-2.0`<br>Package libsys=
temd was not found in the pkg-config search path.<br>Perhaps you should add=
 the directory containing `libsystemd.pc&#39;<br>to the PKG_CONFIG_PATH env=
ironment variable<br>No package &#39;libsystemd&#39; found<br>src/dbus.c:9:=
10: fatal error: glib.h: No such file or directory<br>=C2=A0 =C2=A0 9 | #in=
clude &lt;glib.h&gt;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0^~~~~~~~<br>compilation terminated.<br>Makefile:35: recipe for targe=
t &#39;netplan-dbus&#39; failed<br>make: *** [netplan-dbus] Error 1<br>WARN=
ING: exit code 1 from a shell command.</div><div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 16, =
2020 at 11:55 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Updated.<br>
<br>
On Sat, May 16, 2020 at 1:05 PM Peter Kjellerstedt<br>
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter=
.kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.or=
g" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;open=
embedded-<br>
&gt; &gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank=
">devel@lists.openembedded.org</a>&gt; On Behalf Of Khem Raj<br>
&gt; &gt; Sent: den 16 maj 2020 18:26<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org"=
 target=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt; Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; Subject: [oe] [meta-networking][PATCH 1/3] netplan: Depend on sy=
stemd if its in distro<br>
&gt;<br>
&gt; Change &quot;its&quot;=C2=A0 to &quot;it is&quot;.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; it needs to link with libsystemd when using systemd as init syst=
em<br>
&gt; &gt; Fixes<br>
&gt; &gt; Package libsystemd was not found in the pkg-config search path.<=
br>
&gt; &gt; Perhaps you should add the directory containing `libsystemd.pc&#=
39;<br>
&gt; &gt; to the PKG_CONFIG_PATH environment variable<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-networking/recipes-connectivity/netplan/<a href=3D"ht=
tp://netplan_0.98.bb" rel=3D"noreferrer" target=3D"_blank">netplan_0.98.bb<=
/a> | 3 ++-<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-networking/recipes-connectivity/netplan/<a hre=
f=3D"http://netplan_0.98.bb" rel=3D"noreferrer" target=3D"_blank">netplan_0=
.98.bb</a><br>
&gt; &gt; b/meta-networking/recipes-connectivity/netplan/<a href=3D"http:/=
/netplan_0.98.bb" rel=3D"noreferrer" target=3D"_blank">netplan_0.98.bb</a><=
br>
&gt; &gt; index db029a4b8a..15c4968132 100644<br>
&gt; &gt; --- a/meta-networking/recipes-connectivity/netplan/<a href=3D"ht=
tp://netplan_0.98.bb" rel=3D"noreferrer" target=3D"_blank">netplan_0.98.bb<=
/a><br>
&gt; &gt; +++ b/meta-networking/recipes-connectivity/netplan/<a href=3D"ht=
tp://netplan_0.98.bb" rel=3D"noreferrer" target=3D"_blank">netplan_0.98.bb<=
/a><br>
&gt; &gt; @@ -18,7 +18,8 @@ SRC_URI =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github=
.com/CanonicalLtd/netplan.git" rel=3D"noreferrer" target=3D"_blank">github.=
com/CanonicalLtd/netplan.git</a> \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt; -DEPENDS =3D &quot;glib-2.0 libyaml&quot;<br>
&gt; &gt; +DEPENDS =3D &quot;glib-2.0 libyaml ${@bb.utils.contains(&#39;DI=
STRO_FEATURES&#39;,&#39;systemd&#39;,&#39;systemd&#39;,&#39;&#39;,d)}&quot;=
<br>
&gt;<br>
&gt; That can be simplified to:<br>
&gt;<br>
&gt; DEPENDS =3D &quot;glib-2.0 libyaml ${@bb.utils.filter(&#39;DISTRO_FEA=
TURES&#39;, &#39;systemd&#39;, d)}&quot;<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 RDEPENDS_${PN} =3D &quot;python3 python3-core python3-pyya=
ml python3-netifaces python3-nose python3-coverage python3-pycodestyle pyth=
on3-pyflakes util-linux-libuuid&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit pkgconfig systemd<br>
&gt; &gt; --<br>
&gt; &gt; 2.26.2<br>
&gt;<br>
&gt; //Peter<br>
&gt;<br>
<br>
</blockquote></div>

--0000000000009249b505a5d9f258--
