Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD05C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 07:10:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7676.1747379440208277116
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 00:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7231a64a59=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4I2Im031783
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 00:10:39 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46netchc01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 00:10:39 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 16 May 2025 00:10:30 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] syslog-ng: fix CVE-2024-47619
Date: Fri, 16 May 2025 12:40:06 +0530
Message-ID: <20250516071006.3588844-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: YzyVzv9xvhNcEb5OMk6qzEwDSeWvBf0j
X-Proofpoint-ORIG-GUID: YzyVzv9xvhNcEb5OMk6qzEwDSeWvBf0j
X-Authority-Analysis: v=2.4 cv=U7WSDfru c=1 sm=1 tr=0 ts=6826e4ef cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=yg3RUMOijsske3u0IL8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA2NiBTYWx0ZWRfX/QnRiHTdCe9f Z0DDKwBHB6xXG3xvknIzZINHarin+9CVqvsh3ShR3zBFokFiyNiYQ3vSl3KHSiOmcC6+wTMaUYe CVWjlkkMRnWm5YB5/rs8GTh1xX5ZpD6mV1Qv6InVg/XNesFBrBsOg5tutABc5RAnk5vWSnKQ0/L
 td8SbcA40nXtCbQ7vs/MfJVx99HZn1ns+baOaGP0MfwlxyKL43fwmjoVLlHaxlOuV5ZTjqEgfBz 3GWJZBLLO6I8wvbZCKpdDfQn6RvChajhqpiIeDftXhI3qQ2tS8glFDk53oysLmnTx7IuOXzRSui iTO620gYmSwwFAxoVh8sWDSHzh5/4b7H0RHY9SwSJ9zl+IFjny3BDGN6TcgpCajvzh87S440OsE
 g0ErrkpkXEMs8l+lGfhUHBA84nwKWka4eAvI1smbgr3SF1kvRovxMwG9EN74HJQyuL983GUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_03,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160066
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54G4I2Im031783
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 07:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117425

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
https://github.com/syslog-ng/syslog-ng/commit/12a0624e4c275f14cee9a6b4f36=
e714d2ced8544

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../syslog-ng/files/CVE-2024-47619.patch      | 292 ++++++++++++++++++
 .../syslog-ng/syslog-ng_4.6.0.bb              |   1 +
 2 files changed, 293 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2024-4761=
9.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch=
 b/meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch
new file mode 100644
index 0000000000..725f471b3b
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch
@@ -0,0 +1,292 @@
+From 12a0624e4c275f14cee9a6b4f36e714d2ced8544 Mon Sep 17 00:00:00 2001
+From: therandomstring <bal.horv.98@gmail.com>
+Date: Wed, 07 May 2025 09:30:36 +0530
+Subject: [PATCH] Merge commit from fork
+
+Fix transport accepting incorrect wildcards
+
+CVE: CVE-2024-47619
+Upstream-Status: Backport [https://github.com/syslog-ng/syslog-ng/commit=
/12a0624e4c275f14cee9a6b4f36e714d2ced8544]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/transport/tests/CMakeLists.txt            |   1 +
+ lib/transport/tests/Makefile.am               |   9 +-
+ lib/transport/tests/test_tls_wildcard_match.c | 104 ++++++++++++++++++
+ lib/transport/tls-verifier.c                  |  86 +++++++++++++--
+ lib/transport/tls-verifier.h                  |   2 +
+ 5 files changed, 190 insertions(+), 12 deletions(-)
+ create mode 100644 lib/transport/tests/test_tls_wildcard_match.c
+
+diff --git a/lib/transport/tests/CMakeLists.txt b/lib/transport/tests/CM=
akeLists.txt
+index 834f456..ce1d033 100644
+--- a/lib/transport/tests/CMakeLists.txt
++++ b/lib/transport/tests/CMakeLists.txt
+@@ -3,3 +3,4 @@ add_unit_test(CRITERION TARGET test_transport_factory_id=
)
+ add_unit_test(CRITERION TARGET test_transport_factory)
+ add_unit_test(CRITERION TARGET test_transport_factory_registry)
+ add_unit_test(CRITERION TARGET test_multitransport)
++add_unit_test(CRITERION TARGET test_tls_wildcard_match)
+diff --git a/lib/transport/tests/Makefile.am b/lib/transport/tests/Makef=
ile.am
+index 7eac994..ae2426c 100644
+--- a/lib/transport/tests/Makefile.am
++++ b/lib/transport/tests/Makefile.am
+@@ -3,7 +3,8 @@ lib_transport_tests_TESTS		 =3D \
+	lib/transport/tests/test_transport_factory_id \
+	lib/transport/tests/test_transport_factory \
+	lib/transport/tests/test_transport_factory_registry \
+-	lib/transport/tests/test_multitransport
++	lib/transport/tests/test_multitransport \
++	lib/transport/tests/test_tls_wildcard_match
+
+ EXTRA_DIST +=3D lib/transport/tests/CMakeLists.txt
+
+@@ -38,3 +39,9 @@ lib_transport_tests_test_multitransport_CFLAGS  =3D $(=
TEST_CFLAGS) \
+ lib_transport_tests_test_multitransport_LDADD	 =3D $(TEST_LDADD)
+ lib_transport_tests_test_multitransport_SOURCES =3D 			\
+	lib/transport/tests/test_multitransport.c
++
++lib_transport_tests_test_tls_wildcard_match_CFLAGS  =3D $(TEST_CFLAGS) =
\
++	-I${top_srcdir}/lib/transport/tests
++lib_transport_tests_test_tls_wildcard_match_LDADD	 =3D $(TEST_LDADD)
++lib_transport_tests_test_tls_wildcard_match_SOURCES =3D 			\
++	lib/transport/tests/test_tls_wildcard_match.c
+diff --git a/lib/transport/tests/test_tls_wildcard_match.c b/lib/transpo=
rt/tests/test_tls_wildcard_match.c
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
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-130=
1  USA
++ *
++ * As an additional exemption you are allowed to compile & link against=
 the
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
++TestSuite(tls_wildcard, .init =3D NULL, .fini =3D NULL);
++
++Test(tls_wildcard, test_wildcard_match_pattern_acceptance)
++{
++  cr_assert_eq(tls_wildcard_match("test", "test"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test", "*"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test", "t*t"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test", "t*"), TRUE);
++  cr_assert_eq(tls_wildcard_match("", ""), TRUE);
++  cr_assert_eq(tls_wildcard_match("test.one", "test.one"), TRUE);
++  cr_assert_eq(tls_wildcard_match("test.one.two", "test.one.two"), TRUE=
);
++  cr_assert_eq(tls_wildcard_match("192.0.2.0", "192.0.2.0"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:1=
30B", "2001:0000:130F:0000:0000:09C0:876A:130B"),
++               TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:1=
30B", "2001:0:130F:0:0:9C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0:130F:0:0:9C0:876A:130B", "200=
1:0000:130F:0000:0000:09C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F::09C0:876A:130B", "20=
01:0000:130F:0000:0000:09C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:1=
30B", "2001:0000:130F::09C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:1=
30B", "2001:0:130F::9C0:876A:130B"), TRUE);
++  cr_assert_eq(tls_wildcard_match("2001:0:130F::9C0:876A:130B", "2001:0=
000:130F:0000:0000:09C0:876A:130B"), TRUE);
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
++  cr_assert_eq(tls_wildcard_match("test.one.two", "test.one.*"), FALSE)=
;
++}
++
++Test(tls_wildcard, test_wildcard_match_complex_rejection)
++{
++  cr_assert_eq(tls_wildcard_match("test.two", "test.???"), FALSE);
++  cr_assert_eq(tls_wildcard_match("test.one.two", "test.one.?wo"), FALS=
E);
++}
++
++Test(tls_wildcard, test_ip_wildcard_rejection)
++{
++  cr_assert_eq(tls_wildcard_match("192.0.2.0", "*.0.2.0"), FALSE);
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:1=
30B", "*:0000:130F:0000:0000:09C0:876A:130B"),
++               FALSE);
++  cr_assert_eq(tls_wildcard_match("2001:0:130F::9C0:876A:130B", "*:0000=
:130F:0000:0000:09C0:876A:130B"), FALSE);
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
++  cr_assert_eq(tls_wildcard_match("2001:0000:130F:0000:0000:09C0:876A:1=
30B", "2001:0000:130f:0000:0000:09c0:876a:130b"),
++               TRUE);
++}
+diff --git a/lib/transport/tls-verifier.c b/lib/transport/tls-verifier.c
+index 606ad02..dde00d9 100644
+--- a/lib/transport/tls-verifier.c
++++ b/lib/transport/tls-verifier.c
+@@ -1,4 +1,6 @@
+ /*
++ * Copyright (c) 2024 One Identity LLC.
++ * Copyright (c) 2024 Franco Fichtner
+  * Copyright (c) 2002-2011 Balabit
+  * Copyright (c) 1998-2011 Bal=C3=A1zs Scheidler
+  *
+@@ -75,7 +77,7 @@ tls_verifier_unref(TLSVerifier *self)
+
+ /* helper functions */
+
+-static gboolean
++gboolean
+ tls_wildcard_match(const gchar *host_name, const gchar *pattern)
+ {
+   gchar **pattern_parts, **hostname_parts;
+@@ -86,22 +88,84 @@ tls_wildcard_match(const gchar *host_name, const gch=
ar *pattern)
+
+   pattern_parts =3D g_strsplit(pattern, ".", 0);
+   hostname_parts =3D g_strsplit(host_name, ".", 0);
+-  for (i =3D 0; pattern_parts[i]; i++)
++
++  if(g_strrstr(pattern, "\?"))
++    {
++      /* Glib would treat any question marks as jokers */
++      success =3D FALSE;
++    }
++  else if (g_hostname_is_ip_address(host_name))
++    {
++      /* no wildcards in IP */
++      if (g_strrstr(pattern, "*"))
++        {
++          success =3D FALSE;
++        }
++      else
++        {
++          struct in6_addr host_buffer, pattern_buffer;
++          gint INET_TYPE, INET_ADDRLEN;
++          if(strstr(host_name, ":"))
++            {
++              INET_TYPE =3D AF_INET6;
++              INET_ADDRLEN =3D INET6_ADDRSTRLEN;
++            }
++          else
++            {
++              INET_TYPE =3D AF_INET;
++              INET_ADDRLEN =3D INET_ADDRSTRLEN;
++            }
++          char host_ip[INET_ADDRLEN], pattern_ip[INET_ADDRLEN];
++          gint host_ip_ok =3D inet_pton(INET_TYPE, host_name, &host_buf=
fer);
++          gint pattern_ip_ok =3D inet_pton(INET_TYPE, pattern, &pattern=
_buffer);
++          inet_ntop(INET_TYPE, &host_buffer, host_ip, INET_ADDRLEN);
++          inet_ntop(INET_TYPE, &pattern_buffer, pattern_ip, INET_ADDRLE=
N);
++          success =3D (host_ip_ok && pattern_ip_ok && strcmp(host_ip, p=
attern_ip) =3D=3D 0);
++        }
++    }
++  else
+     {
+-      if (!hostname_parts[i])
++      if (pattern_parts[0] =3D=3D NULL)
+         {
+-          /* number of dot separated entries is not the same in the hos=
tname and the pattern spec */
+-          goto exit;
++          if (hostname_parts[0] =3D=3D NULL)
++            success =3D TRUE;
++          else
++            success =3D FALSE;
+         }
++      else
++        {
++          success =3D TRUE;
++          for (i =3D 0; pattern_parts[i]; i++)
++            {
++              if (hostname_parts[i] =3D=3D NULL)
++                {
++                  /* number of dot separated entries is not the same in=
 the hostname and the pattern spec */
++                  success =3D FALSE;
++                  break;
++                }
++              char *wildcard_matched =3D g_strrstr(pattern_parts[i], "*=
");
++              if (wildcard_matched && (i !=3D 0 || wildcard_matched !=3D=
 strstr(pattern_parts[i], "*")))
++                {
++                  /* wildcard only on leftmost part and never as multip=
le wildcards as per both RFC 6125 and 9525 */
++                  success =3D FALSE;
++                  break;
++                }
+
+-      lower_pattern =3D g_ascii_strdown(pattern_parts[i], -1);
+-      lower_hostname =3D g_ascii_strdown(hostname_parts[i], -1);
++              lower_pattern =3D g_ascii_strdown(pattern_parts[i], -1);
++              lower_hostname =3D g_ascii_strdown(hostname_parts[i], -1)=
;
+
+-      if (!g_pattern_match_simple(lower_pattern, lower_hostname))
+-        goto exit;
++              if (!g_pattern_match_simple(lower_pattern, lower_hostname=
))
++                {
++                  success =3D FALSE;
++                  break;
++                }
++            }
++          if (hostname_parts[i])
++            /* hostname has more parts than the pattern */
++            success =3D FALSE;
++        }
+     }
+-  success =3D TRUE;
+-exit:
++
+   g_free(lower_pattern);
+   g_free(lower_hostname);
+   g_strfreev(pattern_parts);
+diff --git a/lib/transport/tls-verifier.h b/lib/transport/tls-verifier.h
+index 5642afa..98ab858 100644
+--- a/lib/transport/tls-verifier.h
++++ b/lib/transport/tls-verifier.h
+@@ -44,5 +44,7 @@ void tls_verifier_unref(TLSVerifier *self);
+
+ gboolean tls_verify_certificate_name(X509 *cert, const gchar *hostname)=
;
+
++gboolean tls_wildcard_match(const gchar *host_name, const gchar *patter=
n);
++
+
+ #endif
+--
+2.40.0
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb b/meta-=
oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
index 4584944150..e2ae40fd61 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "https://github.com/balabit/syslog-ng/relea=
ses/download/${BP}/${BP}.ta
            file://syslog-ng.service-the-syslog-ng-service.patch \
            file://0001-Fix-buildpaths-warning.patch \
            file://0001-macros-guard-ipv6-code-with-SYSLOG_NG_ENABLE_IPV6=
.patch \
+           file://CVE-2024-47619.patch \
 "
 SRC_URI:append:powerpc64le =3D " file://0001-plugin.c-workaround-powerpc=
64le-segfaults-error.patch"
=20
--=20
2.40.0


