Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.13364.1599016776846787349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 20:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NxsmD8Kw;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id v54so2627895qtj.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 20:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=19gfrQFASLSPsTBKM0f6CCyNxgCm0Rdwh+7g7i76x+s=;
        b=NxsmD8KwYGTbMZDErziif1RowEj0zd3ITQwJq3VRU8uQ0hPrwYsBv5pEtDJcNf1PDp
         QVVVoNvWh/Y7efIZ7NFy88LMMnjIw5aR9V/tWkNk5cGYWPZPcXoJAfU3uHdOpzQWG1e9
         z6H383eB6QnPWaxo5o0+Sljww3y12IXg13xGT3qLE987zFE+W4VKoIqxQ9UdSaYg12lb
         46+8HfC9U6v5B2xj9+3kGinQBEyLNNKSyGmIGhtRd8CwscUcUlkfvnVrqxo5kDQbx3YC
         uovxpqg7Abep5PkZS87SsCRLhukBsaGUJIfoy+D5eo0wuEIYBJEqFyzaNGencywH1F9N
         OLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=19gfrQFASLSPsTBKM0f6CCyNxgCm0Rdwh+7g7i76x+s=;
        b=SBs29JtWl8cil8JoRWMym1HsPLBkWdTTsudw25S7qnCOWSrM/85odu5RojT1WJl/1Q
         9tKBNWjMai4A/+yHBxV9scMY8F9B8dhHDY1xF1jg1iUL+zvTnFO8Lm4I9In3Rtyz0m0B
         TyKLqL1+bhj+vYHOZuy40snyinxKWQHQL/ymrI1cXnyKIjjHCwWSZmCT8oc+gLlo4i8V
         myc7UOcfJUNIvAsigVQdV9wSMfoRpVFSUlmHxoh0/on625xn4BDU9uJ+36ugyeOVAhZz
         UDJ/6WgmrXLnrTo0JtIyLqEvctlB7HUqVHlhErjCIi3sH/1nu1kZUKJzJkRK3IWzsO11
         qskw==
X-Gm-Message-State: AOAM530K9FhwpCmaXtv2jCqXLq/mL51ey3aPxRcoAKtC8KY76BX8+g0S
	kdNtqJyiaMAdUhCUdDM8/OChMMUPJEaavAM8jNw=
X-Google-Smtp-Source: ABdhPJxaEXRj/ElxhpOPgznl4E+TPHOVf+I4ocy2nCrZ48ibHQQNCe4kiJwIH8OlPw6BIC85xVOIvtJakocjYvlThZY=
X-Received: by 2002:ac8:2495:: with SMTP id s21mr531100qts.194.1599016775885;
 Tue, 01 Sep 2020 20:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <162F7E2FF7270601.30808@lists.openembedded.org>
 <20200901224141.40600-1-Martin.Jansa@gmail.com> <CAMKF1soOvykbhXx=-XbsZ=3Twv5hptwyVejLV-SObYkw1=C+Tg@mail.gmail.com>
 <20200902000331.lru5uw6phplqjws6@jama>
In-Reply-To: <20200902000331.lru5uw6phplqjws6@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 1 Sep 2020 20:19:25 -0700
Message-ID: <CAMKF1soiCCFpL_PpadH2aYTV=kgDJ8x=KMnvUOhULXkFN_4cYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nss: remove signlibs.sh
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000eaa8ab05ae4c1afb"

--000000000000eaa8ab05ae4c1afb
Content-Type: text/plain; charset="UTF-8"

Correct.

