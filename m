Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web12.12492.1590673794390133244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2020 06:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ScMKmmd9;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: beniaminsandu@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id y5so7179147iob.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2020 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kXiQkF1tdzHOpzBbuWJCvT7lE+VCsbgednVnxgCZSOA=;
        b=ScMKmmd9w6FbkDMoAiXnifhKL32xrhVagMVBn5cg1NyQOIoB+Tj/Vbv+TnMkYvi6nE
         TcgJHrYZDISghW1AXqP2DY5apihraq6UCQ9xaB+ClStrXERQmGFVbHTe3NxTFMaxrgk2
         9fd7sdYwPOvW1eTHnzXHuxgN+njs8lFrL+LyCUSfYKE1Kw8VSNOf2v59cLl+YtXhVfgY
         /OL+KbStrmxYQUmaVT6scMkFIPMEbWUWVJDUl3JZTZ/vC2Yo9OWZOQInMHfBqJCOvYu6
         +Rml1i99TwRMvWaxc7vpvgprXnRlaVCBpnr1k9KjZBuxQVY/5BE9xR02xzLWcS9Bi8tw
         y78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kXiQkF1tdzHOpzBbuWJCvT7lE+VCsbgednVnxgCZSOA=;
        b=oZuHUsZXP6LpbVr3ZnZCtMdluHMn4rfaUDcvIQxVPyrsI1EWFiYxvFmdaGvKH1PXMr
         7rK9zhxSxcK1FxGCBr8vvKOFNT7RvIls90AYd0GiZZA8v9TLIPErtkkY+BX1GY/oaIMc
         ugvagLo00aR36kh+5hCidouGm5Y36b5PwCmjiQWfRPGl5LeUi3supqpLzx015nxdYbFm
         ZJTD6vXqI37660qzDVvz44+LB8dgi1oRFzWacDl3CijTllpqwZX2VdnRJ/9lCiPmWoK4
         pdC5oNd/gF0V7H3VZl56UuPhfds1Xl69F3wAD3L80lzoLGdJAAGS59IUMeeZXmhlQpfk
         W/Fg==
X-Gm-Message-State: AOAM532DyPO2/29PE4YlFrgeavOtMVrgep53rx7WxYq7NCEKjROabwoa
	x8czDH1D+uBLEMvhNjwhw91L8N3B+H8khnMt8L0=
X-Google-Smtp-Source: ABdhPJwV4CaJmCfSedFY9IBi7SFkiWrUMLNCEd81Q9qL8C6oIQp4x1XbQONI8UaKRSVxpucyRzAuK55iNaG2o1rik9I=
X-Received: by 2002:a02:2581:: with SMTP id g123mr2545555jag.35.1590673793739;
 Thu, 28 May 2020 06:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200507103712.3356068-1-beniaminsandu@gmail.com> <CAMKF1soGerMVWqAbYS6Qwz7+RPGa9CgbRrtspHN9=awrS7KeEQ@mail.gmail.com>
In-Reply-To: <CAMKF1soGerMVWqAbYS6Qwz7+RPGa9CgbRrtspHN9=awrS7KeEQ@mail.gmail.com>
From: "Beni" <beniaminsandu@gmail.com>
Date: Thu, 28 May 2020 16:49:42 +0300
Message-ID: <CABQJdOFsjHX-kh7VO4Z5u7-uPM=7orYnk33iY7XG-3-ZoXgCkg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] rasdaemon: create recipe for version 0.6.5
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006df00405a6b59a21"

--0000000000006df00405a6b59a21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry for the late response, I was AFK for a longer time and forgot
about this.
I saw your latest patch, thanks for fixing and integrating it.

=C3=8En s=C3=A2m., 9 mai 2020 la 05:53, Khem Raj <raj.khem@gmail.com> a sc=
ris:

