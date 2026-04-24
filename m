Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD842FED3E0
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:11:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24927.1777042937565006703
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2026 08:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=WnEr4CnD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 186254E42AF5;
	Fri, 24 Apr 2026 15:02:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD5F2604EB;
	Fri, 24 Apr 2026 15:02:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E79A9107208E8;
	Fri, 24 Apr 2026 17:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777042931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=aj8paKJmeVQd8J6RdD2WII9HPNTNa4INwCiHrdWqJuQ=;
	b=WnEr4CnDBYbCFBvVWXsywBAP3B8nXOf12EUwUGkPr6+RSZIO5lXHdcA5uhYnhTe6hs52wc
	INB2wC9aVqu99Pq18pCbiTZfrMHkWtAu7jQmLq9EjTz/jDDxsbnyAd5Qsuho1zDHuEHLNL
	bcrxcVt7B0HwhZDeKuWhCHN9LTxkTz8Yfad0FVkny4xxNAVW4N6fwSbVJXBv8DfyBsen+B
	j4bbfjMJUB+9q3dh4uw+MuKzDxuP543LgJUXNGmM8tlEzgqKriDoj867ACAZxAapqk5F5e
	aSTqBUo2lEqabcb1s2A5ZCzh224xzS0zBkZIf/yE9Hu3ay6RKW3PUAqRNgYXFA==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-networking][PATCH] memcached: drop libhugetlbfs
Date: Fri, 24 Apr 2026 17:02:06 +0200
Message-ID: <20260424150206.10679-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2026 15:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126608

In Linux, memcached relies on transparent huge pages, and even if
libhugetlbfs is enabled by the PACKAGECONFIG (and detected during
do_configure, of course), it is simply not used:

root@qemuriscv64:~# ldd $(which memcached)
    linux-vdso.so.1 (0x0000003fa4358000)
    libevent-2.1.so.7 =3D> /lib/libevent-2.1.so.7 (0x0000003fa42b0000)
    libc.so.6 =3D> /lib/libc.so.6 (0x0000003fa4157000)
    /usr/lib/ld-linux-riscv64-lp64d.so.1 (0x0000003fa435a000)

The main reason is the fact that the only call to a function coming from
libhugetlbfs is here:

https://github.com/memcached/memcached/blob/master/memcached.c#L4274

and getpagesizes() is only called if the #if block evaluates to true:

    int ret =3D -1;
    size_t sizes[32];
    int avail =3D getpagesizes(sizes, 32);
(...)
    /* check if transparent hugepages is compiled into the kernel */
    /* RH based systems possibly uses a different path */
    static const char *mm_thp_paths[] =3D {
        "/sys/kernel/mm/transparent_hugepage/enabled",
        "/sys/kernel/mm/redhat_transparent_hugepage/enabled",
        NULL
    };
(...)

This block relies on HAVE_MEMCNTL, which is a Solaris-specific feature.
Therefore, the dependency link between memcached and libhugetlbfs
doesn't exist in Linux.

Drop libhugetlbfs from memcached's recipe.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 .../memcached-add-hugetlbfs-check.patch       | 32 -------------------
 .../memcached/memcached_1.6.41.bb             | 10 ++----
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-networking/recipes-support/memcached/memcached/m=
emcached-add-hugetlbfs-check.patch

diff --git a/meta-networking/recipes-support/memcached/memcached/memcache=
d-add-hugetlbfs-check.patch b/meta-networking/recipes-support/memcached/m=
emcached/memcached-add-hugetlbfs-check.patch
deleted file mode 100644
index 26281e73ef..0000000000
--- a/meta-networking/recipes-support/memcached/memcached/memcached-add-h=
ugetlbfs-check.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From dfa90817a08f206f7e2dbba44d913968ae7f7d94 Mon Sep 17 00:00:00 2001
-From: Chong Lu <Chong.Lu@windriver.com>
-Date: Tue, 19 Aug 2014 17:38:32 +0800
-Subject: [PATCH] memcached: add knob to detect whether hugetlbfs are che=
cked
-
-Add knob to detect whether hugetlbfs are checked or not.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6f2ef97..bd7dd96 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -559,8 +559,12 @@ if test "x$enable_static" =3D "xyes"; then
- fi
-=20
- dnl -------------------------------------------------------------------=
---------
-+AC_ARG_ENABLE(hugetlbfs,
-+  [AS_HELP_STRING([--enable-hugetlbfs],[Enable hugetlbfs])])
-=20
--AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
-+if test "x$enable_hugetlbfs" =3D "xyes"; then
-+  AC_SEARCH_LIBS(gethugepagesizes, hugetlbfs)
-+fi
-=20
- AC_HEADER_STDBOOL
- AH_BOTTOM([#if HAVE_STDBOOL_H
diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.41.b=
b b/meta-networking/recipes-support/memcached/memcached_1.6.41.bb
index 9d759069ba..e41ebdb171 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.41.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.41.bb
@@ -19,17 +19,14 @@ RDEPENDS:${PN} +=3D "perl perl-module-posix perl-modu=
le-autoloader \
     perl-module-tie-hash bash \
     "
=20
-SRC_URI =3D "http://www.memcached.org/files/${BP}.tar.gz \
-           file://memcached-add-hugetlbfs-check.patch \
-           "
+SRC_URI =3D "http://www.memcached.org/files/${BP}.tar.gz"
 SRC_URI[sha256sum] =3D "e097073c156eeff9e12655b054f446d57374cfba5c132dcd=
be7fac64e728286a"
=20
 CVE_STATUS[CVE-2022-26635] =3D "disputed: this is a problem of applicati=
ons using php-memcached inproperly"
=20
 UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
=20
-# set the same COMPATIBLE_HOST as libhugetlbfs
-COMPATIBLE_HOST =3D "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux=
*"
+COMPATIBLE_HOST =3D "(i.86|x86_64|powerpc|powerpc64|riscv64|aarch64|arm)=
.*-linux*"
=20
 # assoc.c:83:9: error: variable 'depth' set but not used [-Werror,-Wunus=
ed-but-set-variable]
 CFLAGS:append:toolchain-clang =3D " -Wno-error=3Dunused-but-set-variable=
"
@@ -42,9 +39,6 @@ python __anonymous () {
         d.appendVar('EXTRA_OECONF', " ac_cv_c_endian=3Dbig")
 }
=20
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[hugetlbfs] =3D "--enable-hugetlbfs, --disable-hugetlbfs, l=
ibhugetlbfs"
-
 inherit update-rc.d
=20
 INITSCRIPT_NAME =3D "memcached"
--=20
2.47.0


