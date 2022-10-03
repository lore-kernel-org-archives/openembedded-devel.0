Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9107BC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 06:27:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15885.1664778449308151833
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Oct 2022 23:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XCpyRXId;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=72757bed5a=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 29369Uvd021758
	for <openembedded-devel@lists.openembedded.org>; Mon, 3 Oct 2022 06:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=U9YTBRLr/z9naYRtZ1VyrNpFQTLxzD3DvmXbPxflDWQ=;
 b=XCpyRXIdwby+6gvXXtIqV2PAvbfnqxW42rp/ZfITbGJUKIv72XrcT/drGUeZYsqfhzzk
 4RHfkqKHrntHLQ6nmjfX2Gz3WHWHupM8xlFKe6B0kHEcZa8KG3NREC4UZwAG3vcSKrs/
 N/OjqBSumf9QJ0WGSpVjvO89lsgtEaVQxwrNVvB/8KlyzDvrMjOksW6H6utxccPPnqqB
 9Qa5SFQZpDvRElnwU2exm5l0o6fqxbiKbdHGk+Eqi/q8skTCewoZf9vqpd+6TQmrWAYh
 H/mHKTBdmghOOqKK5qNeVbZ05DBya1IGOwZ1MmG1+0lx/2dC2aifpZXXj2wHKs8oQ47P dg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jxas21g2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 06:27:28 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 2 Oct 2022 23:27:26 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 2 Oct 2022 23:27:26 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 2 Oct 2022 23:27:25 -0700
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <narpat.mali@windriver.com>, <archana.polampalli@windriver.com>,
        <yogita.urade@windriver.com>, <hari.gpillai@windriver.com>
Subject: [meta-openembedded][PATCH 1/1] net-snmp: upgrade 5.9.1 -> 5.9.3
Date: Mon, 3 Oct 2022 14:27:16 +0800
Message-ID: <20221003062716.3759210-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nwnJDsHnoTFrHDN1MJuxi_gBZ-o7rK0U
X-Proofpoint-ORIG-GUID: nwnJDsHnoTFrHDN1MJuxi_gBZ-o7rK0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_01,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Oct 2022 06:27:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99037

Issue: LIN1022-1131, LIN1022-1132, LIN1022-1133, LIN1022-1134, LIN1022-1135
Issue: LIN1022-1136

Upgrade summary:
----------------
- drop 0002-configure-fix-a-cc-check-issue.patch, as it was replaced with
  upstream commit https://github.com/net-snmp/net-snmp/commit/dbb49acfa2af
- drop 0001-snmpd-always-exit-after-displaying-usage.patch backport
- rebase net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch manually
- refresh patches with devtool to get rid of fuzz

Changelog:
----------
*5.9.3*:
security:
  - These two CVEs can be exploited by a user with read-only credentials:
      - CVE-2022-24805 A buffer overflow in the handling of the INDEX of
        NET-SNMP-VACM-MIB can cause an out-of-bounds memory access.
      - CVE-2022-24809 A malformed OID in a GET-NEXT to the nsVacmAccessTable
        can cause a NULL pointer dereference.
  - These CVEs can be exploited by a user with read-write credentials:
      - CVE-2022-24806 Improper Input Validation when SETing malformed
        OIDs in master agent and subagent simultaneously
      - CVE-2022-24807 A malformed OID in a SET request to
        SNMP-VIEW-BASED-ACM-MIB::vacmAccessTable can cause an
        out-of-bounds memory access.
      - CVE-2022-24808 A malformed OID in a SET request to
        NET-SNMP-AGENT-MIB::nsLogTable can cause a NULL pointer dereference
      - CVE-2022-24810 A malformed OID in a SET to the nsVacmAccessTable
        can cause a NULL pointer dereference.
  - To avoid these flaws, use strong SNMPv3 credentials and do not share them.
    If you must use SNMPv1 or SNMPv2c, use a complex community string
    and enhance the protection by restricting access to a given IP address
    range.
  - Thanks are due to Yu Zhang of VARAS@IIE and Nanyu Zhong of VARAS@IIE for
    reporting the following CVEs that have been fixed in this release, and
    to Arista Networks for providing fixes.

Windows:
  - WinExtDLL: Fix multiple compiler warnings
  - WinExtDLL: Make long strings occupy a single line Make it easier to
    look up error messages in the source code by making long strings
    occupy a single source code line.
  - WinExtDLL: Restore MIB-II support Make winExtDLL work on 64-bit
    Windows systems") caused snmpd to skip MIB-II on 64-bit systems.

