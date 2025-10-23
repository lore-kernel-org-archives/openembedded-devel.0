Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A00BCCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 06:27:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14031.1761200835826923591
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 23:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dElW0f/m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2391681b4c=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N5Zpwf483787
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 06:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4dbgl0h929xpEr/BRESU
	n4N1DrW5lQtVOysLm15+DHc=; b=dElW0f/mB9WkfNdCG0ZHEKaVJraN1Ruzc9Wt
	aDxp0wPSBnsW3NNqDPSSVT9UdFrcRMrCDalY+wSFDgt+eEof4nq0YU7ZUp/d+3JH
	DpIr0WkdPg2qnhYbDNM8+4h+pOuku1AiwAnexSFiCgujWP96FMP9jqb2M++7fNRi
	Hxi5n+Yl7gNkwu3qReoKlHP9+7590vESaKEMzRjOMpMboIXvXFZUfYv6uqoexe9w
	XF54orP9NgwP9T6HVDJ11TY+Mp/syIFGGpqZuVwVj+PhevIpCOIOwfXaIVO5yy3B
	4Z1aCriGFnOLKxBdXGOOBeZmV8voEapE8GEzxV5cOu8pgBUR5Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8atg9j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 06:27:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 22 Oct 2025 23:27:13 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 22 Oct 2025 23:27:12 -0700
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] python3-ldap: fix CVE-2025-61911 & CVE-2025-61912
Date: Thu, 23 Oct 2025 11:57:10 +0530
Message-ID: <20251023062710.531057-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68f9cac2 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xPmPDWtTcued5kfypk0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDA1NCBTYWx0ZWRfX1L5c+ijd1bF6
 BGUOaLmL0XWa7vtoCrqgAFrTWeKiueqMyddxtSUJfx2zEexmyl/jDRA5GEnfeu2UBvmQLuRQvG9
 3HVM0c/OQSTRXn47RaetE37HvFXMIfRlBTbmhaKrD3UAtfAi7TYb3/rnoFb4QnStcS2ewcQuPnT
 sBDAMv9U71lidHZBszoQMEps+x3EPcOPSKtdH348dDGzAA75w95UtZBN3QTOQFWSqPjlgjsOYoL
 MVPPiJ2810akKWS4oz+nbyL3J/bFBUKwnnVJYT5bd466dtMJZ4x3SKu8tOVVeIsqRo7xt7TrOtK
 VvmJwYseRNdX/H+Y3fclfxaMssOtTwLplFl00xUwVoTvHKjNRFX3MF8QL5I9gTGHI0u+RXZ+H3s
 zm1495t9yqroGKUHii4TCOgS5gi4gg==
X-Proofpoint-ORIG-GUID: W4OCeHTGK2V9Lk4-6VeUz0bYLRd2z9RB
X-Proofpoint-GUID: W4OCeHTGK2V9Lk4-6VeUz0bYLRd2z9RB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 06:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120916

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-61911
https://nvd.nist.gov/vuln/detail/CVE-2025-61912

Upstream-patch:
https://github.com/python-ldap/python-ldap/commit/3957526fb1852e84b90f423d9fef34c7af25b85a
https://github.com/python-ldap/python-ldap/commit/6ea80326a34ee6093219628d7690bced50c49a3f

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../python/python3-ldap/CVE-2025-61911.patch  | 48 ++++++++++++++++++
 .../python/python3-ldap/CVE-2025-61912.patch  | 49 +++++++++++++++++++
 .../python/python3-ldap_3.4.0.bb              |  5 ++
 3 files changed, 102 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61911.patch
 create mode 100644 meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61912.patch

