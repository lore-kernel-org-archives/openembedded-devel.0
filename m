Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615E8CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:54:30 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32294.1792040060883025091
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 21:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fRlyVmco;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8571; q=dns/txt;
  s=iport01; t=1792040060; x=1793249660;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iyg8ATptB7kOlAG8C5FV7jCd2fbQkERaRy6M7sxiWsQ=;
  b=fRlyVmcoRkN0Y3Qc7SApaTI0uea216L+4FDJbB0u5GBCJ2ez7SEIV/SO
   pOHISLETg0mkRH7JJibMuJOnzpudNaj2t9vuelV3Kj0briYGJTHzaK9h0
   wBjx1HDCwVEby7vZWaZ+MCZAAbeFVG6MXHPM2tkVREnXEVlxUbwLRZ2At
   t1+Ag8AZMtNvRZ53qdEHLZ/5Q/e5cfM3H5y01k4yBjM1Bt+OwNSBrZQol
   xisaCVedZgq0VGG3Gve1MSoO3vGQ/y5aOwCs4SrlcYmEPvXHLal3NenTG
   XIC71+8x8HVnsQzYBjsTWQy9HbM7Ri9D9hmv9AnshCGkcg/5ZTZTtFGUr
   Q==;
X-CSE-ConnectionGUID: ctARUwEsS/y/LD//yYcifA==
X-CSE-MsgGUID: jw2ynt+VTIygPkgX8AVWvA==
X-IPAS-Result: =?us-ascii?q?A0BFAgAoW9Bq/5P/Ja1aglmCV3VgQ0kDlkeeHYF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFjhYCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThhUIMg2QEgECASoLAUYsAwECWiMhgwIBgjoDNwMRulKBeTOBAYNpAkNQ2?=
 =?us-ascii?q?zIBCxQBgTiFQIgjXRgBhHwnGxuBcoR+gQWBGkICgScRhm0EgiJ6EoFaHoJtk?=
 =?us-ascii?q?iVIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6g?=
 =?us-ascii?q?QlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4P?=
 =?us-ascii?q?AkoQRcMcwwdBXIIAg0JDRgNSBEsNxUZBD5uB5F8HoJlgQ4BK4EFgQgfkz+SN?=
 =?us-ascii?q?6EPCiiDdowilToaM4QEgVelFAuYfYJZizGVND9dhGmBaDyBWXAVgyIJShkPi?=
 =?us-ascii?q?VyEUgsLg2CFR8kTJzILAy8BAQcCBw4DC4FokAABJ4FWAQE?=
IronPort-Data: A9a23:Ahb0oaAJewQIRhVW/3niw5YqxClBgxIJ4kV8jS/XYbTApGwn02QAm
 GcZWjrSbP2DM2Oged1+Otiyp0IPvZTczYI1OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf8hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEyOlHNnwpEJYjvfcwJU0Js
 u0pIzEDR0XW7w626OrTpuhEnM8vKozveYgYoHwllGmfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYwBPjDS0Un1lM/BJEzmO6pl3DXeDxDo1XTrq0yi4TW5FEqjeazb4SOKrRmQ+1XgRyJo
 H6FwVjYEx4iN9OvmRO7zWyF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:R1o0YKHkkGFazLiMpLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:kq1iX25VLxDoSPmvNdss/1I9IP06X2bmi2aXB2P/TndYQ7ybYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AXA2sIwzj9goujyyss0wkbDn4xV6aqKaxUlELjdY?=
 =?us-ascii?q?4h+iVOhRzNAfNpQqIXKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="535667638"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 04:54:20 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id CEC4D18000273;
	Thu, 15 Oct 2026 04:54:19 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 42034CC1611; Wed, 14 Oct 2026 21:54:19 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/2] libdbi-perl: fix CVE-2026-73194
Date: Wed, 14 Oct 2026 21:53:52 -0700
Message-Id: <20261015045353.236229-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 04:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130914

From: Darsh Kelaiya <dkelaiya@cisco.com>

These patches apply the upstream fix as referenced in [2], using the
commit shown in [1]. The overflow correction [3] and portable 32-bit
regression assertion [4] are separate patches.

