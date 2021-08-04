Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.11573.1628094780478836034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 09:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u/jogaTR;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id y7so4322680eda.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yH293WMGx2KklPD4pc3Gwoq0FAp+4+y2DXKY1/BiCYo=;
        b=u/jogaTRttIGy3knDOE2aC9x9c8WnBsLRVMozcGjAszSnjlCrugUArywXhevUZO4KF
         RcKRd77o6BspBJ832woFUB3iyEUObQ1pz+HAslhCo5mMvoZEUu2suOT7oh4nUTT7TAJR
         EZ7oxcO5X+i/E0jV6Ec3yowGrRKZle58OIXz9/S0NsJpRnc2Pyvlar1JTJb26S9UdPyY
         1FckWyq2JNRXkViGT5/+gozDiKsZbNX+/QER0+QzdEzU0d5KZNcfD5ggHkjX7xxj9Mah
         nAFyB4AXFN8Mm6p95FDWhEvYkVFvDp6LZ6JUI7a0+OkwgkXLkWAi1KCtbgFTMs7swO9i
         JgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yH293WMGx2KklPD4pc3Gwoq0FAp+4+y2DXKY1/BiCYo=;
        b=TMWlNSJyg4SmVVxdZwzAyJ59YQiziOiEScu1ibbpZ6V7DWucIQWiKgeYF//O2SRLn1
         kkR8XYVoPv1H1xu1PWBnvOtlL5OcFVNLjpW5G22OhuLoDaQe6QCKBcm43Qmg/ndfLO0c
         mQ+zJQL91D5HRhTCUC+Wzat4SS9UCdWVXHsQf3oA4GWh9DrhxsKEoXYD/hsvZYWCBMGm
         gqZcVA+0Wf/AU4jK4b7zdFvlDYDw2ahB+W4eLcXuSw1rJOTwxQN3CJ5yC9W8YCDBrQhp
         /r2jBXa9Q/hv+/LMxlchKhD0osaIZ7zRKlzX4lPlj8JcBvZnRdIargKk/hHKETsBQ2X4
         2zAQ==
X-Gm-Message-State: AOAM532PzB4BEbV5gbnvlzRcrLiiMomUqzHO49TexZGA4/HuqrQaH479
	jB/H3OEaMmBZOU7ylR7zcOQB7QlJd83Vw8Y8hV0=
X-Google-Smtp-Source: ABdhPJyDID32jLSeNPNOX2nYfEfYRHsGsV2Q8nky3qz6tStF/6OEHVqU1/6cnON8qGJv5SPv1gHm0EOBL47bbpEx6lw=
X-Received: by 2002:aa7:d146:: with SMTP id r6mr749297edo.264.1628094778837;
 Wed, 04 Aug 2021 09:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210804142712.251990-1-Martin.Jansa@gmail.com> <35f086c7-8947-0d0b-4b26-cb1cef6746dc@gmail.com>
In-Reply-To: <35f086c7-8947-0d0b-4b26-cb1cef6746dc@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 4 Aug 2021 18:32:47 +0200
Message-ID: <CA+chaQerqNMDP0kavevTnogNbB6WRAC58MYoOsb4+gQJ7dAfNg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] klibc.bbclass, image_types_sparse.bbclass, packagegroup-meta-oe.bb: update the overrides syntax conversion
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f40e9305c8be5ae4"

--000000000000f40e9305c8be5ae4
Content-Type: text/plain; charset="UTF-8"

Looks the same when done on top of master-next, but I've resent it now.

