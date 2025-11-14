Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06704CDB47B
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 03:03:16 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9873.1763089386382313000
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 19:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QQ2HrFz1;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78802ac22abso15947177b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 19:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763089385; x=1763694185; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aG+G5lGb0WkHfrJM5MlDg3niFZysLpNLFjrukFealKw=;
        b=QQ2HrFz1X+1jD5roc6I9keUyv0D5Qh4Vj6tN+X4x2+z3cGS2EbRHZbSgZdVMtcek7o
         9YxDsnyEAQmFi63uF+yd/d/9xk1Lh4gdAbjzIhuv3Wo1//3jWr772c1Jj+lU+TTUbpSN
         1bJ1G3mkgmw6dt106myiWROFjy2SfIrLQHt/tkS5ViM4KNAXW2vx/4BWA+ugxaN2z5eD
         OHr5kmSnRMkoCsi9q8cFD9OGybFPdEf+sNrIyP96wvFYYN1DgSGD6P8/fIfHWy/FM1AN
         3amuNzXYf/6Twd/tlHm9mM+smPl0kz/V06bhtk6993InjvL+JZbgYapZVtHd91Ew0JT8
         fYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089385; x=1763694185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aG+G5lGb0WkHfrJM5MlDg3niFZysLpNLFjrukFealKw=;
        b=tI6u89874+IRUZe13p3ntb/u8V/RXEeFRbdJYLZWjK+939YvY6+E6ENhxhG3PdkuYR
         KQD0ZbBUC6BuTB2p3kFIp4KXfDbpEuZ3BhMCoa+KcHeepxog0d0qBNU+rRl1JxXoIcU/
         xilEgk9Hl9NAVXpeOY+9chxYDm2d++TUdUlmAdsd0f1h9qjbhTny9vTKsiw4UQa8IG2S
         aejg0KEQJ38nTDVzkYBHT/5tquvqrbq6DzPKR2TTn91i0xc8PdqKflsjwdZt6RzbI3Ej
         cdoYBgXFfhuA/8HtgjeWA8jridmPxNchSkRGrP/AVetkCaYxx7l4QqdxVRejadal2v3x
         cd+g==
X-Gm-Message-State: AOJu0Yy+FUjMLZTIvcEv4hdo6JknhoIosczw6JCYWtTNRlin3IJjVBg0
	q7qV492KgkCWJv2gcXU1qVzW1JAuTy9IfN4niZv+KIQ02gONo/UIJCZwE2EgUepw9PfDNS+Ut2d
	I23k7zzYx0eqLv0UtW/nUJMr31TjP9mo=
X-Gm-Gg: ASbGncui0+RzA2TydiVclhz3GMvdhYl6nDZ2TAtv1g0bf5o9RHMVijKZUZUKYZ1/dbX
	yxhM2p3uLBCOpnC2JbOFLQkKb0AB0/xXIP0P35g09T1BeB+2zgLuXNg0eMpUT7OBHdTDG6DckDP
	vSXEQGeLSBDyAXUnLK0AWhgKBiacxw4rmf/yREc8nJQGpNclf2kAo246cwp3/odnyq/vI/G1qcl
	Fb4jRh4QrTN63IHkfjUkOGjpERxyn4thPZ+yHQv8ewZGGx0dOLrv9JZAv49D8vI8UDQmkBEP5wx
	k8kb8PAgoZFV9pCmWWedfbHvnPJmGbMgrNJQNdTmjz3Er70VcT8xcphSk3R4XUHaOPKokjaJYw2
	eYHPYMG1kcldcVYsJU6qrpofWBLp4qj2JnEUIhhWd/C9zZg==
X-Google-Smtp-Source: AGHT+IFH4pN9dJEduT8NQKaLtamsTbfHK/9vlkwZ87PjTTMQ1iIUuTNEcXqqVM8YOU/iqA6rMhA2ubjqq2MajgURqEQ=
X-Received: by 2002:a05:690c:8681:20b0:787:e015:8561 with SMTP id
 00721157ae682-78929e38822mr14235987b3.20.1763089385483; Thu, 13 Nov 2025
 19:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20251114022702.2554476-1-f_l_k@t-online.de>
