Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0A2C5478C
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 06:49:42 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.15943.1709621373092352531
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 22:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=TaF4GIAK;
 spf=pass (domain: smile.fr, ip: 209.85.218.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a441d7c6125so30972166b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 22:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709621371; x=1710226171; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4BgfLN8I3DN/bzydNqRgFYgpr1ZIx/nh1IGmPOVkaFY=;
        b=TaF4GIAKCcWmumaUkORLQRrRu6/IfMyoYomDqJdI6Y4WF6yWTHoitKaqlgbC7sNmdx
         Oct9BhA7DyA7elMwZcOjOzN+sCy/cfIaTewIpj2Ow8x1/5J+Rj1XyOjheKTsIrYFpCdj
         2Whfv/6LoqgFtQCvQJyejIM03g/BiNsuHwX5YNdzUN7ZIgmYRnfHxlyMzXy73sdFz7d8
         Xa69SrASYCKFwg9vl7sBtgIy5Lw3NaV/bggRG5e/tnaXK9RgQzRgbKpcBTWcRMO1rp/3
         xloUx5oLcUQMlajwgLbe1Gk7I+hodAR20+XYrapz7CRiZp4AeJWwsOeisH12guGuQsR6
         rWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709621371; x=1710226171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BgfLN8I3DN/bzydNqRgFYgpr1ZIx/nh1IGmPOVkaFY=;
        b=cupYBNbtfgLGTMWVbpW2VTB3UNtw7tGn+ln4lk7NVhwrFWij3GWkmLngfmS6TNeHeM
         5ep454sP2/0IMX6bUjClS1sOqFO9wajuZIvkSAWXpmrrYUsiHuz/1VYuPR+NRSp7bgsy
         iKCu5VO412qcnL07EWzPU8cGKXSDHk46coJYaKTKjpd5hVl9YbPpxnWFSq1C+4D5a1ew
         HWBMVbu6B/NknmnTrblN017akAnxH7r97tNYHFUd6lMzcwmsYuLOBJkTrfiuWi4F1lAI
         N3Ha0ILjOUDsnL5ZnnX3ma//sR/lXwXt5uoJivkWzSB03CuLX9gDXJhei60rU2P8a9qg
         ITpg==
X-Gm-Message-State: AOJu0YwXsWbikb7Yekn/1Ju4wbxTvmueF9w/qDnFupJALdCT41Bhr5eU
	9rtn7qGM+2+TLDsDz5LXNsUAyhjCO7/djp4RcYnsamxMBhgJd2oXgwx2u2MJU55HfuYtUmw1nTr
	t3iU3vgrw3q0rWaoG9iYuDsbvkNnXhcxgh+q1Gg==
X-Google-Smtp-Source: AGHT+IFLVdk/RHvjzE1CauKWi4SyepSx6MbJgdfwxvFv6JqNoRew+AKgwMNmNOi7VStoamxYBbStqccIgQQ72I6hR3M=
X-Received: by 2002:a17:906:5a9a:b0:a44:48db:9060 with SMTP id
 l26-20020a1709065a9a00b00a4448db9060mr6756632ejq.19.1709621371217; Mon, 04
 Mar 2024 22:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20240304201312.1089609-1-yoann.congal@smile.fr> <CAMKF1spa5cCKTYdCJq6sxvDwVjGXWVHHWmyDBc9P=7Dh9mTOxQ@mail.gmail.com>
In-Reply-To: <CAMKF1spa5cCKTYdCJq6sxvDwVjGXWVHHWmyDBc9P=7Dh9mTOxQ@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Tue, 5 Mar 2024 07:49:17 +0100
Message-ID: <CAMSfU+4AE-ayPRKJ7EL4WzBa3GUa8vfyDeLtnt-b0KYT5eTaBA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] drbd-utils: Fix a udev rule reproducibility
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000883c0b0612e43e8f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 06:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109113

--000000000000883c0b0612e43e8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 5 mars 2024 =C3=A0 00:48, Khem Raj <raj.khem@gmail.com> a =C3=A9cri=
t :

> which branch is it meant for ?
>

That was for the master branch but I missed the 9.27.0 update, sorry.

I'll rebase and send a v2.

