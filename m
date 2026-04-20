Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DD2F55817
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 11:22:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17211.1776683854615701679
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 04:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=xQPSOrPE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1A53CC5C997
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:18:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4498A5FFA5;
	Mon, 20 Apr 2026 11:17:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4918210461581;
	Mon, 20 Apr 2026 13:17:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776683851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gQrePzvuvT16vlIuK64smP/xrh3gQRSRTZ+0uMgRolk=;
	b=xQPSOrPE3S4HiV+D7wveT2gKdrUyFf4kl5WaAIRLNpv7o29eo51zb7JhrDId944sNnnkVb
	Ac5bFtsw73faq39LX61bWDayu9Do5PytBOAe1ncj053wc+XB78OS3gvkSZoggvyaoyCC5c
	+sZzSu5tXV8s1gVgV8a9JBoV+gWgpu9PwdRYex6HN775MAv6LhjNrlORBZv6DaRR3kMxh7
	f3OWNoEg8MR4gRImILlclH9hGRMmeltdzrzwFpb0GZ8Wm1I77jp9Z2Na867Sye9Ushxqfu
	i7EH85hRddvMqVzLzKGmk4niYLM8KDVqExgea611n81C4DytDtneYzHyE9WEww==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-oe][PATCH 3/4] kernel-selftest: fix mm selftests dependencies
Date: Mon, 20 Apr 2026 13:17:11 +0200
Message-ID: <20260420111712.26945-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260420111712.26945-1-joaomarcos.costa@bootlin.com>
References: <20260420111712.26945-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126498

Add numa (numactl), as required by rmap, migration, and others.

Add liburing, otherwise some tests would be disabled.

Moreover, liburing's availability is checked in a shell script executed
prior to the compilation of the individual test cases. This script,
however, does not read CFLAGS.

Backport a fix [1] from mainline to address this issue.

[1] https://github.com/torvalds/linux/commit/7f532d19c8be76ad2fcd7ab6b0c9=
eb618f70966b

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 .../kernel-selftest/kernel-selftest.bb        |  7 +-
 ...s-down-full-CC-and-CFLAGS-to-check_c.patch | 76 +++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftes=
t/0001-selftests-mm-pass-down-full-CC-and-CFLAGS-to-check_c.patch

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/=
meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 08b0c60c6c..1e18caedda 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -12,9 +12,14 @@ S =3D "${UNPACKDIR}"
 SRC_URI:append:libc-musl =3D "\
                       file://userfaultfd.patch \
                       "
+
+# Fix liburing detection (from Linux v7.0)
+MM_PATCH =3D "file://0001-selftests-mm-pass-down-full-CC-and-CFLAGS-to-c=
heck_c.patch"
+
 SRC_URI +=3D "file://run-ptest \
             file://COPYING \
             file://0001-selftests-timers-Fix-clock_adjtime-for-newer-32-=
