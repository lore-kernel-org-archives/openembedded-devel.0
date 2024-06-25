Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E08C3064D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 16:52:43 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.1003.1719334354847554184
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 09:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9DHI2FO;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-700cd43564eso253249a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719334354; x=1719939154; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzsyGLYDq4LzGOon/t1EI2I8nHExNm23Ff/3LFXiSm8=;
        b=R9DHI2FOXNU4nmKqzMEe39iiqBM4a2Bav7WrZuux5/b95oFTzvfg+SW2n/a3IOvrw5
         OOTZQOS6kT40bH9md+4aHs3NQ8RFFOTfbY3cVibe/4rTqDvR3DwY8fWU1MrD6VK5EG4R
         FLa0iYORLQezwOU402evQ2TcQNbNmeyc/thmjcQqmItUXr7ODTLiW4JUjU8BVa+aHnbB
         AdPjsFvwI830sAPPVPLs0EJiUG4Tcs9cxbUf1UHSv3IkrzS6HdACEIHGl4ogHJ+Z2lX1
         jxj98WzQ36ZCPvrlEwnXRSFiNODXz6yiPpUJyCtiKnQfeM8BFe/DxgGZtDY3c3TYgRhP
         WVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334354; x=1719939154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzsyGLYDq4LzGOon/t1EI2I8nHExNm23Ff/3LFXiSm8=;
        b=PYV1nuzoDs9dY0Pc/KZBqhi0Hk9lzBrZhiLQQiMMq1fWlh1Nef2KgV5BEURHxO8ok1
         k+ZTcCIXQwh/Bn6GGMjkRFggen3msWlsCZsd9qoPsA9WZyyfvY2Y0kWxrLwUUuiapuSg
         SJJvbJDvqcM6SXCcJqoKz0VAtJncbi2mCaL2agPepNMXAUgxVkMYtqDJ5ZmQjYQAYE2s
         Oxt8mcSMlLgLUR875mNxKAObVDlMspqQBdar6Mr5mY2V3b8m6TPJEVj+8W2oZuBC3Eev
         Zhz+seZsEG8Ao8uGjguhf9Byg7hId7zhIyzH0y3Pny9MZtlMmlhHw03fPzrGOd8RigXZ
         DLWA==
X-Gm-Message-State: AOJu0YwQKTdcS6RPLyBBBhjfEblC89D/SwCzKxSBtpEGIZ4ys3rVV5+G
	ki8+yB8L6vZbJMAW+YCedfj+H+RKD3MEFVk2HkIjN+vd1OtaAZgPXyTRnoa0+su+atGQV+yQJGO
	wTaU4II4SuGd9Lt8wNBDD8dzxgnY=
X-Google-Smtp-Source: AGHT+IEECS98KGx43gVDGHhab+UBsOdyemupzxEGR/TB4xJjQ8lAUOVhIMx5KjRNpxmbi8Jyqz3E0qhB3N0zaBiyf8c=
X-Received: by 2002:a05:6871:332a:b0:254:94a4:35d0 with SMTP id
 586e51a60fabf-25cfcf9b8e0mr9163494fac.48.1719334353845; Tue, 25 Jun 2024
 09:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240625162048.666209-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20240625162048.666209-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jun 2024 09:52:06 -0700
Message-ID: <CAMKF1sqreoZ4rtcSL0ODP2Hn4uXRs8gMzQsg8dkOeUJh=tMF+g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libee: remove recipe since libee is obsolete
To: randy.macleod@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 16:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111078

Thanks Randy, We need to find more such recipes and purge them

On Tue, Jun 25, 2024 at 9:20=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> libee had been used by rsyslog but the library never relly panned out.
>
> It has been declared to be obsolete:
>    Early versions of rsyslog and liblognorm used it for representing stru=
ctured content.
>    However, this is long gone. We do not know of any other user. So libee=
 should be of
