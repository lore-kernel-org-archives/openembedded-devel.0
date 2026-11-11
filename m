Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3371.1794375519992885952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IZUusj/J;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6832; q=dns/txt;
  s=iport01; t=1794375520; x=1795585120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/F0JgaGqm4gdJFkYsBZa7Yd+haM3jVT08ToehVmeTG4=;
  b=IZUusj/JoHvbRC/S2l929Djz8Dpa39IIC9OBayNQhz46J3eS/InFqNgm
   F+++qfkb3rYh2joVCpBpICuuzfGz2QKF8oFw+OD1m4WnXzhB4OAijID0G
   nrmrJghJTzUqZdPA/5qScNn8eYyluvPIRZ0ot9LEixncqv0nAmBdBbf5J
   CEkcJsSSY9HVT0Hty8pNJP7ttWNxgw/av/r7sVpxAKlnDgsNjoik26sUz
   LC1ciMI3ie+HuC/96zOBLBJXWnkQe4OJxW9oBEiBSHw592L0b3/2swGyW
   Lj7/scH7BGTHD+TCGib0CnHMsDZy7HcVGybg0y0ia0nYQsi2NBEPIlDDk
   g==;
X-CSE-ConnectionGUID: 3gbsDerdSJmxB7uOmJjknw==
X-CSE-MsgGUID: /TUtIrmvTZW1GM2oMff8eA==
X-IPAS-Result: =?us-ascii?q?A0CvJwDZ/vNq/47/Ja1aglmCV3VgQ0kDlkgDnQqBGIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4eAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEblngXkzgQGDW?=
 =?us-ascii?q?wWBHtszAQsUAYE4hUKIJF0YAUSEOScbG4FygRWDaYEFgVwCgSeGfwSCInoSg?=
 =?us-ascii?q?VoejHwCgU+HJUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEcg?=
 =?us-ascii?q?R6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCn4YDUgRLDcVGQQ+bgeSb?=
 =?us-ascii?q?oMOB3sTAQckF4FsKZM1kkGhEQoog3iMJJU6GjOqcguYfY4KlgRNhGqBaDyBW?=
 =?us-ascii?q?XAVgyIJShkPji4LC4NgzlsmMgsDLwEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:KD04Cq9jlWcyI1t0ModgDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mdLXmrXPP/YY2amKdolaN61oBtSucPWmNZrSgo6+yhEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtaztNs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2ltMocD1uttDVps8
 Owydy0qazKBhOSplefTpulE3qzPLeHxN48Z/3UlxjbDALN+HNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0cn1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYaLJozTHpUO9qqej
 iX6wnjYGBQECO6gkBWgqHWJiOGfkAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:ZNJwOKB2uopUhtflHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:orzNSm+065Z1DhWyX/mVvxUbENsJf2fR91XVM2XnFEFsar+WT0DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ANAiAXg+cjO3eEUfPTrBBYJaQf4BU3riPEkUTrac?=
 =?us-ascii?q?54uahbytVNTnNgR3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546481383"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:38:39 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id EF6201800020E;
	Wed, 11 Nov 2026 05:38:38 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9B8C9CBF202; Tue, 10 Nov 2026 21:38:38 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/5] libdbi-perl: fix CVE-2026-88815
Date: Tue, 10 Nov 2026 21:38:32 -0800
Message-Id: <20261111053834.3702246-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111053834.3702246-1-dkelaiya@cisco.com>
References: <20261111053834.3702246-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132124
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the numeric-scalar conversion fix [1] to DBI 1.647 for
the crash described in [3]. Stringify SQL_NUMERIC inputs before
passing their buffer and length to grok_number().

Include the declaration-placement follow-up [2] to preserve
compatibility with older C compilers. Retain the upstream tests
and add pure integer and floating-point SQL_NUMERIC assertions.

[1] https://github.com/perl5-dbi/dbi/commit/e5ad87e5602da995d28b4d65df222368b58d6702
[2] https://github.com/perl5-dbi/dbi/commit/ff4f1baf0389dfa5e7282e1d8d7423c1b5e06b76
[3] https://github.com/perl5-dbi/dbi/security/advisories/GHSA-c8vq-w3wr-6979

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-88815_p1.patch  | 85 +++++++++++++++++++
 .../perl/libdbi-perl/CVE-2026-88815_p2.patch  | 40 +++++++++
 .../perl/libdbi-perl_1.647.bb                 |  2 +
 3 files changed, 127 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815_p1.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815_p2.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815_p1.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815_p1.patch