> On Thu, May 7, 2020 at 3:37 AM Beni <beniaminsandu@gmail.com> wrote:
> >
> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ---
> >  meta-oe/recipes-support/rasdaemon/files/init  | 43 ++++++++++++++++
> >  .../rasdaemon/files/rasdaemon.service         | 12 +++++
> >  .../rasdaemon/rasdaemon_0.6.5.bb              | 51 ++++++++++++++++++=
+
> >  3 files changed, 106 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/rasdaemon/files/init
> >  create mode 100644
> meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
> >  create mode 100644 meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.=
bb
> >
> > diff --git a/meta-oe/recipes-support/rasdaemon/files/init
> b/meta-oe/recipes-support/rasdaemon/files/init
> > new file mode 100644
> > index 000000000..216677e73
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/rasdaemon/files/init
> > @@ -0,0 +1,43 @@
> > +#! /bin/sh
> > +# /etc/init.d/rasdaemon: start rasdaemon service
> > +
> > +. /etc/init.d/functions
> > +
> > +# Defaults
> > +PIDFILE=3D/var/run/rasdaemon.pid
> > +BINFILE=3D/usr/sbin/rasdaemon
> > +SCRIPTNAME=3D/etc/init.d/rasdaemon
> > +
> > +[ -x $BINFILE ] || exit 0
> > +
> > +case "$1" in
> > +       start)
> > +               echo -n "Starting RASdaemon services: "
> > +               if [ ! -f "$PIDFILE" ]; then
> > +                       start-stop-daemon --start --quiet --exec
> $BINFILE -- --enable &> /dev/null
> > +                       start-stop-daemon --start --quiet --pidfile
> $PIDFILE --exec $BINFILE -- --record
> > +                       pidof $BINFILE > $PIDFILE
> > +               fi
> > +               [ -f $PIDFILE ] && echo "done." || echo "fail."
> > +               ;;
> > +       stop)
> > +               echo -n "Stopping RASdaemon services: "
> > +               if [ -f  "$PIDFILE" ] ; then
> > +                       start-stop-daemon --stop --quiet --pidfile
> $PIDFILE --exec $BINFILE -- --disable &> /dev/null
> > +                       killproc $BINFILE
> > +                       rm $PIDFILE
> > +               fi
> > +               [ ! -f $PIDFILE ] && echo "done." || echo "fail."
> > +               ;;
> > +       restart)
> > +               $0 stop
> > +               sleep 1
> > +               $0 start
> > +               ;;
> > +       status)
> > +               status $BINFILE
> > +               ;;
> > +       *)
> > +               echo "Usage: $SCRIPTNAME {start|stop|restart|status}"
> > +               exit 1
> > +esac
> > diff --git a/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
> b/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
> > new file mode 100644
> > index 000000000..4fbf23142
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service
> > @@ -0,0 +1,12 @@
> > +[Unit]
> > +Description=3DRAS daemon to log the RAS events
> > +After=3Dsyslog.target
> > +
> > +[Service]
> > +ExecStart=3D/usr/sbin/rasdaemon -f -r
> > +ExecStartPost=3D/usr/sbin/rasdaemon --enable
> > +ExecStop=3D/usr/sbin/rasdaemon --disable
> > +Restart=3Don-abort
> > +
> > +[Install]
> > +WantedBy=3Dmulti-user.target
> > diff --git a/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
> b/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
> > new file mode 100644
> > index 000000000..c1b9fdbaa
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/rasdaemon/rasdaemon_0.6.5.bb
> > @@ -0,0 +1,51 @@
> > +DESCRIPTION =3D "Tools to provide a way to get Platform Reliability,
> Availability and Serviceability (RAS) reports made via the Kernel tracin=
g
> events"
> > +HOMEPAGE =3D "http://git.infradead.org/users/mchehab/rasdaemon.git"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd3070efe0afa3dc41608bd82c0=
0bb0dc"
> > +
> > +SRC_URI =3D "git://
> git.infradead.org/users/mchehab/rasdaemon.git;branch=3Dmaster \
> > +       file://rasdaemon.service \
> > +       file://init"
> > +
> > +SRCREV =3D "25533c0c55426eeb2ad25dcbdb2b5e4ba4e83d80"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +RDEPENDS_${BPN} =3D "perl perl-module-file-basename perl-module-file-=
find
> perl-module-file-spec perl-module-getopt-long \
> > +       perl-module-posix perl-module-file-glob libdbi-perl
> libdbd-sqlite-perl"
> > +
>
> depending on libdbd-sqlite-perl will make meta-oe depend on meta-perl, s=
o
> far
> we have avoided this dependency, is there a way to make this configurabl=
e ?
>
> > +inherit autotools pkgconfig update-rc.d systemd
> > +
> > +PACKAGECONFIG ??=3D "sqlite3 mce aer extlog devlink diskerror"
> > +PACKAGECONFIG[sqlite3] =3D "--enable-sqlite3,--disable-sqlite3,sqlite=
3"
> > +PACKAGECONFIG[mce] =3D "--enable-mce,--disable-mce"
> > +PACKAGECONFIG[aer] =3D "--enable-aer,--disable-aer"
> > +PACKAGECONFIG[extlog] =3D "--enable-extlog,--disable-extlog"
> > +PACKAGECONFIG[devlink] =3D "--enable-devlink,--disable-devlink"
> > +PACKAGECONFIG[diskerror] =3D "--enable-diskerror,--disable-diskerror"
> > +PACKAGECONFIG[arm] =3D "--enable-arm,--disable-arm"
> > +PACKAGECONFIG[hisi-ns-decode] =3D
> "--enable-hisi-ns-decode,--disable-hisi-ns-decode"
> > +PACKAGECONFIG[non-standard] =3D
> "--enable-non-standard,--disable-non-standard"
> > +PACKAGECONFIG[abrt-report] =3D
> "--enable-abrt-report,--disable-abrt-report"
> > +
> > +do_configure_prepend () {
> > +       ( cd ${S}; autoreconf -vfi )
> > +}
> > +
> > +do_install_append() {
> > +       install -d ${D}${sysconfdir}/init.d
> > +       install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rasdae=
mon
> > +       install -d ${D}${systemd_unitdir}/system
> > +       install -m 0644 ${WORKDIR}/rasdaemon.service
> ${D}${systemd_unitdir}/system
> > +}
> > +
> > +FILES_${PN} +=3D "${sbindir}/rasdaemon \
> > +               ${sysconfdir}/init.d \
> > +               ${systemd_unitdir}/system/rasdaemon.service"
> > +
> > +SYSTEMD_SERVICE_${PN} =3D "rasdaemon.service"
> > +SYSTEMD_AUTO_ENABLE =3D "enable"
> > +
> > +INITSCRIPT_PACKAGES =3D "${PN}"
> > +INITSCRIPT_NAME_${PN} =3D "rasdaemon"
> > +INITSCRIPT_PARAMS_${PN} =3D "defaults 89"
> > --
> > 2.25.1
> >
> >=20
>

