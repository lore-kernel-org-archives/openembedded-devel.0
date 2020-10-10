Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.603.1602272680863366800
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 12:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W4sxzPFN;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id x7so4614523eje.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 12:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NTlLj5Z3JdjIKnZwdB1/hZ7wHwy9C70HJc3qrG/Z1/Y=;
        b=W4sxzPFNBlQi6W+p8VGlKLis4sjjj/oA/CyECuyxJ0q2FjPLozaplDiwHuduF0iVr5
         M2gCBN1aWUCwJ/q2a279WzkIZ/1F+poyXEres+DgJ6DwQ5X5Vuc0kZWoEwgRO7sx+wUD
         5HqEO/Nt/kSfC8boFdVkixsZEc12P5dzQA0X7sq3Bn0mE7Q7r1FsoQoQaFTItrBX7g8e
         Hc+stwPX1byixkTa58ohcQdA029KQdgHEud65zaT4as/mL7JBdbBgrFGjpVCVNXPXtHA
         lgyry2uB9IyXQ0rIwH7pxCl1T8IB4mNUX28P765mzPWNITr0lKIiSHbU3D9BWzzAVxyu
         Merw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NTlLj5Z3JdjIKnZwdB1/hZ7wHwy9C70HJc3qrG/Z1/Y=;
        b=Z65TzhiP4GOR2n+Z2qhUmyKotUgSwoofQf74rJ11bF8d4g3wXJ8g/Vh1caf8efDzVS
         xnkf8cEBXGvjItIehiA9+1VDcREV3fgtyAzH0LSecujvN+4oBNclJVra1B1CoDBZXPvy
         LHS+8E3T98vhPkZzJvZLcabFwsAZsbY1xbvTSzy+Cy0QdCLVpKYPZWqhpty23SZRRay8
         HjgY3PWxV/WCx5FVtxBcMX0g46eGb/r1npWMU3BNduyBFO/rH3vEUPCv/VVuyqnDxXN+
         tZJ5DNA3tixTOCvvkfWq4YikMan7Zq7D63cckGmI94PK3TviLNPs9mvgp60OJ2U9sCXF
         5w0w==
X-Gm-Message-State: AOAM530TK5ADCuckEH1QO6TKEkrtSnYkcSNNadcktmfm4y7Afn/Gxmjl
	Y4TNShBVUe/N2akbxWvTehhQUrv/Dlif0+z0ZZc=
X-Google-Smtp-Source: ABdhPJzNsEvHLu3pBfljfhkl+O2f+o8Ho2Y73gD49bV2jm7TAVxBpRfV75Goye3QrgwXfxAHuu6YwfgJrksdXmLS+2U=
X-Received: by 2002:a17:906:4a4c:: with SMTP id a12mr15676566ejv.392.1602272679229;
 Fri, 09 Oct 2020 12:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201009183335.30362-1-geoffhp@gmail.com> <e7045f40-1691-bdeb-072d-3395ab99b862@gmail.com>
 <CA+chaQePMrj4aaATU_rQypC1epfc1XC7HKb4M-+7fn_N5BQVKQ@mail.gmail.com> <BY5PR11MB4307A8928D1C4C5C1F1930A9E7080@BY5PR11MB4307.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4307A8928D1C4C5C1F1930A9E7080@BY5PR11MB4307.namprd11.prod.outlook.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 9 Oct 2020 19:44:28 -0700
Message-ID: <CA+chaQfA5W4m2ogXC45RVfX7HuPsO34Ou6euhsd-THXd1MtNFQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] multipath-tools: replace perl with sed in libdmmp/Makefile for pseudo
To: Geoff Parker <Geoffrey.Parker@arthrex.com>
Cc: Khem Raj <raj.khem@gmail.com>, Geoff Parker <geoffhp@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e0ff8805b1422d1a"

--000000000000e0ff8805b1422d1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you try to add

inherit perlnative to test different perl? If it doesn't fail then enablin=
g
pseudo debug and comparing with perlnative and perl from Deb 10 might show
what's the difference.

export PSEUDO_DEBUG=3D"nfoPcvdDyerpswikVx"

in multiplath-tools.do_install is what RP recommended to me when we were
debugging a similar case.

On Fri, Oct 9, 2020 at 12:37 PM Geoff Parker <Geoffrey.Parker@arthrex.com>
wrote:

> Hi Martin and Khem,
>
> If I run bitbake -e, I see that perl is added to HOSTTOOLS by
> meta/conf/bitbake.conf:485. So I'm using a standard configuration.
>
> Since the pseudo changes a few days ago, it=E2=80=99s been broken on our
> production Debian 10 build systems, my dev Deb 10 system, and I think wi=
th
> a few developers who build with Ubuntu 20.04.
>
> This is the do_install error I get:
>
>  perl -i -pe 's|__VERSION__|0.2.0|g' \
>
> |
>       /home/geoff/yocto/poky/build-nanoscope/tmp/work/cortexa9t2hf-neon-=
oe-linux-gnueabi/multipath-tools/0.8.4-r0/image//lib/pkgconfig/libdmmp.pc
>
> | abort()ing pseudi client by server request. See
> https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this=
.
>
> | make[1]: *** [Makefile:35: install] Aborted
>
> Looking at the pseudo/pseudo.log of the multipath-tools workspace,
> path mismatch [1 link]: ino 4238971 db 'NAMELESS FILE' req
> '/home/geoff/yocto/poky/build-nanoscope/tmp/work/cortexa9t2hf-neon-oe-li=
nux-gnueabi/multipath-tools/0.8.4-r0/image/lib/pkgconfig/XX6mDoYB'.
>
> looking at the image/lib/pkgconfig/ dir, I see the original libdmmp.pc
> file and the XX6mD0YB file that perl created. I assume that it was in th=
e
> process of overwriting  libdmmpm.pc with  XX6mDOYB.
>
>
> From: Martin Jansa <martin.jansa@gmail.com>
> Sent: Friday, October 9, 2020 12:01 PM
> To: Khem Raj <raj.khem@gmail.com>
> Cc: Geoff Parker <geoffhp@gmail.com>; openembedded-devel <
> openembedded-devel@lists.openembedded.org>; Geoff Parker
> <Geoffrey.Parker@Arthrex.com>
> Subject: Re: [oe] [PATCH] multipath-tools: replace perl with sed in
> libdmmp/Makefile for pseudo
>
> Is the issue reproducible when you use perl from perlnative?
>
> I've built multipath-tools at least couple times on ubuntu 18.04 and 20.=
04
> since the pseudo changes were merged and it doesn't abort() for me, so I
> guess it's something special your host perl is doing and it would be use=
ful
> to find out what.
>
> On Fri, Oct 9, 2020 at 8:48 PM Khem Raj <raj.khem@gmail.com> wrote:
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
> > db. Changes to pseduo cause a build abort rather than allow possible b=
ad
> > ownership or permissions settings on the files. 'sed -i' is compatible
> > with pseudo.
> >
>
> while I think this patch is ok, I am not sure about the reasoning, when
> perl is running under pseudo contect perl -i -pe should be generating
> all sys calls under pseudo context, so how does this gets missed. is it
> something peculiar to perl ? I ask this because perl is commonly used to
> do sed like operations so do we have this issue in all those packages to=
o ?
>
> > see https://wiki.yoctoproject.org/wiki/Pseudo_Abort
> >
> > Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> > ---
> >   ...-replace-perl-with-sed-in-install-ta.patch | 40 +++++++++++++++++=
++
> >   .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
> >   2 files changed, 41 insertions(+)
> >   create mode 100644
> meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-repl=
ace-perl-with-sed-in-install-ta.patch
> >
> > diff --git
> a/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-re=
place-perl-with-sed-in-install-ta.patch
> b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-re=
place-perl-with-sed-in-install-ta.patch
> > new file mode 100644
> > index 000000000..b35d67cf5
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/multipath-tools/files/0032-libdmmp-Makefile-re=
place-perl-with-sed-in-install-ta.patch
> > @@ -0,0 +1,40 @@
> > +From 35421d03898ac1b38f97a76241e6a29086d0c9f1 Mon Sep 17 00:00:00 200=
1
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
> > +db. Changes to pseduo cause a build abort rather than allow possible =
bad
> > +ownership or permissions settings on the files. 'sed -i' is compatibl=
e
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
> > @@ -43,6 +43,7 @@ SRC_URI =3D "git://
> git.opensvc.com/multipath-tools/.git;protocol=3Dhttp \
> >
> file://0029-multipath-tools-modify-Makefile.inc-for-cross-compil.patch \
> >              file://0030-Always-use-devmapper.patch \
> >              file://0031-Always-use-devmapper-for-kpartx.patch \
> > +
>  file://0032-libdmmp-Makefile-replace-perl-with-sed-in-install-ta.patch =
\
> >              file://0001-fix-bug-of-do_compile-and-do_install.patch \
> >              file://0001-add-explicit-dependency-on-libraries.patch \
> >              file://0001-fix-boolean-value-with-json-c-0.14.patch \
> >
> >
> >
> >
> >
>
>=20

