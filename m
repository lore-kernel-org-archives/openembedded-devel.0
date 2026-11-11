Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3372.1794375520008595406
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=STBBLqoz;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4005; q=dns/txt;
  s=iport01; t=1794375520; x=1795585120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z5kfGKRBLxRSPm2lduTfiktm4gt6qCfWI5qG/OYi9E0=;
  b=STBBLqozprChh/Dxlqk6dzL1mY1aLxNbFe0xM8Njf+FpXPjww5wjyIrt
   Q2RyBSYwsLTPQ92itR1amt20dMSjLOBWrEh2qc8c9O0R5NTJ36upFVjwT
   9f90AoJOYEdOzGLvqSrv4A5WW2jmHQRleLznmwHiqpa2vnm9LxG1eDO54
   BHxmS3Vfj8NeE6/QWP+6SXRI0SDfJMDsnytvVOJ+DjrBebsul8IHtEqjm
   gi0lHmZ6NXDPN7o8DdqAoa/szrVE3bdp71PHB4pZnLurN2jfY0UjL2grS
   W9xiyCpi3r9EZBBgbYdOT+QIIdL//wwLNRdel7dwogOYDyq+9NPEQnrDT
   A==;
X-CSE-ConnectionGUID: EWiJqeCnSp2nrjGI8VX7Pw==
X-CSE-MsgGUID: W62sfK48Roufibtz4A09/w==
X-IPAS-Result: =?us-ascii?q?A0BHAgBY/vNq/4v/Ja1aglmCV3VgQ0kDlkueIoF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4eAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEbligXkzgQGEftszA?=
 =?us-ascii?q?QsUAYE4hUKIJF0YAUSEOScbG4FygRWDaYEFgVwCiCYEgiJ6EoFaHox8AoFPh?=
 =?us-ascii?q?yVIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHIEegRKBB12BK?=
 =?us-ascii?q?yhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VD?=
 =?us-ascii?q?GcLGgVhCAINDHQ5EDAeJC8FGiY+Gwp+GA1IESw3FRkEPm4Hkm6DFQGBDQErF?=
 =?us-ascii?q?4IVkzWQIIIhoREKKIN4jCSVOhozqnILmH2OCpZRhGqBaDyBWXAVgyIJShkPj?=
 =?us-ascii?q?i0MC4NgzlsmMgsDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:3s4zf6IUiVa5pfcdFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENSgWEFy
 GYfD2GAM/iKMGOgKNEjPoSxoEJX6MWHzNA1SFEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmctajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1DM0AUJIAz/N1vW2dU9
 9M5eA49MSic0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Wojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeSyaIOEJIbXLSlTtnnG/
 HnI3DipOBYHOt2V1SjZ2yr9wfCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:uzA3xqx1efqubl0czHNKKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: =?us-ascii?q?9a23=3AvpDvTWtr7hYPAi54t678IC6Z6IsITXz/1Xr7JXS?=
 =?us-ascii?q?gU2BzSpK0GWGgp5t7xp8=3D?=
X-Talos-MUID: 9a23:i5tq+gj2yFW3HmL2woHg08MpC5ky+KqNVBA3logIusOYJ3BZY2bak2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="547019625"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:38:39 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 0005A180007DB;
	Wed, 11 Nov 2026 05:38:38 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id A146ECBF203; Tue, 10 Nov 2026 21:38:38 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-oe][wrynose][PATCH 4/5] libdbi-perl: fix CVE-2026-88816
Date: Tue, 10 Nov 2026 21:38:33 -0800
Message-Id: <20261111053834.3702246-4-dkelaiya@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132123
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the FetchHashKeyName conversion fix [1] to DBI 1.647 for
the crash described in [2]. Stringify numeric attribute values
before using them as hash-key names.

Use the regression's newly created handle consistently and enable
RaiseError so the invalid-attribute check raises the expected
exception.

[1] https://github.com/perl5-dbi/dbi/commit/70962570212dc60a5428098cf2a0462ad5945851
[2] https://github.com/perl5-dbi/dbi/security/advisories/GHSA-f4qx-mr9m-q2hq

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-88816.patch     | 69 +++++++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88816.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88816.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88816.patch
new file mode 100644
index 0000000000..75cfd22488
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88816.patch
@@ -0,0 +1,69 @@
+From 70962570212dc60a5428098cf2a0462ad5945851 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Thu, 10 Sep 2026 11:26:24 +0200
+Subject: [PATCH] Fix FetchHashKeyName   on IV/NV (CVE-2026-88816) (reported by
+ Raj)
+
+CVE: CVE-2026-88816
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/70962570212dc60a5428098cf2a0462ad5945851]
+
+Backport Changes:
+- Use the regression's fresh handle for its attribute and prepare
+  calls, with RaiseError enabled for the expected exception.
+- Omit release notes, generated Changes.pm, and dbixs_rev.h updates.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ DBI.xs              |  2 +-
+ t/06attrs.t         | 11 +++++++++++
+ t/90sql_type_cast.t |  2 +-
+ 3 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index c3b2386..2bef3cb 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -5351,7 +5351,7 @@ fetchrow_hashref(sth, keyattrib=Nullch)
+     if (!keyattrib || !*keyattrib) {
+         SV *kn = DBIc_FetchHashKeyName(imp_sth);
+         if (kn && SvOK(kn))
+-            keyattrib = SvPVX(kn);
++            keyattrib = SvPV_nolen(kn); /* Also force stringification */
+         else
+             keyattrib = "NAME";
+     }
+diff --git a/t/06attrs.t b/t/06attrs.t
+index 835e7db..3d80559 100644
+--- a/t/06attrs.t
++++ b/t/06attrs.t
+@@ -328,6 +328,17 @@ check_inherited($drh, "ReadOnly", 1, 0);
+ 
+ }
+ 
++{   # CVE-2026-88816
++    my $h = DBI->connect("dbi:ExampleP:", "", "", { RaiseError => 1, PrintError => 0 });
++    $h->{FetchHashKeyName} = 42;
++    my $s = $h->prepare("select mode,size,name from .");
++    $s->execute;
++    my @err;
++    local $SIG{__DIE__} = sub { push @err => @_ };
++    eval { $s->fetchrow_hashref; };
++    like($err[0], qr{Can't use (?:attribute '42'|an undefined)}, "Invalid HashKeyName");
++}
++
+ done_testing();
+ 
+ 1;
+diff --git a/t/90sql_type_cast.t b/t/90sql_type_cast.t
+index ca37f65..0102a06 100644
+--- a/t/90sql_type_cast.t
++++ b/t/90sql_type_cast.t
+@@ -49,7 +49,7 @@ my @tests = (
+      "aa",         SQL_NUMERIC, 0,               NO_CAST_NO_STRICT, q{["aa"]}],
+     ['non numeric cast to numeric (strict)',
+      "aa",         SQL_NUMERIC, DBIstcf_STRICT,  NO_CAST_STRICT,    q{["aa"]}],
+-
++    # CVE-2026-88815
+     ['invalid sql type',
+      99,           123456789,   0,               INVALID_TYPE,      q{[99]}],
+     ['small int cast to int',
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 1e2c4f9933..0b444a7980 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -24,6 +24,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-111879.patch \
            file://CVE-2026-88815_p1.patch \
            file://CVE-2026-88815_p2.patch \
+           file://CVE-2026-88816.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6
