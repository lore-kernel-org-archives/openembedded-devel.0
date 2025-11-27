Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F326D11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 08:42:15 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14406.1764232934643984055
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 00:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bOwKomFb;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c7533dbd87so489779a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 00:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764232934; x=1764837734; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YROsjGO4jl0PCn80WHriYgPsWt9pBgDJMmbSLwj5YRY=;
        b=bOwKomFbq26ADcZBrLLZiHp220UwsJ+0pc5Wd9YlIGkqavINFWvKBN4oweTAdibn/V
         KWiCfLlwg2Gu/tbTsSuk9XxImT6TYqF1s2JRahXh/O4cdczTpcN4mGKif+n5feeAPSZQ
         obipL9zVxcTc/SX4xZoUSPb1GgXO1hFr63qzqPmo/e7X+3bE8zFZ9xh3Axz/QotfM+C6
         D6/wtJYr+pt11FbjLMv59+J+dLXLt9VMjVhPpqV26VIPToSUpBxOk/uWtakURxCyWdL7
         zfBTXadqV+p2oEEnqQnPABQWCX46UYRkqP4pxreDJy3n62Bbl/BX1nECLhtieLXEuJdy
         o6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764232934; x=1764837734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YROsjGO4jl0PCn80WHriYgPsWt9pBgDJMmbSLwj5YRY=;
        b=gIEnPXnZU2ua+8uepBlgJmG7sSP/aLDoMaAd91OJ6YNdjrndsapSWrVjGa+f/6QkDq
         5BQoEB3hMPZuKc1TN1Q8JrTILD5/gAJ8P3xk5WID8cDlK7+vyFgfIj4EVKrxEmppekhU
         4RLyfnZjVXh0fy0UNBsrF+fttT5m7Oup+cLRtdf4dgD3MmIkt7gXIdfAKJ0MFH8Fczgn
         z555JMF2VHsq9mtxISes/Lu+6Do6g3954TxRtkxGqgwEVEL2MNE9Ia2DLkk0BEfmb3n1
         XZuEsMO81+OdKHUsqIY/S+W8wVKnVB0ixydDyaWHZhqlJK/ScViBkgQKPebYeta2nAcS
         lROg==
X-Gm-Message-State: AOJu0YwVPlT6LFbUkRe/f2yzZ4C7l2/tXSOKWDOQynLUPJ2gqBUpRGot
	VtPjJLmhiHiXo7SjRH6cE/1mOnBgVoCfwVBiIVFZv9FAQBZuvsbxcs0Q90Ojqgkj6DUxH/Ecms4
	x9pfH8m9tyTqQPKQtYGLH3Z1Cph2mC7I=
X-Gm-Gg: ASbGnctRKSQXbX3NZJnMjtfVQJylFETrAR0/AS8jd7zwh8RrBzGm/ZeGQTCc50U/kT2
	iyVNSITW+azqRiQhXrgZxxycnqiQKHPLQP7dFcrdxdwnoHQzgAOhrQ++aK1+m45jZcb56qG0tsZ
	u0LBaz8FsdUNX9iDMZ52XXbi3GembhTeSjz+Jnf3hWuCDz46KxWkHelpX5fZc0Dzgt2NEgB8Vbe
	2BKh3pY859PWizqPrsQteWaI9qBW9p63hSfoGcAQgs+fJPTxZ9G4mbqoBfqsilF3dLjvyKd3g==
X-Google-Smtp-Source: AGHT+IFGgrsohvNKUm/o6nweBGA8THlZWzfb0AyDlNT6C+uC46MHQKnHgsEcGtNv7WfuWqEsg7i1QEugMI/378r+JSA=
X-Received: by 2002:a05:6830:43a4:b0:7c5:3a34:994a with SMTP id
 46e09a7af769-7c7c4399d0emr5161911a34.17.1764232933729; Thu, 27 Nov 2025
 00:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20251127023522.519364-1-raj.khem@gmail.com> <20251127023522.519364-2-raj.khem@gmail.com>
In-Reply-To: <20251127023522.519364-2-raj.khem@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 27 Nov 2025 21:42:02 +1300
X-Gm-Features: AWmQ_blRVTub_9L20QISJC4zGZ3WwTKQfNa8mftIdlLmmx-vRQQg1rbvriuUFAc
Message-ID: <CADySD0GBaQegAh-EzkFw6p4mduNRsWHjukO=MAe1cHV9LOi4Vw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] libplist: Upgrade to 2.7.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 08:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122104

On Thu, Nov 27, 2025 at 3:35=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Fix failing ptests
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  ...pes.test-Fix-ostep-invalid-types-tes.patch | 49 +++++++++++++++++++
>  .../{libplist_2.6.0.bb =3D> libplist_2.7.0.bb}  |  8 +--
>  2 files changed, 54 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/00=
01-ostep-invalid-types.test-Fix-ostep-invalid-types-tes.patch
>  rename meta-oe/recipes-extended/libimobiledevice/{libplist_2.6.0.bb =3D>=
 libplist_2.7.0.bb} (89%)
