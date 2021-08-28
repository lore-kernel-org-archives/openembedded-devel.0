Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.1293.1630136684154209287
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 00:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WrTqsxMM;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id lc21so18991055ejc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Aug 2021 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0gxmQ/NtUA2dGlPYWJnyWtmHIFr1Ng2oH3EeshtNwFc=;
        b=WrTqsxMMu86aSZ6tCQ2hftNv5yZes6eFRs8hKoIvO7HUnEDv4+xUNJsqxua99cux/q
         Z0i5mt9ceQ0l4hMQIuavcqz/zXYDX0VYTSFiJlhEmDy18618//x3/CBJKZHbVUle1B73
         4c94eRcrsyyLwToTAdyziGjHPY2ayQlWDglbTTI9MXbtOOIbRNTRh1l/4AVoZYiEom57
         xFpbBSUqDaQHXvYuFeuVE8cHp9TcvtTfvxDBStkA829lSVTPTyrZ3fKCSNEZ1jv4gpuA
         0BFW4/ppHTiKnLNX+1KCu06XmdFIVYWKneug5eI67wurvUA1+DCLl5+QciRut5tDp34e
         yOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0gxmQ/NtUA2dGlPYWJnyWtmHIFr1Ng2oH3EeshtNwFc=;
        b=nzTrjlWxoWP3YDD8WrQ+iEHP8jJY6e5NTGaPTxe3onyNIZGe8Y7GVFDtKHxjo6qbpZ
         2FwxGgQeC06fF9FENAUskHGLJ4pFHZLwQW8Dr7excQAbXR7oxRDEkaJzI50w+KWDGDHY
         4YsyObqsjc8zH/uzm1IbpxBwCOuJnYVGlSkfhEXKWIB/ZFXBjmNLj9EcTorSwqjr8qdH
         m/8OoiDkbAv2JsT+GuQTov5rm39YNOZTw67+HYUvuF58tRj9OVhYLQZCR2gG6LqX16hH
         Fm8agZVLqyRME3uOwa2g6AeNpi3edLYEf34c+9gLvWKdNmaPPLgL3yi9otg4Z2IBngZP
         Zs3g==
X-Gm-Message-State: AOAM533Qvn6o7mGCC798KqijLLMRYgdgGmpUFnKpZInmXxyTa9tj+UdF
	AXHBXbHhci71n/4/r0BdaqY6zAaJFkcO1qWjIA0=
X-Google-Smtp-Source: ABdhPJyxbKuU0vD+yhQwbLzCL46cEXh3Vtk8GTl3+NwtCONjaZrlaNQhMak1nzUC8UzpTLJlw4zLNGnY1tuJMDUjXmA=
X-Received: by 2002:a17:907:990d:: with SMTP id ka13mr14300514ejc.392.1630136682476;
 Sat, 28 Aug 2021 00:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210824202648.22554-1-pkj@axis.com>
In-Reply-To: <20210824202648.22554-1-pkj@axis.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 28 Aug 2021 09:44:31 +0200
Message-ID: <CA+chaQeo6qcG7YJrW5+NiXrYXGNg6SFQmZtb2Wy00KpNtJaOgg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] gpsd: Let scons install the udev and systemd files
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e4f74405ca99c58d"

--000000000000e4f74405ca99c58d
Content-Type: text/plain; charset="UTF-8"

This breaks the build without systemd enabled.

mkdir -p
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/image/usr/lib/udev/rules.d
cp
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/gpsd-3.23/gpsd-3.23/gpsd.rules
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/image/usr/lib/udev/rules.d/25-gpsd.rules
cp
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/gpsd-3.23/gpsd-3.23/gpsd.hotplug
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/image/usr/lib/udev
cp: cannot stat
'/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/gpsd-3.23/gpsd-3.23/gpsd.hotplug':
No such file or directory
scons: *** [gpsd-3.23/udev-install] Error 1

scons fails to install gpsd.hotplug with:

if env['systemd']:
...
    hotplug_wrapper_install = []
else:
    hotplug_wrapper_install = [
        'cp $SRCDIR/gpsd.hotplug ' + DESTDIR + env['udevdir'],
        'chmod a+x ' + DESTDIR + env['udevdir'] + '/gpsd.hotplug'
    ]

