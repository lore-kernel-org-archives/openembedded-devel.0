Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.4296.1590606593999685397
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 12:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=piuT+F1y;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id x12so20135050qts.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2020 12:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mx53JEThwQMchjkgZXxWy7OYZmxLi03Nf0Y4YcNr+qA=;
        b=piuT+F1yHmzoYhgtvIoRhr4agq6JCcChlG+NUZbllsm9seq2fi8tv8LPwpAgav8qYA
         nyobXuSsqG5c4NoIZ9lJtNnSp506Wr2cayAIDbsNGrOvySBvALhNPRNt2KI50fgkf0Jn
         mcIDDlH4W3xMPsze38GP1bnR6GQjMjR+PAXQ/hTzMaA44VMwNmaDBZAuUG8t87GNFCfb
         UMjqtJdtKeBKzo0+jBaMBSg5Ltv8PsRZoj/ansv8KmG+uuo2Xxo2zyW3vHL9r1dMxw/e
         tMIthXud32r5oB2qjNjrrIbCnNWz7KeUNbE4f+UzlRKMy7OTVOSE1SJzBWYjUvB7/Rz/
         pMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mx53JEThwQMchjkgZXxWy7OYZmxLi03Nf0Y4YcNr+qA=;
        b=m/ZnS0pIu759b3VVEJuUyIxbSIIbvQjLp2vFjw6Cze4BZtXV3v0azZafOcdLZuuXHx
         PRG1yf88v132rEc18KyQ8p9LJI6olL3zMIeKJTJThjh0w8dAo5G7sZM2QfyZz+nGQsyc
         ZVPBmCx0tJ5LhPWhK8OduhReYSHPoDoct4+PMy10DMd9Ndmf3CqC+zKRNcd3et+W6fgb
         RjIzwPCQGnZ3Dv+OhVb5OV2xpM56u/dXcyLU4FzIc6t+rRxLBewoiT0uw7+0uZLgsMcY
         tY9TNATSCaOLt27wS8lAacpgAffhgI+graAy1hJ5Irufcxxkq75isl98JjFW6kZ18+71
         zemw==
X-Gm-Message-State: AOAM532uguuQK+KLr1FqKsjy/nYUyoUyTI1FB7bOks6uuis5FyhNkDAh
	in2/+PUofZjuzqUY8+fNobCjNxKWR1D7ehgN9TiOFg03
X-Google-Smtp-Source: ABdhPJxBDDzg6lwm2by6Y8eS36unaq89DX2riQqAF74GCvDMrsihMlRolQFi0SdKhi7BLygnltWmPST59E5xqE8E2/w=
X-Received: by 2002:aed:3b62:: with SMTP id q31mr5979308qte.293.1590606592822;
 Wed, 27 May 2020 12:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2005251518590.6822@localhost.localdomain>
 <CAMKF1sq2UQaxxdjZYMQh-jXmG5L-kre=xLv3SuaAEOZfFzu+_w@mail.gmail.com> <alpine.LFD.2.21.2005270613300.5432@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2005270613300.5432@localhost.localdomain>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 27 May 2020 12:09:41 -0700
Message-ID: <CAMKF1sr85R8xasLrgaSfO_in12cKPFSqD+xEKZirSeHh1hugmA@mail.gmail.com>
Subject: Re: [oe] [PATCH] use weak assignments for PNBLACKLIST in recipe files
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f17b6205a6a5f4a1"

--000000000000f17b6205a6a5f4a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 3:14 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Tue, 26 May 2020, Khem Raj wrote:
>
> > On Mon, May 25, 2020 at 12:21 PM Robert P. J. Day <rpjday@crashcourse.c=
a>
> wrote:
> > >
> > > Make sure PNBLACKLIST assignments in recipe files use weak
> > > assignment, so they can be overridden in, for example, local.conf
> > > files.
> > >
> >
> > I would like contributions here when someone fixes one of the
> > blacklisted recipes. This patch will let downstream users host it in
> > bbappends or other places what is the intended use of this patch?
>
>   i'm not sure what you're asking for here ... there is no claim that
> any of these recipes have been fixed in any way, only that weak
> assignment seems to be the default for blacklisting to at least allow
> for the possibility of overriding.
>

Ok I think that=E2=80=99s fine I wanted to understand the reason since weak
assignment do have some unintended  results but if it is to make it uniform
I
Think that=E2=80=99s fair

