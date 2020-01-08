Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3CF7FA30
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 09:00:23 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a5so1601801wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 01:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9uBmAycNX66ELxQ1ipViuq8JJd29t1N9yAlfPZbbezY=;
	b=CxlcD/IowLXcvIxP2vLpoWhnAT5yBqmkGMYmlBqWrfK+WJmR/rG9XE+wstpT5P/uzT
	IM2ldSEoIoJ7XHKg7XaSnRv+aozENCW0K/rTKjrqCMpP+zwvp6dC/LvFt6Ag5e1EuYzV
	16MIDnPark4KVFSChHWaB2kOKRl6ut6F0Z8HhrlprpLspaBRPSTDTL08UfDPiR31pAjf
	3g17ybdQ5Rwqmu+OdEo5QI17owERQTfZ8Gu0PQ00ScBojq3RreHrkERQ+IPrbKlrP/i6
	JGt7/y1zulcS+5ce8PIb274vzZK9w1i/pD6mAe3ESRlv/+ggSDCsROO9e2EQ/sB23cM0
	4rEQ==
X-Gm-Message-State: APjAAAV3WcEw54XvXXvIj4PTOzxWExiVdp97zbYer9wYRM9Qkzx47DyE
	AnS+hmYqhLAt3iAaJ0LkU1x1QUOr
X-Google-Smtp-Source: APXvYqxiOFEJs3X2QxoIn51vKob75pBi5+w0DYo3E7S65tCGqjFmPxJ4lYtdvvzpc8Ya+a7tusrdjg==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
	q6mr2379871wmg.154.1578474023922; 
	Wed, 08 Jan 2020 01:00:23 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g21sm2895766wmh.17.2020.01.08.01.00.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 01:00:23 -0800 (PST)
Message-ID: <1009f01c2ca04f66ae1ac1e4be0a20909dbc515f.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 08 Jan 2020 09:00:22 +0000
In-Reply-To: <20200108085619.2454-1-git@andred.net>
References: <20200107160415.39721-1-git@andred.net>
	<20200108085619.2454-1-git@andred.net>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2 v3] oniguruma: enable ptest
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
X-List-Received-Date: Wed, 08 Jan 2020 09:00:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Khem,

I got the subject line wrong originally - not sure how that works with
patchwork.

Can you still pick this up please?


Cheers,
Andre'

