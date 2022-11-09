Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EDFC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:16:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2094.1668024999704514125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RwUoYX14;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k8so27637387wrh.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5xqq/67jgkNKryFsUll5pt4/szkI/+GtMK6QD5N8fy8=;
        b=RwUoYX14YDHymY6ggaQG7eRBUO6KiLlged1oA+NDQy9cZGxMhOYH3KNZDhysLP+nrZ
         rEI9C5vSjpmcZkLDMMYWF02SfOKVLSif02FTrc4BnA8Ch7PoXDA+TwaixPmikMvHRSq2
         vsC3RagXtuF8UDu2ocCdXXPDhbVnpjwQpQM/xnjCrKW139zr1WrfiNTL9LWWRWIvyjLA
         RpohQoT9TohGe1zgInezt30fhzQx4LyWQ4LlY9P8zFRTFZgMAG9W3ws6cPrNAGgyYmjH
         8iYFCqQq5klElWFg7+3j1bzG8LsWDb8ByEYJfKa67rjJs3Soddq3+WoZiqSFe1JYI9gy
         TzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xqq/67jgkNKryFsUll5pt4/szkI/+GtMK6QD5N8fy8=;
        b=ANCu5Z9PzCsfkPrA92To92Zb8+UfhxLeQmx7KtxPAbU+R7W+csobnplR6Sv3gWOwVz
         rT7qGUOsldLpbnQr3+s/QeOYNbdGFftPbfd9PIEHQm8Sv4HeaYyAU2HpvBqHzGhdHvva
         FDfwLHcoaJuN4e1vDvNEBTGEkELBC0oCq+eEGQKfSG4ongEkrCnGwvsMQsq9cZmFGO7U
         Bkkx0/nbDEUv69EEY/La6Suwwi1YbcWViFCbkyspMYYZ3n8HoEA/n2yP9UwkmrnBPWGj
         RqvzgpjFiHmjVmdn+LAxSV6zdE2wtwxbOgSczsOs5Drh0l2h7SgdKbMc4Ak3LT5ngs6K
         wNFw==
X-Gm-Message-State: ACrzQf3LiATzEXP61x+xAxq7Cb0IPgQAwKXsgkyYw67z6WwjYwZzYLmJ
	RPzfD1iOlUzyprN5pTHJyNwYr5tQE8hEenYfW3E=
X-Google-Smtp-Source: AMsMyM7CpbUwXrK9nepxsTFLnmGoYuoqLHTKBCUcy2Hb39RIj0UxPz5ejedtMhxLHZSPIkDET4A5YwFRid8Bp3hWKVg=
X-Received: by 2002:adf:dd12:0:b0:236:6ef7:dacf with SMTP id
 a18-20020adfdd12000000b002366ef7dacfmr39031506wrm.204.1668024997879; Wed, 09
 Nov 2022 12:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20221109200558.2034000-1-alex@linutronix.de> <20221109200558.2034000-2-alex@linutronix.de>
In-Reply-To: <20221109200558.2034000-2-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 9 Nov 2022 21:16:26 +0100
Message-ID: <CA+chaQdcgf-CTZHQTNooWgYnM5HbJygXucGnizaKoqmbCcCvMw@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] lirc: correctly use PYTHONPATH
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000079a3c205ed0f5563"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 20:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99510

--00000000000079a3c205ed0f5563
Content-Type: text/plain; charset="UTF-8"

Please don't change SRC_URI indentation, meta-oe uses 4 spaces for
indentation with closing quote as the first character as described on
https://www.openembedded.org/wiki/Styleguide

