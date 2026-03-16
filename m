Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7782F30275
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 21:20:05 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62180.1773695996004346968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 14:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CKJlRWBo;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79800183233so1962387b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 14:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773695995; cv=none;
        d=google.com; s=arc-20240605;
        b=b2P9KGDjm4t79FhhPSM1+Dbg1Rjwu0GivxJNM/3RmQMuKDxi8VncyIOApbvz2SR03T
         0uGsJnyD2nYunEInvAc8VG5FCXLz39PZeRTah01DGohJLFOARbcpfEdEiTLpW2HZ7+D1
         0Zgn10JfICNf7yKbFxZEFt+ACHryVbVXFfiMoe9tvKIO2VebvenfSOkdNAh+5+XVTgB5
         z/Sks0maFkJq18Wj0mJHSxe+2HxvUa3Jcg76VjnnbRT9i/h0nD8M7ci0Ld6MdQcSxFtF
         yckYCrYriuxQmd6nCW2ZcmlTTli92w0vmw7ua6V14xCGqAMjXM6K+g0/+ZyEyA7WhC4K
         irpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hze2UWusfTjIbQEQLsKriAXdRC53BGh9Qr+ZCBpXs3Y=;
        fh=BEBFwkwtsgtmn/IK7qm0h1qMjq6PlQs3QdOyso8NM2w=;
        b=WuT1apxo/nVvjfMfvFxzsv/8Gq5aZpG90xMSmMyZAdici9IkuiDXrBTYXe6s77zPhJ
         qlRR/KxK1rGSxZyIEuyOwVcgvIC6SxN+hPTzPgDPpBIENx1hpPBIbqPW6geooOOA42hh
         pHTwucmz7dOJ7rsf5nvA2xC7IVlr4aZRIr4xPVo3aWODJ9kJ120iN1n0kJsqYS79bl5x
         bx4zXGAsf8jJ2nK1SFmpBh412LyXOT8RLgvPJOCmMNEI81GPTeUSXZWsioZg+EdLXdtx
         YpnQvYVa7yOWhyqyimsxDZQNaBgmW0WKxpsXbzjlr8Lh/3SwaEs1PPeQBf9D3BazrZs5
         28eQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773695995; x=1774300795; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hze2UWusfTjIbQEQLsKriAXdRC53BGh9Qr+ZCBpXs3Y=;
        b=CKJlRWBoVlnFLWwubIF31B+D2rU7rA3HoThwu3bjzxK3JJyjG+xIp23Pt2czhYa+JP
         mfr4ZdsNPeYIPufno3KiSHD1//a//qx7nh7I4RfsHYYwx/2Go4Mlrj6ugEyBdowD1zMX
         5b/JLKrvsfOSr2oyhoNyGMP/3qydbjdQHZrd8SUbOFUAQbKElRfgJjAxPOVc67BEL+dK
         0LvG/rhEADgDhWx3a/lIMOYOOCJxDQD83dvqFuoWgme5sFSo5t9ouCCoMX6IEx5yU2Wa
         nco5C8QT+zL7KxNrG17vvTdz0Ls3FaMjct9N+mjnGiomi9Bb5m3ObEaTJPYZxZfTYNIj
         8DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773695995; x=1774300795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hze2UWusfTjIbQEQLsKriAXdRC53BGh9Qr+ZCBpXs3Y=;
        b=I8nuyATAsSzTdOIoIi+QR46aDGzMV8UrUSDyYzhs/gVvGt6GkwY4WXlHnXglLyhjZ9
         GZPCSj4Yv0XLSe4GJmvx2Nu+BxRO6ADmcgx8/8NljPKKhMJXCh5ADf9a5ECoTUnb2k9h
         ISBQaGNKL+9vh7W4BY3N4UQi5BA90Wkne9EP+Ez6vIH92fax6/1AkNxLJLfEe8ZMKx7s
         cB6ORABr2zj1NZmMEfmDIkB4un9gvGgsSbrD+erqDHJ9fYBh2u6mtx5rVcJMoD1N74w2
         MQDwK7ixWBWvqmKV0+zp/SX/MSlV9edZLHMUAaQW7I4ABM0giS+1pRlwZ+66jl2OnbFA
         7aaw==
