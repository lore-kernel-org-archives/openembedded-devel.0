Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9397C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:09:05 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.267.1634749744805962310
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d01qjOGd;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id om14so2916631pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MIbyb4YuhhUHjLyjepImXefUUxDkj477DjgpNl4QLn4=;
        b=d01qjOGd5mJZAMW8RJXkH6SKs6SvUDOX++iTwHk0DBDJ5wPCOgwLQUKaC7zlhhiKSV
         ewivkuiIlIgiB/fv8zVNPkVQSlSLnKGLOFu3SbUgQh1PwBb9mHMEXxZiVos/dyhjrJTb
         cHP1eMWBaxi5e/xxtc2/JMlbXLQyk2YGJibxGYkObB3mZ7arnoS7u2Dgyi/2CnIcK4LL
         w1v8CMHwFEiPm+Dzz+DBeeUN/orjq8KojoW9hPqr4ZEypFNIPDEwbv5FxqAFL1VmTRA9
         kOFhgcyO7QC1yZYHBmpCoxd3OTLiHT6qG0Ghp52hFFY3Dp+Xen5raCjpMKtzMcdUNFTJ
         xBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MIbyb4YuhhUHjLyjepImXefUUxDkj477DjgpNl4QLn4=;
        b=2tcbfkBfC6zsC5pILPHMXoQQUdAAvgJiUm+IlTuMYOef5GeoGzIqQUnnUH5kjwW60j
         8Cg7pG+2vIDKe/zIXvfe20Qn0n4+iATMoYq+ZoackwZGqIOR2Xq4RZrM0z0qc0ldD1fJ
         7KSE5z/gx+V7BMnH9O4HzAg//41dJrUPSrXPLv/vAJwgRkn2ZQk4yqNU+O26rXgNUTeo
         fMJJkgo8feHnIUqQEuUMtkuJTeoCAh8fxsVE4DcloOt9N5aaDWDAIxLzIWZc9s4+CDyZ
         z3A71PQgNFA11SCYS1V/+j0Iu+MFMonD4d1NhFyg/3/iaz1PWUC6Bd/mfLdkM7wDd7x3
         eVMQ==
X-Gm-Message-State: AOAM530pEtLpZxrhBcQL01urcNK5KE0td5O25GJJDMd/vxc/JR4Jorjn
	JCXNTZiHpDvypsE1zxLApvpkRhuWt1DQJzIlqMY=
X-Google-Smtp-Source: 
 ABdhPJwONgOaMszw3jeDaucmcKiASDveDz1RSnF/R54Xi+5y5Y0WmJH/tT/l26j2xmuN/16sY9ORIS0oOWmUvx/1Hw0=
X-Received: by 2002:a17:90b:3e8d:: with SMTP id
 rj13mr73516pjb.183.1634749744368;
 Wed, 20 Oct 2021 10:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112507.3635856-1-whuang8933@gmail.com>
In-Reply-To: <20210902112507.3635856-1-whuang8933@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Oct 2021 19:08:53 +0200
Message-ID: 
 <CA+chaQeng1R3Gca4DxNNRrkmd_8E-dEdGgXZviKXvS3x8hQAHg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] recipes-devtools: python: add support
 for Kivy
To: William Huang <whuang8933@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cf4f7105cecbd5d9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:09:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93488

--000000000000cf4f7105cecbd5d9
Content-Type: text/plain; charset="UTF-8"

This RDEPENDS_ syntax is no longer valid, please update to RDEPENDS:.

On Thu, Sep 2, 2021 at 1:25 PM William Huang <whuang8933@gmail.com> wrote:

> ---
>  .../0001-add-support-for-glesv2.patch         | 24 +++++++
>  .../python/python3-kivy_2.0.0.bb              | 71 +++++++++++++++++++
>  2 files changed, 95 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-kivy_2.0.0.bb
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
> b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
> new file mode 100644
> index 000000000..e50c7e7e2
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for-glesv2.patch
> @@ -0,0 +1,24 @@
> +diff --git a/setup.py b/setup.py
> +index 9a507c6c4..3f5b70866 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -680,7 +680,18 @@ def determine_gl_flags():
> +         c_options['use_x11'] = True
> +         c_options['use_egl'] = True
> +     else:
> +-        flags['libraries'] = ['GL']
> ++        if cross_sysroot:
> ++            flags['include_dirs'] = [cross_sysroot + '/usr/include']
> ++            flags['library_dirs'] = [cross_sysroot + '/usr/lib']
> ++
> ++        if c_options['use_opengl_es2']:
> ++            print("using GLESv2 libraries")
> ++            flags['libraries'] = ['GLESv2']
> ++        else:
> ++            flags['libraries'] = ['GL']
> ++
> ++
> ++    print("cross_sysroot: " + str(cross_sysroot))
> +     return flags, base_flags
> +
> +
> diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> new file mode 100644
> index 000000000..3f6bafda8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
> @@ -0,0 +1,71 @@
> +SUMMARY = "Open source Python library for rapid development of
> applications \
> +    that make use of innovative user interfaces, such as multi-touch
> apps."
> +HOMEPAGE = "https://kivy.org/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f0c851d60495c7e27225a819e179208a"
> +
> +inherit setuptools3
> +
> +SRC_URI = "\
> +    git://github.com/kivy/kivy.git;protocol=git;\
> +"
> +
> +# Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
> +# and mali-based OS's. We need to patch the setup file to tell Kivy setup
> +# that our machine has GLES libaries installed as well
> +# Also, if using SDL2 as backend, SDL2 needs to be configured wth gles
> +SRC_URI += " \
> +    file://0001-add-support-for-glesv2.patch \
> +"
> +SRCREV = "dedcb6bcabe3d8d6758dcee607e8c33b174d782b"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGES += "${PN}-examples"
> +FILES:${PN}-examples = "/usr/share/kivy-examples"
> +
> +USE_WAYLAND = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '1',
> '0', d)}"
> +export USE_WAYLAND
> +
> +# if using Wayland, let's use pure Wayland (and not XWayland)
> +# so do not build using X11 flag when we detect Wayland
> +USE_X11 = " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',  '0', \
> +       bb.utils.contains('DISTRO_FEATURES', 'x11',      '1', \
> +                                                        '0', d), d)}"
> +export USE_X11
> +
> +# Use OpenGL ES 2.0 library
> +KIVY_GRAPHICS = "gles"
> +export KIVY_GRAPHICS
> +
> +KIVY_CROSS_SYSROOT="${WORKDIR}/recipe-sysroot"
> +export KIVY_CROSS_SYSROOT
> +
> +DEPENDS += " \
> +    gstreamer1.0 \
> +    gstreamer1.0-python \
> +    libsdl2 \
> +    libsdl2-ttf \
> +    libsdl2-image \
> +    libsdl2-mixer \
> +    pango \
> +    python3 \
> +    python3-cython-native \
> +"
> +
> +RDEPENDS_${PN} = " \
> +    gstreamer1.0 \
> +    gstreamer1.0-python \
> +    libsdl2 \
> +    libsdl2-ttf \
> +    libsdl2-image \
> +    libsdl2-mixer \
> +    pango \
> +    python3 \
> +    python3-docutils \
> +    python3-fcntl \
> +    python3-image \
> +    python3-pillow \
> +    python3-pygments \
> +"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#92832):
> https://lists.openembedded.org/g/openembedded-devel/message/92832
> Mute This Topic: https://lists.openembedded.org/mt/85324963/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000cf4f7105cecbd5d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This RDEPENDS_ syntax is no longer valid, please update to=
 RDEPENDS:.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Sep 2, 2021 at 1:25 PM William Huang &lt;<a href=3D"mail=