>
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-oste=
p-invalid-types.test-Fix-ostep-invalid-types-tes.patch b/meta-oe/recipes-ex=
tended/libimobiledevice/libplist/0001-ostep-invalid-types.test-Fix-ostep-in=
valid-types-tes.patch
> new file mode 100644
> index 0000000000..798ed47487
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-ostep-inval=
id-types.test-Fix-ostep-invalid-types-tes.patch
> @@ -0,0 +1,49 @@
> +From d87f49535f5e815e91e309472c47da2375cbb5f4 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 26 Nov 2025 18:18:04 -0800
> +Subject: [PATCH] ostep-invalid-types.test: Fix ostep-invalid-types test =
to
> + accept both success and error codes
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The ostep-invalid-types.test expects plistutil to return exit code 2
> +when converting binary plist data containing NSData objects to OpenStep
> +format, since OpenStep format doesn't natively support binary data types=
.
> +
> +However, plistutil's current behavior is to succeed (exit 0) and output
> +the binary data as hex-encoded strings in OpenStep format, which is a
> +valid fallback representation.
> +
> +This patch updates the test to accept both behaviors:
> +- Exit code 0: Success with hex-encoded binary data (current behavior)
> +- Exit code 2: Explicit rejection of unsupported type (expected behavior=
)
> +
> +Both outcomes are acceptable - either the tool can gracefully handle the
> +conversion by encoding binary data as strings, or it can reject formats
> +that don't support all input types. The test should not fail in either c=
ase.
> +
> +Upstream never noticed because they wrote -neq instead of -ne, so the
> +first check is effectively broken and doesn=E2=80=99t enforce the exit c=
ode.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + test/ostep-invalid-types.test | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/test/ostep-invalid-types.test b/test/ostep-invalid-types.te=
st
> +index 240505c..ebfc6b0 100755
> +--- a/test/ostep-invalid-types.test
> ++++ b/test/ostep-invalid-types.test
> +@@ -14,7 +14,8 @@ export PLIST_OSTEP_DEBUG=3D1
> +
> + echo "Converting (failure expected)"
> + $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE0 -o /de=
v/null
> +-if [ $? -ne 2 ]; then
> ++rc=3D$?
> ++if [ $rc -ne 0 ] && [ $rc -ne 2 ]; then

Thanks for the fixes Khem.

There is also a typo in this test, format "openstepn" instead of "openstep"=
 .
While you are at it, will you be able to sort that one as well?

> +   exit 1
> + fi
> +
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb =
b/meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb
> similarity index 89%
> rename from meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb
> index 5f8d1f8d72..1f93e60d45 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.7.0.bb
> @@ -8,13 +8,13 @@ DEPENDS =3D "libxml2 glib-2.0 swig python3"
>
>  inherit autotools pkgconfig python3native python3targetconfig ptest
>
> -SRCREV =3D "2117b8fdb6b4096455bd2041a63e59a028120136"
> +SRCREV =3D "cf5897a71ea412ea2aeb1e2f6b5ea74d4fabfd8c"
>  SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster;tag=3D${PV} \
>             file://run-ptest \
>             file://0001-test-fix-operator-error.patch \
> +           file://0001-ostep-invalid-types.test-Fix-ostep-invalid-types-=
tes.patch \
>  "
>
> -
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
>  CVE_STATUS_LIBLIST[status] =3D "fixed-version: The CPE in the NVD databa=
se doesn't reflect correctly the vulnerable versions."
>  CVE_STATUS_LIBLIST =3D " \
> @@ -37,8 +37,10 @@ do_install_ptest(){
>      # tests expect a particular directory structure for input and output
>      install -d ${D}${PTEST_PATH}/input/test/data
>      install -d ${D}${PTEST_PATH}/test/tools
> +    install -d ${D}${PTEST_PATH}/test/tools/.libs
>      install -d ${D}${PTEST_PATH}/test/test/.libs
>      install -d ${D}${PTEST_PATH}/test/test/data
> +    install -m 0755 ${B}/tools/.libs/plistutil ${D}${PTEST_PATH}/test/to=
ols/.libs/
>      install ${S}/test/data/* ${D}${PTEST_PATH}/input/test/data/
>      install ${S}/test/*.test ${D}${PTEST_PATH}/test/
>      install -m 0755 ${B}/test/.libs/plist* ${D}${PTEST_PATH}/test/test/.=
libs/
> @@ -66,4 +68,4 @@ FILES:${PN}++ =3D "${libdir}/libplist++-2.0${SOLIBS}"
>  FILES:${PN}-utils =3D "${bindir}/*"
>  FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/*"
>
> -RDEPENDS:${PN}-ptest +=3D "bash"
> +RDEPENDS:${PN}-ptest +=3D "bash diffutils"

