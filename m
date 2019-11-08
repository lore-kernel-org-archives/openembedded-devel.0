Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 524 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Nov 2019 13:05:50 UTC
Received: from relay.dream-property.net (relay.dream-property.net
	[178.19.67.222])
	by mail.openembedded.org (Postfix) with ESMTP id 4914A7FC49
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 13:05:50 +0000 (UTC)
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 92E8A100944C2;
	Fri,  8 Nov 2019 12:57:07 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de
	[176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D4ED631412DE;
	Fri,  8 Nov 2019 13:57:06 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org; 
	s=dkim; t=1573217827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=ZWuZBN62+vE52FNz2hQDAkdlhyVtPaXuD/sa1tTee0o=;
	b=mcahjKl3AYS6Jhf7SKHm/LM/XUIwHor7it8MiFOIAYL4VEQV/vY75tp2hrDNOdIEgk5viL
	aMwjbKSYNyQfCyBQ==
Date: Fri, 8 Nov 2019 13:57:03 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: jackie.huang@windriver.com
Message-ID: <20191108135703.734211f0@opendreambox.org>
In-Reply-To: <20190708063901.13914-1-yongxin.liu@windriver.com>
References: <20190708063901.13914-1-yongxin.liu@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3 1/9] keyutils: add new recipe
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
X-List-Received-Date: Fri, 08 Nov 2019 13:05:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jackie, 

your patch was merged into meta-oe earlier this year, but another version of keyutils already existed in OE-Core. Would you mind updating the version in OE-Core and removing the version from meta-oe?

Best regards,
Andreas



