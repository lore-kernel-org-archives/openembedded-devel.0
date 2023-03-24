Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FFEC761AF
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:29:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.89926.1679617790785784726
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=royWrYcJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617788; i=@fujitsu.com;
	bh=jXudd3n2/RiE1jFs/wSqYtnmJUQWLuZl16W2qCArgYQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=royWrYcJ+aZsHj0srYpCcRvwSEs6xlYzE3s8Uj2r0rJH2McCzFLG8/51yceNepeZu
	 t4m80AeHB84Ti9059WGOAnd7MCC4Axoq/X5V/fXk1I4O1fT1yzXBhocQ613dYz7Rwp
	 sCgnwftIHzqbLOFsb9Hs2BJo/YAmMbcIF8uyCCyk2avIVMpFcKYcfVpUoZ0Wd6Snv4
	 8Vs9Cd4r1COhMKYCPF07iZ8t1c+tAbfLLwZtx9b3gVlggXX+lWy2YUsNQ99Rs1uyHg
	 yDq81ItubYppbttd3Npcr4xO6LVy6TpBCvpik62Y7P+4oLt3vHTA3jDbcqfzohWBKf
	 MU4WM7Q5Dg1mw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSffPO5k
  Ug02H2SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozpkyYyF8zXr1h6+yJjA+MRzS5GLg4hgSeM
  Eg8v/GaDcK4zSTR+eskC4exhlPh28D17FyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  4DVCAu4SmzddwcsziKgKjFv+z4mEJtXwEni5rwHYL0SAgoSUx6+B6vhFHCW2HCnCcwWAqrZ/3
  AuG0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0KicfohJghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG0+LUorLUIl1LvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pVpPfwXi476/eIUZJDiYlUV6JUOkUIb6k/JTKjMTijPii0pzU4kOMMhwcShK8n
  9/IpAgJFqWmp1akZeYAIwkmLcHBoyTCe+gsUJq3uCAxtzgzHSJ1itGS4/y6S3uZOa5euQIkN+
  3rOsAsxJKXn5cqJc6b+BaoQQCkIaM0D24cLNovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  mFQamDiGezLwSuK2vgA5iAjrIuQbsoJJEhJRUA1PeNoO4Kn/zwlvHi6NaltZOO+fI80eU26dx
  6ep9WYlTfhXpPZZNNRNWOZb4My89xmtZdV7VteexK/zOl8sX6k5JOOcm+uyEnfjpngcTcpS4X
  pYfXzP36dUI1gVtqfJ/2+akt/5KE3JgFxNeu6XOaKHm1IsT3/gc+Z187e3M3mWcW028zijM/V
  XakCLrcKhtu7T5JTOXxbVWLu6Oiad6vv4NyLaJvb/TSvR+vqayktsM/38nPj3PLnmxu4Blvs/
  etDsmNR6h0zYYBhY17Np6i7el8+7aF0bzzj+2X2Cg9UnAYuvnO3mTBO7ffLKF1aRk481Kt6kt
  sjGBi+R+b3+2e7bgxqO6Tz93zL7i+CzI+J4SS3FGoqEWc1FxIgCTK7oPcQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1679617787!44156!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18971 invoked from network); 24 Mar 2023 00:29:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:29:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C93431000EE
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:47 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B98541000E9
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:29:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] adcli: upgrade 0.9.0 -> 0.9.2
Date: Fri, 24 Mar 2023 08:29:23 +0800
Message-ID: <1679617764-27268-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617764-27268-1-git-send-email-wangmy@fujitsu.com>
References: <1679617764-27268-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101686

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch
Fixed-build-error-on-musl.patch
removed since they're included in 0.9.2.