On Wed, 2020-01-08 at 08:56 +0000, André Draszik wrote:
> All tests (with 3400 subtests) are passing (on musl+arm).
> 
> Signed-off-by: André Draszik <git@andred.net>
> 
> ---
> v3:
> * fix subject line
> 
> v2:
> * remove useless line in run-ptest
> * update commit message
> ---
>  ...rial-tests-automake-option-for-ptest.patch | 36 ++++++++++++++
>  meta-oe/recipes-support/onig/onig/run-ptest   | 47 +++++++++++++++++++
>  meta-oe/recipes-support/onig/onig_6.9.4.bb    | 12 ++++-
>  3 files changed, 94 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/onig/onig/0001-build-enable-serial-tests-automake-option-for-ptest.patch
>  create mode 100755 meta-oe/recipes-support/onig/onig/run-ptest
> 
> diff --git a/meta-oe/recipes-support/onig/onig/0001-build-enable-serial-tests-automake-option-for-ptest.patch b/meta-
> oe/recipes-support/onig/onig/0001-build-enable-serial-tests-automake-option-for-ptest.patch
> new file mode 100644
> index 000000000..587e5ac1b
> --- /dev/null
> +++ b/meta-oe/recipes-support/onig/onig/0001-build-enable-serial-tests-automake-option-for-ptest.patch
> @@ -0,0 +1,36 @@
> +From 8bf8189ec4a0d7ee569f66feb0e590e9602c31b6 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
> +Date: Mon, 6 Jan 2020 15:10:30 +0000
> +Subject: [PATCH] build: enable serial-tests automake option (for ptest)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +For ptest, we need to be able to compile the tests without
> +running them.
> +
> +Enabling the serial-tests automake option will add
> +buildtest-TESTS and runtest-TESTS makefile targets, the
> +former being what we want.
> +
> +Signed-off-by: André Draszik <git@andred.net>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index ac51e85..48e63ce 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3,7 +3,7 @@ AC_INIT(onig, 6.9.4)
> + 
> + AC_CONFIG_MACRO_DIR([m4])
> + 
> +-AM_INIT_AUTOMAKE([-Wno-portability])
> ++AM_INIT_AUTOMAKE([-Wno-portability serial-tests])
> + AC_CONFIG_HEADERS([src/config.h])
> + 
> + 
> +-- 
> +2.23.0.rc1
> +
> diff --git a/meta-oe/recipes-support/onig/onig/run-ptest b/meta-oe/recipes-support/onig/onig/run-ptest
> new file mode 100755
> index 000000000..2574d7efa
> --- /dev/null
> +++ b/meta-oe/recipes-support/onig/onig/run-ptest
> @@ -0,0 +1,47 @@
> +#!/bin/sh -eu
> +
> +my_cleanup() {
> +    [ -n "${workdir:-}" ] && rm -rf "${workdir}"
> +}
> +
> +trap "my_cleanup" EXIT
> +for sig in INT TERM ; do
> +    # We want sig to expand right here and now, as it's
> +    # a loop variable, not when signalled. For $$ it
> +    # doesn't matter.
> +    # shellcheck disable=SC2064
> +    trap "my_cleanup ; trap - EXIT ; trap - ${sig} ; kill -s ${sig} $$" ${sig}
> +done
> +
> +workdir=$(mktemp -d -t onig.ptest.XXXXXX)
> +status="${workdir}/failed"
> +touch "${status}"
> +
> +find tests/ -perm -111 -type f -exec sh -c '
> +    workdir="${1}"
> +    status="${2}"
> +    t="${3}"
> +    t_log="${workdir}/$(basename ${t}).log"
> +
> +    res=0
> +    ./${t} > "${t_log}" 2>&1 \
> +        || res=$?
> +    if [ $res -eq 0 ] ; then
> +        echo "PASS: ${t}"
> +    else
> +        echo "FAIL: ${t}"
> +        echo "$(basename ${t}): ${t_log}" >> "${status}"
> +    fi
> +    ' _ "${workdir}" "${status}" {} \;
> +
> +if [ $(stat -c '%s' "${status}") -ne 0 ] ; then
> +    exec >&2
> +    while IFS=': ' read -r t t_log ; do
> +        printf "\n=========================\n"
> +        printf "ERROR: %s:\n" "${t}"
> +        printf --  "-------------------------\n"
> +        cat "${t_log}"
> +    done < "${status}"
> +fi
> +
> +[ $(stat -c '%s' "${status}") -eq 0 ]
> diff --git a/meta-oe/recipes-support/onig/onig_6.9.4.bb b/meta-oe/recipes-support/onig/onig_6.9.4.bb
> index d873088fe..cfa86f04c 100644
> --- a/meta-oe/recipes-support/onig/onig_6.9.4.bb
> +++ b/meta-oe/recipes-support/onig/onig_6.9.4.bb
> @@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ee043784bdce7503e619b2d1a85798b"
>  SRC_URI = "\
>      https://github.com/kkos/oniguruma/releases/download/v${PV}/${BP}.tar.gz \
>      file://0001-build-don-t-link-against-host-system-libraries.patch \
> +    file://0001-build-enable-serial-tests-automake-option-for-ptest.patch \
> +    file://run-ptest \
>  "
>  
>  SRC_URI[md5sum] = "a12d2fe997b789bd87cf63799c091879"
> @@ -17,6 +19,14 @@ SRC_URI[sha256sum] = "4669d22ff7e0992a7e93e116161cac9c0949cd8960d1c562982026726f
>  
>  BINCONFIG = "${bindir}/onig-config"
>  
> -inherit autotools binconfig-disabled
> +inherit autotools binconfig-disabled ptest
>  
>  BBCLASSEXTEND = "native"
> +
> +do_compile_ptest() {
> +    oe_runmake -C test buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +    install -Dm0755 -t ${D}${PTEST_PATH}/tests/ ${B}/test/.libs/*
> +}


