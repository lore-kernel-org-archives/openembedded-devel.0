Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.11485.1629036412833640541
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TZXbUfDk;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so28300773pjn.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n+a5e8JiK5LGy+WCVAN5Q5x3m867DSJymFrLz04mO3c=;
        b=TZXbUfDkj71CQhv4gr5i1kqs8FTUHaDtvqor8aTEKOYB2UbxZe9jd7xiqjVlev/uD+
         kwJ0/pvKKWcl1O71Lf0T7mGe17hIif6CIte75zjUQjhdg+14M7Nuje/rJAdYDxn7gP+/
         lhxVbWbe6PCK69NUEdAv+a0yobi6ZcRyBVCvaPqsYDpg2Z5HlAnrhDg8AMwVrlB2uiOr
         LNFgBNCNb3nyJjW5nWa3SGC3c3fq5G56naIqToM7G0Wn0ZgMWVxaS1x6K7GCKAFkTrOy
         y6JKpksTaH3LzLxhTqBiDs+JCUiug6EDg9QUGMipSSZ9h7xVjKgLRdnq7FKbDWNVhBWl
         Jc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+a5e8JiK5LGy+WCVAN5Q5x3m867DSJymFrLz04mO3c=;
        b=pEUzACV7U0BS4yyGeJS7cBKmMjz/E/dmkMy/ZpJtS+vriK3szvn8/KbnRYX1HHkhqt
         huSMnFPKMDpgyZr0haH/rBsjmid1Q904kFJbbY61BlVMg3bHVvPlx1+8dgOPoasEhulr
         6HANYtKtYnlezp+Qeevzwu7j4vJhmxrgIiwFV0PWEnxa3wc530APX64DOhGWPXrJ7idd
         v4GvwIlnqjPHGB3wgtpUgugirhCNUrv9L4IGucziB668dfWXu8I0bdEHxA3ezd9aDYJe
         2o+ZAWJhNEOJ1QS0QLzaAewaUvY87w1AVf35zQ7wyzvWOF5a6JBzLHsDdqiJAPItdCAB
         iXgQ==
X-Gm-Message-State: AOAM530Zuxr81SQt23CT0X1xpPPha1mcc2kWWMQX80Au+iUUPu+iPRwU
	xWtIwKTjzI25AsJDITK5pMm36LLl4MbU0w==
X-Google-Smtp-Source: ABdhPJwfPhE3GWo+go/W0xM1yxQLFO+QzXB7Ar29Cvgu+9RkAIeN+CL3CdgOFvZSf0UPIKSH9qcmlQ==
X-Received: by 2002:a63:da44:: with SMTP id l4mr11318902pgj.405.1629036412267;
        Sun, 15 Aug 2021 07:06:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:52 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 14/18] libdbi-perl: fix CVE-2014-10402
Date: Sun, 15 Aug 2021 07:06:26 -0700
Message-Id: <aaa1c12b2cdea197d420953c8df873e8af5cc507.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
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

