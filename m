Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73420D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 09:11:23 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2593.1768900272773027817
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 01:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=G++WiJNL;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.48, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-655b5094119so749641a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 01:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768900271; cv=none;
        d=google.com; s=arc-20240605;
        b=ZNlmrJFVOPfmJCJgqfiqrEDz1iDxIOUllcyusoNNAI8HtW0PYh5xvAeDB0+FB/qF+W
         SawAsZbohZl/a1QSXtJgHNkgvGGrmxAC/eidALwCObsG7IN+IFblncLDDucRz4dgMi7w
         IOb1oP02/oxktdWebVBiuCG1PP3H3WpkK5Az9A/HjUqDwJOPbVYOhDYAX9X+zIgEaO1w
         mSfVWkzexlrH9xTMVA4phyMLnyYuJkwqLyz2Pcf21xjT4IQO8BCUWDFeaJwCk17hHL4T
         fQrY7j3hJLmKhWfvfndgcRNnxhI2tMaIN6e8jkUKgyYeveIKyKMIwFmJeWFuaNrzp1f3
         fNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=au/8ZjNgVG5Kasbmrz3O5cZuEDrFi9/d+xFFf0qnjqc=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=QRFos/E+2GJ7ofvo/1D6EeQKk7MxmcJ/GImZkE6V3igBnsNAZoqip5lhWZkjG55xnn
         0RE48ZPGlMgyUs66QItPeYDiuqJeFB9vQ4BHTkDO8E4YVTcrL8PVqvP7CnfPJ2W4i4lu
         RXN8JU6LWyJdiwMV/Gb1I6v1/idoSEg2MMmV8JQgl0ksvcVUbGef60m6FsZkhUepwLci
         ZOmV+uyPyeB3VHFuw1h7VR2B8Rk/qhwj8MixNJ5kf3k8Ro+NwGjegWEtpI0yjyocBcTa
         mp/VQtZ2o06vSm7liX1ja9WcDxSREnUQoyg64vEo80WG/fCir7PU2s9PoeY0qww4FrsN
         kaIw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768900271; x=1769505071; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=au/8ZjNgVG5Kasbmrz3O5cZuEDrFi9/d+xFFf0qnjqc=;
        b=G++WiJNLcZhN/kTD/MdZqDowz4s7dNlnyf2+VI3rHulcXI7OHSZlg7ekVs0IQe0UPe
         lDrAkZqLPPa0x08bnyS33L/xCXYS+BmDuDV3esB+YU6UpE/u1Y34J7TgmWat3x2HQNzC
         JQa1oIpJ4/Hn27Zs/UTZuGEeIt0n3usaPgWnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900271; x=1769505071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au/8ZjNgVG5Kasbmrz3O5cZuEDrFi9/d+xFFf0qnjqc=;
        b=m3QfPC3tEa29ILLWBLxS38W0+Kn0WizdQ/maIxLh2PJPIf4vH77MQJw/wIb0ilNp8D
         lnGbPHD58Sq3BqXbO1XFz2b0QkVsv5jQUqTO9sTzNV7qfqT0FN95tTW8OFjHv+ZqteRP
         hstYcRhbrYp0r+kSh73jMPHIGxNdEG6Cz94jmcmVK0wNOjtj7CJLh+EfJZ/f/7tVUaSs
         RiSLkRm5mhCxcgplryk0n3NguVoH56lwZKVGzdYQ7AVXphnItJiOC6wfEQKQdE8h0eoO
         3XqG+xTNhLlh/7da0qtI6X0wUcx9VRIsnUO4z3mLvIF/rblAC0JlCZSJhhN01SQz15nG
         0LDg==
X-Gm-Message-State: AOJu0YzQ+oq5vU+htKM7UGdwt/CH9+ubXqcDKByouLVdA5bgO3sR58Aq
	WhQ+qqqR/f/2/2Gp0Gzdn0PyA6jfXZVET/MWa6Q0ZLfFce0Vnqs1htlWpaSNMuXS8lJeoi2G/6i
	hUhzXS8aytK65CYMiOo/wCUZAGwrrRraF/cf/0CD8Sg==