[1] https://github.com/perl5-dbi/dbi/commit/29b72ae7d2a8114a734a55840bf1c45b89207809
[2] https://access.redhat.com/security/cve/cve-2026-73194
[3] https://github.com/perl5-dbi/dbi/commit/9ffafab2369d7214f88967645feb3beadb900712
[4] https://github.com/perl5-dbi/dbi/commit/acc903db3086a737936643a5dbbc0e22f9d5c421

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-73194_p1.patch  | 80 +++++++++++++++++++
 .../perl/libdbi-perl/CVE-2026-73194_p2.patch  | 37 +++++++++
 .../perl/libdbi-perl/CVE-2026-73194_p3.patch  | 34 ++++++++
 .../perl/libdbi-perl_1.647.bb                 |  3 +
 4 files changed, 154 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p1.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p2.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p3.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p1.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p1.patch
new file mode 100644
index 0000000000..e2aeab9130
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p1.patch
@@ -0,0 +1,80 @@
+From 0ddf850ca8e31344cb8bd50f11f950328e23da0b Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Tue, 11 Aug 2026 14:30:58 +0200
+Subject: [PATCH] Force placeholder limit on :# and :p# too (CVE-2026-73194)
+
+CVE: CVE-2026-73194
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/29b72ae7d2a8114a734a55840bf1c45b89207809]
+
+Backport Changes:
+- Adjusted the test plan: 39 existing + 12 added = 51 tests.
+- Omitted ChangeLog and Changes.pm release notes for DBI 1.652.
+- Omitted the dbixs_rev.h timestamp and revision update, which does
+  not affect the preparse fix.
+
+(cherry picked from commit 29b72ae7d2a8114a734a55840bf1c45b89207809)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ DBI.xs         | 10 +++++++++-
+ t/60preparse.t | 15 ++++++++++++++-
+ 2 files changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index da5d137..cfc241b 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4392,9 +4392,17 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+         }
+         else if (isDIGIT(*src)) {   /* :1 */
+             const int pln = atoi(src);
++
++            if (pln > 99999 || pln <= 0) {
++                char buf[99];
++                sprintf(buf, "preparse found :p%d which is outside the allowed range.", pln);
++                set_err_char(dbh, imp_xxh, "1", 1, buf, 0, "preparse");
++                return &PL_sv_undef;
++            }
++
+             style = ":1";
+ 
+-            if (PS_return(DBIpp_ph_cn)) { /* ':1'->':p1'  */
++            if (PS_return(DBIpp_ph_cn)) { /* ':1'-> ':p1'  */
+                 idx = pln;
+                 *dest++ = 'p';
+                 while(isDIGIT(*src))
+diff --git a/t/60preparse.t b/t/60preparse.t
+index 6432feb..6856460 100755
+--- a/t/60preparse.t
++++ b/t/60preparse.t
+@@ -11,7 +11,7 @@ BEGIN {
+ 		plan skip_all => 'preparse not supported for DBI::PurePerl';
+ 	}
+ 	else {
+-		plan tests => 39;
++		plan tests => 51;
+ 	}
+ }
+ 
+@@ -143,6 +143,19 @@ is( $DBI::errstr, "preparse found unterminated bracketed {...} comment" );
+ 
+ # --------------------------------------------------------------------- #
+ 
++is( pp($dbh, 'a = :99999', DBIpp_ph_qm, DBIpp_ph_cs|DBIpp_ph_cn), undef, 'out of sequence');
++ok( $DBI::err );
++is( $DBI::errstr, "preparse found placeholder :99999 out of sequence, expected :1");
++is( pp($dbh, 'a = :100000', DBIpp_ph_qm, DBIpp_ph_cs|DBIpp_ph_cn), undef, 'exceeds limit');
++ok( $DBI::err );
++is( $DBI::errstr, "preparse found :p100000 which is outside the allowed range.");
++is( pp($dbh, 'a = :2147483648', DBIpp_ph_qm, DBIpp_ph_cs|DBIpp_ph_cn), undef, 'exceeds limit');
++ok( $DBI::err );
++is( $DBI::errstr, "preparse found :p-2147483648 which is outside the allowed range.");
++is( pp($dbh, 'a = :12345678987654321', DBIpp_ph_qm, DBIpp_ph_cs|DBIpp_ph_cn), undef, 'exceeds limit');
++ok( $DBI::err );
++like( $DBI::errstr, qr{^preparse found :p\d+ which is outside the allowed range.$});
++
+ $dbh->disconnect;
+ 
+ 1;
+-- 
+2.35.6
+
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p2.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p2.patch
new file mode 100644
index 0000000000..a75c4b468d
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p2.patch
@@ -0,0 +1,37 @@
+From d7930d38ecb71cd69492bf405cc2d8c7b9647652 Mon Sep 17 00:00:00 2001
+From: Alexander Bluhm <alexander.bluhm@gmx.net>
+Date: Mon, 17 Aug 2026 13:34:30 +0200
+Subject: [PATCH] Detect atoi() integer overflow.
+
+A nasty feature of atoi() is its missing overflow detection.  As
+we expect integer between 0 and 99999, the number of the input
+digits can be restricted to 5.  Then integer overflow is not possible.
+
+CVE: CVE-2026-73194
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/9ffafab2369d7214f88967645feb3beadb900712]
+
+Backport Changes:
+- Applied the DBI.xs correction without functional edits.
+
+(cherry picked from commit 9ffafab2369d7214f88967645feb3beadb900712)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ DBI.xs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index cfc241b..b2fd892 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4393,7 +4393,7 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+         else if (isDIGIT(*src)) {   /* :1 */
+             const int pln = atoi(src);
+ 
+-            if (pln > 99999 || pln <= 0) {
++            if (strspn(src, "0123456789") > 5 || pln > 99999 || pln <= 0) {
+                 char buf[99];
+                 sprintf(buf, "preparse found :p%d which is outside the allowed range.", pln);
+                 set_err_char(dbh, imp_xxh, "1", 1, buf, 0, "preparse");
+-- 
+2.35.6
+
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p3.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p3.patch
new file mode 100644
index 0000000000..6fbfe420d3
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p3.patch
@@ -0,0 +1,34 @@
+From 9e063a906fb058c3b23e31b374a4287c27887871 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Mon, 17 Aug 2026 09:49:56 +0200
+Subject: [PATCH] Fix test for 32bit-perl (report in PR#189)
+
+CVE: CVE-2026-73194
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/acc903db3086a737936643a5dbbc0e22f9d5c421]
+
+Backport Changes:
+- Applied the t/60preparse.t assertion without functional edits.
+- Omitted DBI 1.653 version, release note, and generated doc updates.
+
+(cherry picked from commit acc903db3086a737936643a5dbbc0e22f9d5c421)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ t/60preparse.t | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/t/60preparse.t b/t/60preparse.t
+index 6856460..1520ae7 100755
+--- a/t/60preparse.t
++++ b/t/60preparse.t
+@@ -151,7 +151,7 @@ ok( $DBI::err );
+ is( $DBI::errstr, "preparse found :p100000 which is outside the allowed range.");
+ is( pp($dbh, 'a = :2147483648', DBIpp_ph_qm, DBIpp_ph_cs|DBIpp_ph_cn), undef, 'exceeds limit');
+ ok( $DBI::err );
+-is( $DBI::errstr, "preparse found :p-2147483648 which is outside the allowed range.");
++like( $DBI::errstr, qr{^preparse found :p(?:-2147483648|2147483647) which is outside the allowed range.$});
+ is( pp($dbh, 'a = :12345678987654321', DBIpp_ph_qm, DBIpp_ph_cs|DBIpp_ph_cn), undef, 'exceeds limit');
+ ok( $DBI::err );
+ like( $DBI::errstr, qr{^preparse found :p\d+ which is outside the allowed range.$});
+-- 
+2.35.6
+
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 883827e270..1e74a17e4b 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -15,6 +15,9 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-14380.patch \
            file://CVE-2026-14739.patch \
            file://CVE-2026-14740.patch \
+           file://CVE-2026-73194_p1.patch \
+           file://CVE-2026-73194_p2.patch \
+           file://CVE-2026-73194_p3.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6


