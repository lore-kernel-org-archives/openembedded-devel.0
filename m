Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FF7CF3196
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:57:56 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3997.1763549871992232336
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=efpQ+xlC;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3e3dac349easo3883598fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 02:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763549871; x=1764154671; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAvLfD8nVuZifI6qGIj+AvetttkpMX9ZKnO7psoNG8I=;
        b=efpQ+xlCkSj0qM0/ePyAZ5UwOFxKKcz+ZpYSBQxXuRKmLQtEqTnCZ7VMyV3xNBPqtH
         m+Gxzgp+4fRBCRsuntqBVi2awuHjNLXx9mG+XXo3ZcGjp/fYn2gLfsQ8n8V1iL/KlJ7T
         BzuzhSgl19Cm1+soB9bAclKrMry4zKbWapLjKkCeT+yEkXmI2FgSmyxkCBfqCyts8oqn
         goAtL0cYGenGx5SN2ApGS88XQ90OKZ912fp26qN5Az8mfkb2Uhxj0dFY2J0pmhV9uGt4
         eoHZrN6IexREuRXhSKXnVmnz+1ijaAbuPEf+ixa8+fKFexe6u8U3148oY3C0ACm1Et18
         7GKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549871; x=1764154671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iAvLfD8nVuZifI6qGIj+AvetttkpMX9ZKnO7psoNG8I=;
        b=RSkw3jtXTUlOQd44WOMdri/3vTG5k0kN0U62Y0Y/GDZZvcTz2qV/4XZlwTfrrkLopL
         jbbCeNC3RDl7l45oAs4xSVptbR1xVRfNxkvOYaUn14NbGjuw+w94RC9i4uOrJMSFw44Z
         JKNDDJeScA9oET9m8tGHYDM7Tl/1QczpkiwYIH8WLMwUyajv+woD19QdG9z3/YG5U+mB
         6tld6JQcC7uBVLgRypxXKRW/dsptPrB2FxLWGw0FSf47e0FV9QJl5rVbisg/QdmoIbSq
         4CvzbUMrTsV/A8XjrM7VsL7DCUhcV32ITo2huBuZYsbMHFtOeFXbXhLsdp7EuzyTB6gE
         LLzQ==
X-Gm-Message-State: AOJu0YxhYjxqmn3LHCb9W/qMZn9xS9rdqut1lsW0r5dxvouucKDebYEt
	MAu+weTCVn8ijXcoIgPwEVul7tXvI/evXE8o0guaOP4O5fqUBghRFsHtNqB0HFqrEl+Ql+QHGAE
	uw74LdgTG+9P8o8DeaQibwD2apVIUrpg6IMXs
X-Gm-Gg: ASbGncu7CaHu8uJexj3CJFLhW+fG2KhUgSL+BK65GolpBk2PgCGHa3DGmJm8EiwITY+
	E4SgWUCxv6R1Rb5DP1yRNDkR3xudilXeOYpHgn8o8u1nyrd+5xlMtOljZketwXO5gf7ngt/wz9G
	rWv+lDAGTkyDS1ZD0jy15Wfa+rdHxH8NDyUry8WJqsHtn4E5s84WIntiGZWYyYqPPQ4bwUtOHaB
	AZUxXvTz74U8uX6BxkDwyCMNCViqZbCcLp5cS0c22901eZHOpk5nCYT2f4OLnf8qDXoNMpqPCAe
	atM/sJWI
X-Google-Smtp-Source: AGHT+IGJMx8eliRrMd2MWyEGR3/TGkcPU4uY98/sdmK+M6CJKuaHys/SX7mMKI4fxDfK9OAqm9Y5N+l+zOc+0/XawNc=
X-Received: by 2002:a05:6870:2208:b0:3e7:eee7:9466 with SMTP id
 586e51a60fabf-3e8691344c9mr8326243fac.39.1763549871138; Wed, 19 Nov 2025
 02:57:51 -0800 (PST)
MIME-Version: 1.0
References: <20251119105328.2849176-1-ankur.tyagi85@gmail.com> <18796309B75AD22C.1255594@lists.openembedded.org>
In-Reply-To: <18796309B75AD22C.1255594@lists.openembedded.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 19 Nov 2025 23:57:39 +1300
X-Gm-Features: AWmQ_bm1v9us8Cuo54SwwofBQlau2pku_VbINdD3UvBPP7vhSOWHTksn-YwvCgw
Message-ID: <CADySD0HjNzgqHbvf=SERmsst-XNeH-ZmgqcXHU6HxCd-M3HREQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 3/6] libplist: add ptest support
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121898

ptest summary:

