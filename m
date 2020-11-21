Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.3008.1605940802125251557
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 22:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vaEd+zfU;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: beniaminsandu@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id t8so12262003iov.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 22:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QUiqS+TQ66TLss3VdX1xsyFhAvtT9jZD4cdXkH+v9r0=;
        b=vaEd+zfU/w2sXSXi0uibjGEZphakg/HVTD6cgSQBzmxrF0QPBwTpICf0TLJcakxiku
         0EJddU5AqIelWwo5+gp6rDHhEbS3DoZ5H0vwaZoi2p94swW7nyEJMj9AbNtxIiSgOF/C
         UVvAGxRBf1rM1jOSGjxSF2FEMs5HZ+A1j/JY+yUGEWdbIevVfkHW5VNid8g+5ovYEhcU
         v559feTSx6Wi14hCRHxY/AGMtgY/HwP246x6hDHR/xPiGSr4NeP+4SbXjvcNd/doAuSC
         Vu3Zfsh8SDLGeAA2mL5AotIkXLII3dTa0RvnUQWaN3nIHkfBRcNpezM2UOARfcypuvuI
         E7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QUiqS+TQ66TLss3VdX1xsyFhAvtT9jZD4cdXkH+v9r0=;
        b=VzdeaLK5Sh//w6M9Ltlrds2mgf8mbaTENSjvj/fnN816sXfLfJ3d6yv/uYcB+8gkFq
         Dc08+XbsftVO7+tKDiOVzXWV0M3E8xQma2uwiM/qI1BTyT1FZm5uyc+Ppq07DLduJIAP
         Ak3wEpJpHm8jRiavBxfne5Hv69Cvkl7siMw7TV8DutuwOhME8oCxgymh2EsE5VppyYAm
         7rg1Q/5BnZJi+0q4s5V6TLySzQ9QxLLNvkJJ1YF0GO/SCyhgJfbijY+BjIxEdEH3OuHf
         W2blw/KuygD0bfoG5lMeN7U64DjVC2ST/pKSPUkDZXtq+2qLisgF7ShsRE8o5VacWtzg
         NQtQ==
X-Gm-Message-State: AOAM530GnX4m8CTSRbAXEa/E7ImbCZFGcjwyTQTfs7u0ZZDGChbIoiO+
	8FTu6GXjzfNXG/YCly5Sjp7ymBf/EdqSx4dyDGk=
X-Google-Smtp-Source: ABdhPJxDMLZcvAaYh8EuZ2EArzVf0zejje0Lf1DjLlA1p5jC13xDf7tQ3g9M+vqXLnWn0VL0baoL29CwJ0jEGaJyBD4=
X-Received: by 2002:a02:a143:: with SMTP id m3mr9657980jah.35.1605940801326;
 Fri, 20 Nov 2020 22:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20201120222750.2809675-1-beniaminsandu@gmail.com> <1929eb13-bf80-2806-bcbe-2423ce86faa0@gmail.com>
In-Reply-To: <1929eb13-bf80-2806-bcbe-2423ce86faa0@gmail.com>
From: "Beni" <beniaminsandu@gmail.com>
Date: Sat, 21 Nov 2020 08:39:49 +0200
Message-ID: <CABQJdOHWWsS0XLZBJJ+EwtfM-d=+pc0rKVrw69oVeiYU0RMYow@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] unbound: convert to git based recipe and upgrade to 1.12.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fe516905b4983a11"

--000000000000fe516905b4983a11
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll send another one to just upgrade the package then.

