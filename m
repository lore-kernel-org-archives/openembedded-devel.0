Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEF9CF855D
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 08:39:14 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29962.1763627946444117084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 00:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eWM2Wrvl;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6420dc2e5feso491778d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 00:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763627945; x=1764232745; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kgxzumj9rq06NXTgzf3i9zOaXYirjskHzPMEzvxcJmo=;
        b=eWM2WrvlbecI4Ga8AwCXIqtzW6tDJ1YO8t2qtJHiUcC9bAi1EXs+S/Iy5os+4vSTcx
         WRF3i0mF7OJNoCgca94fgIUY7n4RHVRlHeUu7/waCXrMQRviB3440cGWOq9wgCcsqY7g
         BJb2W1l5EXODQHF7T0npiow8S42r4P3mdaqbbPbzLgk7fdIi3cLhnB9LkjlBhTtV6aJD
         2SnxiSMwHhHuqJTveKgOqI0DFgDRgAuCJp9Y2nHxEcDpFH8N0SfjCjIhXRYXVLq60Qe/
         nUd2rHcrNtq/5OFksaGjIvPrxkjqQRhhJGauzKGo/mI3P4AspbMzfBj/o6rwqNhVMViW
         VRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763627945; x=1764232745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kgxzumj9rq06NXTgzf3i9zOaXYirjskHzPMEzvxcJmo=;
        b=QwjyDFdEPkpA2ifzDX5ikRZBuyCy5c6g2iYsSMplg6MxFB9A+o22gXH9YAWJjVyWbd
         1wCAOwfz4STcMCFporb9YdoKgBAaV8fkyV4WAlc+bwKOKfF5Tu/bjRpfef1s3NVUbBCd
         O1W9KYHNMIQ/8PqETZ5mFNG/WzAvpMxUjPO1LEI8L0bhZIfsOSbKX9sIyJaMjjM+SfIH
         J4s715xg1S6ypNCdVWGdwyzjCcyYFrrwfNPuENAek9wtBGHaW0pZb5iWTT4u0euFt5Lr
         Hd92dhICxA/1dW2wHxiYEsLV5upddpjguxqcR2iI5E00uxOJjHv+XwIw/ku00LVQxtsN
         UIdw==
X-Gm-Message-State: AOJu0YxZreNXsVS6jz5GvWsIN+bb5Dok/Vf1jh+UzWlitVVAOjob+P9U
	KyVw+fhkyoDX1ayHGdvqbqG/3fbTlRJZ6w5ll7UIepG3qzTJFepk6KQvIXrm7t545ogoNfOvwdN
	f8W1PoQVvC6PT+AGiLyf+12mgcFTDAn0aU51EZybF/w==
X-Gm-Gg: ASbGncvtSQLA/1bF3zhgo1qiz4b2e19sSZRoxMY/rWg6LPOhTGLsKyf9bh/vyOROD9t
	j1A0axbHBhCSBnHoQwEcxYpZEUNQOWsbckEqkvLGUSSQ0pPDgaxQyzeY3iziVQkKcDIEjyEKQLi
	JGThtekjoMPRLkt7vxvJU2ndCXfv9SbHrKAOlhP5HTdrQr7ntPbai5IIsUZWj85yEYrbgpsbXkw
	8keNfZTn5xI5pD1TTXuRhpe8di8oL6FfjBrb2iukgSMU5ipkceGjTkDKlivRck2Ip6Hd+qftNOd
	5g1htWi8wjsiF7gp2+frAVnFz4Vx6fX2OIps8hmELPE1K519kaib9dOeIkKb7xs6DiKjde+zD0f
	e7bieTR2oT8OEdHlAKcRQXVqAKGA=
X-Google-Smtp-Source: AGHT+IFNwBrKlcizN0BxoVZk9rUYxD2U955iS4PPWJ+o6ODSz0pxRImUd6QEtn3sQ5cJM6L0mCKw8O6vafB1EkmkjtQ=
X-Received: by 2002:a05:690e:d8e:b0:640:db91:33c4 with SMTP id
 956f58d0204a3-642f9de4b2bmr517257d50.18.1763627945452; Thu, 20 Nov 2025
 00:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20251120054646.3709798-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20251120054646.3709798-1-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Nov 2025 00:38:38 -0800
X-Gm-Features: AWmQ_bmu68XkjwOGxBNvcIZ_MK3VOdP4Lacsk3MKkMNvN29jCen-3RW-TVjmeH4
Message-ID: <CAMKF1sp1vDV4+gwa4OzQx6gSa1vLs4G-uWb6yXV8CH=3Pj7bnQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] libplist: fix ptest error
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003468ba064402a1d7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 08:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121933

