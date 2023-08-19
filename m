Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28D8EE49AA
	for <webhook@archiver.kernel.org>; Sat, 19 Aug 2023 08:00:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.5572.1692432023168806961
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Aug 2023 01:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=s0mVbVXA;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so15892735e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692432021; x=1693036821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8qjMinz7HENkc6/jJ85/Gh+lohTQMumf60cN2i6fXyM=;
        b=s0mVbVXAAPqzFJpPu7pdYFRCjFXftc0rEzuiJs//Ti2TPa5taGjd2wThUi2iPm1dIj
         7Cyjl+6ngpoesHEOtDCvSJIBcZfiZVuyqblmGkuiZNmuq8YRn+zOp3wUYckkJp5Fsod9
         xUoCcK8WtX4aY1zwy2CaovengMQLtVQFx39Wfe6y0RWwvkSqwFfsEugC9+fclr8JHwW3
         Cfesny8Kvtji3qCUx4K+kqmbBeOZP7GX/Yt+zOwRnz7BFEMtjiCHS/1rsHQxIM+0SjgN
         e+YsD9pWGIyZpLkBnSJWYlswqYGlp5HrOzIw2ABIzXZqOpXmRXkxawEpWMqyHiwxwvdC
         b4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692432021; x=1693036821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qjMinz7HENkc6/jJ85/Gh+lohTQMumf60cN2i6fXyM=;
        b=igPOPhyH9T3b6OYYKXkq3QbrFHt7XAN8zw0JEEMlS3XAGc0bKIAhDP3r2EXVuBqlOW
         N6lYshL/YKBTtY4QojLG54mKW8KkES1eY3TL2Wrjpabjbptuwr9/Icy6rcO7IuPWj8z7
         k3dH+3JdUb8iey//Ijarqjw1OLxzmh1+fBmabB/C99BDp3cphC8ewW+vx9HSXwnT1eeq
         gj7GkCRSmg1U9+VUATCnzNYjdG0wOQUJvYyfExjhoPyMwRL3qEfpMcO8uOv9FvgIAlWP
         H8LFPgHnahX0mtkaXtUpiQVCi1ZJpjqtaV01XIOgtMsj6jspdmH6wDPKETHqiGxqoWHN
         +IZQ==
X-Gm-Message-State: AOJu0YzeJJCfC+x84sfq7PIzM5csSUMFC/JOOTXxjJmF266xmP6LUqkd
	giP071YmumaHoDZqKWeXFF2VQM+oIeYCSJkv5vBSQoXSrP0=
X-Google-Smtp-Source: AGHT+IHDBq01raDLHkOYNjHNV06b38Em2rkEv8G5bi5o3tTT/eU2G0/Pe28dOWzdsoMGOy4lN16NzjcVs6ccR1u5Gtg=
X-Received: by 2002:a5d:5962:0:b0:319:7b96:a1be with SMTP id
 e34-20020a5d5962000000b003197b96a1bemr754248wri.71.1692432021186; Sat, 19 Aug
 2023 01:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230817170343.3597778-1-nicolas.marguet@windriver.com>
In-Reply-To: <20230817170343.3597778-1-nicolas.marguet@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 19 Aug 2023 10:00:10 +0200
Message-ID: <CA+chaQe0EJBCRntF125kfcVgQ=aYHffujgQQYGg4Zkj-F_DuuA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] librelp: add ptest
To: nicolas.marguet@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006dee180603420996"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 08:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104496