On Wed, Aug 4, 2021 at 6:14 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/4/21 7:27 AM, Martin Jansa wrote:
> > * re-run the latest version of the script which converts CONVERSION_CMD
> as well since
> >
> https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=d9e81d66db2bc2aa56d177cef78c814c29679a4a
> > * skip many incorrect s/_linux/:linux/g changes which were introduced by:
> >
> https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=9ea1041f8eab26ee871a9176e9691e5d3e6745bd
> >
>
> can you do this on top of master-next and send a v2 please ?
>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta-initramfs/classes/klibc.bbclass               |  2 +-
> >   meta-oe/classes/image_types_sparse.bbclass         |  2 +-
> >   .../packagegroups/packagegroup-meta-oe.bb          | 14 +++++++-------
> >   3 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta-initramfs/classes/klibc.bbclass
> b/meta-initramfs/classes/klibc.bbclass
> > index 83112c06fa..202d132d94 100644
> > --- a/meta-initramfs/classes/klibc.bbclass
> > +++ b/meta-initramfs/classes/klibc.bbclass
> > @@ -4,7 +4,7 @@ DEPENDS =+ "klcc-cross"
> >   # Default for klcc is to build static binaries.
> >   # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
> >   CC:forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
> > -CC:forcevariable:armv4_linux-gnueabi = "${TARGET_PREFIX}klcc
> ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
> > +CC:forcevariable:armv4:linux-gnueabi = "${TARGET_PREFIX}klcc
> ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
> >   CC:append:armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if
> (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
> >   CC:append:armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if
> (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
> >
> > diff --git a/meta-oe/classes/image_types_sparse.bbclass
> b/meta-oe/classes/image_types_sparse.bbclass
> > index 1459f800a5..af3879372b 100644
> > --- a/meta-oe/classes/image_types_sparse.bbclass
> > +++ b/meta-oe/classes/image_types_sparse.bbclass
> > @@ -1,7 +1,7 @@
> >   inherit image_types
> >
> >   CONVERSIONTYPES += "sparse"
> > -CONVERSION_CMD_sparse() {
> > +CONVERSION_CMD:sparse() {
> >       in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> >       out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse"
> >       case "${type}" in
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index 5cd605ff49..47ee3099aa 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -205,7 +205,7 @@ RDEPENDS:packagegroup-meta-oe-crypto ="\
> >       libsodium \
> >       pkcs11-helper \
> >   "
> > -RDEPENDS_packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
> > +RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
> >
> >   RDEPENDS:packagegroup-meta-oe-dbs ="\
> >       influxdb \
> > @@ -948,12 +948,12 @@ RDEPENDS:packagegroup-meta-oe-test ="\
> >       pm-qa \
> >       testfloat \
> >   "
> > -RDEPENDS_packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
> > -RDEPENDS_packagegroup-meta-oe-test:remove:arm = "fwts"
> > -RDEPENDS_packagegroup-meta-oe-test:remove:mipsarch = "fwts"
> > -RDEPENDS_packagegroup-meta-oe-test:remove:powerpc = "fwts"
> > -RDEPENDS_packagegroup-meta-oe-test:remove:riscv64 = "fwts"
> > -RDEPENDS_packagegroup-meta-oe-test:remove:riscv32 = "fwts"
> > +RDEPENDS:packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
> > +RDEPENDS:packagegroup-meta-oe-test:remove:arm = "fwts"
> > +RDEPENDS:packagegroup-meta-oe-test:remove:mipsarch = "fwts"
> > +RDEPENDS:packagegroup-meta-oe-test:remove:powerpc = "fwts"
> > +RDEPENDS:packagegroup-meta-oe-test:remove:riscv64 = "fwts"
> > +RDEPENDS:packagegroup-meta-oe-test:remove:riscv32 = "fwts"
> >
> >   RDEPENDS:packagegroup-meta-oe-ptest-packages = "\
> >       zeromq-ptest \
> >
> >
> >
> > 
> >
>

--000000000000f40e9305c8be5ae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks the same when done on top of master-next, but I&#39;=
ve resent it now.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, Aug 4, 2021 at 6:14 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 8/4/21 7:27 AM, Martin Jansa wrote:<br>
&gt; * re-run the latest version of the script which converts CONVERSION_C=
MD as well since<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/openembedded-cor=
e/commit/?h=3Dmaster-next&amp;id=3Dd9e81d66db2bc2aa56d177cef78c814c29679a4a=
" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openemb=
edded-core/commit/?h=3Dmaster-next&amp;id=3Dd9e81d66db2bc2aa56d177cef78c814=
c29679a4a</a><br>
&gt; * skip many incorrect s/_linux/:linux/g changes which were introduced=
 by:<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/openembedded-cor=
e/commit/?h=3Dmaster-next&amp;id=3D9ea1041f8eab26ee871a9176e9691e5d3e6745bd=
" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openemb=
edded-core/commit/?h=3Dmaster-next&amp;id=3D9ea1041f8eab26ee871a9176e9691e5=
d3e6745bd</a><br>
&gt;<br>
<br>
can you do this on top of master-next and send a v2 please ?<br>
<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-initramfs/classes/klibc.bbclass=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0meta-oe/classes/image_types_sparse.bbclass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-oe.=
bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++-------<br>
&gt;=C2=A0 =C2=A03 files changed, 9 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/cl=
asses/klibc.bbclass<br>
&gt; index 83112c06fa..202d132d94 100644<br>
&gt; --- a/meta-initramfs/classes/klibc.bbclass<br>
&gt; +++ b/meta-initramfs/classes/klibc.bbclass<br>
&gt; @@ -4,7 +4,7 @@ DEPENDS =3D+ &quot;klcc-cross&quot;<br>
&gt;=C2=A0 =C2=A0# Default for klcc is to build static binaries.<br>
&gt;=C2=A0 =C2=A0# Set CC =3D &quot;${TARGET_PREFIX}klcc -shared&quot; to =
build the dynamic version.<br>
&gt;=C2=A0 =C2=A0CC:forcevariable =3D &quot;${TARGET_PREFIX}klcc ${TOOLCHA=
IN_OPTIONS}&quot;<br>
&gt; -CC:forcevariable:armv4_linux-gnueabi =3D &quot;${TARGET_PREFIX}klcc =
${TOOLCHAIN_OPTIONS} -march=3Darmv4 -mthumb-interwork&quot;<br>
&gt; +CC:forcevariable:armv4:linux-gnueabi =3D &quot;${TARGET_PREFIX}klcc =
${TOOLCHAIN_OPTIONS} -march=3Darmv4 -mthumb-interwork&quot;<br>
&gt;=C2=A0 =C2=A0CC:append:armv7ve =3D &quot; ${@&#39; -mfloat-abi=3D${TUN=
E_CCARGS_MFLOAT}&#39; if (d.getVar(&#39;TUNE_CCARGS_MFLOAT&#39;) !=3D &#39;=
&#39;) else &#39;&#39;}&quot;<br>
&gt;=C2=A0 =C2=A0CC:append:armv7a =3D &quot; ${@&#39; -mfloat-abi=3D${TUNE=
_CCARGS_MFLOAT}&#39; if (d.getVar(&#39;TUNE_CCARGS_MFLOAT&#39;) !=3D &#39;&=
#39;) else &#39;&#39;}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/cla=
sses/image_types_sparse.bbclass<br>
&gt; index 1459f800a5..af3879372b 100644<br>
&gt; --- a/meta-oe/classes/image_types_sparse.bbclass<br>
&gt; +++ b/meta-oe/classes/image_types_sparse.bbclass<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 =C2=A0inherit image_types<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0CONVERSIONTYPES +=3D &quot;sparse&quot;<br>
&gt; -CONVERSION_CMD_sparse() {<br>
&gt; +CONVERSION_CMD:sparse() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in=3D&quot;${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0out=3D&quot;${IMAGE_NAME}${IMAGE_NAME_SUFFI=
X}.${type}.sparse&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;${type}&quot; in<br>
&gt; diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-met=
a-oe.bb</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packageg=
roup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.=
bb</a><br>
&gt; index 5cd605ff49..47ee3099aa 100644<br>
&gt; --- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegro=
up-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb=
</a><br>
&gt; +++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegro=
up-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb=
</a><br>
&gt; @@ -205,7 +205,7 @@ RDEPENDS:packagegroup-meta-oe-crypto =3D&quot;\<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libsodium \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pkcs11-helper \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; -RDEPENDS_packagegroup-meta-oe-crypto:remove:riscv32 =3D &quot;botan&=
quot;<br>
&gt; +RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 =3D &quot;botan&=
quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0RDEPENDS:packagegroup-meta-oe-dbs =3D&quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0influxdb \<br>
&gt; @@ -948,12 +948,12 @@ RDEPENDS:packagegroup-meta-oe-test =3D&quot;\<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pm-qa \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0testfloat \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; -RDEPENDS_packagegroup-meta-oe-test:remove:libc-musl =3D &quot;pm-qa&=
quot;<br>
&gt; -RDEPENDS_packagegroup-meta-oe-test:remove:arm =3D &quot;fwts&quot;<b=
r>
&gt; -RDEPENDS_packagegroup-meta-oe-test:remove:mipsarch =3D &quot;fwts&qu=
ot;<br>
&gt; -RDEPENDS_packagegroup-meta-oe-test:remove:powerpc =3D &quot;fwts&quo=
t;<br>
&gt; -RDEPENDS_packagegroup-meta-oe-test:remove:riscv64 =3D &quot;fwts&quo=
t;<br>
&gt; -RDEPENDS_packagegroup-meta-oe-test:remove:riscv32 =3D &quot;fwts&quo=
t;<br>
&gt; +RDEPENDS:packagegroup-meta-oe-test:remove:libc-musl =3D &quot;pm-qa&=
quot;<br>
&gt; +RDEPENDS:packagegroup-meta-oe-test:remove:arm =3D &quot;fwts&quot;<b=
r>
&gt; +RDEPENDS:packagegroup-meta-oe-test:remove:mipsarch =3D &quot;fwts&qu=
ot;<br>
&gt; +RDEPENDS:packagegroup-meta-oe-test:remove:powerpc =3D &quot;fwts&quo=
t;<br>
&gt; +RDEPENDS:packagegroup-meta-oe-test:remove:riscv64 =3D &quot;fwts&quo=
t;<br>
&gt; +RDEPENDS:packagegroup-meta-oe-test:remove:riscv32 =3D &quot;fwts&quo=
t;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0RDEPENDS:packagegroup-meta-oe-ptest-packages =3D &quot;\<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0zeromq-ptest \<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000f40e9305c8be5ae4--
