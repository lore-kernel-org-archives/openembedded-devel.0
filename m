Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.5626.1604115304106695734
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 20:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e47AiMZz;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id k9so6857076qki.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 20:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P9citFinzBZgFfYpeE5ZWmvgOOtbn66mdfas40H3eoE=;
        b=e47AiMZz45yjF1n7TZe9T+9xcaL3P6xIjcG90GzOA8J3uqL/Gf+HyrgvQOw66qvxP0
         sPdantG9tG4CkhSMPVAVqUPJpUPc/jMERLtW5cIPeKtAHzr8LYVRdU61iS+fGGGmQoNW
         FcC7NP1bn/mpLF9P2+NIuzYDem4rBA/CE6b4INhcD9POC1r0srVqWifcPqd/l3uOAuCm
         DvoETh5MOdPT939TSPNOlX/DsaD73k2/2pkyPQP/cr0cA1Z7nxMCOAwrdOgsgZuakRVR
         he60PFspgOD+x+JA8kwi9mJy8N0PsNYn7Qz2fKHAJMyLnQ9NLR+Y25zIkN6eZa785lmd
         U0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P9citFinzBZgFfYpeE5ZWmvgOOtbn66mdfas40H3eoE=;
        b=GID2KHBcKVnhyy6rB+Q/J7YOGiwHExx+9mKlssCdUHz6/ROdbBCgkX4luUVkPkWjse
         SZ2tYaBggm9fete+wjnrsBK5g/nx9FT7kSbfzXIKxUjCzELMDAf1TPvEDvnFrxZRUeJX
         UjL2EfNBngKlJ8dh8FM4vOxVvHmI+CqwLu6kR0HKc7DqJzPM0qU5GzYRgTGvHd4E69yJ
         56Jq2/h0UCAnCERU6lKNmOErVWRLHhfoG0yz0sV8GCtfZFycAZfdNAAkMhMJGsPBY25W
         GjFEMdtARBkyoXTU4YybsqeBweDpTZbkBaRdVQmXBWfgJYwlqW2Nfcsx4Quqm1so2GXK
         qz1Q==
X-Gm-Message-State: AOAM531G5jrfoN2orbBNpawGerNKteOfKm9eozgC2G+qYtgG5QtaTziK
	t66YpLKYVRbTRzq4eQdKPwNBdJWQWFqmKvAa/Lh0PBdRGk5eKg==
X-Google-Smtp-Source: ABdhPJxfAt8MOUV+fw5kWsOyYcAu72a4CHs/bMtRvgkjKNqH3oNnM71fPEQclPpDLnZrskbvKBMmvIkUIBI6KmUeNrI=
X-Received: by 2002:a37:27c9:: with SMTP id n192mr5116837qkn.71.1604115302859;
 Fri, 30 Oct 2020 20:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201030183022.1773487-1-randy.e.witt@linux.intel.com>
In-Reply-To: <20201030183022.1773487-1-randy.e.witt@linux.intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 30 Oct 2020 20:34:34 -0700
Message-ID: <CAMKF1sr5Jjbf7Fi-hEnoMUMy88A-46LH8CnReR0DY784FeAS6g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] numactl: Remove the recipe
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

before we delete this here please port
https://git.openembedded.org/meta-openembedded/commit/?id=09d879ad3d604b46604149b035380c1690a5114a
as well into OE-core, otherwise its going backwards.