to:whuang8933@gmail.com">whuang8933@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0.../0001-add-support-for-glesv2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 24 +++++++<br>
=C2=A0.../python/<a href=3D"http://python3-kivy_2.0.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-kivy_2.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 71 +++++++++++++++++++<br>
=C2=A02 files changed, 95 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-kivy/0=
001-add-support-for-glesv2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-kivy_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kiv=
y_2.0.0.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-kivy/0001-add-supp=
ort-for-glesv2.patch b/meta-python/recipes-devtools/python/python3-kivy/000=
1-add-support-for-glesv2.patch<br>
new file mode 100644<br>
index 000000000..e50c7e7e2<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-kivy/0001-add-support-for=
-glesv2.patch<br>
@@ -0,0 +1,24 @@<br>
+diff --git a/setup.py b/setup.py<br>
+index 9a507c6c4..3f5b70866 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -680,7 +680,18 @@ def determine_gl_flags():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_options[&#39;use_x11&#39;] =3D True<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_options[&#39;use_egl&#39;] =3D True<br=
>
+=C2=A0 =C2=A0 =C2=A0else:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags[&#39;libraries&#39;] =3D [&#39;GL&#39;]=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cross_sysroot:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags[&#39;include_dirs&#39;] =
=3D [cross_sysroot + &#39;/usr/include&#39;]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags[&#39;library_dirs&#39;] =
=3D [cross_sysroot + &#39;/usr/lib&#39;]<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if c_options[&#39;use_opengl_es2&#39;]:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;using GLESv2 librar=
ies&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags[&#39;libraries&#39;] =3D =
[&#39;GLESv2&#39;]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags[&#39;libraries&#39;] =3D =
[&#39;GL&#39;]<br>
++<br>
++<br>
++=C2=A0 =C2=A0 print(&quot;cross_sysroot: &quot; + str(cross_sysroot))<br>
+=C2=A0 =C2=A0 =C2=A0return flags, base_flags<br>
+ <br>
+ <br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
kivy_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.0.0.bb</=
a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-kivy_2.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.0.0.bb</a><br>
new file mode 100644<br>
index 000000000..3f6bafda8<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-kivy_2.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-kivy_2.0.0.bb</a><br>
@@ -0,0 +1,71 @@<br>
+SUMMARY =3D &quot;Open source Python library for rapid development of appl=
ications \<br>
+=C2=A0 =C2=A0 that make use of innovative user interfaces, such as multi-t=
ouch apps.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://kivy.org/" rel=3D"noreferrer" target=
=3D"_blank">https://kivy.org/</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df0c851d60495c7e27225a819e1=
79208a&quot;<br>
+<br>
+inherit setuptools3<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/kivy/kivy.git;protocol=3D=
git" rel=3D"noreferrer" target=3D"_blank">github.com/kivy/kivy.git;protocol=
=3Dgit</a>;\<br>
+&quot;<br>
+<br>
+# Kivy&#39;s setup files only look for GLES libraries for Android, iOS, RP=
i,<br>
+# and mali-based OS&#39;s. We need to patch the setup file to tell Kivy se=
tup<br>
+# that our machine has GLES libaries installed as well<br>
+# Also, if using SDL2 as backend, SDL2 needs to be configured wth gles<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://0001-add-support-for-glesv2.patch \<br>
+&quot;<br>
+SRCREV =3D &quot;dedcb6bcabe3d8d6758dcee607e8c33b174d782b&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+PACKAGES +=3D &quot;${PN}-examples&quot;<br>
+FILES:${PN}-examples =3D &quot;/usr/share/kivy-examples&quot;<br>
+<br>
+USE_WAYLAND =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39=
;wayland&#39;, &#39;1&#39;, &#39;0&#39;, d)}&quot;<br>
+export USE_WAYLAND<br>
+<br>
+# if using Wayland, let&#39;s use pure Wayland (and not XWayland)<br>
+# so do not build using X11 flag when we detect Wayland<br>
+USE_X11 =3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wayland=
&#39;,=C2=A0 &#39;0&#39;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;x11&#39;,=C2=A0 =C2=A0 =C2=A0 &#39;1&#39;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;0&#39;, d), d)}&quot;=
<br>
+export USE_X11<br>
+<br>
+# Use OpenGL ES 2.0 library<br>
+KIVY_GRAPHICS =3D &quot;gles&quot;<br>
+export KIVY_GRAPHICS<br>
+<br>
+KIVY_CROSS_SYSROOT=3D&quot;${WORKDIR}/recipe-sysroot&quot;<br>
+export KIVY_CROSS_SYSROOT<br>
+<br>
+DEPENDS +=3D &quot; \<br>
+=C2=A0 =C2=A0 gstreamer1.0 \<br>
+=C2=A0 =C2=A0 gstreamer1.0-python \<br>
+=C2=A0 =C2=A0 libsdl2 \<br>
+=C2=A0 =C2=A0 libsdl2-ttf \<br>
+=C2=A0 =C2=A0 libsdl2-image \<br>
+=C2=A0 =C2=A0 libsdl2-mixer \<br>
+=C2=A0 =C2=A0 pango \<br>
+=C2=A0 =C2=A0 python3 \<br>
+=C2=A0 =C2=A0 python3-cython-native \<br>
+&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot; \<br>
+=C2=A0 =C2=A0 gstreamer1.0 \<br>
+=C2=A0 =C2=A0 gstreamer1.0-python \<br>
+=C2=A0 =C2=A0 libsdl2 \<br>
+=C2=A0 =C2=A0 libsdl2-ttf \<br>
+=C2=A0 =C2=A0 libsdl2-image \<br>
+=C2=A0 =C2=A0 libsdl2-mixer \<br>
+=C2=A0 =C2=A0 pango \<br>
+=C2=A0 =C2=A0 python3 \<br>
+=C2=A0 =C2=A0 python3-docutils \<br>
+=C2=A0 =C2=A0 python3-fcntl \<br>
+=C2=A0 =C2=A0 python3-image \<br>
+=C2=A0 =C2=A0 python3-pillow \<br>
+=C2=A0 =C2=A0 python3-pygments \<br>
+&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#92832): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/92832" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/92832</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85324963/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85324963/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cf4f7105cecbd5d9--

