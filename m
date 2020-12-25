Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.11131.1608909541231135627
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 07:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=quQplDFL;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id i9so4600520wrc.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 07:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QPvf+k9kOAQSt7md/dCOIHoKuIzQRmuZ0vKVjD/1+gI=;
        b=quQplDFLOMyi5ZHyq3FBIcx8tj0/U65mC+ZnUJHZrwqsJcJ5/6+SzVzQOW1P3U+50L
         VgW9PrM/cJ4+rINYRw+ohL2XPOyeWdx7xVTKiel+/ik6W0IW/4LuLx+H4YUWO32KtDOa
         Y7yMr2BKWBKnm/xzrzrJGoTAgu/+S/HojixgH+EE6WZQ5QPRgjokDdRLkbEiCjGpcND5
         A4eDatVi+7YVH5Y1yUsOPU3PAIzIG5GH2Mb/FAfEErGox/TKq+upij2Gt0iZgvvYhMNK
         tNSX1/htZFhu5kqaUG3t5Ae3pTYRQGQX5VmiL7vCvSUke0afwebDMkTC1Eh5VorKx1s4
         8kug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPvf+k9kOAQSt7md/dCOIHoKuIzQRmuZ0vKVjD/1+gI=;
        b=pi3/9tbWN2DerxvSqvcbND6rBluwE9Zah3jW32mgQlgMaxRzoVlVl7qMwcFSSjZAzO
         G2VX0KHQFu0PGR1+nIP0xy5jMmN70Jr/5vb+yQIw5dM1NKVUvniyE434qx5+uIf57qNo
         9gwM1YqGlu+SbPfyOLa/UTMk2tgPAcDdkuUCsJo/GVNmVSbwkSiyac8EyuyqVv8DSbBD
         zeMgFzslkuuc8naCvS2Bmaao6nlHmuz7mDlyIHgJ8yZv27/zd7gFRN+6rdneRulx40y0
         6HfgI+SW2QBCwFGUafyVrxAdFFmj4RrcwtAPYcL4pJfYXXiA2LcC/seLxCSjXSYUQyaz
         PAbg==
X-Gm-Message-State: AOAM531Hq952nPtXZxjQKzQ8WXTq3LMVTKa1NM5TwLVvN0rkD2zdlLrZ
	c+0UEseZc4BH3G3Wdel7HXtttlBkyJWC0/YZBzM=
X-Google-Smtp-Source: ABdhPJx4IMW26oH/Uy6mKGHjDpQtUQis3K7Q60xfgkRvlpPFVOO3NanOevo9XyW7fz+XlXPaeZ6oIdPKwUk1esq1zMM=
X-Received: by 2002:a5d:5552:: with SMTP id g18mr39940745wrw.145.1608909539738;
 Fri, 25 Dec 2020 07:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20201225145637.25443-1-rfried.dev@gmail.com>
In-Reply-To: <20201225145637.25443-1-rfried.dev@gmail.com>
From: "Vincent Prince" <vincent.prince.fr@gmail.com>
Date: Fri, 25 Dec 2020 16:18:42 +0100
Message-ID: <CAB2nKc-srKMvzQoypa38ZMm18XCCKWi=ouFecjPVjuMLKWELKQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] yaml-cpp: add new recipe
To: Ramon Fried <rfried.dev@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009788b505b74b7129"

--0000000000009788b505b74b7129
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I think PV is wrongly set to " +git${SRCPV}" as the 9a362 commit
corresponds exactly to the 0.6.4 version.
Also, I'm not sure FILES_${PN} and do_install_append is required as Yocto
should put those files directly to the right place?

Best regards,
Vincent

Le ven. 25 d=C3=A9c. 2020 =C3=A0 15:55, Ramon Fried <rfried.dev@gmail.com>=
 a =C3=A9crit :

