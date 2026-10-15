Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5130BCC6B2E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:54:30 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32293.1792040060867446466
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 21:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fGZc+sN7;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5257; q=dns/txt;
  s=iport01; t=1792040060; x=1793249660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fAc7CAMjtyr1dXwEfHX3eWK+Va7qye+1TCjs0J3o208=;
  b=fGZc+sN7ARA/gRRQuUyWiIR6Z8ZgINJ3sIzGfduHoV9dcqYYZfTLc7Uc
   siB77ylsozDiBNFexFQ3L/jvfnwcQ1FFCVmH+9mUz57Xg3uED1FG5RqQw
   dadG9VjqT7qmBocOD16mTzxaT3diS4VTuo5i3iid0CJX3mbKrIfEzHqa0
   zV+7BFojzc0uOEFpXPKWrDO8FCFqCE5IYi7Btv6XVUzYakM/BGVSk7Gtz
   sBLYN7PteeQjmmPLjwun1lNSegr/7xtAAIb2bIUZwd/viyjvnZkUo9qcL
   CV6P63vpAC97ImKKJQs2wA/rtl0EN19SKIFPhXyfr1cZpxW9yaqeKnUl8
   w==;
X-CSE-ConnectionGUID: JDlotk7VQO+BkX8yCl8JEw==
X-CSE-MsgGUID: 8msPWQqERZuTtB2yp/5bQw==
X-IPAS-Result: =?us-ascii?q?A0BHAgAoW9Bq/43/Ja1aglmCV3VgQ0kDlkcDnhqBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOFAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMyAUYQHAMBAi8rIwgZgwIBgjoDNwMRulKCLIEBg2kCQ?=
 =?us-ascii?q?1DbMgELFAGBOIVAiCNdGAGEfCcbG4FyhH6BBYEaQgKBJxGGbQSCInoSgVoel?=
 =?us-ascii?q?RJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6g?=
 =?us-ascii?q?QlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4P?=
 =?us-ascii?q?AkoQRcMcwwdBXIIAg0JDRgNSBEsNxUZBD5uB5F8HoJkAQGBDQErgiwRpWWhD?=
 =?us-ascii?q?woog3aMIpU6GjOEBIFXpRQLmH2CWYsxlTSBHIRpgWg8gVlwFYMiCUoZD44uC?=
 =?us-ascii?q?wuDYIVHyRMnMgsDLwEBBwIHDgMLgWiQAAEngVYBAQ?=
IronPort-Data: A9a23:eAyYKayUG/E2DSGrTmF6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUHz
 mNMDG7SP/7ZZGX9fdFyOoi3o0kDvceAytFlTwI//1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsaz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGMaOYoE+blJOEYN3
 /8oeCEmakChqv3jldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCwa4eJJ4XUGJo9ckCw9
 mfdx1vAGzwgBsGj1RDf42rr2+X2gnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjRCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:qou/d63x3W6Og2vZ6TT47gqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AC7CdP2mD3Mn38BxRcoDRyRVWOEnXOV/xyHDMIBC?=
 =?us-ascii?q?GMEEqYr6lGU67/PNGvtU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Aa82tgg91rZWA6raRUbFSAVOQf5dt+JyRMVkgq6c?=
 =?us-ascii?q?bh9Wubz1ofGqXtSviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="535451657"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 04:54:20 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id D327918000182;
	Thu, 15 Oct 2026 04:54:19 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 45394CBF201; Wed, 14 Oct 2026 21:54:19 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/2] libdbi-perl: fix CVE-2026-73193
Date: Wed, 14 Oct 2026 21:53:53 -0700
Message-Id: <20261015045353.236229-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261015045353.236229-1-dkelaiya@cisco.com>
References: <20261015045353.236229-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 04:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130913

From: Darsh Kelaiya <dkelaiya@cisco.com>

These patches apply the upstream fix as referenced in [2], using the
commit shown in [1]. The STRLEN correction [3] is a separate patch.