--0000000000006dee180603420996
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+    cp -f ${S}/${TESTDIR}/*.{sh,py} ${D}${PTEST_PATH}/${TESTDIR}

Can you please change this to:
 cp -f ${S}/${TESTDIR}/*.sh ${S}/${TESTDIR}/*,py
${D}${PTEST_PATH}/${TESTDIR}

so that it works with dash as well? It's now failing with:

DEBUG: Executing shell function do_install_ptest_base
cp: cannot stat
'TOPDIR/BUILD/work/qemux86_64-oe-linux/librelp/1.11.0/git/tests/*.{sh,py}':
No such file or directory
WARNING: exit code 1 from a shell command.

On Thu, Aug 17, 2023 at 7:04=E2=80=AFPM nicolas.marguet via lists.openembed=
ded.org
<nicolas.marguet=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Nicolas Marguet <nicolas.marguet@windriver.com>
>
> Use internal test from librelp project as ptest.
>
> This work is largely inspired on the rsyslog ptest implementation,
> which copies the automake-based tests/Makefile to the target and runs
> 'make check-TESTS'. sed is used to fix a few Makefile paths or
> env-vars so 'make' can run on the target.
>
> Tested on qemux86_64 and qemuarm64:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    librelp 1.11.0: tests/test-suite.log
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> TOTAL: 30
> PASS:  27
> SKIP:  3
> XFAIL: 0
> FAIL:  0
> XPASS: 0
> ERROR: 0
>
> The 3 skipped tests are either self-identified as =E2=80=9Cnot do anythin=
g
> really useful=E2=80=9D or may need to port libtool to the target.
>
> Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
> ---
>  ...line-errors-in-debug-optimization-Og.patch |  0
>  .../rsyslog/librelp/run-ptest                 | 10 ++++
>  .../rsyslog/librelp_1.11.0.bb                 | 59 ++++++++++++++++++-
>  3 files changed, 68 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/rsyslog/{files =3D>
> librelp}/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
> (100%)
>  create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/run-ptest
>
> diff --git
> a/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-=
in-debug-optimization-Og.patch
> b/meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inline-error=
s-in-debug-optimization-Og.patch
> similarity index 100%
> rename from
> meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-in=
-debug-optimization-Og.patch
> rename to
> meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inline-errors-=
in-debug-optimization-Og.patch
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp/run-ptest
> b/meta-oe/recipes-extended/rsyslog/librelp/run-ptest
> new file mode 100644
> index 000000000..a649a5716
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/librelp/run-ptest
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +#
> +set -e
> +set -o pipefail
> +
> +SCRIPTPATH=3D"$( cd "$(dirname "$0")" ; pwd -P )"
> +cd ${SCRIPTPATH}
> +useradd tester  || echo "user already exists"
> +su tester -c "make -C tests -k check-TESTS"
> +userdel tester
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> index bac5abb05..cbbc31b7d 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> @@ -8,10 +8,67 @@ DEPENDS =3D "gmp nettle libidn zlib gnutls openssl"
>
>  SRC_URI =3D "git://
> github.com/rsyslog/librelp.git;protocol=3Dhttps;branch=3Dstable \
>
> file://0001-Fix-function-inline-errors-in-debug-optimization-Og.patch \
> +           file://run-ptest \
>  "
>
>  SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
> +
> +# For ptests, copy source tests/*.sh scripts, Makefile and
> +# executables and run them with make on target.
> +TESTDIR =3D "tests"
> +do_compile_ptest() {
> +    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
> +    oe_runmake -C ${TESTDIR} buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/${TESTDIR}
> +
> +    # copy source tests/*.sh and python scripts
> +    cp -f ${S}/${TESTDIR}/*.{sh,py} ${D}${PTEST_PATH}/${TESTDIR}
> +    # install data files needed by the test scripts on the target
> +    cp -f ${S}/${TESTDIR}/*.supp ${D}${PTEST_PATH}/${TESTDIR}
> +    cp -rf ${S}/${TESTDIR}/tls-certs ${D}${PTEST_PATH}/${TESTDIR}
> +
> +    # copy executables
> +    find ${B}/${TESTDIR} -type f -executable -exec cp {}
> ${D}${PTEST_PATH}/${TESTDIR} \;
> +    cp -rf ${B}/${TESTDIR}/.libs ${D}${PTEST_PATH}/${TESTDIR}
> +    # copy Makefile
> +    # run-ptest will run make which runs the executables
> +    cp -f ${B}/${TESTDIR}/Makefile ${D}${PTEST_PATH}/${TESTDIR}
> +    cp -f ${B}/${TESTDIR}/set-envvars ${D}${PTEST_PATH}/${TESTDIR}
> +
> +    # give permissions to all users
> +    # some tests need to write to this directory
> +    chmod 777 -R ${D}${PTEST_PATH}/${TESTDIR}
> +
> +    # do NOT need to rebuild Makefile or $(check_PROGRAMS)
> +    sed -i 's/^Makefile:.*$/Makefile:/'
> ${D}${PTEST_PATH}/${TESTDIR}/Makefile
> +    sed -i 's/^check-TESTS:.*$/check-TESTS:/'
> ${D}${PTEST_PATH}/${TESTDIR}/Makefile
> +
> +    # fix the srcdir, top_srcdir, abs_top_builddir
> +    sed -i 's,^\(srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},'
> ${D}${PTEST_PATH}/${TESTDIR}/Makefile
> +    sed -i 's,^\(top_srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},'
> ${D}${PTEST_PATH}/${TESTDIR}/Makefile
> +    sed -i 's,^\(abs_top_builddir =3D \).*,\1${PTEST_PATH}/,'
> ${D}${PTEST_PATH}/${TESTDIR}/Makefile
> +
> +    # install test-driver
> +    install -m 644 ${S}/test-driver ${D}${PTEST_PATH}
> +
> +    # fix the python3 path for tests/set-envar
> +    sed -i -e s:${HOSTTOOLS_DIR}:${bindir}:g
> ${D}${PTEST_PATH}/${TESTDIR}/set-envvars
> +
> +    # these 2 scripts need help finding their
> /usr/lib/librelp/ptest/tests/.libs libraries
> +    sed -i 's:${B}/src:${PTEST_PATH}/${TESTDIR}:'
> ${D}${PTEST_PATH}/${TESTDIR}/send
> +    sed -i 's:${B}/src:${PTEST_PATH}/${TESTDIR}:'
> ${D}${PTEST_PATH}/${TESTDIR}/receive
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "\
> +  make bash coreutils libgcc util-linux gawk grep \
> +  python3-core python3-io \
> +"
> +
> +RRECOMMENDS:${PN}-ptest +=3D " valgrind"
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104473):
> https://lists.openembedded.org/g/openembedded-devel/message/104473
> Mute This Topic: https://lists.openembedded.org/mt/100804400/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006dee180603420996
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+=C2=A0 =C2=A0 cp -f ${S}/${TESTDIR}/*.{sh,py} ${D}${PTEST=
_PATH}/${TESTDIR}<br><div><br></div><div>Can you please change this to:</di=
v><div>=C2=A0cp -f ${S}/${TESTDIR}/*.sh ${S}/${TESTDIR}/*,py ${D}${PTEST_PA=
TH}/${TESTDIR}</div><div><br></div><div>so that it works with dash as well?=
 It&#39;s now failing with:</div><div><br></div><div>DEBUG: Executing shell=
 function do_install_ptest_base<br>cp: cannot stat &#39;TOPDIR/BUILD/work/q=
emux86_64-oe-linux/librelp/1.11.0/git/tests/*.{sh,py}&#39;: No such file or=
 directory<br>WARNING: exit code 1 from a shell command.<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, A=
ug 17, 2023 at 7:04=E2=80=AFPM nicolas.marguet via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;nicolas.marguet=3D<a href=
=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Nicolas Marguet &lt;<a href=3D"mailto:nicolas.marguet@wind=
river.com" target=3D"_blank">nicolas.marguet@windriver.com</a>&gt;<br>
<br>
Use internal test from librelp project as ptest.<br>
<br>
This work is largely inspired on the rsyslog ptest implementation,<br>
which copies the automake-based tests/Makefile to the target and runs<br>
&#39;make check-TESTS&#39;. sed is used to fix a few Makefile paths or<br>
env-vars so &#39;make&#39; can run on the target.<br>
<br>
Tested on qemux86_64 and qemuarm64:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 =C2=A0librelp 1.11.0: tests/test-suite.log<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
TOTAL: 30<br>
PASS:=C2=A0 27<br>
SKIP:=C2=A0 3<br>
XFAIL: 0<br>
FAIL:=C2=A0 0<br>
XPASS: 0<br>
ERROR: 0<br>
<br>
The 3 skipped tests are either self-identified as =E2=80=9Cnot do anything<=
br>
really useful=E2=80=9D or may need to port libtool to the target.<br>
<br>
Signed-off-by: Nicolas Marguet &lt;<a href=3D"mailto:nicolas.marguet@windri=
ver.com" target=3D"_blank">nicolas.marguet@windriver.com</a>&gt;<br>
---<br>
=C2=A0...line-errors-in-debug-optimization-Og.patch |=C2=A0 0<br>
=C2=A0.../rsyslog/librelp/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++<br>
=C2=A0.../rsyslog/<a href=3D"http://librelp_1.11.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">librelp_1.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 59 ++++++++++++++++++-<br>
=C2=A03 files changed, 68 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-extended/rsyslog/{files =3D&gt; librelp}/0001-=
Fix-function-inline-errors-in-debug-optimization-Og.patch (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/run-ptest=
<br>
<br>
diff --git a/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inlin=
e-errors-in-debug-optimization-Og.patch b/meta-oe/recipes-extended/rsyslog/=
librelp/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch<br>
similarity index 100%<br>
rename from meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline=
-errors-in-debug-optimization-Og.patch<br>
rename to meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inline=
-errors-in-debug-optimization-Og.patch<br>
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/run-ptest b/meta-oe/r=
ecipes-extended/rsyslog/librelp/run-ptest<br>
new file mode 100644<br>
index 000000000..a649a5716<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/rsyslog/librelp/run-ptest<br>
@@ -0,0 +1,10 @@<br>
+#!/bin/sh<br>
+#<br>
+set -e<br>
+set -o pipefail<br>
+<br>
+SCRIPTPATH=3D&quot;$( cd &quot;$(dirname &quot;$0&quot;)&quot; ; pwd -P )&=
quot;<br>
+cd ${SCRIPTPATH}<br>
+useradd tester=C2=A0 || echo &quot;user already exists&quot;<br>
+su tester -c &quot;make -C tests -k check-TESTS&quot;<br>
+userdel tester<br>
diff --git a/meta-oe/recipes-extended/rsyslog/<a href=3D"http://librelp_1.1=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">librelp_1.11.0.bb</a> b/meta-o=
e/recipes-extended/rsyslog/<a href=3D"http://librelp_1.11.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">librelp_1.11.0.bb</a><br>
index bac5abb05..cbbc31b7d 100644<br>
--- a/meta-oe/recipes-extended/rsyslog/<a href=3D"http://librelp_1.11.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">librelp_1.11.0.bb</a><br>
+++ b/meta-oe/recipes-extended/rsyslog/<a href=3D"http://librelp_1.11.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">librelp_1.11.0.bb</a><br>
@@ -8,10 +8,67 @@ DEPENDS =3D &quot;gmp nettle libidn zlib gnutls openssl&q=
uot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/rsyslog/librelp.=
git;protocol=3Dhttps;branch=3Dstable" rel=3D"noreferrer" target=3D"_blank">=
github.com/rsyslog/librelp.git;protocol=3Dhttps;branch=3Dstable</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-function-inline-e=
rrors-in-debug-optimization-Og.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;b421f56d9ee31a966058d23bd23c966221c91396&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+inherit autotools pkgconfig ptest<br>
+<br>
+# For ptests, copy source tests/*.sh scripts, Makefile and <br>
+# executables and run them with make on target.<br>
+TESTDIR =3D &quot;tests&quot;<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 echo &#39;buildtest-TESTS: $(check_PROGRAMS)&#39; &gt;&gt; $=
{TESTDIR}/Makefile<br>
+=C2=A0 =C2=A0 oe_runmake -C ${TESTDIR} buildtest-TESTS<br>
+}<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/${TESTDIR}<br>
+<br>
+=C2=A0 =C2=A0 # copy source tests/*.sh and python scripts<br>
+=C2=A0 =C2=A0 cp -f ${S}/${TESTDIR}/*.{sh,py} ${D}${PTEST_PATH}/${TESTDIR}=
<br>
+=C2=A0 =C2=A0 # install data files needed by the test scripts on the targe=
t<br>
+=C2=A0 =C2=A0 cp -f ${S}/${TESTDIR}/*.supp ${D}${PTEST_PATH}/${TESTDIR}<br=
>
+=C2=A0 =C2=A0 cp -rf ${S}/${TESTDIR}/tls-certs ${D}${PTEST_PATH}/${TESTDIR=
}<br>
+<br>
+=C2=A0 =C2=A0 # copy executables<br>
+=C2=A0 =C2=A0 find ${B}/${TESTDIR} -type f -executable -exec cp {} ${D}${P=
TEST_PATH}/${TESTDIR} \;<br>
+=C2=A0 =C2=A0 cp -rf ${B}/${TESTDIR}/.libs ${D}${PTEST_PATH}/${TESTDIR}<br=
>
+=C2=A0 =C2=A0 # copy Makefile<br>
+=C2=A0 =C2=A0 # run-ptest will run make which runs the executables<br>
+=C2=A0 =C2=A0 cp -f ${B}/${TESTDIR}/Makefile ${D}${PTEST_PATH}/${TESTDIR}<=
br>
+=C2=A0 =C2=A0 cp -f ${B}/${TESTDIR}/set-envvars ${D}${PTEST_PATH}/${TESTDI=
R}<br>
+<br>
+=C2=A0 =C2=A0 # give permissions to all users<br>
+=C2=A0 =C2=A0 # some tests need to write to this directory<br>
+=C2=A0 =C2=A0 chmod 777 -R ${D}${PTEST_PATH}/${TESTDIR}<br>
+<br>
+=C2=A0 =C2=A0 # do NOT need to rebuild Makefile or $(check_PROGRAMS)<br>
+=C2=A0 =C2=A0 sed -i &#39;s/^Makefile:.*$/Makefile:/&#39; ${D}${PTEST_PATH=
}/${TESTDIR}/Makefile<br>
+=C2=A0 =C2=A0 sed -i &#39;s/^check-TESTS:.*$/check-TESTS:/&#39; ${D}${PTES=
T_PATH}/${TESTDIR}/Makefile<br>
+<br>
+=C2=A0 =C2=A0 # fix the srcdir, top_srcdir, abs_top_builddir<br>
+=C2=A0 =C2=A0 sed -i &#39;s,^\(srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},=
&#39; ${D}${PTEST_PATH}/${TESTDIR}/Makefile<br>
+=C2=A0 =C2=A0 sed -i &#39;s,^\(top_srcdir =3D \).*,\1${PTEST_PATH}/${TESTD=
IR},&#39; ${D}${PTEST_PATH}/${TESTDIR}/Makefile<br>
+=C2=A0 =C2=A0 sed -i &#39;s,^\(abs_top_builddir =3D \).*,\1${PTEST_PATH}/,=
&#39; ${D}${PTEST_PATH}/${TESTDIR}/Makefile<br>
+<br>
+=C2=A0 =C2=A0 # install test-driver<br>
+=C2=A0 =C2=A0 install -m 644 ${S}/test-driver ${D}${PTEST_PATH}<br>
+<br>
+=C2=A0 =C2=A0 # fix the python3 path for tests/set-envar<br>
+=C2=A0 =C2=A0 sed -i -e s:${HOSTTOOLS_DIR}:${bindir}:g ${D}${PTEST_PATH}/$=
{TESTDIR}/set-envvars<br>
+<br>
+=C2=A0 =C2=A0 # these 2 scripts need help finding their /usr/lib/librelp/p=
test/tests/.libs libraries<br>
+=C2=A0 =C2=A0 sed -i &#39;s:${B}/src:${PTEST_PATH}/${TESTDIR}:&#39; ${D}${=
PTEST_PATH}/${TESTDIR}/send<br>
+=C2=A0 =C2=A0 sed -i &#39;s:${B}/src:${PTEST_PATH}/${TESTDIR}:&#39; ${D}${=
PTEST_PATH}/${TESTDIR}/receive<br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;\<br>
+=C2=A0 make bash coreutils libgcc util-linux gawk grep \<br>
+=C2=A0 python3-core python3-io \<br>
+&quot;<br>
+<br>
+RRECOMMENDS:${PN}-ptest +=3D &quot; valgrind&quot;<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104473): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104473" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104473</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100804400/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100804400/3617156</a><br>
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

--0000000000006dee180603420996--

