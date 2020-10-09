Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.1836.1602270097393623507
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 12:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RdeyQfAx;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id lw21so14595480ejb.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VbP+PKYx5n8rY+kSKqUYFwgkllmyf0vkWPXULHNYADw=;
        b=RdeyQfAxNGqQbVunDg+CsDN7dvfK45KWjuEqR6BIUsb/d5LJ5ZdkdWKJs4jQHfI/5Q
         XIi5OP1LIXY2KvwuX4O3CXYqPkPT5FXrkuWBBy9MEkjYjkZEZ4TaRdplMkxApK5Oqi7J
         ZipRadk8HZi4eZONsmxIn7H6YXfLvslC7uHhspDiZbsIskxDrgRTCNgbgrYgHanf+bTW
         OtEqGRngli91tEvhvB+JFDWbP+0ICDIDpBVE+D177hX3gB2+G4+w63SRG9d7CqlhxYK+
         AvBc5V70ZjlXalS7V9QfQTBHSpIrzufkOGztwE+AZDNEhGIQO51ienDqbQXmBOkA9sEN
         sBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VbP+PKYx5n8rY+kSKqUYFwgkllmyf0vkWPXULHNYADw=;
        b=jY3FsVpsoWUAK3S0lk3UBbuXpX6mAq7+lG9BvaymZOx3fSXnRd/TV6HGC2cxQSopB0
         +berVJnjpwKZKWPzFxCUMIBO3rYBDDUg36cvyJ4A501j3ikbvUngfbpK7qPMnlGu9VIZ
         l2RlPYDx7PNLBw4VOGfRVk6ua3sKc7i0Qx0QVxWkpmrpX46jozjylnxtF7Qltaj21Ruy
         769aR3IAWRUKPQEuwk2SGKPa49Ic4eewPSRxqZ1odhqsl6Yovu8jQ1t+QGGfRkDtDGxH
         fZJMqY0qWIFgGGqrQrPXVYSpSI7FkD4zIjT8sF4ZK9p2ozrUsTYu3R9tfPXBPN1QZozy
         1PAg==
X-Gm-Message-State: AOAM532VDf6kPCMpkGopxLg10Xu8lTrZwIPJ0Q7YkXVtwBn4HceWJUck
	MJB8x/Yi38ZSBbYflqtR83ADZ/JhoJyMJ/8CA3E=
X-Google-Smtp-Source: ABdhPJz+D9SsJFzUTLOmHm2rs6Jwsa+9nHGBy6ROOBOsSug6NGclWl5PEy0DwzPTwYUmVJ66BpV9U29ISo/LnfB7h0I=
X-Received: by 2002:a17:906:b285:: with SMTP id q5mr16075050ejz.470.1602270095754;
 Fri, 09 Oct 2020 12:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201009183335.30362-1-geoffhp@gmail.com> <e7045f40-1691-bdeb-072d-3395ab99b862@gmail.com>
In-Reply-To: <e7045f40-1691-bdeb-072d-3395ab99b862@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 9 Oct 2020 21:01:24 +0200
Message-ID: <CA+chaQePMrj4aaATU_rQypC1epfc1XC7HKb4M-+7fn_N5BQVKQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] multipath-tools: replace perl with sed in libdmmp/Makefile for pseudo
To: Khem Raj <raj.khem@gmail.com>
Cc: Geoff Parker <geoffhp@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Geoff Parker <geoffrey.parker@arthrex.com>
Content-Type: multipart/alternative; boundary="000000000000e4490805b141939d"

--000000000000e4490805b141939d
Content-Type: text/plain; charset="UTF-8"

Is the issue reproducible when you use perl from perlnative?

I've built multipath-tools at least couple times on ubuntu 18.04 and 20.04
since the pseudo changes were merged and it doesn't abort() for me, so I
guess it's something special your host perl is doing and it would be useful
to find out what.