X-Gm-Message-State: AOJu0Yy6PSopDFn5KduGvuFq7UBFdpIZHlgyTM2+AdHESUxNz/SZcnIQ
	FU6JC7xKbv33ce28yy1dgOMcaymCibladEEZCjra2Y8Pp57U2/IdFlNSV3Ptr5cUapf1D8KxyOx
	krx05qICXctG8e3xrXi7AyVpGrXequMt5RQ==
X-Gm-Gg: ATEYQzzxbvO5IkG4X/6PxDVJTamXi5SA6YcmR9MT9WLsF6/g1Ps3eyQ3eUMVrDk2VVG
	aWVr6lfT2R9rAdVTa77ie8iuuGuPTMhV+Jp+/KDdIhG2XK5jysX1FF8u62GWQhbszSKzkeXI0ml
	ikHitknwfip2m24ODAouIvwz94Bb5ftQJmqbU8agrHJCSx6IqqFmcY261/YTCwAyWl4Wf+dEmro
	YJmmftiBElaq7I+3uHWWhHE3zyJJCK0YVGrs28TqBb1R03h8Nr41DhOT4nrLcd9aNfR+3P07t8b
	YI2o1n5yJuSs+839rXoW3P6zjDu+MyFRC/T+IMtqYNaU8DtSoEu3s5xlDVdJaMP/AqCe7xf0reX
	/x7HeGm6DOOVfTQfsBn34O/zW
X-Received: by 2002:a05:690c:67c7:b0:796:335a:895 with SMTP id
 00721157ae682-79a61789c43mr11089667b3.6.1773695994900; Mon, 16 Mar 2026
 14:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260316192249.3950474-1-danismostlikely@gmail.com>
In-Reply-To: <20260316192249.3950474-1-danismostlikely@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2026 14:19:27 -0700
X-Gm-Features: AaiRm51dEpym3kmc-PMEhhGf6h8tl-6e4r-ZJYX5vFIQ8p0qLOgHbezU9bIRbqA
Message-ID: <CAMKF1sqA082C4CBoT8VrSJB5AC5yXMN=CH4BVL3Lwe2Km8Y3MQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libfido2-initial: new recipe
To: danismostlikely@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Dan McGregor <danmcgr@protonmail.com>
Content-Type: multipart/alternative; boundary="000000000000b73704064d2ac7e1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 21:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125292

--000000000000b73704064d2ac7e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase it on top of master-next and resend.

On Mon, Mar 16, 2026 at 12:23=E2=80=AFPM Dan McGregor via lists.openembedde=
d.org
<danismostlikely=3Dgmail.com@lists.openembedded.org> wrote:

> From: Dan McGregor <danmcgr@protonmail.com>
>
> Use this recipe to break a circular dependency between libfido2 and
> systemd when systemd's fido PACKAGECONFIG is enabled. systemd depends
> on libfido2, and libfido2 depends on udev provided by systemd. However,
> systemd only depends on the headers provided by libfido2 and its pkgconf
> data. systemd uses only the datatypes provided, and opportunistically
> enables fido support if libfido2 is found.
>
> This recipe provides only the headers and pkgconf data. This is
> sufficient to allow systemd to build support for libfido2.
>
> It only works with a related change I've submitted to openembedded core.
>
> Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
> ---
>  .../libfido2/libfido2-initial_1.16.0.bb       | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libfido2/
> libfido2-initial_1.16.0.bb
>
> diff --git a/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
> b/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
> new file mode 100644
> index 00000000000..7d9838b003b
> --- /dev/null
> +++ b/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "FIDO 2.0 support library"
> +DESCRIPTION =3D "libfido2 provides library functionality and command-lin=
e
> tools to \
> +communicate with a FIDO device over USB, and to verify attestation and \
> +assertion signatures."
> +HOMEPAGE =3D "https://developers.yubico.com/libfido2"
> +LICENSE =3D "BSD-2-Clause"
> +SECTION =3D "libs/network"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D20be19aaa222f71738712b26f7f87=
17b"
> +
> +SRC_URI =3D "
> https://developers.yubico.com/${BPN}/Releases/${BPN}-${PV}.tar.gz"
> +SRC_URI[sha256sum] =3D
> "8c2b6fb279b5b42e9ac92ade71832e485852647b53607c43baaafbbcecea04e4"
> +
> +inherit nopackages
> +
> +PACKAGES =3D ""
> +
> +# The purpose of this recipe is to break a circular dependency between
> libfido2 and
> +# systemd. libfido2 depends on udev (provided by systemd) to build, whil=
e
> systemd
> +# depends on libfido2 if the fido feature is enabled. However, systemd
> doesn't
> +# actually link against libfido2. It only needs the headers in place and
> a dummy
> +# shared library. It opportunistically dlopens libfido2 if it's present,
> but
> +# for that to work it needs the headers in place.
> +# Just fake enough to make systemd happy, and have it RRECOMMEND the rea=
l
> libfido2.
> +do_install() {
> +    mkdir -p ${D}${includedir}/libfido2-initial/fido
> +    mkdir -p ${D}${datadir}/pkgconfig
> +
> +    install -m 644 ${S}/src/fido.h ${D}${includedir}/libfido2-initial
> +    install -m 644 ${S}/src/fido/*
> ${D}${includedir}/libfido2-initial/fido/
> +
> +    # Real libfido2 installs its pkg conf file in ${libdir}.
> +    sed -e 's,@CMAKE_INSTALL_PREFIX@,${exec_prefix},' \
> +        -e 's,@CMAKE_INSTALL_LIBDIR@,${baselib}/libfido2-initial,' \
> +        -e 's,@FIDO_VERSION@,${PV},' \
> +        -e 's,@PROJECT_NAME@,${BPN},' \
> +        -e '/^Cflags/s,$,/libfido2-initial,' \
> +        ${S}/src/libfido2.pc.in > ${D}${datadir}/pkgconfig/libfido2.pc
> +
> +}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125285):
> https://lists.openembedded.org/g/openembedded-devel/message/125285
> Mute This Topic: https://lists.openembedded.org/mt/118351906/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b73704064d2ac7e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase it on top of master-next and resend.</div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 16, 2026 at 12:23=E2=80=AFPM Dan McGregor via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;dan=
ismostlikely=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Dan McGregor &lt;<a href=3D"mailto:danmcgr@pr=
otonmail.com" target=3D"_blank">danmcgr@protonmail.com</a>&gt;<br>
<br>
Use this recipe to break a circular dependency between libfido2 and<br>
systemd when systemd&#39;s fido PACKAGECONFIG is enabled. systemd depends<b=
r>
on libfido2, and libfido2 depends on udev provided by systemd. However,<br>
systemd only depends on the headers provided by libfido2 and its pkgconf<br=
>
data. systemd uses only the datatypes provided, and opportunistically<br>
enables fido support if libfido2 is found.<br>
<br>
This recipe provides only the headers and pkgconf data. This is<br>
sufficient to allow systemd to build support for libfido2.<br>
<br>
It only works with a related change I&#39;ve submitted to openembedded core=
.<br>
<br>
Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:danmcgr@protonmail.com" t=
arget=3D"_blank">danmcgr@protonmail.com</a>&gt;<br>
---<br>
=C2=A0.../libfido2/<a href=3D"http://libfido2-initial_1.16.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">libfido2-initial_1.16.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 40 +++++++++++++++++++<br>
=C2=A01 file changed, 40 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libfido2/<a href=3D"http:/=
/libfido2-initial_1.16.0.bb" rel=3D"noreferrer" target=3D"_blank">libfido2-=
initial_1.16.0.bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/libfido2/<a href=3D"http://libfido2-in=
itial_1.16.0.bb" rel=3D"noreferrer" target=3D"_blank">libfido2-initial_1.16=
.0.bb</a> b/meta-oe/recipes-support/libfido2/<a href=3D"http://libfido2-ini=
tial_1.16.0.bb" rel=3D"noreferrer" target=3D"_blank">libfido2-initial_1.16.=
0.bb</a><br>
new file mode 100644<br>
index 00000000000..7d9838b003b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/libfido2/<a href=3D"http://libfido2-initial_1=
.16.0.bb" rel=3D"noreferrer" target=3D"_blank">libfido2-initial_1.16.0.bb</=
a><br>
@@ -0,0 +1,40 @@<br>
+SUMMARY =3D &quot;FIDO 2.0 support library&quot;<br>
+DESCRIPTION =3D &quot;libfido2 provides library functionality and command-=
line tools to \<br>
+communicate with a FIDO device over USB, and to verify attestation and \<b=
r>
+assertion signatures.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://developers.yubico.com/libfido2" rel=
=3D"noreferrer" target=3D"_blank">https://developers.yubico.com/libfido2</a=
>&quot;<br>
+LICENSE =3D &quot;BSD-2-Clause&quot;<br>
+SECTION =3D &quot;libs/network&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D20be19aaa222f71738712b26f7=
f8717b&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://developers.yubico.com/$%7BBPN%7D/Rele=
ases/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http=
s://developers.yubico.com/${BPN}/Releases/${BPN}-${PV}.tar.gz</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8c2b6fb279b5b42e9ac92ade71832e485852647b53607=
c43baaafbbcecea04e4&quot;<br>
+<br>
+inherit nopackages<br>
+<br>
+PACKAGES =3D &quot;&quot;<br>
+<br>
+# The purpose of this recipe is to break a circular dependency between lib=
fido2 and<br>
+# systemd. libfido2 depends on udev (provided by systemd) to build, while =
systemd<br>
+# depends on libfido2 if the fido feature is enabled. However, systemd doe=
sn&#39;t<br>
+# actually link against libfido2. It only needs the headers in place and a=
 dummy<br>
+# shared library. It opportunistically dlopens libfido2 if it&#39;s presen=
t, but<br>
+# for that to work it needs the headers in place.<br>
+# Just fake enough to make systemd happy, and have it RRECOMMEND the real =
libfido2.<br>
+do_install() {<br>
+=C2=A0 =C2=A0 mkdir -p ${D}${includedir}/libfido2-initial/fido<br>
+=C2=A0 =C2=A0 mkdir -p ${D}${datadir}/pkgconfig<br>
+<br>
+=C2=A0 =C2=A0 install -m 644 ${S}/src/fido.h ${D}${includedir}/libfido2-in=
itial<br>
+=C2=A0 =C2=A0 install -m 644 ${S}/src/fido/* ${D}${includedir}/libfido2-in=
itial/fido/<br>
+<br>
+=C2=A0 =C2=A0 # Real libfido2 installs its pkg conf file in ${libdir}.<br>
+=C2=A0 =C2=A0 sed -e &#39;s,@CMAKE_INSTALL_PREFIX@,${exec_prefix},&#39; \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,@CMAKE_INSTALL_LIBDIR@,${baselib}/li=
bfido2-initial,&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,@FIDO_VERSION@,${PV},&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,@PROJECT_NAME@,${BPN},&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;/^Cflags/s,$,/libfido2-initial,&#39; \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/src/<a href=3D"http://libfido2.pc.in" rel=
=3D"noreferrer" target=3D"_blank">libfido2.pc.in</a> &gt; ${D}${datadir}/pk=
gconfig/libfido2.pc<br>
+<br>
+}<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125285): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125285" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125285</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118351906/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118351906/1997914</a><br>
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

--000000000000b73704064d2ac7e1--