[1] https://github.com/perl5-dbi/dbi/commit/c751ae5a5a6f56c2f8284f37c1f4d43500352ef1
[2] https://access.redhat.com/security/cve/cve-2026-73193
[3] https://github.com/perl5-dbi/dbi/commit/afba6751f2acbc1f55ad55aac9f0b58d4f511308

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-73193_p1.patch  | 51 +++++++++++++++++++
 .../perl/libdbi-perl/CVE-2026-73193_p2.patch  | 38 ++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p1.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p2.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p1.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p1.patch
new file mode 100644
index 0000000000..c32d74c7f2
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p1.patch
@@ -0,0 +1,51 @@
+From eaf24226efba1e0628868b236c59d2e23bd6236a Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Tue, 11 Aug 2026 15:02:52 +0200
+Subject: [PATCH] Limit statements to 292 Mb in preparse (CVE-2026-73193)
+
+CVE: CVE-2026-73193
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/c751ae5a5a6f56c2f8284f37c1f4d43500352ef1]
+
+Backport Changes:
+- Applied the DBI.xs security change without functional edits.
+- Omitted ChangeLog and Changes.pm release notes for DBI 1.652.
+- Omitted the dbixs_rev.h timestamp and revision update, which does
+  not affect the preparse fix.
+
+(cherry picked from commit c751ae5a5a6f56c2f8284f37c1f4d43500352ef1)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ DBI.xs | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index b2fd892..db8e005 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4187,6 +4187,7 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+         we add support for odbc escape sequences.
+ */
+     int idx = 1;
++    int sln;
+ 
+     char in_quote = '\0';
+     char in_comment = '\0';
+@@ -4210,7 +4211,14 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+      * using factor 6: :p1 .. :p11106
+      * using factor 7: :p1 .. :p111105
+      * and that count is insane already */
+-    new_stmt_sv = newSV(strlen(statement) * 7 + 16);
++    sln = strlen(statement);
++    if (sln > 306783375) { /* x * 7 + 16 would overflow maxint on 32bit ints */
++        char buf[99];
++        sprintf(buf, "preparse statement length exceeds maximum length (306783375).");
++        set_err_char(dbh, imp_xxh, "1", 1, buf, 0, "preparse");
++        return &PL_sv_undef;
++    }
++    new_stmt_sv = newSV(sln * 7 + 16);
+     sv_setpv(new_stmt_sv,"");
+     src  = statement;
+     dest = SvPVX(new_stmt_sv);
+-- 
+2.35.6
+
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p2.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p2.patch
new file mode 100644
index 0000000000..968521d91d
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p2.patch
@@ -0,0 +1,38 @@
+From f46355f7578f796ad50e650f371f02864bf39b7b Mon Sep 17 00:00:00 2001
+From: Alexander Bluhm <alexander.bluhm@gmx.net>
+Date: Mon, 17 Aug 2026 13:11:38 +0200
+Subject: [PATCH] Fix integer overflow after strlen().
+
+In preparse() the integer variable sln is used the store the return
+value of strlen().  By that the real length is truncated to 32 bit
+and made signed.  This way the overflow check sln > 306783375 can
+be circumvented.  Make sln of type STRLEN.
+
+CVE: CVE-2026-73193
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/afba6751f2acbc1f55ad55aac9f0b58d4f511308]
+
+Backport Changes:
+- Applied the DBI.xs correction without functional edits.
+
+(cherry picked from commit afba6751f2acbc1f55ad55aac9f0b58d4f511308)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ DBI.xs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index db8e005..f5c7c29 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4187,7 +4187,7 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+         we add support for odbc escape sequences.
+ */
+     int idx = 1;
+-    int sln;
++    STRLEN sln;
+ 
+     char in_quote = '\0';
+     char in_comment = '\0';
+-- 
+2.35.6
+
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 1e74a17e4b..03be7eabea 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -18,6 +18,8 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-73194_p1.patch \
            file://CVE-2026-73194_p2.patch \
            file://CVE-2026-73194_p3.patch \
+           file://CVE-2026-73193_p1.patch \
+           file://CVE-2026-73193_p2.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6


