Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3373.1794375526351485394
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TnfB2Ndj;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11263; q=dns/txt;
  s=iport01; t=1794375526; x=1795585126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ImW/V9cloFa1Ri+m92nS/QgyvHlRoUfTEdoq1k2LwVo=;
  b=TnfB2NdjG58gJ/pYNuftVxZpM55IWaPp25mKpVikou8XW1AMI+46xgP4
   9sTmxd/nVx1BK1eAvCUPddKQjo9DwmyquI+/G4eBHvIMgm+J6Xeq8ZZ4E
   06GpyV6B4ccsMyCpHPlOYXCSZd46Zv1FR99tKpVAi5lrV1AdrnGwxJCFg
   40XcODkqUN9TRwvjicZ1xcX5C98/1/CTlUcXtlS5o0wJEAFnJQnEfS9mt
   NLyW+tbiBepoQ4/4bodN4b3hx7f1tOVjaRQ4EwVPJvYQ4C09gVOWO775y
   BqK4cbXvciDD/8utMECzAt5qA4aBcTNLlzuauHFzf+aCJSNnCQ0+mBQ6z
   A==;
X-CSE-ConnectionGUID: saKxHymzQK+yzymMyRJ5yg==
X-CSE-MsgGUID: omhYGcamQja/MKZArKi8AQ==
X-IPAS-Result: =?us-ascii?q?A0BEAgDZ/vNq/5T/Ja1aHgEBCxIMggULgld1YENJA5ZIn?=
 =?us-ascii?q?iWBfg8BAQEPRA0EAQGFBY4gAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBKgsBRiwDAQJaIyGDAgGCdAMRuWeBeTOBAYR+2?=
 =?us-ascii?q?zMBCxQBgTiFQogkXRgBhH0nGxuBcoEVg2mBBYFcAoEXhw8EgiJ6EoFaGAaMf?=
 =?us-ascii?q?AKBT4clSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgRyBHoESg?=
 =?us-ascii?q?QddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8C?=
 =?us-ascii?q?SY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKfhgNSBEsNxUZBD5uB5JugwMLB?=
 =?us-ascii?q?wGBDQEKIRcJXxIKMgMzAQEnBUmSZwoyj2SCIYE1n1wKKIN4jCSPQoV4GjOFW?=
 =?us-ascii?q?6UXC5h9jgqVYSNNhGqBaDyBWXAVgyIJShkPji0MC4NghUEGyRQmMgsDLwEBB?=
 =?us-ascii?q?wIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:LIznIqrezSJULZSs1lTpbp7rVQ5eBmJIZBIvgKrLsJaIsI4StFCzt
 garIBnTa6nZYmWnLY1/b4znpx9VscDVxtFmTAs++Ck9QSoV8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8Uo35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v1+InFu5
 PkKERNOfwKSgsen+pDmW+Y506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXGZsIxR/B/
 DKuE2LRBRQaBfOUwD+88Hvro8z9tDnYWdI7LejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aJ
 0EK9y4Gqakp6FftScHwWRC9qnOIshMQHd1KHIUHBBql0KHY5UOdQ2MDVDMEMYVgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:VKuISq+BtNwpmigy/jluk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:xc6gCW/AdwaCXTBVrByVv1UdOdAFY3jP9VSTMl2pDEN4cp/IWFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AYHhIAg6sS5mON6EvdDcj8Eb4xoxv5qSfJ0sElKw?=
 =?us-ascii?q?Eso6hFh5ZIRSc3B2OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546531128"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:38:39 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id EA54B18000147;
	Wed, 11 Nov 2026 05:38:38 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 92491CC1611; Tue, 10 Nov 2026 21:38:38 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/5] libdbi-perl: fix CVE-2026-78030
Date: Tue, 10 Nov 2026 21:38:30 -0800
Message-Id: <20261111053834.3702246-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132126
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the module-name validation fix [1] to DBI 1.647 for the
arbitrary module loading issue described in [2]. Validate dbm_type
and dbm_mldbm before loading the selected backend or serializer.

Retain the upstream regression tests and optional Params::Util
fallback. Module::Load is already a recipe runtime dependency.

[1] https://github.com/perl5-dbi/dbi/commit/315c6ce703b8b3cbe9188062d9ec80730293554a
[2] https://github.com/perl5-dbi/dbi/security/advisories/GHSA-wqmw-wqwx-3fr7

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-78030.patch     | 268 ++++++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |   1 +
 2 files changed, 269 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-78030.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-78030.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-78030.patch
