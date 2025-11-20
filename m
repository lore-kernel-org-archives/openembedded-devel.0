Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EB2CF64BF
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 05:47:53 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28320.1763617668069234098
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 21:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dM7y2H10;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c75178c05fso149906a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 21:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763617667; x=1764222467; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRSUNx+I2zOv65/CzcYpePHahUvFlVHk5KiRKfS7WQg=;
        b=dM7y2H10pAA9rjoInNp6qsXAOkjanVxIqETqLrQtFTeDfnejgQVPkytDY6/0FfbhDA
         uW14D1s1Ka9eckDvEUrHWGOh2VIXpqRSDG/3rxwzOtqJUjMTZZXRMhDzI1OC1516hGtb
         vPI1/pRBooOsiARSUuWFpbEp7SEv2SBPPTyMlAc4fbG0M+g6xCFUlw8bMmK8Omd4PVqx
         IemcmObeacDFEPykSYlB3V+pz+6IpY+4E80ja/0UvSLr0AIFhq1ZuUsYMSkieXRvntkm
         UCwLQWu2Lnqaz+gyv8QsMKE2BHF3Q3VIZ7pvdXaoKpTU4yYX62ZrTg7MaAVeDfaBdxCm
         GzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763617667; x=1764222467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FRSUNx+I2zOv65/CzcYpePHahUvFlVHk5KiRKfS7WQg=;
        b=XqnzZFuLVsNpsEbN5Fig8RpiL0Vungbmvckk1nchBKB7hCLv9mofWSVZ+5jXhncVcv
         eBX7oj/fhiObdxKcXDf1QmpdCifTB0eZ5pEG/slRQLrXJ9oapdDJTFknXvG0kG7SfpuH
         1SRVfbMtIUEzSBCdERhESJFGhGs5qM6CLv1xo2L28hDPRFCQ1a09ggsRip1XLr6Z+z5B
         2ID1Kmk+OHb5qfhMqkck2fjVeh6Fs44g5qlUr8QXjRjmnKmu4LcTayn8mP3HrMTGiiUJ
         v+w4EOAyCnCDRsVg5/Z49ziMgVEBuY2It3c3ad410SFzcgGv1T5KCfi6RgKHXn9omncp
         3MFw==
X-Gm-Message-State: AOJu0Yxay/zVvgfyc4VfDHRMBr2XSv3lF0rt6VvCx4GGTCXNE7T4qBvh
	aYcYLOJZqNh7Y2EuX3ISP3vDSoK2Qr5jY3LQptmyJCQkFFR0+E7dD9yWAayyUNqZHHqXdrQKyhu
	93lHCLvpSylRdLsP99Tv1VNT+odpZnSY=
X-Gm-Gg: ASbGncse6NZngHTLhEhtzqc5XZwtVfk8XyCNvOXZzgnG0Z0rEUicaaNnm4ydcg9h+CB
	ujt/nFJciHY3lV+SCcIKhJ+g5iIKBJBC3X2m7hAWL83t2d2y8LsovAC7HCq2q1HZEt3QOiv3BR7
	bNFM+VJZddSlH1eB6nW3SOA0df+YxYNRZUqkLP1v2iEvUHcfXRGSnQd0Hd/jHTFCKqtEUyMDc3k
	d2ASY1ykVLSxUnix6fgDUNLvR8fdfEBNMqjzHROFcge9/0rPY6EGQzJ4AhMBPEpwoFMyG+sBQ==
X-Google-Smtp-Source: AGHT+IHdadVRp5+b0MmowG+8ciKOYOOs+q9JPCrf3xffkDiML9Jet3od8ElnxxgJ2PpWGpqKyWoGmIUX7KlVMrGGIxc=
X-Received: by 2002:a05:6808:1492:b0:450:3823:b607 with SMTP id
 5614622812f47-451002d5effmr812835b6e.59.1763617667061; Wed, 19 Nov 2025
 21:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20251120032931.3639995-1-ankur.tyagi85@gmail.com> <CAMKF1sqixpcnxqE-y9y9v0Fk5Umr6Mit2gLWKjZFDDJ125E5OQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqixpcnxqE-y9y9v0Fk5Umr6Mit2gLWKjZFDDJ125E5OQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 20 Nov 2025 18:47:35 +1300
