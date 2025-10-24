Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BB6CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 12:27:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9215.1761308810587156075
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 05:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=LEsVtHP9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2392d52613=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O5kFIH2272869
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 05:26:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XR1AQTqwxrEGx8a0EyzH
	4ZxWsvDKviyc1fBjXJ+aF8M=; b=LEsVtHP92Vexp7zWz2ZxmjGkdP2hXkd4alHi
	dncP0Ror6/DUrC4xdpajAk8AbNMybJXxLcUGFV56oB+EiLEepH0HB9zBqm4iWHUc
	XMkJJBhBY8VMdOShABQfXcZ+dvXZzpUPiNjJFeOWER7wfM0NuT8/1M8k1Hh8yuKC
	iOXGxcNSVYOlKD+riDBXa+VGbDQbpYuJRUuJtkFZ/Am46pnWGjWdK1umleTLCvwD
	1mdWc1BO9Ou1/onNXRunh+StLEnzNwFsetd9L0oMJrXHFzhS/00JvbUo/HToGLFD
	cBDorcrhwjHyj+8suiogTYSCMDlFmmZ1VUEHPKF6JW97hQsOZw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v660f4rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 05:26:49 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 05:26:48 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/3] mariadb: fix CVE-2025-21490
Date: Fri, 24 Oct 2025 17:56:22 +0530
Message-ID: <20251024122624.1325594-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=VN3QXtPX c=1 sm=1 tr=0 ts=68fb708a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8
 a=hkEv4HZQAAAA:8 a=t7CeM3EgAAAA:8 a=jpp-Wi3FAAAA:8 a=atUgxMe06am4ncSGy7MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NA03pvyaApPJG5valX87:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=3HWhRrkoiJongTt84g_J:22
X-Proofpoint-ORIG-GUID: 2SaAJn_nothZIJdM_huHybKUwD2VWVl8
X-Proofpoint-GUID: 2SaAJn_nothZIJdM_huHybKUwD2VWVl8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDExMCBTYWx0ZWRfX1UM6PHtmIjrj
 m9J1LfMBrQ3lZI5zflfihpq8Z18AJ65/j4rikWJXQjuPWBKV9f9dBUGvTop+PpgMR5TCDQFpaHX
 Xhr+ZhtLpmONkw1sF8O8KGbaea0q5sL317ayM0AfFS7jv5kX1CXHUXtfVVMhzbImBrY2N3gHuTd
 f59gCtV6/lntL/O5wfwnrrODFhew0VNbmiwcoHkGadlNp04WSSkEsMhszIyQ5hKsGRne3IdDHZs
 FqXt5cy9i8tzuowC+BrPURfcFICCNaQ2x+WTko9ROvDZ/AAh/cClfLHI0meBZkdrXkdycuM5clI
 DVzMoiPZh6JWYr1YQ9vRmfqfVQpkPteB7eocm7hbjH9aKWrXK2uSSrJGkBDN4hUpnZ9cl5jAKNH
 xsJ1tXKsYFIJxIATwm468Lk76DrY+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240110
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59O5kFIH2272869
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 12:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120955

From: Divya Chellam <divya.chellam@windriver.com>

Vulnerability in the MySQL Server product of Oracle MySQL (component: Inn=
oDB).
Supported versions that are affected are 8.0.40 and prior, 8.4.3 and prio=
r
and 9.1.0 and prior. Easily exploitable vulnerability allows high privile=
ged
attacker with network access via multiple protocols to compromise MySQL S=
erver.
Successful attacks of this vulnerability can result in unauthorized abili=
ty to
cause a hang or frequently repeatable crash (complete DOS) of MySQL Serve=
r.
CVSS 3.1 Base Score 4.9 (Availability impacts). CVSS Vector:
(CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:H).

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-21490
https://security-tracker.debian.org/tracker/CVE-2025-21490

Upstream-patch:
https://github.com/MariaDB/server/commit/82310f926b7c6547f25dd80e4edf3f38=
b22913e5

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 .../mysql/mariadb/CVE-2025-21490.patch        | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-21490.patc=
h

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index fde5fefd6a..27b5c46fa1 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -33,6 +33,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
            file://CVE-2024-21096-0003.patch \
            file://CVE-2024-21096-0004.patch \
            file://CVE-2024-21096-0005.patch \
+	   file://CVE-2025-21490.patch \
           "
 SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-21490.patch b/met=