>    no further interest and is provided here solely for historical reasons=
.
> https://github.com/rsyslog/libee
>
> Also remove references to libee in:
>    meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>    meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  1 -
>  .../packagegroups/packagegroup-meta-oe.bb     |  2 -
>  meta-oe/recipes-support/libee/libee.inc       | 39 -------------------
>  meta-oe/recipes-support/libee/libee/ezapi1.sh | 14 -------
>  .../libee/libee/libee-parallel-make.patch     | 20 ----------
>  meta-oe/recipes-support/libee/libee/run-ptest |  3 --
>  meta-oe/recipes-support/libee/libee_0.4.1.bb  |  4 --
>  7 files changed, 83 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/libee/libee.inc
>  delete mode 100755 meta-oe/recipes-support/libee/libee/ezapi1.sh
>  delete mode 100644 meta-oe/recipes-support/libee/libee/libee-parallel-ma=
ke.patch
>  delete mode 100755 meta-oe/recipes-support/libee/libee/run-ptest
>  delete mode 100644 meta-oe/recipes-support/libee/libee_0.4.1.bb
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
> index eaa86c411..01bf975a1 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -17,7 +17,6 @@ PTESTS_FAST_META_OE =3D "\
>      jq \
>      leveldb \
>      libcereal \
> -    libee \
>      libgpiod \
>      libio-pty-perl \
>      libmanette \
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index bc40f56b9..e11afcd4e 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -811,7 +811,6 @@ RDEPENDS:packagegroup-meta-oe-support =3D"\
>      libcanberra \
>      libssh \
>      libssh2 \
> -    libee \
>      libusbgx-config \
>      libusbgx \
>      lockdev \
> @@ -972,7 +971,6 @@ RDEPENDS:packagegroup-meta-oe-ptest-packages =3D "\
>      oprofile-ptest \
>      libteam-ptest \
>      uthash-ptest \
> -    libee-ptest \
>      poco-ptest \
>      cmocka-ptest \
>      minicoredumper-ptest \
> diff --git a/meta-oe/recipes-support/libee/libee.inc b/meta-oe/recipes-su=
pport/libee/libee.inc
> deleted file mode 100644
> index 592109b95..000000000
> --- a/meta-oe/recipes-support/libee/libee.inc
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY =3D "An Event Expression Library inspired by CEE"
> -DESCRIPTION =3D "The core idea of libee is to provide a small \
> -but hopefully convenient API layer above the CEE standard."
> -
> -HOMEPAGE =3D "http://www.libee.org"
> -SECTION =3D "base"
> -
> -LICENSE =3D "LGPL-2.1-or-later"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1c2687de35e36ba3b999136236a66=
cd6"
> -
> -SRC_URI =3D "http://www.libee.org/download/files/download/${BPN}-${PV}.t=
ar.gz\
> -           file://libee-parallel-make.patch \
> -           file://run-ptest \
> -           file://ezapi1.sh \
> -"
> -
> -inherit autotools ptest pkgconfig
> -
> -DEPENDS +=3D "libestr"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 't=
estbench', '', d)}"
> -
> -PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug,,"
> -PACKAGECONFIG[testbench] =3D "--enable-testbench,--disable-testbench,,"
> -
> -TESTDIR =3D "tests"
> -
> -# We presume the tests we are going to install so just build them direct=
ly.
> -#
> -do_compile_ptest() {
> -    oe_runmake -C ${TESTDIR} genfile ezapi1
> -}
> -
> -do_install_ptest() {
> -    install -d ${D}${PTEST_PATH}
> -    install -m 0755 ${B}/${TESTDIR}/genfile ${D}${PTEST_PATH}
> -    install -m 0755 ${B}/${TESTDIR}/.libs/ezapi1 ${D}${PTEST_PATH}
> -    install -m 0755 ${UNPACKDIR}/ezapi1.sh ${D}${PTEST_PATH}
> -}
> diff --git a/meta-oe/recipes-support/libee/libee/ezapi1.sh b/meta-oe/reci=
pes-support/libee/libee/ezapi1.sh
> deleted file mode 100755
> index e9db5e614..000000000
> --- a/meta-oe/recipes-support/libee/libee/ezapi1.sh
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#!/bin/sh
> -#
> -echo -------------------------------------------------------------------=
--------
> -echo A very basic test for the event class
> -echo -------------------------------------------------------------------=
--------
> -rm -f infile
> -./genfile 100 > infile
> -./ezapi1 -iinfile
> -if [ $? -ne 0 ] ; then
> -   echo "FAIL: $0"
> -   exit 1
> -fi
> -echo "PASS: $0"
> -rm -f infile
> diff --git a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patc=
h b/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
> deleted file mode 100644
> index 8bb23aafc..000000000
> --- a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -fix parallel compiling problem
> -
> -without specifying libee_convert_DEPENDENCIES =3D libee.la, libee_conver=
t
> -can't find libee.la when linking as libee is not generated yet.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ----
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index 08aaa9e..f0c78f7 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -46,5 +46,6 @@ libee_la_LDFLAGS =3D -version-info 0:0:0
> - libee_convert_SOURCES =3D convert.c
> - libee_convert_CPPFLAGS =3D  -I$(top_srcdir) $(LIBEE_CFLAGS) $(LIBESTR_C=
FLAGS) $(LIBXML2_CFLAGS)
> - libee_convert_LDADD =3D $(LIBEE_LIBS) $(LIBXML2_LIBS) $(LIBESTR_LIBS)
> -+libee_convert_DEPENDENCIES =3D libee.la
> -
> - include_HEADERS =3D
> diff --git a/meta-oe/recipes-support/libee/libee/run-ptest b/meta-oe/reci=
pes-support/libee/libee/run-ptest
> deleted file mode 100755
> index 3cb660764..000000000
> --- a/meta-oe/recipes-support/libee/libee/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -#
> -./ezapi1.sh
> diff --git a/meta-oe/recipes-support/libee/libee_0.4.1.bb b/meta-oe/recip=
es-support/libee/libee_0.4.1.bb
> deleted file mode 100644
> index ef2c20db5..000000000
> --- a/meta-oe/recipes-support/libee/libee_0.4.1.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require ${BPN}.inc
> -
> -SRC_URI[md5sum] =3D "7bbf4160876c12db6193c06e2badedb2"
> -SRC_URI[sha256sum] =3D "c0dac01938593deee06c3d161e4eda4ecc0fd7317e1321bd=
96e301aceb7fb027"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111077): https://lists.openembedded.org/g/openembedde=
d-devel/message/111077
> Mute This Topic: https://lists.openembedded.org/mt/106872902/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