X-Gm-Features: AWmQ_bl5TOCR0Og_Ca9kb6is7asN1gFkI_lmHTuryJndXO3e9ZlrVlRmATmwdsY
Message-ID: <CADySD0HXwd66K=864KmnEg_QhpzHtE=pxPMfTwGJ5oqAikvyNw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2 1/2] libplist: add ptest support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 05:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121927

On Thu, Nov 20, 2025 at 6:22=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Hmm, I have applied v1 already, so please rebase this on top of the lates=
t master and resend the delta, this will need to be backported to whinlatte=
r too.

please drop this patch, I have sent another one.

>
> On Wed, Nov 19, 2025 at 7:29=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>> changes in v2:
>> - added patch to fix ptest error
>> ---
>>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>>  .../0001-test-fix-operator-error.patch        | 68 +++++++++++++++++++
>>  .../libimobiledevice/libplist/run-ptest       |  6 ++
>>  .../libimobiledevice/libplist_2.6.0.bb        | 31 ++++++++-
>>  4 files changed, 104 insertions(+), 2 deletions(-)
>>  create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/0=
001-test-fix-operator-error.patch
>>  create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/r=
un-ptest
>>
>> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-=
oe/conf/include/ptest-packagelists-meta-oe.inc
>> index 09b1dbb3e1..25db9fe5cc 100644
>> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> @@ -54,6 +54,7 @@ PTESTS_FAST_META_OE =3D "\
>>      xmlsec1 \
>>      zeromq \
>>      cjson \
>> +    libplist \
>>  "
>>  PTESTS_FAST_META_OE:append:x86 =3D " mcelog"
>>  PTESTS_FAST_META_OE:append:x86-64 =3D " mcelog"
>> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/0001-tes=
t-fix-operator-error.patch b/meta-oe/recipes-extended/libimobiledevice/libp=
list/0001-test-fix-operator-error.patch
>> new file mode 100644
>> index 0000000000..0866851537
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-o=
perator-error.patch
>> @@ -0,0 +1,68 @@
>> +From 18e5b22a71f85091127cc063db79c8df687c582c Mon Sep 17 00:00:00 2001
>> +From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> +Date: Thu, 20 Nov 2025 16:01:58 +1300
>> +Subject: [PATCH] test: fix operator error
>> +
>> +Otherwise test fail with error [: -neq: binary operator expected
>> +
>> +Upstream-Status: Submitted [https://github.com/libimobiledevice/libplis=
t/pull/284]
>> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> +---
>> + test/json-invalid-types.test  | 6 +++---
>> + test/ostep-invalid-types.test | 6 +++---
>> + 2 files changed, 6 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/test/json-invalid-types.test b/test/json-invalid-types.tes=
t
>> +index c532316..a21fcd9 100755
>> +--- a/test/json-invalid-types.test
>> ++++ b/test/json-invalid-types.test
>> +@@ -14,19 +14,19 @@ export PLIST_JSON_DEBUG=3D1
>> +
>> + echo "Converting (failure expected)"
>> + $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE0 -o /dev/n=
ull
>> +-if [ $? -neq 2 ]; then
>> ++if [ $? -ne 2 ]; then
>> +   exit 1
>> + fi
>> +
>> + echo "Converting (failure expected)"
>> + $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE1 -o /dev/n=
ull
>> +-if [ $? -neq 2 ]; then
>> ++if [ $? -ne 2 ]; then
>> +   exit 2
>> + fi
>> +
>> + echo "Converting (failure expected)"
>> + $top_builddir/tools/plistutil -f json -i $DATASRC/$TESTFILE2 -o /dev/n=
ull
>> +-if [ $? -neq 2 ]; then
>> ++if [ $? -ne 2 ]; then
>> +   exit 3
>> + fi
>> +
>> +diff --git a/test/ostep-invalid-types.test b/test/ostep-invalid-types.t=
est
>> +index 9222394..240505c 100755
>> +--- a/test/ostep-invalid-types.test
>> ++++ b/test/ostep-invalid-types.test
>> +@@ -14,19 +14,19 @@ export PLIST_OSTEP_DEBUG=3D1
>> +
>> + echo "Converting (failure expected)"
>> + $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE0 -o /d=
ev/null
>> +-if [ $? -neq 2 ]; then
>> ++if [ $? -ne 2 ]; then
>> +   exit 1
>> + fi
>> +
>> + echo "Converting (failure expected)"
>> + $top_builddir/tools/plistutil -f openstepn -i $DATASRC/$TESTFILE1 -o /=
dev/null
>> +-if [ $? -neq 2 ]; then
>> ++if [ $? -ne 2 ]; then
>> +   exit 2
>> + fi
>> +
>> + echo "Converting (failure expected)"
>> + $top_builddir/tools/plistutil -f openstep -i $DATASRC/$TESTFILE2 -o /d=
ev/null
>> +-if [ $? -neq 2 ]; then
>> ++if [ $? -ne 2 ]; then
>> +   exit 3
>> + fi
>> +
>> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptes=
t b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
>> new file mode 100644
>> index 0000000000..ed940af5f6
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist/run-ptest
>> @@ -0,0 +1,6 @@
>> +#!/bin/sh
>> +
>> +for t in `ls test/*.test`; do
>> +       top_srcdir=3D$(pwd)/input top_builddir=3D$(pwd)/test ./$t && ech=
o PASS: $t || echo FAIL: $t
>> +       rm $(pwd)/test/test/data/* 2>/dev/null
>> +done
>> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb=
 b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
>> index 7f01962a97..831b74cd1f 100644
>> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
>> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
>> @@ -6,10 +6,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Debb5c50ab7c=
ab4baeffba14977030c07 \
>>
>>  DEPENDS =3D "libxml2 glib-2.0 swig python3"
>>
>> -inherit autotools pkgconfig python3native python3targetconfig
>> +inherit autotools pkgconfig python3native python3targetconfig ptest
>>
>>  SRCREV =3D "2117b8fdb6b4096455bd2041a63e59a028120136"
>> -SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttp=
s;branch=3Dmaster"
>> +SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttp=
s;branch=3Dmaster \
>> +           file://run-ptest \
>> +           file://0001-test-fix-operator-error.patch \
>> +"
>>
>>
>>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_LIBLIST"
>> @@ -30,6 +33,28 @@ do_install:append () {
>>      fi
>>  }
>>
>> +do_install_ptest(){
>> +    # tests expect a particular directory structure for input and outpu=
t
>> +    install -d ${D}${PTEST_PATH}/input/test/data
>> +    install -d ${D}${PTEST_PATH}/test/tools
>> +    install -d ${D}${PTEST_PATH}/test/test/.libs
>> +    install -d ${D}${PTEST_PATH}/test/test/data
>> +    install ${S}/test/data/* ${D}${PTEST_PATH}/input/test/data/
>> +    install ${S}/test/*.test ${D}${PTEST_PATH}/test/
>> +    install -m 0755 ${B}/test/.libs/plist* ${D}${PTEST_PATH}/test/test/=
.libs/
>> +    install -m 0755 ${B}/test/.libs/integer_set_test ${D}${PTEST_PATH}/=
test/test/
>> +    for t in $(find ${B}/test -type f -name 'plist*' \! -name '*.o'); d=
o
>> +        install -m 0755 $t ${D}${PTEST_PATH}/test/test/
>> +    done
>> +    for t in $(find ${B}/tools -type f -name 'plist*' \! -name '*.o'); =
do
>> +        install -m 0755 $t ${D}${PTEST_PATH}/test/tools/
>> +    done
>> +    sed -i 's@LD_LIBRARY_PATH=3D"[^"]*:@LD_LIBRARY_PATH=3D"@g' \
>> +        ${D}${PTEST_PATH}/test/test/plist_cmp
>> +    sed -i 's@LD_LIBRARY_PATH=3D"[^"]*:@LD_LIBRARY_PATH=3D"@g' \
>> +        ${D}${PTEST_PATH}/test/test/plist_test
>> +}
>> +
>>  PACKAGES =3D+ "${PN}-utils \
>>               ${PN}++ \
>>               ${PN}-python"
>> @@ -38,3 +63,5 @@ FILES:${PN} =3D "${libdir}/libplist-2.0${SOLIBS}"
>>  FILES:${PN}++ =3D "${libdir}/libplist++-2.0${SOLIBS}"
>>  FILES:${PN}-utils =3D "${bindir}/*"
>>  FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/*"
>> +
>> +RDEPENDS:${PN}-ptest +=3D "bash"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121921): https://lists.openembedded.org/g/openembedd=
ed-devel/message/121921
>> Mute This Topic: https://lists.openembedded.org/mt/116386363/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