On Fri, Oct 9, 2020 at 8:48 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 10/9/20 11:33 AM, Geoff Parker wrote:
> > From: Geoff Parker <geoffrey.parker@arthrex.com>
> >
> > The multipath-tools libdmmp/Makefile install target uses 'perl -i'
> instead
> > of 'sed -i' for string substitutions. The perl method creates a
> temporary file
> > and overwrites the original which changes the inodes and corrupts the
> pseudo
> > db. Changes to pseduo cause a build abort rather than allow possible bad
> > ownership or permissions settings on the files. 'sed -i' is compatible
> > with pseudo.
> >
>
> while I think this patch is ok, I am not sure about the reasoning, when
> perl is running under pseudo contect perl -i -pe should be generating
> all sys calls under pseudo context, so how does this gets missed. is it
> something peculiar to perl ? I ask this because perl is commonly used to
> do sed like operations so do we have this issue in all those packages too ?
>
> > see https://wiki.yoctoproject.org/wiki/Pseudo_Abort
> >
> > Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> > ---
> >   ...-replace-perl-with-sed-in-install-ta.patch | 40 +++++++++++++++++++
> >   .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
> >   2 files changed, 41 insertions(+)
> >   create mode 100644
> meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
> >
> > diff --git
> a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
> b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
> > new file mode 100644
> > index 000000000..b35d67cf5
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch
> > @@ -0,0 +1,40 @@
> > +From 35421d03898ac1b38f97a76241e6a29086d0c9f1 Mon Sep 17 00:00:00 2001
> > +From: Geoff Parker <geoffrey.parker@arthrex.com>
> > +Date: Fri, 9 Oct 2020 17:48:47 +0000
> > +Subject: [PATCH] libdmmp/Makefile: replace perl with sed in install
> target to
> > + work with pseudo
> > +
> > +The multipath-tools libdmmp/Makefile install target uses 'perl -i'
> instead
> > +of 'sed -i' for string substitutions. The perl method creates a
> temporary file
> > +and overwrites the original which changes the inodes and corrupts the
> pseudo
> > +db. Changes to pseduo cause a build abort rather than allow possible bad
> > +ownership or permissions settings on the files. 'sed -i' is compatible
> > +with pseudo.
> > +
> > +Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> > +---
> > + libdmmp/Makefile | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/libdmmp/Makefile b/libdmmp/Makefile
> > +index 1dd3f340..8166075c 100644
> > +--- a/libdmmp/Makefile
> > ++++ b/libdmmp/Makefile
> > +@@ -34,11 +34,11 @@ install:
> > +     $(LN) $(LIBS) $(DESTDIR)$(usrlibdir)/$(DEVLIB)
> > +     $(INSTALL_PROGRAM) -m 644 -D \
> > +             $(PKGFILE).in $(DESTDIR)$(pkgconfdir)/$(PKGFILE)
> > +-    perl -i -pe 's|__VERSION__|$(LIBDMMP_VERSION)|g' \
> > ++    sed -i 's|__VERSION__|$(LIBDMMP_VERSION)|g' \
> > +             $(DESTDIR)$(pkgconfdir)/$(PKGFILE)
> > +-    perl -i -pe 's|__LIBDIR__|$(usrlibdir)|g' \
> > ++    sed -i 's|__LIBDIR__|$(usrlibdir)|g' \
> > +             $(DESTDIR)$(pkgconfdir)/$(PKGFILE)
> > +-    perl -i -pe 's|__INCLUDEDIR__|$(includedir)|g' \
> > ++    sed -i 's|__INCLUDEDIR__|$(includedir)|g' \
> > +             $(DESTDIR)$(pkgconfdir)/$(PKGFILE)
> > +     @for file in docs/man/*.3.gz; do \
> > +             $(INSTALL_PROGRAM) -m 644 -D \
> > +--
> > +2.20.1
> > +
> > diff --git a/meta-oe/recipes-support/multipath-tools/
> multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/
> multipath-tools_0.8.4.bb
> > index 48a348d80..331c0cd01 100644
> > --- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
> > +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
> > @@ -43,6 +43,7 @@ SRC_URI = "git://
> git.opensvc.com/multipath-tools/.git;protocol=http \
> >
> file://0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
> >              file://0030-Always-use-devmapper.patch \
> >              file://0031-Always-use-devmapper-for-kpartx.patch \
> > +
>  file://0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch \
> >              file://0001-fix-bug-of-do_compile-and-do_install.patch \
> >              file://0001-add-explicit-dependency-on-libraries.patch \
> >              file://0001-fix-boolean-value-with-json-c-0.14.patch \
> >
> >
> >
> >
> >
>
> 
>
>

--000000000000e4490805b141939d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is the issue reproducible when you use perl from perlnativ=
e?<div><br></div><div>I&#39;ve built multipath-tools at least couple times =
on ubuntu 18.04 and 20.04 since the pseudo changes were merged and it doesn=
&#39;t abort() for me, so I guess it&#39;s something special your host perl=
 is doing and it would be useful to find out what.</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 9, 2020=
 at 8:48 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
<br>
On 10/9/20 11:33 AM, Geoff Parker wrote:<br>
&gt; From: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@arthrex.com"=
 target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
&gt; <br>
&gt; The multipath-tools libdmmp/Makefile install target uses &#39;perl -i=
&#39; instead<br>
&gt; of &#39;sed -i&#39; for string substitutions. The perl method creates=
 a temporary file<br>
&gt; and overwrites the original which changes the inodes and corrupts the=
 pseudo<br>
&gt; db. Changes to pseduo cause a build abort rather than allow possible =
bad<br>
&gt; ownership or permissions settings on the files. &#39;sed -i&#39; is c=
ompatible<br>
&gt; with pseudo.<br>
&gt; <br>
<br>
while I think this patch is ok, I am not sure about the reasoning, when <b=
r>
perl is running under pseudo contect perl -i -pe should be generating <br>
all sys calls under pseudo context, so how does this gets missed. is it <b=
r>
something peculiar to perl ? I ask this because perl is commonly used to <=
br>
do sed like operations so do we have this issue in all those packages too =
?<br>
<br>
&gt; see <a href=3D"https://wiki.yoctoproject.org/wiki/Pseudo_Abort" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Pseud=
o_Abort</a><br>
&gt; <br>
&gt; Signed-off-by: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@art=
hrex.com" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...-replace-perl-with-sed-in-install-ta.patch | 40 ++++++=
+++++++++++++<br>
&gt;=C2=A0 =C2=A0.../multipath-tools/<a href=3D"http://multipath-tools_0.8=
.4.bb" rel=3D"noreferrer" target=3D"_blank">multipath-tools_0.8.4.bb</a>=C2=
=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A02 files changed, 41 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-support/multipath-tool=
s/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-support/multipath-tools/files/0032-libdm=
mp-Makefile-replace-perl-with-sed-in-install-ta.patch b/meta-oe/recipes-sup=
port/multipath-tools/files/0032-libdmmp-Makefile-replace-perl-with-sed-in-i=
nstall-ta.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..b35d67cf5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Make=
file-replace-perl-with-sed-in-install-ta.patch<br>
&gt; @@ -0,0 +1,40 @@<br>
&gt; +From 35421d03898ac1b38f97a76241e6a29086d0c9f1 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@arthrex.com=
" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
&gt; +Date: Fri, 9 Oct 2020 17:48:47 +0000<br>
&gt; +Subject: [PATCH] libdmmp/Makefile: replace perl with sed in install =
target to<br>
&gt; + work with pseudo<br>
&gt; +<br>
&gt; +The multipath-tools libdmmp/Makefile install target uses &#39;perl -=
i&#39; instead<br>
&gt; +of &#39;sed -i&#39; for string substitutions. The perl method create=
s a temporary file<br>
&gt; +and overwrites the original which changes the inodes and corrupts th=
e pseudo<br>
&gt; +db. Changes to pseduo cause a build abort rather than allow possible=
 bad<br>
&gt; +ownership or permissions settings on the files. &#39;sed -i&#39; is =
compatible<br>
&gt; +with pseudo.<br>
&gt; +<br>
&gt; +Signed-off-by: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@ar=
threx.com" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
&gt; +---<br>
&gt; + libdmmp/Makefile | 6 +++---<br>
&gt; + 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libdmmp/Makefile b/libdmmp/Makefile<br>
&gt; +index 1dd3f340..8166075c 100644<br>
&gt; +--- a/libdmmp/Makefile<br>
&gt; ++++ b/libdmmp/Makefile<br>
&gt; +@@ -34,11 +34,11 @@ install:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(LN) $(LIBS) $(DESTDIR)$(usrlibdir)/$(DEVLIB)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL_PROGRAM) -m 644 -D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PKGFILE).in $(DEST=
DIR)$(pkgconfdir)/$(PKGFILE)<br>
&gt; +-=C2=A0 =C2=A0 perl -i -pe &#39;s|__VERSION__|$(LIBDMMP_VERSION)|g&#=
39; \<br>
&gt; ++=C2=A0 =C2=A0 sed -i &#39;s|__VERSION__|$(LIBDMMP_VERSION)|g&#39; \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)$(pkgconfd=
ir)/$(PKGFILE)<br>
&gt; +-=C2=A0 =C2=A0 perl -i -pe &#39;s|__LIBDIR__|$(usrlibdir)|g&#39; \<b=
r>
&gt; ++=C2=A0 =C2=A0 sed -i &#39;s|__LIBDIR__|$(usrlibdir)|g&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)$(pkgconfd=
ir)/$(PKGFILE)<br>
&gt; +-=C2=A0 =C2=A0 perl -i -pe &#39;s|__INCLUDEDIR__|$(includedir)|g&#39=
; \<br>
&gt; ++=C2=A0 =C2=A0 sed -i &#39;s|__INCLUDEDIR__|$(includedir)|g&#39; \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)$(pkgconfd=
ir)/$(PKGFILE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@for file in docs/man/*.3.gz; do \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_PROGRAM) -=
m 644 -D \<br>
&gt; +--<br>
&gt; +2.20.1<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/multipath-tools/<a href=3D"http:=
//multipath-tools_0.8.4.bb" rel=3D"noreferrer" target=3D"_blank">multipath-=
tools_0.8.4.bb</a> b/meta-oe/recipes-support/multipath-tools/<a href=3D"htt=
p://multipath-tools_0.8.4.bb" rel=3D"noreferrer" target=3D"_blank">multipat=
h-tools_0.8.4.bb</a><br>
&gt; index 48a348d80..331c0cd01 100644<br>
&gt; --- a/meta-oe/recipes-support/multipath-tools/<a href=3D"http://multi=
path-tools_0.8.4.bb" rel=3D"noreferrer" target=3D"_blank">multipath-tools_0=
.8.4.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/multipath-tools/<a href=3D"http://multi=
path-tools_0.8.4.bb" rel=3D"noreferrer" target=3D"_blank">multipath-tools_0=
.8.4.bb</a><br>
&gt; @@ -43,6 +43,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.opens=
vc.com/multipath-tools/.git;protocol=3Dhttp" rel=3D"noreferrer" target=3D"_=
blank">git.opensvc.com/multipath-tools/.git;protocol=3Dhttp</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0029-multipath=
-tools-modify-Makefile.inc-for-cross-compil.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0030-Always-us=
e-devmapper.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0031-Always-us=
e-devmapper-for-kpartx.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0032-libdmmp-Makefil=
e-replace-perl-with-sed-in-install-ta.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-bug-o=
f-do_compile-and-do_install.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-add-expli=
cit-dependency-on-libraries.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-boole=
an-value-with-json-c-0.14.patch \<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e4490805b141939d--