root@qemux86-64:~# time ptest-runner libplist
START: ptest-runner
2025-11-19T10:23
BEGIN: /usr/lib64/libplist/ptest
ERROR: Could not parse plist data, expected XML or binary plist
PASS: test/amp.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/6.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 99092
Output size : 99083
Comparing
PList parsing succeeded
PASS: test/bigarray++.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/6.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 99092
Output size : 99083
Comparing
PList parsing succeeded
PASS: test/bigarray.test
PList parsing succeeded
PASS: test/cdata.test
PList parsing succeeded
PList parsing succeeded
PASS: test/dates.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/1.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 752
Output size : 765
Comparing
PList parsing succeeded
PASS: test/empty++.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/1.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 752
Output size : 765
Comparing
PList parsing succeeded
PASS: test/empty.test
PList parsing succeeded
PASS: test/empty_keys.test
PList parsing succeeded
PASS: test/entities.test
PList parsing succeeded
PASS: test/hex.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/5.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 4292380
Output size : 4305301
Comparing
PList parsing succeeded
PASS: test/huge++.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/5.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 4292380
Output size : 4305301
Comparing
PList parsing succeeded
PASS: test/huge.test
SUCCESS: plist_set_uint_val with 0x8000000000000000LL
SUCCESS: plist_set_int_val with 0x8000000000000000LL
SUCCESS: plist_set_uint_val with (uint64_t)-1LL
SUCCESS: plist_set_int_val with -1LL
SUCCESS: plist_set_uint_val with 0x8000000000000001LL
SUCCESS: plist_set_uint_val with 0x8000000000000001LL
PASS: test/integer_set.test
ERROR: Could not parse plist data, expected XML or binary plist
PASS: test/invalid_tag.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/int64_min_max.json is open
PList JSON parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList JSON writing succeeded
Comparing
PList parsing succeeded
PASS: test/json-int64-min-max.test
Converting (failure expected)
ERROR: Input plist data is not compatible with output format.
./test/json-invalid-types.test: line 17: [: -neq: binary operator expected
Converting (failure expected)
ERROR: Input plist data is not compatible with output format.
./test/json-invalid-types.test: line 23: [: -neq: binary operator expected
Converting (failure expected)
ERROR: Input plist data is not compatible with output format.
./test/json-invalid-types.test: line 29: [: -neq: binary operator expected
PASS: test/json-invalid-types.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/j1.json is open
PList JSON parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList JSON writing succeeded
Size of input and output is different
Input size : 171
Output size : 170
Comparing
PList parsing succeeded
PASS: test/json1.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/j2.json is open
PList JSON parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList JSON writing succeeded
Size of input and output is different
Input size : 426
Output size : 423
Comparing
PList parsing succeeded
PASS: test/json2.test
Converting input file to JSON
Converting to binary and back to JSON
File /usr/lib64/libplist/ptest/test/test/data/json3.test.json is open
PList JSON parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList JSON writing succeeded
Size of input and output is different
Input size : 1017
Output size : 866
Comparing
PList parsing succeeded
PASS: test/json3.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/4.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 391148
Output size : 392301
Comparing
PList parsing succeeded
PASS: test/large++.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/4.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 391148
Output size : 392301
Comparing
PList parsing succeeded
PASS: test/large.test
ERROR: Could not parse plist data, expected XML or binary plist
PASS: test/malformed_dict.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/3.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 31034
Output size : 31101
Comparing
PList parsing succeeded
PASS: test/medium++.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/3.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 31034
Output size : 31101
Comparing
PList parsing succeeded
PASS: test/medium.test
* checking off1byte.bplist
PList parsing succeeded
* checking off2bytes.bplist
PList parsing succeeded
* checking off3bytes.bplist
PList parsing succeeded
* checking off4bytes.bplist
PList parsing succeeded
* checking off5bytes.bplist
PList parsing succeeded
* checking off6bytes.bplist
PList parsing succeeded
* checking off7bytes.bplist
PList parsing succeeded
* checking off8bytes.bplist
PList parsing succeeded
PASS: test/offsetsize.test
PList parsing succeeded
PASS: test/order.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/o3.ostep is open
OpenStep PList parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
OpenStep PList writing succeeded
Size of input and output is different
Input size : 341
Output size : 125
Comparing
PList parsing succeeded
PASS: test/ostep-comments.test
Converting (failure expected)
./test/ostep-invalid-types.test: line 17: [: -neq: binary operator expected
Converting (failure expected)
ERROR: Input plist data is not compatible with output format.
./test/ostep-invalid-types.test: line 23: [: -neq: binary operator expected
Converting (failure expected)
ERROR: Input plist data is not compatible with output format.
./test/ostep-invalid-types.test: line 29: [: -neq: binary operator expected
PASS: test/ostep-invalid-types.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/test.strings is open
OpenStep PList parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
OpenStep PList writing succeeded
Size of input and output is different
Input size : 312
Output size : 274
Comparing
PList parsing succeeded
PASS: test/ostep-strings.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/o1.ostep is open
OpenStep PList parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
OpenStep PList writing succeeded
Size of input and output is different
Input size : 566
Output size : 148
Comparing
PList parsing succeeded
PASS: test/ostep1.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/o2.ostep is open
OpenStep PList parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
OpenStep PList writing succeeded
Size of input and output is different
Input size : 461
Output size : 382
Comparing
PList parsing succeeded
PASS: test/ostep2.test
ERROR: Could not parse plist data, expected XML or binary plist
PASS: test/recursion.test
* checking dictref1byte.bplist
PList parsing succeeded
* checking dictref2bytes.bplist
PList parsing succeeded
* checking dictref3bytes.bplist
PList parsing succeeded
* checking dictref4bytes.bplist
PList parsing succeeded
* checking dictref5bytes.bplist
PList parsing succeeded
* checking dictref6bytes.bplist
PList parsing succeeded
* checking dictref7bytes.bplist
PList parsing succeeded
* checking dictref8bytes.bplist
PList parsing succeeded
PASS: test/refsize.test
PASS: test/signedunsigned1.test
PASS: test/signedunsigned2.test
PASS: test/signedunsigned3.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/2.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 6030
Output size : 6021
Comparing
PList parsing succeeded
PASS: test/small++.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/2.plist is open
PList XML parsing succeeded
PList BIN writing succeeded
PList BIN parsing succeeded
PList XML writing succeeded
Size of input and output is different
Input size : 6030
Output size : 6021
Comparing
PList parsing succeeded
PASS: test/small.test
PList parsing succeeded
PList parsing succeeded
PASS: test/timezone1.test
PList parsing succeeded
PList parsing succeeded
PList parsing succeeded
PASS: test/timezone2.test
Converting
File /usr/lib64/libplist/ptest/input/test/data/uid.bplist is open
PList BIN parsing succeeded
PList XML writing succeeded
PList XML parsing succeeded
PList BIN writing succeeded
Comparing
PList parsing succeeded
PASS: test/uid.test
DURATION: 7
END: /usr/lib64/libplist/ptest
2025-11-19T10:23
STOP: ptest-runner
TOTAL: 1 FAIL: 0

real    0m7.166s
user    0m2.552s
sys    0m5.882s

On Wed, Nov 19, 2025 at 11:53=E2=80=AFPM Ankur Tyagi via
lists.openembedded.org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>  .../libimobiledevice/libplist/run-ptest       |  6 ++++
>  .../libimobiledevice/libplist_2.6.0.bb        | 30 +++++++++++++++++--
>  3 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/ru=
n-ptest
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
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
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest=
 b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
> new file mode 100644
> index 0000000000..ed940af5f6
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +
> +for t in `ls test/*.test`; do
> +       top_srcdir=3D$(pwd)/input top_builddir=3D$(pwd)/test ./$t && echo=
 PASS: $t || echo FAIL: $t
> +       rm $(pwd)/test/test/data/* 2>/dev/null
> +done
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb =
b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> index 7f01962a97..1dfe895d23 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> @@ -6,10 +6,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debb5c50ab7ca=
b4baeffba14977030c07 \
>
>  DEPENDS =3D "libxml2 glib-2.0 swig python3"
>
> -inherit autotools pkgconfig python3native python3targetconfig
> +inherit autotools pkgconfig python3native python3targetconfig ptest
>
>  SRCREV =3D "2117b8fdb6b4096455bd2041a63e59a028120136"
> -SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster"
> +SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster \
> +           file://run-ptest \
> +"
>
>
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
> @@ -30,6 +32,28 @@ do_install:append () {
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
> +    install -m 0755 ${B}/test/.libs/plist* ${D}${PTEST_PATH}/test/test/.=
libs/
> +    install -m 0755 ${B}/test/.libs/integer_set_test ${D}${PTEST_PATH}/t=
est/test/
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
> @@ -38,3 +62,5 @@ FILES:${PN} =3D "${libdir}/libplist-2.0${SOLIBS}"
>  FILES:${PN}++ =3D "${libdir}/libplist++-2.0${SOLIBS}"
>  FILES:${PN}-utils =3D "${bindir}/*"
>  FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> +
> +RDEPENDS:${PN}-ptest +=3D "bash"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121893): https://lists.openembedded.org/g/openembedde=
d-devel/message/121893
> Mute This Topic: https://lists.openembedded.org/mt/116371540/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

