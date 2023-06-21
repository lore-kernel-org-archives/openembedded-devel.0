Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F97EB64DC
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:58:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3924.1687366711500574152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=ILYNgg3i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5536b0030a=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LBeJ1l001917
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 16:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=CMIpGhQO9w0faL7PykfoZ2MScOLCys+ko+qEqSHe2ys=;
 b=ILYNgg3ig6+6VG1JFOarydYm8uplIIajekelov4jX0tlxw3k7lh348gNbCjeHZwE1n+E
 XVyGuIpQLXVlr+F9ukwLz4DO9TnPTmcuXM4T8TIe2sYZ6vFAFCMqXbOVIiBwOxfsMBMQ
 s6GSl9eH+Zxj+WX1TA8LFGUywuCP7gXyGC6oWcrScHumteDZIsl7U0q+x/gb6gVjKzwl
 XLfq1JqkJyzrFdA3p1HrTVbwFOjCnIMlD9aL9eugsXYrxBj6bIcqOfktZWCNvEgLZfQR
 Kq7kU3fWNwgqivhk9VYer5KwhzRmeRRDRBpGP+D8yQs2KYBOmBIUf/Xxu4jJkjP5Jbbg aw== 
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9220kvp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 16:58:30 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 09:58:29 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 21 Jun 2023 09:58:29 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [mickledore][meta-python][PATCH 1/1] python3-sqlparse: fix CVE-2023-30608
Date: Wed, 21 Jun 2023 09:58:29 -0700
Message-ID: <20230621165829.330195-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 0V4tbVm6nTzt3FubItC03-28mOT_-4aq
X-Proofpoint-ORIG-GUID: 0V4tbVm6nTzt3FubItC03-28mOT_-4aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210142
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35LBeJ1l001917
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 16:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103480

From: Joe Slater <joe.slater@windriver.com>

Backport from commit c457abd5f... upstream.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f8df47347619f5d8dc96710e3f892ae1a21b5e90)
---
 .../python3-sqlparse/CVE-2023-30608.patch     | 51 +++++++++++++++++++
 .../python/python3-sqlparse_0.4.3.bb          |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/=
CVE-2023-30608.patch

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-202=
3-30608.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-=
2023-30608.patch
new file mode 100644
index 0000000000..f5526c5b88
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608=
.patch
@@ -0,0 +1,51 @@
+From c457abd5f097dd13fb21543381e7cfafe7d31cfb Mon Sep 17 00:00:00 2001
+From: Andi Albrecht <albrecht.andi@gmail.com>
+Date: Mon, 20 Mar 2023 08:33:46 +0100
+Subject: [PATCH] Remove unnecessary parts in regex for bad escaping.
+
+The regex tried to deal with situations where escaping in the
+SQL to be parsed was suspicious.
+
+Upstream-Status: Backport
+CVE: CVE-2023-30608
+
+Reference to upstream patch:
+https://github.com/andialbrecht/sqlparse/commit/c457abd5f097dd13fb215433=
81e7cfafe7d31cfb
+
+[AZ: drop changes to CHANGELOG file and adjust context whitespaces]
+Signed-off-by: Adrian Zaharia <Adrian.Zaharia@windriver.com>
+
+Adjust indentation in keywords.py.
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ sqlparse/keywords.py | 4 ++--
+ tests/test_split.py  | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+--- sqlparse-0.4.3.orig/sqlparse/keywords.py
++++ sqlparse-0.4.3/sqlparse/keywords.py
+@@ -72,9 +72,9 @@ SQL_REGEX =3D {
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
+--- sqlparse-0.4.3.orig/tests/test_split.py
++++ sqlparse-0.4.3/tests/test_split.py
+@@ -18,8 +18,8 @@ def test_split_semicolon():
+=20
+=20
+ def test_split_backslash():
+-    stmts =3D sqlparse.parse(r"select '\\'; select '\''; select '\\\'';=
")
+-    assert len(stmts) =3D=3D 3
++    stmts =3D sqlparse.parse("select '\'; select '\'';")
++    assert len(stmts) =3D=3D 2
+=20
+=20
+ @pytest.mark.parametrize('fn', ['function.sql',
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.b=
b b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb
index c952c71d0b..a402f991f7 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb
@@ -5,6 +5,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b136f573f5386001ea3b7b901622=
2fc"
=20
 SRC_URI +=3D "file://0001-sqlparse-change-shebang-to-python3.patch \
+            file://CVE-2023-30608.patch \
             file://run-ptest \
 	    "
=20
--=20
2.25.1


