Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF0BC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 10:54:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12888.1748429686491566247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 May 2025 03:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8243786c29=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SA1pIE005877
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 03:54:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm3nfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 03:54:45 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 28 May 2025 03:54:42 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] syslog-ng: fix CVE-2024-47619
Date: Wed, 28 May 2025 16:24:17 +0530
Message-ID: <20250528105417.2675803-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=6836eb75 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=yg3RUMOijsske3u0IL8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NSBTYWx0ZWRfXxWbSoXFR/K7X p0bSKcY0sBKYUCphvQCsc+VoVdSdxP3yrOgz5g0/5bLiMRW9grnTgcy9Whr2uBkvbWmQHdokgTX veFQAJYTVjRaJYkhHxlD07XwtBnCR6+NknlcAAGPTumXGk6gHPNtD+FvHV43LqX1UaORIyf+iP7
 3+8wGzbUyOrkHz97eSRFRJR4ufIUKvVngBR9XgIdYA/yBhl0xwoP+W86PjRMAhvP9cc8z/X/C2u 0Gxr8ivtCCua60NPoHkocPZbYhRSNU0m7nRiucH4z7j819hUrwKWfSGYG13/5zRfg1tjQt8kZs4 DtYQ2va7gqv/1eYp/PFVSs1G7zC3A4PpkxBWRV3CX4t/JMZ4szs37FOPJgQL84JSG3d3Mzg2eHf
 GqMFC+ZVTPk0/BX0ZOrrXTtdEnU+DdQxU7QUsN0TTSnSZ1xlo/VNDxFl37qTgU0Yhd8DUT1g
X-Proofpoint-ORIG-GUID: I7-MoHyIIEBWiaUiucRwTpWCCajR5q_g
X-Proofpoint-GUID: I7-MoHyIIEBWiaUiucRwTpWCCajR5q_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 10:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117646

From: Yogita Urade <yogita.urade@windriver.com>

syslog-ng is an enhanced log daemo. Prior to version 4.8.2,
`tls_wildcard_match()` matches on certificates such as `foo.*.bar`
although that is not allowed. It is also possible to pass partial
wildcards such as `foo.a*c.bar` which glib matches but should be
avoided / invalidated. This issue could have an impact on TLS
connections, such as in man-in-the-middle situations. Version
4.8.2 contains a fix for the issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-47619

Upstream patch:
https://github.com/syslog-ng/syslog-ng/commit/12a0624e4c275f14cee9a6b4f36e714d2ced8544

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../syslog-ng/files/CVE-2024-47619.patch      | 286 ++++++++++++++++++
 .../syslog-ng/syslog-ng_3.36.1.bb             |   1 +
 2 files changed, 287 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch
new file mode 100644
index 0000000000..e316f4a784
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch
@@ -0,0 +1,286 @@
+From 12a0624e4c275f14cee9a6b4f36e714d2ced8544 Mon Sep 17 00:00:00 2001
+From: therandomstring <bal.horv.98@gmail.com>
+Date: Wed, 07 May 2025 08:51:01 +0000
+Subject: [PATCH] Merge commit from fork
+
+Fix transport accepting incorrect wildcards
+
+CVE: CVE-2024-47619
+Upstream-Status: Backport [https://github.com/syslog-ng/syslog-ng/commit/12a0624e4c275f14cee9a6b4f36e714d2ced8544]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/tlscontext.c                              |  84 ++++++++++++--
+ lib/tlscontext.h                              |   2 +
+ lib/transport/tests/CMakeLists.txt            |   1 +
+ lib/transport/tests/Makefile.am               |   9 +-
+ lib/transport/tests/test_tls_wildcard_match.c | 104 ++++++++++++++++++
+ 5 files changed, 188 insertions(+), 12 deletions(-)
+ create mode 100644 lib/transport/tests/test_tls_wildcard_match.c
+
+diff --git a/lib/tlscontext.c b/lib/tlscontext.c
+index a89d0e0..203a1a3 100644
+--- a/lib/tlscontext.c
++++ b/lib/tlscontext.c
+@@ -1200,7 +1200,7 @@ tls_log_certificate_validation_progress(int ok, X509_STORE_CTX *ctx)
+   g_string_free(issuer_name, TRUE);
+ }
+
+-static gboolean
++gboolean
+ tls_wildcard_match(const gchar *host_name, const gchar *pattern)
+ {
+   gchar **pattern_parts, **hostname_parts;
+@@ -1211,22 +1211,84 @@ tls_wildcard_match(const gchar *host_name, const gchar *pattern)
+
+   pattern_parts = g_strsplit(pattern, ".", 0);
+   hostname_parts = g_strsplit(host_name, ".", 0);
+-  for (i = 0; pattern_parts[i]; i++)
++
++  if(g_strrstr(pattern, "\?"))
++    {
++      /* Glib would treat any question marks as jokers */
++      success = FALSE;
++    }
++  else if (g_hostname_is_ip_address(host_name))
+     {
+-      if (!hostname_parts[i])
++      /* no wildcards in IP */
++      if (g_strrstr(pattern, "*"))
+         {
+-          /* number of dot separated entries is not the same in the hostname and the pattern spec */
+-          goto exit;
++          success = FALSE;
+         }
++      else
++        {
++          struct in6_addr host_buffer, pattern_buffer;
++          gint INET_TYPE, INET_ADDRLEN;
++          if(strstr(host_name, ":"))
++            {
++              INET_TYPE = AF_INET6;
++              INET_ADDRLEN = INET6_ADDRSTRLEN;
++            }
++          else
++            {
++              INET_TYPE = AF_INET;
++              INET_ADDRLEN = INET_ADDRSTRLEN;
++            }
++          char host_ip[INET_ADDRLEN], pattern_ip[INET_ADDRLEN];
++          gint host_ip_ok = inet_pton(INET_TYPE, host_name, &host_buffer);
++          gint pattern_ip_ok = inet_pton(INET_TYPE, pattern, &pattern_buffer);
++          inet_ntop(INET_TYPE, &host_buffer, host_ip, INET_ADDRLEN);
++          inet_ntop(INET_TYPE, &pattern_buffer, pattern_ip, INET_ADDRLEN);
++          success = (host_ip_ok && pattern_ip_ok && strcmp(host_ip, pattern_ip) == 0);
++        }
++    }
++  else
++    {
++      if (pattern_parts[0] == NULL)
++        {
++          if (hostname_parts[0] == NULL)
++            success = TRUE;
++          else
++            success = FALSE;
++        }
++      else
++        {
++          success = TRUE;
++          for (i = 0; pattern_parts[i]; i++)
++            {
++              if (hostname_parts[i] == NULL)
++                {
++                  /* number of dot separated entries is not the same in the hostname and the pattern spec */
++                  success = FALSE;
++                  break;
++                }
++              char *wildcard_matched = g_strrstr(pattern_parts[i], "*");
++              if (wildcard_matched && (i != 0 || wildcard_matched != strstr(pattern_parts[i], "*")))
++                {
++                  /* wildcard only on leftmost part and never as multiple wildcards as per both RFC 6125 and 9525 */
++                  success = FALSE;
++                  break;
++                }
+
+-      lower_pattern = g_ascii_strdown(pattern_parts[i], -1);
+-      lower_hostname = g_ascii_strdown(hostname_parts[i], -1);
++              lower_pattern = g_ascii_strdown(pattern_parts[i], -1);
++              lower_hostname = g_ascii_strdown(hostname_parts[i], -1);
+
+-      if (!g_pattern_match_simple(lower_pattern, lower_hostname))
+-        goto exit;
++              if (!g_pattern_match_simple(lower_pattern, lower_hostname))
++                {
++                  success = FALSE;
++                  break;
++                }
++            }
++          if (hostname_parts[i])
++            /* hostname has more parts than the pattern */
++            success = FALSE;
++        }
+     }
+-  success = TRUE;
+-exit:
++
+   g_free(lower_pattern);
+   g_free(lower_hostname);
+   g_strfreev(pattern_parts);
+diff --git a/lib/tlscontext.h b/lib/tlscontext.h
+index 98c0e1f..80b2afe 100644
+--- a/lib/tlscontext.h
++++ b/lib/tlscontext.h
+@@ -144,6 +144,8 @@ EVTTAG *tls_context_format_location_tag(TLSContext *self);
+ void tls_log_certificate_validation_progress(int ok, X509_STORE_CTX *ctx);
+ gboolean tls_verify_certificate_name(X509 *cert, const gchar *hostname);
+
++gboolean tls_wildcard_match(const gchar *host_name, const gchar *pattern);
++
+ void tls_x509_format_dn(X509_NAME *name, GString *dn);
+
+ #endif
+diff --git a/lib/transport/tests/CMakeLists.txt b/lib/transport/tests/CMakeLists.txt
+index 834f456..ce1d033 100644
+--- a/lib/transport/tests/CMakeLists.txt
++++ b/lib/transport/tests/CMakeLists.txt
+@@ -3,3 +3,4 @@ add_unit_test(CRITERION TARGET test_transport_factory_id)
+ add_unit_test(CRITERION TARGET test_transport_factory)
+ add_unit_test(CRITERION TARGET test_transport_factory_registry)
+ add_unit_test(CRITERION TARGET test_multitransport)
++add_unit_test(CRITERION TARGET test_tls_wildcard_match)
+diff --git a/lib/transport/tests/Makefile.am b/lib/transport/tests/Makefile.am
+index 7eac994..ae2426c 100644
+--- a/lib/transport/tests/Makefile.am
++++ b/lib/transport/tests/Makefile.am
+@@ -3,7 +3,8 @@ lib_transport_tests_TESTS		 = \
+	lib/transport/tests/test_transport_factory_id \
+	lib/transport/tests/test_transport_factory \
+	lib/transport/tests/test_transport_factory_registry \
+-	lib/transport/tests/test_multitransport
++	lib/transport/tests/test_multitransport \
++	lib/transport/tests/test_tls_wildcard_match
+
+ EXTRA_DIST += lib/transport/tests/CMakeLists.txt
+
+@@ -38,3 +39,9 @@ lib_transport_tests_test_multitransport_CFLAGS  = $(TEST_CFLAGS) \
+ lib_transport_tests_test_multitransport_LDADD	 = $(TEST_LDADD)
+ lib_transport_tests_test_multitransport_SOURCES = 			\
+	lib/transport/tests/test_multitransport.c
++
++lib_transport_tests_test_tls_wildcard_match_CFLAGS  = $(TEST_CFLAGS) \
++	-I${top_srcdir}/lib/transport/tests
++lib_transport_tests_test_tls_wildcard_match_LDADD	 = $(TEST_LDADD)
++lib_transport_tests_test_tls_wildcard_match_SOURCES = 			\
++	lib/transport/tests/test_tls_wildcard_match.c
+diff --git a/lib/transport/tests/test_tls_wildcard_match.c b/lib/transport/tests/test_tls_wildcard_match.c
+new file mode 100644
+index 0000000..90cecb0
+--- /dev/null
++++ b/lib/transport/tests/test_tls_wildcard_match.c
+@@ -0,0 +1,104 @@
++/*
++ * Copyright (c) 2024 One Identity LLC.
++ * Copyright (c) 2024 Franco Fichtner
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
++ *
++ * As an additional exemption you are allowed to compile & link against the
++ * OpenSSL libraries as published by the OpenSSL project. See the file
++ * COPYING for details.
++ *
++ */
++
++
++#include <criterion/criterion.h>
++
++#include "transport/tls-verifier.h"
++
++TestSuite(tls_wildcard, .init = NULL, .fini = NULL);
++
++Test(tls_wildcard, test_wildcard_match_pattern_acceptance)
++{
++  cr_assert_eq(tls_wildcard_match("test", "test"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test", "*"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test", "t*t"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test", "t*"), TRUE);
++  cr_assert_eq(tls_wildcard_match("", ""), TRUE);
++  cr_assert_eq(tls_wildcard_match("test.one", "test.one"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test.one.two", "test.one.two"), TRUE);
++  cr_assert_eq(tls_wildcard_match("192.0.2.0", "192.0.2.0"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:130B", "2001:0000:130F:0000:0000:09C0:876A:130B"),
++               TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:130B", "2001:0:130F:0:0:9C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0:130F:0:0:9C0:876A:130B", "2001:0000:130F:0000:0000:09C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F::09C0:876A:130B", "2001:0000:130F:0000:0000:09C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:130B", "2001:0000:130F::09C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:130B", "2001:0:130F::9C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0:130F::9C0:876A:130B", "2001:0000:130F:0000:0000:09C0:876A:130B"), TRUE);
++}
++
++Test(tls_wildcard, test_wildcard_match_wildcard_rejection)
++{
++  cr_assert_eq(tls_wildcard_match("test", "**"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test", "*es*"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test", "t*?"), FALSE);
++}
++
++Test(tls_wildcard, test_wildcard_match_pattern_rejection)
++{
++  cr_assert_eq(tls_wildcard_match("test", "tset"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test", "set"), FALSE);
++  cr_assert_eq(tls_wildcard_match("", "*"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test", ""), FALSE);
++  cr_assert_eq(tls_wildcard_match("test.two", "test.one"), FALSE);
++}
++
++Test(tls_wildcard, test_wildcard_match_format_rejection)
++{
++  cr_assert_eq(tls_wildcard_match("test.two", "test.*"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test.two", "test.t*o"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test", "test.two"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test.two", "test"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test.one.two", "test.one"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test.one", "test.one.two"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test.three", "three.test"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test.one.two", "test.one.*"), FALSE);
++}
++
++Test(tls_wildcard, test_wildcard_match_complex_rejection)
++{
++  cr_assert_eq(tls_wildcard_match("test.two", "test.???"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test.one.two", "test.one.?wo"), FALSE);
++}
++
++Test(tls_wildcard, test_ip_wildcard_rejection)
++{
++  cr_assert_eq(tls_wildcard_match("192.0.2.0", "*.0.2.0"), FALSE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:130B", "*:0000:130F:0000:0000:09C0:876A:130B"),
++               FALSE);
++  cr_assert_eq(tls_wildcard_match("2001:0:130F::9C0:876A:130B", "*:0000:130F:0000:0000:09C0:876A:130B"), FALSE);
++}
++
++Test(tls_wildcard, test_case_insensivity)
++{
++  cr_assert_eq(tls_wildcard_match("test", "TEST"), TRUE);
++  cr_assert_eq(tls_wildcard_match("TEST", "test"), TRUE);
++  cr_assert_eq(tls_wildcard_match("TeST", "TEst"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test.one", "test.ONE"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test.TWO", "test.two"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test.three", "*T.three"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:130B", "2001:0000:130f:0000:0000:09c0:876a:130b"),
++               TRUE);
++}
+--
+2.40.0
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
index 045b9b71c9..b45c6f553f 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            file://CVE-2022-38725-0006.patch \
            file://CVE-2022-38725-0007.patch \
            file://CVE-2022-38725-0008.patch \
+           file://CVE-2024-47619.patch \
 "
 
 SRC_URI[sha256sum] = "90a25c9767fe749db50f118ddfc92ec71399763d2ecd5ad4f11ff5eea049e60b"
-- 
2.40.0