bit-.patch \
+            ${@bb.utils.contains('PACKAGECONFIG', 'mm', '${MM_PATCH}', '=
', d)} \
             "
=20
 # now we just test bpf and mm (formerly known as vm)
@@ -35,7 +40,7 @@ PACKAGECONFIG:remove:riscv32 =3D "bpf"
=20
 PACKAGECONFIG[bpf] =3D ",,elfutils elfutils-native libcap libcap-ng rsyn=
c-native python3-docutils-native,"
 PACKAGECONFIG[firmware] =3D ",,libcap, bash"
-PACKAGECONFIG[mm] =3D ",,libcap, libgcc bash"
+PACKAGECONFIG[mm] =3D ",,libcap liburing numactl, libgcc bash"
=20
 do_patch[depends] +=3D "virtual/kernel:do_shared_workdir"
 do_compile[depends] +=3D "virtual/kernel:do_install"
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-=
selftests-mm-pass-down-full-CC-and-CFLAGS-to-check_c.patch b/meta-oe/reci=
pes-kernel/kernel-selftest/kernel-selftest/0001-selftests-mm-pass-down-fu=
ll-CC-and-CFLAGS-to-check_c.patch
new file mode 100644
index 0000000000..a115d56dd1
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-selftes=
ts-mm-pass-down-full-CC-and-CFLAGS-to-check_c.patch
@@ -0,0 +1,76 @@
+From 8f9e6395f1f8121b577eeb4cb54f671a9088bddd Mon Sep 17 00:00:00 2001
+From: Kevin Brodsky <kevin.brodsky@arm.com>
+Date: Thu, 22 Jan 2026 17:02:18 +0000
+Subject: [PATCH] selftests/mm: pass down full CC and CFLAGS to check_con=
fig.sh
+
+check_config.sh checks that liburing is available by running the compile=
r
+provided as its first argument.  This makes two assumptions:
+
+1. CC consists of only one word
+2. No extra flag is required
+
+Unfortunately, there are many situations where these assumptions don't
+hold.  For instance:
+
+- When using Clang, CC consists of multiple words
+- When cross-compiling, extra flags may be required to allow the
+  compiler to find headers
+
+Remove these assumptions by passing down CC and CFLAGS as-is from the
+Makefile, so that the same command line is used as when actually buildin=
g
+the tests.
+
+Link: https://lkml.kernel.org/r/20260122170224.4056513-4-kevin.brodsky@a=
rm.com
+Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
+Reviewed-by: Mark Brown <broonie@kernel.org>
+Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
+Cc: Jason Gunthorpe <jgg@nvidia.com>
+Cc: John Hubbard <jhubbard@nvidia.com>
+Cc: Dev Jain <dev.jain@arm.com>
+Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+Cc: Paolo Abeni <pabeni@redhat.com>
+Cc: Ryan Roberts <ryan.roberts@arm.com>
+Cc: SeongJae Park <sj@kernel.org>
+Cc: Shuah Khan <shuah@kernel.org>
+Cc: Usama Anjum <Usama.Anjum@arm.com>
+Cc: wang lian <lianux.mm@gmail.com>
+Cc: Yunsheng Lin <linyunsheng@huawei.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+
+Upstream-Status: Backport [from commit 7f532d19c8be7, in tag v7.0]
+
+---
+ tools/testing/selftests/mm/Makefile        | 2 +-
+ tools/testing/selftests/mm/check_config.sh | 3 +--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftes=
ts/mm/Makefile
+index ae6f994d3add..fc9b9ec367c3 100644
+--- a/tools/testing/selftests/mm/Makefile
++++ b/tools/testing/selftests/mm/Makefile
+@@ -228,7 +228,7 @@ $(OUTPUT)/ksm_tests: LDLIBS +=3D -lnuma
+ $(OUTPUT)/migration: LDLIBS +=3D -lnuma
+=20
+ local_config.mk local_config.h: check_config.sh
+-	/bin/sh ./check_config.sh $(CC)
++	CC=3D"$(CC)" CFLAGS=3D"$(CFLAGS)" ./check_config.sh
+=20
+ EXTRA_CLEAN +=3D local_config.mk local_config.h
+=20
+diff --git a/tools/testing/selftests/mm/check_config.sh b/tools/testing/=
selftests/mm/check_config.sh
+index 3954f4746161..b84c82bbf875 100755
+--- a/tools/testing/selftests/mm/check_config.sh
++++ b/tools/testing/selftests/mm/check_config.sh
+@@ -16,8 +16,7 @@ echo "#include <sys/types.h>"        > $tmpfile_c
+ echo "#include <liburing.h>"        >> $tmpfile_c
+ echo "int func(void) { return 0; }" >> $tmpfile_c
+=20
+-CC=3D${1:?"Usage: $0 <compiler> # example compiler: gcc"}
+-$CC -c $tmpfile_c -o $tmpfile_o >/dev/null 2>&1
++$CC $CFLAGS -c $tmpfile_c -o $tmpfile_o
+=20
+ if [ -f $tmpfile_o ]; then
+     echo "#define LOCAL_CONFIG_HAVE_LIBURING 1"  > $OUTPUT_H_FILE
+--=20
+2.47.0
+
--=20
2.43.0


