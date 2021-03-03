Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.6585.1614778742269274430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pxDThp20;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id gt32so30693241ejc.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 05:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L5mSFaxYC2YsEAzIrjvLAq/0cne0tRAuZDN25MbAqYI=;
        b=pxDThp20b526sHyG6afel3Q1s5TcHsI3XV5L70zFDFbHv1FYyshNlVZTLSiVJ3OBkn
         7fAN47XyMZpDl96vR2e4vZ8innjPWFXH8Z1DSwfCuH7NcY+rgHwqONA1aHr/2lMozUkI
         REoqoWERLbsBq2gLrWBwIHzatOWiNXYxSmzOIMUGF24lIAo+iN0PtqoxHaVuqYqPpSjB
         MIpKv9U4WCi6O7fXTj7R8NC0n2ssmxhws+ng0inAGaXGpT2/abCHmCZVqCSV/D81ldFh
         cZMAacYNIgZmPVHQN6z/e84jmgoRp/jfQNssJCwXjBv2uSVqLpJbfN1OXRBAdMeq4PH7
         GwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L5mSFaxYC2YsEAzIrjvLAq/0cne0tRAuZDN25MbAqYI=;
        b=VyHEVVXtvuhlgn4gtX51SJ+eMqz5RUDsmlHAm2rpFZApLdZhTdWeZwU4jq8tW9gpEM
         Go8BNjByL8J4qfxhNvwLtaVUHI3KyeKWrjgGhNdl/XKtLjsBTkzT0U9GZutiV+IdmQVu
         SxEUKbuMWrwAalkIipI7b7W/j9DPnQL7CYBCqOC63x//PXdvo7SH+WLfC9uAQtewdw3B
         Gur2d5hI6Yyr/iNo5SkC71Sa/eqXuHcXSmdzNQSt7gELLdvnCryfSDhKbQyhy5pNROId
         xnAElLgOAcrjhxnev29h2bTI7MszqXS3klex0EYJnB2Qs5MeSeh3BEwjdlyMMqarEvum
         NeMw==
X-Gm-Message-State: AOAM531NYAKKxlSfWHCHE1mdz1LQxcV6Fp0blI0IKORs6mKrbgdw1+la
	p0ouZpnIPL1J35f6sJwh/eqe7WPrfi+RTKqZ7So=
X-Google-Smtp-Source: ABdhPJxzHvhUnmE21nV07uBwDXAZSaQYZQ2FaQcJPyWiwJl3PF20YeiGm+8bF45l4DyVyAzN1MtfgfekKHvDTlSuDpc=
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr25895417ejc.408.1614778740654;
 Wed, 03 Mar 2021 05:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20210302200930.544487-1-raj.khem@gmail.com>
In-Reply-To: <20210302200930.544487-1-raj.khem@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Wed, 3 Mar 2021 13:38:49 +0000
Message-ID: <CANPvuRn3v_r0DNGbnVG3uwFACLZR3FARE8uowUCzMD2b2JO2nA@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH] srt: Backport fix for missing <limits> header
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003a487105bca1f9e1"

--0000000000003a487105bca1f9e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 2/03/2021 =C3=A0(=
s) 20:09:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Jose Quaresma <quaresma.jose@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...001-core-Fix-build-with-GCC-11.-1806.patch | 26 +++++++++++
>  .../recipes-support/srt/srt_1.4.2.bb          |  1 +
>  meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb | 46 +++++++++++++++++++
>

I thinks that mpich needs to go in another patch.

 3 files changed, 73 insertions(+)