Changelog:
==========
 - adenroll: set password via LDAP instead Kerberos [#27]
 - disco: fall back to LDAPS if CLDAP ping was not successful [#31]
 - tools: replace getpass() [#10]
 - adenroll: write SID before secret to Samba's db [rhbz#1991619]
 - doc: add clarification to add-member command on doc/adcli.xml
 - tools: Set umask before calling mkdtemp()
 - Avoid undefined behaviour in short option parsing
 - library: include endian.h for le32toh
 - man: Fix typos and use consistent upper case for some keywords
 - doc: avoid gnu-make specific usage of $< [#26]
 - configure: check for ns_get16 and ns_get32 as well [rhbz#1984891]
 - Add setattr and delattr options [rhbz#1690920]
 - entry: add passwd-user sub-command [rhbz#1952828]
 - Add dont-expire-password option [rhbz#1769644]
 - build: add --with-vendor-error-message configure option [rhbz#1889386]
 - tools: add show-computer command [rhbz#1737342]
 - add description option to join and update [rhbz#1737342]
 - Use GSS-SPNEGO if available [rhbz#1762420]
 - add option use-ldaps [rhbz#1762420]
 - tools: disable SSSD's locator plugin [rhbz#1762633]
 - doc: explain required AD permissions [gfo#20]
 - computer: add create-msa sub-command [rhbz#1854112}
 - Add account-disable option [gfo#21]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../adcli/{adcli_0.9.0.bb => adcli_0.9.2.bb}  |  7 +---
 ...ck-for-ns_get16-and-ns_get32-as-well.patch | 39 -------------------
 .../files/Fixed-build-error-on-musl.patch     | 26 -------------
 3 files changed, 2 insertions(+), 70 deletions(-)
 rename meta-networking/recipes-connectivity/adcli/{adcli_0.9.0.bb => adcli_0.9.2.bb} (78%)
 delete mode 100644 meta-networking/recipes-connectivity/adcli/files/0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch
 delete mode 100644 meta-networking/recipes-connectivity/adcli/files/Fixed-build-error-on-musl.patch

diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
similarity index 78%
rename from meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
rename to meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
index b9fefa8589..6092823944 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
@@ -4,12 +4,9 @@ DESCRIPTION = "A helper library and tools for Active Directory client operations
 HOMEPAGE = "http://cgit.freedesktop.org/realmd/adcli"
 SECTION = "net"
 
-SRCREV = "1b1528038e084a9f81ea108cffca9c2707623b9c"
+SRCREV = "8e88e3590a19006362ea8b8dfdc18bb88b3cb3b5"
 
-SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master \
-           file://Fixed-build-error-on-musl.patch \
-           file://0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch \
-	   "
+SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-networking/recipes-connectivity/adcli/files/0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch b/meta-networking/recipes-connectivity/adcli/files/0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch
deleted file mode 100644
index 8cc859318c..0000000000
--- a/meta-networking/recipes-connectivity/adcli/files/0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 98660f57a98f45dbf55414cfde46338019adcc33 Mon Sep 17 00:00:00 2001
-From: Sumit Bose <sbose@redhat.com>
-Date: Wed, 28 Jul 2021 12:55:16 +0200
-Subject: [PATCH] configure: check for ns_get16 and ns_get32 as well
-
-With newer versions of glibc res_query() might ba already available in
-glibc with ns_get16() and ns_get32() still requires libresolv.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/realmd/adcli/-/commit/e841ba7513f3f8b6393183d2dea9adcbf7ba2e44]
-Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1984891
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ebc6cb4..e8775d0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -98,13 +98,15 @@ AC_SUBST(LDAP_CFLAGS)
- # -------------------------------------------------------------------
- # resolv
-
--AC_MSG_CHECKING(for which library has res_query)
-+AC_MSG_CHECKING([for which library has res_query, ns_get16 and ns_get32])
- for lib in "" "-lresolv"; do
- 	saved_LIBS="$LIBS"
- 	LIBS="$LIBS $lib"
- 	AC_LINK_IFELSE([
- 		AC_LANG_PROGRAM([#include <resolv.h>],
--		                [res_query (0, 0, 0, 0, 0)])
-+		                [res_query (0, 0, 0, 0, 0);
-+		                 ns_get32 (NULL);
-+		                 ns_get16 (NULL);])
- 	],
- 	[ AC_MSG_RESULT(${lib:-libc}); have_res_query="yes"; break; ],
- 	[ LIBS="$saved_LIBS" ])
---
-2.32.0
diff --git a/meta-networking/recipes-connectivity/adcli/files/Fixed-build-error-on-musl.patch b/meta-networking/recipes-connectivity/adcli/files/Fixed-build-error-on-musl.patch
deleted file mode 100644
index 87bcdfebd7..0000000000
--- a/meta-networking/recipes-connectivity/adcli/files/Fixed-build-error-on-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 0e64782a45cba9753d1210ee7d7c9dbd42f74ceb Mon Sep 17 00:00:00 2001
-From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
-Date: Fri, 12 Jul 2019 12:46:54 +0800
-Subject: [PATCH] Fixed build error on musl.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
----
- library/adutil.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/library/adutil.c b/library/adutil.c
-index 9b0c47f..b673edd 100644
---- a/library/adutil.c
-+++ b/library/adutil.c
-@@ -30,6 +30,7 @@
- #include <assert.h>
- #include <ctype.h>
- #include <errno.h>
-+#include <endian.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.20.1
-
-- 
2.34.1


