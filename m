Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59FBCDB471
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 02:19:15 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9288.1763086747424412520
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 18:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ho0BbXtq;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63fca769163so1396260d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 18:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763086746; x=1763691546; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XhoNGupJOldOEwu37a8lniNUVhCrqZHbHovohNQH+SM=;
        b=ho0BbXtqYtX3KS6K+1pP9eoQJSgdjBf2xbpZipQHIVSSDnre9h379s/kE91N+mDLsa
         V1HpmY2EF/BXzUTnTu4Ja8O6dGOodGp+aWoj7V4Xu4hP99iOcDgQEpN3Nvzq3yxFdb+C
         iLwFyyg9ZNCqQ06/3PKGK2O8YmR2XOijYvFGUMgX5AtwV0+1+pzBDY9Nsrv3p7MfZfps
         LGictLq1EFGJjHR+BCrd0wOhCbcE6kjkdTjh2UMoOrLHfW6/Dqnds5f5DnQ1Mhngbjbj
         e3zy+GLjHQ/XLApEezOSSqKQcoeHNSqCnTqHgR5tnIQM705o23fEHN75944Cfj4HX4iZ
         vm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763086746; x=1763691546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhoNGupJOldOEwu37a8lniNUVhCrqZHbHovohNQH+SM=;
        b=sX4GFBn/s9qfKrqWO/MdFNHJBRVw8B+GHngqBFvUuCp6b+ZVxnzB0tjjpUU8Trv1Nc
         Op3YYo+hkGGxyMvIb99UGY/ur8B91WWiSbvis4kaiithh5W6mV/rzDhy6Dwp7fUtXKSm
         FXt2gqD94a9cD2H9HcLwjI/EY47cvX09QQfyOAE79y1bd3TP4+FJ1T1nFnMTKsCeHZ+g
         8q0nJz5uMAW0IMnQj1sD00CbxgwdyIG0N7idH/G7QET1b/sIj4UTKwEUPVwk4U8Sy0dl
         djUyGdCXYpdVEbh3M+fMVGcMb3H7RR5ZEXhr/TpArRSbfVzUpIB7R5aRrMk1clwGS83G
         qEOw==
X-Gm-Message-State: AOJu0Yy1gcRN5h14IKrTgFWr65nOLpMXbz9+NnOeuLHdYRCzL82geppV
	N2e0yiYsVHb6qXHHZcpURNtOFqe4A7hM07Vv09ME05MAv+4jhLi5oC9HUtFGOSx/2JaLsBiFQvc
	KX89TwjST1eN7PrtVqCY4a8rEVq36Il+E65j0t6s=
X-Gm-Gg: ASbGncsORIapqZA16iD8fK5oY4P/l1dsf5lZ8kb1RufeHi1Qb9tddb0AM+TmYLVky2J
	utRpN6x8+9yMvVWYt8yDBDmSO0/TptfeX3vpAxb1Mk4wTF/U96zqCfpgmhYy6dmZ3PNG7tY+G3b
	LEp6PN3uglEO1k+T1/AGp9qlcx/pQh5BWsVHuuseizFhNqvaJPpWEcB4eHa3en5AHTe+HVcIZPy
	f8ahG0QNUXrJOsfSJF3fvtFNMLKn2wpvKINK8rZ7WOb1nVHA9ZHYlvU/Xedn47OMVZLsZQxccih
	E4jW2mrX8/1XMmF4318g+XZLSr3aN7D5dZdLLb66ueuHE1ij7geWnMj3USZo1YseU4IqqJKIuCK
	vT6knTc2A2qTLH1g9EHYk4u3DNMi+uOBfajttowgGGIjE8A==
X-Google-Smtp-Source: AGHT+IFUJ7wzbOceJR0jwhjRUV4RRrL+eNwmTEKX/Ye6SbwkPSak47t/CToFF+twLnNU/3vJstwM9+kgGMotpJJzDz4=
X-Received: by 2002:a05:690c:a747:b0:787:cab5:79a1 with SMTP id
 00721157ae682-78929f09d8fmr11787507b3.32.1763086746408; Thu, 13 Nov 2025
 18:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20251114020447.2540986-1-f_l_k@t-online.de>
In-Reply-To: <20251114020447.2540986-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 18:18:40 -0800
X-Gm-Features: AWmQ_bneah5GUy7Keyjd18f4scPy1tcDo1Zxst03H-U_5iBLMQ-EgDeFaywUldA
Message-ID: <CAMKF1srJz=zBHjUWNECb2OAn9Q6v0gV4YNkjoVefGz_yaSnENA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fex: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003a5afa0643849f0f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121665