--0000000000003468ba064402a1d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We still have build QA errors to address

WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File
/usr/lib/libplist/ptest/test/tools/plistutil in package libplist-ptest
contains reference to TMPDIR [buildpaths]
WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File
/usr/lib/libplist/ptest/test/test/plist_test++ in package libplist-ptest
contains reference to TMPDIR [buildpaths]
WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File
/usr/lib/libplist/ptest/test/test/plist_jtest in package libplist-ptest
contains reference to TMPDIR [buildpaths]
WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File
/usr/lib/libplist/ptest/test/test/plist_btest in package libplist-ptest
contains reference to TMPDIR [buildpaths]
WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File
/usr/lib/libplist/ptest/test/test/plist_otest in package libplist-ptest
contains reference to TMPDIR [buildpaths]

On Wed, Nov 19, 2025 at 9:46=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../0001-test-fix-operator-error.patch        | 68 +++++++++++++++++++
>  .../libimobiledevice/libplist_2.6.0.bb        |  1 +
>  2 files changed, 69 insertions(+)
>  create mode 100644
> meta-oe/recipes-extended/libimobiledevice/libplist/0001-test-fix-operator=
-error.patch
>
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
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> index 69b9b46d62..17b1d7cfd3 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
> @@ -11,6 +11,7 @@ inherit autotools pkgconfig python3native
> python3targetconfig ptest
>  SRCREV =3D "2117b8fdb6b4096455bd2041a63e59a028120136"
>  SRC_URI =3D "git://
> github.com/libimobiledevice/libplist;protocol=3Dhttps;branch=3Dmaster;tag=
=3D${PV}
> <http://github.com/libimobiledevice/libplist;protocol=3Dhttps;branch=3Dma=
ster;tag=3D$%7BPV%7D>
> \
>             file://run-ptest \
> +           file://0001-test-fix-operator-error.patch \
>  "
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121926):
> https://lists.openembedded.org/g/openembedded-devel/message/121926
> Mute This Topic: https://lists.openembedded.org/mt/116387427/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003468ba064402a1d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We still have build QA errors to address<div><br></div><di=
v>WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File /usr/lib/libplis=
t/ptest/test/tools/plistutil in package libplist-ptest contains reference t=
o TMPDIR [buildpaths]<br>WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue=
: File /usr/lib/libplist/ptest/test/test/plist_test++ in package libplist-p=
test contains reference to TMPDIR [buildpaths]<br>WARNING: libplist-2.6.0-r=
0 do_package_qa: QA Issue: File /usr/lib/libplist/ptest/test/test/plist_jte=
st in package libplist-ptest contains reference to TMPDIR [buildpaths]<br>W=
ARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: File /usr/lib/libplist/p=
test/test/test/plist_btest in package libplist-ptest contains reference to =
TMPDIR [buildpaths]<br>WARNING: libplist-2.6.0-r0 do_package_qa: QA Issue: =
File /usr/lib/libplist/ptest/test/test/plist_otest in package libplist-ptes=
t contains reference to TMPDIR [buildpaths]</div></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Nov 19, 2025 at 9:46=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=
=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-test-fix-operator-error.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6=
8 +++++++++++++++++++<br>
=C2=A0.../libimobiledevice/<a href=3D"http://libplist_2.6.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">libplist_2.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 1 +<br>
=C2=A02 files changed, 69 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist=
/0001-test-fix-operator-error.patch<br>
<br>
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
diff --git a/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://li=
bplist_2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libplist_2.6.0.bb</a>=
 b/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libplist_2.6=
.0.bb" rel=3D"noreferrer" target=3D"_blank">libplist_2.6.0.bb</a><br>
index 69b9b46d62..17b1d7cfd3 100644<br>
--- a/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libplist_=
2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libplist_2.6.0.bb</a><br>
+++ b/meta-oe/recipes-extended/libimobiledevice/<a href=3D"http://libplist_=
2.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libplist_2.6.0.bb</a><br>
@@ -11,6 +11,7 @@ inherit autotools pkgconfig python3native python3targetco=
nfig ptest<br>
=C2=A0SRCREV =3D &quot;2117b8fdb6b4096455bd2041a63e59a028120136&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/libimobiledevice=
/libplist;protocol=3Dhttps;branch=3Dmaster;tag=3D$%7BPV%7D" rel=3D"noreferr=
er" target=3D"_blank">github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-fix-operator-err=
or.patch \<br>
=C2=A0&quot;<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121926): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121926" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121926</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116387427/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116387427/1997914</a><br>
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

--0000000000003468ba064402a1d7--

