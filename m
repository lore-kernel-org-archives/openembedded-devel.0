Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2D2C54FCD
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:26:00 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7527.1785317157538721519
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jGL8y2LO;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9828; q=dns/txt;
  s=iport01; t=1785317157; x=1786526757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4pNI5N5fgEhEkAGKPunuVSwLOUK15KFnHdwBw6MS54I=;
  b=jGL8y2LOmLh8TdYqe+3QhwRFvqToBVCyO39mhTDPB5e8wO5y01ADv8Ba
   v+u0RQ/QfKf79ziDlPwUzLYM9c+gd0JzHirTXRpcrChu8VBR+d03EOQqv
   qAVk30upwHx/cWQf5ufVBTgAqF+JwVgqOFNCvH3+ai/MeDE1SwfFFLK8n
   KkL4X24cwetZvkdWldSmd42PgVdezQePljuVZyVbYNGvfZS6FcFSyl94b
   yRQ3JZtfj1ZE2H7z6Jc9kU1NKM4G9LgDOLxlx/dRBuZcaoasA9PBmOWqX
   mGNeWDsYlf4SfEBMZCFWSslLhU8AdodnvhTNZTVJ5Qh0UBfYCuck22E8t
   g==;
X-CSE-ConnectionGUID: Mn7ZPtWaS3mhb2vGyoTSsg==
X-CSE-MsgGUID: nCAuaOnOR8KHJUksfnDyFA==
X-IPAS-Result: =?us-ascii?q?A0BIAgC9xmlq/5IQJK1aglmCV3ReQ0mVXmwDgROdCIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEb4ogXkzgQGDa?=
 =?us-ascii?q?AJDUNsuAQsUAQWBM4U/iCBcGAFEhDgnGxuBcoEVgnN2gQWBPh4BAYEnhn4Eg?=
 =?us-ascii?q?iKBDIFaHpA3SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BL?=
 =?us-ascii?q?D+EVyMZNn+BL3VKdy1pARIXgRqDOQKCQQMLGA1IESw3FBkEPm4HjW8hgkWBD?=
 =?us-ascii?q?gEqAQl8FjUzk1aSSaEPCiiDdYwhlToaM4VbpRELmH2OCpZQhGmBaDyBRwsHc?=
 =?us-ascii?q?BWDIglKGQ+OLgoLg2CBf4MUNMkSJzILMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:xErh7aOfqEFIJKHvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUokg2ZSy
 2JKCzqCaa6DNzbwKd11OoWxox4HuMDSmNRqHXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD+kfF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gW8sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69BoU3MOIbIRwb1yAWsU6
 9MJLww2dR/W0opawJrjIgVtrs0nKM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGYxBPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237nFQugOe0YISMEjCMbcN+t1uRg
 WThxTTaIjMnN8eRzxaU3Fv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOb9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:+CRVMKEdmgzTljSUpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3A6KPZMmoV/O68EcdURLcLFsDmUeUjLU/l0EjZGBS?=
 =?us-ascii?q?9CWwzVpKETmOr46wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AWzgDFA4hLOs7M9KemWvEi3sExoxuyI2zAWcLtq9?=
 =?us-ascii?q?WmOmmCC9rNTGxnRqeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="807871861"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:25:56 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 6F8661800047E;
	Wed, 29 Jul 2026 09:25:56 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 121A3CC12A8; Wed, 29 Jul 2026 02:25:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH 3/5] libdbi-perl: Fix CVE-2026-14380
Date: Wed, 29 Jul 2026 02:25:53 -0700
Message-Id: <20260729092556.45457-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260729092556.45457-1-hthakar@cisco.com>
References: <20260729092556.45457-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 09:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128558

From: Hetvi Thakar <hthakar@cisco.com>

Backport the ordered upstream fix and regression-test chain from DBI
1.650. Add perl-module-load to RDEPENDS to satisfy the runtime
dependency introduced by the primary fix's use of Module::Load.

[1] https://github.com/perl5-dbi/dbi/commit/b73d5d9901767fc1d16b6661ef08fbed4532e259
[2] https://github.com/perl5-dbi/dbi/commit/d982411aec73b3acfc4e9e465358bca9eb7fede8
[3] https://github.com/perl5-dbi/dbi/commit/f94685f415b08ea4b1f183d48430c4583c1c07d0
[4] https://github.com/perl5-dbi/dbi/commit/7949e551b3c7a8854926b6de84f6cc2ceafb2200
[5] https://nvd.nist.gov/vuln/detail/CVE-2026-14380

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-14380_p1.patch  | 37 +++++++++++
 .../perl/libdbi-perl/CVE-2026-14380_p2.patch  | 65 +++++++++++++++++++
 .../perl/libdbi-perl/CVE-2026-14380_p3.patch  | 27 ++++++++
 .../perl/libdbi-perl/CVE-2026-14380_p4.patch  | 56 ++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |  5 ++
 5 files changed, 190 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p1.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p2.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p3.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p4.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p1.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p1.patch