IF-MIB: Update ifTable entries even if the interface name has changed
    At least on Linux a network interface index may be reused for a
    network interface with a different name. Hence this patch that
    enables replacing network interface information even if the network
    interface name has changed.

unspecified:
  - Moved transport code into a separate subdirectory in snmplib
  - Snmplib: remove inline versions of container funcs".

misc:
  - snmp-create-v3-user: Fix the snmpd.conf path   @datadir@ is
    expanded in ${datarootdir} so datarootdir must be set before
    @datadir@ is used.

*5.9.2*:
skipped due to a last minute library versioning found bug -- use 5.9.3 instead

(master rev: bf4a826c7de51dcdac87f81fa2bd2301629d50db) -- backport

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...ath.m4-keep-consistent-between-32bit.patch |  8 ++-
 .../0001-config_os_headers-Error-Fix.patch    |  4 +-
 ...1-get_pid_from_inode-Include-limit.h.patch |  6 +-
 ...d-always-exit-after-displaying-usage.patch | 55 -------------------
 ....c-Don-t-check-for-return-from-EVP_M.patch |  4 +-
 .../0002-configure-fix-a-cc-check-issue.patch | 28 ----------
 ...004-configure-fix-incorrect-variable.patch |  6 +-
 .../net-snmp/fix-libtool-finish.patch         |  6 +-
 ....7.2-fix-engineBoots-value-on-SIGHUP.patch | 22 ++++----
 ...add-knob-whether-nlist.h-are-checked.patch |  4 +-
 .../net-snmp-fix-for-disable-des.patch        |  4 +-
 ...ting-add-the-output-format-for-ptest.patch |  2 +-
 .../reproducibility-have-printcap.patch       |  4 +-
 .../{net-snmp_5.9.1.bb => net-snmp_5.9.3.bb}  |  4 +-
 14 files changed, 37 insertions(+), 120 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.1.bb => net-snmp_5.9.3.bb} (98%)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
index 4cd729044..ed2ebc6d7 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
@@ -1,7 +1,8 @@
-From 6f8ea2e841ad45eed193310b599d3f3b410ae91d Mon Sep 17 00:00:00 2001
+From 98c62e24fdd05d7e8bd8149840bad8eb0feb3fb1 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 29 Jan 2021 08:49:15 +0000
-Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit and 64bit
+Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit and 
+ 64bit
 
 With configure option "--with-openssl=${STAGING_EXECPREFIXDIR}", it behaves
 differently between 32bit and 64bit system as the openssl lib resides under
