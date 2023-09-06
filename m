Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCA6EE14C3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 20:12:44 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.228.1694031162039461385
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 13:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Zm1sDxTZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a5a7e7cd61so100232b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 13:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694031161; x=1694635961; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXWn39BGcJkanPHRtoMpJy3Wh05p0boUH+khdNB7aiA=;
        b=Zm1sDxTZrNPIZYeK+vHsjXZUtJG/0CLxYhm+aHQHH31lt74j24KWOQ7kIbI0LQEGMS
         AtQ8YFiIU/JWDr7DtiWnFFNgWA0iExa0w+QbY9fi7DYjnbq8b69oo48XwRf0gOCW3cdB
         NdsTRUnIGMUth33M4C3uTbHTgcDVSEwpUyuda37SUd4M8sLuEQjpWyGzxBt3UJlFcyVm
         VRU1YGrvIaoNEjppUYu2kDjWzgRUXMoYg48nVsuuuGBonqbT24XzhU3VqAWOGlx4jEUq
         Bf3ufh+ZdH6D/BOXKLyPEfrwhzeyop+JmxnIHXDaap9J79+MshMaYc3yuWtWD1j+XzkT
         23ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694031161; x=1694635961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXWn39BGcJkanPHRtoMpJy3Wh05p0boUH+khdNB7aiA=;
        b=aWUDUNEixWP62CuJ6TclthA9gekj1lI/200HS0eLt15zhu1vhs9LXSEQHkebaOFTQi
         f01phFDuEQIK4wacOfK5BE633Bmnlf00Wlv86mhidekF0V7wJR9st+XTL1ZSd5LoSME1
         FQGlRPJSTwbak1neh+OALCdZe/YLqckKxbNGLXsZ81RIQzeJQdhNMwIl1A+mhsE7Xfed
         O9MkHYT44jIouN45gjgbIjgQUgURuji2TH/3IOcklmb1KpGcCJiSg+UDP0a3cOWzLdn8
         X/lBKbUrdTFVToEnJSA9C7i6V3wFx1DiT0Jd9Jx2++87rFTO98/4J2085l9PmoMPP0E6
         wwSw==
X-Gm-Message-State: AOJu0Yy0x/TbQOTMm4p8T+O5TKn7jqosNQdiID4DOhOJPuO86orJMVqo
	0paN2TrrfK5rw6AOEkZyNdLTNm/TEFWNNc4BlHc=
X-Google-Smtp-Source: AGHT+IHzLsLJani7EjG07awhmQAwwAGVrNbE5O5t+sAaFhp+94PNJeVB3A2Co7pE0ygUEJhFj2mdygpQ7+GlFyBE9f8=
X-Received: by 2002:aca:b945:0:b0:3a7:2efb:cb7a with SMTP id
 j66-20020acab945000000b003a72efbcb7amr388321oif.24.1694031161211; Wed, 06 Sep
 2023 13:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230901090433.1770836-1-beniaminsandu@gmail.com> <CABQJdOGB-Ru+4JfoePD9L2DAwNiiC=SX230z8BaHvO7uqfs6KA@mail.gmail.com>
In-Reply-To: <CABQJdOGB-Ru+4JfoePD9L2DAwNiiC=SX230z8BaHvO7uqfs6KA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Sep 2023 13:12:15 -0700
Message-ID: <CAMKF1srBf_P6ZOzuvjSfPTp89jAVZx_Zq7FFGrtkws_1tFuk=g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] unbound: upgrade 1.17.1 -> 1.18.0
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 20:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104784

On Wed, Sep 6, 2023 at 10:53=E2=80=AFAM Beniamin Sandu <beniaminsandu@gmail=
.com> wrote:
>
> Unless there is an issue with my patch, I suggest you take mine in,
> instead of this one
> http://cgit.openembedded.org/meta-openembedded/commit/meta-networking?h=
=3Dmaster-next&id=3Dc7f303796b611700f30833da8b5479272304e610,
> as it's also removing the extra patch that we have been keeping for
> the init script.

Thanks for spotting this. I had it in master-next for a while and then
it got dropped perhaps due to bisecting an error. I have staged this
one now

>
> On Fri, 1 Sept 2023 at 12:04, Beniamin Sandu <beniaminsandu@gmail.com> wr=
ote:
> >
> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ---
> >  ...rib-add-yocto-compatible-init-script.patch | 80 -------------------
> >  .../{unbound_1.17.1.bb =3D> unbound_1.18.0.bb}  |  8 +-
> >  2 files changed, 3 insertions(+), 85 deletions(-)
> >  delete mode 100644 meta-networking/recipes-support/unbound/unbound/000=
1-contrib-add-yocto-compatible-init-script.patch
> >  rename meta-networking/recipes-support/unbound/{unbound_1.17.1.bb =3D>=
 unbound_1.18.0.bb} (87%)