On Mon, 8 Jul 2019 14:38:53 +0800
Yongxin Liu <yongxin.liu@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
> 
> keyutils is utilities to control the kernel key
> management facility and to provide a mechanism by
> which the kernel call back to userspace to get a
> key instantiated.
> 
> It's required by ecryptfs-utils.
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...ix-error-report-by-adding-default-message.patch | 42 ++++++++++++++++++++
>  files/keyutils-test-fix-output-format.patch        | 41 ++++++++++++++++++++
>  files/keyutils-use-relative-path-for-link.patch    | 28 ++++++++++++++
>  files/run-ptest                                    |  3 ++
>  keyutils_1.5.10.bb                                 | 45 ++++++++++++++++++++++
>  5 files changed, 159 insertions(+)
>  create mode 100644 files/keyutils-fix-error-report-by-adding-default-message.patch
>  create mode 100644 files/keyutils-test-fix-output-format.patch
>  create mode 100644 files/keyutils-use-relative-path-for-link.patch
>  create mode 100755 files/run-ptest
>  create mode 100644 keyutils_1.5.10.bb
> 
> diff --git a/files/keyutils-fix-error-report-by-adding-default-message.patch b/files/keyutils-fix-error-report-by-adding-default-message.patch
> new file mode 100644
> index 000000000..acd91c01c
> --- /dev/null
> +++ b/files/keyutils-fix-error-report-by-adding-default-message.patch
> @@ -0,0 +1,42 @@
> +fix keyutils test error report
> +
> +Upstream-Status: Pending
> +
> +"Permission denied" may be the reason of EKEYEXPIRED and EKEYREVOKED.
> +"Required key not available" may be the reason of EKEYREVOKED.
> +EXPIRED and REVOKED are 2 status of kernel security keys features.
> +But the userspace keyutils lib will output the error message, which may
> +have several reasons.
> +
> +Signed-off-by: Han Chao <chan@windriver.com>
> +
> +diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
> +index bbca00a..739e9d0 100644
> +--- a/tests/toolbox.inc.sh
> ++++ b/tests/toolbox.inc.sh
> +@@ -227,11 +227,12 @@ function expect_error ()
> + 	    ;;
> + 	EKEYEXPIRED)
> + 	    my_err="Key has expired"
> +-	    alt_err="Unknown error 127"
> ++	    alt_err="Permission denied"
> + 	    ;;
> + 	EKEYREVOKED)
> + 	    my_err="Key has been revoked"
> +-	    alt_err="Unknown error 128"
> ++	    alt_err="Permission denied"
> ++	    alt2_err="Required key not available"
> + 	    ;;
> + 	EKEYREJECTED)
> + 	    my_err="Key has been rejected"
> +@@ -249,6 +250,9 @@ function expect_error ()
> +     elif [ "x$alt_err" != "x" ] && expr "$my_errmsg" : ".*: $alt_err" >&/dev/null
> +     then
> + 	:
> ++    elif [ "x$alt2_err" != "x" ] && expr "$my_errmsg" : ".*: $alt2_err" >&/dev/null
> ++    then
> ++	:
> +     elif [ "x$old_err" != "x" ] && expr "$my_errmsg" : ".*: $old_err" >&/dev/null
> +     then
> + 	:
> +
> diff --git a/files/keyutils-test-fix-output-format.patch b/files/keyutils-test-fix-output-format.patch
> new file mode 100644
> index 000000000..a4ffd50ce
> --- /dev/null
> +++ b/files/keyutils-test-fix-output-format.patch
> @@ -0,0 +1,41 @@
> +From 49b6321368e4bd3cd233d045cd09004ddd7968b2 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Mon, 15 May 2017 14:52:00 +0800
> +Subject: [PATCH] keyutils: fix output format
> +
> +keyutils ptest output format is incorrect, according to yocto
> +Development Manual
> +(http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest)
> +5.10.6. Testing Packages With ptestThe test generates output in the format used by Automake:
> +<result>: <testname>
> +where the result can be PASS, FAIL, or SKIP, and the testname can be any
> +identifying string.
> +So we should change the test result format to match yocto ptest rules.
> +
> +Upstream-Status: Inappropriate [OE ptest specific]
> +
> +Signed-off-by: Li Wang <li.wang@windriver.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + tests/runtest.sh | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/tests/runtest.sh b/tests/runtest.sh
> +index b6eaa7c..84263fb 100644
> +--- a/tests/runtest.sh
> ++++ b/tests/runtest.sh
> +@@ -21,6 +21,11 @@ for i in ${TESTS}; do
> +     echo "### RUNNING TEST $i"
> +     if [[ $AUTOMATED != 0 ]] ; then
> +         bash ./runtest.sh
> ++        if [ $? != 0 ]; then
> ++            echo "FAIL: $i"
> ++        else
> ++            echo "PASS: $i"
> ++        fi
> +     else
> +         bash ./runtest.sh || exit 1
> +     fi
> +-- 
> +2.11.0
> +
> diff --git a/files/keyutils-use-relative-path-for-link.patch b/files/keyutils-use-relative-path-for-link.patch
> new file mode 100644
> index 000000000..dde1af44a
> --- /dev/null
> +++ b/files/keyutils-use-relative-path-for-link.patch
> @@ -0,0 +1,28 @@
> +Subject: [PATCH] keyutils: use relative path for link
> +
> +The absolute path of the symlink will be invalid
> +when populated in sysroot, so use relative path instead.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 824bbbf..8ce3a13 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -167,7 +167,7 @@ ifeq ($(NO_SOLIB),0)
> + 	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
> + 	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
> + 	mkdir -p $(DESTDIR)$(USRLIBDIR)
> +-	$(LNS) $(LIBDIR)/$(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
> ++	$(LNS) $(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
> + endif
> + 	$(INSTALL) -D keyctl $(DESTDIR)$(BINDIR)/keyctl
> + 	$(INSTALL) -D request-key $(DESTDIR)$(SBINDIR)/request-key
> +-- 
> +2.11.0
> +
> diff --git a/files/run-ptest b/files/run-ptest
> new file mode 100755
> index 000000000..305707f65
> --- /dev/null
> +++ b/files/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +export AUTOMATED=1
> +make -C tests run
> diff --git a/keyutils_1.5.10.bb b/keyutils_1.5.10.bb
> new file mode 100644
> index 000000000..2ead8fa19
> --- /dev/null
> +++ b/keyutils_1.5.10.bb
> @@ -0,0 +1,45 @@
> +SUMMARY = "Linux Key Management Utilities"
> +DESCRIPTION = "\
> +    Utilities to control the kernel key management facility and to provide \
> +    a mechanism by which the kernel call back to userspace to get a key \
> +    instantiated. \
> +    "
> +HOMEPAGE = "http://people.redhat.com/dhowells/keyutils"
> +SECTION = "base"
> +
> +LICENSE = "LGPLv2.1+ & GPLv2.0+"
> +
> +LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
> +                    file://LICENCE.LGPL;md5=7d1cacaa3ea752b72ea5e525df54a21f"
> +
> +
> +inherit siteinfo ptest
> +
> +SRC_URI = "http://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
> +           file://keyutils-use-relative-path-for-link.patch \
> +           file://keyutils-test-fix-output-format.patch \
> +           file://keyutils-fix-error-report-by-adding-default-message.patch \
> +           file://run-ptest \
> +           "
> +
> +SRC_URI[md5sum] = "3771676319bc7b84b1549b5c63ff5243"
> +SRC_URI[sha256sum] = "115c3deae7f181778fd0e0ffaa2dad1bf1fe2f5677cf2e0e348cdb7a1c93afb6"
> +
> +EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
> +    NO_ARLIB=1 \
> +    LIBDIR=${base_libdir} \
> +    USRLIBDIR=${base_libdir} \
> +    BUILDFOR=${SITEINFO_BITS}-bit \
> +    NO_GLIBC_KEYERR=1 \
> +    "
> +
> +do_install () {
> +    oe_runmake DESTDIR=${D} install
> +}
> +
> +do_install_ptest () {
> +    cp -r ${S}/tests ${D}${PTEST_PATH}/
> +    sed -i -e 's/OSDIST=Unknown/OSDIST=${DISTRO}/' ${D}${PTEST_PATH}/tests/prepare.inc.sh
> +}
> +
> +RDEPENDS_${PN}-ptest += "glibc-utils"