@@ -15,12 +16,13 @@ So add the patch to fix the gap between 32bit and 64bit system.
 Upstream-Status: Inappropriate [configuration specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
  m4/ac_add_search_path.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/m4/ac_add_search_path.m4 b/m4/ac_add_search_path.m4
-index 8e0a819..961f587 100644
+index 8e0a819..e9585bc 100644
 --- a/m4/ac_add_search_path.m4
 +++ b/m4/ac_add_search_path.m4
 @@ -3,8 +3,8 @@ dnl Add a search path to the LIBS and CPPFLAGS variables
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
index 05a47f61c..f8a52a63f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
@@ -1,4 +1,4 @@
-From 69d4c517c07f55c505090e48d96ace8cd599fb26 Mon Sep 17 00:00:00 2001
+From e86d5fd52f19b85da0b7cce660c6e65ec4c0f9bb Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 21 Aug 2015 18:23:13 +0900
 Subject: [PATCH] config_os_headers: Error Fix
@@ -19,7 +19,7 @@ Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
-index f07d512..2363b42 100644
+index 01c3376..6edd85f 100644
 --- a/configure.d/config_os_headers
 +++ b/configure.d/config_os_headers
 @@ -395,8 +395,8 @@ then
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
index 22e591556..a7881a871 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
@@ -1,4 +1,4 @@
-From 2bf1bbe1d428ed06d57aa76b03e394b72ff2216d Mon Sep 17 00:00:00 2001
+From 8097734b27fd146f358a4edd0d1a0d28309bd9a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 22 Jul 2016 18:34:39 +0000
 Subject: [PATCH] get_pid_from_inode: Include limit.h
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/agent/mibgroup/util_funcs/get_pid_from_inode.c b/agent/mibgroup/util_funcs/get_pid_from_inode.c
-index aee907d..7abaec2 100644
+index 5788e1d..ea380a6 100644
 --- a/agent/mibgroup/util_funcs/get_pid_from_inode.c
 +++ b/agent/mibgroup/util_funcs/get_pid_from_inode.c
 @@ -6,6 +6,7 @@
@@ -23,5 +23,5 @@ index aee907d..7abaec2 100644
  #include <ctype.h>
 +#include <limits.h>
  #include <stdio.h>
- #if HAVE_STDLIB_H
+ #ifdef HAVE_STDLIB_H
  #include <stdlib.h>
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch
deleted file mode 100644
index 4fc9e54b4..000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmpd-always-exit-after-displaying-usage.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 94ca941e06bef157bf0e13251f8ca1471daa9393 Mon Sep 17 00:00:00 2001
-From: Kaarle Ritvanen <kaarle.ritvanen@datakunkku.fi>
-Date: Fri, 27 Aug 2021 14:21:45 +0300
-Subject: [PATCH] snmpd: always exit after displaying usage
-
-Currently, viewing the help text with -h results in snmpd being started
-in the background, whereas this does not happen with --help. Similarly,
-when an error is detected in command line syntax, the help text is
-displayed but sometimes snmpd gets started anyway, depending on the
-execution path.
-
-This patch makes snmpd consistently terminate whenever the usage
-function gets called. It also removes the goto statements no longer
-needed.
-
-Upstream-Status: Backport
-[https://github.com/net-snmp/net-snmp/commit/94ca941e06bef157bf0e13251f8ca1471daa9393]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- agent/snmpd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/agent/snmpd.c b/agent/snmpd.c
-index f5aab0af8..90de12d99 100644
---- a/agent/snmpd.c
-+++ b/agent/snmpd.c
-@@ -289,6 +289,8 @@ usage(char *prog)
-            "  -S d|i|0-7\t\tuse -Ls <facility> instead\n"
-            "\n"
-            );
-+    SOCK_CLEANUP;
-+    exit(1);
- }
- 
- static void
-@@ -494,7 +496,6 @@ main(int argc, char *argv[])
-         case '-':
-             if (strcasecmp(optarg, "help") == 0) {
-                 usage(argv[0]);
--                goto out;
-             }
-             if (strcasecmp(optarg, "version") == 0) {
-                 version();
-@@ -783,7 +784,6 @@ main(int argc, char *argv[])
-             fprintf(stderr, "%s: Illegal argument -X:"
- 		            "AgentX support not compiled in.\n", argv[0]);
-             usage(argv[0]);
--            goto out;
- #endif
-             break;
- 
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
index 42352a6b0..af6334f72 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch
@@ -1,4 +1,4 @@
-From f3ff99736b8cccbba77349b0d10a3cee366a4c87 Mon Sep 17 00:00:00 2001
+From f4e1acd4f509dd26cf88da872bd5adcf884f4a5f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 18 Sep 2015 00:28:45 -0400
 Subject: [PATCH] snmplib/keytools.c: Don't check for return from
@@ -17,7 +17,7 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/snmplib/keytools.c b/snmplib/keytools.c
-index 129a7c0..2fc1efc 100644
+index 14a452a..fb1694b 100644
 --- a/snmplib/keytools.c
 +++ b/snmplib/keytools.c
 @@ -183,10 +183,7 @@ generate_Ku(const oid * hashtype, u_int hashtype_len,
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
deleted file mode 100644
index c973bde72..000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0a02ac779c51a2b4af3b58cb96967bf3eff80367 Mon Sep 17 00:00:00 2001
-From: Wenlin Kang <wenlin.kang@windriver.com>
-Date: Wed, 24 May 2017 16:45:34 +0800
-Subject: [PATCH] configure: fix a cc check issue.
-
-When has "." in cc value, the expression
-$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\w\s\/]+).;\s*/$1/);'
-can't get corretly the cc's value.
-
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
-
----
- configure.d/config_project_perl_python | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.d/config_project_perl_python b/configure.d/config_project_perl_python
-index 475c843..22d2ad3 100644
---- a/configure.d/config_project_perl_python
-+++ b/configure.d/config_project_perl_python
-@@ -87,7 +87,7 @@ if test "x$install_perl" != "xno" ; then
-     if test "x$enable_perl_cc_checks" != "xno" ; then
-         AC_MSG_CHECKING([for Perl cc])
-         changequote(, )
--        PERLCC=`$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\w\s\/]+).;\s*/$1/);'`
-+        PERLCC=`$myperl -V:cc | $myperl -n -e 'print if (s/^\s*cc=.([-=\.\w\s\/]+).;\s*/$1/);'`
-         changequote([, ])
-         if test "x$PERLCC" != "x" ; then
-             AC_MSG_RESULT([$PERLCC])
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
index bfddc63dd..6e224188a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
@@ -1,4 +1,4 @@
-From 011bdcd07f2a289d0cfc1b411c03c0cc7c42dad1 Mon Sep 17 00:00:00 2001
+From 6d655ba677563ac9d62d4d8eee59fdb39d486c02 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Wed, 24 May 2017 17:10:20 +0800
 Subject: [PATCH] configure: fix incorrect variable
