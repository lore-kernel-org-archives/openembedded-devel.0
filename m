Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B30CF64BB
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 05:22:53 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28080.1763616165163182037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 21:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dc/gJ0J8;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78a76afeff6so5109157b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 21:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763616164; x=1764220964; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fP+/kt47UGxL8i5Z1VviGCFrY4zpU32REFSnZHDBA3g=;
        b=dc/gJ0J89sb+aXYsub/tq6jJJkF7ib+QRuZ2UjAs9QO1Eskmc/J3Tyb9NuOlKonzKJ
         5QwSfbMV/ZPtbLMyUKfQEZR7ByEmvttVDuCAUl1AJOH3wOKPAKGFWJ52zLmgyDf+HAV1
         u0br4Bf1QClELWb0Z+iB2vJrTJfDS2uNgFg11s8cWwy+dPCANVbc3R6dyfTiCXZSfFTp
         TEUFju3HcdTgYDkHwtPA4Shq7uXwXRe/dvhr4ro+AXamO0AL6VNjcMWTFLvWfzWTGQAS
         XKoX9Xt56BtKqeNQY5VIHtZlwqQcP2LZdKCU/HZJr+0/Cog36zzDwDTvtDS/Ehou+OW8
         rCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763616164; x=1764220964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fP+/kt47UGxL8i5Z1VviGCFrY4zpU32REFSnZHDBA3g=;
        b=IfKO2lyir8q622ZEB/Qi9nUGc4oHpoRWitdUZekjWpWRFDgfs1BKYpatSTwBYgQf0D
         dBVu5fPurMHBgv0nj15dCBX1hIuKVcD/x0Rnyp4Fw7Zvq7RkRCf+D3JpN7NQ49IP1MX4
         OTNP+WnaKYvMEybEWU7q43xhvsHzfWykvd3EZ4zuIQ30Fofh+ToKYbaq6b+p24BZpJSd
         Yd1GcrP2lwSl/K32UDYK5NLKyGJ5GAAiXP50A8mdKfsiRl67hUDEfVz60gCJiFe2VDtp
         NCsfvTAhyZpNWSBsNvr+uOgm01x+ibTru7pjMAuRhFl7n2ARlycZSrNionhi69eIR37A
         1bSQ==
X-Gm-Message-State: AOJu0Yy0PnxqSpYuOEwFlSIRJYbwDqiOC5kNH7sAHzHXYbUP7bGVAcrG
	vRb+Nkmfp0Avmd9zRknwd5GBgw3Id9DSuZFoEXtVUO/+a7w4QWbGDqRZzJasoXlIEd8LI2PRwHn
	fuFeafWSMsPjwwSwtpT3c/KXBkoGGmiP321BvfK8=
X-Gm-Gg: ASbGnctqYn0toAF+v6WTzH26NMYVejgGgc7j7yPf/i/XHtV8+dtX7CmGIyysCRibKto
	gEkDH4Jmddf4LG5C9nkXbRb9CdrhE//FgIIfzxyjao8t2kNtptls9KhWaQkjD5hfDOcLntdBk7h
	5aKYLgiGHd/7QWmqxkMVGSJQdxou55JScauFC/gqMCk75pIsWm5IvQP/jT/W7yopUzuTrNzQhD1
	mkpEl0HDPZDU5PsD8CNBqg5iquRclUpG49QPQrEtmysZFDKrWLhZfxcinOEk/4sWXuya7aJEg76
	MZ0BAcIwycCQZofjkhZE9NDq0lCWYWPR7CRmaZRdIJI02ZaIzVaEOtv7dSm/ir63DBxL4CCfWcH
	C4pe2/SBO6IKU6rI8cIsPcMZBlD0rOfyqBScM8g==
X-Google-Smtp-Source: AGHT+IFDvQOb+x+7EzHUVtM+KbVdfej71Gb670s7q3XdQhtL+DUrULRA/UNi0XWrjfCJdaaM+gKetN0La5JS0O18yNA=
X-Received: by 2002:a05:690c:724a:b0:786:5789:57d1 with SMTP id
 00721157ae682-78a7cd12859mr6818937b3.52.1763616164225; Wed, 19 Nov 2025
 21:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20251120032931.3639995-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20251120032931.3639995-1-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Nov 2025 21:22:17 -0800