because SRCDIR is set to cwd as
gpsd/3.23-r0/gpsd-3.23/gpsd-3.23/
but the gpsd.hotplug is only in source directory one level above as:
gpsd/3.23-r0/gpsd-3.23/gpsd.hotplug

It's also not clear why do_install:append installs gpsd.hotplug _again_ for
sysvinit after scons did (once it's fixed) or if it's needed for systemd as
Sconscript explicitly doesn't install hotplug when systemd is enabled.

On Tue, Aug 24, 2021 at 10:26 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> With the update to 3.23 (commit 87f3070f), the recipe was changed to
> incorrectly install the gpsd.rules.in file instead of gpsd.rules. It
> also missed that a new template string (@RUNDIR@) was introduced in the
> systemd files, making them unusable.
>
> Instead of trying to keep up with upstream changes, let scons do the job
> and install the udev and systemd files by using the "udev-install"
> production instead of "install".
>
> In addition to the correct files being installed,
> "/etc/udev/rules.d/gpsd.rules" is now "/lib/udev/rules.d/25-gpsd.rules".
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb | 45 ++++++++------------
>  1 file changed, 18 insertions(+), 27 deletions(-)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
> b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
> index 1d031ee95..350eaaf12 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
> @@ -35,11 +35,13 @@ EXTRA_OESCONS = " \
>      nostrip='true' \
>      systemd='${SYSTEMD_OESCONS}' \
>      libdir='${libdir}' \
> +    udevdir='${nonarch_base_libdir}/udev' \
> +    unitdir='${systemd_system_unitdir}' \
>      manbuild='false' \
>      LINK='${CC}' \
>      ${PACKAGECONFIG_CONFARGS} \
>  "
> -# this cannot be used, because then chrpath is not found and only static
> lib is built
> +# This cannot be used, because then chrpath is not found and only static
> lib is built
>  # target=${HOST_SYS}
>
>  do_compile:prepend() {
> @@ -58,34 +60,24 @@ do_install() {
>      export LINKFLAGS="${LDFLAGS}"
>
>      export DESTDIR="${D}"
> -    # prefix is used for RPATH and DESTDIR/prefix for instalation
> -    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix}
> python_libdir=${libdir} install ${EXTRA_OESCONS} || \
> +    # prefix is used for RPATH and DESTDIR/prefix for installation
> +    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix}
> python_libdir=${libdir} udev-install ${EXTRA_OESCONS} || \
>        bbfatal "scons install execution failed."
>  }
>
>  do_install:append() {
> -    install -d ${D}/${sysconfdir}/init.d
> -    install -m 0755 ${WORKDIR}/gpsd.init ${D}/${sysconfdir}/init.d/gpsd
> -    install -d ${D}/${sysconfdir}/default
> -    install -m 0644 ${S}/packaging/deb/etc_default_gpsd
> ${D}/${sysconfdir}/default/gpsd.default
> -
> -    #support for udev
> -    install -d ${D}/${sysconfdir}/udev/rules.d
> -    install -m 0644 ${S}/gpsd.rules.in ${D}/${sysconfdir}/udev/rules.d/
> -    install -d ${D}${base_libdir}/udev/
> -    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
> -
> -    #support for python
> -    install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
> -    install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
> -
> -    #support for systemd
> -    install -d ${D}${systemd_unitdir}/system/
> -    install -m 0644 ${S}/systemd/${BPN}.service.in
> ${D}${systemd_unitdir}/system/${BPN}.service
> -    sed -i -e 's,@SBINDIR@,/usr/sbin,g'
> ${D}${systemd_unitdir}/system/${BPN}.service
> -    install -m 0644 ${S}/systemd/${BPN}ctl@.service.in
> ${D}${systemd_unitdir}/system/${BPN}ctl@.service
> -    sed -i -e 's,@SBINDIR@,/usr/sbin,g'
> ${D}${systemd_unitdir}/system/${BPN}ctl@.service
> -    install -m 0644 ${S}/systemd/${BPN}.socket.in
> ${D}${systemd_unitdir}/system/${BPN}.socket
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/gpsd.init ${D}${sysconfdir}/init.d/gpsd
> +    install -d ${D}${sysconfdir}/default
> +    install -m 0644 ${S}/packaging/deb/etc_default_gpsd
> ${D}${sysconfdir}/default/gpsd.default
> +
> +    # Support for udev
> +    install -d ${D}${nonarch_base_libdir}/udev
> +    install -m 0755 ${S}/gpsd.hotplug ${D}${nonarch_base_libdir}/udev
> +
> +    # Support for python
> +    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/gps
> +    install -m 755 ${S}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
>  }
>
>  PACKAGES =+ "libgps libgpsd python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl
> gps-utils"
> @@ -99,7 +91,7 @@ RDEPENDS:${PN} = "gpsd-gpsctl"
>  RRECOMMENDS:${PN} = "gpsd-conf gpsd-udev gpsd-machine-conf"
>
>  SUMMARY:gpsd-udev = "udev relevant files to use gpsd hotplugging"
> -FILES:gpsd-udev = "${base_libdir}/udev ${sysconfdir}/udev/*"
> +FILES:gpsd-udev = "${nonarch_base_libdir}/udev"
>  RDEPENDS:gpsd-udev += "udev gpsd-conf"
>
>  SUMMARY:libgpsd = "C service library used for communicating with gpsd"
> @@ -135,7 +127,6 @@ RREPLACES:${PN} += "${PN}-systemd"
>  RCONFLICTS:${PN} += "${PN}-systemd"
>  SYSTEMD_SERVICE:${PN} = "${BPN}.socket ${BPN}ctl@.service"
>
> -
>  ALTERNATIVE:${PN} = "gpsd-defaults"
>  ALTERNATIVE_LINK_NAME[gpsd-defaults] = "${sysconfdir}/default/gpsd"
>  ALTERNATIVE_TARGET[gpsd-defaults] = "${sysconfdir}/default/gpsd.default"
>
> 
>
>