On Mon, Mar 4, 2024 at 12:13=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:
> >
> > drbd-utils configure step check the build host udev version to enable
> > or disable the target udev rule. This leads to a clear
> > non-reproducibility.
> >
> > This patch fixes this by adding a configure option to the configure ste=
p
> > which allows to skip the udev version checks and unconditionally enable
> > the udev rule.
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  ...-an-option-to-disable-host-udev-vers.patch | 55 +++++++++++++++++++
> >  .../recipes-support/drbd/drbd-utils_9.22.0.bb |  2 +
> >  2 files changed, 57 insertions(+)
> >  create mode 100644
> meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-=
option-to-disable-host-udev-vers.patch
> >
> > diff --git
> a/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-a=
n-option-to-disable-host-udev-vers.patch
> b/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-a=
n-option-to-disable-host-udev-vers.patch
> > new file mode 100644
> > index 0000000000..5e03ff7b32
> > --- /dev/null
> > +++
> b/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-a=
n-option-to-disable-host-udev-vers.patch
> > @@ -0,0 +1,55 @@
> > +From 50749a5b0eb0becb39a4edb5fe844b13bbeb5836 Mon Sep 17 00:00:00 2001
> > +From: Yoann Congal <yoann.congal@smile.fr>
> > +Date: Sat, 2 Mar 2024 16:23:07 +0100
> > +Subject: [PATCH] configure.ac: Add an option to disable host udev
> version
> > + checks
> > +
> > +In cross-compilation environment, the build host might have an outdate=
d
> > +udev or no udev at all. But the user may still want to build with the
> > +enabled udev rule (for its udev-enabled target).
> > +
> > +This patch adds a "--disable-udevchecks" option the disable build host
> > +udev version check at configure-time and unconditionally install the
> > +enabled udev rule. Without this new option, the behavior stays the sam=
e
> > +(checks enabled).
> > +
> > +Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > +Upstream-Status: Submitted [
> https://lists.linbit.com/pipermail/drbd-dev/2024-March/007201.html]
> > +---
> > + configure.ac | 9 +++++++--
> > + 1 file changed, 7 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index d5a0e733..da083240 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -71,6 +71,11 @@ AC_ARG_WITH([udev],
> > +       [AS_HELP_STRING([--with-udev],
> > +                       [Enable udev integration])],
> > +       [WITH_UDEV=3D$withval])
> > ++AC_ARG_ENABLE([udevchecks],
> > ++      [AS_HELP_STRING([--disable-udevchecks],
> > ++                      [Disable host udev version checks])],
> > ++      [],
> > ++      [enable_udevchecks=3Dyes])
> > + AC_ARG_WITH([xen],
> > +       [AS_HELP_STRING([--with-xen],
> > +                       [Enable Xen integration])],
> > +@@ -309,7 +314,7 @@ if test -z $GIT; then
> > +    AC_MSG_WARN(Cannot update buildtag without git. You may safely
> ignore this warning when building from a tarball.)
> > + fi
> > +
> > +-if test $UDEVADM =3D false && test $UDEVINFO =3D false; then
> > ++if test "x$enable_udevchecks" !=3D "xno" && test $UDEVADM =3D false &=
&
> test $UDEVINFO =3D false; then
> > +    if test "$WITH_UDEV" =3D "yes"; then
> > +      AC_MSG_WARN([udev support enabled, but neither udevadm nor
> udevinfo found on this system.])
> > +    fi
> > +@@ -413,7 +418,7 @@ dnl default.
> > + test -z $INITDIR && INITDIR=3D"$sysconfdir/init.d"
> > +
> > + dnl Our udev rules file is known to work only with udev >=3D 85
> > +-if test "$WITH_UDEV" =3D "yes"; then
> > ++if test "x$enable_udevchecks" !=3D "xno" && test "$WITH_UDEV" =3D "ye=
s";
> then
> > +    udev_version=3D$( set -- $($UDEVADM version); echo $1 )
> > +    if test -z "$udev_version"; then
> > +       udev_version=3D$( set -- $($UDEVINFO -V); echo $3 )
> > diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
> b/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
> > index 960260fd39..65a43d9b26 100644
> > --- a/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
> > +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.22.0.bb
> > @@ -12,6 +12,7 @@ SRC_URI =3D "git://
> github.com/LINBIT/drbd-utils;name=3Ddrbd-utils;branch=3Dmaster;prot
> >             file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
> >             file://0001-replace-off64_t-with-off_t.patch \
> >
>  ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-util=
s-support-usrmerge.patch','',d)}
> \
> > +
>  file://0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch \
> >             "
> >  SRC_URI:append:libc-musl =3D "
> file://0002-drbdadm-drop-use-of-GLOB_MAGCHAR-use-strchr-heuristi.patch "
> >  SRCREV_drbd-utils =3D "409097fe02187f83790b88ac3e0d94f3c167adab"
> > @@ -39,6 +40,7 @@ EXTRA_OECONF =3D " \
> >                  --with-initscripttype=3Dboth    \
> >                  --with-systemdunitdir=3D${systemd_unitdir}/system \
> >                  --without-manual \
> > +                --disable-udevchecks \
> >                 "
> >
> >  # If we have inherited reproducible_build, we want to use it.
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109102):
> https://lists.openembedded.org/g/openembedded-devel/message/109102
> > Mute This Topic: https://lists.openembedded.org/mt/104730465/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
--=20
Yoann Congal - Smile ECS

--000000000000883c0b0612e43e8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le mar. 5 mars 2024 =C3=A0 00:48, Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">which branch is it meant for ?<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">That was f=
or the master branch but I missed the 9.27.0 update, sorry.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I&#39;ll rebase and send a v2.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
On Mon, Mar 4, 2024 at 12:13=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:=
yoann.congal@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@sm=
ile.fr</a>&gt; wrote:<br>
&gt;<br>
&gt; drbd-utils configure step check the build host udev version to enable<=
br>
&gt; or disable the target udev rule. This leads to a clear<br>
&gt; non-reproducibility.<br>
&gt;<br>
&gt; This patch fixes this by adding a configure option to the configure st=
ep<br>
&gt; which allows to skip the udev version checks and unconditionally enabl=
e<br>
&gt; the udev rule.<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-an-option-to-disable-host-udev-vers.patch | 55 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../recipes-support/drbd/<a href=3D"http://drbd-utils_9.22.0.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">drbd-utils_9.22.0.bb</a> |=
=C2=A0 2 +<br>
&gt;=C2=A0 2 files changed, 57 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-networking/recipes-support/drbd/drbd-uti=
ls/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-conf=
igure.ac-Add-an-option-to-disable-host-udev-vers.patch b/meta-networking/re=
cipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-ho=
st-udev-vers.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5e03ff7b32<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.a=
c-Add-an-option-to-disable-host-udev-vers.patch<br>
&gt; @@ -0,0 +1,55 @@<br>
&gt; +From 50749a5b0eb0becb39a4edb5fe844b13bbeb5836 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" targe=
t=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; +Date: Sat, 2 Mar 2024 16:23:07 +0100<br>
&gt; +Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer no=
referrer" target=3D"_blank">configure.ac</a>: Add an option to disable host=
 udev version<br>
&gt; + checks<br>
&gt; +<br>
&gt; +In cross-compilation environment, the build host might have an outdat=
ed<br>
&gt; +udev or no udev at all. But the user may still want to build with the=
<br>
&gt; +enabled udev rule (for its udev-enabled target).<br>
&gt; +<br>
&gt; +This patch adds a &quot;--disable-udevchecks&quot; option the disable=
 build host<br>
&gt; +udev version check at configure-time and unconditionally install the<=
br>
&gt; +enabled udev rule. Without this new option, the behavior stays the sa=
me<br>
&gt; +(checks enabled).<br>
&gt; +<br>
&gt; +Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.=
fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://lists.linbit.com/piper=
mail/drbd-dev/2024-March/007201.html" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.linbit.com/pipermail/drbd-dev/2024-March/007201.h=
tml</a>]<br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.ac</a> | 9 +++++++--<br>
&gt; + 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" =
rel=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index d5a0e733..da083240 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">configure.ac</a><br>
&gt; +@@ -71,6 +71,11 @@ AC_ARG_WITH([udev],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[AS_HELP_STRING([--with-udev],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0[Enable udev integration])],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[WITH_UDEV=3D$withval])<br>
&gt; ++AC_ARG_ENABLE([udevchecks],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 [AS_HELP_STRING([--disable-udevchecks],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [Disable host udev version checks])],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 [],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 [enable_udevchecks=3Dyes])<br>
&gt; + AC_ARG_WITH([xen],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[AS_HELP_STRING([--with-xen],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0[Enable Xen integration])],<br>
&gt; +@@ -309,7 +314,7 @@ if test -z $GIT; then<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_WARN(Cannot update buildtag without git. You may=
 safely ignore this warning when building from a tarball.)<br>
&gt; + fi<br>
&gt; +<br>
&gt; +-if test $UDEVADM =3D false &amp;&amp; test $UDEVINFO =3D false; then=
<br>
&gt; ++if test &quot;x$enable_udevchecks&quot; !=3D &quot;xno&quot; &amp;&a=
mp; test $UDEVADM =3D false &amp;&amp; test $UDEVINFO =3D false; then<br>
&gt; +=C2=A0 =C2=A0 if test &quot;$WITH_UDEV&quot; =3D &quot;yes&quot;; the=
n<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 AC_MSG_WARN([udev support enabled, but neither u=
devadm nor udevinfo found on this system.])<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +@@ -413,7 +418,7 @@ dnl default.<br>
&gt; + test -z $INITDIR &amp;&amp; INITDIR=3D&quot;$sysconfdir/init.d&quot;=
<br>
&gt; +<br>
&gt; + dnl Our udev rules file is known to work only with udev &gt;=3D 85<b=
r>
&gt; +-if test &quot;$WITH_UDEV&quot; =3D &quot;yes&quot;; then<br>
&gt; ++if test &quot;x$enable_udevchecks&quot; !=3D &quot;xno&quot; &amp;&a=
mp; test &quot;$WITH_UDEV&quot; =3D &quot;yes&quot;; then<br>
&gt; +=C2=A0 =C2=A0 udev_version=3D$( set -- $($UDEVADM version); echo $1 )=
<br>
&gt; +=C2=A0 =C2=A0 if test -z &quot;$udev_version&quot;; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0udev_version=3D$( set -- $($UDEVINFO -V); =
echo $3 )<br>
&gt; diff --git a/meta-networking/recipes-support/drbd/<a href=3D"http://dr=
bd-utils_9.22.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">drbd-ut=
ils_9.22.0.bb</a> b/meta-networking/recipes-support/drbd/<a href=3D"http://=
drbd-utils_9.22.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">drbd-=
utils_9.22.0.bb</a><br>
&gt; index 960260fd39..65a43d9b26 100644<br>
&gt; --- a/meta-networking/recipes-support/drbd/<a href=3D"http://drbd-util=
s_9.22.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">drbd-utils_9.2=
2.0.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/drbd/<a href=3D"http://drbd-util=
s_9.22.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">drbd-utils_9.2=
2.0.bb</a><br>
&gt; @@ -12,6 +12,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com=
/LINBIT/drbd-utils;name=3Ddrbd-utils;branch=3Dmaster;prot" rel=3D"noreferre=
r noreferrer" target=3D"_blank">github.com/LINBIT/drbd-utils;name=3Ddrbd-ut=
ils;branch=3Dmaster;prot</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-drbdmon-add=
-LDFLAGS-when-linking.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-replace-off=
64_t-with-off_t.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#=
39;DISTRO_FEATURES&#39;,&#39;usrmerge&#39;,&#39;file://0001-drbd-utils-supp=
ort-usrmerge.patch&#39;,&#39;&#39;,d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-Add=
-an-option-to-disable-host-udev-vers.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI:append:libc-musl =3D &quot; file://0002-drbdadm-drop-use=
-of-GLOB_MAGCHAR-use-strchr-heuristi.patch &quot;<br>
&gt;=C2=A0 SRCREV_drbd-utils =3D &quot;409097fe02187f83790b88ac3e0d94f3c167=
adab&quot;<br>
&gt; @@ -39,6 +40,7 @@ EXTRA_OECONF =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-i=
nitscripttype=3Dboth=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-s=
ystemdunitdir=3D${systemd_unitdir}/system \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --withou=
t-manual \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-ude=
vchecks \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br=
>
&gt;<br>
&gt;=C2=A0 # If we have inherited reproducible_build, we want to use it.<br=
>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#109102): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/109102" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/109=
102</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10473046=
5/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/104730465/1997914</a><br>
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
</blockquote></div></div><div data-smartmail=3D"gmail_signature">-- <br>Yoa=
nn Congal - Smile ECS</div></div>

--000000000000883c0b0612e43e8f--