@@ -14,10 +14,10 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 912f6b2..a53d1b2 100644
+index f1cbbf5..1545be3 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -174,7 +174,7 @@ OTHERCLEANTODOS=perlclean @PYTHONCLEANTARGS@ cleanfeatures perlcleanfeatures pyt
+@@ -173,7 +173,7 @@ OTHERCLEANTODOS=perlclean @PYTHONCLEANTARGS@ cleanfeatures perlcleanfeatures pyt
  #
  # override LD_RUN_PATH to avoid dependencies on the build directory
  perlmodules: perlmakefiles subdirs
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
index 26dd014ce..409c1e03c 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
@@ -1,4 +1,4 @@
-From 27444fbf8323679ea0551a3bd5f04c365143d8c0 Mon Sep 17 00:00:00 2001
+From ab1d77c52e84746e75506a2870783806bc77f396 Mon Sep 17 00:00:00 2001
 From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Fri, 16 Jan 2015 14:14:01 +0800
 Subject: [PATCH] net-snmp: fix "libtool --finish"
@@ -20,11 +20,11 @@ Signed-off-by: Roy.Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.top b/Makefile.top
-index 6315401..fc0ee06 100644
+index a962c54..1ba5607 100644
 --- a/Makefile.top
 +++ b/Makefile.top
 @@ -89,7 +89,7 @@ LIBREVISION = 0
- LIB_LD_CMD      = $(LIBTOOL) --mode=link $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) -o
+ LIB_LD_CMD      = $(LIBTOOL) --mode=link $(LINKCC) $(CFLAGS) -rpath $(libdir) -version-info $(LIBCURRENT):$(LIBREVISION):$(LIBAGE) @LD_NO_UNDEFINED@ -o
  LIB_EXTENSION   = la
  LIB_VERSION     =
 -LIB_LDCONFIG_CMD = $(LIBTOOL) --mode=finish $(INSTALL_PREFIX)$(libdir)
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
index 022eb958f..87f192e5b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch
@@ -1,4 +1,4 @@
-From 1e3178835217ba89aa355e2b6b88e490f17be16d Mon Sep 17 00:00:00 2001
+From 5ad4eab43c1ea63ff343bba64d576440e8783e75 Mon Sep 17 00:00:00 2001
 From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
 Date: Wed, 9 Jun 2021 15:47:30 +0900
 Subject: [PATCH] net snmp: fix engineBoots value on SIGHUP
@@ -7,6 +7,7 @@ Upstream-Status: Pending
 
 Signed-off-by: Marian Florea <marian.florea@windriver.com>
 Signed-off-by: Li Zhou <li.zhou@windriver.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
 
 ---
  agent/snmpd.c    | 1 +
@@ -14,19 +15,18 @@ Signed-off-by: Li Zhou <li.zhou@windriver.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/agent/snmpd.c b/agent/snmpd.c
-index 1af439f..355b510 100644
+index 90de12d..1ccc4db 100644
 --- a/agent/snmpd.c
 +++ b/agent/snmpd.c
-@@ -1208,6 +1208,7 @@ receive(void)
- 	    snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
- 		     netsnmp_get_version());
-             update_config();
-+	    snmp_store(app_name);
-             send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
- #if HAVE_SIGPROCMASK
-             ret = sigprocmask(SIG_UNBLOCK, &set, NULL);
+     snmp_log(LOG_INFO, "NET-SNMP version %s restarted\n",
+              netsnmp_get_version());
+     update_config();
++    snmp_store(app_name);
+     send_easy_trap(SNMP_TRAP_ENTERPRISESPECIFIC, 3);
+ #ifdef HAVE_SIGPROCMASK
+     ret = sigprocmask(SIG_UNBLOCK, &set, NULL);
 diff --git a/snmplib/snmpv3.c b/snmplib/snmpv3.c