X-Gm-Gg: AZuq6aLYy7FX3aE6kbelbWWlsPt4WiSbRE00q6YucWhvniixINjlcuIHLZY9kLfyde4
	84QH5Te7OTZJrr4RAMmFSpYmFBzqz8f4DnMFZja6JztBArD6dL5gMvE7U+Dxsq8AFwNW53XNmP1
	rn4vdfCPBnVy4KovrqfcdI8/UAjX+ONVNeOUPqiogBy3aN/MSiPfEY5byKaTX/uvHlL19HDl14W
	jkSKBN8wNqE4osuC/FAYhZkl3r5JL/I61JPVOr4O7oZeMoGU4K020dkBIxgGA/SqYRN1a17ec2y
	bUtNcAA6B63w5Hi2cGH+nvuDeNi1
X-Received: by 2002:a05:6402:350d:b0:64b:aac8:4b9b with SMTP id
 4fb4d7f45d1cf-654529d21f9mr6597017a12.4.1768900270886; Tue, 20 Jan 2026
 01:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20260116104816.513803-1-adam.duskett@amarulasolutions.com>
 <20260116104816.513803-2-adam.duskett@amarulasolutions.com> <CAMKF1sqz0Sw7oyUwAh2eLGNw6S3+2=Gc5aU6rdGj8-MKscYSLA@mail.gmail.com>
In-Reply-To: <CAMKF1sqz0Sw7oyUwAh2eLGNw6S3+2=Gc5aU6rdGj8-MKscYSLA@mail.gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 20 Jan 2026 10:10:59 +0100
X-Gm-Features: AZwV_QiIDV9jkcwYY3ijCpt5b2GpzJEk42WHJsstb2YRA-SgZ8tGQLR14GPPhCY
Message-ID: <CAHDQB6MGEBTF4E23rFqzHpp3TZusdF2-ZxnR5quodtt6a=VrPg@mail.gmail.com>
Subject: Re: [oe] [PATCH v3 2/2] [meta-oe] kmscon: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004a1ca40648ce300c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123662

--0000000000004a1ca40648ce300c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem;

This is quite odd as I have tested this package without systemd in
DISTRO_FEATURES and I don't receive any
packaging errors. I will take a look at this specific setup and try to
replicate on my side.

Adam

