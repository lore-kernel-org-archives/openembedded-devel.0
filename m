Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3465.1794375519972889080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cKt6Vs15;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4807; q=dns/txt;
  s=iport01; t=1794375520; x=1795585120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AP241zN22NEaq+hOcDRWGGK7n1nygMJk/jopOiEpSaY=;
  b=cKt6Vs15vXStsrae3UwaVDnVesH9eG6g0jWjuYNWiEzf30rWVtogTh2Q
   33howkvAPmfBajjYGPyFsmktX812uONFJGyqo36LQeMXGMXHap2lg684W
   RgxI8xbVV7tuFz+OdjZ2NinC+/pVz2NmoGCKD6x5TJdsVV81sAjPzZwi+
   BDBg2VMFEQSSL1R5UbrauHpODyS64X/ApQwRSZrSlHSztp2xkSqLaacRC
   rYrMQJeiu+9/H9zEbaQ16V3CJq98VZ5dgD7lfYpsh0/Yby/YqsajCvUua
   GGJ5/tfIYswR0NIpo4eSKJByUtDMyyqP8WtxYQJCdj+gfA0DJW160iU3v
   Q==;
X-CSE-ConnectionGUID: Rm/TIDE1QMieZV3kFbutRw==
X-CSE-MsgGUID: 2abzIIp7QOOyI+8S97/OWA==
X-IPAS-Result: =?us-ascii?q?A0BJAgBY/vNq/4r/Ja1aglmCV3VgQ0kDlkgDgROdDxSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOHgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwFGEBwDAQIWGSsjCBmDAgGCdAMRuWKBeTOBA?=
 =?us-ascii?q?YR+2zMBCxQBgTiFQogkXRgBhH0nGxuBcoEVgnN2gQWBXAKBGYEGhgcEgiJ6E?=
 =?us-ascii?q?oFaHox8AoFPhyVIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?IEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+Gwp+GA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?m6DFVA+ASuBQw1cHZMYkkGhEQoog3iMJJU6GjOEBKZuC5h9glmLMZYETYRqg?=
 =?us-ascii?q?Wg8RoETcBWDIglKGQ+OLQwLg2DOWyYyCwMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:iJ0aNKzQwwWCYGUDiwF6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUGx
 2dLWTvUPv+KNjSnfttyYYmzphwE65TVn9RgGgI6q1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaztMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHszerE51ssuOERP+
 M4mczMjZA2fvf3jldpXSsE07igiBNPgMIVavjRryivUSK5/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bM3WjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCwbIeFK4TaHp89ckCw/
 GvM7UXYGk4jE/uO6HnVySPzwcjwtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:juLgsqy/zWnRujXmKTkQKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: =?us-ascii?q?9a23=3AZ8rrmmg7E9fUOXcbl7L8LJtk8zJuSHia8Fb8Dha?=
 =?us-ascii?q?BLGdkeoPOSnGa5b9ejJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AQ4+UGQ6pCOAOFdWUBq+30cDXxowy6q68KWEVzqw?=
 =?us-ascii?q?hnNildnxLamjaqwueF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="545890832"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:38:39 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 09EB0180001D2;
	Wed, 11 Nov 2026 05:38:39 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id A9050CBF204; Tue, 10 Nov 2026 21:38:38 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-oe][wrynose][PATCH 5/5] libdbi-perl: fix CVE-2026-108518
Date: Tue, 10 Nov 2026 21:38:34 -0800
Message-Id: <20261111053834.3702246-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111053834.3702246-1-dkelaiya@cisco.com>
References: <20261111053834.3702246-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132122
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the destructor profiling fix [1] to DBI 1.647 for the
type-confusion crash described in [2]. Accept the inner handle
returned as either a reference or a raw hash during destruction.

Retain the upstream regression and update the older profiling
test's fixed plan to account for the two added assertions.