>
> > >
> > > diff --git a/meta-networking/recipes-netkit/netkit-rusers/
> netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/
> netkit-rusers_0.17.bb
> > > index c39faef8d..eee96d865 100644
> > > --- a/meta-networking/recipes-netkit/netkit-rusers/
> netkit-rusers_0.17.bb
> > > +++ b/meta-networking/recipes-netkit/netkit-rusers/
> netkit-rusers_0.17.bb
> > > @@ -69,4 +69,4 @@ RDEPENDS_${PN}-server +=3D "tcp-wrappers xinetd
> rpcbind"
> > >
> > >  # http://errors.yoctoproject.org/Errors/Details/186962/
> > >  COMPATIBLE_HOST_libc-musl =3D 'null'
> > > -PNBLACKLIST[netkit-rusers] =3D "Fails to build rup.c:51:10: fatal
> error: rstat.h: No such file or directory"
> > > +PNBLACKLIST[netkit-rusers] ?=3D "Fails to build rup.c:51:10: fatal
> error: rstat.h: No such file or directory"
> > > diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
> b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
> > > index 23fe2021b..c296c3bc1 100644
> > > --- a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
> > > +++ b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
> > > @@ -22,4 +22,4 @@ do_install () {
> > >      oe_runmake install DESTDIR=3D"${D}"
> > >  }
> > >
> > > -PNBLACKLIST[drbd] =3D "Kernel module Needs forward porting to kernel
> 5.2+"
> > > +PNBLACKLIST[drbd] ?=3D "Kernel module Needs forward porting to kerne=
l
> 5.2+"
> > > diff --git a/meta-networking/recipes-support/lowpan-tools/
> lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/
> lowpan-tools_git.bb
> > > index 5917cfb3e..4a1bbe620 100644
> > > --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.b=
b
> > > +++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.b=
b
> > > @@ -36,4 +36,4 @@ FILES_${PN}-dbg +=3D
> "${libexecdir}/lowpan-tools/.debug/"
> > >  PACKAGES =3D+ "${PN}-python"
> > >  FILES_${PN}-python =3D "${libdir}/python*"
> > >
> > > -PNBLACKLIST[lowpan-tools] =3D "WARNING these tools are deprecated! U=
se
> wpan-tools instead"
> > > +PNBLACKLIST[lowpan-tools] ?=3D "WARNING these tools are deprecated! =
Use
> wpan-tools instead"
> > > diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
> b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
> > > index 21d110aee..2e3da7d4d 100644
> > > --- a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
> > > +++ b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
> > > @@ -27,4 +27,4 @@ RDEPENDS_${PN} +=3D "\
> > >
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > >
> > > -PNBLACKLIST[nanopb] =3D "Needs forward porting to use python3"
> > > +PNBLACKLIST[nanopb] ?=3D "Needs forward porting to use python3"
> > > diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> > > index e40e1cd26..eca8dfc7b 100644
> > > --- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> > > +++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
> > > @@ -11,4 +11,4 @@ inherit module
> > >
> > >  EXTRA_OEMAKE +=3D "KERNELDIR=3D${STAGING_KERNEL_DIR}"
> > >
> > > -PNBLACKLIST[can-isotp] =3D "Kernel module Needs forward porting to
> kernel 5.2+"
> > > +PNBLACKLIST[can-isotp] ?=3D "Kernel module Needs forward porting to
> kernel 5.2+"
> > > diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> > > index 6683eccf2..1758430bc 100644
> > > --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> > > +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> > > @@ -32,4 +32,4 @@ python do_package_prepend() {
> > >  }
> > >
> > >  B =3D "${WORKDIR}/${BPN}-${PV}"
> > > -PNBLACKLIST[bpftool] =3D "Needs forward porting to kernel 5.2+"
> > > +PNBLACKLIST[bpftool] ?=3D "Needs forward porting to kernel 5.2+"
> > >
> > > --
> > >
> > >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Robert P. J. Day                                 Ottawa, Ontario,
> CANADA
> > >                          http://crashcourse.ca
> > >
> > > Twitter:
> http://twitter.com/rpjday
> > > LinkedIn:
> http://ca.linkedin.com/in/rpjday
> > >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> >
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>

