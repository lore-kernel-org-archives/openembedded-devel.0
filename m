Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C30CA0ED3
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 01:24:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13537.1725326689288849799
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Sep 2024 18:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99768ab3d4=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4830j26u003766
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Sep 2024 01:24:48 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41brd1afrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 01:24:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 18:24:47 -0700
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 18:24:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libdbi-perl: upgrade 1.643 -> 1.644
Date: Tue, 3 Sep 2024 09:24:45 +0800
Message-ID: <20240903012445.645317-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: k5U-IGBb5NnCrrshDj0HQaQBpOEXyBPk
X-Authority-Analysis: v=2.4 cv=Qdk0vdbv c=1 sm=1 tr=0 ts=66d66560 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=wyjpycHzAAAA:8 a=THEJL9P3AAAA:8 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8 a=_ctWjzdLAAAA:8
 a=eNcD7ojaAAAA:8 a=QSrlfhvblDVj6QQTTYgA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ROKTiUA5NBresHysc1Cf:22 a=9kzSNeRF1Bqm7BFd3Yff:22 a=WoGCsytTnHKj16XvecxK:22 a=rRYMMicksRHQPzyJ67jW:22
X-Proofpoint-ORIG-GUID: k5U-IGBb5NnCrrshDj0HQaQBpOEXyBPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409030009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 01:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112077

From: Changqing Li <changqing.li@windriver.com>

* License-Update: Update years
* Remove CVE-2014-10402.patch since it is not need for this version,
refer [1]
* Backport a patch

[1] https://metacpan.org/dist/DBI/view/Changes#Changes-in-DBI-1.632-9th-Nov-2014

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...uilding-on-Fedora-40-with-GCC-14.2.1.patch | 28 ++++++++++
 .../perl/libdbi-perl/CVE-2014-10402.patch     | 56 -------------------
 ...dbi-perl_1.643.bb => libdbi-perl_1.644.bb} |  9 ++-
 3 files changed, 32 insertions(+), 61 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch
 delete mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
 rename meta-oe/recipes-devtools/perl/{libdbi-perl_1.643.bb => libdbi-perl_1.644.bb} (83%)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch
new file mode 100644
index 000000000..f29d6c4d8
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch
@@ -0,0 +1,28 @@
+From dc970a868a4c2d7e2051b533e0a3588ef1d35530 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Dani=C3=ABl=20van=20Eeden?= <git@myname.nl>
+Date: Mon, 26 Aug 2024 10:17:01 +0200
+Subject: [PATCH] Fix building on Fedora 40 with GCC 14.2.1
+
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/d6e2bf13ac6043f5b0a9a147805b4915bd70e631]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ DBI.xs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index 747e341..9b1d136 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -1106,7 +1106,7 @@ dbih_inner(pTHX_ SV *orv, const char *what)
+     if (!SvMAGICAL(ohv)) {
+         if (!what)
+             return NULL;
+-        if (!hv_fetch(ohv,"_NO_DESTRUCT_WARN",17,0))
++        if (!hv_fetch((HV*)ohv,"_NO_DESTRUCT_WARN",17,0))
+ 	    sv_dump(orv);
+         croak("%s handle %s is not a DBI handle (has no magic)",
+                 what, neatsvpv(orv,0));
+-- 
+2.46.0
+
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
deleted file mode 100644
index b41bbe0a5..000000000
--- a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Backport patch to fix CVE-2014-10402.
-
-CVE: CVE-2014-10402
-Upstream-Status: Backport [https://github.com/rehsack/dbi/commit/19d0fb1]
-
-Ref:
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=972180#12
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-
-From 19d0fb169eed475e1c053e99036b8668625cfa94 Mon Sep 17 00:00:00 2001
-From: Jens Rehsack <sno@netbsd.org>
-Date: Tue, 6 Oct 2020 10:22:17 +0200
-Subject: [PATCH] lib/DBD/File.pm: fix CVE-2014-10401
-
-Dig into the root cause of RT#99508 - which resulted in CVE-2014-10401 - and
-figure out that DBI->parse_dsn is the wrong helper to parse our attributes in
-DSN, since in DBD::dr::connect only the "dbname" remains from DSN which causes
-parse_dsn to bailout.
-
-Parsing on our own similar to parse_dsn shows the way out.
-
-Signed-off-by: Jens Rehsack <sno@netbsd.org>
----
- lib/DBD/File.pm | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/lib/DBD/File.pm b/lib/DBD/File.pm
-index fb14e9a..f55076f 100644
---- a/lib/DBD/File.pm
-+++ b/lib/DBD/File.pm
-@@ -109,7 +109,11 @@ sub connect
-     # We do not (yet) care about conflicting attributes here
-     # my $dbh = DBI->connect ("dbi:CSV:f_dir=test", undef, undef, { f_dir => "text" });
-     # will test here that both test and text should exist
--    if (my $attr_hash = (DBI->parse_dsn ($dbname))[3]) {
-+    #
-+    # Parsing on our own similar to parse_dsn to find attributes in 'dbname' parameter.
-+    if ($dbname) {
-+	my @attrs = split /;/ => $dbname;
-+	my $attr_hash = { map { split /\s*=>?\s*|\s*,\s*/, $_} @attrs };
- 	if (defined $attr_hash->{f_dir} && ! -d $attr_hash->{f_dir}) {
- 	    my $msg = "No such directory '$attr_hash->{f_dir}";
- 	    $drh->set_err (2, $msg);
-@@ -120,7 +124,6 @@ sub connect
-     if ($attr and defined $attr->{f_dir} && ! -d $attr->{f_dir}) {
- 	my $msg = "No such directory '$attr->{f_dir}";
- 	$drh->set_err (2, $msg);
--	$attr->{RaiseError} and croak $msg;
- 	return;
- 	}
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.644.bb
similarity index 83%
rename from meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
rename to meta-oe/recipes-devtools/perl/libdbi-perl_1.644.bb
index 1fee83a8f..7f6c9059d 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.644.bb
@@ -7,13 +7,12 @@ database interface independent of the actual database being used. \
 HOMEPAGE = "http://search.cpan.org/dist/DBI/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8097b88c6165f0d43949441e6ea581cd"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz \
-           file://CVE-2014-10402.patch \
+SRC_URI = "https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-${PV}.tar.gz \
+           file://0001-Fix-building-on-Fedora-40-with-GCC-14.2.1.patch \
            "
-SRC_URI[md5sum] = "352f80b1e23769c116082a90905d7398"
-SRC_URI[sha256sum] = "8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa"
+SRC_URI[sha256sum] = "2297b99de09e67086640b590699e0e982fb469da63a93fe28dc14782db7a53c8"
 
 S = "${WORKDIR}/DBI-${PV}"
 
-- 
2.46.0