On Sat, Nov 21, 2020, 01:01 Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 11/20/20 2:27 PM, Beni wrote:
> > We eliminate the need to rename the recipe file with every
> > upgrade and also get better change history
> >
>
> actually having version numbers in recipe name are helpful, or writing
> version specific bbappends, so lets keep the version string in recipe name.
>
> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ---
> >   ...rib-add-yocto-compatible-init-script.patch | 78 +++++++++++++++++++
> >   ...add-yocto-compatible-startup-scripts.patch | 78 -------------------
> >   .../{unbound_1.9.4.bb => unbound_git.bb}      |  6 +-
> >   3 files changed, 82 insertions(+), 80 deletions(-)
> >   create mode 100644
> meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
> >   delete mode 100644
> meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
> >   rename meta-networking/recipes-support/unbound/{unbound_1.9.4.bb =>
> unbound_git.bb} (92%)
> >
> > diff --git
> a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
> b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
> > new file mode 100644
> > index 000000000..7168a352f
> > --- /dev/null
> > +++
> b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
> > @@ -0,0 +1,78 @@
> > +From 26614b6578056ec30b95013592e308bf24d924c2 Mon Sep 17 00:00:00 2001
> > +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > +Date: Fri, 20 Nov 2020 23:00:20 +0200
> > +Subject: [PATCH] contrib: add yocto compatible init script
> > +
> > +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > +---
> > + contrib/unbound.init | 20 ++++++++++----------
> > + 1 file changed, 10 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/contrib/unbound.init b/contrib/unbound.init
> > +index c5bb52bb..4eba752b 100644
> > +--- a/contrib/unbound.init
> > ++++ b/contrib/unbound.init
> > +@@ -19,11 +19,11 @@
> > + ### END INIT INFO
> > +
> > + # Source function library.
> > +-. /etc/rc.d/init.d/functions
> > ++. /etc/init.d/functions
> > +
> > + exec="/usr/sbin/unbound"
> > + prog="unbound"
> > +-config="/var/unbound/unbound.conf"
> > ++config="/etc/unbound/unbound.conf"
> > + pidfile="/var/unbound/unbound.pid"
> > + rootdir="/var/unbound"
> > +
> > +@@ -54,14 +54,14 @@ start() {
> > +     [ -e ${rootdir}/dev/log ] || touch ${rootdir}/dev/log
> > +     mount --bind -n /dev/log ${rootdir}/dev/log >/dev/null 2>&1;
> > +     fi;
> > +-    if ! egrep -q
> '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom' /proc/mounts; then
> > ++    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random'
> /proc/mounts; then
> > +     [ -d ${rootdir}/dev ] || mkdir -p ${rootdir}/dev ;
> > +-    [ -e ${rootdir}/dev/urandom ] || touch ${rootdir}/dev/urandom
> > +-    mount --bind -n /dev/urandom ${rootdir}/dev/urandom >/dev/null
> 2>&1;
> > ++    [ -e ${rootdir}/dev/random ] || touch ${rootdir}/dev/random
> > ++    mount --bind -n /dev/random ${rootdir}/dev/random >/dev/null 2>&1;
> > +     fi;
> > +
> > +     # if not running, start it up here
> > +-    daemon $exec
> > ++    daemonize $exec
> > +     retval=$?
> > +     echo
> > +     [ $retval -eq 0 ] && touch $lockfile
> > +@@ -71,15 +71,15 @@ start() {
> > + stop() {
> > +     echo -n $"Stopping $prog: "
> > +     # stop it here, often "killproc $prog"
> > +-    killproc -p $pidfile $prog
> > ++    killproc $prog
> > +     retval=$?
> > +     echo
> > +     [ $retval -eq 0 ] && rm -f $lockfile
> > +     if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/log'
> /proc/mounts; then
> > +     umount ${rootdir}/dev/log >/dev/null 2>&1
> > +     fi;
> > +-    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom'
> /proc/mounts; then
> > +-    umount ${rootdir}/dev/urandom >/dev/null 2>&1
> > ++    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random'
> /proc/mounts; then
> > ++    umount ${rootdir}/dev/random >/dev/null 2>&1
> > +     fi;
> > +     return $retval
> > + }
> > +@@ -99,7 +99,7 @@ force_reload() {
> > +
> > + rh_status() {
> > +     # run checks to determine if the service is running or use generic
> status
> > +-    status -p $pidfile $prog
> > ++    status $prog
> > + }
> > +
> > + rh_status_q() {
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
> b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
> > deleted file mode 100644
> > index 46f6a7b3f..000000000
> > ---
> a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch
> > +++ /dev/null
> > @@ -1,78 +0,0 @@
> > -From 186ac39de8eb9aedcf3d87cdbe389d10cde03d66 Mon Sep 17 00:00:00 2001
> > -From: Beniamin Sandu <beniaminsandu@gmail.com>
> > -Date: Tue, 16 Jul 2019 19:59:23 +0300
> > -Subject: [PATCH] contrib: add yocto compatible startup scripts
> > -
> > -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ----
> > - contrib/unbound.init       | 10 +++++-----
> > - contrib/unbound.service.in |  4 ++--
> > - 2 files changed, 7 insertions(+), 7 deletions(-)
> > - mode change 100644 => 100755 contrib/unbound.init
> > -
> > -diff --git a/contrib/unbound.init b/contrib/unbound.init
> > -old mode 100644
> > -new mode 100755
> > -index cccadecc..4eba752b
> > ---- a/contrib/unbound.init
> > -+++ b/contrib/unbound.init
> > -@@ -19,11 +19,11 @@
> > - ### END INIT INFO
> > -
> > - # Source function library.
> > --. /etc/rc.d/init.d/functions
> > -+. /etc/init.d/functions
> > -
> > - exec="/usr/sbin/unbound"
> > - prog="unbound"
> > --config="/var/unbound/unbound.conf"
> > -+config="/etc/unbound/unbound.conf"
> > - pidfile="/var/unbound/unbound.pid"
> > - rootdir="/var/unbound"
> > -
> > -@@ -61,7 +61,7 @@ start() {
> > -     fi;
> > -
> > -     # if not running, start it up here
> > --    daemon $exec
> > -+    daemonize $exec
> > -     retval=$?
> > -     echo
> > -     [ $retval -eq 0 ] && touch $lockfile
> > -@@ -71,7 +71,7 @@ start() {
> > - stop() {
> > -     echo -n $"Stopping $prog: "
> > -     # stop it here, often "killproc $prog"
> > --    killproc -p $pidfile $prog
> > -+    killproc $prog
> > -     retval=$?
> > -     echo
> > -     [ $retval -eq 0 ] && rm -f $lockfile
> > -@@ -99,7 +99,7 @@ force_reload() {
> > -
> > - rh_status() {
> > -     # run checks to determine if the service is running or use generic
> status
> > --    status -p $pidfile $prog
> > -+    status $prog
> > - }
> > -
> > - rh_status_q() {
> > -diff --git a/contrib/unbound.service.in b/contrib/unbound.service.in
> > -index 95976dd9..0e7f79a9 100644
> > ---- a/contrib/unbound.service.in
> > -+++ b/contrib/unbound.service.in
> > -@@ -10,9 +10,9 @@ WantedBy=multi-user.target
> > -
> > - [Service]
> > - ExecReload=/bin/kill -HUP $MAINPID
> > --ExecStart=@UNBOUND_SBIN_DIR@/unbound
> > -+ExecStart=@UNBOUND_SBIN_DIR@/unbound -d
> > - NotifyAccess=main
> > --Type=notify
> > -+Type=simple
> > - CapabilityBoundingSet=CAP_IPC_LOCK CAP_NET_BIND_SERVICE CAP_SETGID
> CAP_SETUID CAP_SYS_CHROOT CAP_SYS_RESOURCE
> > - MemoryDenyWriteExecute=true
> > - NoNewPrivileges=true
> > ---
> > -2.17.1
> > -
> > diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> b/meta-networking/recipes-support/unbound/unbound_git.bb
> > similarity index 92%
> > rename from meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> > rename to meta-networking/recipes-support/unbound/unbound_git.bb
> > index 6200214ac..eeaf85344 100644
> > --- a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> > +++ b/meta-networking/recipes-support/unbound/unbound_git.bb
> > @@ -10,9 +10,11 @@ LICENSE = "BSD-3-Clause"
> >   LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
> >
> >   SRC_URI = "git://
> github.com/NLnetLabs/unbound.git;protocol=http;branch=master \
> > -     file://0001-contrib-add-yocto-compatible-startup-scripts.patch \
> > +     file://0001-contrib-add-yocto-compatible-init-script.patch \
> >   "
> > -SRCREV="b60c4a472c856f0a98120b7259e991b3a6507eb5"
> > +
> > +PV = "1.12.0"
> > +SRCREV="52b04806f4236c37acd10179ab465a54adc7e86a"
> >
> >   inherit autotools pkgconfig systemd update-rc.d
> >
> >
> >
> >
> > 
> >
>

--000000000000fe516905b4983a11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, I&#39;ll send another one to just upgrade the pac=
kage then.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Sat, Nov 21, 2020, 01:01 Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
<br>
On 11/20/20 2:27 PM, Beni wrote:<br>
&gt; We eliminate the need to rename the recipe file with every<br>
&gt; upgrade and also get better change history<br>
&gt; <br>
<br>
actually having version numbers in recipe name are helpful, or writing <br=
>
version specific bbappends, so lets keep the version string in recipe name=
.<br>
<br>
&gt; Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">beniaminsandu@gmail.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...rib-add-yocto-compatible-init-script.patch | 78 ++++++=
+++++++++++++<br>
&gt;=C2=A0 =C2=A0...add-yocto-compatible-startup-scripts.patch | 78 ------=
-------------<br>
&gt;=C2=A0 =C2=A0.../{<a href=3D"http://unbound_1.9.4.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">unbound_1.9.4.bb</a> =3D&gt; <a href=3D"htt=
p://unbound_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound=
_git.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 82 insertions(+), 80 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-networking/recipes-support/unboun=
d/unbound/0001-contrib-add-yocto-compatible-init-script.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-networking/recipes-support/unboun=
d/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch<br>
&gt;=C2=A0 =C2=A0rename meta-networking/recipes-support/unbound/{<a href=
=3D"http://unbound_1.9.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">unbound_1.9.4.bb</a> =3D&gt; <a href=3D"http://unbound_git.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">unbound_git.bb</a>} (92%)<br>
&gt; <br>
&gt; diff --git a/meta-networking/recipes-support/unbound/unbound/0001-con=
trib-add-yocto-compatible-init-script.patch b/meta-networking/recipes-suppo=
rt/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..7168a352f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-support/unbound/unbound/0001-contrib-ad=
d-yocto-compatible-init-script.patch<br>
&gt; @@ -0,0 +1,78 @@<br>
&gt; +From 26614b6578056ec30b95013592e308bf24d924c2 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">beniaminsandu@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 20 Nov 2020 23:00:20 +0200<br>
&gt; +Subject: [PATCH] contrib: add yocto compatible init script<br>
&gt; +<br>
&gt; +Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">beniaminsandu@gmail.com</a>&g=
t;<br>
&gt; +---<br>
&gt; + contrib/unbound.init | 20 ++++++++++----------<br>
&gt; + 1 file changed, 10 insertions(+), 10 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/contrib/unbound.init b/contrib/unbound.init<br>
&gt; +index c5bb52bb..4eba752b 100644<br>
&gt; +--- a/contrib/unbound.init<br>
&gt; ++++ b/contrib/unbound.init<br>
&gt; +@@ -19,11 +19,11 @@<br>
&gt; + ### END INIT INFO<br>
&gt; +<br>
&gt; + # Source function library.<br>
&gt; +-. /etc/rc.d/init.d/functions<br>
&gt; ++. /etc/init.d/functions<br>
&gt; +<br>
&gt; + exec=3D&quot;/usr/sbin/unbound&quot;<br>
&gt; + prog=3D&quot;unbound&quot;<br>
&gt; +-config=3D&quot;/var/unbound/unbound.conf&quot;<br>
&gt; ++config=3D&quot;/etc/unbound/unbound.conf&quot;<br>
&gt; + pidfile=3D&quot;/var/unbound/unbound.pid&quot;<br>
&gt; + rootdir=3D&quot;/var/unbound&quot;<br>
&gt; +<br>
&gt; +@@ -54,14 +54,14 @@ start() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ -e ${rootdir}/dev/log ] || touch ${rootdir}/de=
v/log<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mount --bind -n /dev/log ${rootdir}/dev/log &gt;=
/dev/null 2&gt;&amp;1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi;<br>
&gt; +-=C2=A0 =C2=A0 if ! egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39;${=
rootdir}&#39;/dev/urandom&#39; /proc/mounts; then<br>
&gt; ++=C2=A0 =C2=A0 if ! egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39;${=
rootdir}&#39;/dev/random&#39; /proc/mounts; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ -d ${rootdir}/dev ] || mkdir -p ${rootdir}/dev=
 ;<br>
&gt; +-=C2=A0 =C2=A0 [ -e ${rootdir}/dev/urandom ] || touch ${rootdir}/dev=
/urandom<br>
&gt; +-=C2=A0 =C2=A0 mount --bind -n /dev/urandom ${rootdir}/dev/urandom &=
gt;/dev/null 2&gt;&amp;1;<br>
&gt; ++=C2=A0 =C2=A0 [ -e ${rootdir}/dev/random ] || touch ${rootdir}/dev/=
random<br>
&gt; ++=C2=A0 =C2=A0 mount --bind -n /dev/random ${rootdir}/dev/random &gt=
;/dev/null 2&gt;&amp;1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# if not running, start it up here<br>
&gt; +-=C2=A0 =C2=A0 daemon $exec<br>
&gt; ++=C2=A0 =C2=A0 daemonize $exec<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ $retval -eq 0 ] &amp;&amp; touch $lockfile<br>
&gt; +@@ -71,15 +71,15 @@ start() {<br>
&gt; + stop() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo -n $&quot;Stopping $prog: &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# stop it here, often &quot;killproc $prog&quot;=
<br>
&gt; +-=C2=A0 =C2=A0 killproc -p $pidfile $prog<br>
&gt; ++=C2=A0 =C2=A0 killproc $prog<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ $retval -eq 0 ] &amp;&amp; rm -f $lockfile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39=
;${rootdir}&#39;/dev/log&#39; /proc/mounts; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0umount ${rootdir}/dev/log &gt;/dev/null 2&gt;&am=
p;1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi;<br>
&gt; +-=C2=A0 =C2=A0 if egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39;${ro=
otdir}&#39;/dev/urandom&#39; /proc/mounts; then<br>
&gt; +-=C2=A0 =C2=A0 umount ${rootdir}/dev/urandom &gt;/dev/null 2&gt;&amp=
;1<br>
&gt; ++=C2=A0 =C2=A0 if egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39;${ro=
otdir}&#39;/dev/random&#39; /proc/mounts; then<br>
&gt; ++=C2=A0 =C2=A0 umount ${rootdir}/dev/random &gt;/dev/null 2&gt;&amp;=
1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return $retval<br>
&gt; + }<br>
&gt; +@@ -99,7 +99,7 @@ force_reload() {<br>
&gt; +<br>
&gt; + rh_status() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# run checks to determine if the service is runn=
ing or use generic status<br>
&gt; +-=C2=A0 =C2=A0 status -p $pidfile $prog<br>
&gt; ++=C2=A0 =C2=A0 status $prog<br>
&gt; + }<br>
&gt; +<br>
&gt; + rh_status_q() {<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta-networking/recipes-support/unbound/unbound/0001-con=
trib-add-yocto-compatible-startup-scripts.patch b/meta-networking/recipes-s=
upport/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.pa=
tch<br>
&gt; deleted file mode 100644<br>
&gt; index 46f6a7b3f..000000000<br>
&gt; --- a/meta-networking/recipes-support/unbound/unbound/0001-contrib-ad=
d-yocto-compatible-startup-scripts.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,78 +0,0 @@<br>
&gt; -From 186ac39de8eb9aedcf3d87cdbe389d10cde03d66 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">beniaminsandu@gmail.com</a>&gt;<br>
&gt; -Date: Tue, 16 Jul 2019 19:59:23 +0300<br>
&gt; -Subject: [PATCH] contrib: add yocto compatible startup scripts<br>
&gt; -<br>
&gt; -Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">beniaminsandu@gmail.com</a>&g=
t;<br>
&gt; ----<br>
&gt; - contrib/unbound.init=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
&gt; - contrib/<a href=3D"http://unbound.service.in" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">unbound.service.in</a> |=C2=A0 4 ++--<br>
&gt; - 2 files changed, 7 insertions(+), 7 deletions(-)<br>
&gt; - mode change 100644 =3D&gt; 100755 contrib/unbound.init<br>
&gt; -<br>
&gt; -diff --git a/contrib/unbound.init b/contrib/unbound.init<br>
&gt; -old mode 100644<br>
&gt; -new mode 100755<br>
&gt; -index cccadecc..4eba752b<br>
&gt; ---- a/contrib/unbound.init<br>
&gt; -+++ b/contrib/unbound.init<br>
&gt; -@@ -19,11 +19,11 @@<br>
&gt; - ### END INIT INFO<br>
&gt; -<br>
&gt; - # Source function library.<br>
&gt; --. /etc/rc.d/init.d/functions<br>
&gt; -+. /etc/init.d/functions<br>
&gt; -<br>
&gt; - exec=3D&quot;/usr/sbin/unbound&quot;<br>
&gt; - prog=3D&quot;unbound&quot;<br>
&gt; --config=3D&quot;/var/unbound/unbound.conf&quot;<br>
&gt; -+config=3D&quot;/etc/unbound/unbound.conf&quot;<br>
&gt; - pidfile=3D&quot;/var/unbound/unbound.pid&quot;<br>
&gt; - rootdir=3D&quot;/var/unbound&quot;<br>
&gt; -<br>
&gt; -@@ -61,7 +61,7 @@ start() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fi;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# if not running, start it up here<br>
&gt; --=C2=A0 =C2=A0 daemon $exec<br>
&gt; -+=C2=A0 =C2=A0 daemonize $exec<br>
&gt; -=C2=A0 =C2=A0 =C2=A0retval=3D$?<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ $retval -eq 0 ] &amp;&amp; touch $lockfile<br>
&gt; -@@ -71,7 +71,7 @@ start() {<br>
&gt; - stop() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo -n $&quot;Stopping $prog: &quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# stop it here, often &quot;killproc $prog&quot;=
<br>
&gt; --=C2=A0 =C2=A0 killproc -p $pidfile $prog<br>
&gt; -+=C2=A0 =C2=A0 killproc $prog<br>
&gt; -=C2=A0 =C2=A0 =C2=A0retval=3D$?<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ $retval -eq 0 ] &amp;&amp; rm -f $lockfile<br>
&gt; -@@ -99,7 +99,7 @@ force_reload() {<br>
&gt; -<br>
&gt; - rh_status() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# run checks to determine if the service is runn=
ing or use generic status<br>
&gt; --=C2=A0 =C2=A0 status -p $pidfile $prog<br>
&gt; -+=C2=A0 =C2=A0 status $prog<br>
&gt; - }<br>
&gt; -<br>
&gt; - rh_status_q() {<br>
&gt; -diff --git a/contrib/<a href=3D"http://unbound.service.in" rel=3D"no=
referrer noreferrer" target=3D"_blank">unbound.service.in</a> b/contrib/<a =
href=3D"http://unbound.service.in" rel=3D"noreferrer noreferrer" target=3D"=
_blank">unbound.service.in</a><br>
&gt; -index 95976dd9..0e7f79a9 100644<br>
&gt; ---- a/contrib/<a href=3D"http://unbound.service.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">unbound.service.in</a><br>
&gt; -+++ b/contrib/<a href=3D"http://unbound.service.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">unbound.service.in</a><br>
&gt; -@@ -10,9 +10,9 @@ WantedBy=3Dmulti-user.target<br>
&gt; -<br>
&gt; - [Service]<br>
&gt; - ExecReload=3D/bin/kill -HUP $MAINPID<br>
&gt; --ExecStart=3D@UNBOUND_SBIN_DIR@/unbound<br>
&gt; -+ExecStart=3D@UNBOUND_SBIN_DIR@/unbound -d<br>
&gt; - NotifyAccess=3Dmain<br>
&gt; --Type=3Dnotify<br>
&gt; -+Type=3Dsimple<br>
&gt; - CapabilityBoundingSet=3DCAP_IPC_LOCK CAP_NET_BIND_SERVICE CAP_SETGI=
D CAP_SETUID CAP_SYS_CHROOT CAP_SYS_RESOURCE<br>
&gt; - MemoryDenyWriteExecute=3Dtrue<br>
&gt; - NoNewPrivileges=3Dtrue<br>
&gt; ---<br>
&gt; -2.17.1<br>
&gt; -<br>
&gt; diff --git a/meta-networking/recipes-support/unbound/<a href=3D"http:=
//unbound_1.9.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound=
_1.9.4.bb</a> b/meta-networking/recipes-support/unbound/<a href=3D"http://u=
nbound_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound_git.=
bb</a><br>
&gt; similarity index 92%<br>
&gt; rename from meta-networking/recipes-support/unbound/<a href=3D"http:/=
/unbound_1.9.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound_=
1.9.4.bb</a><br>
&gt; rename to meta-networking/recipes-support/unbound/<a href=3D"http://u=
nbound_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound_git.=
bb</a><br>
&gt; index 6200214ac..eeaf85344 100644<br>
&gt; --- a/meta-networking/recipes-support/unbound/<a href=3D"http://unbou=
nd_1.9.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound_1.9.4.=
bb</a><br>
&gt; +++ b/meta-networking/recipes-support/unbound/<a href=3D"http://unbou=
nd_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">unbound_git.bb</=
a><br>
&gt; @@ -10,9 +10,11 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5308494bc=
0590c0cb036afd781d78f06&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/NLne=
tLabs/unbound.git;protocol=3Dhttp;branch=3Dmaster" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">github.com/NLnetLabs/unbound.git;protocol=3Dhttp;br=
anch=3Dmaster</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://0001-contrib-add-yocto-compatible-startup=
-scripts.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0file://0001-contrib-add-yocto-compatible-init-sc=
ript.patch \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; -SRCREV=3D&quot;b60c4a472c856f0a98120b7259e991b3a6507eb5&quot;<br>
&gt; +<br>
&gt; +PV =3D &quot;1.12.0&quot;<br>
&gt; +SRCREV=3D&quot;52b04806f4236c37acd10179ab465a54adc7e86a&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit autotools pkgconfig systemd update-rc.d<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000fe516905b4983a11--