--000000000000f17b6205a6a5f4a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 27, 2020 at 3:14 AM Robert P. J. Day &lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Tue, 26 May 2020, Khem Raj wrote:<b=
r>
<br>
&gt; On Mon, May 25, 2020 at 12:21 PM Robert P. J. Day &lt;<a href=3D"mailt=
o:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt; Make sure PNBLACKLIST assignments in recipe files use weak<br>
&gt; &gt; assignment, so they can be overridden in, for example, local.conf=
<br>
&gt; &gt; files.<br>
&gt; &gt;<br>
&gt;<br>
&gt; I would like contributions here when someone fixes one of the<br>
&gt; blacklisted recipes. This patch will let downstream users host it in<b=
r>
&gt; bbappends or other places what is the intended use of this patch?<br>
<br>
=C2=A0 i&#39;m not sure what you&#39;re asking for here ... there is no cla=
im that<br>
any of these recipes have been fixed in any way, only that weak<br>
assignment seems to be the default for blacklisting to at least allow<br>
for the possibility of overriding.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok I think that=
=E2=80=99s fine I wanted to understand the reason since weak assignment do =
have some unintended =C2=A0results but if it is to make it uniform I</div><=
div dir=3D"auto">Think that=E2=80=99s fair=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-networking/recipes-netkit/netkit-rusers/<a href=
=3D"http://netkit-rusers_0.17.bb" rel=3D"noreferrer" target=3D"_blank">netk=
it-rusers_0.17.bb</a> b/meta-networking/recipes-netkit/netkit-rusers/<a hre=
f=3D"http://netkit-rusers_0.17.bb" rel=3D"noreferrer" target=3D"_blank">net=
kit-rusers_0.17.bb</a><br>
&gt; &gt; index c39faef8d..eee96d865 100644<br>
&gt; &gt; --- a/meta-networking/recipes-netkit/netkit-rusers/<a href=3D"htt=
p://netkit-rusers_0.17.bb" rel=3D"noreferrer" target=3D"_blank">netkit-ruse=
rs_0.17.bb</a><br>
&gt; &gt; +++ b/meta-networking/recipes-netkit/netkit-rusers/<a href=3D"htt=
p://netkit-rusers_0.17.bb" rel=3D"noreferrer" target=3D"_blank">netkit-ruse=
rs_0.17.bb</a><br>
&gt; &gt; @@ -69,4 +69,4 @@ RDEPENDS_${PN}-server +=3D &quot;tcp-wrappers x=
inetd rpcbind&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # <a href=3D"http://errors.yoctoproject.org/Errors/Details/=
186962/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.or=
g/Errors/Details/186962/</a><br>
&gt; &gt;=C2=A0 COMPATIBLE_HOST_libc-musl =3D &#39;null&#39;<br>
&gt; &gt; -PNBLACKLIST[netkit-rusers] =3D &quot;Fails to build rup.c:51:10:=
 fatal error: rstat.h: No such file or directory&quot;<br>
&gt; &gt; +PNBLACKLIST[netkit-rusers] ?=3D &quot;Fails to build rup.c:51:10=
: fatal error: rstat.h: No such file or directory&quot;<br>
&gt; &gt; diff --git a/meta-networking/recipes-support/drbd/<a href=3D"http=
://drbd_9.0.19-1.bb" rel=3D"noreferrer" target=3D"_blank">drbd_9.0.19-1.bb<=
/a> b/meta-networking/recipes-support/drbd/<a href=3D"http://drbd_9.0.19-1.=
bb" rel=3D"noreferrer" target=3D"_blank">drbd_9.0.19-1.bb</a><br>
&gt; &gt; index 23fe2021b..c296c3bc1 100644<br>
&gt; &gt; --- a/meta-networking/recipes-support/drbd/<a href=3D"http://drbd=
_9.0.19-1.bb" rel=3D"noreferrer" target=3D"_blank">drbd_9.0.19-1.bb</a><br>
&gt; &gt; +++ b/meta-networking/recipes-support/drbd/<a href=3D"http://drbd=
_9.0.19-1.bb" rel=3D"noreferrer" target=3D"_blank">drbd_9.0.19-1.bb</a><br>
&gt; &gt; @@ -22,4 +22,4 @@ do_install () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake install DESTDIR=3D&quot;${D}&quot;=
<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -PNBLACKLIST[drbd] =3D &quot;Kernel module Needs forward porting =
to kernel 5.2+&quot;<br>
&gt; &gt; +PNBLACKLIST[drbd] ?=3D &quot;Kernel module Needs forward porting=
 to kernel 5.2+&quot;<br>
