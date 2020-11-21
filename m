Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web09.4252.1605952810173667156
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Nov 2020 02:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H5h7zV1p;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: beniaminsandu@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id i18so12594979ioa.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Nov 2020 02:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=i0LIGm+gylwgZolkrWBVEQYbasxiV1tg3HJeD/tpwlc=;
        b=H5h7zV1p2rq4b214Tc63KWTM5d66MuL+N/ZbxO4J0YZXwJiULLJiDeoqtxNNSv8atu
         xxD2fzp6idQWIzXTx/SWuw8C3DmwqopfsyhEZm0t6gJmSBz1BieGxUEnvDtgI9p9c+je
         Mr6TTw25mX5/wU2t45HPZ9ZImya1FZoiD3o0fxxLFkV1PpagaQqVahlZv5OeJ1CD76qX
         vhb0Nc3yZfoD6vH8RQ/lJy5MSZx58Cq1GTY92IKRWWaf5tC35e+Sr7x6XF4pHtdwPbb4
         wR9DhobVBWWjsa38xEOYrmsi4rZlD6BVerhfKphBqtbWwvMfbpvRxG9eH4xnguy1UmtG
         nRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=i0LIGm+gylwgZolkrWBVEQYbasxiV1tg3HJeD/tpwlc=;
        b=l7puMkSELZZmYsuNKf+feBQurFKo9vY0uBF/F5Votg2mlcbqpvLrgGFwUfwE/LUK99
         zFc1tC+lcmoVdkdph9u4i5Zok3/3FNOWlgsA6zUbl9lB4RkBxMqak3pxlVyh2VaSq7kd
         QGl6Gh6eZHD9jZu/0QliwB19vifk5DbBLYqycuCtAEaKtkZJ9TViioMer/f5n7Z525GS
         q1P3K+xdPm7cYqZvpe79ezSJDgqdwsbJQkFUobf9PTDU5ENTh/TMfIA/MEEai1rHw7Xs
         AiztDFFRnUATIa5k4hD/MEmStq6U8xwr5hBMsx8qqpmABgdiRI24e3jFdMbdphjl70KE
         Ng5Q==
X-Gm-Message-State: AOAM532UT8evjaQn3XmC0LYznAsbmg7/k6PuDc26Tv5jBUe6GxGH7uTc
	1C/lhHRiW4S2hazHl/fPi4IYjHDPJD74Gyd3ds6A4qTV
X-Google-Smtp-Source: ABdhPJzA0aRhAIm39gK3LOFoGHMdRlk7MrWXMCvtzlj0TmV4w7Qaem7E6mrd4klinBZemtwye3c86s0ilh81Uha77PA=
X-Received: by 2002:a6b:8e54:: with SMTP id q81mr17018624iod.190.1605952809144;
 Sat, 21 Nov 2020 02:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20201121095615.2845416-1-beniaminsandu@gmail.com>
In-Reply-To: <20201121095615.2845416-1-beniaminsandu@gmail.com>
From: "Beni" <beniaminsandu@gmail.com>
Date: Sat, 21 Nov 2020 11:59:57 +0200
Message-ID: <CABQJdOHkLsxXd+8PRz_3cXNFsQqeaLYK-jsBdxWkHu1PGqBW0Q@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: upgrade to 1.10.12
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b7173b05b49b0621"

--000000000000b7173b05b49b0621
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Grr, please disregard this patch, I renamed to wrong package version.


=C3=8En s=C3=A2m., 21 nov. 2020 la 11:56, Beniamin Sandu <beniaminsandu@gma=
il.com> a
scris:

> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  ...rib-add-yocto-compatible-init-script.patch | 78 +++++++++++++++++++
>  ...add-yocto-compatible-startup-scripts.patch | 78 -------------------
>  .../{unbound_1.9.4.bb =3D> unbound_1.10.12.bb}  |  4 +-
>  3 files changed, 80 insertions(+), 80 deletions(-)
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-co=
mpatible-init-script.patch
>  delete mode 100644
> meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-co=
mpatible-startup-scripts.patch
>  rename meta-networking/recipes-support/unbound/{unbound_1.9.4.bb =3D>
> unbound_1.10.12.bb} (93%)
>
> diff --git
> a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-=
compatible-init-script.patch
> b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-=
compatible-init-script.patch
> new file mode 100644
> index 000000000..7168a352f
> --- /dev/null
> +++
> b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-=
compatible-init-script.patch
> @@ -0,0 +1,78 @@
> +From 26614b6578056ec30b95013592e308bf24d924c2 Mon Sep 17 00:00:00 2001
> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> +Date: Fri, 20 Nov 2020 23:00:20 +0200
> +Subject: [PATCH] contrib: add yocto compatible init script
> +
> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> +---
> + contrib/unbound.init | 20 ++++++++++----------
> + 1 file changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/contrib/unbound.init b/contrib/unbound.init
> +index c5bb52bb..4eba752b 100644
> +--- a/contrib/unbound.init
> ++++ b/contrib/unbound.init
> +@@ -19,11 +19,11 @@
> + ### END INIT INFO
> +
> + # Source function library.
> +-. /etc/rc.d/init.d/functions
> ++. /etc/init.d/functions
> +
> + exec=3D"/usr/sbin/unbound"
> + prog=3D"unbound"
> +-config=3D"/var/unbound/unbound.conf"
> ++config=3D"/etc/unbound/unbound.conf"
> + pidfile=3D"/var/unbound/unbound.pid"
> + rootdir=3D"/var/unbound"
> +
> +@@ -54,14 +54,14 @@ start() {
> +       [ -e ${rootdir}/dev/log ] || touch ${rootdir}/dev/log
> +       mount --bind -n /dev/log ${rootdir}/dev/log >/dev/null 2>&1;
> +     fi;
> +-    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom'
> /proc/mounts; then
> ++    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random'
> /proc/mounts; then
> +       [ -d ${rootdir}/dev ] || mkdir -p ${rootdir}/dev ;
> +-      [ -e ${rootdir}/dev/urandom ] || touch ${rootdir}/dev/urandom
> +-      mount --bind -n /dev/urandom ${rootdir}/dev/urandom >/dev/null
> 2>&1;
> ++      [ -e ${rootdir}/dev/random ] || touch ${rootdir}/dev/random
> ++      mount --bind -n /dev/random ${rootdir}/dev/random >/dev/null 2>&1=
;
> +     fi;
> +
> +     # if not running, start it up here
> +-    daemon $exec
> ++    daemonize $exec
> +     retval=3D$?
> +     echo
> +     [ $retval -eq 0 ] && touch $lockfile
> +@@ -71,15 +71,15 @@ start() {
> + stop() {
> +     echo -n $"Stopping $prog: "
> +     # stop it here, often "killproc $prog"
> +-    killproc -p $pidfile $prog
> ++    killproc $prog
> +     retval=3D$?
> +     echo
> +     [ $retval -eq 0 ] && rm -f $lockfile
> +     if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/log'
> /proc/mounts; then
> +       umount ${rootdir}/dev/log >/dev/null 2>&1
> +     fi;
> +-    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom'
> /proc/mounts; then
> +-      umount ${rootdir}/dev/urandom >/dev/null 2>&1
> ++    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random'
> /proc/mounts; then
> ++      umount ${rootdir}/dev/random >/dev/null 2>&1
> +     fi;
> +     return $retval
> + }
> +@@ -99,7 +99,7 @@ force_reload() {
> +
> + rh_status() {
> +     # run checks to determine if the service is running or use generic
> status
> +-    status -p $pidfile $prog
> ++    status $prog
> + }
> +
> + rh_status_q() {
> +--
> +2.25.1
> +
> diff --git
> a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-=
compatible-startup-scripts.patch
> b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-=
compatible-startup-scripts.patch
> deleted file mode 100644
> index 46f6a7b3f..000000000
> ---
> a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yocto-=
compatible-startup-scripts.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From 186ac39de8eb9aedcf3d87cdbe389d10cde03d66 Mon Sep 17 00:00:00 2001
> -From: Beniamin Sandu <beniaminsandu@gmail.com>
> -Date: Tue, 16 Jul 2019 19:59:23 +0300
> -Subject: [PATCH] contrib: add yocto compatible startup scripts
> -
> -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ----
> - contrib/unbound.init       | 10 +++++-----
> - contrib/unbound.service.in |  4 ++--
> - 2 files changed, 7 insertions(+), 7 deletions(-)
> - mode change 100644 =3D> 100755 contrib/unbound.init
> -
> -diff --git a/contrib/unbound.init b/contrib/unbound.init
> -old mode 100644
> -new mode 100755
> -index cccadecc..4eba752b
> ---- a/contrib/unbound.init
> -+++ b/contrib/unbound.init
> -@@ -19,11 +19,11 @@
> - ### END INIT INFO
> -
> - # Source function library.
> --. /etc/rc.d/init.d/functions
> -+. /etc/init.d/functions
> -
> - exec=3D"/usr/sbin/unbound"
> - prog=3D"unbound"
> --config=3D"/var/unbound/unbound.conf"
> -+config=3D"/etc/unbound/unbound.conf"
> - pidfile=3D"/var/unbound/unbound.pid"
> - rootdir=3D"/var/unbound"
> -
> -@@ -61,7 +61,7 @@ start() {
> -     fi;
> -
> -     # if not running, start it up here
> --    daemon $exec
> -+    daemonize $exec
> -     retval=3D$?
> -     echo
> -     [ $retval -eq 0 ] && touch $lockfile
> -@@ -71,7 +71,7 @@ start() {
> - stop() {
> -     echo -n $"Stopping $prog: "
> -     # stop it here, often "killproc $prog"
> --    killproc -p $pidfile $prog
> -+    killproc $prog
> -     retval=3D$?
> -     echo
> -     [ $retval -eq 0 ] && rm -f $lockfile
> -@@ -99,7 +99,7 @@ force_reload() {
> -
> - rh_status() {
> -     # run checks to determine if the service is running or use generic
> status
> --    status -p $pidfile $prog
> -+    status $prog
> - }
> -
> - rh_status_q() {
> -diff --git a/contrib/unbound.service.in b/contrib/unbound.service.in
> -index 95976dd9..0e7f79a9 100644
> ---- a/contrib/unbound.service.in
> -+++ b/contrib/unbound.service.in
> -@@ -10,9 +10,9 @@ WantedBy=3Dmulti-user.target
> -
> - [Service]
> - ExecReload=3D/bin/kill -HUP $MAINPID
> --ExecStart=3D@UNBOUND_SBIN_DIR@/unbound
> -+ExecStart=3D@UNBOUND_SBIN_DIR@/unbound -d
> - NotifyAccess=3Dmain
> --Type=3Dnotify
> -+Type=3Dsimple
> - CapabilityBoundingSet=3DCAP_IPC_LOCK CAP_NET_BIND_SERVICE CAP_SETGID
> CAP_SETUID CAP_SYS_CHROOT CAP_SYS_RESOURCE
> - MemoryDenyWriteExecute=3Dtrue
> - NoNewPrivileges=3Dtrue
> ---
> -2.17.1
> -
> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> b/meta-networking/recipes-support/unbound/unbound_1.10.12.bb
> similarity index 93%
> rename from meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> rename to meta-networking/recipes-support/unbound/unbound_1.10.12.bb
> index 6200214ac..6fc163171 100644
> --- a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> +++ b/meta-networking/recipes-support/unbound/unbound_1.10.12.bb
> @@ -10,9 +10,9 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5308494bc0590c0cb036afd781d78=
f06"
>
>  SRC_URI =3D "git://
> github.com/NLnetLabs/unbound.git;protocol=3Dhttp;branch=3Dmaster \
> -       file://0001-contrib-add-yocto-compatible-startup-scripts.patch \
> +       file://0001-contrib-add-yocto-compatible-init-script.patch \
>  "
> -SRCREV=3D"b60c4a472c856f0a98120b7259e991b3a6507eb5"
> +SRCREV=3D"52b04806f4236c37acd10179ab465a54adc7e86a"
>
>  inherit autotools pkgconfig systemd update-rc.d
>
> --
> 2.25.1
>
>

--000000000000b7173b05b49b0621
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Grr, please disregard this patch, I renamed to wrong packa=
ge version.<br></div><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8En s=C3=A2m., 21 nov. 2020 l=
a 11:56, Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com" targ=
et=3D"_blank">beniaminsandu@gmail.com</a>&gt; a scris:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Signed-off-by: Beniamin Sandu &lt;<a=
 href=3D"mailto:beniaminsandu@gmail.com" target=3D"_blank">beniaminsandu@gm=
ail.com</a>&gt;<br>
---<br>
=C2=A0...rib-add-yocto-compatible-init-script.patch | 78 ++++++++++++++++++=
+<br>
=C2=A0...add-yocto-compatible-startup-scripts.patch | 78 ------------------=
-<br>
=C2=A0.../{<a href=3D"http://unbound_1.9.4.bb" rel=3D"noreferrer" target=3D=
"_blank">unbound_1.9.4.bb</a> =3D&gt; <a href=3D"http://unbound_1.10.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">unbound_1.10.12.bb</a>}=C2=A0 |=C2=A0=
 4 +-<br>
=C2=A03 files changed, 80 insertions(+), 80 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/00=
01-contrib-add-yocto-compatible-init-script.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/unbound/unbound/00=
01-contrib-add-yocto-compatible-startup-scripts.patch<br>
=C2=A0rename meta-networking/recipes-support/unbound/{<a href=3D"http://unb=
ound_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">unbound_1.9.4.bb</a> =
=3D&gt; <a href=3D"http://unbound_1.10.12.bb" rel=3D"noreferrer" target=3D"=
_blank">unbound_1.10.12.bb</a>} (93%)<br>
<br>
diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-a=
dd-yocto-compatible-init-script.patch b/meta-networking/recipes-support/unb=
ound/unbound/0001-contrib-add-yocto-compatible-init-script.patch<br>
new file mode 100644<br>
index 000000000..7168a352f<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yoct=
o-compatible-init-script.patch<br>
@@ -0,0 +1,78 @@<br>
+From 26614b6578056ec30b95013592e308bf24d924c2 Mon Sep 17 00:00:00 2001<br>
+From: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com" target=
=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
+Date: Fri, 20 Nov 2020 23:00:20 +0200<br>
+Subject: [PATCH] contrib: add yocto compatible init script<br>
+<br>
+Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.co=
m" target=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
+---<br>
+ contrib/unbound.init | 20 ++++++++++----------<br>
+ 1 file changed, 10 insertions(+), 10 deletions(-)<br>
+<br>
+diff --git a/contrib/unbound.init b/contrib/unbound.init<br>
+index c5bb52bb..4eba752b 100644<br>
+--- a/contrib/unbound.init<br>
++++ b/contrib/unbound.init<br>
+@@ -19,11 +19,11 @@<br>
+ ### END INIT INFO<br>
+ <br>
+ # Source function library.<br>
+-. /etc/rc.d/init.d/functions<br>
++. /etc/init.d/functions<br>
+ <br>
+ exec=3D&quot;/usr/sbin/unbound&quot;<br>
+ prog=3D&quot;unbound&quot;<br>
+-config=3D&quot;/var/unbound/unbound.conf&quot;<br>
++config=3D&quot;/etc/unbound/unbound.conf&quot;<br>
+ pidfile=3D&quot;/var/unbound/unbound.pid&quot;<br>
+ rootdir=3D&quot;/var/unbound&quot;<br>
+ <br>
+@@ -54,14 +54,14 @@ start() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e ${rootdir}/dev/log ] || touch ${rootdir}/d=
ev/log<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mount --bind -n /dev/log ${rootdir}/dev/log &gt=
;/dev/null 2&gt;&amp;1;<br>
+=C2=A0 =C2=A0 =C2=A0fi;<br>
+-=C2=A0 =C2=A0 if ! egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39;${rootdi=
r}&#39;/dev/urandom&#39; /proc/mounts; then<br>
++=C2=A0 =C2=A0 if ! egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39;${rootdi=
r}&#39;/dev/random&#39; /proc/mounts; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -d ${rootdir}/dev ] || mkdir -p ${rootdir}/de=
v ;<br>
+-=C2=A0 =C2=A0 =C2=A0 [ -e ${rootdir}/dev/urandom ] || touch ${rootdir}/de=
v/urandom<br>
+-=C2=A0 =C2=A0 =C2=A0 mount --bind -n /dev/urandom ${rootdir}/dev/urandom =
&gt;/dev/null 2&gt;&amp;1;<br>
++=C2=A0 =C2=A0 =C2=A0 [ -e ${rootdir}/dev/random ] || touch ${rootdir}/dev=
/random<br>
++=C2=A0 =C2=A0 =C2=A0 mount --bind -n /dev/random ${rootdir}/dev/random &g=
t;/dev/null 2&gt;&amp;1;<br>
+=C2=A0 =C2=A0 =C2=A0fi;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0# if not running, start it up here<br>
+-=C2=A0 =C2=A0 daemon $exec<br>
++=C2=A0 =C2=A0 daemonize $exec<br>
+=C2=A0 =C2=A0 =C2=A0retval=3D$?<br>
+=C2=A0 =C2=A0 =C2=A0echo<br>
+=C2=A0 =C2=A0 =C2=A0[ $retval -eq 0 ] &amp;&amp; touch $lockfile<br>
+@@ -71,15 +71,15 @@ start() {<br>
+ stop() {<br>
+=C2=A0 =C2=A0 =C2=A0echo -n $&quot;Stopping $prog: &quot;<br>
+=C2=A0 =C2=A0 =C2=A0# stop it here, often &quot;killproc $prog&quot;<br>
+-=C2=A0 =C2=A0 killproc -p $pidfile $prog<br>
++=C2=A0 =C2=A0 killproc $prog<br>
+=C2=A0 =C2=A0 =C2=A0retval=3D$?<br>
+=C2=A0 =C2=A0 =C2=A0echo<br>
+=C2=A0 =C2=A0 =C2=A0[ $retval -eq 0 ] &amp;&amp; rm -f $lockfile<br>
+=C2=A0 =C2=A0 =C2=A0if egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39;${roo=
tdir}&#39;/dev/log&#39; /proc/mounts; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0umount ${rootdir}/dev/log &gt;/dev/null 2&gt;&a=
mp;1<br>
+=C2=A0 =C2=A0 =C2=A0fi;<br>
+-=C2=A0 =C2=A0 if egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39;${rootdir}=
&#39;/dev/urandom&#39; /proc/mounts; then<br>
+-=C2=A0 =C2=A0 =C2=A0 umount ${rootdir}/dev/urandom &gt;/dev/null 2&gt;&am=
p;1<br>
++=C2=A0 =C2=A0 if egrep -q &#39;^/[^[:space:]]+[[:space:]]+&#39;${rootdir}=
&#39;/dev/random&#39; /proc/mounts; then<br>
++=C2=A0 =C2=A0 =C2=A0 umount ${rootdir}/dev/random &gt;/dev/null 2&gt;&amp=
;1<br>
+=C2=A0 =C2=A0 =C2=A0fi;<br>
+=C2=A0 =C2=A0 =C2=A0return $retval<br>
+ }<br>
+@@ -99,7 +99,7 @@ force_reload() {<br>
+ <br>
+ rh_status() {<br>
+=C2=A0 =C2=A0 =C2=A0# run checks to determine if the service is running or=
 use generic status<br>
+-=C2=A0 =C2=A0 status -p $pidfile $prog<br>
++=C2=A0 =C2=A0 status $prog<br>
+ }<br>
+ <br>
+ rh_status_q() {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contrib-a=
dd-yocto-compatible-startup-scripts.patch b/meta-networking/recipes-support=
/unbound/unbound/0001-contrib-add-yocto-compatible-startup-scripts.patch<br=
>
deleted file mode 100644<br>
index 46f6a7b3f..000000000<br>
--- a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-yoct=
o-compatible-startup-scripts.patch<br>
+++ /dev/null<br>
@@ -1,78 +0,0 @@<br>
-From 186ac39de8eb9aedcf3d87cdbe389d10cde03d66 Mon Sep 17 00:00:00 2001<br>
-From: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.com" target=
=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
-Date: Tue, 16 Jul 2019 19:59:23 +0300<br>
-Subject: [PATCH] contrib: add yocto compatible startup scripts<br>
-<br>
-Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmail.co=
m" target=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
----<br>
- contrib/unbound.init=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
- contrib/<a href=3D"http://unbound.service.in" rel=3D"noreferrer" target=
=3D"_blank">unbound.service.in</a> |=C2=A0 4 ++--<br>
- 2 files changed, 7 insertions(+), 7 deletions(-)<br>
- mode change 100644 =3D&gt; 100755 contrib/unbound.init<br>
-<br>
-diff --git a/contrib/unbound.init b/contrib/unbound.init<br>
-old mode 100644<br>
-new mode 100755<br>
-index cccadecc..4eba752b<br>
---- a/contrib/unbound.init<br>
-+++ b/contrib/unbound.init<br>
-@@ -19,11 +19,11 @@<br>
- ### END INIT INFO<br>
- <br>
- # Source function library.<br>
--. /etc/rc.d/init.d/functions<br>
-+. /etc/init.d/functions<br>
- <br>
- exec=3D&quot;/usr/sbin/unbound&quot;<br>
- prog=3D&quot;unbound&quot;<br>
--config=3D&quot;/var/unbound/unbound.conf&quot;<br>
-+config=3D&quot;/etc/unbound/unbound.conf&quot;<br>
- pidfile=3D&quot;/var/unbound/unbound.pid&quot;<br>
- rootdir=3D&quot;/var/unbound&quot;<br>
- <br>
-@@ -61,7 +61,7 @@ start() {<br>
-=C2=A0 =C2=A0 =C2=A0fi;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0# if not running, start it up here<br>
--=C2=A0 =C2=A0 daemon $exec<br>
-+=C2=A0 =C2=A0 daemonize $exec<br>
-=C2=A0 =C2=A0 =C2=A0retval=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0echo<br>
-=C2=A0 =C2=A0 =C2=A0[ $retval -eq 0 ] &amp;&amp; touch $lockfile<br>
-@@ -71,7 +71,7 @@ start() {<br>
- stop() {<br>
-=C2=A0 =C2=A0 =C2=A0echo -n $&quot;Stopping $prog: &quot;<br>
-=C2=A0 =C2=A0 =C2=A0# stop it here, often &quot;killproc $prog&quot;<br>
--=C2=A0 =C2=A0 killproc -p $pidfile $prog<br>
-+=C2=A0 =C2=A0 killproc $prog<br>
-=C2=A0 =C2=A0 =C2=A0retval=3D$?<br>
-=C2=A0 =C2=A0 =C2=A0echo<br>
-=C2=A0 =C2=A0 =C2=A0[ $retval -eq 0 ] &amp;&amp; rm -f $lockfile<br>
-@@ -99,7 +99,7 @@ force_reload() {<br>
- <br>
- rh_status() {<br>
-=C2=A0 =C2=A0 =C2=A0# run checks to determine if the service is running or=
 use generic status<br>
--=C2=A0 =C2=A0 status -p $pidfile $prog<br>
-+=C2=A0 =C2=A0 status $prog<br>
- }<br>
- <br>
- rh_status_q() {<br>
-diff --git a/contrib/<a href=3D"http://unbound.service.in" rel=3D"noreferr=
er" target=3D"_blank">unbound.service.in</a> b/contrib/<a href=3D"http://un=
bound.service.in" rel=3D"noreferrer" target=3D"_blank">unbound.service.in</=
a><br>
-index 95976dd9..0e7f79a9 100644<br>
---- a/contrib/<a href=3D"http://unbound.service.in" rel=3D"noreferrer" tar=
get=3D"_blank">unbound.service.in</a><br>
-+++ b/contrib/<a href=3D"http://unbound.service.in" rel=3D"noreferrer" tar=
get=3D"_blank">unbound.service.in</a><br>
-@@ -10,9 +10,9 @@ WantedBy=3Dmulti-user.target<br>
- <br>
- [Service]<br>
- ExecReload=3D/bin/kill -HUP $MAINPID<br>
--ExecStart=3D@UNBOUND_SBIN_DIR@/unbound<br>
-+ExecStart=3D@UNBOUND_SBIN_DIR@/unbound -d<br>
- NotifyAccess=3Dmain<br>
--Type=3Dnotify<br>
-+Type=3Dsimple<br>
- CapabilityBoundingSet=3DCAP_IPC_LOCK CAP_NET_BIND_SERVICE CAP_SETGID CAP_=
SETUID CAP_SYS_CHROOT CAP_SYS_RESOURCE<br>
- MemoryDenyWriteExecute=3Dtrue<br>
- NoNewPrivileges=3Dtrue<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta-networking/recipes-support/unbound/<a href=3D"http://unbo=
und_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">unbound_1.9.4.bb</a> b/m=
eta-networking/recipes-support/unbound/<a href=3D"http://unbound_1.10.12.bb=
" rel=3D"noreferrer" target=3D"_blank">unbound_1.10.12.bb</a><br>
similarity index 93%<br>
rename from meta-networking/recipes-support/unbound/<a href=3D"http://unbou=
nd_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">unbound_1.9.4.bb</a><br>
rename to meta-networking/recipes-support/unbound/<a href=3D"http://unbound=
_1.10.12.bb" rel=3D"noreferrer" target=3D"_blank">unbound_1.10.12.bb</a><br=
>
index 6200214ac..6fc163171 100644<br>
--- a/meta-networking/recipes-support/unbound/<a href=3D"http://unbound_1.9=
.4.bb" rel=3D"noreferrer" target=3D"_blank">unbound_1.9.4.bb</a><br>
+++ b/meta-networking/recipes-support/unbound/<a href=3D"http://unbound_1.1=
0.12.bb" rel=3D"noreferrer" target=3D"_blank">unbound_1.10.12.bb</a><br>
@@ -10,9 +10,9 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5308494bc0590c0cb036a=
fd781d78f06&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/NLnetLabs/unboun=
d.git;protocol=3Dhttp;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank"=
>github.com/NLnetLabs/unbound.git;protocol=3Dhttp;branch=3Dmaster</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-contrib-add-yocto-compatible-startu=
p-scripts.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-contrib-add-yocto-compatible-init-s=
cript.patch \<br>
=C2=A0&quot;<br>
-SRCREV=3D&quot;b60c4a472c856f0a98120b7259e991b3a6507eb5&quot;<br>
+SRCREV=3D&quot;52b04806f4236c37acd10179ab465a54adc7e86a&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig systemd update-rc.d<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000b7173b05b49b0621--