a-oe/recipes-dbs/mysql/mariadb/CVE-2025-21490.patch
new file mode 100644
index 0000000000..9c96f70313
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2025-21490.patch
@@ -0,0 +1,96 @@
+From 82310f926b7c6547f25dd80e4edf3f38b22913e5 Mon Sep 17 00:00:00 2001
+From: Marko M=C3=A4kel=C3=A4 <marko.makela@mariadb.com>
+Date: Wed, 22 Jan 2025 17:22:07 +0200
+Subject: [PATCH] MDEV-29182 Assertion fld->field_no < table->n_v_def fai=
led on
+ cascade
+
+row_ins_cascade_calc_update_vec(): Skip any virtual columns in the
+update vector of the parent table.
+
+Based on mysql/mysql-server@0ac176453bfef7fb1fdfa70af74618c32910181c
+
+Reviewed by: Debarun Banerjee
+
+CVE: CVE-2025-21490
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/8231=
0f926b7c6547f25dd80e4edf3f38b22913e5]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ mysql-test/suite/innodb/r/foreign_key.result | 17 +++++++++++++++++
+ mysql-test/suite/innodb/t/foreign_key.test   | 15 +++++++++++++++
+ storage/innobase/row/row0ins.cc              |  4 +++-
+ 3 files changed, 35 insertions(+), 1 deletion(-)
+
+diff --git a/mysql-test/suite/innodb/r/foreign_key.result b/mysql-test/s=
uite/innodb/r/foreign_key.result
+index acf021db..6348e7a1 100644
+--- a/mysql-test/suite/innodb/r/foreign_key.result
++++ b/mysql-test/suite/innodb/r/foreign_key.result
+@@ -982,6 +982,23 @@ t2	CREATE TABLE `t2` (
+   CONSTRAINT `t2_ibfk_1` FOREIGN KEY (`a`) REFERENCES `t1` (`a`)
+ ) ENGINE=3DInnoDB DEFAULT CHARSET=3Dlatin1 COLLATE=3Dlatin1_swedish_ci
+ drop tables t2, t1;
++#
++# MDEV-29182 Assertion fld->field_no < table->n_v_def failed on cascade
++#
++CREATE TABLE t1(a INT PRIMARY KEY, b VARCHAR(3), c INT AS (LENGTH(b)) V=
IRTUAL,
++INDEX(c)) ENGINE=3DInnoDB;
++CREATE TABLE t2(a INT REFERENCES t1(a) ON UPDATE CASCADE,
++b INT GENERATED ALWAYS AS(a) VIRTUAL, INDEX(b)) ENGINE=3DInnoDB;
++INSERT INTO t1 SET a=3D1,b=3D'fu';
++INSERT INTO t2 SET a=3D1;
++UPDATE t1 SET a=3D2,b=3D'bar';
++SELECT * FROM t1;
++a	b	c
++2	bar	3
++SELECT * FROM t2;
++a	b
++2	2
++DROP TABLE t2,t1;
+ # End of 10.5 tests
+ #
+ # MDEV-26554 Table-rebuilding DDL on parent table causes crash
+diff --git a/mysql-test/suite/innodb/t/foreign_key.test b/mysql-test/sui=
te/innodb/t/foreign_key.test
+index 4b047ea4..45205cce 100644
+--- a/mysql-test/suite/innodb/t/foreign_key.test
++++ b/mysql-test/suite/innodb/t/foreign_key.test
+@@ -1007,6 +1007,21 @@ alter table t2 add foreign key(a) references t1;
+ show create table t2;
+ drop tables t2, t1;
+=20
++
++--echo #
++--echo # MDEV-29182 Assertion fld->field_no < table->n_v_def failed on =
cascade
++--echo #
++CREATE TABLE t1(a INT PRIMARY KEY, b VARCHAR(3), c INT AS (LENGTH(b)) V=
IRTUAL,
++                INDEX(c)) ENGINE=3DInnoDB;
++CREATE TABLE t2(a INT REFERENCES t1(a) ON UPDATE CASCADE,
++                b INT GENERATED ALWAYS AS(a) VIRTUAL, INDEX(b)) ENGINE=3D=
InnoDB;
++INSERT INTO t1 SET a=3D1,b=3D'fu';
++INSERT INTO t2 SET a=3D1;
++UPDATE t1 SET a=3D2,b=3D'bar';
++SELECT * FROM t1;
++SELECT * FROM t2;
++DROP TABLE t2,t1;
++
+ --echo # End of 10.5 tests
+=20
+ --echo #
+diff --git a/storage/innobase/row/row0ins.cc b/storage/innobase/row/row0=
ins.cc
+index 8385bcae..0d8ae8aa 100644
+--- a/storage/innobase/row/row0ins.cc
++++ b/storage/innobase/row/row0ins.cc
+@@ -483,7 +483,9 @@ row_ins_cascade_calc_update_vec(
+ 			const upd_field_t*	parent_ufield
+ 				=3D &parent_update->fields[j];
+=20
+-			if (parent_ufield->field_no =3D=3D parent_field_no) {
++			if (parent_ufield->field_no =3D=3D parent_field_no
++			    && !(parent_ufield->new_val.type.prtype
++				 & DATA_VIRTUAL)) {
+=20
+ 				ulint			min_size;
+ 				const dict_col_t*	col;
+--=20
+2.40.0
+
--=20
2.40.0