new file mode 100644
index 0000000000..5a2fbf9a4b
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-78030.patch
@@ -0,0 +1,268 @@
+From 315c6ce703b8b3cbe9188062d9ec80730293554a Mon Sep 17 00:00:00 2001
+From: Robert Rothenberg <perl@rhizomnic.com>
+Date: Sat, 22 Aug 2026 01:37:15 +0100
+Subject: [PATCH] Load serializer class using Module::Load (CVE-2026-78030)
+
+This replaces calls to require with Module::Load, and adds specific
+checks that arguments are module names instead of filenames.
+
+Instead of using our own regex matcher, we attempt to use the
+Params::Util _CLASS function. The style of trying to import it or adding
+our own is based on similar code in DBD::File. (This uses SPDX
+annotations to indicate where the code comes from.)
+
+This also adds a suggestion for Params::Util in Makefile.PL.
+
+Note that code of the form
+
+    $INC{"$tie_type.pm"} or require "$tie_type.pm"
+
+is redundant, since require checks %INC.
+
+See also the similar vulnerability to the DBI::Profile vulnerability
+CVE-2026-14380 in commit b73d5d9901767fc1d16b6661ef08fbed4532e259.
+
+CVE: CVE-2026-78030
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/315c6ce703b8b3cbe9188062d9ec80730293554a]
+
+Assisted-By: Claude Opus 5 (1M context) <noreply@anthropic.com>
+
+Signed-off-by: Robert Rothenberg <rrwo@cpansec.org>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ MANIFEST              |   1 +
+ Makefile.PL           |   1 +
+ lib/DBD/DBM.pm        |  34 ++++++++++---
+ t/53dbm_module_name.t | 115 ++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 144 insertions(+), 7 deletions(-)
+ create mode 100644 t/53dbm_module_name.t
+
+diff --git a/MANIFEST b/MANIFEST
+index 23858dc..d7f8e4e 100644
+--- a/MANIFEST
++++ b/MANIFEST
+@@ -107,6 +107,7 @@ t/49dbd_file.t			DBD::File API and very basic tests
+ t/50dbm_simple.t		simple DBD::DBM tests
+ t/51dbm_file.t			extended DBD::File tests (through DBD::DBM)
+ t/52dbm_complex.t		Complex DBD::DBM tests with SQL::Statement
++t/53dbm_module_name.t		dbm_type / dbm_mldbm must name a module, not a path
+ t/53sqlengine_adv.t
+ t/54_dbd_mem.t
+ t/60preparse.t
+diff --git a/Makefile.PL b/Makefile.PL
+index 3bba048..2ad475a 100644
+--- a/Makefile.PL
++++ b/Makefile.PL
+@@ -76,6 +76,7 @@ my %opts = (
+ 	suggests              => {
+ 	    "RPC::PlServer"   => 0.2020,
+ 	    "Net::Daemon"     => 0,
++	    "Params::Util"    => '1.100',
+ 	    "SQL::Statement"  => 1.414,
+ 	    "Clone"           => 0.47,
+ 	    "MLDBM"           => 0,
+diff --git a/lib/DBD/DBM.pm b/lib/DBD/DBM.pm
+index f77e98a..26b1497 100644
+--- a/lib/DBD/DBM.pm
++++ b/lib/DBD/DBM.pm
+@@ -59,6 +59,21 @@ sub CLONE
+     undef $drh;
+ }
+ 
++if (eval { require Params::Util; }) {
++    Params::Util->import ("_CLASS");
++} else {
++    # SPDX-SnippetBegin
++    # SPDX-SnippetCopyrightText: 2005-2012 Adam Kennedy. 2020 Jens Rehsack.
++    # SPDX-License-Identifier: Artistic-1.0-Perl
++    # SPDX-PackageName: pkg:cpan/Params-Util@1.102
++    # SPDX-Description: taken from Params::Util::PP 1.102
++    *_CLASS = sub {
++        my $arg = $_[0];
++        return (defined $arg and not ref $arg and $arg =~ m/^[^\W\d]\w*(?:::\w+)*\z/s) ? $arg : undef;
++    };
++    # SPDX-SnippetEnd
++}
++
+ #####################
+ package DBD::DBM::dr;
+ #####################
+@@ -77,7 +92,8 @@ package DBD::DBM::db;
+ our $imp_data_size = 0;
+ our @ISA           = qw(DBD::File::db);
+ 
+-use Carp qw/carp/;
++use Carp;
++use Module::Load ();
+ 
+ sub validate_STORE_attr
+ {
+@@ -189,10 +205,9 @@ sub get_dbm_versions
+         };
+         eval {
+             my $ser_class = "MLDBM::Serializer::" . $meta->{dbm_mldbm};
+-            my $ser_mod   = $ser_class;
+-            $ser_mod =~ s|::|/|g;
+-            $ser_mod .= ".pm";
+-            require $ser_mod;
++            DBD::DBM::_CLASS($ser_class)
++                or croak "Invalid dbm_mldbm '$ser_class': expected a module name";
++            Module::Load::load $ser_class;
+             $dver = $ser_class->VERSION();
+             $dtype .= ' + ' . $ser_class;    # (*)
+             $dver and $dtype .= " ($dver)";  # (*)
+@@ -253,6 +268,7 @@ package DBD::DBM::Table;
+ ########################
+ use Carp;
+ use Fcntl;
++use Module::Load ();
+ 
+ our @ISA = qw(DBD::File::Table);
+ 
+@@ -318,12 +334,14 @@ sub init_table_meta
+     unless ( defined( $meta->{dbm_tietype} ) )
+     {
+         my $tie_type = $meta->{dbm_type};
+-        $INC{"$tie_type.pm"} or require "$tie_type.pm";
++        DBD::DBM::_CLASS($tie_type)
++            or croak "Invalid dbm_type '$tie_type': expected a module name";
++        Module::Load::load $tie_type;
+         $tie_type eq 'BerkeleyDB' and $tie_type = 'BerkeleyDB::Hash';
+ 
+         if ( $meta->{dbm_mldbm} )
+         {
+-            $INC{"MLDBM.pm"} or require "MLDBM.pm";
++            Module::Load::load "MLDBM";
+             $meta->{dbm_usedb} = $tie_type;
+             $tie_type = 'MLDBM';
+         }
+@@ -389,6 +407,8 @@ sub open_data
+         {
+             $MLDBM::UseDB      = $meta->{dbm_usedb};
+             $MLDBM::Serializer = $meta->{dbm_mldbm};
++            DBD::DBM::_CLASS($MLDBM::Serializer)
++                or croak "Invalid dbm_mldbm '${MLDBM::Serializer}': expected a module name";
+         }
+ 
+         $meta->{hash} = {};
+diff --git a/t/53dbm_module_name.t b/t/53dbm_module_name.t
+new file mode 100644
+index 0000000..e331fa4
+--- /dev/null
++++ b/t/53dbm_module_name.t
+@@ -0,0 +1,115 @@
++#!perl -w
++# dbm_type and dbm_mldbm name a Perl module, never a file path.
++#
++# Both attributes reach require(). require() treats a path-shaped string as a
++# literal file and never consults @INC, so without a grammar check a caller
++# who influences either attribute can make the process load -- and therefore
++# execute -- a .pm from anywhere on the filesystem.
++#
++# The two "rejected" cases below fail on an unvalidated DBD::DBM: the planted
++# module gets loaded and sets the flag. The two "still works" cases pin the
++# behaviour the check must not break.
++
++use strict;
++use warnings;
++
++require DBD::DBM;
++
++use DBI;
++use File::Path qw(mkpath);
++use File::Spec;
++use File::Temp qw(tempdir);
++use Test::More;
++
++my $dir = tempdir( CLEANUP => 1 );
++my $dbdir = File::Spec->catdir( $dir, 'db' );
++mkpath($dbdir);
++
++# A module planted outside @INC. Loading it is observable and can happen for
++# exactly one reason: something required this path.
++my $plant = File::Spec->catfile( $dir, 'DbmPlant.pm' );
++open( my $fh, '>', $plant ) or plan skip_all => "cannot write $plant: $!";
++print {$fh} "\$::DBM_PLANT_LOADED = 1;\n1;\n";
++close($fh);
++
++( my $plant_noext = $plant ) =~ s/\.pm\z//;
++
++my $have_mldbm = eval { require 'MLDBM.pm'; 1 };
++
++# --- dbm_type must not name a path --------------------------------------
++{
++    local $::DBM_PLANT_LOADED = 0;
++    my $dbh = DBI->connect( "dbi:DBM:f_dir=$dbdir", undef, undef,
++                            { RaiseError => 0, PrintError => 0 } );
++    $dbh->{dbm_type} = $plant_noext;
++    eval { $dbh->do("CREATE TABLE t_reject (id INT, v CHAR(8))"); 1 };
++    ok( !$::DBM_PLANT_LOADED,
++        "a path-shaped dbm_type does not load the file it names" );
++    $dbh->disconnect;
++}
++
++# The same path with its ".pm" suffix left on. This is the case a loader
++# swap alone does not cover: Module::Load treats anything outside [\w:'] as a
++# filename and requires it verbatim, so "/path/Evil" fails only because no
++# such file exists -- "/path/Evil.pm" loads.
++{
++    local $::DBM_PLANT_LOADED = 0;
++    my $dbh = DBI->connect( "dbi:DBM:f_dir=$dbdir", undef, undef,
++                            { RaiseError => 0, PrintError => 0 } );
++    $dbh->{dbm_type} = $plant;
++    eval { $dbh->do("CREATE TABLE t_reject_pm (id INT, v CHAR(8))"); 1 };
++    ok( !$::DBM_PLANT_LOADED,
++        "a dbm_type naming a .pm file directly does not load it" );
++    $dbh->disconnect;
++}
++
++# --- dbm_type still accepts a real DBM implementation -------------------
++{
++    my $dbh = DBI->connect( "dbi:DBM:f_dir=$dbdir;dbm_type=SDBM_File", undef, undef,
++                            { RaiseError => 1, PrintError => 0 } );
++    $dbh->do("CREATE TABLE t_ok (id INT, v CHAR(8))");
++    $dbh->do("INSERT INTO t_ok VALUES (1, 'hello')");
++    my ($v) = $dbh->selectrow_array("SELECT v FROM t_ok WHERE id = 1");
++    is( $v, 'hello', "dbm_type=SDBM_File still round-trips a row" );
++    $dbh->disconnect;
++}
++
++# --- dbm_mldbm must not escape the MLDBM::Serializer:: prefix ------------
++SKIP: {
++    skip "MLDBM not installed", 1 unless $have_mldbm;
++
++    # "MLDBM::Serializer::" only looks like containment. s|::|/|g rewrites
++    # "::" and leaves a literal "/" alone, and MLDBM ships MLDBM/Serializer/
++    # into @INC, so every component of a traversal out of it exists.
++    my ($inc) = grep { -d File::Spec->catdir( $_, 'MLDBM', 'Serializer' ) } @INC;
++    skip "no \@INC entry holds MLDBM/Serializer/", 1 unless defined $inc;
++
++    my @up = File::Spec->splitdir( File::Spec->canonpath($inc) );
++    shift(@up) while ( @up && $up[0] eq '' );
++    my $escape = ( '../' x ( scalar(@up) + 2 ) ) . substr( $plant_noext, 1 );
++
++    local $::DBM_PLANT_LOADED = 0;
++    my $dbh = DBI->connect( "dbi:DBM:f_dir=$dbdir;dbm_type=SDBM_File", undef, undef,
++                            { RaiseError => 0, PrintError => 0,
++                              dbm_mldbm   => $escape } );
++    eval {
++        $dbh->do("CREATE TABLE t_ser (id INT, v CHAR(8))");
++        $dbh->func( 't_ser', 'dbm_versions' );
++        1;
++    };
++    ok( !$::DBM_PLANT_LOADED,
++        "a dbm_mldbm that traverses out of MLDBM::Serializer:: does not load the file it names" );
++    $dbh->disconnect;
++}
++
++# --- dbm_mldbm still accepts a real serializer name ---------------------
++{
++    my $dbh = DBI->connect( "dbi:DBM:f_dir=$dbdir;dbm_type=SDBM_File", undef, undef,
++                            { RaiseError => 0, PrintError => 0 } );
++    my $versions = eval { $dbh->func( 'dbm_versions' ) };
++    ok( defined $versions && length $versions,
++        "dbm_versions() still reports for an unmodified handle" );
++    $dbh->disconnect;
++}
++
++done_testing;
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 03be7eabea..e2760d84d5 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -20,6 +20,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-73194_p3.patch \
            file://CVE-2026-73193_p1.patch \
            file://CVE-2026-73193_p2.patch \
+           file://CVE-2026-78030.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6