X-Gm-Features: AWmQ_bk_hR3t3o-czS0bUADberBJPY--MNrtkYTd49sRNT0d3ef9pJzQ3KqBImA
Message-ID: <CAMKF1sqixpcnxqE-y9y9v0Fk5Umr6Mit2gLWKjZFDDJ125E5OQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2 1/2] libplist: add ptest support
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fd27730643ffe2dc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 05:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121925

--000000000000fd27730643ffe2dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm, I have applied v1 already, so please rebase this on top of the latest
master and resend the delta, this will need to be backported to whinlatter
too.

On Wed, Nov 19, 2025 at 7:29=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
> changes in v2:
> - added patch to fix ptest error
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>  .../0001-test-fix-operator-error.patch        | 68 +++++++++++++++++++
>  .../libimobiledevice/libplist/run-ptest       |  6 ++
>  .../libimobiledevice/libplist_2.6.0.bb        | 31 ++++++++-
>  4 files changed, 104 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator=
-error.patch
>  create mode 100644
> meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> index 09b1dbb3e1..25db9fe5cc 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -54,6 +54,7 @@ PTESTS_FAST_META_OE =3D "\
>      xmlsec1 \
>      zeromq \
>      cjson \
> +    libplist \
>  "
>  PTESTS_FAST_META_OE:append:x86 =3D " mcelog"
>  PTESTS_FAST_META_OE:append:x86-64 =3D " mcelog"
> diff --git
> a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operat=
or-error.patch
> b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operat=
or-error.patch
> new file mode 100644
> index 0000000000..0866851537
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operat=
or-error.patch
> @@ -0,0 +1,68 @@
> +From 18e5b22a71f85091127cc063db79c8df687c582c Mon Sep 17 00:00:00 2001
> +From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +Date: Thu, 20 Nov 2025 16:01:58 +1300
> +Subject: [PATCH] test: fix operator error
> +
> +Otherwise test fail with error [: -neq: binary operator expected
> +
> +Upstream-Status: Submitted [
> https://github.com/libimobiledevice/libplist/pull/284]
> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> +---
> + test/json-invalid-types.test  | 6 +++---
> + test/ostep-invalid-types.test | 6 +++---
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/test/json-invalid-types.test b/test/json-invalid-types.test
> +index c532316..a21fcd9 100755
> +--- a/test/json-invalid-types.test
> ++++ b/test/json-invalid-types.test
> +@@ -14,19 +14,19 @@ export PLIST_JSON_DEBUG=3D1
> +
> + echo "Converting (failure expected)"
> + $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE0 -o /dev/nu=
ll
> +-if [ $? -neq 2 ]; then
> ++if [ $? -ne 2 ]; then
> +   exit 1
> + fi
> +
> + echo "Converting (failure expected)"
> + $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE1 -o /dev/nu=
ll
> +-if [ $? -neq 2 ]; then
> ++if [ $? -ne 2 ]; then
> +   exit 2
> + fi
> +
> + echo "Converting (failure expected)"
> + $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE2 -o /dev/nu=
ll
> +-if [ $? -neq 2 ]; then
> ++if [ $? -ne 2 ]; then
> +   exit 3
> + fi
> +
> +diff --git a/test/ostep-invalid-types.test b/test/ostep-invalid-types.te=
st
> +index 9222394..240505c 100755
> +--- a/test/ostep-invalid-types.test
> ++++ b/test/ostep-invalid-types.test
> +@@ -14,19 +14,19 @@ export PLIST_OSTEP_DEBUG=3D1
> +
> + echo "Converting (failure expected)"
> + $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE0 -o
> /dev/null
> +-if [ $? -neq 2 ]; then
> ++if [ $? -ne 2 ]; then
> +   exit 1
> + fi
> +
> + echo "Converting (failure expected)"
> + $top_builddir/tools/plistutil -f openstepn -i $DATASRC/$TESTFILE1 -o
> /dev/null
> +-if [ $? -neq 2 ]; then
> ++if [ $? -ne 2 ]; then
> +   exit 2
> + fi
> +
> + echo "Converting (failure expected)"
> + $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE2 -o
> /dev/null
> +-if [ $? -neq 2 ]; then
> ++if [ $? -ne 2 ]; then
> +   exit 3
> + fi
> +
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
> b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
> new file mode 100644
> index 0000000000..ed940af5f6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +
> +for t in `ls test/*.test`; do
> +       top_srcdir=3D$(pwd)/input top_builddir=3D$(pwd)/test ./$t && echo
> PASS: $t || echo FAIL: $t
> +       rm $(pwd)/test/test/data/* 2>/dev/null
> +done
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> index 7f01962a97..831b74cd1f 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> @@ -6,10 +6,13 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Debb5c50ab7cab4baeffba14977030c07 \
>
>  DEPENDS =3D "libxml2 glib-2.0 swig python3"
>
> -inherit autotools pkgconfig python3native python3targetconfig
> +inherit autotools pkgconfig python3native python3targetconfig ptest
>
>  SRCREV =3D "2117b8fdb6b4096455bd2041a63e59a028120136"
> -SRC_URI =3D "git://
> github.com/libimobiledevice/libplist;protocol=3Dhttps;branch=3Dmaster"
> +SRC_URI =3D "git://
> github.com/libimobiledevice/libplist;protocol=3Dhttps;branch=3Dmaster \
> +           file://run-ptest \
> +           file://0001-test-fix-operator-error.patch \
> +"
>
>
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
> @@ -30,6 +33,28 @@ do_install:append () {
>      fi
>  }
>
> +do_install_ptest(){
> +    # tests expect a particular directory structure for input and output
> +    install -d ${D}${PTEST_PATH}/input/test/data
> +    install -d ${D}${PTEST_PATH}/test/tools
> +    install -d ${D}${PTEST_PATH}/test/test/.libs
> +    install -d ${D}${PTEST_PATH}/test/test/data
> +    install ${S}/test/data/* ${D}${PTEST_PATH}/input/test/data/
> +    install ${S}/test/*.test ${D}${PTEST_PATH}/test/
> +    install -m 0755 ${B}/test/.libs/plist*
> ${D}${PTEST_PATH}/test/test/.libs/
> +    install -m 0755 ${B}/test/.libs/integer_set_test
> ${D}${PTEST_PATH}/test/test/
> +    for t in $(find ${B}/test -type f -name 'plist*' \! -name '*.o'); do
> +        install -m 0755 $t ${D}${PTEST_PATH}/test/test/
> +    done
> +    for t in $(find ${B}/tools -type f -name 'plist*' \! -name '*.o'); d=
o
> +        install -m 0755 $t ${D}${PTEST_PATH}/test/tools/
> +    done
> +    sed -i 's@LD_LIBRARY_PATH=3D"[^"]*:@LD_LIBRARY_PATH=3D"@g' \
> +        ${D}${PTEST_PATH}/test/test/plist_cmp
> +    sed -i 's@LD_LIBRARY_PATH=3D"[^"]*:@LD_LIBRARY_PATH=3D"@g' \
> +        ${D}${PTEST_PATH}/test/test/plist_test
> +}
> +
>  PACKAGES =3D+ "${PN}-utils \
>               ${PN}++ \
>               ${PN}-python"
> @@ -38,3 +63,5 @@ FILES:${PN} =3D "${libdir}/libplist-2.0${SOLIBS}"
>  FILES:${PN}++ =3D "${libdir}/libplist++-2.0${SOLIBS}"
>  FILES:${PN}-utils =3D "${bindir}/*"
>  FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> +
> +RDEPENDS:${PN}-ptest +=3D "bash"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121921):
> https://lists.openembedded.org/g/openembedded-devel/message/121921
> Mute This Topic: https://lists.openembedded.org/mt/116386363/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fd27730643ffe2dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hmm, I have applied v1 already, so please rebase this on t=
op of the latest master and resend the delta, this will need to be backport=
ed to whinlatter too.</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 19, 2025 at 7:29=E2=
=80=AFPM Ankur Tyagi via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Ankur Tyagi &lt;<a hr=
ef=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">ankur.tyagi85@gmail=
.com</a>&gt;<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
changes in v2:<br>
- added patch to fix ptest error<br>
---<br>
=C2=A0.../include/ptest-packagelists-meta-oe.inc=C2=A0 =C2=A0 |=C2=A0 1 +<b=
r>
=C2=A0.../0001-test-fix-operator-error.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6=
8 +++++++++++++++++++<br>
=C2=A0.../libimobiledevice/libplist/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 ++<br>
=C2=A0.../libimobiledevice/<a href=3D"http://libplist_2.6.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">libplist_2.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 31 ++++++++-<br>
=C2=A04 files changed, 104 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist=
/0001-test-fix-operator-error.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist=
/run-ptest<br>
<br>
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc<br>
index 09b1dbb3e1..25db9fe5cc 100644<br>
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc<br>
@@ -54,6 +54,7 @@ PTESTS_FAST_META_OE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0xmlsec1 \<br>
=C2=A0 =C2=A0 =C2=A0zeromq \<br>
=C2=A0 =C2=A0 =C2=A0cjson \<br>
+=C2=A0 =C2=A0 libplist \<br>
=C2=A0&quot;<br>
=C2=A0PTESTS_FAST_META_OE:append:x86 =3D &quot; mcelog&quot;<br>
=C2=A0PTESTS_FAST_META_OE:append:x86-64 =3D &quot; mcelog&quot;<br>
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-f=
ix-operator-error.patch b/meta-oe/recipes-extended/libimobiledevice/libplis=
t/0001-test-fix-operator-error.patch<br>
new file mode 100644<br>
index 0000000000..0866851537<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-oper=
ator-error.patch<br>
@@ -0,0 +1,68 @@<br>
+From 18e5b22a71f85091127cc063db79c8df687c582c Mon Sep 17 00:00:00 2001<br>
+From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D=
"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
+Date: Thu, 20 Nov 2025 16:01:58 +1300<br>
+Subject: [PATCH] test: fix operator error<br>
+<br>
+Otherwise test fail with error [: -neq: binary operator expected<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/libimobiledevice=
/libplist/pull/284" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/libimobiledevice/libplist/pull/284</a>]<br>
+Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
+---<br>
+ test/json-invalid-types.test=C2=A0 | 6 +++---<br>
+ test/ostep-invalid-types.test | 6 +++---<br>
+ 2 files changed, 6 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/test/json-invalid-types.test b/test/json-invalid-types.test<b=
r>
+index c532316..a21fcd9 100755<br>
+--- a/test/json-invalid-types.test<br>
++++ b/test/json-invalid-types.test<br>
+@@ -14,19 +14,19 @@ export PLIST_JSON_DEBUG=3D1<br>
+ <br>
+ echo &quot;Converting (failure expected)&quot;<br>
+ $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE0 -o /dev/null=
<br>
+-if [ $? -neq 2 ]; then<br>
++if [ $? -ne 2 ]; then<br>
+=C2=A0 =C2=A0exit 1<br>
+ fi<br>
+ <br>
+ echo &quot;Converting (failure expected)&quot;<br>
+ $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE1 -o /dev/null=
<br>
+-if [ $? -neq 2 ]; then<br>
++if [ $? -ne 2 ]; then<br>
+=C2=A0 =C2=A0exit 2<br>
+ fi<br>
+ <br>
+ echo &quot;Converting (failure expected)&quot;<br>
+ $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE2 -o /dev/null=
<br>
+-if [ $? -neq 2 ]; then<br>
++if [ $? -ne 2 ]; then<br>
+=C2=A0 =C2=A0exit 3<br>
+ fi<br>
+ <br>
+diff --git a/test/ostep-invalid-types.test b/test/ostep-invalid-types.test=
<br>
+index 9222394..240505c 100755<br>
+--- a/test/ostep-invalid-types.test<br>
++++ b/test/ostep-invalid-types.test<br>
+@@ -14,19 +14,19 @@ export PLIST_OSTEP_DEBUG=3D1<br>
+ <br>
+ echo &quot;Converting (failure expected)&quot;<br>
+ $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE0 -o /dev/=
null<br>
+-if [ $? -neq 2 ]; then<br>
++if [ $? -ne 2 ]; then<br>
+=C2=A0 =C2=A0exit 1<br>
+ fi<br>
+ <br>
+ echo &quot;Converting (failure expected)&quot;<br>
+ $top_builddir/tools/plistutil -f openstepn -i $DATASRC/$TESTFILE1 -o /dev=
/null<br>
+-if [ $? -neq 2 ]; then<br>
++if [ $? -ne 2 ]; then<br>
+=C2=A0 =C2=A0exit 2<br>
+ fi<br>
+ <br>
+ echo &quot;Converting (failure expected)&quot;<br>
+ $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE2 -o /dev/=
null<br>
+-if [ $? -neq 2 ]; then<br>
++if [ $? -ne 2 ]; then<br>
+=C2=A0 =C2=A0exit 3<br>
+ fi<br>
+ <br>
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest b=
/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest<br>
new file mode 100644<br>
index 0000000000..ed940af5f6<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest<br>
@@ -0,0 +1,6 @@<br>
+#!/bin/sh<br>
+<br>
+for t in `ls test/*.test`; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0top_srcdir=3D$(pwd)/input top_builddir=3D$(pwd)=
/test ./$t &amp;&amp; echo PASS: $t || echo FAIL: $t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm $(pwd)/test/test/data/* 2&gt;/dev/null<br>
+done<br>
diff --git a/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://li=
bplist_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libplist_2.6.0.bb</a>=
 b/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libplist_2.6=
.0.bb" rel=3D"noreferrer" target=3D"_blank">libplist_2.6.0.bb</a><br>
index 7f01962a97..831b74cd1f 100644<br>
--- a/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libplist_=
2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libplist_2.6.0.bb</a><br>
+++ b/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libplist_=
2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libplist_2.6.0.bb</a><br>
@@ -6,10 +6,13 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Debb5c50ab=
7cab4baeffba14977030c07 \<br>
<br>
=C2=A0DEPENDS =3D &quot;libxml2 glib-2.0 swig python3&quot;<br>
<br>
-inherit autotools pkgconfig python3native python3targetconfig<br>
+inherit autotools pkgconfig python3native python3targetconfig ptest<br>
<br>
=C2=A0SRCREV =3D &quot;2117b8fdb6b4096455bd2041a63e59a028120136&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/libimobiledevice/libp=
list;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank"=
>github.com/libimobiledevice/libplist;protocol=3Dhttps;branch=3Dmaster</a>&=
quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/libimobiledevice/libp=
list;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank"=
>github.com/libimobiledevice/libplist;protocol=3Dhttps;branch=3Dmaster</a> =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-fix-operator-err=
or.patch \<br>
+&quot;<br>
<br>
<br>
=C2=A0CVE_STATUS_GROUPS +=3D &quot;CVE_STATUS_LIBLIST&quot;<br>
@@ -30,6 +33,28 @@ do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
+do_install_ptest(){<br>
+=C2=A0 =C2=A0 # tests expect a particular directory structure for input an=
d output<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/input/test/data<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test/tools<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test/test/.libs<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test/test/data<br>
+=C2=A0 =C2=A0 install ${S}/test/data/* ${D}${PTEST_PATH}/input/test/data/<=
br>
+=C2=A0 =C2=A0 install ${S}/test/*.test ${D}${PTEST_PATH}/test/<br>
+=C2=A0 =C2=A0 install -m 0755 ${B}/test/.libs/plist* ${D}${PTEST_PATH}/tes=
t/test/.libs/<br>
+=C2=A0 =C2=A0 install -m 0755 ${B}/test/.libs/integer_set_test ${D}${PTEST=
_PATH}/test/test/<br>
+=C2=A0 =C2=A0 for t in $(find ${B}/test -type f -name &#39;plist*&#39; \! =
-name &#39;*.o&#39;); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 $t ${D}${PTEST_PATH}/test/test=
/<br>
+=C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 for t in $(find ${B}/tools -type f -name &#39;plist*&#39; \!=
 -name &#39;*.o&#39;); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 $t ${D}${PTEST_PATH}/test/tool=
s/<br>
+=C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 sed -i &#39;s@LD_LIBRARY_PATH=3D&quot;[^&quot;]*:@LD_LIBRARY=
_PATH=3D&quot;@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${PTEST_PATH}/test/test/plist_cmp<br>
+=C2=A0 =C2=A0 sed -i &#39;s@LD_LIBRARY_PATH=3D&quot;[^&quot;]*:@LD_LIBRARY=
_PATH=3D&quot;@g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${PTEST_PATH}/test/test/plist_test<br>
+}<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-utils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}++ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PN}-python&quot;<br>
@@ -38,3 +63,5 @@ FILES:${PN} =3D &quot;${libdir}/libplist-2.0${SOLIBS}&quo=
t;<br>
=C2=A0FILES:${PN}++ =3D &quot;${libdir}/libplist++-2.0${SOLIBS}&quot;<br>
=C2=A0FILES:${PN}-utils =3D &quot;${bindir}/*&quot;<br>
=C2=A0FILES:${PN}-python =3D &quot;${PYTHON_SITEPACKAGES_DIR}/*&quot;<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;bash&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121921): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121921" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121921</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116386363/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116386363/1997914</a><br>
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

--000000000000fd27730643ffe2dc--