--0000000000003a5afa0643849f0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 6:05=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Fex is a fast usermode x86 and x86-64 emulator for Arm64 Linux
> It is used by 'valve' to run windows games on snapdragon
>
> Compilation requires TOOLCHAIN =3D "clang"
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-devtools/fex/fex_2511.bb | 58 ++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/fex/fex_2511.bb
>
> diff --git a/meta-oe/recipes-devtools/fex/fex_2511.bb
> b/meta-oe/recipes-devtools/fex/fex_2511.bb
> new file mode 100644
> index 0000000000..295df8e814
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/fex/fex_2511.bb
> @@ -0,0 +1,58 @@
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
> +REQUIRED_DISTRO_FEATURES =3D "ld-is-lld"
> +
>

You. can just add LDFLAGS +=3D "-fuse-ld=3Dlld" instead of demanding the di=
stro
feature
that will make it work with wider variety of distro settings, not many OE
distros default to LLD yet.


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
> +       -DCMAKE_EXE_LINKER_FLAGS_INIT=3D"-fuse-ld=3Dlld" \
> +       -DCMAKE_MODULE_LINKER_FLAGS_INIT=3D"-fuse-ld=3Dlld" \
> +       -DCMAKE_SHARED_LINKER_FLAGS_INIT=3D"-fuse-ld=3Dlld" \
> +       -DDATA_DIRECTORY=3D${datadir} \
> +       -DQT_HOST_PATH:PATH=3D${RECIPE_SYSROOT_NATIVE}${prefix_native} \
> +"
> +
> +inherit cmake ccache pkgconfig features_check
> +
> +FILES:${PN} +=3D "${datadir} ${libdir}/binfmt.d ${libdir}/libFEXCore.so"
> +FILES:${PN}-dev =3D "${includedir}"
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121663):
> https://lists.openembedded.org/g/openembedded-devel/message/121663
> Mute This Topic: https://lists.openembedded.org/mt/116286410/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003a5afa0643849f0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13,=
 2025 at 6:05=E2=80=AFPM Markus Volk via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.d=
e@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fex is a fast u=
sermode x86 and x86-64 emulator for Arm64 Linux<br>
It is used by &#39;valve&#39; to run windows games on snapdragon<br>
<br>
Compilation requires TOOLCHAIN =3D &quot;clang&quot;<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/fex/<a href=3D"http://fex_2511.bb" rel=3D"no=
referrer" target=3D"_blank">fex_2511.bb</a> | 58 ++++++++++++++++++++++++<b=
r>
=C2=A01 file changed, 58 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/fex/<a href=3D"http://fex=
_2511.bb" rel=3D"noreferrer" target=3D"_blank">fex_2511.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/fex/<a href=3D"http://fex_2511.bb" re=
l=3D"noreferrer" target=3D"_blank">fex_2511.bb</a> b/meta-oe/recipes-devtoo=
ls/fex/<a href=3D"http://fex_2511.bb" rel=3D"noreferrer" target=3D"_blank">=
fex_2511.bb</a><br>
new file mode 100644<br>
index 0000000000..295df8e814<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/fex/<a href=3D"http://fex_2511.bb" rel=3D"no=
referrer" target=3D"_blank">fex_2511.bb</a><br>
@@ -0,0 +1,58 @@<br>
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
+REQUIRED_DISTRO_FEATURES =3D &quot;ld-is-lld&quot;<br>
+<br></blockquote><div><br></div><div>You. can just add LDFLAGS=C2=A0+=3D &=
quot;-fuse-ld=3Dlld&quot; instead of demanding the distro feature</div><div=
>that will make it work with wider variety of distro settings, not many OE =
distros default to LLD yet.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_EXE_LINKER_FLAGS_INIT=3D&quot;-fuse-ld=
=3Dlld&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_MODULE_LINKER_FLAGS_INIT=3D&quot;-fuse-=
ld=3Dlld&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_SHARED_LINKER_FLAGS_INIT=3D&quot;-fuse-=
ld=3Dlld&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DDATA_DIRECTORY=3D${datadir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH:PATH=3D${RECIPE_SYSROOT_NATIVE}$=
{prefix_native} \<br>
+&quot;<br>
+<br>
+inherit cmake ccache pkgconfig features_check<br>
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
View/Reply Online (#121663): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121663" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121663</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116286410/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116286410/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003a5afa0643849f0f--