new file mode 100644
index 0000000000..91cdd41d2d
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815_p1.patch
@@ -0,0 +1,85 @@
+From e5ad87e5602da995d28b4d65df222368b58d6702 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Thu, 10 Sep 2026 10:38:30 +0200
+Subject: [PATCH] Fix DBI::sql_type_cast on IV/NV (reported by Raj)
+
+CVE: CVE-2026-88815
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/e5ad87e5602da995d28b4d65df222368b58d6702]
+
+Backport Changes:
+- Add pure IV/NV SQL_NUMERIC regression assertions and adjust the
+  computed test plan to cover the vulnerable conversion path.
+- Omit release notes, generated Changes.pm, and dbixs_rev.h updates.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ DBI.xs              |  4 +++-
+ t/90sql_type_cast.t | 27 +++++++++++++++++++++++++++
+ 2 files changed, 30 insertions(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index f5c7c29..f661db4 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -1985,8 +1985,10 @@ sql_type_cast_svpv(pTHX_ SV *sv, int sql_type, U32 flags, PERL_UNUSED_DECL void
+     /* else no error and sv is untouched */
+     case SQL_NUMERIC:
+         /* based on the code in perl's toke.c */
++        STRLEN len;
++        char *p = SvPV(sv, len); /* force stringify, handle magic */
+         uv = 0;
+-        grok_flags = grok_number(SvPVX(sv), SvCUR(sv), &uv);
++        grok_flags = grok_number(p, len, &uv);
+         cast_ok = 1;
+         if (grok_flags == IS_NUMBER_IN_UV) { /* +ve int */
+             if (uv <= IV_MAX)   /* prefer IV over UV */
+diff --git a/t/90sql_type_cast.t b/t/90sql_type_cast.t
+index f7b23b6..ca37f65 100644
+--- a/t/90sql_type_cast.t
++++ b/t/90sql_type_cast.t
+@@ -49,6 +49,22 @@ my @tests = (
+      "aa",         SQL_NUMERIC, 0,               NO_CAST_NO_STRICT, q{["aa"]}],
+     ['non numeric cast to numeric (strict)',
+      "aa",         SQL_NUMERIC, DBIstcf_STRICT,  NO_CAST_STRICT,    q{["aa"]}],
++
++    ['invalid sql type',
++     99,           123456789,   0,               INVALID_TYPE,      q{[99]}],
++    ['small int cast to int',
++     99,           SQL_INTEGER, 0,               CAST_OK,           q{[99]}],
++    ['2 byte max signed int cast to int',
++     32767,        SQL_INTEGER, 0,               CAST_OK,           q{[32767]}],
++    ['2 byte max unsigned int cast to int',
++     65535,        SQL_INTEGER, 0,               CAST_OK,           q{[65535]}],
++    ['4 byte max signed int cast to int',
++     2147483647,   SQL_INTEGER, 0,               CAST_OK,           q{[2147483647]}],
++    ['4 byte max unsigned int cast to int',
++     4294967295,   SQL_INTEGER, 0,               CAST_OK,           q{[4294967295]}],
++    ['small int cast to int (discard)',
++     99,           SQL_INTEGER, DBIstcf_DISCARD_STRING,
++                                                 CAST_OK,           q{[99]}],
+    );
+ 
+ unless ($pp) {
+@@ -100,6 +116,8 @@ foreach (@tests) {
+     $tests++ if ($dp) && ($_->[2] == SQL_DOUBLE);
+ }
+ 
++$tests += 2; # Pure IV/NV SQL_NUMERIC regressions.
++
+ plan tests => $tests;
+ 
+ foreach my $test(@tests) {
+@@ -154,4 +172,13 @@ foreach my $test(@tests) {
+     }
+ }
+ 
++
++# Exercise SQL_NUMERIC with values that have no string representation.
++my $numeric_iv = 42;
++is(sql_type_cast($numeric_iv, SQL_NUMERIC, 0), CAST_OK,
++   'pure IV cast to SQL_NUMERIC');
++my $numeric_nv = 3.14;
++is(sql_type_cast($numeric_nv, SQL_NUMERIC, 0), CAST_OK,
++   'pure NV cast to SQL_NUMERIC');
++
+ 1;
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815_p2.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815_p2.patch
new file mode 100644
index 0000000000..729d561266
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88815_p2.patch
@@ -0,0 +1,40 @@
+From ff4f1baf0389dfa5e7282e1d8d7423c1b5e06b76 Mon Sep 17 00:00:00 2001
+From: Paul Howarth <paul@city-fan.org>
+Date: Fri, 25 Sep 2026 13:12:18 +0100
+Subject: [PATCH] Fix compatibility with old compilers not handling C99
+ constructs
+
+Scope-level declarations require a C99 compiler. Move declarations back
+to the start of the function to retain compatibility with older compilers.
+
+CVE: CVE-2026-88815
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/ff4f1baf0389dfa5e7282e1d8d7423c1b5e06b76]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ DBI.xs | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index f661db4..c3b2386 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -1953,6 +1953,8 @@ sql_type_cast_svpv(pTHX_ SV *sv, int sql_type, U32 flags, PERL_UNUSED_DECL void
+     int cast_ok = 0;
+     int grok_flags;
+     UV uv;
++    STRLEN len;
++    char *p;
+ 
+     /* do nothing for undef (NULL) or non-string values */
+     if (!sv || !SvOK(sv))
+@@ -1985,8 +1987,7 @@ sql_type_cast_svpv(pTHX_ SV *sv, int sql_type, U32 flags, PERL_UNUSED_DECL void
+     /* else no error and sv is untouched */
+     case SQL_NUMERIC:
+         /* based on the code in perl's toke.c */
+-        STRLEN len;
+-        char *p = SvPV(sv, len); /* force stringify, handle magic */
++        p = SvPV(sv, len); /* force stringify, handle magic */
+         uv = 0;
+         grok_flags = grok_number(p, len, &uv);
+         cast_ok = 1;
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 5d766a29cf..1e2c4f9933 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -22,6 +22,8 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-73193_p2.patch \
            file://CVE-2026-78030.patch \
            file://CVE-2026-111879.patch \
+           file://CVE-2026-88815_p1.patch \
+           file://CVE-2026-88815_p2.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6