--000000000000e0ff8805b1422d1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you try to add<div><br></div><div>inherit perlnative t=
o test different=C2=A0perl? If it doesn&#39;t fail then enabling pseudo deb=
ug and comparing with perlnative and perl from Deb 10 might show what&#39;s=
 the difference.</div><div><br></div><div>export PSEUDO_DEBUG=3D&quot;nfoPc=
vdDyerpswikVx&quot;<br></div><div><br></div><div>in multiplath-tools.do_ins=
tall is what RP recommended to me when we were debugging a similar case.</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Oct 9, 2020 at 12:37 PM Geoff Parker &lt;<a href=3D"mailto:Geoff=
rey.Parker@arthrex.com">Geoffrey.Parker@arthrex.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Martin and Khem,<br>
<br>
If I run bitbake -e, I see that perl is added to HOSTTOOLS by meta/conf/bi=
tbake.conf:485. So I&#39;m using a standard configuration.<br>
<br>
Since the pseudo changes a few days ago, it=E2=80=99s been broken on our p=
roduction Debian 10 build systems, my dev Deb 10 system, and I think with a=
 few developers who build with Ubuntu 20.04.<br>
<br>
This is the do_install error I get:<br>
<br>
=C2=A0perl -i -pe &#39;s|__VERSION__|0.2.0|g&#39; \<br>
<br>
| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/home/geoff/yocto/poky/build-nanosco=
pe/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/multipath-tools/0.8.4-r0/ima=
ge//lib/pkgconfig/libdmmp.pc<br>
<br>
| abort()ing pseudi client by server request. See <a href=3D"https://wiki.=
yoctoproject.org/wiki/Pseudo_Abort" rel=3D"noreferrer" target=3D"_blank">ht=
tps://wiki.yoctoproject.org/wiki/Pseudo_Abort</a> for more details on this.=
<br>
<br>
| make[1]: *** [Makefile:35: install] Aborted<br>
<br>
Looking at the pseudo/pseudo.log of the multipath-tools workspace,=C2=A0<b=
r>
path mismatch [1 link]: ino 4238971 db &#39;NAMELESS FILE&#39; req &#39;/h=
ome/geoff/yocto/poky/build-nanoscope/tmp/work/cortexa9t2hf-neon-oe-linux-gn=
ueabi/multipath-tools/0.8.4-r0/image/lib/pkgconfig/XX6mDoYB&#39;.<br>
<br>
looking at the image/lib/pkgconfig/ dir, I see the original libdmmp.pc fil=
e and the XX6mD0YB file that perl created. I assume that it was in the proc=
ess of overwriting=C2=A0 libdmmpm.pc with=C2=A0 XX6mDOYB.<br>
<br>
=C2=A0<br>
From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D=
"_blank">martin.jansa@gmail.com</a>&gt; <br>
Sent: Friday, October 9, 2020 12:01 PM<br>
To: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">r=
aj.khem@gmail.com</a>&gt;<br>
Cc: Geoff Parker &lt;<a href=3D"mailto:geoffhp@gmail.com" target=3D"_blank=
">geoffhp@gmail.com</a>&gt;; openembedded-devel &lt;<a href=3D"mailto:opene=
mbedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel@=
lists.openembedded.org</a>&gt;; Geoff Parker &lt;Geoffrey.Parker@Arthrex.co=
m&gt;<br>
Subject: Re: [oe] [PATCH] multipath-tools: replace perl with sed in libdmm=
p/Makefile for pseudo<br>
=C2=A0<br>
Is the issue reproducible when you use perl from perlnative?<br>
=C2=A0<br>
I&#39;ve built multipath-tools at least couple times on ubuntu 18.04 and 2=
0.04 since the pseudo changes were merged and it doesn&#39;t abort() for me=
, so I guess it&#39;s something special your host perl is doing and it woul=
d be useful to find out what.<br>
=C2=A0<br>
On Fri, Oct 9, 2020 at 8:48 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
<br>
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
</blockquote></div>

--000000000000e0ff8805b1422d1a--
