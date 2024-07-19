Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5387FC3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 23:19:13 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.1785.1721431143340534584
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jul 2024 16:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GAbBrall;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d9da46ca13so1310683b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 16:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721431142; x=1722035942; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RpvMCj5BS2u9+kIsHeNe16CbR4u/lAyNnOdAeVh7vIs=;
        b=GAbBrallVH/ColCZSBdZsU/7qeve3izm0nZ5FyAd0yddEdxiXTAZXTqZh2Xr1+1D/v
         1g2auiSAIMrlB2k8IDZkGUkaq2HAiNc2mgjYs85XTEmoH/iAXDqxSUa0SLAroISw0i4y
         bvvoTL4pWkb+YDxHZsx9ofntruwWLvGyRYAVXrkh/NF24t2bfDwozvnw/A+VqdBC+Zc5
         XHVObKJDze85Jt01FrtIINh4gbsSEs1VeO0rjSiKfFwTHQluqQfIhjRiQDTIpy3i0Ab6
         29i27Lzf1AA1n4tWWvQFKw/zILJpgTtF913oTxfwSt4edbbcIbcM9/9i7eYo67XJuQxi
         jqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721431142; x=1722035942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpvMCj5BS2u9+kIsHeNe16CbR4u/lAyNnOdAeVh7vIs=;
        b=vxYfJNFy3cUTE5Gg+XEFui3IqPsvICFb9mhdDqgxwHRQhIf3qul7+zA+YyLlQj/YsH
         D5SVrdgELo8Jupch9FmZtAl5zcksyd7xLKcK13Zf+Bw+14TnjJc8nwQahZ8OmUxEGs/T
         1+thlJUQwXspnCyet0seqSR4AmrKMSTGmUc1XXBGZdHPhuc2omLblfVbzkvsbQUxeDf8
         PtDov/wcKelmCpzt6dDnaehgaNOO1LFB3larrnXVlKJIlAQG1IIQDdj77l2N7I5Z3v8g
         Rb6ZkBWC+mEuT2B692dq8fEViSQ9AzrX+fUtXK577Rtdhrl6n7tndpMsms9udYPLN2lh
         2EDA==
X-Forwarded-Encrypted: i=1; AJvYcCWi1tZODDkdqRoMwDOtCxQLUmmRysKX0CGG4lSuB53gDpnIV0CgYSyvETB2LmknIr0NypWE0S19KEzCigkWMd5RcuEmhuQGMhkEW8iWpoPGFXXFUpMYVixHuw==
X-Gm-Message-State: AOJu0Yyyu7kubV0SDsgxSshttTdMMTgc+14F03TMqm56Gy4An5V/0lqj
	eNsqWlLKJNJUQjyt2PmH/4C8usE79n4h6K4W+LWYQ8A90PP4mKn7w53ftEI1UHOa3+ZJv6EmN6a
	yvgvBvox03PD8F+RzG3w08i9LRlmj+NpJ
X-Google-Smtp-Source: AGHT+IHCRfuwdlDOIqzDHif/a/gQaGOQcAjp+JiiscoUZub9ChMgzF1M6spL0eqlotYeBPiZ+4hfaZTy16s4FGeA4wE=
X-Received: by 2002:a05:6870:c084:b0:261:f42:291a with SMTP id
 586e51a60fabf-2638defcb38mr17622fac.26.1721431142229; Fri, 19 Jul 2024
 16:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240719151141.477978-1-tymoteusz.burak@3mdeb.com>
In-Reply-To: <20240719151141.477978-1-tymoteusz.burak@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Jul 2024 16:18:51 -0700
Message-ID: <CAMKF1sr-OBq+10Hu47GLDk2woQ3n9eMBi6HGu5zshnxh_8=StA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] dediprog-flasher: Add recipe
To: tymoteusz.burak@3mdeb.com
Cc: maciej.pijanowski@3mdeb.com, openembedded-devel@lists.openembedded.org, 
	piotr.krol@3mdeb.com
Content-Type: multipart/alternative; boundary="000000000000bcf066061da1eb5a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 23:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111419

--000000000000bcf066061da1eb5a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch a few comments inline below

On Fri, Jul 19, 2024 at 8:12=E2=80=AFAM Tymoteusz Burak via lists.openembed=
ded.org
<tymoteusz.burak=3D3mdeb.com@lists.openembedded.org> wrote:

> ---
>  ...01-add-support-for-cross-compilation.patch | 21 +++++++++++++
>  .../0002-Makefile-remove-stripping.patch      | 30 +++++++++++++++++++
>  .../dediprog-flasher_1.14.20.bb               | 25 ++++++++++++++++
>  3 files changed, 76 insertions(+)
>  create mode 100644
> meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-support-fo=
r-cross-compilation.patch
>  create mode 100644
> meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-remov=
e-stripping.patch
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
> a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-rem=
ove-stripping.patch
> b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-rem=
ove-stripping.patch
> new file mode 100644
> index 000000000000..5e7d7fc5fe89
> --- /dev/null
> +++
> b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-rem=
ove-stripping.patch
> @@ -0,0 +1,30 @@
> +From 96d8849c3c482f21ad04f1dad45bf59f453e43d6 Mon Sep 17 00:00:00 2001
> +From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> +Date: Mon, 8 Jul 2024 10:58:45 +0000
> +Subject: [PATCH] Makefile: remove stripping
> +Upstream-Status: Inappropriate [oe specific]
> +
> +This patch modifies the install process to disable stripping of binaries
> by the
> +Makefile and allow the stripping to be handled by bitbake to integrate
> +it seamlessly into the bitbake workflow.
> +
> + Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> +---
> + Makefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 139e5c0..aa6eba5 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -58,7 +58,6 @@ install: $(PROGRAM)
> +       [ $(shell id -u) -eq 0 ] || (echo "Error: install needs root
> privileges" && false)
> +       install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/bin
> $(DESTDIR)$(PREFIX)/share/DediProg
> +       echo -n "install: " && install -v -o 0 -g 0 -m 0755 $(PROGRAM)
> $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)
> +-      strip $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)


Can we turn this into a conditional make step which is skipped when the
given make variable is set something like NOSTRIP=3D1 that way this patch c=
an
be upstreamed and we do not have to carry it here forever

>
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
> index 000000000000..5d0e4e856f82
> --- /dev/null
> +++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
> @@ -0,0 +1,25 @@
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
> +    file://0002-Makefile-remove-stripping.patch \
> +    "
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install () {
> +    oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install


Let=E2=80=99s use bitbake variable prefix instead of hardcoding /usr here

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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111417):
> https://lists.openembedded.org/g/openembedded-devel/message/111417
> Mute This Topic: https://lists.openembedded.org/mt/107436605/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bcf066061da1eb5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the patch a few comments inline below=C2=A0</d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Jul 19, 2024 at 8:12=E2=80=AFAM Tymoteusz Burak via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;tymoteusz.burak=
=3D<a href=3D"mailto:3mdeb.com@lists.openembedded.org">3mdeb.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">---<br>
=C2=A0...01-add-support-for-cross-compilation.patch | 21 +++++++++++++<br>
=C2=A0.../0002-Makefile-remove-stripping.patch=C2=A0 =C2=A0 =C2=A0 | 30 +++=
++++++++++++++++<br>
=C2=A0.../<a href=3D"http://dediprog-flasher_1.14.20.bb" rel=3D"noreferrer"=
 target=3D"_blank">dediprog-flasher_1.14.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 ++++++++++++++++<br>
=C2=A03 files changed, 76 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flas=
her/0001-add-support-for-cross-compilation.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flas=
her/0002-Makefile-remove-stripping.patch<br>
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
efile-remove-stripping.patch b/meta-oe/recipes-bsp/dediprog-flasher/dedipro=
g-flasher/0002-Makefile-remove-stripping.patch<br>
new file mode 100644<br>
index 000000000000..5e7d7fc5fe89<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-r=
emove-stripping.patch<br>
@@ -0,0 +1,30 @@<br>
+From 96d8849c3c482f21ad04f1dad45bf59f453e43d6 Mon Sep 17 00:00:00 2001<br>
+From: Tymoteusz Burak &lt;<a href=3D"mailto:tymoteusz.burak@3mdeb.com" tar=
get=3D"_blank">tymoteusz.burak@3mdeb.com</a>&gt;<br>
+Date: Mon, 8 Jul 2024 10:58:45 +0000<br>
+Subject: [PATCH] Makefile: remove stripping<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+This patch modifies the install process to disable stripping of binaries b=
y the<br>
+Makefile and allow the stripping to be handled by bitbake to integrate<br>
+it seamlessly into the bitbake workflow.<br>
+<br>
+ Signed-off-by: Tymoteusz Burak &lt;<a href=3D"mailto:tymoteusz.burak@3mde=
b.com" target=3D"_blank">tymoteusz.burak@3mdeb.com</a>&gt;<br>
+---<br>
+ Makefile | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 139e5c0..aa6eba5 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -58,7 +58,6 @@ install: $(PROGRAM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ $(shell id -u) -eq 0 ] || (echo &quot;Error: =
install needs root privileges&quot; &amp;&amp; false)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREF=
IX)/bin $(DESTDIR)$(PREFIX)/share/DediProg<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot;install: &quot; &amp;&amp; instal=
l -v -o 0 -g 0 -m 0755 $(PROGRAM) $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)<br>
+-=C2=A0 =C2=A0 =C2=A0 strip $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)</blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">Can we turn this into a cond=
itional make step which is skipped when the given make variable is set some=
thing like NOSTRIP=3D1 that way this patch can be upstreamed and we do not =
have to carry it here forever=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
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
index 000000000000..5d0e4e856f82<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-bsp/dediprog-flasher/<a href=3D"http://dediprog-flash=
er_1.14.20.bb" rel=3D"noreferrer" target=3D"_blank">dediprog-flasher_1.14.2=
0.bb</a><br>
@@ -0,0 +1,25 @@<br>
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
+=C2=A0 =C2=A0 file://0002-Makefile-remove-stripping.patch \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install</blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Let=E2=80=99s use bitbake var=
iable prefix instead of hardcoding /usr here=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111417): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111417" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111417</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107436605/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107436605/1997914</a><br>
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

--000000000000bcf066061da1eb5a--

