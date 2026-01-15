Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A193BD44C76
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 16:08:04 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39572.1768493280617035432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 08:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pk7uKr0n;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso861722d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 08:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768493280; x=1769098080; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DxrJXejJt3PV5IyZaNfghx8IeJVW2A2v5eqUh41WoEI=;
        b=Pk7uKr0nRu5fhlJRy1N4t6RdDmt2EWE2QzVlDbFG1ZZ1CoKCIUKjkaaP3PXq5LmNo8
         X/bYx5CZafv1nN26AB4chMnEfh3/kwL/5nF8su6uVCG0aT4vL0CtvCHUPDRdP8me/wZ4
         FnAtxQqkT/Rej98lijRekRs11OmjWv2b9UDP4nRGqdHHO6Lkc/948SzlknXFS9Cb5a3H
         WJpKm8qFZUm6p1Xr6JSxMqDGiIusR6BIXUJ/cdnunS4fwU6M81CRBvcbMAm76Jdo5jZS
         ZrRZlmCx8sjnVjoHWQThVuDLkb+NQmzC7haeeC2Lrdr/IJngnARMSIZ7zAgc4EjX1AUr
         49Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768493280; x=1769098080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxrJXejJt3PV5IyZaNfghx8IeJVW2A2v5eqUh41WoEI=;
        b=YUU0KpsiWkwgE0xDMPSQraa+aXhIlpBx9mNdYMics8Qn4pfY/q44idkUkR772z7Qrs
         kPIB9sPYwW3HKAceJnokIb5wvZUdMoUgtyf/wvWY+AJtN1v9Cd14iybCj3IJELDs2h8h
         SfeYA13DBLalRsGl4iXeObxz5Hl1TenxKAXF4TtSVslrtn6o2kqPJgbPMtWvUxkHTLEd
         TiD8uqitgvoq/A86kFWYutmUdEblh6jXBI82mQp8thfbszlPpzT92u5uVmZydWv9Igou
         7KBkE+P0VcF0t/No6MPxUKECQy9sHcnTHQn0abiJrHp6qkvX5N49QYvAXiej5ru087/C
         Tv2Q==
X-Gm-Message-State: AOJu0YwVtXbzldJu1bIiOqEX6Q+A8Hd3zBmEWRvtdCdaqfna2mbcFICX
	0hKLBsWyDM3nxPPacAE2Nf6T5sGsi4JVG9uBgfuT49AcLVuggrTKwIo7uZJXq2mIFBsdAks/qfp
	PTq/QXmTfMCjiTjD4n1NSAKHgexghEqh7H5Kl
X-Gm-Gg: AY/fxX4jlfw8a27ZILeETxTcBYfQ0hpJdcBFoh7V44LMCfxUQCjV/AncTUMcCLsGAH2
	9JJPGuq9VmE6ytGe7YsbCZQRygp9mbzG3NpDDwk4Whd68oCyZqDWEFhQQr/rU5Y7AbFEzIgDNrP
	HYi2/LgvTbvKfsbQ/OYYnvGWt5LAmJAE9YZGqj5mHA5KqeOm/HFsQ6lxOQfTrVu1YyhdirtrhuH
	zebtOHkBSb5AtH1JKKmMbdvAZLuV8BIOFoZ+AYzPVd6L8/9Kprh7IYKjFgYm5EvstqZbDlPgN91
	U+4HCtJPT3ErVt+5M9HX7GvXRBVAFy3+JhG8lcOOghAXvweRHgfASZtJhYLtlb9VMPbw3fx/uZD
	r0eGs5Z1FZiEACcvr6eZn1kgqHsa83R7GnuKYD26e1UWabw==
X-Received: by 2002:a05:690e:118b:b0:646:6a79:7955 with SMTP id
 956f58d0204a3-649164f5756mr216635d50.59.1768493279588; Thu, 15 Jan 2026
 08:07:59 -0800 (PST)
MIME-Version: 1.0
References: <20260115103503.200126-1-adam.duskett@amarulasolutions.com> <20260115103503.200126-2-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260115103503.200126-2-adam.duskett@amarulasolutions.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jan 2026 08:07:33 -0800
X-Gm-Features: AZwV_Qh68KZpulDtrkh5EBcV4Km4SPqXAGQMraKzDVmlDqT-dAbjcHsFTBVK43E
Message-ID: <CAMKF1sqEevw=WBZQr4pqu4_a3u_skRbP-JN9+N7QzDp8ZABQrQ@mail.gmail.com>
Subject: Re: [oe] [PATCH v2 2/2] kmscon: Add recipe
To: adam.duskett@amarulasolutions.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b7b60e06486f6d58"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 16:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123513

--000000000000b7b60e06486f6d58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your submission. This fails to build with TOOLCHAIN =3D "clang"

https://errors.yoctoproject.org/Errors/Details/896251/

On Thu, Jan 15, 2026 at 2:40=E2=80=AFAM Adam Duskett via lists.openembedded=
.org
<adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:

> Provide sane defaults that do not have dependencies, such as
> a dummy and terminal session support and basic fbdev support.
>
> kmsconvt@.service must be added separatly or else
> do_rootfs fails with the following error:
>
> ```
> do_rootfs: Postinstall scriptlets of ['kmscon'] have failed. If the
> intention
> is to defer them to first boot, then please place them into
> pkg_postinst_ontarget:${PN} (). Deferring to first boot via 'exit 1' is n=
o
> longer supported.
> ```
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v1 -> v2: add tag=3Dv${PV} to the SRC_URI
>
>  .../recipes-graphics/kmscon/kmscon_9.2.1.bb   | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>
> diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
> b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
> new file mode 100644
> index 0000000000..6c4060763b
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
> @@ -0,0 +1,63 @@
> +SUMMARY =3D "Simple terminal emulator based on linux kernel mode setting
> (KMS)."
> +DESCRIPTION =3D "\
> +    Kmscon is a simple terminal emulator based on linux kernel mode
> setting \
> +    (KMS). It is an attempt to replace the in-kernel VT implementation
> with \
> +    a userspace console. \
> +"
> +HOMEPAGE =3D "https://github.com/kmscon/kmscon"
> +BUGTRACKER =3D "https://github.com/kmscon/kmscon/issues"
> +CVE_PRODUCT =3D "kmscon"
> +
> +SECTION =3D "graphics"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6d4602d249f8a3401040238e98367=
d9e"
> +
> +DEPENDS =3D "\
> +    libtsm \
> +    libxkbcommon \
> +    udev \
> +"
> +
> +SRC_URI =3D "git://
> github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}
> <http://github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%=
7BPV%7D>
> "
> +SRCREV =3D "7d46650dbb0826f9b89de42f879be879391c14fd"
> +
> +inherit meson pkgconfig systemd
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}=
"
> +
> +PACKAGECONFIG[backspace_sends_delete] =3D "-Dbackspace_sends_delete=3Dtr=
ue,
> -Dbackspace_sends_delete=3Dfalse"
> +PACKAGECONFIG[font_pango] =3D "-Dfont_pango=3Denabled, -Dfont_pango=3Ddi=
sabled,
> pango"
> +PACKAGECONFIG[multi_seat] =3D "-Dmulti_seat=3Denabled, -Dmulti_seat=3Ddi=
sabled,
> systemd"
> +PACKAGECONFIG[opengl] =3D "-Drenderer_gltex=3Denabled -Dvideo_drm3d=3Den=
abled,
> -Drenderer_gltex=3Ddisabled -Dvideo_drm3d=3Ddisabled, libdrm virtual/egl
> virtual/libgles2 virtual/libgbm"
> +PACKAGECONFIG[video_drm2d] =3D "-Dvideo_drm2d=3Denabled,
> -Dvideo_drm2d=3Ddisabled, libdrm"
> +
> +EXTRA_OEMESON =3D "\
> +    -Delogind=3Ddisabled \
> +    -Dextra_debug=3Dfalse \
> +    -Dfont_unifont=3Denabled \
> +    -Dsession_dummy=3Denabled \
> +    -Dsession_terminal=3Denabled \
> +    -Dtests=3Dfalse \
> +    -Dvideo_fbdev=3Denabled \
> +"
> +
> +SYSTEMD_SERVICE:${PN} =3D "kmscon.service"
> +FILES:${PN} +=3D "${systemd_system_unitdir}/kmsconvt@.service"
> +
> +do_install:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> +        install -d ${D}${sysconfdir}/systemd/system
> +        ln -sf ${systemd_system_unitdir}/kmsconvt@.service \
> +            ${D}${sysconfdir}/systemd/system/autovt@.service
> +    fi
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false',
> d)}; then
> +        sed -e "s@#drm@drm@g" \
> +            -e "s@#hwaccel@hwaccel@g" \
> +            -e "s@#render-engine=3Dgltex@render-engine=3Dgltex@g" \
> +            -i ${D}${sysconfdir}/kmscon/kmscon.conf
> +    fi
> +}
> +
> +RDEPENDS:${PN} =3D "xkeyboard-config"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123502):
> https://lists.openembedded.org/g/openembedded-devel/message/123502
> Mute This Topic: https://lists.openembedded.org/mt/117277014/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b7b60e06486f6d58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your submission. This fails=C2=A0to build with =
TOOLCHAIN =3D &quot;clang&quot;<div><br></div><div><a href=3D"https://error=
s.yoctoproject.org/Errors/Details/896251/">https://errors.yoctoproject.org/=
Errors/Details/896251/</a></div></div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15, 2026 =
at 2:40=E2=80=AFAM Adam Duskett via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;adam.duskett=3D<a href=3D"mailto:amarulas=
olutions.com@lists.openembedded.org">amarulasolutions.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Provide sane defaults that do not have dependencies, such as<br>
a dummy and terminal session support and basic fbdev support.<br>
<br>
kmsconvt@.service must be added separatly or else<br>
do_rootfs fails with the following error:<br>
<br>
```<br>
do_rootfs: Postinstall scriptlets of [&#39;kmscon&#39;] have failed. If the=
 intention<br>
is to defer them to first boot, then please place them into<br>
pkg_postinst_ontarget:${PN} (). Deferring to first boot via &#39;exit 1&#39=
; is no<br>
longer supported.<br>
```<br>
<br>
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
---<br>
v1 -&gt; v2: add tag=3Dv${PV} to the SRC_URI<br>
<br>
=C2=A0.../recipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1.bb" rel=3D=
"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a>=C2=A0 =C2=A0| 63 +++++++=
++++++++++++<br>
=C2=A01 file changed, 63 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/kmscon/<a href=3D"http://=
kmscon_9.2.1.bb" rel=3D"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a><b=
r>
<br>
diff --git a/meta-oe/recipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1=
.bb" rel=3D"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a> b/meta-oe/rec=
ipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1.bb" rel=3D"noreferrer" =
target=3D"_blank">kmscon_9.2.1.bb</a><br>
new file mode 100644<br>
index 0000000000..6c4060763b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a><br>
@@ -0,0 +1,63 @@<br>
+SUMMARY =3D &quot;Simple terminal emulator based on linux kernel mode sett=
ing (KMS).&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+=C2=A0 =C2=A0 Kmscon is a simple terminal emulator based on linux kernel m=
ode setting \<br>
+=C2=A0 =C2=A0 (KMS). It is an attempt to replace the in-kernel VT implemen=
tation with \<br>
+=C2=A0 =C2=A0 a userspace console. \<br>
+&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/kmscon/kmscon" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/kmscon/kmscon</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/kmscon/kmscon/issues" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/kmscon/kmscon/issues=
</a>&quot;<br>
+CVE_PRODUCT =3D &quot;kmscon&quot;<br>
+<br>
+SECTION =3D &quot;graphics&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6d4602d249f8a3401040238e98=
367d9e&quot;<br>
+<br>
+DEPENDS =3D &quot;\<br>
+=C2=A0 =C2=A0 libtsm \<br>
+=C2=A0 =C2=A0 libxkbcommon \<br>
+=C2=A0 =C2=A0 udev \<br>
+&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/kmscon/kmscon;protoco=
l=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}</a=
>&quot;<br>
+SRCREV =3D &quot;7d46650dbb0826f9b89de42f879be879391c14fd&quot;<br>
+<br>
+inherit meson pkgconfig systemd<br>
+<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;opengl&#39;, d)}&quot;<br>
+<br>
+PACKAGECONFIG[backspace_sends_delete] =3D &quot;-Dbackspace_sends_delete=
=3Dtrue, -Dbackspace_sends_delete=3Dfalse&quot;<br>
+PACKAGECONFIG[font_pango] =3D &quot;-Dfont_pango=3Denabled, -Dfont_pango=
=3Ddisabled, pango&quot;<br>
+PACKAGECONFIG[multi_seat] =3D &quot;-Dmulti_seat=3Denabled, -Dmulti_seat=
=3Ddisabled, systemd&quot;<br>
+PACKAGECONFIG[opengl] =3D &quot;-Drenderer_gltex=3Denabled -Dvideo_drm3d=
=3Denabled, -Drenderer_gltex=3Ddisabled -Dvideo_drm3d=3Ddisabled, libdrm vi=
rtual/egl virtual/libgles2 virtual/libgbm&quot;<br>
+PACKAGECONFIG[video_drm2d] =3D &quot;-Dvideo_drm2d=3Denabled, -Dvideo_drm2=
d=3Ddisabled, libdrm&quot;<br>
+<br>
+EXTRA_OEMESON =3D &quot;\<br>
+=C2=A0 =C2=A0 -Delogind=3Ddisabled \<br>
+=C2=A0 =C2=A0 -Dextra_debug=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dfont_unifont=3Denabled \<br>
+=C2=A0 =C2=A0 -Dsession_dummy=3Denabled \<br>
+=C2=A0 =C2=A0 -Dsession_terminal=3Denabled \<br>
+=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dvideo_fbdev=3Denabled \<br>
+&quot;<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;kmscon.service&quot;<br>
+FILES:${PN} +=3D &quot;${systemd_system_unitdir}/kmsconvt@.service&quot;<b=
r>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;syst=
emd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/systemd/system<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${systemd_system_unitdir}/kmsconvt@.ser=
vice \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/systemd/system=
/autovt@.service<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;opengl=
&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &quot;s@#drm@drm@g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s@#hwaccel@hwaccel@g&qu=
ot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s@#render-engine=3Dglte=
x@render-engine=3Dgltex@g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${sysconfdir}/kmscon/kmsc=
on.conf<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+RDEPENDS:${PN} =3D &quot;xkeyboard-config&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123502): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123502" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123502</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117277014/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117277014/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b7b60e06486f6d58--