On Sun, Jan 18, 2026 at 7:56=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> There are packaging errors seen with this
>
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4999930/raw_inl=
ine
>
> ERROR: kmscon-9.2.1-r0 do_package: QA Issue: kmscon: Files/directories
> were installed but not shipped in any package:
>   /usr/lib/systemd
>   /usr/lib/systemd/system
>   /usr/lib/systemd/system/kmscon.service
>   /usr/lib/systemd/system/kmsconvt@.service
> Please set FILES such that these items are packaged. Alternatively if the=
y
> are unneeded, avoid installing them or delete them within do_install.
> kmscon: 4 installed and not shipped files. [installed-vs-shipped]
>
> This happens when systemd is not in DISTRO_FEATURES
>
> On Fri, Jan 16, 2026 at 2:48=E2=80=AFAM Adam Duskett via lists.openembedd=
ed.org
> <adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:
>
>> Provide sane defaults that do not have dependencies, such as
>> a dummy and terminal session support and basic fbdev support.
>>
>> kmsconvt@.service must be added separatly or else
>> do_rootfs fails with the following error:
>>
>> ```
>> do_rootfs: Postinstall scriptlets of ['kmscon'] have failed. If the
>> intention
>> is to defer them to first boot, then please place them into
>> pkg_postinst_ontarget:${PN} (). Deferring to first boot via 'exit 1' is =
no
>> longer supported.
>> ```
>>
>> Add a small patch to fix a compiling error when using LLVM as the
>> preferred toolchain.
>>
>> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>> ---
>> v1 -> v2: add tag=3Dv${PV} to the SRC_URI
>> v2 -> v3: Add a small patch to fix LLVM compiling errors
>>
>>  ..._conf.c-Fix-llvm-compilation-failure.patch | 40 +++++++++++
>>  .../recipes-graphics/kmscon/kmscon_9.2.1.bb   | 66 +++++++++++++++++++
>>  2 files changed, 106 insertions(+)
>>  create mode 100644
>> meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-compil=
ation-failure.patch
>>  create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>>
>> diff --git
>> a/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-comp=
ilation-failure.patch
>> b/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-comp=
ilation-failure.patch
>> new file mode 100644
>> index 0000000000..0806f9bb04
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-comp=
ilation-failure.patch
>> @@ -0,0 +1,40 @@
>> +From 03a330d486132e3798a125d26d4f10252ffd8e2d Mon Sep 17 00:00:00 2001
>> +From: Adam Duskett <adam.duskett@amarulasolutions.com>
>> +Date: Fri, 16 Jan 2026 11:35:39 +0100
>> +Subject: [PATCH] kmscon_conf.c: Fix llvm compilation failure
>> +
>> +When building with an LLVM toolchain, the follow error occurs:
>> +
>> +```
>> +kmscon_conf.c:757:72:
>> +error: expression which evaluates to zero treated as a null pointer
>> constant
>> +of type 'void *' [-Werror,-Wnon-literal-null-conversion]
>> +CONF_OPTION(0, 0, "gpus", &conf_gpus, NULL, NULL, NULL, &conf->gpus,
>> KMSCON_GPU_ALL),
>> +
>>  ^~~~~~~~~~~~~~
>> +1 error generated.
>> +```
>> +
>> +Fix the error by adding a cast to (void *).
>> +
>> +Upstream-Status: Submitted [https://github.com/kmscon/kmscon/pull/225]
>> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>> +---
>> + src/kmscon_conf.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/kmscon_conf.c b/src/kmscon_conf.c
>> +index df2e51d..9e9a839 100644
>> +--- a/src/kmscon_conf.c
>> ++++ b/src/kmscon_conf.c
>> +@@ -754,7 +754,7 @@ int kmscon_conf_new(struct conf_ctx **out)
>> +               /* Video Options */
>> +               CONF_OPTION_BOOL_FULL(0, "drm", aftercheck_drm, NULL,
>> NULL, &conf->drm, true),
>> +               CONF_OPTION_BOOL(0, "hwaccel", &conf->hwaccel, false),
>> +-              CONF_OPTION(0, 0, "gpus", &conf_gpus, NULL, NULL, NULL,
>> &conf->gpus, KMSCON_GPU_ALL),
>> ++              CONF_OPTION(0, 0, "gpus", &conf_gpus, NULL, NULL, NULL,
>> &conf->gpus, (void *)KMSCON_GPU_ALL),
>> +               CONF_OPTION_STRING(0, "render-engine",
>> &conf->render_engine, NULL),
>> +               CONF_OPTION_BOOL(0, "use-original-mode",
>> &conf->use_original_mode, true),
>> +               CONF_OPTION_STRING(0, "mode", &conf->mode, NULL),
>> +--
>> +2.52.0
>> +
>> diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>> b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>> new file mode 100644
>> index 0000000000..925bebee81
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>> @@ -0,0 +1,66 @@
>> +SUMMARY =3D "Simple terminal emulator based on linux kernel mode settin=
g
>> (KMS)."
>> +DESCRIPTION =3D "\
>> +    Kmscon is a simple terminal emulator based on linux kernel mode
>> setting \
>> +    (KMS). It is an attempt to replace the in-kernel VT implementation
>> with \
>> +    a userspace console. \
>> +"
>> +HOMEPAGE =3D "https://github.com/kmscon/kmscon"
>> +BUGTRACKER =3D "https://github.com/kmscon/kmscon/issues"
>> +CVE_PRODUCT =3D "kmscon"
>> +
>> +SECTION =3D "graphics"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6d4602d249f8a3401040238e9836=
7d9e"
>> +
>> +DEPENDS =3D "\
>> +    libtsm \
>> +    libxkbcommon \
>> +    udev \
>> +"
>> +
>> +SRC_URI =3D "\
>> +    git://github.com/kmscon/kmscon;branch=3Dmain;protocol=3Dhttps \
>> +    file://0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch \
>> +"
>> +SRCREV =3D "7d46650dbb0826f9b89de42f879be879391c14fd"
>> +
>> +inherit meson pkgconfig systemd
>> +
>> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)=
}"
>> +
>> +PACKAGECONFIG[backspace_sends_delete] =3D "-Dbackspace_sends_delete=3Dt=
rue,
>> -Dbackspace_sends_delete=3Dfalse"
>> +PACKAGECONFIG[font_pango] =3D "-Dfont_pango=3Denabled,
>> -Dfont_pango=3Ddisabled, pango"
>> +PACKAGECONFIG[multi_seat] =3D "-Dmulti_seat=3Denabled,
>> -Dmulti_seat=3Ddisabled, systemd"
>> +PACKAGECONFIG[opengl] =3D "-Drenderer_gltex=3Denabled -Dvideo_drm3d=3De=
nabled,
>> -Drenderer_gltex=3Ddisabled -Dvideo_drm3d=3Ddisabled, libdrm virtual/egl
>> virtual/libgles2 virtual/libgbm"
>> +PACKAGECONFIG[video_drm2d] =3D "-Dvideo_drm2d=3Denabled,
>> -Dvideo_drm2d=3Ddisabled, libdrm"
>> +
>> +EXTRA_OEMESON =3D "\
>> +    -Delogind=3Ddisabled \
>> +    -Dextra_debug=3Dfalse \
>> +    -Dfont_unifont=3Denabled \
>> +    -Dsession_dummy=3Denabled \
>> +    -Dsession_terminal=3Denabled \
>> +    -Dtests=3Dfalse \
>> +    -Dvideo_fbdev=3Denabled \
>> +"
>> +
>> +SYSTEMD_SERVICE:${PN} =3D "kmscon.service"
>> +FILES:${PN} +=3D "${systemd_system_unitdir}/kmsconvt@.service"
>> +
>> +do_install:append() {
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
>> 'false', d)}; then
>> +        install -d ${D}${sysconfdir}/systemd/system
>> +        ln -sf ${systemd_system_unitdir}/kmsconvt@.service \
>> +            ${D}${sysconfdir}/systemd/system/autovt@.service
>> +    fi
>> +
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false',
>> d)}; then
>> +        sed -e "s@#drm@drm@g" \
>> +            -e "s@#hwaccel@hwaccel@g" \
>> +            -e "s@#render-engine=3Dgltex@render-engine=3Dgltex@g" \
>> +            -i ${D}${sysconfdir}/kmscon/kmscon.conf
>> +    fi
>> +}
>> +
>> +RDEPENDS:${PN} =3D "xkeyboard-config"
>> --
>> 2.52.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#123531):
>> https://lists.openembedded.org/g/openembedded-devel/message/123531
>> Mute This Topic: https://lists.openembedded.org/mt/117295606/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000004a1ca40648ce300c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Khem;</div><div><br></div><div>This is quite odd a=
s I have tested this package without systemd in DISTRO_FEATURES and I don&#=
39;t receive any</div><div>packaging errors. I will take a look at this spe=
cific setup and try to replicate on my side.</div><div><br></div><div>Adam<=
/div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sun, Jan 18, 2026 at 7:56=E2=80=AFAM Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">There are packaging errors seen with this<div><br></div><div><a href=3D"=
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4999930/raw_inlin=
e" target=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/api/v2/l=
ogs/4999930/raw_inline</a></div><div><br></div><div>ERROR: kmscon-9.2.1-r0 =
do_package: QA Issue: kmscon: Files/directories were installed but not ship=
ped in any package:<br>=C2=A0 /usr/lib/systemd<br>=C2=A0 /usr/lib/systemd/s=
ystem<br>=C2=A0 /usr/lib/systemd/system/kmscon.service<br>=C2=A0 /usr/lib/s=
ystemd/system/kmsconvt@.service<br>Please set FILES such that these items a=
re packaged. Alternatively if they are unneeded, avoid installing them or d=
elete them within do_install.<br>kmscon: 4 installed and not shipped files.=
 [installed-vs-shipped]<br></div><div><br></div><div>This happens when syst=