In-Reply-To: <20251114022702.2554476-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 19:02:39 -0800
X-Gm-Features: AWmQ_bkMzyikpW7j9o_RGV9lwYVGD8BzetZZnu8bWoXVAxN1tCox2PXSq9gut5o
Message-ID: <CAMKF1soNtEJb4WgZUk6J4TqJ2bVjaMQtQAHR1w2SmZKNo1UQxA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] fex: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008770c50643853cb1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121674

--0000000000008770c50643853cb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it fails on musl, perhaps disable it for musl targets unless you want to
fix it.

https://errors.yoctoproject.org/Errors/Details/888047/

On Thu, Nov 13, 2025 at 6:27=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Fex is a fast usermode x86 and x86-64 emulator for Arm64 Linux
> It is used by 'valve' to run windows games on snapdragon
>
> Compilation requires TOOLCHAIN =3D "clang"
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-devtools/fex/fex_2511.bb | 55 ++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/fex/fex_2511.bb
>
> diff --git a/meta-oe/recipes-devtools/fex/fex_2511.bb
> b/meta-oe/recipes-devtools/fex/fex_2511.bb
> new file mode 100644
> index 0000000000..9eefe8a8ab
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/fex/fex_2511.bb
> @@ -0,0 +1,55 @@
> +SUMMARY =3D "A fast usermode x86 and x86-64 emulator for Arm64 Linux"
> +HOMEPAGE =3D "https://github.com/FEX-Emu/FEX"
> +LICENSE =3D "MIT & BSL-1.0 & BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D70d20d502833c35d6d5a4f0ef5d9e=
fcc"
> +LIC_FILES_CHKSUM +=3D
> "file://External/range-v3/LICENSE.txt;md5=3D5dc23d5193abaedb6e42f05650004=
624"
> +LIC_FILES_CHKSUM +=3D
> "file://External/xxhash/LICENSE;md5=3D13be6b481ff5616f77dda971191bb29b"
> +
> +COMPATIBLE_HOST =3D "aarch64.*-linux"
> +
> +SRC_URI =3D " \
> +       git://
> github.com/FEX-Emu/FEX.git;name=3Dfex;protocol=3Dhttps;nobranch=3D1;tag=
=3DFEX-${PV}
> <http://github.com/FEX-Emu/FEX.git;name=3Dfex;protocol=3Dhttps;nobranch=
=3D1;tag=3DFEX-$%7BPV%7D>
> \
> +       git://
> github.com/Sonicadvance1/cpp-optparse.git;name=3Dcpp-optparse;subdir=3D${=
S}/Source/Common/cpp-optparse;protocol=3Dhttps;nobranch=3D1
> <http://github.com/Sonicadvance1/cpp-optparse.git;name=3Dcpp-optparse;sub=
dir=3D$%7BS%7D/Source/Common/cpp-optparse;protocol=3Dhttps;nobranch=3D1>
> \
> +       git://
> github.com/FEX-Emu/drm-headers.git;name=3Dfex-drm;subdir=3D${S}/External/=
drm-headers;protocol=3Dhttps;nobranch=3D1
> <http://github.com/FEX-Emu/drm-headers.git;name=3Dfex-drm;subdir=3D$%7BS%=
7D/External/drm-headers;protocol=3Dhttps;nobranch=3D1>
> \
> +       git://
> github.com/Cyan4973/xxHash.git;name=3Dxxhash;subdir=3D${S}/External/xxhas=
h;protocol=3Dhttps;nobranch=3D1
> <http://github.com/Cyan4973/xxHash.git;name=3Dxxhash;subdir=3D$%7BS%7D/Ex=
ternal/xxhash;protocol=3Dhttps;nobranch=3D1>
> \
> +       git://
> github.com/FEX-Emu/jemalloc.git;name=3Djemalloc;subdir=3D${S}/External/je=
malloc;protocol=3Dhttps;nobranch=3D1
> <http://github.com/FEX-Emu/jemalloc.git;name=3Djemalloc;subdir=3D$%7BS%7D=
/External/jemalloc;protocol=3Dhttps;nobranch=3D1>
> \
> +       git://
> github.com/FEX-Emu/jemalloc.git;name=3Djemalloc-glibc;subdir=3D${S}/Exter=
nal/jemalloc_glibc;protocol=3Dhttps;nobranch=3D1
> <http://github.com/FEX-Emu/jemalloc.git;name=3Djemalloc-glibc;subdir=3D$%=
7BS%7D/External/jemalloc_glibc;protocol=3Dhttps;nobranch=3D1>
> \
> +       git://
> github.com/ericniebler/range-v3.git;name=3Drange-v3;subdir=3D${S}/Externa=
l/range-v3;protocol=3Dhttps;nobranch=3D1
> <http://github.com/ericniebler/range-v3.git;name=3Drange-v3;subdir=3D$%7B=
S%7D/External/range-v3;protocol=3Dhttps;nobranch=3D1>
> \
> +       git://
> github.com/FEX-Emu/robin-map.git;name=3Drobin-map;subdir=3D${S}/External/=
robin-map;protocol=3Dhttps;nobranch=3D1
> <http://github.com/FEX-Emu/robin-map.git;name=3Drobin-map;subdir=3D$%7BS%=
7D/External/robin-map;protocol=3Dhttps;nobranch=3D1>
> \
> +"
> +
> +SRCREV_FORMAT =3D "fex"
> +SRCREV_fex =3D "663fd5a98befbf7a0ac585627de15c662715a731"
> +SRCREV_cpp-optparse =3D "9f94388a339fcbb0bc95c17768eb786c85988f6e"
> +SRCREV_fex-drm =3D "3e49836995c1dcb3df709440ad2f270b569c6a5f"
> +SRCREV_xxhash =3D "e626a72bc2321cd320e953a0ccf1584cad60f363"
> +SRCREV_jemalloc =3D "ce24593018ca5d5af7e5661ceda9744e02b59f8f"
> +SRCREV_jemalloc-glibc =3D "8436195ad5e1bc347d9b39743af3d29abee59f06"
> +SRCREV_robin-map =3D "d5683d9f1891e5b04e3e3b2192b5349dc8d814ea"
> +SRCREV_range-v3 =3D "ca1388fb9da8e69314dda222dc7b139ca84e092f"
> +
> +DEPENDS =3D " \
> +    catch2 \
> +    fmt \
> +    libdrm  \
> +    nasm-native \
> +    vulkan-headers \
> +"
> +
> +PACKAGECONFIG =3D ""
> +PACKAGECONFIG[qt] =3D "-DBUILD_FEXCONFIG=3DON,-DBUILD_FEXCONFIG=3DOFF,qt=
base
> qttools-native qtquick3d"
> +
> +EXTRA_OECMAKE +=3D " \
> +       -DBUILD_TESTING=3DOFF \
> +       -DENABLE_VIXL_DISASSEMBLER=3DOFF \
> +       -DENABLE_VIXL_SIMULATOR=3DOFF \
> +       -DDATA_DIRECTORY=3D${datadir} \
> +       -DQT_HOST_PATH:PATH=3D${RECIPE_SYSROOT_NATIVE}${prefix_native} \
> +"
> +
> +inherit cmake ccache pkgconfig
> +
> +LDFLAGS +=3D "-fuse-ld=3Dlld"
> +
> +FILES:${PN} +=3D "${datadir} ${libdir}/binfmt.d ${libdir}/libFEXCore.so"
> +FILES:${PN}-dev =3D "${includedir}"
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121668):
> https://lists.openembedded.org/g/openembedded-devel/message/121668
> Mute This Topic: https://lists.openembedded.org/mt/116286600/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008770c50643853cb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">it fails on musl, perhaps disable it for musl targets unle=
ss you want to fix it.<div><br></div><div><a href=3D"https://errors.yoctopr=
oject.org/Errors/Details/888047/">https://errors.yoctoproject.org/Errors/De=
tails/888047/</a></div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13, 2025 at 6:27=
=E2=80=AFPM Markus Volk via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.opene=
mbedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Fex is a fast usermode x86 a=
nd x86-64 emulator for Arm64 Linux<br>
It is used by &#39;valve&#39; to run windows games on snapdragon<br>
<br>
Compilation requires TOOLCHAIN =3D &quot;clang&quot;<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/fex/<a href=3D"http://fex_2511.bb" rel=3D"no=
referrer" target=3D"_blank">fex_2511.bb</a> | 55 ++++++++++++++++++++++++<b=
r>
=C2=A01 file changed, 55 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/fex/<a href=3D"http://fex=
_2511.bb" rel=3D"noreferrer" target=3D"_blank">fex_2511.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/fex/<a href=3D"http://fex_2511.bb" re=
l=3D"noreferrer" target=3D"_blank">fex_2511.bb</a> b/meta-oe/recipes-devtoo=
ls/fex/<a href=3D"http://fex_2511.bb" rel=3D"noreferrer" target=3D"_blank">=
fex_2511.bb</a><br>
new file mode 100644<br>
index 0000000000..9eefe8a8ab<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/fex/<a href=3D"http://fex_2511.bb" rel=3D"no=
referrer" target=3D"_blank">fex_2511.bb</a><br>
@@ -0,0 +1,55 @@<br>
+SUMMARY =3D &quot;A fast usermode x86 and x86-64 emulator for Arm64 Linux&=
quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/FEX-Emu/FEX" rel=3D"noref=
errer" target=3D"_blank">https://github.com/FEX-Emu/FEX</a>&quot;<br>
+LICENSE =3D &quot;MIT &amp; BSL-1.0 &amp; BSD-2-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D70d20d502833c35d6d5a4f0ef5=
d9efcc&quot;<br>
+LIC_FILES_CHKSUM +=3D &quot;file://External/range-v3/LICENSE.txt;md5=3D5dc=
23d5193abaedb6e42f05650004624&quot;<br>
+LIC_FILES_CHKSUM +=3D &quot;file://External/xxhash/LICENSE;md5=3D13be6b481=
ff5616f77dda971191bb29b&quot;<br>
+<br>
+COMPATIBLE_HOST =3D &quot;aarch64.*-linux&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/FEX-Emu/FEX.=
git;name=3Dfex;protocol=3Dhttps;nobranch=3D1;tag=3DFEX-$%7BPV%7D" rel=3D"no=
referrer" target=3D"_blank">github.com/FEX-Emu/FEX.git;name=3Dfex;protocol=
=3Dhttps;nobranch=3D1;tag=3DFEX-${PV}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/Sonicadvance=
1/cpp-optparse.git;name=3Dcpp-optparse;subdir=3D$%7BS%7D/Source/Common/cpp-=
optparse;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank=
">github.com/Sonicadvance1/cpp-optparse.git;name=3Dcpp-optparse;subdir=3D${=
S}/Source/Common/cpp-optparse;protocol=3Dhttps;nobranch=3D1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/FEX-Emu/drm-=
headers.git;name=3Dfex-drm;subdir=3D$%7BS%7D/External/drm-headers;protocol=
=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/FEX-=
Emu/drm-headers.git;name=3Dfex-drm;subdir=3D${S}/External/drm-headers;proto=
col=3Dhttps;nobranch=3D1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/Cyan4973/xxH=
ash.git;name=3Dxxhash;subdir=3D$%7BS%7D/External/xxhash;protocol=3Dhttps;no=
branch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/Cyan4973/xxHash=
.git;name=3Dxxhash;subdir=3D${S}/External/xxhash;protocol=3Dhttps;nobranch=
=3D1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/FEX-Emu/jema=
lloc.git;name=3Djemalloc;subdir=3D$%7BS%7D/External/jemalloc;protocol=3Dhtt=
ps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/FEX-Emu/je=
malloc.git;name=3Djemalloc;subdir=3D${S}/External/jemalloc;protocol=3Dhttps=
;nobranch=3D1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/FEX-Emu/jema=
lloc.git;name=3Djemalloc-glibc;subdir=3D$%7BS%7D/External/jemalloc_glibc;pr=
otocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.co=
m/FEX-Emu/jemalloc.git;name=3Djemalloc-glibc;subdir=3D${S}/External/jemallo=
c_glibc;protocol=3Dhttps;nobranch=3D1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/ericniebler/=
range-v3.git;name=3Drange-v3;subdir=3D$%7BS%7D/External/range-v3;protocol=
=3Dhttps;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/eric=
niebler/range-v3.git;name=3Drange-v3;subdir=3D${S}/External/range-v3;protoc=
ol=3Dhttps;nobranch=3D1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/FEX-Emu/robi=
n-map.git;name=3Drobin-map;subdir=3D$%7BS%7D/External/robin-map;protocol=3D=
https;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/FEX-Emu=
/robin-map.git;name=3Drobin-map;subdir=3D${S}/External/robin-map;protocol=
=3Dhttps;nobranch=3D1</a> \<br>
+&quot;<br>
+<br>
+SRCREV_FORMAT =3D &quot;fex&quot;<br>
+SRCREV_fex =3D &quot;663fd5a98befbf7a0ac585627de15c662715a731&quot;<br>
+SRCREV_cpp-optparse =3D &quot;9f94388a339fcbb0bc95c17768eb786c85988f6e&quo=
t;<br>
+SRCREV_fex-drm =3D &quot;3e49836995c1dcb3df709440ad2f270b569c6a5f&quot;<br=
>
+SRCREV_xxhash =3D &quot;e626a72bc2321cd320e953a0ccf1584cad60f363&quot;<br>
+SRCREV_jemalloc =3D &quot;ce24593018ca5d5af7e5661ceda9744e02b59f8f&quot;<b=
r>
+SRCREV_jemalloc-glibc =3D &quot;8436195ad5e1bc347d9b39743af3d29abee59f06&q=
uot;<br>
+SRCREV_robin-map =3D &quot;d5683d9f1891e5b04e3e3b2192b5349dc8d814ea&quot;<=
br>
+SRCREV_range-v3 =3D &quot;ca1388fb9da8e69314dda222dc7b139ca84e092f&quot;<b=
r>
+<br>
+DEPENDS =3D &quot; \<br>
+=C2=A0 =C2=A0 catch2 \<br>
+=C2=A0 =C2=A0 fmt \<br>
+=C2=A0 =C2=A0 libdrm=C2=A0 \<br>
+=C2=A0 =C2=A0 nasm-native \<br>
+=C2=A0 =C2=A0 vulkan-headers \<br>
+&quot;<br>
+<br>
+PACKAGECONFIG =3D &quot;&quot;<br>
+PACKAGECONFIG[qt] =3D &quot;-DBUILD_FEXCONFIG=3DON,-DBUILD_FEXCONFIG=3DOFF=
,qtbase qttools-native qtquick3d&quot;<br>
+<br>
+EXTRA_OECMAKE +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_TESTING=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DENABLE_VIXL_DISASSEMBLER=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DENABLE_VIXL_SIMULATOR=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DDATA_DIRECTORY=3D${datadir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH:PATH=3D${RECIPE_SYSROOT_NATIVE}$=
{prefix_native} \<br>
+&quot;<br>
+<br>
+inherit cmake ccache pkgconfig<br>
+<br>
+LDFLAGS +=3D &quot;-fuse-ld=3Dlld&quot;<br>
+<br>
+FILES:${PN} +=3D &quot;${datadir} ${libdir}/binfmt.d ${libdir}/libFEXCore.=
so&quot;<br>
+FILES:${PN}-dev =3D &quot;${includedir}&quot;<br>
-- <br>
2.51.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121668): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121668" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121668</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116286600/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116286600/1997914</a><br>
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

--0000000000008770c50643853cb1--