> yaml-cpp is a YAML parser and emitter in C++
> matching the YAML 1.2 spec.
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>  .../yaml-cpp/yaml-cpp_0.6.3.bb                | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
>
> diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
> b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
> new file mode 100644
> index 000000000..48e9c6fba
> --- /dev/null
> +++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "yaml-cpp parser and emitter library"
> +DESCRIPTION =3D "yaml-cpp is a YAML parser and emitter in C++ matching =
the
> YAML 1.2 spec."
> +HOMEPAGE =3D "https://github.com/jbeder/yaml-cpp"
> +SECTION =3D "devel"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a8aaf0595c2efc1a9c2e0913e9c=
1a2c"
> +
> +PV =3D "+git${SRCPV}"
> +# yaml-cpp releases are stored as archive files in github.
> +# download the exact revision of release
> +SRC_URI =3D "git://github.com/jbeder/yaml-cpp.git"
> +SRCREV =3D "9a3624205e8774953ef18f57067b3426c1c5ada6"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +FILES_${PN} =3D "${libdir}/libyaml-cpp.so.*"
> +EXTRA_OECMAKE =3D "-DYAML_CPP_BUILD_TESTS=3DOFF -DYAML_BUILD_SHARED_LIB=
S=3DON
> -DYAML_CPP_BUILD_TOOLS=3DOFF"
> +
> +do_install_append() {
> +    install -d ${D}${includedir}/yaml-cpp
> +    cp -r ${S}/include/yaml-cpp ${D}${includedir}/yaml-cpp
> +}
> --
> 2.17.1
>
>
>=20
>
>

--0000000000009788b505b74b7129
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>I think PV is wrongly=C2=A0se=
t to &quot;

+git${SRCPV}&quot; as the 9a362=C2=A0commit corresponds exactly to the 0.6=
.4 version.=C2=A0</div><div>Also, I&#39;m not sure FILES_${PN} and do_insta=
ll_append is required as Yocto should put those files directly to the right=
 place?</div><div><br></div><div>Best regards,</div><div>Vincent</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=
=
=A0ven. 25 d=C3=A9c. 2020 =C3=A0=C2=A015:55, Ramon Fried &lt;<a href=3D"ma=
ilto:rfried.dev@gmail.com">rfried.dev@gmail.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">yaml-cpp is a Y=
AML parser and emitter in C++<br>
matching the YAML 1.2 spec.<br>
<br>
Signed-off-by: Ramon Fried &lt;<a href=3D"mailto:rfried.dev@gmail.com" tar=
get=3D"_blank">rfried.dev@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../yaml-cpp/<a href=3D"http://yaml-cpp_0.6.3.bb" rel=3D"noreferrer"=
 target=3D"_blank">yaml-cpp_0.6.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 | 24 +++++++++++++++++++<br>
=C2=A01 file changed, 24 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/yaml-cpp/<a href=3D"http:=
//yaml-cpp_0.6.3.bb" rel=3D"noreferrer" target=3D"_blank">yaml-cpp_0.6.3.bb=
</a><br>
<br>
diff --git a/meta-oe/recipes-support/yaml-cpp/<a href=3D"http://yaml-cpp_0=
.6.3.bb" rel=3D"noreferrer" target=3D"_blank">yaml-cpp_0.6.3.bb</a> b/meta-=
oe/recipes-support/yaml-cpp/<a href=3D"http://yaml-cpp_0.6.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">yaml-cpp_0.6.3.bb</a><br>
new file mode 100644<br>
index 000000000..48e9c6fba<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/yaml-cpp/<a href=3D"http://yaml-cpp_0.6.3.bb=
" rel=3D"noreferrer" target=3D"_blank">yaml-cpp_0.6.3.bb</a><br>
@@ -0,0 +1,24 @@<br>
+SUMMARY =3D &quot;yaml-cpp parser and emitter library&quot;<br>
+DESCRIPTION =3D &quot;yaml-cpp is a YAML parser and emitter in C++ matchi=
ng the YAML 1.2 spec.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/jbeder/yaml-cpp" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/jbeder/yaml-cpp</a>&quot;<=
br>
+SECTION =3D &quot;devel&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6a8aaf0595c2efc1a9c2e0913=
e9c1a2c&quot;<br>
+<br>
+PV =3D &quot;+git${SRCPV}&quot;<br>
+# yaml-cpp releases are stored as archive files in github.<br>
+# download the exact revision of release<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/jbeder/yaml-cpp.git"=
 rel=3D"noreferrer" target=3D"_blank">github.com/jbeder/yaml-cpp.git</a>&qu=
ot;<br>
+SRCREV =3D &quot;9a3624205e8774953ef18f57067b3426c1c5ada6&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+FILES_${PN} =3D &quot;${libdir}/libyaml-cpp.so.*&quot;<br>
+EXTRA_OECMAKE =3D &quot;-DYAML_CPP_BUILD_TESTS=3DOFF -DYAML_BUILD_SHARED_=
LIBS=3DON -DYAML_CPP_BUILD_TOOLS=3DOFF&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -d ${D}${includedir}/yaml-cpp<br>
+=C2=A0 =C2=A0 cp -r ${S}/include/yaml-cpp ${D}${includedir}/yaml-cpp<br>
+}<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009788b505b74b7129--