&gt; &gt; diff --git a/meta-networking/recipes-support/lowpan-tools/<a href=
=3D"http://lowpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan=
-tools_git.bb</a> b/meta-networking/recipes-support/lowpan-tools/<a href=3D=
"http://lowpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-to=
ols_git.bb</a><br>
&gt; &gt; index 5917cfb3e..4a1bbe620 100644<br>
&gt; &gt; --- a/meta-networking/recipes-support/lowpan-tools/<a href=3D"htt=
p://lowpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tools_=
git.bb</a><br>
&gt; &gt; +++ b/meta-networking/recipes-support/lowpan-tools/<a href=3D"htt=
p://lowpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tools_=
git.bb</a><br>
&gt; &gt; @@ -36,4 +36,4 @@ FILES_${PN}-dbg +=3D &quot;${libexecdir}/lowpan=
-tools/.debug/&quot;<br>
&gt; &gt;=C2=A0 PACKAGES =3D+ &quot;${PN}-python&quot;<br>
&gt; &gt;=C2=A0 FILES_${PN}-python =3D &quot;${libdir}/python*&quot;<br>
&gt; &gt;<br>
&gt; &gt; -PNBLACKLIST[lowpan-tools] =3D &quot;WARNING these tools are depr=
ecated! Use wpan-tools instead&quot;<br>
&gt; &gt; +PNBLACKLIST[lowpan-tools] ?=3D &quot;WARNING these tools are dep=
recated! Use wpan-tools instead&quot;<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/nanopb/<a href=3D"http://na=
nopb_0.4.0.bb" rel=3D"noreferrer" target=3D"_blank">nanopb_0.4.0.bb</a> b/m=
eta-oe/recipes-devtools/nanopb/<a href=3D"http://nanopb_0.4.0.bb" rel=3D"no=
referrer" target=3D"_blank">nanopb_0.4.0.bb</a><br>
&gt; &gt; index 21d110aee..2e3da7d4d 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/nanopb/<a href=3D"http://nanopb_0.=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">nanopb_0.4.0.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/nanopb/<a href=3D"http://nanopb_0.=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">nanopb_0.4.0.bb</a><br>
&gt; &gt; @@ -27,4 +27,4 @@ RDEPENDS_${PN} +=3D &quot;\<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt;<br>
&gt; &gt; -PNBLACKLIST[nanopb] =3D &quot;Needs forward porting to use pytho=
n3&quot;<br>
&gt; &gt; +PNBLACKLIST[nanopb] ?=3D &quot;Needs forward porting to use pyth=
on3&quot;<br>
&gt; &gt; diff --git a/meta-oe/recipes-extended/socketcan/<a href=3D"http:/=
/can-isotp_git.bb" rel=3D"noreferrer" target=3D"_blank">can-isotp_git.bb</a=
> b/meta-oe/recipes-extended/socketcan/<a href=3D"http://can-isotp_git.bb" =
rel=3D"noreferrer" target=3D"_blank">can-isotp_git.bb</a><br>
&gt; &gt; index e40e1cd26..eca8dfc7b 100644<br>
&gt; &gt; --- a/meta-oe/recipes-extended/socketcan/<a href=3D"http://can-is=
otp_git.bb" rel=3D"noreferrer" target=3D"_blank">can-isotp_git.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-extended/socketcan/<a href=3D"http://can-is=
otp_git.bb" rel=3D"noreferrer" target=3D"_blank">can-isotp_git.bb</a><br>
&gt; &gt; @@ -11,4 +11,4 @@ inherit module<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;KERNELDIR=3D${STAGING_KERNEL_DIR}&q=
uot;<br>
&gt; &gt;<br>
&gt; &gt; -PNBLACKLIST[can-isotp] =3D &quot;Kernel module Needs forward por=
ting to kernel 5.2+&quot;<br>
&gt; &gt; +PNBLACKLIST[can-isotp] ?=3D &quot;Kernel module Needs forward po=
rting to kernel 5.2+&quot;<br>
&gt; &gt; diff --git a/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpf=
tool.bb" rel=3D"noreferrer" target=3D"_blank">bpftool.bb</a> b/meta-oe/reci=
pes-kernel/bpftool/<a href=3D"http://bpftool.bb" rel=3D"noreferrer" target=
=3D"_blank">bpftool.bb</a><br>
&gt; &gt; index 6683eccf2..1758430bc 100644<br>
&gt; &gt; --- a/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.bb=
" rel=3D"noreferrer" target=3D"_blank">bpftool.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.bb=
" rel=3D"noreferrer" target=3D"_blank">bpftool.bb</a><br>
&gt; &gt; @@ -32,4 +32,4 @@ python do_package_prepend() {<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 B =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
&gt; &gt; -PNBLACKLIST[bpftool] =3D &quot;Needs forward porting to kernel 5=
.2+&quot;<br>
&gt; &gt; +PNBLACKLIST[bpftool] ?=3D &quot;Needs forward porting to kernel =
5.2+&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt;<br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt; &gt; Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa=
, Ontario, CANADA<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferre=
r" target=3D"_blank">http://crashcourse.ca</a><br>
&gt; &gt;<br>
&gt; &gt; Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=
=3D"_blank">http://twitter.com/rpjday</a><br>
&gt; &gt; LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca=
.linkedin.com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.lin=
kedin.com/in/rpjday</a><br>
&gt; &gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt; &gt;<br>
&gt;<br>
<br>
-- <br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<a href=3D"http://crashcourse.ca" rel=3D"noreferrer" targe=
t=3D"_blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
</blockquote></div></div>

--000000000000f17b6205a6a5f4a1--
