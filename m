Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA9ECDB46A
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 01:38:55 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8707.1763084334422475264
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 17:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MqFYrI+N;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d71bcac45so14319347b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 17:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763084333; x=1763689133; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FpOa/rPZDB8XkJC9PpymSoDANzDKbjQVUCdyuCkT6JI=;
        b=MqFYrI+Nbp3sqGB2ngI+RMVoINLWxQkP0rujIXh6KsNbagymE3pUn7z6KkG7zqgcTU
         GDJ2MRgavEH8VqgcJXq81Lq1F+syK91Y5TtS50HjbZ0p9/rCm24b4I2Kqv65jf8kZovW
         HJPtxhd/UfIsN35FvnKRJD64Q59RIDOfY8T9c3XqFY7HGABvFaMnri0XkThl/i6Ui6bT
         rDIQhHpxPa4ZF/tG1c8CFCfX+KknPUFVshOm28xLL/LgC+KoEgj5CFB917hcst12OrP2
         R5G91uvP3bq0NDZ/UWgQJ1eoZN26CEqXp8xSWjzIhoMvTuHGfyW9IOF5nRyZ2Jo3P7+l
         D+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763084333; x=1763689133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpOa/rPZDB8XkJC9PpymSoDANzDKbjQVUCdyuCkT6JI=;
        b=RzIGZzOCICMD96EZ1K4PWsBn1Nf8u1vWOB6PznhIMB700uE6/RQttmbqB8Xl4zkVgZ
         lI7zdW0OVwoJ6/VPWv1Bz5ccSd284iJvdi9RAiuUgSafhs57I8d9TXVkzZ2nH69XwREm
         hUdM3C5ewk7D1r9MR++gc34bxqfxk23C4U1e55pIOhDSK0BtDCmPVniCjoJz99QhQwlS
         Sun2RvRC6BBLNMlxnXQy1+G/6rRXNH66gezgFhr2bsQhk2cO3PXH0FzhL18TISDfFz2r
         DazAyGlZoycaD6l0r02M8p1JLhNbmFZ2byAIjanldwrYitJwUTpzZxpqmWtLIvR3l8RV
         PpHg==
X-Gm-Message-State: AOJu0YzuOuDbhLyNX2Fk1orfAUq5IZBJyQXXOP2PRWhspyuTQz7Cb9db
	3SaDhLAwG3gb/Nrd8a9C+hqagWCLmYZ4sph1nVgUiERslNl/IlH9eXLblGzy0zqFFUeZcC4511R
	Kh7u9nFu0rfRxbYvYQzOoTbv3X+U1AxTiFlspidI=
X-Gm-Gg: ASbGncuYbHqUB27dFwRj9Xj0l5j8LXObqtkbrup3tug4FAyshgmREQ1K4NArG0GcDrL
	jF7809DDtDbMbkiTf3lo86vBGWDoGDA+xNCdcdhEu4MtfC5N9VV4wSTSy1Qlmr3hswx5q/KWyJQ
	PU/ND6P9suL9Ef+HTIQmBgDK+6V/EzYu1seB8+zNt5Gq+zJcpfXiK4cYQ5yNBoJrsZRJSvD0u4X
	2DBfIlFFuiU/hnuxn2Y/0P/YQMf57mVvLdhwBuPGKKifMeF2GUFxXQRTFCBVwceEZLL8iNmBt8U
	kdEhDqS6y8fmeSBk/v28UW6rIeD7CLCJ2LSJ+nmvolkGskrhVSkyYhxqJJMZS72HrrHiwsAWoI2
	gfGaY6RQatpTI66yDB3SKGhx3zNg=
X-Google-Smtp-Source: AGHT+IEXvzHJA4UKa460qAj7JSJDN33lrETuRPR8sksqlcbXfDOwYkaA/2/XXsMtXxDxF5nuEcOhnbH1omnkaJc46sU=
X-Received: by 2002:a05:690c:c36b:b0:785:c438:e4d2 with SMTP id
 00721157ae682-78929f0a53amr12619207b3.34.1763084333459; Thu, 13 Nov 2025
 17:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20251113120611.2590707-1-skandigraun@gmail.com> <20251113120611.2590707-2-skandigraun@gmail.com>