> >
> > diff --git a/meta-networking/recipes-support/unbound/unbound/0001-contr=
ib-add-yocto-compatible-init-script.patch b/meta-networking/recipes-support=
/unbound/unbound/0001-contrib-add-yocto-compatible-init-script.patch
> > deleted file mode 100644
> > index 7bcf97261..000000000
> > --- a/meta-networking/recipes-support/unbound/unbound/0001-contrib-add-=
yocto-compatible-init-script.patch
> > +++ /dev/null
> > @@ -1,80 +0,0 @@
> > -From 26614b6578056ec30b95013592e308bf24d924c2 Mon Sep 17 00:00:00 2001
> > -From: Beniamin Sandu <beniaminsandu@gmail.com>
> > -Date: Fri, 20 Nov 2020 23:00:20 +0200
> > -Subject: [PATCH] contrib: add yocto compatible init script
> > -
> > -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ----
> > -Upstream-Status: Pending
> > -
> > - contrib/unbound.init | 20 ++++++++++----------
> > - 1 file changed, 10 insertions(+), 10 deletions(-)
> > -
> > -diff --git a/contrib/unbound.init b/contrib/unbound.init
> > -index c5bb52bb..4eba752b 100644
> > ---- a/contrib/unbound.init
> > -+++ b/contrib/unbound.init
> > -@@ -19,11 +19,11 @@
> > - ### END INIT INFO
> > -
> > - # Source function library.
> > --. /etc/rc.d/init.d/functions
> > -+. /etc/init.d/functions
> > -
> > - exec=3D"/usr/sbin/unbound"
> > - prog=3D"unbound"
> > --config=3D"/var/unbound/unbound.conf"
> > -+config=3D"/etc/unbound/unbound.conf"
> > - pidfile=3D"/var/unbound/unbound.pid"
> > - rootdir=3D"/var/unbound"
> > -
> > -@@ -54,14 +54,14 @@ start() {
> > -       [ -e ${rootdir}/dev/log ] || touch ${rootdir}/dev/log
> > -       mount --bind -n /dev/log ${rootdir}/dev/log >/dev/null 2>&1;
> > -     fi;
> > --    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urando=
m' /proc/mounts; then
> > -+    if ! egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random=
' /proc/mounts; then
> > -       [ -d ${rootdir}/dev ] || mkdir -p ${rootdir}/dev ;
> > --      [ -e ${rootdir}/dev/urandom ] || touch ${rootdir}/dev/urandom
> > --      mount --bind -n /dev/urandom ${rootdir}/dev/urandom >/dev/null =
2>&1;
> > -+      [ -e ${rootdir}/dev/random ] || touch ${rootdir}/dev/random
> > -+      mount --bind -n /dev/random ${rootdir}/dev/random >/dev/null 2>=
&1;
> > -     fi;
> > -
> > -     # if not running, start it up here
> > --    daemon $exec
> > -+    daemonize $exec
> > -     retval=3D$?
> > -     echo
> > -     [ $retval -eq 0 ] && touch $lockfile
> > -@@ -71,15 +71,15 @@ start() {
> > - stop() {
> > -     echo -n $"Stopping $prog: "
> > -     # stop it here, often "killproc $prog"
> > --    killproc -p $pidfile $prog
> > -+    killproc $prog
> > -     retval=3D$?
> > -     echo
> > -     [ $retval -eq 0 ] && rm -f $lockfile
> > -     if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/log' /pr=
oc/mounts; then
> > -       umount ${rootdir}/dev/log >/dev/null 2>&1
> > -     fi;
> > --    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/urandom'=
 /proc/mounts; then
> > --      umount ${rootdir}/dev/urandom >/dev/null 2>&1
> > -+    if egrep -q '^/[^[:space:]]+[[:space:]]+'${rootdir}'/dev/random' =
/proc/mounts; then
> > -+      umount ${rootdir}/dev/random >/dev/null 2>&1
> > -     fi;
> > -     return $retval
> > - }
> > -@@ -99,7 +99,7 @@ force_reload() {
> > -
> > - rh_status() {
> > -     # run checks to determine if the service is running or use generi=
c status
> > --    status -p $pidfile $prog
> > -+    status $prog
> > - }
> > -
> > - rh_status_q() {
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb =
b/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
> > similarity index 87%
> > rename from meta-networking/recipes-support/unbound/unbound_1.17.1.bb
> > rename to meta-networking/recipes-support/unbound/unbound_1.18.0.bb
> > index ff3d879ea..179af8050 100644
> > --- a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
> > +++ b/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
> > @@ -9,10 +9,8 @@ SECTION =3D "net"
> >  LICENSE =3D "BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5308494bc0590c0cb036afd781d=
78f06"
> >
> > -SRC_URI =3D "git://github.com/NLnetLabs/unbound.git;protocol=3Dhttps;b=
ranch=3Dmaster \
> > -       file://0001-contrib-add-yocto-compatible-init-script.patch \
> > -"
> > -SRCREV =3D "90831af981221bbce1cd7b15055562336760e484"
> > +SRC_URI =3D "git://github.com/NLnetLabs/unbound.git;protocol=3Dhttps;b=
ranch=3Dmaster"
> > +SRCREV =3D "3795e374107ac7a5a977c516e144a3cd9b0da998"
> >
> >  inherit autotools pkgconfig systemd update-rc.d
> >
> > @@ -39,7 +37,7 @@ do_install:append() {
> >         install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unit=
dir}/system
> >
> >         install -d ${D}${sysconfdir}/init.d
> > -       install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/ini=
t.d/unbound
> > +       install -m 0755 ${S}/contrib/unbound.init_yocto ${D}${sysconfdi=
r}/init.d/unbound
> >  }
> >
> >  SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
> > --
> > 2.25.1
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104783): https://lists.openembedded.org/g/openembedde=
d-devel/message/104783
> Mute This Topic: https://lists.openembedded.org/mt/101090986/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