new file mode 100644
index 0000000000..eae236527e
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p1.patch
@@ -0,0 +1,37 @@
+From b588d38661f00361bcf62b2665905ade844866ee Mon Sep 17 00:00:00 2001
+From: Robert Rothenberg <perl@rhizomnic.com>
+Date: Wed, 1 Jul 2026 22:31:56 +0100
+Subject: [PATCH] Load profile packages using Module::Load [CVE-2026-14380]
+
+CVE: CVE-2026-14380
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/b73d5d9901767fc1d16b6661ef08fbed4532e259]
+
+(cherry picked from commit b73d5d9901767fc1d16b6661ef08fbed4532e259)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ lib/DBI/Profile.pm | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/DBI/Profile.pm b/lib/DBI/Profile.pm
+index f2cc886..4188462 100644
+--- a/lib/DBI/Profile.pm
++++ b/lib/DBI/Profile.pm
+@@ -679,6 +679,7 @@ use vars qw(@ISA @EXPORT @EXPORT_OK $VERSION);
+ use Exporter ();
+ use UNIVERSAL ();
+ use Carp;
++use Module::Load ();
+ 
+ use DBI qw(dbi_time dbi_profile dbi_profile_merge_nodes dbi_profile_merge);
+ 
+@@ -758,7 +759,9 @@ sub _auto_new {
+         }
+     }
+ 
+-    eval "require $package" if $package; # silently ignores errors
++    eval {
++        Module::Load::load $package if $package; # silently ignores errors
++    };
+     $package ||= $class;
+ 
+     return $package->new(Path => \@Path, @args);
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p2.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p2.patch
new file mode 100644
index 0000000000..5ec8c76ee0
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p2.patch
@@ -0,0 +1,65 @@
+From 54d3e792a236385930e387b28b6c8be779b8d7f7 Mon Sep 17 00:00:00 2001
+From: Robert Rothenberg <perl@rhizomnic.com>
+Date: Wed, 1 Jul 2026 23:03:34 +0100
+Subject: [PATCH] Add tests for CVE-2026-14380
+
+CVE: CVE-2026-14380
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/d982411aec73b3acfc4e9e465358bca9eb7fede8]
+
+(cherry picked from commit d982411aec73b3acfc4e9e465358bca9eb7fede8)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ t/40profile.t | 38 ++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+
+diff --git a/t/40profile.t b/t/40profile.t
+index 7a71b8f..5c72449 100644
+--- a/t/40profile.t
++++ b/t/40profile.t
+@@ -458,8 +458,46 @@ is("@$totals", "27.00 2.93 0.11 0.01 0.23 1023110000.00 1023110010.00",
+    'merged time foo/bar');
+ is($total_time, 2.93, 'merged nodes foo/bar time');
+ 
++subtest "CVE-2026-14380" => sub {
++
++    {
++        my $marker = sprintf('dbi-test-payload-%u-%u-%u', time, $$, 1);
++        local $ENV{DBI_PROFILE} = payload_for($marker);
++        my $dbh = eval {
++            DBI->connect("dbi:Sponge:", "", "", { RaiseError => 0 })
++        };
++        ok !( -e "/tmp/$marker" ), "ENV DBI_PROFILE payload";
++    }
++
++    {
++        my $marker = sprintf('dbi-test-payload-%u-%u-%u', time, $$, 1);
++        my $dbh = DBI->connect("dbi:Sponge:", "", "", { RaiseError => 0 });
++        eval {
++            $dbh->{Profile} = payload_for($marker);
++        };
++        ok !( -e "/tmp/$marker" ), "Set Profile payload";
++    }
++
++    {
++        my $marker  = sprintf('dbi-test-payload-%u-%u-%u', time, $$, 1);
++        my $payload = payload_for($marker);
++        my $dsn = "dbi:Sponge(Profile=>$payload):";
++        my $dbh = eval {
++            DBI->connect($dsn, "", "", { RaiseError => 0 })
++        };
++        ok !( -e "/tmp/$marker" ), "DSN payload";
++    }
++
++};
++
+ exit 0;
+ 
++sub payload_for {
++    my ($marker) = @_;
++    # Single-quoted q{...} so \x2f is literal backslash-x-2-f for split;
++    # the inner qq(...) re-interprets \x2f = / at eval-time.
++    return qq{2/system(qq(touch \\x2ftmp\\x2f$marker))};
++}
+ 
+ sub sanitize_tree {
+     my $data = shift;
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p3.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p3.patch
new file mode 100644
index 0000000000..c88f829bd7
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p3.patch
@@ -0,0 +1,27 @@
+From cbd61112415aaa9db84d1af6d0bb3d0f61de8ce0 Mon Sep 17 00:00:00 2001
+From: Robert Rothenberg <perl@rhizomnic.com>
+Date: Sat, 4 Jul 2026 13:34:20 +0100
+Subject: [PATCH] t/40profile.t increase number of tests in the plan
+
+CVE: CVE-2026-14380
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/f94685f415b08ea4b1f183d48430c4583c1c07d0]
+
+(cherry picked from commit f94685f415b08ea4b1f183d48430c4583c1c07d0)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ t/40profile.t | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/40profile.t b/t/40profile.t
+index d736da7..ba24421 100644
+--- a/t/40profile.t
++++ b/t/40profile.t
+@@ -31,7 +31,7 @@ BEGIN {
+         if $Config{osvers} =~ /xen/ # eg 2.6.18-4-xen-amd64
+         and $ENV{AUTOMATED_TESTING};
+ 
+-    plan tests => 60;
++    plan tests => 61;
+ }
+ 
+ $Data::Dumper::Indent = 1;
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p4.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p4.patch
new file mode 100644
index 0000000000..90270e155c
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p4.patch
@@ -0,0 +1,56 @@
+From ef28126fbb8d918307b4995030028984ff8796f5 Mon Sep 17 00:00:00 2001
+From: Robert Rothenberg <perl@rhizomnic.com>
+Date: Mon, 6 Jul 2026 09:13:26 +0100
+Subject: [PATCH] Improve CVE-2026-14380 tests for Profile
+
+CVE: CVE-2026-14380
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/7949e551b3c7a8854926b6de84f6cc2ceafb2200]
+
+(cherry picked from commit 7949e551b3c7a8854926b6de84f6cc2ceafb2200)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ t/40profile.t | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/t/40profile.t b/t/40profile.t
+index 5c72449..d736da7 100644
+--- a/t/40profile.t
++++ b/t/40profile.t
+@@ -461,31 +461,34 @@ is($total_time, 2.93, 'merged nodes foo/bar time');
+ subtest "CVE-2026-14380" => sub {
+ 
+     {
+-        my $marker = sprintf('dbi-test-payload-%u-%u-%u', time, $$, 1);
++        my $marker = sprintf('dbi-test-payload-%1.6f-%u-%u-%u', $], time, $$, 1);
+         local $ENV{DBI_PROFILE} = payload_for($marker);
+         my $dbh = eval {
+             DBI->connect("dbi:Sponge:", "", "", { RaiseError => 0 })
+         };
+         ok !( -e "/tmp/$marker" ), "ENV DBI_PROFILE payload";
++        unlink "/tmp/$marker" if -e "/tmp/$marker";
+     }
+ 
+     {
+-        my $marker = sprintf('dbi-test-payload-%u-%u-%u', time, $$, 1);
++        my $marker = sprintf('dbi-test-payload-%1.6f-%u-%u-%u', $], time, $$, 2);
+         my $dbh = DBI->connect("dbi:Sponge:", "", "", { RaiseError => 0 });
+         eval {
+             $dbh->{Profile} = payload_for($marker);
+         };
+         ok !( -e "/tmp/$marker" ), "Set Profile payload";
++        unlink "/tmp/$marker" if -e "/tmp/$marker";
+     }
+ 
+     {
+-        my $marker  = sprintf('dbi-test-payload-%u-%u-%u', time, $$, 1);
++        my $marker = sprintf('dbi-test-payload-%1.6f-%u-%u-%u', $], time, $$, 3);
+         my $payload = payload_for($marker);
+         my $dsn = "dbi:Sponge(Profile=>$payload):";
+         my $dbh = eval {
+             DBI->connect($dsn, "", "", { RaiseError => 0 })
+         };
+         ok !( -e "/tmp/$marker" ), "DSN payload";
++        unlink "/tmp/$marker" if -e "/tmp/$marker";
+     }
+ 
+ };
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index 99e8c209fe..c604e46334 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -13,6 +13,10 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz \
            file://CVE-2014-10402.patch \
            file://CVE-2026-9698.patch \
            file://CVE-2026-10879.patch \
+           file://CVE-2026-14380_p1.patch \
+           file://CVE-2026-14380_p2.patch \
+           file://CVE-2026-14380_p3.patch \
+           file://CVE-2026-14380_p4.patch \
            "
 SRC_URI[md5sum] = "352f80b1e23769c116082a90905d7398"
 SRC_URI[sha256sum] = "8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa"
@@ -43,6 +47,7 @@ RDEPENDS:${PN}:class-target = " \
     perl-module-exporter-heavy \
     perl-module-dynaloader \
     perl-module-io-dir \
+    perl-module-load \
     perl-module-scalar-util \
     perl-module-universal \
 "
-- 
2.35.6