--0000000000006df00405a6b59a21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m sorry for the late response, I was AFK for a =
longer time and forgot about this.</div><div>I saw your latest patch, thank=
s for fixing and integrating it.<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8En s=C3=A2m., 9 mai 2020 la =
05:53, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt; a scris:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thu, May 7, 2020 at 3:37 AM Beni &lt;<a href=3D"mailto:beniaminsandu@=
gmail.com" target=3D"_blank">beniaminsandu@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gma=
il.com" target=3D"_blank">beniaminsandu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-support/rasdaemon/files/init=C2=A0 | 43 +++++++=
+++++++++<br>
&gt;=C2=A0 .../rasdaemon/files/rasdaemon.service=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 +++++<br>
&gt;=C2=A0 .../rasdaemon/<a href=3D"http://rasdaemon_0.6.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">rasdaemon_0.6.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 51 +++++++++++++++++++<br>
&gt;=C2=A0 3 files changed, 106 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/rasdaemon/files/init=
<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/rasdaemon/files/rasd=
aemon.service<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/rasdaemon/<a href=3D=
"http://rasdaemon_0.6.5.bb" rel=3D"noreferrer" target=3D"_blank">rasdaemon_=
0.6.5.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/rasdaemon/files/init b/meta-oe/r=
ecipes-support/rasdaemon/files/init<br>
&gt; new file mode 100644<br>
&gt; index 000000000..216677e73<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/rasdaemon/files/init<br>
&gt; @@ -0,0 +1,43 @@<br>
&gt; +#! /bin/sh<br>
&gt; +# /etc/init.d/rasdaemon: start rasdaemon service<br>
&gt; +<br>
&gt; +. /etc/init.d/functions<br>
&gt; +<br>
&gt; +# Defaults<br>
&gt; +PIDFILE=3D/var/run/rasdaemon.pid<br>
&gt; +BINFILE=3D/usr/sbin/rasdaemon<br>
&gt; +SCRIPTNAME=3D/etc/init.d/rasdaemon<br>
&gt; +<br>
&gt; +[ -x $BINFILE ] || exit 0<br>
&gt; +<br>
&gt; +case &quot;$1&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0start)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot=
;Starting RASdaemon services: &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -f &qu=
ot;$PIDFILE&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0start-stop-daemon --start --quiet --exec $BINFILE -- --en=
able &amp;&gt; /dev/null<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0start-stop-daemon --start --quiet --pidfile $PIDFILE --ex=
ec $BINFILE -- --record<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0pidof $BINFILE &gt; $PIDFILE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -f $PIDFILE=
 ] &amp;&amp; echo &quot;done.&quot; || echo &quot;fail.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stop)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot=
