Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.1008.1629567346614267179
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Aug 2021 10:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uLoEA2sJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id t1so12434531pgv.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Aug 2021 10:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n+a5e8JiK5LGy+WCVAN5Q5x3m867DSJymFrLz04mO3c=;
        b=uLoEA2sJimXsTekiVJVUEbjF7J4BJLr4GeY3gspodrScPia6X+FxZ6MpStYOCvCUXv
         qeflNgq4VqqwZvnIBGBCOnzdPg3TIv4dplLjAn5BUmULZoJEHYzh1rQL5Qnu6Q3n/zCq
         Pu7FzCVZqS2bV0C6aN2OR4kMEvrQs4KhrqtTsnObUcbdanPhiNzvfFylrICmTBkcRgIU
         rtJAww+ENxk6N8uSpYgBx/T/v9xCittzhsh9dnysxnsEXUSdUSqjhbfnIOtVX3nF3Pkj
         X9g72RTU4zMuex64/0Ri/6eS3ya/aRq4oQxkns5Si+vocRZpNdZdELauvzHyvuSAqhsJ
         On7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+a5e8JiK5LGy+WCVAN5Q5x3m867DSJymFrLz04mO3c=;
        b=nHcheK9ApNrupPDeOiYGS3Ocj2XVAoTI3tYq+JwCpYKvwMV7rloLLrnQPS9sCkFt9n
         wxbxbBQu9icB52aDgFIc+z55Cnmjml/+Bh0XdlDUKsG7akdNmr8/yV/17vdzugy6soTK
         m9eHg93AWoP+oTk0Hp6mdyNNi+gSLprbJvsRpSfWlL9dr1ZNtfOGip6ac0NqhyiUDaph
         K92RFFqDl4arDHAN5O+qUo38HX5+Q2xWM4fbj6O5wInw6WEECQWY8l5uZ4U17+lE9CY7
         +Umr9P5/ICo/qCGHZDNcHcHdJZASt7VlKLCOc97uWLloP62lvxN/D1I51YHsJhIqEPpT
         oO3Q==
X-Gm-Message-State: AOAM530nTy3j+AI3sBbTHgGRMbGVsmAyL3dHL6PHugS6jFdeizyhGilL
	hNNf7J4z+l5XQCzB8+5jAf5QWmxQ1z0=
X-Google-Smtp-Source: ABdhPJyp5Jc4tuxvHITzJr1h5Xq+4XMg7W9fd2RpwsG5uamRO2FIWtdXF0WZ30oR5RD/wqWnSCUTIQ==
X-Received: by 2002:a63:5914:: with SMTP id n20mr24666582pgb.164.1629567346044;
        Sat, 21 Aug 2021 10:35:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id n18sm10993315pfu.3.2021.08.21.10.35.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 10:35:45 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 1/7] libdbi-perl: fix CVE-2014-10402
Date: Sat, 21 Aug 2021 10:35:35 -0700
Message-Id: <c1a9fe85173bb01b156564dd5c90c93238a3b1f5.1629567241.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629567241.git.akuster808@gmail.com>
References: <cover.1629567241.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2014-10402.

CVE: CVE-2014-10402

Ref:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=972180#12

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c80b3757ffc762a1577bcf7d0da41ebf1954b3f1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../perl/libdbi-perl/CVE-2014-10402.patch     | 56 +++++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
new file mode 100644
index 0000000000..b41bbe0a50
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
index 75fad46bfd..c8abae628f 100644
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
2.25.1