diff --git a/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61911.patch b/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61911.patch
new file mode 100644
index 0000000000..bc377b6049
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61911.patch
@@ -0,0 +1,48 @@
+From 3957526fb1852e84b90f423d9fef34c7af25b85a Mon Sep 17 00:00:00 2001
+From: lukas-eu <62448426+lukas-eu@users.noreply.github.com>
+Date: Fri, 10 Oct 2025 19:47:46 +0200
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2025-61911
+
+Upstream-Status: Backport
+https://github.com/python-ldap/python-ldap/commit/3957526fb1852e84b90f423d9fef34c7af25b85a
+
+Signed-off-by: Simon Pichugin <simon.pichugin@gmail.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ Lib/ldap/filter.py     | 2 ++
+ Tests/t_ldap_filter.py | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/Lib/ldap/filter.py b/Lib/ldap/filter.py
+index 782737a..5bd41b2 100644
+--- a/Lib/ldap/filter.py
++++ b/Lib/ldap/filter.py
+@@ -24,6 +24,8 @@ def escape_filter_chars(assertion_value,escape_mode=0):
+       If 1 all NON-ASCII chars are escaped.
+       If 2 all chars are escaped.
+   """
++  if not isinstance(assertion_value, str):
++    raise TypeError("assertion_value must be of type str.")
+   if escape_mode:
+     r = []
+     if escape_mode==1:
+diff --git a/Tests/t_ldap_filter.py b/Tests/t_ldap_filter.py
+index 313b373..5431205 100644
+--- a/Tests/t_ldap_filter.py
++++ b/Tests/t_ldap_filter.py
+@@ -49,6 +49,10 @@ class TestDN(unittest.TestCase):
+             ),
+             r'\c3\a4\c3\b6\c3\bc\c3\84\c3\96\c3\9c\c3\9f'
+         )
++        with self.assertRaises(TypeError):
++            escape_filter_chars(["abc@*()/xyz"], escape_mode=1)
++        with self.assertRaises(TypeError):
++            escape_filter_chars({"abc@*()/xyz": 1}, escape_mode=1)
+ 
+     def test_escape_filter_chars_mode2(self):
+         """
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61912.patch b/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61912.patch
new file mode 100644
index 0000000000..c88d4bdc7c
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61912.patch
@@ -0,0 +1,49 @@
+From 6ea80326a34ee6093219628d7690bced50c49a3f Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Fri, 10 Oct 2025 10:46:45 -0700
+Subject: [PATCH] Merge commit from fork
+
+Update tests to expect \00 and verify RFC-compliant escaping
+
+CVE: CVE-2025-61912
+
+Upstream-Status: Backport
+https://github.com/python-ldap/python-ldap/commit/6ea80326a34ee6093219628d7690bced50c49a3f
+
+Signed-off-by: Simon Pichugin <simon.pichugin@gmail.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ Lib/ldap/dn.py     | 3 ++-
+ Tests/t_ldap_dn.py | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/ldap/dn.py b/Lib/ldap/dn.py
+index a9d9684..8d40673 100644
+--- a/Lib/ldap/dn.py
++++ b/Lib/ldap/dn.py
+@@ -26,7 +26,8 @@ def escape_dn_chars(s):
+     s = s.replace('>' ,'\\>')
+     s = s.replace(';' ,'\\;')
+     s = s.replace('=' ,'\\=')
+-    s = s.replace('\000' ,'\\\000')
++    # RFC 4514 requires NULL (U+0000) to be escaped as hex pair "\00"
++    s = s.replace('\x00' ,'\\00')
+     if s[-1]==' ':
+       s = ''.join((s[:-1],'\\ '))
+     if s[0]=='#' or s[0]==' ':
+diff --git a/Tests/t_ldap_dn.py b/Tests/t_ldap_dn.py
+index 86d3640..7c04777 100644
+--- a/Tests/t_ldap_dn.py
++++ b/Tests/t_ldap_dn.py
+@@ -49,7 +49,7 @@ class TestDN(unittest.TestCase):
+         self.assertEqual(ldap.dn.escape_dn_chars(' '), '\\ ')
+         self.assertEqual(ldap.dn.escape_dn_chars('  '), '\\ \\ ')
+         self.assertEqual(ldap.dn.escape_dn_chars('foobar '), 'foobar\\ ')
+-        self.assertEqual(ldap.dn.escape_dn_chars('f+o>o,b<a;r="\00"'), 'f\\+o\\>o\\,b\\<a\\;r\\=\\"\\\x00\\"')
++        self.assertEqual(ldap.dn.escape_dn_chars('f+o>o,b<a;r="\00"'), r'f\+o\>o\,b\<a\;r\=\"\00\"')
+         self.assertEqual(ldap.dn.escape_dn_chars('foo\\,bar'), 'foo\\\\\\,bar')
+ 
+     def test_str2dn(self):
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
index 4299058315..d534c2f984 100644
--- a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
@@ -15,6 +15,11 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "60464c8fc25e71e0fd40449a24eae482dcd0fb7fcf823e7de627a6525b3e0d12"
 
+SRC_URI += " \
+	file://CVE-2025-61911.patch \
+	file://CVE-2025-61912.patch \
+"
+
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \
         -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:' \
-- 
2.35.5


