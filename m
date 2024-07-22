Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE01C3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 14:15:25 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.19223.1721657719869387784
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jul 2024 07:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MW2jzVkM;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-260e99b6661so1833141fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721657719; x=1722262519; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cu6jnDMYFPwWrwwxIld6Et7GZ/CP3UHrB9Q+PizrDMA=;
        b=MW2jzVkMOUOFTdF0L2KWAy2R4MV469d+cP8uzxy0TaXJXS/YpQh9YUDsPDRF8iL6KU
         y3qVf9ReYoCMRK56FSeNY+9whwhh/HpubgkG7v64Lk8fFHS7mAtgWQi1ByY+b4fH7Vic
         Ipt34ihOTKAgmV6CUUWmX+jqXLZnqAv9FTWPtulPoaRVWTA89lH4OTg5dxDbtNDFivHE
         tmabGiO1tP6o1LsqtYeDTC+jyjVJYZyEViLAwoOLiOrtTsICRDLQGg0QYpN77P+1MXuE
         keWVRyG9nn3qafAw3V1gonicmE67G14yLqLCiJ3E9/XTXOwLB2ScYT535b1Ml0iRG3f7
         myVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721657719; x=1722262519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cu6jnDMYFPwWrwwxIld6Et7GZ/CP3UHrB9Q+PizrDMA=;
        b=BamRMFE3c22yjYW1KxlMiVkGL88IQuzc684dv6uF8JNN18hslgWZqcShZoSoi0dJNv
         hYGXqRzAnyyot1Nrgv1cbeHd1j0BnJqSXvoV1v3h6z6pJbcOBkt1m2KHM5O+ZubR1VZN
         wnB3jDHn3uZz0IKA9pNi98rRF6CG79/XnIt2q5Q63I/kGLpn5cQRdJaP6Pqi6Lt6HqW9
         90dtu9YQMqHEBsOYCX5Eq8Fi48MkwtmkOSuuHe9KpEDQrr90LwS1/syt/RWs6lgLwqsb
         5bL0GhFMTyV6TfYC255d1f9d6FtMfyH/c4nCRaym9/0BBU+C3xm2py15jwTI7fJymS+w
         +NgA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8Thn7aqHJy/7pjPyz2q0HauuQLACjctmhj9Y3aqF2tNaaNqIKZZQjrNlGqk+GaxxVRtq/yw5g6ccQQh1PK47nsaxoyhg3PA3krIGwUymdhtvBctZBVwtbg==
X-Gm-Message-State: AOJu0YzBKi3TRUgtMLbr9GbEPC8i3Bx3xelGG4rI4LWyjXi0g4zPmSEv
	boPo1Og47M4mNuhCeBX+fKj9MnyrFUR4ztZNEiZ9D+hEbYiRA6Nz7bsMmu/3N+cBQcHsNBtOt5T
	fCG+bfhNjGg/mKQRW671TlFR+B8jmZB38
X-Google-Smtp-Source: AGHT+IFnGVxFiTrrLm+jArNLo0HYj2b1rQfEC6HlkyH5t6l9APOCYYEoQV8gLrO/o51fPfmLwwfyNjlilm/Un09sdQQ=
X-Received: by 2002:a05:6870:a2c7:b0:25e:b6c2:3bcb with SMTP id
 586e51a60fabf-260eec5edcbmr8046249fac.0.1721657718969; Mon, 22 Jul 2024
 07:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240722140209.1431735-2-tymoteusz.burak@3mdeb.com>
In-Reply-To: <20240722140209.1431735-2-tymoteusz.burak@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2024 07:15:07 -0700
Message-ID: <CAMKF1sruk+AgtzT65AubtCZ6EqmUnx9j-vXYsJqc6Hem_N_H8A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] dediprog-flasher: Add recipe
To: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
Cc: maciej.pijanowski@3mdeb.com, openembedded-devel@lists.openembedded.org, 
	piotr.krol@3mdeb.com
Content-Type: multipart/alternative; boundary="000000000000c39d49061dd6ac81"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 14:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111428

--000000000000c39d49061dd6ac81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 7:02=E2=80=AFAM Tymoteusz Burak <tymoteusz.burak@3m=
deb.com>
wrote:

> This patch adds the dpcmd utility recipe. It provides software for
> Dediprog SF100 and SF600 SPI flash programmers.
>
> Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> CC: Khem Raj <raj.khem@gmail.com>
> ---
>  ...01-add-support-for-cross-compilation.patch | 21 ++++++++++
>  ...2-Makefile-add-conditional-stripping.patch | 39 +++++++++++++++++++
>  .../dediprog-flasher_1.14.20.bb               | 29 ++++++++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644
> meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-support-fo=
r-cross-compilation.patch
>  create mode 100644
> meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-add-c=
onditional-stripping.patch
>  create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/
> dediprog-flasher_1.14.20.bb
>
> diff --git
> a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-support-=
for-cross-compilation.patch
> b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-support-=
for-cross-compilation.patch
> new file mode 100644
> index 000000000000..fbc0f5a18e1d
> --- /dev/null
> +++
> b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-support-=
for-cross-compilation.patch
> @@ -0,0 +1,21 @@
> +Author: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> +Date:   Fri Jul 5 16:39:13 2024 +0200
> +Upstream-Status: Submitted [
> https://github.com/DediProgSW/SF100Linux/pull/86]
> +
> +    Makefile: allow overriding CC
> +
> +    Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> +
> +diff --git a/Makefile b/Makefile
> +index 139e5c0c3c3c..226303a6921e 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -12,7 +12,7 @@ endif
> + endif
> +
> + PROGRAM =3D dpcmd
> +-CC      =3D gcc
> ++CC     ?=3D gcc
> + PREFIX ?=3D /usr/local
> +
> + PKG_CONFIG ?=3D pkg-config
> diff --git
> a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-add=
-conditional-stripping.patch
> b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-add=
-conditional-stripping.patch
> new file mode 100644
> index 000000000000..0fc8ac5bd2ef
> --- /dev/null
> +++
> b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-add=
-conditional-stripping.patch
> @@ -0,0 +1,39 @@
> +From dac9d0ea5c419049c9ab0a5ba90d15d77a3271b0 Mon Sep 17 00:00:00 2001
> +From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> +Date: Mon, 22 Jul 2024 13:02:59 +0000
> +Subject: [PATCH] Makefile: add conditional stripping
> +Upstream-Status: Submitted [
> https://github.com/DediProgSW/SF100Linux/pull/88]
> +
> +This patch introduces a `NOSTRIP` conditional flag to the `install`
> +target in the Makefile. The purpose of this flag is to allow the
> +disabling of binary stripping during installation. This is
> +particularly useful in development environments, such as BitBake,
> +which handle stripping internally.
> +
> +When `NOSTRIP` is set to `1`, the `strip` command will be skipped
> +during the installation process, preventing potential conflicts or
> +redundant operations.
> +
> +Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> +
> +---
> + Makefile | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 139e5c0..8b33320 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -58,7 +58,9 @@ install: $(PROGRAM)
> +       [ $(shell id -u) -eq 0 ] || (echo "Error: install needs root
> privileges" && false)
> +       install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/bin
> $(DESTDIR)$(PREFIX)/share/DediProg
> +       echo -n "install: " && install -v -o 0 -g 0 -m 0755 $(PROGRAM)
> $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)
> ++ifneq ($(NOSTRIP),1)
> +       strip $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)
> ++endif
> +       install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/share/DediProg
> +       echo -n "install: " && install -v -o 0 -g 0 -m 0644
> ChipInfoDb.dedicfg $(DESTDIR)$(PREFIX)/share/DediProg/ChipInfoDb.dedicfg
> +       install -v -o 0 -g 0 -m 755 -d $(DESTDIR)/etc/udev/rules.d
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-bsp/dediprog-flasher/
> dediprog-flasher_1.14.20.bb b/meta-oe/recipes-bsp/dediprog-flasher/
> dediprog-flasher_1.14.20.bb
> new file mode 100644
> index 000000000000..83a88ab75f42
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION =3D "Linux software for Dediprog SF100 and SF600 SPI flash
> programmers"
> +SECTION =3D "devel"
> +LICENSE =3D "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da23a74b3f4caf9616230789d94217=
acb"
> +
> +DEPENDS =3D "libusb"
> +
> +SRCREV =3D "e691f2d432144e3dbc82e9e0eea1ebaed4f3becf"
> +SRC_URI =3D " \
> +    git://
> github.com/DediProgSW/SF100Linux.git;protocol=3Dhttps;branch=3Dmaster \
> +    file://0001-add-support-for-cross-compilation.patch \
> +    file://0002-Makefile-add-conditional-stripping.patch \
> +    "
> +
> +EXTRA_OEMAKE =3D "NOSTRIP=3D1"
> +
> +PV =3D "1.0+${SRCPV}"


Replace Srcpv Variable with git

>
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install () {
> +    oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install


Replace hard coding /usr

>
> +}
> +
> +FILES:${PN} +=3D " \
> +    ${datadir}/DediProg \
> +"
> +
> +inherit pkgconfig
> --
> 2.45.1
>
>

--000000000000c39d49061dd6ac81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 22, 2024 at 7:02=E2=80=AFAM Tymoteusz Burak &lt=
;<a href=3D"mailto:tymoteusz.burak@3mdeb.com">tymoteusz.burak@3mdeb.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This patch adds the dpc=
md utility recipe. It provides software for<br>
Dediprog SF100 and SF600 SPI flash programmers.<br>
<br>
Signed-off-by: Tymoteusz Burak &lt;<a href=3D"mailto:tymoteusz.burak@3mdeb.=
com" target=3D"_blank">tymoteusz.burak@3mdeb.com</a>&gt;<br>
CC: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...01-add-support-for-cross-compilation.patch | 21 ++++++++++<br>
=C2=A0...2-Makefile-add-conditional-stripping.patch | 39 ++++++++++++++++++=
+<br>
=C2=A0.../<a href=3D"http://dediprog-flasher_1.14.20.bb" rel=3D"noreferrer"=
 target=3D"_blank">dediprog-flasher_1.14.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++++++++++++<br>
=C2=A03 files changed, 89 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flas=
her/0001-add-support-for-cross-compilation.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flas=
her/0002-Makefile-add-conditional-stripping.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/<a href=3D"ht=
tp://dediprog-flasher_1.14.20.bb" rel=3D"noreferrer" target=3D"_blank">dedi=
prog-flasher_1.14.20.bb</a><br>
<br>
diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add=
-support-for-cross-compilation.patch b/meta-oe/recipes-bsp/dediprog-flasher=
/dediprog-flasher/0001-add-support-for-cross-compilation.patch<br>
new file mode 100644<br>
index 000000000000..fbc0f5a18e1d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-suppor=
t-for-cross-compilation.patch<br>
@@ -0,0 +1,21 @@<br>
+Author: Maciej Pijanowski &lt;<a href=3D"mailto:maciej.pijanowski@3mdeb.co=
m" target=3D"_blank">maciej.pijanowski@3mdeb.com</a>&gt;<br>
+Date:=C2=A0 =C2=A0Fri Jul 5 16:39:13 2024 +0200<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/DediProgSW/SF100=
Linux/pull/86" rel=3D"noreferrer" target=3D"_blank">https://github.com/Dedi=
ProgSW/SF100Linux/pull/86</a>]<br>
+<br>
+=C2=A0 =C2=A0 Makefile: allow overriding CC<br>
+=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 Signed-off-by: Maciej Pijanowski &lt;<a href=3D"mailto:macie=
j.pijanowski@3mdeb.com" target=3D"_blank">maciej.pijanowski@3mdeb.com</a>&g=
t;<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 139e5c0c3c3c..226303a6921e 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -12,7 +12,7 @@ endif<br>
+ endif<br>
+ <br>
+ PROGRAM =3D dpcmd<br>
+-CC=C2=A0 =C2=A0 =C2=A0 =3D gcc<br>
++CC=C2=A0 =C2=A0 =C2=A0?=3D gcc<br>
+ PREFIX ?=3D /usr/local<br>
+ <br>
+ PKG_CONFIG ?=3D pkg-config<br>
diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Mak=
efile-add-conditional-stripping.patch b/meta-oe/recipes-bsp/dediprog-flashe=
r/dediprog-flasher/0002-Makefile-add-conditional-stripping.patch<br>
new file mode 100644<br>
index 000000000000..0fc8ac5bd2ef<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-a=
dd-conditional-stripping.patch<br>
@@ -0,0 +1,39 @@<br>
+From dac9d0ea5c419049c9ab0a5ba90d15d77a3271b0 Mon Sep 17 00:00:00 2001<br>
+From: Tymoteusz Burak &lt;<a href=3D"mailto:tymoteusz.burak@3mdeb.com" tar=
get=3D"_blank">tymoteusz.burak@3mdeb.com</a>&gt;<br>
+Date: Mon, 22 Jul 2024 13:02:59 +0000<br>
+Subject: [PATCH] Makefile: add conditional stripping<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/DediProgSW/SF100=
Linux/pull/88" rel=3D"noreferrer" target=3D"_blank">https://github.com/Dedi=
ProgSW/SF100Linux/pull/88</a>]<br>
+<br>
+This patch introduces a `NOSTRIP` conditional flag to the `install`<br>
+target in the Makefile. The purpose of this flag is to allow the<br>
+disabling of binary stripping during installation. This is<br>
+particularly useful in development environments, such as BitBake,<br>
+which handle stripping internally.<br>
+<br>
+When `NOSTRIP` is set to `1`, the `strip` command will be skipped<br>
+during the installation process, preventing potential conflicts or<br>
+redundant operations.<br>
+<br>
+Signed-off-by: Tymoteusz Burak &lt;<a href=3D"mailto:tymoteusz.burak@3mdeb=
.com" target=3D"_blank">tymoteusz.burak@3mdeb.com</a>&gt;<br>
+<br>
+---<br>
+ Makefile | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 139e5c0..8b33320 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -58,7 +58,9 @@ install: $(PROGRAM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ $(shell id -u) -eq 0 ] || (echo &quot;Error: =
install needs root privileges&quot; &amp;&amp; false)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREF=
IX)/bin $(DESTDIR)$(PREFIX)/share/DediProg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot;install: &quot; &amp;&amp; instal=
l -v -o 0 -g 0 -m 0755 $(PROGRAM) $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)<br>
++ifneq ($(NOSTRIP),1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strip $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)<br>
++endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREF=
IX)/share/DediProg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot;install: &quot; &amp;&amp; instal=
l -v -o 0 -g 0 -m 0644 ChipInfoDb.dedicfg $(DESTDIR)$(PREFIX)/share/DediPro=
g/ChipInfoDb.dedicfg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -v -o 0 -g 0 -m 755 -d $(DESTDIR)/etc/u=
dev/rules.d<br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/meta-oe/recipes-bsp/dediprog-flasher/<a href=3D"http://dedipro=
g-flasher_1.14.20.bb" rel=3D"noreferrer" target=3D"_blank">dediprog-flasher=
_1.14.20.bb</a> b/meta-oe/recipes-bsp/dediprog-flasher/<a href=3D"http://de=
diprog-flasher_1.14.20.bb" rel=3D"noreferrer" target=3D"_blank">dediprog-fl=
asher_1.14.20.bb</a><br>
new file mode 100644<br>
index 000000000000..83a88ab75f42<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/dediprog-flasher/<a href=3D"http://dediprog-flash=
er_1.14.20.bb" rel=3D"noreferrer" target=3D"_blank">dediprog-flasher_1.14.2=
0.bb</a><br>
@@ -0,0 +1,29 @@<br>
+DESCRIPTION =3D &quot;Linux software for Dediprog SF100 and SF600 SPI flas=
h programmers&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da23a74b3f4caf9616230789d94=
217acb&quot;<br>
+<br>
+DEPENDS =3D &quot;libusb&quot;<br>
+<br>
+SRCREV =3D &quot;e691f2d432144e3dbc82e9e0eea1ebaed4f3becf&quot;<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/DediProgSW/SF100Linux.git=
;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/DediProgSW/SF100Linux.git;protocol=3Dhttps;branch=3Dmaster</a> \<br=
>
+=C2=A0 =C2=A0 file://0001-add-support-for-cross-compilation.patch \<br>
+=C2=A0 =C2=A0 file://0002-Makefile-add-conditional-stripping.patch \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+EXTRA_OEMAKE =3D &quot;NOSTRIP=3D1&quot;<br>
+<br>
+PV =3D &quot;1.0+${SRCPV}&quot;</blockquote><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Replace Srcpv Variable with git=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex" dir=3D"auto"><br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install</blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Replace hard coding /usr</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
+}<br>
+<br>
+FILES:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/DediProg \<br>
+&quot;<br>
+<br>
+inherit pkgconfig<br>
-- <br>
2.45.1<br>
<br>
</blockquote></div></div>

--000000000000c39d49061dd6ac81--

