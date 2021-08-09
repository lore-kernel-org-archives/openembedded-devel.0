Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.20603.1628501004561341762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 02:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1799NNUP013203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Aug 2021 02:23:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 9 Aug 2021 02:23:21 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 9 Aug 2021 02:23:21 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libdbi-perl: fix CVE-2014-10402
Date: Mon, 9 Aug 2021 17:23:19 +0800
Message-ID: <20210809092319.36843-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2014-10402.

CVE: CVE-2014-10402

Ref:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=972180#12

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../perl/libdbi-perl/CVE-2014-10402.patch     | 56 +++++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
new file mode 100644
index 000000000..b41bbe0a5
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
@@ -0,0 +1,56 @@
+Backport patch to fix CVE-2014-10402.
+
+CVE: CVE-2014-10402
+Upstream-Status: Backport [https://github.com/rehsack/dbi/commit/19d0fb1]
+
+Ref:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=972180#12
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+
+From 19d0fb169eed475e1c053e99036b8668625cfa94 Mon Sep 17 00:00:00 2001
+From: Jens Rehsack <sno@netbsd.org>
+Date: Tue, 6 Oct 2020 10:22:17 +0200
+Subject: [PATCH] lib/DBD/File.pm: fix CVE-2014-10401
+
+Dig into the root cause of RT#99508 - which resulted in CVE-2014-10401 - and
+figure out that DBI->parse_dsn is the wrong helper to parse our attributes in
+DSN, since in DBD::dr::connect only the "dbname" remains from DSN which causes
+parse_dsn to bailout.
+
+Parsing on our own similar to parse_dsn shows the way out.
+
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
+---
+ lib/DBD/File.pm | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/lib/DBD/File.pm b/lib/DBD/File.pm
+index fb14e9a..f55076f 100644
+--- a/lib/DBD/File.pm
++++ b/lib/DBD/File.pm
+@@ -109,7 +109,11 @@ sub connect
+     # We do not (yet) care about conflicting attributes here
+     # my $dbh = DBI->connect ("dbi:CSV:f_dir=test", undef, undef, { f_dir => "text" });
+     # will test here that both test and text should exist
+-    if (my $attr_hash = (DBI->parse_dsn ($dbname))[3]) {
++    #
++    # Parsing on our own similar to parse_dsn to find attributes in 'dbname' parameter.
++    if ($dbname) {
++	my @attrs = split /;/ => $dbname;
++	my $attr_hash = { map { split /\s*=>?\s*|\s*,\s*/, $_} @attrs };
+ 	if (defined $attr_hash->{f_dir} && ! -d $attr_hash->{f_dir}) {
+ 	    my $msg = "No such directory '$attr_hash->{f_dir}";
+ 	    $drh->set_err (2, $msg);
+@@ -120,7 +124,6 @@ sub connect
+     if ($attr and defined $attr->{f_dir} && ! -d $attr->{f_dir}) {
+ 	my $msg = "No such directory '$attr->{f_dir}";
+ 	$drh->set_err (2, $msg);
+-	$attr->{RaiseError} and croak $msg;
+ 	return;
+ 	}
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index 311cf2730..b21418298 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -9,7 +9,9 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz \
+           file://CVE-2014-10402.patch \
+           "
 SRC_URI[md5sum] = "352f80b1e23769c116082a90905d7398"
 SRC_URI[sha256sum] = "8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa"
 
-- 
2.17.1

