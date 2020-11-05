Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.11030.1604597190752019092
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 09:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GGM6stQ0;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id y7so830267pfq.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 09:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vj0Enk2Nuj+KpyYcQFfeUisrf9ONG+HYoqRPjH5uOjE=;
        b=GGM6stQ0LuT1axQvPswesRTVZ9IdrFaYBnasI3MOjY/Q6XeiT4tjXlou5p0etm2jpZ
         dSZLQqdtwm07AOfdNLR1BaiNjPHoAiEE1T0cIpZ9PJ9R9ZnFQ8/0aS28ZjLSKWOtW/pW
         NuVNh3OcbmK2RaVKlum1xghaCX4xyc7cBp3OKRQHuF55EqF4e6TNWo8aig/MoptY6T4s
         YbQq2uu8vixiuYTHOXbn8XgkhrsuWGCXGZOi4Gq7fxj9pVjBSpAP9rX9zTX06qstd+Pi
         fbgv7aDZMc+BSLD9dOmuzERELKL2uRBoQ8smkcHMr/FVsGVUsctvxWb9M5FSXUGmNIrs
         gQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Vj0Enk2Nuj+KpyYcQFfeUisrf9ONG+HYoqRPjH5uOjE=;
        b=ZlgscFOy6vekPgu9uziZB10isa/AvWOSqQTiWa7wwOFuBH4VH5xbZ2p01baGy/UJ31
         MjrracaNkD2j9tOnqDrF/g1lF243LLaa8EH7PdbnI/RNHy0dKW5q9wMJCyqBDRDBAXO1
         wf1ERSU9zL+BNLZLEzvakLgxVPuSCIWoZaLvkORHrdRc9beHrWqLn6kvSWxwjVDTfEJr
         7NaeyWbODf0K8V+s+WfbOdeIJ7vw6ZqRMj8+v5v5rXNtpo8nI/ajmWE2ke9+IrrXithh
         5u5TkekUkmrJMaxCtUt7Fnl00a7ghm0lfaUEp/XK/UwAgJDUJJ+2blLoUua5jwV9s7cV
         SdaQ==
X-Gm-Message-State: AOAM531FrEe8PFjGuu+NkaJpDE45VsmJ/MIDk4h2b41Mww42N9KtZHD7
	Qma63r3OXS+Klpp7qLw3GrE27KesI7gKCg==
X-Google-Smtp-Source: ABdhPJy5nAhfLkDoE/tCQsJHbEwz3H1Na+0esV7orWyDufNmFYnzKlYWSm7vrVf0V0dLxkiNmphiMQ==
X-Received: by 2002:a65:67c2:: with SMTP id b2mr3313081pgs.39.1604597189787;
        Thu, 05 Nov 2020 09:26:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:6955:62e2:f0f4:7e8d? ([2601:646:9200:4e0:6955:62e2:f0f4:7e8d])
        by smtp.gmail.com with ESMTPSA id k73sm2898663pga.88.2020.11.05.09.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 09:26:29 -0800 (PST)
Subject: Re: [oe] [gatesgarth][meta-oe][PATCH] Revert "numactl: Remove the recipe"
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20201105144712.1515317-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <502c5a05-a437-0ed0-0dc3-ffc3ad3e7264@gmail.com>
Date: Thu, 5 Nov 2020 09:26:28 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105144712.1515317-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 11/5/20 6:47 AM, Martin Jansa wrote:
> This reverts commit e5d9133800f5c37172a6315d42a99464f9fe1902.
> 
> It exists in oe-core/master, but not in oe-core/gatesgarth, so this shouldn't
> be included in meta-oe/gatesgarth.
> 

