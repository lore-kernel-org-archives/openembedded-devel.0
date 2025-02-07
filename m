Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6507BC02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 06:30:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.63157.1738909798630367878
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 22:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4133fc511a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51752HHn024103
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Feb 2025 06:29:57 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8eaca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Feb 2025 06:29:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 6 Feb 2025 22:29:56 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 6 Feb 2025 22:29:55 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-webserver][PATCH] phpmyadmin: fix CVE-2025-24529/CVE-2025-24530
Date: Fri, 7 Feb 2025 14:29:55 +0800
Message-ID: <20250207062955.2730384-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=ecXHf6EH c=1 sm=1 tr=0 ts=67a5a865 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=sntlU3ZaAAAA:8 a=t7CeM3EgAAAA:8 a=MTyZdu_5AAAA:8
 a=pXFVax56l3t4kYRfnH8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=xslW_GA4FUbfK35qJ43B:22 a=FdTzh2GWekK77mhwV6Dw:22 a=fhH2MzX60c9VjgYsInox:22
X-Proofpoint-ORIG-GUID: 78SOBaMlEkNjrMNI45disbTOHjD5Gk-j
X-Proofpoint-GUID: 78SOBaMlEkNjrMNI45disbTOHjD5Gk-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502070049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51752HHn024103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Feb 2025 06:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115304

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-24529:
An issue was discovered in phpMyAdmin 5.x before 5.2.2. An XSS
vulnerability has been discovered for the Insert tab.
Refer: https://nvd.nist.gov/vuln/detail/CVE-2025-24529

CVE-2025-24530:
An issue was discovered in phpMyAdmin 5.x before 5.2.2. An XSS
vulnerability has been discovered for the check tables feature. A
crafted table or database name could be used for XSS.
Refer: https://nvd.nist.gov/vuln/detail/CVE-2025-24530

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../phpmyadmin/CVE-2025-24529.patch           | 36 ++++++++++++++++
 .../phpmyadmin/CVE-2025-24530.patch           | 42 +++++++++++++++++++
 .../phpmyadmin/phpmyadmin_5.1.3.bb            |  4 +-
 3 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-=
2025-24529.patch
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-=
2025-24530.patch

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2025-24=
529.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2025-245=
29.patch
new file mode 100644
index 000000000..4b862649d
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2025-24529.pat=
ch
@@ -0,0 +1,36 @@
+From a8e215c314a98008aab6f3147a409911be73108e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Maur=3DC3=3DADcio=3D20Meneghini=3D20Fauth?=3D <maurici=
o@mfauth.net>
+Date: Sun, 12 Jan 2025 22:39:06 -0300
+Subject: [PATCH 1/2] Fix XSS vulnerability on Insert page
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Maur=C3=ADcio Meneghini Fauth <mauricio@mfauth.net>
+
+CVE: CVE-2025-24529
+Upstream-Status: Backport [https://github.com/phpmyadmin/phpmyadmin/comm=
it/7355ddff8d1da9453cf43c09a45666157b16103d]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libraries/classes/InsertEdit.php | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libraries/classes/InsertEdit.php b/libraries/classes/Insert=
Edit.php
+index abc3c5f..4bde765 100644
+--- a/libraries/classes/InsertEdit.php
++++ b/libraries/classes/InsertEdit.php
+@@ -2166,8 +2166,8 @@ class InsertEdit
+         } elseif ($trueType =3D=3D=3D 'binary' || $trueType =3D=3D=3D '=
varbinary') {
+             $special_chars =3D bin2hex($column['Default']);
+         } elseif (substr($trueType, -4) =3D=3D=3D 'text') {
+-            $textDefault =3D substr($column['Default'], 1, -1);
+-            $special_chars =3D stripcslashes($textDefault !=3D=3D false=
 ? $textDefault : $column['Default']);
++            $textDefault =3D (string) substr($column['Default'], 1, -1)=
;
++            $special_chars =3D htmlspecialchars(stripcslashes($textDefa=
ult !=3D=3D '' ? $textDefault : $column['Default']));
+         } else {
+             $special_chars =3D htmlspecialchars($column['Default']);
+         }
+--=20
+2.34.1
+
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2025-24=
530.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2025-245=
30.patch
new file mode 100644
index 000000000..4e36dbba8
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/CVE-2025-24530.pat=
ch
@@ -0,0 +1,42 @@
+From 76e8b760487139bbfba08b8a6f7fdad40a93ac57 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Maur=3DC3=3DADcio=3D20Meneghini=3D20Fauth?=3D <maurici=
o@mfauth.net>
+Date: Tue, 15 Oct 2024 12:27:22 -0300
+Subject: [PATCH 2/2] Fix unescaped table name when checking tables
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Maur=C3=ADcio Meneghini Fauth <mauricio@mfauth.net>
+
+CVE: CVE-2025-24530
+Upstream-Status: Backport [https://github.com/phpmyadmin/phpmyadmin/comm=
it/23c13a81709728089ff031e5b1c29b5e91baa6a7]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libraries/classes/Table/Maintenance.php | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libraries/classes/Table/Maintenance.php b/libraries/classes=
/Table/Maintenance.php
+index 9ed72ef..0247c6e 100644
+--- a/libraries/classes/Table/Maintenance.php
++++ b/libraries/classes/Table/Maintenance.php
+@@ -7,6 +7,7 @@ namespace PhpMyAdmin\Table;
+ use PhpMyAdmin\DatabaseInterface;
+ use PhpMyAdmin\Index;
+ use PhpMyAdmin\Util;
++use function htmlspecialchars;
+ use function implode;
+ use function sprintf;
+=20
+@@ -91,7 +92,7 @@ final class Maintenance
+                 continue;
+             }
+=20
+-            $indexesProblems .=3D sprintf(__('Problems with indexes of =
table `%s`'), $table);
++            $indexesProblems .=3D htmlspecialchars(sprintf(__('Problems=
 with indexes of table `%s`'), $table));
+             $indexesProblems .=3D $check;
+         }
+=20
+--=20
+2.34.1
+
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb b/=
meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
index 3f1919439..85a18dfd1 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.1.3.bb
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69=
f5fce4486a80fdaf4a4263 \
 SRC_URI =3D "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${=
PV}-all-languages.tar.xz \
            file://apache.conf \
            file://CVE-2023-25727.patch \
+           file://CVE-2025-24529.patch \
+           file://CVE-2025-24530.patch \
 "
=20
 SRC_URI[sha256sum] =3D "c562feddc0f8ff5e69629113f273a0d024a65fb928c48e89=
ce614744d478296f"
-
+=20
 UPSTREAM_CHECK_URI =3D "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX =3D "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages=
.tar.xz"
=20
--=20
2.34.1