--000000000000e4f74405ca99c58d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks the build without systemd enabled.<div><br></d=
iv><div>mkdir -p /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.=
23-r0/image/usr/lib/udev/rules.d<br>cp /OE/build/oe-core/tmp-glibc/work/cor=
e2-64-oe-linux/gpsd/3.23-r0/gpsd-3.23/gpsd-3.23/gpsd.rules /OE/build/oe-cor=
e/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/image/usr/lib/udev/rules.d/=
25-gpsd.rules<br>cp /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd=
/3.23-r0/gpsd-3.23/gpsd-3.23/gpsd.hotplug /OE/build/oe-core/tmp-glibc/work/=
core2-64-oe-linux/gpsd/3.23-r0/image/usr/lib/udev<br>cp: cannot stat &#39;/=
OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/gpsd/3.23-r0/gpsd-3.23/gp=
sd-3.23/gpsd.hotplug&#39;: No such file or directory<br>scons: *** [gpsd-3.=
23/udev-install] Error 1<br></div><div><br></div><div>scons fails to instal=
l gpsd.hotplug with:</div><div><br></div><div>if env[&#39;systemd&#39;]:<br=
>...<br>=C2=A0 =C2=A0 hotplug_wrapper_install =3D []<br>else:<br>=C2=A0 =C2=
=A0 hotplug_wrapper_install =3D [<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;cp $S=
RCDIR/gpsd.hotplug &#39; + DESTDIR + env[&#39;udevdir&#39;],<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;chmod a+x &#39; + DESTDIR + env[&#39;udevdir&#39;] +=
 &#39;/gpsd.hotplug&#39;<br>=C2=A0 =C2=A0 ]<br></div><div><br></div><div>be=
cause SRCDIR is set to cwd as</div><div>gpsd/3.23-r0/gpsd-3.23/gpsd-3.23/<b=
r></div><div>but the gpsd.hotplug is only in source directory one level abo=
ve as:</div><div>gpsd/3.23-r0/gpsd-3.23/gpsd.hotplug<br></div><div><br></di=
v><div>It&#39;s also not clear why do_install:append installs gpsd.hotplug =
_again_ for sysvinit after scons did (once it&#39;s fixed) or if it&#39;s n=
eeded for systemd as Sconscript explicitly doesn&#39;t install hotplug when=
 systemd is enabled.</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Aug 24, 2021 at 10:26 PM Peter Kjellerste=
dt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@ax=
is.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">With the update to 3.23 (commit 87f3070f), the recipe was changed to<=
br>
incorrectly install the <a href=3D"http://gpsd.rules.in" rel=3D"noreferrer"=
 target=3D"_blank">gpsd.rules.in</a> file instead of gpsd.rules. It<br>
also missed that a new template string (@RUNDIR@) was introduced in the<br>
systemd files, making them unusable.<br>
<br>
Instead of trying to keep up with upstream changes, let scons do the job<br=
>
and install the udev and systemd files by using the &quot;udev-install&quot=
;<br>
production instead of &quot;install&quot;.<br>
<br>
In addition to the correct files being installed,<br>
&quot;/etc/udev/rules.d/gpsd.rules&quot; is now &quot;/lib/udev/rules.d/25-=
gpsd.rules&quot;.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.23.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.23.bb</a> | 45 ++++++++-----------=
-<br>
=C2=A01 file changed, 18 insertions(+), 27 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.23.bb=
" rel=3D"noreferrer" target=3D"_blank">gpsd_3.23.bb</a> b/meta-oe/recipes-n=
avigation/gpsd/<a href=3D"http://gpsd_3.23.bb" rel=3D"noreferrer" target=3D=
"_blank">gpsd_3.23.bb</a><br>
index 1d031ee95..350eaaf12 100644<br>
--- a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.23.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.23.bb</a><br>
+++ b/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.23.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.23.bb</a><br>
@@ -35,11 +35,13 @@ EXTRA_OESCONS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0nostrip=3D&#39;true&#39; \<br>
=C2=A0 =C2=A0 =C2=A0systemd=3D&#39;${SYSTEMD_OESCONS}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0libdir=3D&#39;${libdir}&#39; \<br>
+=C2=A0 =C2=A0 udevdir=3D&#39;${nonarch_base_libdir}/udev&#39; \<br>
+=C2=A0 =C2=A0 unitdir=3D&#39;${systemd_system_unitdir}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0manbuild=3D&#39;false&#39; \<br>
=C2=A0 =C2=A0 =C2=A0LINK=3D&#39;${CC}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0${PACKAGECONFIG_CONFARGS} \<br>
=C2=A0&quot;<br>
-# this cannot be used, because then chrpath is not found and only static l=
ib is built<br>
+# This cannot be used, because then chrpath is not found and only static l=
ib is built<br>
=C2=A0# target=3D${HOST_SYS}<br>
<br>
=C2=A0do_compile:prepend() {<br>
@@ -58,34 +60,24 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0export LINKFLAGS=3D&quot;${LDFLAGS}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0export DESTDIR=3D&quot;${D}&quot;<br>
-=C2=A0 =C2=A0 # prefix is used for RPATH and DESTDIR/prefix for instalatio=
n<br>
-=C2=A0 =C2=A0 ${STAGING_BINDIR_NATIVE}/scons prefix=3D${prefix} python_lib=
dir=3D${libdir} install ${EXTRA_OESCONS} || \<br>
+=C2=A0 =C2=A0 # prefix is used for RPATH and DESTDIR/prefix for installati=
on<br>
+=C2=A0 =C2=A0 ${STAGING_BINDIR_NATIVE}/scons prefix=3D${prefix} python_lib=
dir=3D${libdir} udev-install ${EXTRA_OESCONS} || \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;scons install execution failed.&qu=
ot;<br>
=C2=A0}<br>
<br>
=C2=A0do_install:append() {<br>
-=C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/init.d<br>
-=C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/gpsd.init ${D}/${sysconfdir}/init=
.d/gpsd<br>
-=C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/default<br>
-=C2=A0 =C2=A0 install -m 0644 ${S}/packaging/deb/etc_default_gpsd ${D}/${s=
ysconfdir}/default/gpsd.default<br>
-<br>
-=C2=A0 =C2=A0 #support for udev<br>
-=C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/udev/rules.d<br>
-=C2=A0 =C2=A0 install -m 0644 ${S}/<a href=3D"http://gpsd.rules.in" rel=3D=
"noreferrer" target=3D"_blank">gpsd.rules.in</a> ${D}/${sysconfdir}/udev/ru=
les.d/<br>
-=C2=A0 =C2=A0 install -d ${D}${base_libdir}/udev/<br>
-=C2=A0 =C2=A0 install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/<b=
r>
-<br>
-=C2=A0 =C2=A0 #support for python<br>
-=C2=A0 =C2=A0 install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps<br>
-=C2=A0 =C2=A0 install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}=
/gps<br>
-<br>
-=C2=A0 =C2=A0 #support for systemd<br>
-=C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system/<br>
-=C2=A0 =C2=A0 install -m 0644 ${S}/systemd/${BPN}.<a href=3D"http://servic=
e.in" rel=3D"noreferrer" target=3D"_blank">service.in</a> ${D}${systemd_uni=
tdir}/system/${BPN}.service<br>
-=C2=A0 =C2=A0 sed -i -e &#39;s,@SBINDIR@,/usr/sbin,g&#39; ${D}${systemd_un=
itdir}/system/${BPN}.service<br>
-=C2=A0 =C2=A0 install -m 0644 ${S}/systemd/${BPN}ctl@.<a href=3D"http://se=
rvice.in" rel=3D"noreferrer" target=3D"_blank">service.in</a> ${D}${systemd=
_unitdir}/system/${BPN}ctl@.service<br>
-=C2=A0 =C2=A0 sed -i -e &#39;s,@SBINDIR@,/usr/sbin,g&#39; ${D}${systemd_un=
itdir}/system/${BPN}ctl@.service<br>
-=C2=A0 =C2=A0 install -m 0644 ${S}/systemd/${BPN}.<a href=3D"http://socket=
.in" rel=3D"noreferrer" target=3D"_blank">socket.in</a> ${D}${systemd_unitd=
ir}/system/${BPN}.socket<br>
+=C2=A0 =C2=A0 install -d ${D}${sysconfdir}/init.d<br>
+=C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/gpsd.init ${D}${sysconfdir}/init.=
d/gpsd<br>
+=C2=A0 =C2=A0 install -d ${D}${sysconfdir}/default<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/packaging/deb/etc_default_gpsd ${D}${sy=
sconfdir}/default/gpsd.default<br>
+<br>
+=C2=A0 =C2=A0 # Support for udev<br>
+=C2=A0 =C2=A0 install -d ${D}${nonarch_base_libdir}/udev<br>
+=C2=A0 =C2=A0 install -m 0755 ${S}/gpsd.hotplug ${D}${nonarch_base_libdir}=
/udev<br>
+<br>
+=C2=A0 =C2=A0 # Support for python<br>
+=C2=A0 =C2=A0 install -d ${D}${PYTHON_SITEPACKAGES_DIR}/gps<br>
+=C2=A0 =C2=A0 install -m 755 ${S}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/=
gps<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES =3D+ &quot;libgps libgpsd python3-pygps gpsd-udev gpsd-conf =
gpsd-gpsctl gps-utils&quot;<br>
@@ -99,7 +91,7 @@ RDEPENDS:${PN} =3D &quot;gpsd-gpsctl&quot;<br>
=C2=A0RRECOMMENDS:${PN} =3D &quot;gpsd-conf gpsd-udev gpsd-machine-conf&quo=
t;<br>
<br>
=C2=A0SUMMARY:gpsd-udev =3D &quot;udev relevant files to use gpsd hotpluggi=
ng&quot;<br>
-FILES:gpsd-udev =3D &quot;${base_libdir}/udev ${sysconfdir}/udev/*&quot;<b=
r>
+FILES:gpsd-udev =3D &quot;${nonarch_base_libdir}/udev&quot;<br>
=C2=A0RDEPENDS:gpsd-udev +=3D &quot;udev gpsd-conf&quot;<br>
<br>
=C2=A0SUMMARY:libgpsd =3D &quot;C service library used for communicating wi=
th gpsd&quot;<br>
@@ -135,7 +127,6 @@ RREPLACES:${PN} +=3D &quot;${PN}-systemd&quot;<br>
=C2=A0RCONFLICTS:${PN} +=3D &quot;${PN}-systemd&quot;<br>
=C2=A0SYSTEMD_SERVICE:${PN} =3D &quot;${BPN}.socket ${BPN}ctl@.service&quot=
;<br>
<br>
-<br>
=C2=A0ALTERNATIVE:${PN} =3D &quot;gpsd-defaults&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[gpsd-defaults] =3D &quot;${sysconfdir}/default/=
gpsd&quot;<br>
=C2=A0ALTERNATIVE_TARGET[gpsd-defaults] =3D &quot;${sysconfdir}/default/gps=
d.default&quot;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e4f74405ca99c58d--
