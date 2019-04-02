Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id E81E67D13A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 02:48:04 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id g1so7031209qki.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 19:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jBTTtGZShfcA7r0Hf5fH7GR8AX5trbzswqJaS9TzwzQ=;
	b=GHO7M5wzTdaA6jzeF71xSxBE7VOEMcEG0XfwJqT6ElpZ1cUslQU0/kjrGuPeQK23o3
	yA1yM4x80wsQPWSc/kcDZHPQKSvDoUIRVHfqGUfqt7mHGSxElgCQcFwQ3DFg5Bcl4ISP
	GUWsCSyKCiNt+148K9ZGbJlyx+F6VQMf16zRaiswc46WPEVzp5fapbWJUxIPzqTx/pbv
	yNgbxFGVzivUDh3L2PgDJBC1wZvCjLf5l8U12XBZVz45l441wuDz1XjTnh24TjGUrl8P
	fqgZ2j+iNncUCeifDNZqEmFsuymjonOibETELCPMnRwgTiWvwVHVwDjG51rWbZv4zFpH
	/U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jBTTtGZShfcA7r0Hf5fH7GR8AX5trbzswqJaS9TzwzQ=;
	b=FLKd6tDy+3VRUr/8Jc+WO8ZUfH8kNStBSVCNGEriwbdSWPUtkUW5NfoqQYY91//Mpm
	7jHFhTfIhl/gInbmglXmsXydaBxaTVAnZWaznTNtt75mhIYOp6YRA+/jtSK8MH8kwzcG
	gfOi8La3SluF4HDpAQ54nLnIE5pOmf/E5wZ9fHVBFYpyg7tpMdDcmNz37c0ZOWr5tmXE
	zVizi4ulmU5ZEFNyfdtF2SwxwCEnevvEJ2k7Qxk3OfGw6X/pEmNJ9c7X98n1mSFFHq9t
	U6JesVz9MwYu+HmBJZDX07ifnSXTFqxRtxBGK+R2hhO8pwU65AENKgRH+iF5t+mtbxWw
	Krzw==
X-Gm-Message-State: APjAAAXIKyDwOfL72p/Zr9uCNyD98VffCgLRu/ajC/OjTUneDtUkcCfl
	ulJq0VMzraRgduELcjlOq/UOkj3TWofN1ta7cjs=
X-Google-Smtp-Source: APXvYqwrb/8V/NdgPIV49JHjSdB4Mlb5OWaizM2nC/V8MaSqTDbuQiWqyZvoNjf0WxHwVk7JktcO6JBw0TY3cmaiBQ0=
X-Received: by 2002:a37:b587:: with SMTP id
	e129mr54233316qkf.145.1554173285607; 
	Mon, 01 Apr 2019 19:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190329175453.28137-1-akuster808@gmail.com>
In-Reply-To: <20190329175453.28137-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Apr 2019 19:47:39 -0700
Message-ID: <CAMKF1soymd1o4yTkUAMFc1378c4forRgWYWeUnFdGtKBX40Tzw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] libldb: allow python pkg to be excluded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 02:48:05 -0000
Content-Type: text/plain; charset="UTF-8"

Armin

seeing this

ERROR: libldb-1.4.1-r0 do_package_qa: QA Issue: libldb rdepends on
samba, but it isn't a build dependency, missing samba in DEPENDS or
PACK
AGECONFIG? [build-deps]

On Fri, Mar 29, 2019 at 10:55 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> There are conflicts with the samba python package
> so disable the python pkg by default to fix:
>
> The pyldb has an RDEPENDS on samba which is causing issues with other
> packages.
>
> ERROR: The file /usr/lib/python2.7/site-packages/_ldb_text.py is installed by both libldb and samba, aborting
>
> Also cleanup per style guide
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-support/libldb/libldb_1.4.1.bb    | 40 +++++++++----------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> index 3c7e5455e9..c3865152e1 100644
> --- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> @@ -2,9 +2,9 @@ SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
>  HOMEPAGE = "http://ldb.samba.org"
>  SECTION = "libs"
>  LICENSE = "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
> -
> -DEPENDS += "libtdb libtalloc libtevent popt"
> -RDEPENDS_pyldb += "python samba"
> +LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
> +                    file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
> +                    file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
>
>  SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>             file://do-not-import-target-module-while-cross-compile.patch \
> @@ -12,34 +12,32 @@ SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
>             file://0001-libldb-fix-config-error.patch \
>             file://libldb-fix-musl-libc-unkown-type-error.patch \
>             file://libldb-fix-musl-libc-conflict-type-error.patch \
> -          "
> +           ${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
> +
> +SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
> +SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
> +
> +DEPENDS += "libtdb libtalloc libtevent popt"
> +
> +S = "${WORKDIR}/ldb-${PV}"
> +
> +inherit waf-samba distro_features_check
> +REQUIRED_DISTRO_FEATURES = "pam"
>
> -PACKAGECONFIG ??= "\
> +PACKAGECONFIG ?= "\
>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)} \
>  "
> +
>  PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
>  PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
>  PACKAGECONFIG[ldap] = ",,openldap"
>  PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
>  PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
>  PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
> +PACKAGECONFIG[python] = ",--disable-python, , python"
>  PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
>
> -SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', 'file://avoid-openldap-unless-wanted.patch', d)}"
> -
> -LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9adade \
> -                    file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
> -                    file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
> -
> -SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
> -SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
> -
> -inherit waf-samba distro_features_check
> -REQUIRED_DISTRO_FEATURES = "pam"
> -
> -S = "${WORKDIR}/ldb-${PV}"
> -
>  EXTRA_OECONF += "--disable-rpath \
>                   --disable-rpath-install \
>                   --bundled-libraries=cmocka \
> @@ -50,7 +48,7 @@ EXTRA_OECONF += "--disable-rpath \
>                   --without-ldb-lmdb \
>                  "
>
> -PACKAGES =+ "pyldb pyldb-dbg pyldb-dev"
> +PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'pyldb pyldb-dbg pyldb-dev', '', d)}"
>
>  NOAUTOPACKAGEDEBUG = "1"
>
> @@ -66,3 +64,5 @@ FILES_pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
>  FILES_pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
>                     ${libdir}/.debug/libpyldb-util.so.*"
>  FILES_pyldb-dev = "${libdir}/libpyldb-util.so"
> +
> +RDEPENDS_pyldb += "samba"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

