Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0979ECF8578
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 09:29:25 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30421.1763630962253178027
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l7ERDj58;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-657534478a0so233934eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 01:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763630961; x=1764235761; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4R7xSSU2MAickCh8iQ6B0WIPiBp0dbPIjxjp343qko=;
        b=l7ERDj58s8Cf/DTF8ihn+50zaGpn0mBk76N49Sxm1MBCN9Kw3vz7/XMYzzamyqj5sC
         AOCoY4L7F0gpkCRxdURb7/v7Pjfh4qIlLqIn/P+6DDkAPHINKcu2dIJX8gmBROdBG4h1
         uXfiPzljg9IGy7mB0rjLcQvhvAygbl3ssQZvP8gI4b5C7fIN7eMw0XyUf3IBdNSrJhaM
         CSGVGKql9xI2AMOC7c9d3gwINCJNA2x9r6+yNe3jTcUY+ELAxW5SuJ3vNRL6edFfojrZ
         7ml3onW0mTcUjrNytX6tXxUGlTFVueY5TpllxwzKdUFvxGRLUg3MP9P0TI8+LQG2IJu1
         cUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630961; x=1764235761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4R7xSSU2MAickCh8iQ6B0WIPiBp0dbPIjxjp343qko=;
        b=R/05PiNI/8b44g5OK+yfx8lNhk8gCtt4l5uG5/wHyAKgGKrFg9iLh+RDcdzlJYutqw
         /WpGdNqZdOGauZZbnSKePYJ4W3CaFeJlPncskZhvXMfe/lqN8Pqso8VzeaRIWStUvQQ3
         Vft0awTs4urYvdJWw8R9SZk0uoFKFFNGPAV5tjf7NaKvWD94S+oZ+EnSaGhTjHrVOUQ6
         iXgiP8IbTyYwd67ZDLMVt+UtG9FVy3BHjurIbOGvmMO2CcXhQrNgvLfFmllUTd2mzClM
         3MZrb6P1fq6Aw2EDgR0lNL+tWpZayUkGtMtkhcIdKQekkmL5PcVibmW3XP8WGfb+/JJs
         krdg==
X-Gm-Message-State: AOJu0YyYjJXkLfUEzSCD3HaYAT+fzYD5eeCbBYg6082jN7He1P+uuVAF
	Ov41jUoEhUxWmsUcZarJdBULeMRW3fPKEA3/Brn3ykvIs79WqByEtAK9EcZDQ/9jBzzetLRo4Ya
	5LPC6D/+XjQF0/2ICGme9prOIhzBhJi8=
X-Gm-Gg: ASbGncvHHqSgP18NflifTWVigwcTb2Jl32WkW24Z9XIU2eqO4MX67DQS/TpMaPkDdqF
	nj6IGbfmLP2Kiom07u9GsLkf0+1M/0Bj/lgw4B5+uho8+fTfuCI9KLm+TJasnuO7fk2U8IjR+2M
	MvbRtsVr6WRztSNOPwMhUR1kF7/WWYnkd2dhZo9K7WYOP6JalwzIhH5UQBtH49kP0PUpsRkxxmL
	a63nsCubw8qW2Mgtd0/LNCujfCmBGohu3TAEF7/dSR8uPxvoKgRfwGhkSmWov2ojot5jVolfg==
X-Google-Smtp-Source: AGHT+IHopna6zBNW44W6Ygeub1ZCyYbbuC2eYKZHwigjwrcCeaXg0cJz7awI6xjINDK5b9Fi2qVe5x0Pj9mOaU1O/uQ=
X-Received: by 2002:a05:6808:8950:b0:450:1fa0:1447 with SMTP id
 5614622812f47-450ff3872e4mr1084297b6e.39.1763630961312; Thu, 20 Nov 2025
 01:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20251120054646.3709798-1-ankur.tyagi85@gmail.com> <CAMKF1sp1vDV4+gwa4OzQx6gSa1vLs4G-uWb6yXV8CH=3Pj7bnQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp1vDV4+gwa4OzQx6gSa1vLs4G-uWb6yXV8CH=3Pj7bnQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 20 Nov 2025 22:29:10 +1300
X-Gm-Features: AWmQ_bn-g25NLwjgaitO24PMjWqb8H38Dug4Uo8cg6BLhpKPHyD36XZiIB2XtEk
Message-ID: <CADySD0E-NFbd62NaEDZWGtnMBc+vgae_7ZOYx=z0S5CugMow9w@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] libplist: fix ptest error
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 09:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121935

On Thu, Nov 20, 2025 at 9:39=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> We still have build QA errors to address
>
> WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File /usr/lib/libplis=
t/ptest/test/tools/plistutil in package libplist-ptest contains reference t=
o TMPDIR [buildpaths]
> WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File /usr/lib/libplis=
t/ptest/test/test/plist_test++ in package libplist-ptest contains reference=
 to TMPDIR [buildpaths]
> WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File /usr/lib/libplis=
t/ptest/test/test/plist_jtest in package libplist-ptest contains reference =
to TMPDIR [buildpaths]
> WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File /usr/lib/libplis=
t/ptest/test/test/plist_btest in package libplist-ptest contains reference =
to TMPDIR [buildpaths]
> WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File /usr/lib/libplis=
t/ptest/test/test/plist_otest in package libplist-ptest contains reference =
to TMPDIR [buildpaths]
>
Hi Khem,

I was not seeing these errors in my build, fetching the latest version
and will try again.

cheers
Ankur

> On Wed, Nov 19, 2025 at 9:46=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  .../0001-test-fix-operator-error.patch        | 68 +++++++++++++++++++
>>  .../libimobiledevice/libplist_2.6.0.bb        |  1 +
>>  2 files changed, 69 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist/0=
001-test-fix-operator-error.patch
>>
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
>> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb=
 b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
>> index 69b9b46d62..17b1d7cfd3 100644
>> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
>> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
>> @@ -11,6 +11,7 @@ inherit autotools pkgconfig python3native python3targe=
tconfig ptest
>>  SRCREV =3D "2117b8fdb6b4096455bd2041a63e59a028120136"
>>  SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttp=
s;branch=3Dmaster;tag=3D${PV} \
>>             file://run-ptest \
>> +           file://0001-test-fix-operator-error.patch \
>>  "
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121926): https://lists.openembedded.org/g/openembedd=
ed-devel/message/121926
>> Mute This Topic: https://lists.openembedded.org/mt/116387427/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

