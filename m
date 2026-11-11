Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3466.1794375520104741194
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Qe3SqPyW;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9851; q=dns/txt;
  s=iport01; t=1794375520; x=1795585120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Krdsy0JTAEF0OvNR9nccPPtNQpPzXBVuEzpg67ZSESM=;
  b=Qe3SqPyWtek4VhneGVwLEmLo5QESaO6yJMK554Dl0CGz7A5VvB67y6Lq
   pg3DF/yqNKT4ghbN+JPMliiFaHcNE7Pa8HwEZ3au6A8el2OyKVY79QX0l
   KsOhRq2+Fa7OmqkXvMqYd67DfgJtcJGueGaxQvUzVhWTsfkPoiIK+r8Tq
   WIOblPwK1PHawsSA2VSsP4i9qrGGMkAHRKOv4TfkYAJoVLdlVy6J2a+6C
   qV2uZkDYzrggyLD+mk0tTN2J+0xTZMJT+llzw6ghaJxLVbMByRPvWOTAe
   8YvJv771Nh5/bWmrssKWFyP328K5lB5ULwXmxUCGrNaAiZdmSpEjSWVPi
   A==;
X-CSE-ConnectionGUID: Xjmi8UTSRfmIk2O+YowORQ==
X-CSE-MsgGUID: bTlnixjfQkCHC8I9VtORWQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgDZ/vNq/4v/Ja1SCB4BAQsSDIIFC4JXdWBDSQOWS?=
 =?us-ascii?q?AOeIoF+DwEBAQ9EDQQBAYUFAo4eAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEblng?=
 =?us-ascii?q?XkzgQGEftszAQsUAYE4hUKIJF0YAYR9JxsbgXKBFYE7gi6BBYFcAoE5D4ZeB?=
 =?us-ascii?q?IIiehKBWh6MfAKBT4clSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgRyBHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKfhgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5JugiJyAQFPNAoBExMFFz0rEjw2KZMuBwIBBwooj2SCIYE1n1wKKIN4j?=
 =?us-ascii?q?CSPQoV4GjOFW6UXC5h9jgqVaRtNhGqBaDxGgRNwFYMiCUoZD44tDAuDYIVHy?=
 =?us-ascii?q?RQmMgsDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:rGI3/KJF495FTqd2FE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENS0TcOz
 moeXDvUPP2JN2unfN9yYYji/BsEuJ/cyNQwSQQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmctajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1eDkQ3bbAkwdx5BEBNr
 9tbGTcSSSq60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Wojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeSwboeNIo3XLSlTtkyko
 mTH72b3OxIxFPfP6Gu77lWWudaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:guDt7atAXrBAheFgBLHAkygQ7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:wu+jqGwgOLG3s25myLBHBgUkGMUkIkDh903eJm67U0EqebqKbmWprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AmB+AUQxgpXZ9IbO8aJGd1HssTc2aqK6SDEYMgZc?=
 =?us-ascii?q?IgsqvFQcgGmajkBONfbZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="545650095"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:38:39 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id EB4F1180007D4;
	Wed, 11 Nov 2026 05:38:38 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9689DCBF201; Tue, 10 Nov 2026 21:38:38 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/5] libdbi-perl: fix CVE-2026-111879
Date: Tue, 10 Nov 2026 21:38:31 -0800
Message-Id: <20261111053834.3702246-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111053834.3702246-1-dkelaiya@cisco.com>
References: <20261111053834.3702246-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132125
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the lock cleanup fix [1] to DBI 1.647 after the
CVE-2026-78030 backport. Reject invalid serializer names before
acquiring a table lock and release the lock when opening a table
fails, addressing the denial of service described in [2].

Retain the nonblocking-lock regression. Include the helper's
explicit unlock from [3] and serializer test cleanup from [4].
Keep the existing DBD::File version and adjust the optional MLDBM
skip counts for the additional assertion.

