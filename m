Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683C3CD98F7
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 22:30:24 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5263.1763073018756212896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 14:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VKEIQsWB;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-640d0895d7cso1744499d50.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 14:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763073018; x=1763677818; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Sflj34pTnVRuIFZo6Ntck3zpD148s+py5RZJtO1lrM=;
        b=VKEIQsWBmntN95FO5BM40xEX7dOmRGACQsV3Vt1bqIz5RHV3vnGF9z1+eAzgQGxbht
         GMVG8Ezc9M7fzwR5dl2jJAdPvsAAcaMlne5Aprm4upBWe+Ia6qqW1BFMT0/cjSfXfheL
         +3glGrQQnL595R2F+MxxknxVYEm5lUpQpP0pahHuvqcuKQMnsj8jg/i3Lz6EiFfYGzoa
         Dedp5KoP9cWI1PZqTNnBsNIbfJqUikfGPEtl4gKbimXrjGqNWGCq+7STx4RkjUNkhtMa
         ZwTV7NqQY/+MRO79cW0Wyogb1i+yH8Gw867zSThSJupqzkFJzyeDt1ZIIMBNGCpwaNqP
         lCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763073018; x=1763677818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Sflj34pTnVRuIFZo6Ntck3zpD148s+py5RZJtO1lrM=;
        b=Mb9vehIEfEWz0HpY2hmfYLKVpE3usuLowLXZI5j4hgjxrw6J3u8ndey2KfebQej2vG
         uVmzp/H7C0K6cuFNtEU9nfPdO9fIb2EzBkiu93PGlWSgSm16auVFJXoo3zYfwJISFQmo
         YXRdmJqNPbvJP03KAKjyyxzBNSKXU0rFl9EmW/1LZ0lFj5c3alVfyrzPEgAwZ2tsk4HK
         CAFPwiU9QOYxEvZFWLYK1RE8+iKRqDe3vNtIaHOAHd78YfPs7GpRkKFdCv4lwBzYllKv
         m24B3ZsQmYHorkJgPS/3q/+aaKldlbdaLiat/3/7uD2w/zGZuGtPm69gpqcw1P9ThU0u
         +nUA==
X-Gm-Message-State: AOJu0YwEvoW6Af3evFOxIC3TobdHA+TFMpTGO1Opcl0ERmRJEGTA+vgN
	1qAcPr084sWKtxTISYFqC3n23JWwp6WM9BOMJ4O7JVyzqpLRtLVFJqLgxiPgZH9C3EcagKlx8G1
	XmBnZCNYu8X4J9ouBmG+h/tzHaYgj1PQ=
X-Gm-Gg: ASbGncsQZMjxS1uwv1KjIRxFI80+WtJw8wOGD3CsgA+vv2LpKPlm40s5+HKRt0jkcVH
	5YcgoiRVPhjmrHfyCcN5uTooorvbZU5tTPsmWinyaa7hMAS3TTGfk6dJlTpjh94XJVQoYX4e5ft
	6oJQpxKwFufm9ajE6yGDLj6Rpf+T8TuhzxxpS9I6gq/O+X3oick6CLayLbxOwjoYVeQpftjHIVm
	BmFc1vu00saFyXxga2Xq08xezoFrNUCikx0e8oVspngeFT1Zal7jT2URtUcFHy+kpUFZ6lEBpya
	0BxGvVQoA2jY2wg7wd/9Qkq6jjeHxKxs/PVl7i2EqqGGSIJG8+nrwSpfmV9+W6qpy6NyDo6meis
	OmJMKQX6jwCcuBMe7oVAQWWgiXidZmCIxAC8=
X-Google-Smtp-Source: AGHT+IGcDlBxnLufWQk/okUd7rgSUgBF5KrugvIWdXRVU0OBcrh0rb+WVz6PG4a5DbgBH0HSMIk3BdAzNDFQ3GKmbMI=
X-Received: by 2002:a05:690e:11c8:b0:640:ce59:128b with SMTP id
 956f58d0204a3-6410d06e011mr3801385d50.2.1763073017865; Thu, 13 Nov 2025
 14:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20251113120611.2590707-1-skandigraun@gmail.com> <20251113120611.2590707-2-skandigraun@gmail.com>
In-Reply-To: <20251113120611.2590707-2-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 14:29:51 -0800
X-Gm-Features: AWmQ_bkveJvev7U92VL9I1A6gjujlMT0F2moaCx56vfaPGYgnbzG4r5gcLqg0Ik
Message-ID: <CAMKF1sqg+noB8XmacL5Sezp-_0=3kG_W05RSgh5Eybktwm=voQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/4] audiofile: add ptest support
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f168700643816c72"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 22:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121660

--000000000000f168700643816c72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Its a good addition but fails to build with clang.

https://errors.yoctoproject.org/Errors/Details/888035/

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

--000000000000f168700643816c72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Its a good addition but fails to build with clang.<div><br=
></div><div><a href=3D"https://errors.yoctoproject.org/Errors/Details/88803=
5/">https://errors.yoctoproject.org/Errors/Details/888035/</a></div></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 13, 2025 at 4:06=E2=80=AFAM Gyorgy Sarvari via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;sk=
andigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">It&#39;s under 15 seconds to execute it.<br>
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

--000000000000f168700643816c72--