On Fri, Oct 30, 2020 at 11:31 AM Randy Witt
<randy.e.witt@linux.intel.com> wrote:
>
> The numactl recipe now exists in openembedded-core, as of commit
> dda815792b0939b2f233aa3ec7c140fc114a37d1 to oe-core. It was moved to
> facilitate the requirement rt-tests now has on libnuma.
>
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  .../numactl/0001-define-run-test-target.patch | 32 ----------
>  .../numactl/Fix-the-test-output-format.patch  | 64 -------------------
>  .../recipes-support/numactl/numactl/Makefile  |  7 --
>  .../recipes-support/numactl/numactl/run-ptest |  9 ---
>  .../recipes-support/numactl/numactl_git.bb    | 62 ------------------
>  5 files changed, 174 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
>  delete mode 100644 meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
>  delete mode 100644 meta-oe/recipes-support/numactl/numactl/Makefile
>  delete mode 100755 meta-oe/recipes-support/numactl/numactl/run-ptest
>  delete mode 100644 meta-oe/recipes-support/numactl/numactl_git.bb
>
> diff --git a/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
> deleted file mode 100644
> index 78ffb22f8..000000000
> --- a/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -rename test target as run-test
> -
> -Upstream-Statue: Pending
> -
> -test target not only compile the test files, but also run them, which is
> -not suitable for cross-compile environment, so rename it as run-test.
> -
> -and define test target to compile the test files.
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - Makefile.am | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index b6db339..de176c4 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -124,7 +124,9 @@ regress2: $(check_PROGRAMS)
> - test_numademo: numademo
> -       ./numademo -t -e 10M
> -
> --test: all $(check_PROGRAMS) regress1 regress2 test_numademo
> -+test: all $(check_PROGRAMS)
> -+
> -+run-test: all $(check_PROGRAMS) regress1 regress2 test_numademo
> -
> - TESTS_ENVIRONMENT = builddir='$(builddir)'; export builddir;
> -
> ---
> -1.9.1
> -
> diff --git a/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
> deleted file mode 100644
> index 9812ecc8b..000000000
> --- a/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00 2001
> -From: Li xin <lixin.fnst@cn.fujitsu.com>
> -Date: Tue, 21 Jul 2015 02:01:22 +0900
> -Subject: [PATCH] Fix the test output format
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> -Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ----
> - test/regress  |  6 +++---
> - test/regress2 | 11 +++++------
> - 2 files changed, 8 insertions(+), 9 deletions(-)
> -
> -diff --git a/test/regress b/test/regress
> -index 2ce1705..d086a47 100755
> ---- a/test/regress
> -+++ b/test/regress
> -@@ -74,6 +74,7 @@ probe_hardware()
> -       if [ $numnodes -lt 2 ] ; then
> -           echo "need at least two nodes with at least $NEEDPAGES each of"
> -           echo "free memory for mempolicy regression tests"
> -+          echo "FAIL: numa regress"
> -           exit 77  # Skip test
> -       fi
> - }
> -@@ -207,10 +208,9 @@ main()
> -       rm A B
> -
> -       if [ "$EXIT" = 0 ] ; then
> --              echo '========SUCCESS'
> -+              echo 'PASS: numactl regress'
> -       else
> --              echo '========FAILURE'
> --              exit 1
> -+              echo 'FAIL: numactl regress'
> -       fi
> - }
> -
> -diff --git a/test/regress2 b/test/regress2
> -index aa6ea41..450c510 100755
> ---- a/test/regress2
> -+++ b/test/regress2
> -@@ -9,12 +9,11 @@ testdir=`dirname "$0"`
> - export PATH=${builddir}:$PATH
> -
> - T() {
> --       echo "$@"
> --       if ! $VALGRIND "$@" ;  then
> --        echo  $1 FAILED!!!!
> --        exit 1
> --       fi
> --       echo
> -+      if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
> -+         echo  "FAIL: $1"
> -+      else
> -+         echo "PASS: $1"
> -+      fi
> - }
> -
> - # still broken
> ---
> -1.8.4.2
> -
> diff --git a/meta-oe/recipes-support/numactl/numactl/Makefile b/meta-oe/recipes-support/numactl/numactl/Makefile
> deleted file mode 100644
> index 9a5134c3f..000000000
> --- a/meta-oe/recipes-support/numactl/numactl/Makefile
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -.PHONY: regress1 regress2
> -
> -regress1:
> -       cd test ; ./regress
> -
> -regress2:
> -       cd test ; ./regress2
> diff --git a/meta-oe/recipes-support/numactl/numactl/run-ptest b/meta-oe/recipes-support/numactl/numactl/run-ptest
> deleted file mode 100755
> index 215f7c25b..000000000
> --- a/meta-oe/recipes-support/numactl/numactl/run-ptest
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -#!/bin/sh
> -make regress1
> -make regress2
> -if  numademo -t -e 10M; then
> -       echo "PASS: numademo"
> -else
> -       echo "FAIL: numademo"
> -fi
> -
> diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
> deleted file mode 100644
> index 504fe0327..000000000
> --- a/meta-oe/recipes-support/numactl/numactl_git.bb
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -SUMMARY = "Development package for building Applications that use numa"
> -HOMEPAGE = "http://oss.sgi.com/projects/libnuma/"
> -DESCRIPTION = "Simple NUMA policy support. It consists of a numactl program \
> -to run other programs with a specific NUMA policy and a libnuma to do \
> -allocations with NUMA policy in applications."
> -LICENSE = "GPL-2.0 & LGPL-2.1"
> -SECTION = "apps"
> -
> -inherit autotools-brokensep ptest
> -
> -LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
> -
> -SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
> -PV = "2.0.14+git${SRCPV}"
> -
> -SRC_URI = "git://github.com/numactl/numactl \
> -    file://Fix-the-test-output-format.patch \
> -    file://Makefile \
> -    file://run-ptest \
> -    file://0001-define-run-test-target.patch \
> -"
> -
> -S = "${WORKDIR}/git"
> -
> -# ARM does not currently support NUMA
> -COMPATIBLE_HOST = "^((?!arm).*)$"
> -
> -LDFLAGS_append_riscv64 = " -latomic"
> -LDFLAGS_append_riscv32 = " -latomic"
> -
> -do_install() {
> -    oe_runmake DESTDIR=${D} prefix=${D}/usr install
> -    #remove the empty man2 directory
> -    rm -r ${D}${mandir}/man2
> -}
> -
> -do_compile_ptest() {
> -    oe_runmake test
> -}
> -
> -do_install_ptest() {
> -    #install tests binaries
> -    local test_binaries="distance ftok mbind_mig_pages migrate_pages move_pages \
> -    mynode    nodemap node-parse pagesize prefered randmap realloc_test \
> -    tbitmap tshared"
> -
> -    [ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
> -    for i in $test_binaries; do
> -        install -m 0755 ${B}/test/.libs/$i ${D}${PTEST_PATH}/test
> -    done
> -
> -    local test_scripts="checktopology checkaffinity printcpu regress regress2 \
> -        shmtest  runltp bind_range"
> -    for i in $test_scripts; do
> -        install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
> -    done
> -
> -    install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
> -    install -m 0755 ${B}/.libs/numactl ${D}${PTEST_PATH}/
> -}
> -
> -RDEPENDS_${PN}-ptest = "bash"
> --
> 2.26.2
>
>
> 
>