[1] https://github.com/perl5-dbi/dbi/commit/c2ff4df575d7af625bb4d0d1ef7539f90b22d8b2
[2] https://github.com/perl5-dbi/dbi/security/advisories/GHSA-7393-6f8r-fhh3

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-108518.patch    | 72 +++++++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-108518.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-108518.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-108518.patch
new file mode 100644
index 0000000000..9ec454909a
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-108518.patch
@@ -0,0 +1,72 @@
+From c2ff4df575d7af625bb4d0d1ef7539f90b22d8b2 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Fri, 9 Oct 2026 16:04:53 +0200
+Subject: [PATCH] Prevent dbi_profile crash (Henrik Teichmann)
+
+CVE: CVE-2026-108518
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/c2ff4df575d7af625bb4d0d1ef7539f90b22d8b2]
+
+Backport Changes:
+- Place the new assertions before the older test's exit and update
+  its fixed test plan from 60 to 62; newer subtests are absent.
+- Omit release notes, generated Changes.pm, and dbixs_rev.h updates.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ DBI.xs        |  8 +++++++-
+ t/40profile.t | 16 +++++++++++++++-
+ 2 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index 2bef3cb..a42b597 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -3031,7 +3031,13 @@ dbi_profile(SV *h, imp_xxh_t *imp_xxh, SV *statement_sv, SV *method, NV t1, NV t
+                         dbh_outer_hv = DBIc_MY_H(imp_dbh);
+                         if (SvTYPE(dbh_outer_hv) != SVt_PVHV)
+                             return &PL_sv_undef;        /* presumably global destruction - bail */
+-                        dbh_inner_hv = (HV*)SvRV(dbih_inner(aTHX_ (SV*)dbh_outer_hv, "profile"));
++                        {   /* dbih_inner() returns the inner handle as an RV, except when it was
++                             * given a raw inner HV (DBIc_MY_H() is set to the inner HV while the
++                             * outer handle is being destroyed): then it returns that HV itself,
++                             * and SvRV() on it would return its bucket array (HvARRAY). */
++                            SV *irv = dbih_inner(aTHX_ (SV*)dbh_outer_hv, "profile");
++                            dbh_inner_hv = (HV*)(SvROK (irv) ? SvRV (irv) : irv);
++                        }
+                         if (SvTYPE(dbh_inner_hv) != SVt_PVHV)
+                             return &PL_sv_undef;        /* presumably global destruction - bail */
+                     }
+diff --git a/t/40profile.t b/t/40profile.t
+index 7a71b8f..1eb3151 100644
+--- a/t/40profile.t
++++ b/t/40profile.t
+@@ -31,7 +31,7 @@ BEGIN {
+         if $Config{osvers} =~ /xen/ # eg 2.6.18-4-xen-amd64
+         and $ENV{AUTOMATED_TESTING};
+ 
+-    plan tests => 60;
++    plan tests => 62;
+ }
+ 
+ $Data::Dumper::Indent = 1;
+@@ -458,6 +458,20 @@ is("@$totals", "27.00 2.93 0.11 0.01 0.23 1023110000.00 1023110010.00",
+    'merged time foo/bar');
+ is($total_time, 2.93, 'merged nodes foo/bar time');
+ 
++# The DESTROY of a database handle must be profiled when the Path has {attr} elements.
++# While the outer handle is being destroyed DBIc_MY_H() holds the raw inner HV; dbi_profile() used to
++# call SvRV() on the (raw HV) result of dbih_inner() and so used the hash's bucket array as an HV.
++{
++    my $prof = DBI::Profile->new(Path => [ '{Username}', '!MethodName' ]);
++    my $dbh = DBI->connect("dbi:ExampleP:", 'usrnam', '', { RaiseError => 1, Profile => $prof });
++    $dbh->ping;
++    undef $dbh; # DESTROY of the database handle
++    my $node = $prof->{Data}{usrnam};
++    ok $node && $node->{DESTROY}, 'DESTROY of a database handle is profiled with a {Username} path element';
++    is $node && $node->{DESTROY} ? $node->{DESTROY}[0] : undef, 1, 'exactly one DESTROY call profiled';
++    $prof->{Data} = undef; # no report at exit
++}
++
+ exit 0;
+ 
+ 
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 0b444a7980..5c0826a01b 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -25,6 +25,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-88815_p1.patch \
            file://CVE-2026-88815_p2.patch \
            file://CVE-2026-88816.patch \
+           file://CVE-2026-108518.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6