[1] https://github.com/perl5-dbi/dbi/commit/99bbf2ab9d137e6f042a770bd3bbba3bc0b3a901
[2] https://github.com/perl5-dbi/dbi/security/advisories/GHSA-8cx8-9vj9-9x7j
[3] https://github.com/perl5-dbi/dbi/commit/cd1172e92c8a40f0070c881055c080095d8cb48a
[4] https://github.com/perl5-dbi/dbi/commit/291a494d0968da9af1a27292d713d17a608a7398

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-111879.patch    | 195 ++++++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-111879.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-111879.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-111879.patch
new file mode 100644
index 0000000000..8a18c082b8
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-111879.patch
@@ -0,0 +1,195 @@
+From 99bbf2ab9d137e6f042a770bd3bbba3bc0b3a901 Mon Sep 17 00:00:00 2001
+From: Robert Rothenberg <perl@rhizomnic.com>
+Date: Sat, 17 Oct 2026 12:10:51 +0100
+Subject: [PATCH] fix: validate DBD::DBM MLDBM serializer before lock file is
+ created (CVE-2026-111879)
+
+This was a bug introduced by the fix for CVE-2026-78030.
+
+The exception unwound DBI::DBD::SqlEngine::Table::new before the Table object
+was blessed, so no DESTROY ever releases the lock, while $meta (with the
+open, locked lockfh) stays cached in $dbh->{sql_meta}{t_ser}. The next
+open of the table opens a second descriptor on the same .lck and blocks in
+flock() -- forever, because the holder is the same process.
+
+Why only the Gofer variant hung: in plain mode the DROP reuses the same
+$meta, so DBD::File's $meta->{lockfh} = $fh drops the old handle (and
+with it the lock) just before it calls flock. Under Gofer the DROP is
+served by a different server-side dbh with its own fresh $meta, so the
+stale handle is never replaced. The same thing happens without Gofer for
+any second handle or any second process: a separate process doing
+SELECT * FROM t_ser blocks until the first process exits (measured on
+1.652, 1.655 and master).
+
+This change also factors out code for releasing the lock into a separate
+method that is used by DESTROY.
+
+The version for DBD::File is bumped.
+
+CVE: CVE-2026-111879
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/99bbf2ab9d137e6f042a770bd3bbba3bc0b3a901]
+
+Backport Changes:
+- Retained DBD::File version 0.44 and omitted release notes.
+- Adapted the lock helper to the older close-only cleanup paths.
+- Included the flock(..., 0) call from [1] in the lock helper.
+- Added serializer DROP cleanup from [2] for the lock regression.
+- Set both MLDBM skip counts to two for the added lock check.
+
+[1] https://github.com/perl5-dbi/dbi/commit/cd1172e92c8a40f0070c881055c080095d8cb48a
+[2] https://github.com/perl5-dbi/dbi/commit/291a494d0968da9af1a27292d713d17a608a7398
+
+Assisted-By: Claude Mythos 5.1 <noreply@anthropic.com>
+
+Signed-off-by: Robert Rothenberg <perl@rhizomnic.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/DBD/DBM.pm        | 24 ++++++++++++++++++++----
+ lib/DBD/File.pm       | 23 +++++++++++++----------
+ t/53dbm_module_name.t | 20 ++++++++++++++++++--
+ 3 files changed, 51 insertions(+), 16 deletions(-)
+
+diff --git a/lib/DBD/DBM.pm b/lib/DBD/DBM.pm
+index 26b1497..1f21dcd 100644
+--- a/lib/DBD/DBM.pm
++++ b/lib/DBD/DBM.pm
+@@ -367,6 +367,17 @@ sub init_table_meta
+ sub open_data
+ {
+     my ( $className, $meta, $attrs, $flags ) = @_;
++
++    # Validate dbm_mldbm BEFORE SUPER::open_data creates and flock()s the
++    # lock file.  A croak after that point leaves $meta->{lockfh} holding an
++    # exclusive lock for as long as the table meta data lives, and the next
++    # open of the same table in this process blocks on it forever.
++    if ( $meta->{dbm_mldbm} and not $flags->{dropMode} )
++    {
++        DBD::DBM::_CLASS( $meta->{dbm_mldbm} )
++            or croak "Invalid dbm_mldbm '$meta->{dbm_mldbm}': expected a module name";
++    }
++
+     $className->SUPER::open_data( $meta, $attrs, $flags );
+ 
+     unless ( $flags->{dropMode} )
+@@ -407,15 +418,20 @@ sub open_data
+         {
+             $MLDBM::UseDB      = $meta->{dbm_usedb};
+             $MLDBM::Serializer = $meta->{dbm_mldbm};
+-            DBD::DBM::_CLASS($MLDBM::Serializer)
+-                or croak "Invalid dbm_mldbm '${MLDBM::Serializer}': expected a module name";
+         }
+ 
+         $meta->{hash} = {};
+         my $tie_class = $meta->{dbm_tietype};
+         eval { tie %{ $meta->{hash} }, $tie_class, @tie_args };
+-        $@ and croak "Cannot tie(\%h $tie_class @tie_args): $@";
+-        -f $meta->{f_fqfn} or croak( "No such file: '" . $meta->{f_fqfn} . "'" );
++        if ( $@ or not -f $meta->{f_fqfn} )
++        {
++            # Release the lock SUPER::open_data took, or it outlives this
++            # failure (see above).
++            my $err = $@ ? "Cannot tie(\%h $tie_class @tie_args): $@"
++                         : "No such file: '" . $meta->{f_fqfn} . "'";
++            $className->_release_lock($meta);
++            croak $err;
++        }
+     }
+ 
+     unless ( $flags->{createMode} )
+diff --git a/lib/DBD/File.pm b/lib/DBD/File.pm
+index 3647acd..e3d27d7 100644
+--- a/lib/DBD/File.pm
++++ b/lib/DBD/File.pm
+@@ -894,18 +894,24 @@ sub open_data {
+ sub drop ($) {
+     my ($self, $data) = @_;
+     my $meta = $self->{meta};
+-    # We have to close the file before unlinking it: Some OS'es will
+-    # refuse the unlink otherwise.
+-    $meta->{fh} and $meta->{fh}->close ();
+-    $meta->{lockfh} and $meta->{lockfh}->close ();
+-    undef $meta->{fh};
+-    undef $meta->{lockfh};
++    $self->_release_lock($meta);
+     $meta->{f_fqfn} and unlink $meta->{f_fqfn}; # XXX ==> sql_data_source
+     $meta->{f_fqln} and unlink $meta->{f_fqln}; # XXX ==> sql_data_source
+     delete $data->{Database}{sql_meta}{$self->{table}};
+     return 1;
+     } # drop
+ 
++sub _release_lock {
++    my ($self, $meta) = @_;
++    # We have to close the file before unlinking it: Some OS'es will
++    # refuse the unlink otherwise.
++    $meta->{fh}     and $meta->{fh}->close ();
++    $meta->{lockfh} and eval { flock $meta->{lockfh}, 0 };
++    $meta->{lockfh} and $meta->{lockfh}->close ();
++    undef $meta->{fh};
++    undef $meta->{lockfh};
++}
++
+ sub seek ($$$$) {
+     my ($self, $data, $pos, $whence) = @_;
+     my $meta = $self->{meta};
+@@ -931,10 +937,7 @@ sub truncate ($$) {
+ sub DESTROY {
+     my $self = shift;
+     my $meta = $self->{meta};
+-    $meta->{fh} and $meta->{fh}->close ();
+-    $meta->{lockfh} and $meta->{lockfh}->close ();
+-    undef $meta->{fh};
+-    undef $meta->{lockfh};
++    $self->_release_lock($meta);
+ 
+     $self->SUPER::DESTROY();
+     } # DESTROY
+diff --git a/t/53dbm_module_name.t b/t/53dbm_module_name.t
+index e331fa4..7707b18 100644
+--- a/t/53dbm_module_name.t
++++ b/t/53dbm_module_name.t
+@@ -20,6 +20,7 @@ use File::Path qw(mkpath);
+ use File::Spec;
+ use File::Temp qw(tempdir);
+ use Test::More;
++use Fcntl qw(:flock);
+ 
+ my $dir = tempdir( CLEANUP => 1 );
+ my $dbdir = File::Spec->catdir( $dir, 'db' );
+@@ -76,13 +77,13 @@ my $have_mldbm = eval { require 'MLDBM.pm'; 1 };
+ 
+ # --- dbm_mldbm must not escape the MLDBM::Serializer:: prefix ------------
+ SKIP: {
+-    skip "MLDBM not installed", 1 unless $have_mldbm;
++    skip "MLDBM not installed", 2 unless $have_mldbm;
+ 
+     # "MLDBM::Serializer::" only looks like containment. s|::|/|g rewrites
+     # "::" and leaves a literal "/" alone, and MLDBM ships MLDBM/Serializer/
+     # into @INC, so every component of a traversal out of it exists.
+     my ($inc) = grep { -d File::Spec->catdir( $_, 'MLDBM', 'Serializer' ) } @INC;
+-    skip "no \@INC entry holds MLDBM/Serializer/", 1 unless defined $inc;
++    skip "no \@INC entry holds MLDBM/Serializer/", 2 unless defined $inc;
+ 
+     my @up = File::Spec->splitdir( File::Spec->canonpath($inc) );
+     shift(@up) while ( @up && $up[0] eq '' );
+@@ -99,6 +100,21 @@ SKIP: {
+     };
+     ok( !$::DBM_PLANT_LOADED,
+         "a dbm_mldbm that traverses out of MLDBM::Serializer:: does not load the file it names" );
++
++    # The rejection must happen before the table's lock file is created and
++    # flock()ed.  Otherwise the lock outlives the failed CREATE and every
++    # later open of the table in this process blocks on it: the DROP below
++    # hung under DBI_AUTOPROXY=dbi:Gofer:transport=null, where the dbh that
++    # serves the DROP is not the one holding the stale lock.
++    my $lck  = File::Spec->catfile( $dbdir, "t_ser.lck" );
++    my $free = 1;
++    if ( -f $lck and open( my $lfh, "<", $lck ) )
++    {
++        $free = flock( $lfh, LOCK_EX | LOCK_NB ) ? 1 : 0;
++        close($lfh);
++    }
++    ok( $free, "a rejected dbm_mldbm does not leave the table's lock file locked" );
++    eval { $dbh->do( "DROP TABLE t_ser" ); 1 };
+     $dbh->disconnect;
+ }
+ 
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index e2760d84d5..5d766a29cf 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -21,6 +21,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-73193_p1.patch \
            file://CVE-2026-73193_p2.patch \
            file://CVE-2026-78030.patch \
+           file://CVE-2026-111879.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6
