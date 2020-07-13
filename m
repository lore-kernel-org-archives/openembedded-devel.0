Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.21031.1594651843735688997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SUDKc1GG;
 spf=pass (domain: linaro.org, ip: 209.85.221.68, mailfrom: anibal.limon@linaro.org)
Received: by mail-wr1-f68.google.com with SMTP id z13so16876867wrw.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2020 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8EKpR9gcKSLFAQpZeMHJXOKMeZr86GilNP3oaAvISk=;
        b=SUDKc1GGANwcoKlchCUMRb0N3rEnSdHDtsu/smCjk6SXPVQch6PYw39RSYf0UV1N+F
         JbNMmKqC9+L09B9Zq7wdhBfueOboCOmaPHAmgVo51Bb2hvKjc9tmzGYDZkjs6IqLgbai
         Db2HADDfbKbGVgr1XqswLefvaUn8J52Ama52EluXTcQEreM8nYSO7SqRoRFf5dE2t1YO
         r4ib3fHHck56Cdpm7vPa5JVFS8hIuAoko2dX4MDns/7pKM3DVa+GyQEXr++tEHQI9SaT
         o6hUTtCDxK57bjWShTmZQmoEFOdLlqN9EL7UpvxS25jmk9Mw2utfQu3RbWKET6Tbrs4l
         XEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8EKpR9gcKSLFAQpZeMHJXOKMeZr86GilNP3oaAvISk=;
        b=SRMnBQu37UcBqWviI3yrpHv6BnHdxZ6NSbztr42m6l++hrWh2WiIsKHpCtyThNm2t3
         XHYUaS1q2QOOtw1BXOvxdqeOdYiOhewPWfoiaI7J5Dv3vCj2D0QuyRyNJASSP2o2mgM8
         wwqDAT0gxvsZeCCrLj/gwgrfd4qZznzAuv9Qw4oyrgvrcTwwLOSKEvkCgwRhad5Szhfu
         AY8Pn9Ynn4tdNjl/f0h0cSXgxFnJ6eKhhxUeTKNkeHzNLkjPp6MrAWoxaGxdN3fUqwKV
         W8/MASytJztGTVmdqbShtPC6LOk2b++kjD9vf5CQHtLUNYc30uN8Pa6F1elg6q3VNe6r
         bBhg==
X-Gm-Message-State: AOAM5336FJ5lJMuOir7v4XNlJJ4mE47r0bpvkKV2GCN0K+EVBsIfFVse
	9dkl2yB75M9ApAw9DNHwM89M7cbn+TBTj6KiOlflXA==
X-Google-Smtp-Source: ABdhPJw+xdCXH/AI1g4r+L6Acbpav64yGASSdNwa/ry7bLHlyNRgnYzZIzqyH2lsBZ+xkhIKdZEpWWUa0UyipuuOvS0=
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr84070881wrh.95.1594651842174;
 Mon, 13 Jul 2020 07:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200710142114.10612-1-anibal.limon@linaro.org> <CAMKF1sq-+=LrQu+=3CENSU2MS1ynFzUsujfdKJKAbjf5F9Pkrg@mail.gmail.com>
In-Reply-To: <CAMKF1sq-+=LrQu+=3CENSU2MS1ynFzUsujfdKJKAbjf5F9Pkrg@mail.gmail.com>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Mon, 13 Jul 2020 09:50:30 -0500
Message-ID: <CA+_AqitDWTe7Gt5Rwevj-dYK9Y25gts08B_=+cn=7g6aY8+5bw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] recipes-graphics: Add opengl-es-cts install in /usr/lib
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000097f75a05aa53d0ec"

--00000000000097f75a05aa53d0ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for noticing, I need to add musl to my tests  :).

Anibal

El dom., 12 de jul. de 2020 21:07, Khem Raj <raj.khem@gmail.com> escribi=
=C3=B3:

> fails to compile
> musl - https://errors.yoctoproject.org/Errors/Details/420539/
> clang - https://errors.yoctoproject.org/Errors/Details/420544/
>
> On Fri, Jul 10, 2020 at 7:21 AM Anibal Limon <anibal.limon@linaro.org>
> wrote:
> >
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Commonly this kind of testing tools are installed in /usr/lib
> > like piglit, remove version.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> > ---
> >  .../vk-gl-cts/opengl-es-cts_3.2.6.1.bb        | 45 ++++++++++++++++++=
+
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/
> opengl-es-cts_3.2.6.1.bb
> >
> > diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.=
bb
> b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
> > new file mode 100644
> > index 000000000..226f70027
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
> > @@ -0,0 +1,45 @@
> > +DESCRIPTION =3D "OpenGL CTS"
> > +LICENSE =3D "Apache-2.0"
> > +PR =3D "r0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3=
c6bd57"
> > +
> > +SRC_URI =3D "\
> > +       git://
> github.com/KhronosGroup/VK-GL-CTS.git;protocol=3Dhttps;tag=3D${BPN}-${PV=
};name=3Dvk-gl-cts
> <http://github.com/KhronosGroup/VK-GL-CTS.git;protocol=3Dhttps;tag=3D$%7=
BBPN%7D-$%7BPV%7D;name=3Dvk-gl-cts>
> \
> > +       git://
> github.com/google/amber;protocol=3Dhttps;destsuffix=3Dgit/external/amber=
/src;name=3Damber;branch=3Dmain
> \
> > +       git://
> github.com/KhronosGroup/glslang.git;protocol=3Dhttps;destsuffix=3Dgit/ex=
ternal/glslang/src;name=3Dglslang
> \
> > +       git://
> github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;destsuffix=3D=
git/external/spirv-headers/src;name=3Dspirv-headers
> \
> > +       git://
> github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;destsuffix=3Dgi=
t/external/spirv-tools/src;name=3Dspirv-tools
> \
> > +"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +SRCREV_FORMAT =3D "vk-gl-cts"
> > +SRCREV_amber =3D "d26ee22dd7faab1845a531d410f7ec1db407402a"
> > +SRCREV_glslang =3D "c538b5d796fb24dd418fdd650c7f76e56bcc3dd8"
> > +SRCREV_spirv-headers =3D "e4322e3be589e1ddd44afb20ea842a977c1319b8"
> > +SRCREV_spirv-tools =3D "1eb89172a82b436d8037e8a8c29c80f7e1f7df74"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit pkgconfig cmake
> > +
> > +DEPENDS +=3D "libpng zlib virtual/libgles2 virtual/egl"
> > +
> > +EXTRA_OECMAKE_append =3D "-DDEQP_TARGET=3Dsurfaceless"
> > +
> > +CTSDIR =3D "${libdir}/${BPN}"
> > +
> > +do_install() {
> > +       install -d ${D}/${CTSDIR}
> > +
> > +       install -m 0755 ${B}/external/openglcts/modules/cts-runner
> ${D}/${CTSDIR}
> > +       install -m 0755 ${B}/external/openglcts/modules/glcts
> ${D}/${CTSDIR}
> > +       for dir in gl_cts gles2 gles3 gles31 gles32 ; do
> > +               cp -r ${B}/external/openglcts/modules/$dir
> ${D}/${CTSDIR}/
> > +       done
> > +       install -m 0755 ${B}/modules/gles3/deqp-gles3 ${D}/${CTSDIR}
> > +
> > +       rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmak=
e
> ${D}/${CTSDIR}/*/CMakeFiles
> > +}
> > +
> > +FILES_${PN} +=3D "${CTSDIR}"
> > --
> > 2.27.0
> >
> >=20
>

--00000000000097f75a05aa53d0ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks for noticing, I need to add musl to my tests=
=C2=A0 :).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Anibal</div>=
<div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"l=
tr" class=3D"gmail_attr">El dom., 12 de jul. de 2020 21:07, Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; escribi=C3=
=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">fails to compile<br>
musl - <a href=3D"https://errors.yoctoproject.org/Errors/Details/420539/" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://errors.yoctoproject=
.org/Errors/Details/420539/</a><br>
clang - <a href=3D"https://errors.yoctoproject.org/Errors/Details/420544/"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://errors.yoctoprojec=
t.org/Errors/Details/420544/</a><br>
<br>
On Fri, Jul 10, 2020 at 7:21 AM Anibal Limon &lt;<a href=3D"mailto:anibal.=
limon@linaro.org" target=3D"_blank" rel=3D"noreferrer">anibal.limon@linaro.=
org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.=
org" target=3D"_blank" rel=3D"noreferrer">dmitry.baryshkov@linaro.org</a>&g=
t;<br>
&gt;<br>
&gt; Commonly this kind of testing tools are installed in /usr/lib<br>
&gt; like piglit, remove version.<br>
&gt;<br>
&gt; Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshko=
v@linaro.org" target=3D"_blank" rel=3D"noreferrer">dmitry.baryshkov@linaro.=
org</a>&gt;<br>
&gt; Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.li=
mon@linaro.org" target=3D"_blank" rel=3D"noreferrer">anibal.limon@linaro.or=
g</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../vk-gl-cts/<a href=3D"http://opengl-es-cts_3.2.6.1.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">opengl-es-cts_3.2.6.1.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 45 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 45 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/<a href=
=3D"http://opengl-es-cts_3.2.6.1.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">opengl-es-cts_3.2.6.1.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-graphics/vk-gl-cts/<a href=3D"http://ope=
ngl-es-cts_3.2.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">open=
gl-es-cts_3.2.6.1.bb</a> b/meta-oe/recipes-graphics/vk-gl-cts/<a href=3D"ht=
tp://opengl-es-cts_3.2.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">opengl-es-cts_3.2.6.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..226f70027<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-graphics/vk-gl-cts/<a href=3D"http://opengl-es-=
cts_3.2.6.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">opengl-es-c=
ts_3.2.6.1.bb</a><br>
&gt; @@ -0,0 +1,45 @@<br>
&gt; +DESCRIPTION =3D &quot;OpenGL CTS&quot;<br>
&gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/Khrono=
sGroup/VK-GL-CTS.git;protocol=3Dhttps;tag=3D$%7BBPN%7D-$%7BPV%7D;name=3Dvk-=
gl-cts" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/KhronosG=
roup/VK-GL-CTS.git;protocol=3Dhttps;tag=3D${BPN}-${PV};name=3Dvk-gl-cts</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/google=
/amber;protocol=3Dhttps;destsuffix=3Dgit/external/amber/src;name=3Damber;br=
anch=3Dmain" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/goo=
gle/amber;protocol=3Dhttps;destsuffix=3Dgit/external/amber/src;name=3Damber=
;branch=3Dmain</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/Khrono=
sGroup/glslang.git;protocol=3Dhttps;destsuffix=3Dgit/external/glslang/src;n=
ame=3Dglslang" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/K=
hronosGroup/glslang.git;protocol=3Dhttps;destsuffix=3Dgit/external/glslang/=
src;name=3Dglslang</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/Khrono=
sGroup/SPIRV-Headers.git;protocol=3Dhttps;destsuffix=3Dgit/external/spirv-h=
eaders/src;name=3Dspirv-headers" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">github.com/KhronosGroup/SPIRV-Headers.git;protocol=3Dhttps;destsuffix=
=
=3Dgit/external/spirv-headers/src;name=3Dspirv-headers</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/Khrono=
sGroup/SPIRV-Tools.git;protocol=3Dhttps;destsuffix=3Dgit/external/spirv-too=
ls/src;name=3Dspirv-tools" rel=3D"noreferrer noreferrer" target=3D"_blank">=
github.com/KhronosGroup/SPIRV-Tools.git;protocol=3Dhttps;destsuffix=3Dgit/e=
xternal/spirv-tools/src;name=3Dspirv-tools</a> \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +SRCREV_FORMAT =3D &quot;vk-gl-cts&quot;<br>
&gt; +SRCREV_amber =3D &quot;d26ee22dd7faab1845a531d410f7ec1db407402a&quot=
;<br>
&gt; +SRCREV_glslang =3D &quot;c538b5d796fb24dd418fdd650c7f76e56bcc3dd8&qu=
ot;<br>
&gt; +SRCREV_spirv-headers =3D &quot;e4322e3be589e1ddd44afb20ea842a977c131=
9b8&quot;<br>
&gt; +SRCREV_spirv-tools =3D &quot;1eb89172a82b436d8037e8a8c29c80f7e1f7df7=
4&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +inherit pkgconfig cmake<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;libpng zlib virtual/libgles2 virtual/egl&quot;<br=
>
&gt; +<br>
&gt; +EXTRA_OECMAKE_append =3D &quot;-DDEQP_TARGET=3Dsurfaceless&quot;<br>
&gt; +<br>
&gt; +CTSDIR =3D &quot;${libdir}/${BPN}&quot;<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${CTSDIR}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${B}/external/openglcts/m=
odules/cts-runner ${D}/${CTSDIR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${B}/external/openglcts/m=
odules/glcts ${D}/${CTSDIR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for dir in gl_cts gles2 gles3 gles31 gles=
32 ; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/ex=
ternal/openglcts/modules/$dir ${D}/${CTSDIR}/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${B}/modules/gles3/deqp-g=
les3 ${D}/${CTSDIR}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}=
/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles<br>
&gt; +}<br>
&gt; +<br>
&gt; +FILES_${PN} +=3D &quot;${CTSDIR}&quot;<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt; <br>
</blockquote></div></div></div>

--00000000000097f75a05aa53d0ec--