On Wed, Nov 9, 2022 at 9:06 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...ot-clobber-PYTHONPATH-from-build-env.patch | 55 +++++++++++++++++++
>  .../recipes-connectivity/lirc/lirc_0.10.2.bb  | 21 +++----
>  2 files changed, 66 insertions(+), 10 deletions(-)
>  create mode 100644
> meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
>
> diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> new file mode 100644
> index 000000000..089ed23c7
> --- /dev/null
> +++
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch
> @@ -0,0 +1,55 @@
> +From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 9 Nov 2022 20:49:41 +0100
> +Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH from build
> environment
> +
> +This environment variable has special significance for python,
> +and so lirc's variable has to be named something else.
> +
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + Makefile.am       | 2 +-
> + pylint.mak        | 2 +-
> + tools/Makefile.am | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 6718af1..fae423e 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -128,7 +128,7 @@ endif
> +
> + pylint: .phony
> +       $(MAKE) -C tools pylint
> +-      -PYTHONPATH=$(PYTHONPATH) $(PYLINT) --rcfile=pylint.conf \
> ++      -PYTHONPATH=$(LIRCPYTHONPATH) $(PYLINT) --rcfile=pylint.conf \
> +       --msg-template='$(pylint_template)' $(py_PYTHON)
> +
> + pep8: $(py_PYTHON)
> +diff --git a/pylint.mak b/pylint.mak
> +index bf427ab..2692951 100644
> +--- a/pylint.mak
> ++++ b/pylint.mak
> +@@ -1,5 +1,5 @@
> + PYTHONPATH1      = $(abs_top_srcdir)/python-pkg/lirc:
> + PYTHONPATH2      = $(abs_top_srcdir)/python-pkg/lirc/lib/.libs
> +-PYTHONPATH       = $(PYTHONPATH1):$(PYTHONPATH2)
> ++LIRCPYTHONPATH   = $(PYTHONPATH1):$(PYTHONPATH2)
> + PYLINT           = python3-pylint
> + pylint_template  = {path}:{line}: [{msg_id}({symbol}), {obj}] {msg}
> +diff --git a/tools/Makefile.am b/tools/Makefile.am
> +index 85d1fd0..96b17f8 100644
> +--- a/tools/Makefile.am
> ++++ b/tools/Makefile.am
> +@@ -142,7 +142,7 @@ force-pylint: .phony
> +
> + pylint: .pylint-stamp
> + .pylint-stamp: $(py_sources)
> +-      -PYTHONPATH=$(PYTHONPATH) $(PYLINT) --rcfile=../pylint.conf \
> ++      -PYTHONPATH=$(LIRCPYTHONPATH) $(PYLINT) --rcfile=../pylint.conf \
> +       --msg-template='$(pylint_template)' $? && touch $@
> +
> + .phony:
> +--
> +2.30.2
> +
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> index 234d347af..458d9d7cd 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/
> lirc_0.10.2.bb
> @@ -11,16 +11,17 @@ DEPENDS = "libxslt-native alsa-lib libftdi libusb1
> libusb-compat jack portaudio-
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
> -    file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
> -    file://fix_build_errors.patch \
> -    file://0001-mplay-Fix-build-with-musl.patch \
> -    file://lircd.service \
> -    file://lircd.init \
> -    file://lircexec.init \
> -    file://lircd.conf \
> -    file://lirc_options.conf \
> -    file://lirc.tmpfiles \
> -"
> +           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
> +           file://fix_build_errors.patch \
> +           file://0001-mplay-Fix-build-with-musl.patch \
> +           file://lircd.service \
> +           file://lircd.init \
> +           file://lircexec.init \
> +           file://lircd.conf \
> +           file://lirc_options.conf \
> +           file://lirc.tmpfiles \
> +
>  file://0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch \
> +           "
>  SRC_URI[sha256sum] =
> "3d44ec8274881cf262f160805641f0827ffcc20ade0d85e7e6f3b90e0d3d222a"
>
>  SYSTEMD_PACKAGES = "lirc lirc-exec"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99509):
> https://lists.openembedded.org/g/openembedded-devel/message/99509
> Mute This Topic: https://lists.openembedded.org/mt/94921643/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000079a3c205ed0f5563
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please don&#39;t change SRC_URI indentation, meta-oe uses =
4 spaces for indentation with closing quote as the first character as descr=
ibed on=C2=A0<a href=3D"https://www.openembedded.org/wiki/Styleguide">https=
://www.openembedded.org/wiki/Styleguide</a></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 9, 2022 at 9:06 PM A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linu=
tronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0...ot-clobber-PYTHONPATH-from-build-env.patch | 55 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-connectivity/lirc/<a href=3D"http://lirc_0.10.2.bb" rel=
=3D"noreferrer" target=3D"_blank">lirc_0.10.2.bb</a>=C2=A0 | 21 +++----<br>
=C2=A02 files changed, 66 insertions(+), 10 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connect=
ivity/lirc/lirc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.p=
atch<br>
<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/l=
irc/0001-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch b/meta-=
oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Makefile.=
am-do-not-clobber-PYTHONPATH-from-build-env.patch<br>
new file mode 100644<br>
index 000000000..089ed23c7<br>
--- /dev/null<br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/000=
1-Makefile.am-do-not-clobber-PYTHONPATH-from-build-env.patch<br>
@@ -0,0 +1,55 @@<br>
+From 5e3b74927b4fef03d91518d235e9e3ba8cd7ab2e Mon Sep 17 00:00:00 2001<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;<br>
+Date: Wed, 9 Nov 2022 20:49:41 +0100<br>
+Subject: [PATCH] Makefile.am: do not clobber PYTHONPATH from build environ=
ment<br>
+<br>
+This environment variable has special significance for python,<br>
+and so lirc&#39;s variable has to be named something else.<br>
+<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
+---<br>
+ Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ pylint.mak=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ tools/Makefile.am | 2 +-<br>
+ 3 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index 6718af1..fae423e 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -128,7 +128,7 @@ endif<br>
+ <br>
+ pylint: .phony<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) -C tools pylint<br>
+-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcfile=3Dpyl=
int.conf \<br>
++=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) --rcfile=
=3Dpylint.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--msg-template=3D&#39;$(pylint_template)&#39; $=
(py_PYTHON)<br>
+ <br>
+ pep8: $(py_PYTHON)<br>
+diff --git a/pylint.mak b/pylint.mak<br>
+index bf427ab..2692951 100644<br>
+--- a/pylint.mak<br>
++++ b/pylint.mak<br>
+@@ -1,5 +1,5 @@<br>
+ PYTHONPATH1=C2=A0 =C2=A0 =C2=A0 =3D $(abs_top_srcdir)/python-pkg/lirc:<br=
>
+ PYTHONPATH2=C2=A0 =C2=A0 =C2=A0 =3D $(abs_top_srcdir)/python-pkg/lirc/lib=
/.libs<br>
+-PYTHONPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $(PYTHONPATH1):$(PYTHONPATH2)<br=
>
++LIRCPYTHONPATH=C2=A0 =C2=A0=3D $(PYTHONPATH1):$(PYTHONPATH2)<br>
+ PYLINT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D python3-pylint<br>
+ pylint_template=C2=A0 =3D {path}:{line}: [{msg_id}({symbol}), {obj}] {msg=
}<br>
+diff --git a/tools/Makefile.am b/tools/Makefile.am<br>
+index 85d1fd0..96b17f8 100644<br>
+--- a/tools/Makefile.am<br>
++++ b/tools/Makefile.am<br>
+@@ -142,7 +142,7 @@ force-pylint: .phony<br>
+ <br>
+ pylint: .pylint-stamp<br>
+ .pylint-stamp: $(py_sources)<br>
+-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(PYTHONPATH) $(PYLINT) --rcfile=3D../=
pylint.conf \<br>
++=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(LIRCPYTHONPATH) $(PYLINT) --rcfile=
=3D../pylint.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--msg-template=3D&#39;$(pylint_template)&#39; $=
? &amp;&amp; touch $@<br>
+ <br>
+ .phony:<br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/<=
a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">lirc_=
0.10.2.bb</a> b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lir=
c/<a href=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">li=
rc_0.10.2.bb</a><br>
index 234d347af..458d9d7cd 100644<br>
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/<a href=
=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">lirc_0.10.2=
.bb</a><br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/<a href=
=3D"http://lirc_0.10.2.bb" rel=3D"noreferrer" target=3D"_blank">lirc_0.10.2=
.bb</a><br>
@@ -11,16 +11,17 @@ DEPENDS =3D &quot;libxslt-native alsa-lib libftdi libus=
b1 libusb-compat jack portaudio-<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://prdownloads.sourceforge.net/lirc/=
lirc-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://prdownl=
oads.sourceforge.net/lirc/lirc-${PV}.tar.bz2</a> \<br>
-=C2=A0 =C2=A0 file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patc=
h \<br>
-=C2=A0 =C2=A0 file://fix_build_errors.patch \<br>
-=C2=A0 =C2=A0 file://0001-mplay-Fix-build-with-musl.patch \<br>
-=C2=A0 =C2=A0 file://lircd.service \<br>
-=C2=A0 =C2=A0 file://lircd.init \<br>
-=C2=A0 =C2=A0 file://lircexec.init \<br>
-=C2=A0 =C2=A0 file://lircd.conf \<br>
-=C2=A0 =C2=A0 file://lirc_options.conf \<br>
-=C2=A0 =C2=A0 file://lirc.tmpfiles \<br>
-&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-on-32bit-ar=
ches-with-64bit-time_t.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_build_errors.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mplay-Fix-build-with-=
musl.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircd.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircd.init \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircexec.init \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lircd.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lirc_options.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lirc.tmpfiles \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-do-not-cl=
obber-PYTHONPATH-from-build-env.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;3d44ec8274881cf262f160805641f0827ffcc20a=
de0d85e7e6f3b90e0d3d222a&quot;<br>
<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;lirc lirc-exec&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99509): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99509" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99509</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94921643/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94921643/3617156</a><br>
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

--00000000000079a3c205ed0f5563--