thanks for noticing it

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   .../numactl/0001-define-run-test-target.patch | 32 ++++++++++
>   .../numactl/Fix-the-test-output-format.patch  | 64 +++++++++++++++++++
>   .../recipes-support/numactl/numactl/Makefile  |  7 ++
>   .../recipes-support/numactl/numactl/run-ptest |  9 +++
>   .../recipes-support/numactl/numactl_git.bb    | 62 ++++++++++++++++++
>   5 files changed, 174 insertions(+)
>   create mode 100644 meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
>   create mode 100644 meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
>   create mode 100644 meta-oe/recipes-support/numactl/numactl/Makefile
>   create mode 100755 meta-oe/recipes-support/numactl/numactl/run-ptest
>   create mode 100644 meta-oe/recipes-support/numactl/numactl_git.bb
> 
> diff --git a/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
> new file mode 100644
> index 0000000000..78ffb22f89
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/numactl/0001-define-run-test-target.patch
> @@ -0,0 +1,32 @@
> +rename test target as run-test
> +
> +Upstream-Statue: Pending
> +
> +test target not only compile the test files, but also run them, which is
> +not suitable for cross-compile environment, so rename it as run-test.
> +
> +and define test target to compile the test files.
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + Makefile.am | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index b6db339..de176c4 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -124,7 +124,9 @@ regress2: $(check_PROGRAMS)
> + test_numademo: numademo
> + 	./numademo -t -e 10M
> +
> +-test: all $(check_PROGRAMS) regress1 regress2 test_numademo
> ++test: all $(check_PROGRAMS)
> ++
> ++run-test: all $(check_PROGRAMS) regress1 regress2 test_numademo
> +
> + TESTS_ENVIRONMENT = builddir='$(builddir)'; export builddir;
> +
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch b/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
> new file mode 100644
> index 0000000000..9812ecc8b3
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
> @@ -0,0 +1,64 @@
> +From 59fd750a84bbe5874dec936d2bee9ef11a1b6505 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 21 Jul 2015 02:01:22 +0900
> +Subject: [PATCH] Fix the test output format
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + test/regress  |  6 +++---
> + test/regress2 | 11 +++++------
> + 2 files changed, 8 insertions(+), 9 deletions(-)
> +
> +diff --git a/test/regress b/test/regress
> +index 2ce1705..d086a47 100755
> +--- a/test/regress
> ++++ b/test/regress
> +@@ -74,6 +74,7 @@ probe_hardware()
> + 	if [ $numnodes -lt 2 ] ; then
> + 	    echo "need at least two nodes with at least $NEEDPAGES each of"
> + 	    echo "free memory for mempolicy regression tests"
> ++	    echo "FAIL: numa regress"
> +	    exit 77  # Skip test
> + 	fi
> + }
> +@@ -207,10 +208,9 @@ main()
> + 	rm A B
> +
> + 	if [ "$EXIT" = 0 ] ; then
> +-		echo '========SUCCESS'
> ++		echo 'PASS: numactl regress'
> + 	else
> +-		echo '========FAILURE'
> +-		exit 1
> ++		echo 'FAIL: numactl regress'
> + 	fi
> + }
> +
> +diff --git a/test/regress2 b/test/regress2
> +index aa6ea41..450c510 100755
> +--- a/test/regress2
> ++++ b/test/regress2
> +@@ -9,12 +9,11 @@ testdir=`dirname "$0"`
> + export PATH=${builddir}:$PATH
> +
> + T() {
> +-       echo "$@"
> +-       if ! $VALGRIND "$@" ;  then
> +-	  echo	$1 FAILED!!!!
> +-	  exit 1
> +-       fi
> +-       echo
> ++	if ! $VALGRIND "$@" 2>&1 1>/dev/null;  then
> ++	   echo  "FAIL: $1"
> ++	else
> ++	   echo "PASS: $1"
> ++	fi
> + }
> +
> + # still broken
> +--
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/numactl/numactl/Makefile b/meta-oe/recipes-support/numactl/numactl/Makefile
> new file mode 100644
> index 0000000000..9a5134c3f2
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/numactl/Makefile
> @@ -0,0 +1,7 @@
> +.PHONY: regress1 regress2
> +
> +regress1:
> +	cd test ; ./regress
> +
> +regress2:
> +	cd test ; ./regress2
> diff --git a/meta-oe/recipes-support/numactl/numactl/run-ptest b/meta-oe/recipes-support/numactl/numactl/run-ptest
> new file mode 100755
> index 0000000000..215f7c25b9
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/numactl/run-ptest
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +make regress1
> +make regress2
> +if  numademo -t -e 10M; then
> +	echo "PASS: numademo"
> +else
> +	echo "FAIL: numademo"
> +fi
> +
> diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
> new file mode 100644
> index 0000000000..504fe03275
> --- /dev/null
> +++ b/meta-oe/recipes-support/numactl/numactl_git.bb
> @@ -0,0 +1,62 @@
> +SUMMARY = "Development package for building Applications that use numa"
> +HOMEPAGE = "http://oss.sgi.com/projects/libnuma/"
> +DESCRIPTION = "Simple NUMA policy support. It consists of a numactl program \
> +to run other programs with a specific NUMA policy and a libnuma to do \
> +allocations with NUMA policy in applications."
> +LICENSE = "GPL-2.0 & LGPL-2.1"
> +SECTION = "apps"
> +
> +inherit autotools-brokensep ptest
> +
> +LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
> +
> +SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
> +PV = "2.0.14+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/numactl/numactl \
> +    file://Fix-the-test-output-format.patch \
> +    file://Makefile \
> +    file://run-ptest \
> +    file://0001-define-run-test-target.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +# ARM does not currently support NUMA
> +COMPATIBLE_HOST = "^((?!arm).*)$"
> +
> +LDFLAGS_append_riscv64 = " -latomic"
> +LDFLAGS_append_riscv32 = " -latomic"
> +
> +do_install() {
> +    oe_runmake DESTDIR=${D} prefix=${D}/usr install
> +    #remove the empty man2 directory
> +    rm -r ${D}${mandir}/man2
> +}
> +
> +do_compile_ptest() {
> +    oe_runmake test
> +}
> +
> +do_install_ptest() {
> +    #install tests binaries
> +    local test_binaries="distance ftok mbind_mig_pages migrate_pages move_pages \
> +    mynode    nodemap node-parse pagesize prefered randmap realloc_test \
> +    tbitmap tshared"
> +
> +    [ ! -d ${D}/${PTEST_PATH}/test ] && mkdir -p ${D}/${PTEST_PATH}/test
> +    for i in $test_binaries; do
> +        install -m 0755 ${B}/test/.libs/$i ${D}${PTEST_PATH}/test
> +    done
> +
> +    local test_scripts="checktopology checkaffinity printcpu regress regress2 \
> +        shmtest  runltp bind_range"
> +    for i in $test_scripts; do
> +        install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
> +    done
> +
> +    install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
> +    install -m 0755 ${B}/.libs/numactl ${D}${PTEST_PATH}/
> +}
> +
> +RDEPENDS_${PN}-ptest = "bash"
> 
> 
> 
> 
> 