-index 29c2a0f..ada961c 100644
+index 7b1746b..4a17e0d 100644
 --- a/snmplib/snmpv3.c
 +++ b/snmplib/snmpv3.c
 @@ -1059,9 +1059,9 @@ init_snmpv3_post_config(int majorid, int minorid, void *serverarg,
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
index f1ebe2bb6..c5a453abe 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
@@ -1,4 +1,4 @@
-From e507dcf8b29c55011f85d88bf05400d4717e4074 Mon Sep 17 00:00:00 2001
+From ad65b106d3cb3c6e595381be1c45a73c1ef6eb5e Mon Sep 17 00:00:00 2001
 From: Chong Lu <Chong.Lu@windriver.com>
 Date: Thu, 28 May 2020 09:46:34 -0500
 Subject: [PATCH] net-snmp: add knob whether nlist.h are checked
@@ -15,7 +15,7 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
-index 76ef58a..f07d512 100644
+index b9c8c31..01c3376 100644
 --- a/configure.d/config_os_headers
 +++ b/configure.d/config_os_headers
 @@ -37,6 +37,7 @@ AC_CHECK_HEADERS([getopt.h   pthread.h  regex.h      ] dnl
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
index 2941a3609..c382c02d8 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-fix-for-disable-des.patch
@@ -1,4 +1,4 @@
-From 3ca4335ec1d6b7b384c134fc85d7a9e513c68376 Mon Sep 17 00:00:00 2001
+From b1b9980853b1083f0c8b9f628f8b4c3a484d4f91 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 22 Jun 2017 10:25:08 +0800
 Subject: [PATCH] net-snmp: fix for --disable-des
@@ -15,7 +15,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/snmplib/scapi.c b/snmplib/scapi.c
-index 00c9174..c6875e1 100644
+index 54fdd5c..0f7e931 100644
 --- a/snmplib/scapi.c
 +++ b/snmplib/scapi.c
 @@ -85,7 +85,9 @@ netsnmp_feature_child_of(usm_scapi, usm_support);
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
index 807983f61..09ca532a7 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
@@ -1,4 +1,4 @@
-From 972df16e9599dffddf5d714a4cbf43008c771122 Mon Sep 17 00:00:00 2001
+From 36a5656db7ea75dd15f35a6c1728937c6e2b901c Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Wed, 14 Jan 2015 15:10:06 +0800
 Subject: [PATCH] testing: add the output format for ptest
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
index bf1e7bedf..c0b51c51e 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch
@@ -1,4 +1,4 @@
-From 84e362fe97f50fbad69f083bc2d8fe18f83eb2f7 Mon Sep 17 00:00:00 2001
+From b923cd38e2503b86aedf66b767fd7f51c9f25645 Mon Sep 17 00:00:00 2001
 From: "douglas.royds" <douglas.royds@taitradio.com>
 Date: Wed, 21 Nov 2018 13:52:18 +1300
 Subject: [PATCH] net-snmp: Reproducibility: Don't check build host for
@@ -13,7 +13,7 @@ set in the environment to "yes" or "no" as appropriate for the target platform.
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.d/config_os_misc4 b/configure.d/config_os_misc4
-index 6f23c8e..8cea75a 100644
+index b6864d9..07ca922 100644
 --- a/configure.d/config_os_misc4
 +++ b/configure.d/config_os_misc4
 @@ -99,9 +99,9 @@ if test x$LPSTAT_PATH != x; then
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
similarity index 98%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index 30c0ce74c..7af514756 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -21,15 +21,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://0001-config_os_headers-Error-Fix.patch \
            file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
            file://0001-get_pid_from_inode-Include-limit.h.patch \
-           file://0002-configure-fix-a-cc-check-issue.patch \
            file://0004-configure-fix-incorrect-variable.patch \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            file://net-snmp-fix-for-disable-des.patch \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
-           file://0001-snmpd-always-exit-after-displaying-usage.patch \
            "
-SRC_URI[sha256sum] = "eb7fd4a44de6cddbffd9a92a85ad1309e5c1054fb9d5a7dd93079c8953f48c3f"
+SRC_URI[sha256sum] = "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/net-snmp/files/net-snmp/"
 UPSTREAM_CHECK_REGEX = "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
-- 
2.25.1