>  create mode 100644
> meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-=
1806.patch
>  create mode 100644 meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
>
> diff --git
> a/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11=
.-1806.patch
> b/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11=
.-1806.patch
> new file mode 100644
> index 0000000000..0cb6943ccb
> --- /dev/null
> +++
> b/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11=
.-1806.patch
> @@ -0,0 +1,26 @@
> +From f1b35cbf5b9b42b031e9b119e4c802b5f744468c Mon Sep 17 00:00:00 2001
> +From: Christophe Giboudeaux <krop@users.noreply.github.com>
> +Date: Wed, 10 Feb 2021 12:42:45 +0000
> +Subject: [PATCH] [core] Fix build with GCC 11. (#1806)
> +
> +The 'limits' header must be included explicitly.
> +---
> +Upstream-Status: Backport [
> https://github.com/haivision/srt/commit/f1b35cbf5b9b42b031e9b119e4c802b5f=
744468c
> ]
> + srtcore/sync.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/srtcore/sync.h b/srtcore/sync.h
> +index 59c125a7..9f01ca91 100644
> +--- a/srtcore/sync.h
> ++++ b/srtcore/sync.h
> +@@ -15,6 +15,7 @@
> + //#define ENABLE_CXX17
> +
> + #include <cstdlib>
> ++#include <limits>
> + #ifdef ENABLE_STDCXX_SYNC
> + #include <chrono>
> + #include <thread>
> +--
> +2.30.1
> +
> diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
> b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
> index 567ea68edf..f7dfda28f1 100644
> --- a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
> +++ b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D815ca599c9df247a0c7f619bab123dad"
>  SRCREV =3D "50b7af06f3a0a456c172b4cb3aceafa8a5cc0036"
>  SRC_URI =3D "git://github.com/Haivision/srt;protocol=3Dhttps \
>             file://0001-don-t-install-srt-ffplay.patch \
> +           file://0001-core-Fix-build-with-GCC-11.-1806.patch \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
> b/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
> new file mode 100644
> index 0000000000..e5f36a5140
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
> @@ -0,0 +1,46 @@
> +SUMMARY =3D "Message Passing Interface (MPI) implementation"
> +HOMEPAGE =3D "http://www.mpich.org/"
> +SECTION =3D "devel"
> +
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbd4d7ab13df98988b1ca2a4e01c=
8c163"
> +
> +SRC_URI =3D "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar=
.gz
> "
> +SRC_URI[sha256sum] =3D
> "8836939804ef6d492bcee7d54abafd6477d2beca247157d92688654d13779727"
> +
> +RDEPENDS_${PN} +=3D "bash perl libxml2"
> +
> +EXTRA_OECONF =3D "--enable-debuginfo \
> +    --enable-fast \
> +    --enable-shared  \
> +    --with-pm=3Dgforker  \
> +    --disable-rpath \
> +    --disable-f77 \
> +    --disable-fc \
> +    --disable-fortran \
> +    --disable-cxx \
> +    --with-device=3Dch4:ucx \
> +    --disable-numa \
> +"
> +
> +inherit autotools gettext pkgconfig
> +
> +do_configure() {
> +    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
> +        src/pm/hydra/tools/topo/hwloc/hwloc/config
> src/pm/hydra/mpl/confdb \
> +        modules/yaksa/m4 modules/json-c modules/ucx
> test/mpi/dtpools/confdb \
> +        src/mpl/confdb src/mpi/romio/confdb;  do
> +        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.gues=
s
> ${S}/$d
> +        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub
> ${S}/$d
> +    done
> +    cd ${S}
> +    autoupdate
> +    autoreconf --verbose --install --force
> +    cd ${B}
> +    oe_runconf
> +}
> +
> +do_install_append() {
> +    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
> +    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
> +}
> --
> 2.30.1
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003a487105bca1f9e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Khem,<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 2/03/2021 =
=C3=A0(s) 20:09:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"=
_blank">quaresma.jose@gmail.com</a>&gt;<br>
Cc: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com" targ=
et=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0...001-core-Fix-build-with-GCC-11.-1806.patch | 26 +++++++++++<br>
=C2=A0.../recipes-support/srt/<a href=3D"http://srt_1.4.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">srt_1.4.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 1 +<br>
=C2=A0meta-oe/recipes-devtools/mpich/<a href=3D"http://mpich_3.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mpich_3.4.1.bb</a> | 46 +++++++++++++++++=
++<br></blockquote><div><br></div><div>I thinks that mpich needs to go in a=
nother patch.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A03 files changed, 73 insertions(+)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-support/srt/srt/0001-core-=
Fix-build-with-GCC-11.-1806.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/mpich/<a href=3D"http://m=
pich_3.4.1.bb" rel=3D"noreferrer" target=3D"_blank">mpich_3.4.1.bb</a><br>
<br>
diff --git a/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-wi=
th-GCC-11.-1806.patch b/meta-multimedia/recipes-support/srt/srt/0001-core-F=
ix-build-with-GCC-11.-1806.patch<br>
new file mode 100644<br>
index 0000000000..0cb6943ccb<br>
--- /dev/null<br>
+++ b/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-=
11.-1806.patch<br>
@@ -0,0 +1,26 @@<br>
+From f1b35cbf5b9b42b031e9b119e4c802b5f744468c Mon Sep 17 00:00:00 2001<br>
+From: Christophe Giboudeaux &lt;<a href=3D"mailto:krop@users.noreply.githu=
b.com" target=3D"_blank">krop@users.noreply.github.com</a>&gt;<br>
+Date: Wed, 10 Feb 2021 12:42:45 +0000<br>
+Subject: [PATCH] [core] Fix build with GCC 11. (#1806)<br>
+<br>
+The &#39;limits&#39; header must be included explicitly.<br>
+---<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/haivision/srt/com=
mit/f1b35cbf5b9b42b031e9b119e4c802b5f744468c" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/haivision/srt/commit/f1b35cbf5b9b42b031e9b119e4c=
802b5f744468c</a>]<br>
+ srtcore/sync.h | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/srtcore/sync.h b/srtcore/sync.h<br>
+index 59c125a7..9f01ca91 100644<br>
+--- a/srtcore/sync.h<br>
++++ b/srtcore/sync.h<br>
+@@ -15,6 +15,7 @@<br>
+ //#define ENABLE_CXX17<br>
+ <br>
+ #include &lt;cstdlib&gt;<br>
++#include &lt;limits&gt;<br>
+ #ifdef ENABLE_STDCXX_SYNC<br>
+ #include &lt;chrono&gt;<br>
+ #include &lt;thread&gt;<br>
+-- <br>
+2.30.1<br>
+<br>
diff --git a/meta-multimedia/recipes-support/srt/<a href=3D"http://srt_1.4.=
2.bb" rel=3D"noreferrer" target=3D"_blank">srt_1.4.2.bb</a> b/meta-multimed=
ia/recipes-support/srt/<a href=3D"http://srt_1.4.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">srt_1.4.2.bb</a><br>
index 567ea68edf..f7dfda28f1 100644<br>
--- a/meta-multimedia/recipes-support/srt/<a href=3D"http://srt_1.4.2.bb" r=
el=3D"noreferrer" target=3D"_blank">srt_1.4.2.bb</a><br>
+++ b/meta-multimedia/recipes-support/srt/<a href=3D"http://srt_1.4.2.bb" r=
el=3D"noreferrer" target=3D"_blank">srt_1.4.2.bb</a><br>
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D815ca599c9d=
f247a0c7f619bab123dad&quot;<br>
=C2=A0SRCREV =3D &quot;50b7af06f3a0a456c172b4cb3aceafa8a5cc0036&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/Haivision/srt;pr=
otocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/Haivision/s=
rt;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-don-t-install-srt-ffp=
lay.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-core-Fix-build-with-G=
CC-11.-1806.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta-oe/recipes-devtools/mpich/<a href=3D"http://mpich_3.4.1.b=
b" rel=3D"noreferrer" target=3D"_blank">mpich_3.4.1.bb</a> b/meta-oe/recipe=
s-devtools/mpich/<a href=3D"http://mpich_3.4.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">mpich_3.4.1.bb</a><br>
new file mode 100644<br>
index 0000000000..e5f36a5140<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/mpich/<a href=3D"http://mpich_3.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mpich_3.4.1.bb</a><br>
@@ -0,0 +1,46 @@<br>
+SUMMARY =3D &quot;Message Passing Interface (MPI) implementation&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.mpich.org/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://www.mpich.org/</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-2-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3Dbd4d7ab13df98988b1ca2a4e=
01c8c163&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://www.mpich.org/static/downloads/$%7BPV%=
7D/mpich-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.=
mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8836939804ef6d492bcee7d54abafd6477d2beca24715=
7d92688654d13779727&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;bash perl libxml2&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot;--enable-debuginfo \<br>
+=C2=A0 =C2=A0 --enable-fast \<br>
+=C2=A0 =C2=A0 --enable-shared=C2=A0 \<br>
+=C2=A0 =C2=A0 --with-pm=3Dgforker=C2=A0 \<br>
+=C2=A0 =C2=A0 --disable-rpath \<br>
+=C2=A0 =C2=A0 --disable-f77 \<br>
+=C2=A0 =C2=A0 --disable-fc \<br>
+=C2=A0 =C2=A0 --disable-fortran \<br>
+=C2=A0 =C2=A0 --disable-cxx \<br>
+=C2=A0 =C2=A0 --with-device=3Dch4:ucx \<br>
+=C2=A0 =C2=A0 --disable-numa \<br>
+&quot;<br>
+<br>
+inherit autotools gettext pkgconfig<br>
+<br>
+do_configure() {<br>
+=C2=A0 =C2=A0 for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src/pm/hydra/tools/topo/hwloc/hwloc/config src=
/pm/hydra/mpl/confdb \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 modules/yaksa/m4 modules/json-c modules/ucx te=
st/mpi/dtpools/confdb \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src/mpl/confdb src/mpi/romio/confdb;=C2=A0 do<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-=
config/config.guess ${S}/$d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-=
config/config.sub ${S}/$d<br>
+=C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 cd ${S}<br>
+=C2=A0 =C2=A0 autoupdate<br>
+=C2=A0 =C2=A0 autoreconf --verbose --install --force<br>
+=C2=A0 =C2=A0 cd ${B}<br>
+=C2=A0 =C2=A0 oe_runconf<br>
+}<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 sed -i &#39;s,${S}/,,g&#39; ${D}/${libdir}/<a href=3D"http:/=
/libmpi.la" rel=3D"noreferrer" target=3D"_blank">libmpi.la</a><br>
+=C2=A0 =C2=A0 sed -i &#39;s,${DEBUG_PREFIX_MAP},,g&#39; ${D}/${libdir}/pkg=
config/mpich.pc<br>
+}<br>
-- <br>
2.30.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</=
div></div></div></div>

--0000000000003a487105bca1f9e1--
