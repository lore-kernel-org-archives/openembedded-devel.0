Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C55AC87FDD
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 15:23:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17403.1685546624884527075
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 08:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=p5wQbsyJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5515a05663=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34VBnnxr027941
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 15:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=l14z1YjiI9qrbBmP2g7e7iJniNpkG8H41Oq8W0yNWlo=;
 b=p5wQbsyJ1lvWcu1TX//PmOradMGrnzYwodPA+ihlBKo0Cogd8qLvF2aYLSO0Sc1QB9rO
 r2tIgw/ww6INo5rKeLuf/k3gltYCJxwLf2SZLes5kzCuT3G32X9qbBXsawcbfsxHL2TP
 ntkoVYXb3hToB9CYRgzl2g6+10uqt3O+nNQnh6EB50sgCGvxWECa/QYiWmruvhl3bGfJ
 r9BKLjF/NamHLcyaUrLKK6IOp4K71fw4N3q4pXmMXoehaBqvUbulDVZsOW4fH1GKC/xH
 uqqJNTueirehCr7Ans3EGdUAWq5Mr9g37u4hPh7VvSqmzuvZ6xB+IsNjbMeZpwBvXxtI Iw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qwqgj0wvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 15:23:43 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 08:23:39 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-sqlparse: fix for CVE-2023-30608
Date: Wed, 31 May 2023 15:23:13 +0000
Message-ID: <20230531152313.906680-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: pAxlSHyDlplxxGmxL1jv3fzLhwBWgGBA
X-Proofpoint-ORIG-GUID: pAxlSHyDlplxxGmxL1jv3fzLhwBWgGBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_10,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305310131
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34VBnnxr027941
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 15:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103067

From: Narpat Mali <narpat.mali@windriver.com>

sqlparse is a non-validating SQL parser module for Python. In affected
versions the SQL parser contains a regular expression that is vulnerable
to ReDoS (Regular Expression Denial of Service). This issue was introduce=
d
by commit `e75e358`. The vulnerability may lead to Denial of Service (DoS=
).
This issues has been fixed in sqlparse 0.4.4 by commit `c457abd5f`. Users
are advised to upgrade. There are no known workarounds for this issue.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-sqlparse/CVE-2023-30608.patch     | 75 +++++++++++++++++++
 .../python/python3-sqlparse_0.4.2.bb          |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/=
CVE-2023-30608.patch

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-202=
3-30608.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-=
2023-30608.patch
new file mode 100644
index 0000000000..41dbf088e1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608=
.patch
@@ -0,0 +1,75 @@
+From fa1cc25e1967228e5d47b9ddb626cc82dba92d7e Mon Sep 17 00:00:00 2001
+From: Andi Albrecht <albrecht.andi@gmail.com>
+Date: Wed, 31 May 2023 12:29:07 +0000
+Subject: [PATCH] Remove unnecessary parts in regex for bad escaping.
+
+The regex tried to deal with situations where escaping in the
+SQL to be parsed was suspicious.
+
+CVE: CVE-2023-30608
+
+Upstream-Status: Backport [https://github.com/andialbrecht/sqlparse/comm=
it/c457abd5f097dd13fb21543381e7cfafe7d31cfb]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ CHANGELOG            | 15 +++++++++++++++
+ sqlparse/keywords.py |  4 ++--
+ tests/test_split.py  |  4 ++--
+ 3 files changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 65e03fc..a584003 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -1,3 +1,18 @@
++Backport CVE-2023-30608 Fix
++---------------------------
++
++Notable Changes
++
++* IMPORTANT: This release fixes a security vulnerability in the
++  parser where a regular expression vulnerable to ReDOS (Regular
++  Expression Denial of Service) was used. See the security advisory
++  for details: https://github.com/andialbrecht/sqlparse/security/adviso=
ries/GHSA-rrm6-wvj7-cwh2
++  The vulnerability was discovered by @erik-krogh from GitHub
++  Security Lab (GHSL). Thanks for reporting!
++
++* Fix regular expressions for string parsing.
++
++
+ Release 0.4.2 (Sep 10, 2021)
+ ----------------------------
+
+diff --git a/sqlparse/keywords.py b/sqlparse/keywords.py
+index 6850628..4e97477 100644
+--- a/sqlparse/keywords.py
++++ b/sqlparse/keywords.py
+@@ -66,9 +66,9 @@ SQL_REGEX =3D {
+         (r'(?![_A-Z=C3=80-=C3=9C])-?(\d+(\.\d*)|\.\d+)(?![_A-Z=C3=80-=C3=
=9C])',
+          tokens.Number.Float),
+         (r'(?![_A-Z=C3=80-=C3=9C])-?\d+(?![_A-Z=C3=80-=C3=9C])', tokens=
.Number.Integer),
+-        (r"'(''|\\\\|\\'|[^'])*'", tokens.String.Single),
++        (r"'(''|\\'|[^'])*'", tokens.String.Single),
+         # not a real string literal in ANSI SQL:
+-        (r'"(""|\\\\|\\"|[^"])*"', tokens.String.Symbol),
++        (r'"(""|\\"|[^"])*"', tokens.String.Symbol),
+         (r'(""|".*?[^\\]")', tokens.String.Symbol),
+         # sqlite names can be escaped with [square brackets]. left brac=
ket
+         # cannot be preceded by word character or a right bracket --
+diff --git a/tests/test_split.py b/tests/test_split.py
+index a9d7576..e79750e 100644
+--- a/tests/test_split.py
++++ b/tests/test_split.py
+@@ -18,8 +18,8 @@ def test_split_semicolon():
+
+
+ def test_split_backslash():
+-    stmts =3D sqlparse.parse(r"select '\\'; select '\''; select '\\\'';=
")
+-    assert len(stmts) =3D=3D 3
++    stmts =3D sqlparse.parse("select '\'; select '\'';")
++    assert len(stmts) =3D=3D 2
+
+
+ @pytest.mark.parametrize('fn', ['function.sql',
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.b=
b b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
index 0980ff9c24..b5cc41e730 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b136f573f5386=
001ea3b7b9016222fc"
=20
 SRC_URI +=3D "file://0001-sqlparse-change-shebang-to-python3.patch \
             file://run-ptest \
+            file://CVE-2023-30608.patch \
 	    "
=20
 SRC_URI[sha256sum] =3D "0c00730c74263a94e5a9919ade150dfc3b19c57438998544=
6148402998287dae"
--=20
2.40.0