;Stopping RASdaemon services: &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f=C2=A0=
 &quot;$PIDFILE&quot; ] ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0start-stop-daemon --stop --quiet --pidfile $PIDFILE --exe=
c $BINFILE -- --disable &amp;&gt; /dev/null<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0killproc $BINFILE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rm $PIDFILE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -f $PIDFI=
LE ] &amp;&amp; echo &quot;done.&quot; || echo &quot;fail.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0restart)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$0 stop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$0 start<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0status)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status $BINFI=
LE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Us=
age: $SCRIPTNAME {start|stop|restart|status}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; +esac<br>
&gt; diff --git a/meta-oe/recipes-support/rasdaemon/files/rasdaemon.servic=
e b/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service<br>
&gt; new file mode 100644<br>
&gt; index 000000000..4fbf23142<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/rasdaemon/files/rasdaemon.service<br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +[Unit]<br>
&gt; +Description=3DRAS daemon to log the RAS events<br>
&gt; +After=3Dsyslog.target<br>
&gt; +<br>
&gt; +[Service]<br>
&gt; +ExecStart=3D/usr/sbin/rasdaemon -f -r<br>
&gt; +ExecStartPost=3D/usr/sbin/rasdaemon --enable<br>
&gt; +ExecStop=3D/usr/sbin/rasdaemon --disable<br>
&gt; +Restart=3Don-abort<br>
&gt; +<br>
&gt; +[Install]<br>
&gt; +WantedBy=3Dmulti-user.target<br>
&gt; diff --git a/meta-oe/recipes-support/rasdaemon/<a href=3D"http://rasd=
aemon_0.6.5.bb" rel=3D"noreferrer" target=3D"_blank">rasdaemon_0.6.5.bb</a>=
 b/meta-oe/recipes-support/rasdaemon/<a href=3D"http://rasdaemon_0.6.5.bb" =