On Tue, Sep 1, 2020 at 5:03 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Sep 01, 2020 at 04:16:15PM -0700, Khem Raj wrote:
>
> > On Tue, Sep 1, 2020 at 3:41 PM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
>
> > >
>
> > > Looks like my "solution" also isn't working well at least for images
> with read-only-rootfs in IMAGE_FEATURES.
>
> > >
>
> > > pkg_postinst_ontarget_${PN} is always forced to run on the target,
> which for read-only-rootfs results in:
>
> > > log.do_rootfs:
>
> > > ...
>
> > > NOTE: If an image is being built, the postinstalls for the following
> packages will be postponed for first boot: nss
>
> > > ...
>
> > > ERROR: The following packages could not be configured offline and
> rootfs is read-only: ['nss']
>
> > >
>
> > > and now looking at the /usr/bin/signlibs.sh and it does pretty much
>
> > > the same as the postinst script when D isn't empty.
>
> > >
>
> > > From oe-core git history it shows that signlibs.sh was added first:
>
> > >
> https://git.openembedded.org/openembedded-core/commit/?id=a4580f967c8064294a06d406acf5deb24aee2acc
>
> > > then the offline version of postinst was added to support
> read-only-rootfs in:
>
> > >
> https://git.openembedded.org/openembedded-core/commit/?id=64e87fc6e99bc1d4807034166735034b1f92bad8
>
> > > and nss-native should always provide the shlibsign since:
>
> > >
> https://git.openembedded.org/openembedded-core/commit/?id=88540c5b08dea069660d1a68e506aebdd68e6ae0
>
> > > and only after
>
> > >
> https://git.openembedded.org/openembedded-core/commit/?id=8f782f7095e718dd9452055af53363beb6bdbece
>
> > > it looked like signlibs.sh was something special only for target.
>
> > >
>
> > > So it looks to me, that we should just remove signlibs.sh script and
> let the same postinst be used on target and offline
>
> > > (with or without D being empty).
>
> > >
>
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> > > ---
>
> > >  meta-oe/recipes-support/nss/nss/signlibs.sh | 20 --------------------
>
> > >  meta-oe/recipes-support/nss/nss_3.56.bb     |  6 ------
>
> > >  2 files changed, 26 deletions(-)
>
> > >  delete mode 100644 meta-oe/recipes-support/nss/nss/signlibs.sh
>
> > >
>
> > > diff --git a/meta-oe/recipes-support/nss/nss/signlibs.sh
> b/meta-oe/recipes-support/nss/nss/signlibs.sh
>
> > > deleted file mode 100644
>
> > > index a74e499f8c..0000000000
>
> > > --- a/meta-oe/recipes-support/nss/nss/signlibs.sh
>
> > > +++ /dev/null
>
> > > @@ -1,20 +0,0 @@
>
> > > -#!/bin/sh
>
> > > -
>
> > > -# signlibs.sh
>
> > > -#
>
> > > -# (c)2010 Wind River Systems, Inc.
>
> > > -#
>
> > > -# regenerates the .chk files for the NSS libraries that require it
>
> > > -# since the ones that are built have incorrect checksums that were
>
> > > -# calculated on the host where they really need to be done on the
>
> > > -# target
>
> > > -
>
> >
>
> > if we remove this then how do we solve above said issue? is it still an
> issue ?
>
>
>
> I think above said issue was resolved in 2013 with:
>
>
> https://git.openembedded.org/openembedded-core/commit/?id=64e87fc6e99bc1d4807034166735034b1f92bad8
>
>
>
> since then nobody should be running signlibs.sh on target (if it was
>
> already finished in do_rootfs) and if it works offline for read-only-rootfs
>
> then it doesn't really run on the target, right?
>
>
>
> >
>
> > > -CHK_FILES=`ls /lib*/*.chk /usr/lib*/*.chk 2>/dev/null`
>
> > > -SIGN_BINARY=`which shlibsign`
>
> > > -for I in $CHK_FILES
>
> > > -do
>
> > > -       DN=`dirname $I`
>
> > > -       BN=`basename $I .chk`
>
> > > -       FN=$DN/$BN.so
>
> > > -       $SIGN_BINARY -i $FN
>
> > > -done
>
> > > diff --git a/meta-oe/recipes-support/nss/nss_3.56.bb
> b/meta-oe/recipes-support/nss/nss_3.56.bb
>
> > > index 107b0a0152..997f8950fd 100644
>
> > > --- a/meta-oe/recipes-support/nss/nss_3.56.bb
>
> > > +++ b/meta-oe/recipes-support/nss/nss_3.56.bb
>
> > > @@ -21,7 +21,6 @@ VERSION_DIR =
> "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '
>
> > >
>
> > >  SRC_URI = "
> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz
> \
>
> > >             file://nss.pc.in \
>
> > > -           file://signlibs.sh \
>
> > >             file://0001-nss-fix-support-cross-compiling.patch \
>
> > >             file://nss-no-rpath-for-cross-compiling.patch \
>
> > >             file://nss-fix-incorrect-shebang-of-perl.patch \
>
> > > @@ -214,7 +213,6 @@ do_install_append() {
>
> > >          touch ${D}/${libdir}/$file
>
> > >          chmod 755 ${D}/${libdir}/$file
>
> > >      done
>
> > > -    install -D -m 755 ${WORKDIR}/signlibs.sh
> ${D}/${bindir}/signlibs.sh
>
> > >
>
> > >      install -d ${D}${libdir}/pkgconfig/
>
> > >      sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed
> 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
>
> > > @@ -251,10 +249,6 @@ pkg_postinst_${PN} () {
>
> > >      done
>
> > >  }
>
> > >
>
> > > -pkg_postinst_ontarget_${PN} () {
>
> > > -    ${bindir}/signlibs.sh
>
> > > -}
>
> > > -
>
> > >  PACKAGES =+ "${PN}-smime"
>
> > >  FILES_${PN}-smime = "\
>
> > >      ${bindir}/smime \
>
> > > --
>
> > > 2.25.1
>
> > >
>
> > > 
>
>

--000000000000eaa8ab05ae4c1afb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Correct.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Sep 1, 2020 at 5:03 PM Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left=
-color:rgb(204,204,204)">On Tue, Sep 01, 2020 at 04:16:15PM -0700, Khem Raj=
 wrote:<br><br>&gt; On Tue, Sep 1, 2020 at 3:41 PM Martin Jansa &lt;<a href=
=
=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.co=
m</a>&gt; wrote:<br><br>&gt; &gt;<br><br>&gt; &gt; Looks like my &quot;solu=
tion&quot; also isn&#39;t working well at least for images with read-only-r=
ootfs in IMAGE_FEATURES.<br><br>&gt; &gt;<br><br>&gt; &gt; pkg_postinst_ont=
arget_${PN} is always forced to run on the target, which for read-only-root=
fs results in:<br><br>&gt; &gt; log.do_rootfs:<br><br>&gt; &gt; ...<br><br>=
&gt; &gt; NOTE: If an image is being built, the postinstalls for the follow=
ing packages will be postponed for first boot: nss<br><br>&gt; &gt; ...<br>=
<br>&gt; &gt; ERROR: The following packages could not be configured offline=
 and rootfs is read-only: [&#39;nss&#39;]<br><br>&gt; &gt;<br><br>&gt; &gt;=
 and now looking at the /usr/bin/signlibs.sh and it does pretty much<br><br=
>&gt; &gt; the same as the postinst script when D isn&#39;t empty.<br><br>&=
gt; &gt;<br><br>&gt; &gt; From oe-core git history it shows that signlibs.s=
h was added first:<br><br>&gt; &gt; <a href=3D"https://git.openembedded.org=
/openembedded-core/commit/?id=3Da4580f967c8064294a06d406acf5deb24aee2acc" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core/commit/?id=3Da4580f967c8064294a06d406acf5deb24aee2acc</a><br><br>&g=
t; &gt; then the offline version of postinst was added to support read-only=
-rootfs in:<br><br>&gt; &gt; <a href=3D"https://git.openembedded.org/openem=
bedded-core/commit/?id=3D64e87fc6e99bc1d4807034166735034b1f92bad8" rel=3D"n=
oreferrer" target=3D"_blank">https://git.openembedded.org/openembedded-core=
/commit/?id=3D64e87fc6e99bc1d4807034166735034b1f92bad8</a><br><br>&gt; &gt;=
 and nss-native should always provide the shlibsign since:<br><br>&gt; &gt;=
 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D885=
40c5b08dea069660d1a68e506aebdd68e6ae0" rel=3D"noreferrer" target=3D"_blank"=
>https://git.openembedded.org/openembedded-core/commit/?id=3D88540c5b08dea0=
69660d1a68e506aebdd68e6ae0</a><br><br>&gt; &gt; and only after<br><br>&gt; =
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D8f782f7095e718dd9452055af53363beb6bdbece" rel=3D"noreferrer" target=3D"=
_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D8f782f7=
095e718dd9452055af53363beb6bdbece</a><br><br>&gt; &gt; it looked like signl=
ibs.sh was something special only for target.<br><br>&gt; &gt;<br><br>&gt; =
&gt; So it looks to me, that we should just remove signlibs.sh script and l=
et the same postinst be used on target and offline<br><br>&gt; &gt; (with o=
r without D being empty).<br><br>&gt; &gt;<br><br>&gt; &gt; Signed-off-by: =
Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank=
">Martin.Jansa@gmail.com</a>&gt;<br><br>&gt; &gt; ---<br><br>&gt; &gt;=C2=
=A0 meta-oe/recipes-support/nss/nss/signlibs.sh | 20 --------------------<=
br><br>&gt; &gt;=C2=A0 meta-oe/recipes-support/nss/<a href=3D"http://nss_3.=
56.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.56.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 6 ------<br><br>&gt; &gt;=C2=A0 2 files changed, 26 deletion=
s(-)<br><br>&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/nss/=
nss/signlibs.sh<br><br>&gt; &gt;<br><br>&gt; &gt; diff --git a/meta-oe/reci=
pes-support/nss/nss/signlibs.sh b/meta-oe/recipes-support/nss/nss/signlibs.=
sh<br><br>&gt; &gt; deleted file mode 100644<br><br>&gt; &gt; index a74e499=
f8c..0000000000<br><br>&gt; &gt; --- a/meta-oe/recipes-support/nss/nss/sign=
libs.sh<br><br>&gt; &gt; +++ /dev/null<br><br>&gt; &gt; @@ -1,20 +0,0 @@<br=
><br>&gt; &gt; -#!/bin/sh<br><br>&gt; &gt; -<br><br>&gt; &gt; -# signlibs.s=
h<br><br>&gt; &gt; -#<br><br>&gt; &gt; -# (c)2010 Wind River Systems, Inc.<=
br><br>&gt; &gt; -#<br><br>&gt; &gt; -# regenerates the .chk files for the =
NSS libraries that require it<br><br>&gt; &gt; -# since the ones that are b=
uilt have incorrect checksums that were<br><br>&gt; &gt; -# calculated on t=
he host where they really need to be done on the<br><br>&gt; &gt; -# target=
<br><br>&gt; &gt; -<br><br>&gt; <br><br>&gt; if we remove this then how do =
we solve above said issue? is it still an issue ?<br><br><br><br>I think ab=
ove said issue was resolved in 2013 with:<br><br><a href=3D"https://git.ope=
nembedded.org/openembedded-core/commit/?id=3D64e87fc6e99bc1d480703416673503=
4b1f92bad8" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.o=
rg/openembedded-core/commit/?id=3D64e87fc6e99bc1d4807034166735034b1f92bad8<=
/a><br><br><br><br>since then nobody should be running signlibs.sh on targe=
t (if it was<br><br>already finished in do_rootfs) and if it works offline =
for read-only-rootfs<br><br>then it doesn&#39;t really run on the target, r=
ight?<br><br><br><br>&gt; <br><br>&gt; &gt; -CHK_FILES=3D`ls /lib*/*.chk /u=
sr/lib*/*.chk 2&gt;/dev/null`<br><br>&gt; &gt; -SIGN_BINARY=3D`which shlibs=
ign`<br><br>&gt; &gt; -for I in $CHK_FILES<br><br>&gt; &gt; -do<br><br>&gt;=
 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0DN=3D`dirname $I`<br><br>&gt; &gt; -=C2=
=A0 =C2=A0 =C2=A0 =C2=A0BN=3D`basename $I .chk`<br><br>&gt; &gt; -=C2=A0 =
=C2=A0 =C2=A0 =C2=A0FN=3D$DN/$BN.so<br><br>&gt; &gt; -=C2=A0 =C2=A0 =C2=A0=
 =C2=A0$SIGN_BINARY -i $FN<br><br>&gt; &gt; -done<br><br>&gt; &gt; diff --g=
it a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.56.bb" rel=3D"nore=
ferrer" target=3D"_blank">nss_3.56.bb</a> b/meta-oe/recipes-support/nss/<a =
href=3D"http://nss_3.56.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.56.b=
b</a><br><br>&gt; &gt; index 107b0a0152..997f8950fd 100644<br><br>&gt; &gt;=
 --- a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.56.bb" rel=3D"no=
referrer" target=3D"_blank">nss_3.56.bb</a><br><br>&gt; &gt; +++ b/meta-oe/=
recipes-support/nss/<a href=3D"http://nss_3.56.bb" rel=3D"noreferrer" targe=
t=3D"_blank">nss_3.56.bb</a><br><br>&gt; &gt; @@ -21,7 +21,6 @@ VERSION_DIR=
 =3D &quot;${@d.getVar(&#39;BP&#39;).upper().replace(&#39;-&#39;, &#39;_&#3=
9;).replace(&#39;.&#39;, &#39;_&#39;) + &#39;<br><br>&gt; &gt;<br><br>&gt; =
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://ftp.mozilla.org/pub/mozilla.=
org/security/nss/releases/$%7BVERSION_DIR%7D/src/$%7BBP%7D.tar.gz" rel=3D"n=
oreferrer" target=3D"_blank">http://ftp.mozilla.org/pub/mozilla.org/securit=
y/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz</a> \<br><br>&gt; &gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://nss.pc.i=
n" rel=3D"noreferrer" target=3D"_blank">nss.pc.in</a> \<br><br>&gt; &gt; -=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://signlibs.sh \<br><br>&gt; =
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-nss-fix-sup=
port-cross-compiling.patch \<br><br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0file://nss-no-rpath-for-cross-compiling.patch \<br><br=
>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://nss-fix-in=
correct-shebang-of-perl.patch \<br><br>&gt; &gt; @@ -214,7 +213,6 @@ do_ins=
tall_append() {<br><br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${=
D}/${libdir}/$file<br><br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod=
 755 ${D}/${libdir}/$file<br><br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 done<br><br>=
&gt; &gt; -=C2=A0 =C2=A0 install -D -m 755 ${WORKDIR}/signlibs.sh ${D}/${bi=
ndir}/signlibs.sh<br><br>&gt; &gt;<br><br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ins=
tall -d ${D}${libdir}/pkgconfig/<br><br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 sed &=
#39;s/%NSS_VERSION%/${PV}/&#39; ${WORKDIR}/<a href=3D"http://nss.pc.in" rel=
=
=3D"noreferrer" target=3D"_blank">nss.pc.in</a> | sed &#39;s/%NSPR_VERSION=
%/4.9.2/&#39; &gt; ${D}${libdir}/pkgconfig/nss.pc<br><br>&gt; &gt; @@ -251,=
10 +249,6 @@ pkg_postinst_${PN} () {<br><br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 d=
one<br><br>&gt; &gt;=C2=A0 }<br><br>&gt; &gt;<br><br>&gt; &gt; -pkg_postins=
t_ontarget_${PN} () {<br><br>&gt; &gt; -=C2=A0 =C2=A0 ${bindir}/signlibs.sh=
<br><br>&gt; &gt; -}<br><br>&gt; &gt; -<br><br>&gt; &gt;=C2=A0 PACKAGES =3D=
+ &quot;${PN}-smime&quot;<br><br>&gt; &gt;=C2=A0 FILES_${PN}-smime =3D &quo=
t;\<br><br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${bindir}/smime \<br><br>&gt; &gt;=
 --<br><br>&gt; &gt; 2.25.1<br><br>&gt; &gt;<br><br>&gt; &gt; <br><br></blo=
ckquote></div></div>

--000000000000eaa8ab05ae4c1afb--