emd is not in DISTRO_FEATURES=C2=A0</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 16, 2026 at 2:48=E2=80=
=AFAM Adam Duskett via <a href=3D"http://lists.openembedded.org" target=3D"=
_blank">lists.openembedded.org</a> &lt;adam.duskett=3D<a href=3D"mailto:ama=
rulasolutions.com@lists.openembedded.org" target=3D"_blank">amarulasolution=
s.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Provide sane defaults that do not have dependen=
cies, such as<br>
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
Add a small patch to fix a compiling error when using LLVM as the<br>
preferred toolchain.<br>
<br>
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
---<br>
v1 -&gt; v2: add tag=3Dv${PV} to the SRC_URI<br>
v2 -&gt; v3: Add a small patch to fix LLVM compiling errors<br>
<br>
=C2=A0..._conf.c-Fix-llvm-compilation-failure.patch | 40 +++++++++++<br>
=C2=A0.../recipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1.bb" rel=3D=
"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a>=C2=A0 =C2=A0| 66 +++++++=
++++++++++++<br>
=C2=A02 files changed, 106 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/kmscon/files/0001-kmscon_=
conf.c-Fix-llvm-compilation-failure.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/kmscon/<a href=3D"http://=
kmscon_9.2.1.bb" rel=3D"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a><b=
r>
<br>
diff --git a/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-l=
lvm-compilation-failure.patch b/meta-oe/recipes-graphics/kmscon/files/0001-=
kmscon_conf.c-Fix-llvm-compilation-failure.patch<br>
new file mode 100644<br>
index 0000000000..0806f9bb04<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/kmscon/files/0001-kmscon_conf.c-Fix-llvm-com=
pilation-failure.patch<br>
@@ -0,0 +1,40 @@<br>
+From 03a330d486132e3798a125d26d4f10252ffd8e2d Mon Sep 17 00:00:00 2001<br>
+From: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolutions.com=
" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
+Date: Fri, 16 Jan 2026 11:35:39 +0100<br>
+Subject: [PATCH] kmscon_conf.c: Fix llvm compilation failure<br>
+<br>
+When building with an LLVM toolchain, the follow error occurs:<br>
+<br>
+```<br>
+kmscon_conf.c:757:72:<br>
+error: expression which evaluates to zero treated as a null pointer consta=
nt<br>
+of type &#39;void *&#39; [-Werror,-Wnon-literal-null-conversion]<br>
+CONF_OPTION(0, 0, &quot;gpus&quot;, &amp;conf_gpus, NULL, NULL, NULL, &amp=
;conf-&gt;gpus, KMSCON_GPU_ALL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~<br>
+1 error generated.<br>
+```<br>
+<br>
+Fix the error by adding a cast to (void *).<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/kmscon/kmscon/pu=
ll/225" rel=3D"noreferrer" target=3D"_blank">https://github.com/kmscon/kmsc=
on/pull/225</a>]<br>
+Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolu=
tions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
+---<br>
+ src/kmscon_conf.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/kmscon_conf.c b/src/kmscon_conf.c<br>
+index df2e51d..9e9a839 100644<br>
+--- a/src/kmscon_conf.c<br>
++++ b/src/kmscon_conf.c<br>
+@@ -754,7 +754,7 @@ int kmscon_conf_new(struct conf_ctx **out)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Video Options */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONF_OPTION_BOOL_FU=
LL(0, &quot;drm&quot;, aftercheck_drm, NULL, NULL, &amp;conf-&gt;drm, true)=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONF_OPTION_BOOL(0,=
 &quot;hwaccel&quot;, &amp;conf-&gt;hwaccel, false),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CONF_OPTION(0, 0, &quot;=
gpus&quot;, &amp;conf_gpus, NULL, NULL, NULL, &amp;conf-&gt;gpus, KMSCON_GP=
U_ALL),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CONF_OPTION(0, 0, &quot;=
gpus&quot;, &amp;conf_gpus, NULL, NULL, NULL, &amp;conf-&gt;gpus, (void *)K=
MSCON_GPU_ALL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONF_OPTION_STRING(=
0, &quot;render-engine&quot;, &amp;conf-&gt;render_engine, NULL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONF_OPTION_BOOL(0,=
 &quot;use-original-mode&quot;, &amp;conf-&gt;use_original_mode, true),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONF_OPTION_STRING(=
0, &quot;mode&quot;, &amp;conf-&gt;mode, NULL),<br>
+-- <br>
+2.52.0<br>
+<br>
diff --git a/meta-oe/recipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1=
.bb" rel=3D"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a> b/meta-oe/rec=
ipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1.bb" rel=3D"noreferrer" =
target=3D"_blank">kmscon_9.2.1.bb</a><br>
new file mode 100644<br>
index 0000000000..925bebee81<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a><br>
@@ -0,0 +1,66 @@<br>
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
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/kmscon/kmscon;branch=3Dma=
in;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/kmscon=
/kmscon;branch=3Dmain;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 file://0001-kmscon_conf.c-Fix-llvm-compilation-failure.patch=
 \<br>
+&quot;<br>
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
View/Reply Online (#123531): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123531" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123531</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117295606/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117295606/1997914</a><br>
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
</blockquote></div>

--0000000000004a1ca40648ce300c--