rel=3D"noreferrer" target=3D"_blank">rasdaemon_0.6.5.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..c1b9fdbaa<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/rasdaemon/<a href=3D"http://rasdaemon_0=
.6.5.bb" rel=3D"noreferrer" target=3D"_blank">rasdaemon_0.6.5.bb</a><br>
&gt; @@ -0,0 +1,51 @@<br>
&gt; +DESCRIPTION =3D &quot;Tools to provide a way to get Platform Reliabi=
lity, Availability and Serviceability (RAS) reports made via the Kernel tra=
cing events&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://git.infradead.org/users/mchehab=
/rasdaemon.git" rel=3D"noreferrer" target=3D"_blank">http://git.infradead.o=
rg/users/mchehab/rasdaemon.git</a>&quot;<br>
&gt; +LICENSE =3D &quot;GPLv2&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd3070efe0afa3dc41608=
bd82c00bb0dc&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.infradead.org/users/mc=
hehab/rasdaemon.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">g=
it.infradead.org/users/mchehab/rasdaemon.git;branch=3Dmaster</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://rasdaemon.service \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://init&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;25533c0c55426eeb2ad25dcbdb2b5e4ba4e83d80&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${BPN} =3D &quot;perl perl-module-file-basename perl-module=
-file-find perl-module-file-spec perl-module-getopt-long \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0perl-module-posix perl-module-file-glob l=
ibdbi-perl libdbd-sqlite-perl&quot;<br>
&gt; +<br>
<br>
depending on libdbd-sqlite-perl will make meta-oe depend on meta-perl, so =
far<br>
we have avoided this dependency, is there a way to make this configurable =
?<br>
<br>
&gt; +inherit autotools pkgconfig update-rc.d systemd<br>
&gt; +<br>
&gt; +PACKAGECONFIG ??=3D &quot;sqlite3 mce aer extlog devlink diskerror&q=
uot;<br>
&gt; +PACKAGECONFIG[sqlite3] =3D &quot;--enable-sqlite3,--disable-sqlite3,=
sqlite3&quot;<br>
&gt; +PACKAGECONFIG[mce] =3D &quot;--enable-mce,--disable-mce&quot;<br>
&gt; +PACKAGECONFIG[aer] =3D &quot;--enable-aer,--disable-aer&quot;<br>
&gt; +PACKAGECONFIG[extlog] =3D &quot;--enable-extlog,--disable-extlog&quo=
t;<br>
&gt; +PACKAGECONFIG[devlink] =3D &quot;--enable-devlink,--disable-devlink&=
quot;<br>
&gt; +PACKAGECONFIG[diskerror] =3D &quot;--enable-diskerror,--disable-disk=
error&quot;<br>
&gt; +PACKAGECONFIG[arm] =3D &quot;--enable-arm,--disable-arm&quot;<br>
&gt; +PACKAGECONFIG[hisi-ns-decode] =3D &quot;--enable-hisi-ns-decode,--di=
sable-hisi-ns-decode&quot;<br>
&gt; +PACKAGECONFIG[non-standard] =3D &quot;--enable-non-standard,--disabl=
e-non-standard&quot;<br>
&gt; +PACKAGECONFIG[abrt-report] =3D &quot;--enable-abrt-report,--disable-=
abrt-report&quot;<br>
&gt; +<br>
&gt; +do_configure_prepend () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${S}; autoreconf -vfi )<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install_append() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/init.d<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${WORKDIR}/init ${D}${sysc=
onfdir}/init.d/rasdaemon<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_unitdir}/system<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/rasdaemon.serv=
ice ${D}${systemd_unitdir}/system<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES_${PN} +=3D &quot;${sbindir}/rasdaemon \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}=
/init.d \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_uni=
tdir}/system/rasdaemon.service&quot;<br>
&gt; +<br>
&gt; +SYSTEMD_SERVICE_${PN} =3D &quot;rasdaemon.service&quot;<br>
&gt; +SYSTEMD_AUTO_ENABLE =3D &quot;enable&quot;<br>
&gt; +<br>
&gt; +INITSCRIPT_PACKAGES =3D &quot;${PN}&quot;<br>
&gt; +INITSCRIPT_NAME_${PN} =3D &quot;rasdaemon&quot;<br>
&gt; +INITSCRIPT_PARAMS_${PN} =3D &quot;defaults 89&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--0000000000006df00405a6b59a21--