In-Reply-To: <20251113120611.2590707-2-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 17:38:27 -0800
X-Gm-Features: AWmQ_blA4N_Yo5yjuA79ul-btUdjIfdm_mdFtDHeMuE8f0loIwmfPqsVlQV4xwo
Message-ID: <CAMKF1srYSqLuW05755afPi6h4jRUSVz-30z+xuWxMubB6Qu8LA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] audiofile: add ptest support
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000067ad4c0643840f06"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 01:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121662

--00000000000067ad4c0643840f06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have send a patch that makes clang happy. Please test it out and let me
know
secondly the run-ptest script has trailing white-spaces, please delete them
in v2 series.

On Thu, Nov 13, 2025 at 4:06=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> It's under 15 seconds to execute it.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc     |  1 +
>  .../audiofile/audiofile_0.3.6.bb               | 18 +++++++++++++++++-
>  .../audiofile/files/run-ptest                  | 14 ++++++++++++++
>  3 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-multimedia/audiofile/files/run-ptest
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index 1d5932c315..96e0d87bd4 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -8,6 +8,7 @@
>  # ptests which take less than ~30s each
>  PTESTS_FAST_META_OE =3D "\
>      asio \
> +    audiofile \
>      cli11 \
>      cmocka \
>      cunit \
> diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> index fd80729bd2..f734a41dfc 100644
> --- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> +++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c \
>
>  SRC_URI =3D " \
>      ${GNOME_MIRROR}/audiofile/0.3/${BP}.tar.xz \
> +    file://run-ptest \
>      file://0001-fix-negative-shift-constants.patch \
>      file://0002-fix-build-on-gcc6.patch \
>      file://0003-fix-CVE-2015-7747.patch \
> @@ -23,7 +24,7 @@ SRC_URI =3D " \
>  "
>  SRC_URI[sha256sum] =3D
> "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
>
> -inherit autotools lib_package pkgconfig
> +inherit autotools lib_package pkgconfig ptest
>
>  CXXFLAGS +=3D "-std=3Dc++14"
>
> @@ -33,3 +34,18 @@ DEPENDS =3D " \
>      libogg \
>      flac \
>  "
> +
> +do_compile_ptest(){
> +    oe_runmake -C gtest libgtest.la
> +    cd test
> +    # Query the TESTS variable value, remove the $(...) parts from it,
> +    # compile as make target along with FLAC (which is an optional test)
> +    oe_runmake `make -p | grep "^TESTS =3D " | sed 's/$([^)]*)//g' | cut
> -d=3D -f2` FLAC
> +}
> +
> +do_install_ptest(){
> +    install -d ${D}${PTEST_PATH}/test
> +    for t in test/.libs/*; do
> +        install $t ${D}${PTEST_PATH}/test/
> +    done
> +}
> diff --git a/meta-oe/recipes-multimedia/audiofile/files/run-ptest
> b/meta-oe/recipes-multimedia/audiofile/files/run-ptest
> new file mode 100644
> index 0000000000..cdf1677bde
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/audiofile/files/run-ptest
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +
> +RES=3D0
> +cd test
> +for t in *; do
> +  if ./$t; then
> +    echo PASS: $t
> +  else
> +    echo FAIL: $t
> +    RES=3D1
> +  fi
> +done
> +
> +exit $RES
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121646):
> https://lists.openembedded.org/g/openembedded-devel/message/121646
> Mute This Topic: https://lists.openembedded.org/mt/116272850/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000067ad4c0643840f06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have send a patch that makes clang happy. Please test it=
 out and=C2=A0let me know<div>secondly the run-ptest script has trailing wh=
ite-spaces, please delete them in v2 series.</div></div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Nov 13, 2025 at 4:06=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">It&#39;s under 15 seconds to execute it.<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 1 +<br>
=C2=A0.../audiofile/<a href=3D"http://audiofile_0.3.6.bb" rel=3D"noreferrer=
" target=3D"_blank">audiofile_0.3.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++++++++++++++-<br>
=C2=A0.../audiofile/files/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 14 ++++++++++++++<br>
=C2=A03 files changed, 32 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/audiofile/files/run-pte=
st<br>
<br>
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc<br>
index 1d5932c315..96e0d87bd4 100644<br>
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
@@ -8,6 +8,7 @@<br>
=C2=A0# ptests which take less than ~30s each<br>
=C2=A0PTESTS_FAST_META_OE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0asio \<br>
+=C2=A0 =C2=A0 audiofile \<br>
=C2=A0 =C2=A0 =C2=A0cli11 \<br>
=C2=A0 =C2=A0 =C2=A0cmocka \<br>
=C2=A0 =C2=A0 =C2=A0cunit \<br>
diff --git a/meta-oe/recipes-multimedia/audiofile/<a href=3D"http://audiofi=
le_0.3.6.bb" rel=3D"noreferrer" target=3D"_blank">audiofile_0.3.6.bb</a> b/=
meta-oe/recipes-multimedia/audiofile/<a href=3D"http://audiofile_0.3.6.bb" =
rel=3D"noreferrer" target=3D"_blank">audiofile_0.3.6.bb</a><br>
index fd80729bd2..f734a41dfc 100644<br>
--- a/meta-oe/recipes-multimedia/audiofile/<a href=3D"http://audiofile_0.3.=
6.bb" rel=3D"noreferrer" target=3D"_blank">audiofile_0.3.6.bb</a><br>
+++ b/meta-oe/recipes-multimedia/audiofile/<a href=3D"http://audiofile_0.3.=
6.bb" rel=3D"noreferrer" target=3D"_blank">audiofile_0.3.6.bb</a><br>
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380=
cdd255951079008b364516c \<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${GNOME_MIRROR}/audiofile/0.3/${BP}.tar.xz \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-fix-negative-shift-constants.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0002-fix-build-on-gcc6.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0003-fix-CVE-2015-7747.patch \<br>
@@ -23,7 +24,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ea2449ad3f201ec590d811db9da6d02ffc5e87a6=
77d06b92ab15363d8cb59782&quot;<br>
<br>
-inherit autotools lib_package pkgconfig<br>
+inherit autotools lib_package pkgconfig ptest<br>
<br>
=C2=A0CXXFLAGS +=3D &quot;-std=3Dc++14&quot;<br>
<br>
@@ -33,3 +34,18 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0libogg \<br>
=C2=A0 =C2=A0 =C2=A0flac \<br>
=C2=A0&quot;<br>
+<br>
+do_compile_ptest(){<br>
+=C2=A0 =C2=A0 oe_runmake -C gtest <a href=3D"http://libgtest.la" rel=3D"no=
referrer" target=3D"_blank">libgtest.la</a><br>
+=C2=A0 =C2=A0 cd test<br>
+=C2=A0 =C2=A0 # Query the TESTS variable value, remove the $(...) parts fr=
om it,<br>
+=C2=A0 =C2=A0 # compile as make target along with FLAC (which is an option=
al test)<br>
+=C2=A0 =C2=A0 oe_runmake `make -p | grep &quot;^TESTS =3D &quot; | sed &#3=
9;s/$([^)]*)//g&#39; | cut -d=3D -f2` FLAC<br>
+}<br>
+<br>
+do_install_ptest(){<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test<br>
+=C2=A0 =C2=A0 for t in test/.libs/*; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install $t ${D}${PTEST_PATH}/test/<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
diff --git a/meta-oe/recipes-multimedia/audiofile/files/run-ptest b/meta-oe=
/recipes-multimedia/audiofile/files/run-ptest<br>
new file mode 100644<br>
index 0000000000..cdf1677bde<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-multimedia/audiofile/files/run-ptest<br>
@@ -0,0 +1,14 @@<br>
+#!/bin/sh<br>
+<br>
+RES=3D0<br>
+cd test<br>
+for t in *; do<br>
+=C2=A0 if ./$t; then=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 echo PASS: $t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 echo FAIL: $t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 RES=3D1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 fi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>
+done=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>
+exit $RES<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121646): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121646" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121646</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116272850/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116272850/1997914</a><br>
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

--00000000000067ad4c0643840f06--

