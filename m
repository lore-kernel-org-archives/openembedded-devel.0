Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C54C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:26:00 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7526.1785317157481227653
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OtEk4NXr;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8445; q=dns/txt;
  s=iport01; t=1785317157; x=1786526757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p0JIvp4+aJsHe5CqJoE5pBqs8EolVcEMX3fs45RgOKQ=;
  b=OtEk4NXrnWz6JcXEry/ag4EMUem1SXcY2i8C9x2fk+GJ2tKUOxWUNN5w
   RXmVB5UJrSGNyVQPrUis0KkPfhVbsOLQVf6CJUvtopeJcdLHX3KKSkW7G
   hqINa7JY1DYzO+qtt8grM9uRwqY3PwFhIVd6NVYTurW+184k62NBL6N9k
   YsxH2615fpa58Zh1qnYQqu8mRRativ+/YyoqfOenP8qQCo8WdsZ8BHXXa
   yAOuFyFG4pkOZOB5Sgr/+oZ2yN+QpKVssUlhwAC0YWpLsNTFw6K9Jm5Uf
   EJxkbbsNgiImVVY+bTzbUR5oWp680aI/E6tJeFy4P89PzxSrr0xi4QoVX
   A==;
X-CSE-ConnectionGUID: 4FGcXPKWRpWng6jfCueMfA==
X-CSE-MsgGUID: dtW9R1Y0Sg6ybKnOqetBZA==
X-IPAS-Result: =?us-ascii?q?A0BHAgDLxWlq/5UQJK1aHgEBCxIMggULgld0XkNJlV5sA?=
 =?us-ascii?q?4ETnQiBfg8BAQEPRA0EAQGFBQKNZgImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLAUYQHAMBAi8rIwgZgwIBgnQDEb4qg?=
 =?us-ascii?q?XkzgQGDaAJDUNsuAQsUAQWBM4U/iCBcGAGEfCcbG4FygRWCc3aBBYE+HgEBg?=
 =?us-ascii?q?S0Lhm0EgiKBDIFaHpA3SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENG?=
 =?us-ascii?q?wcFgR2BLD+EVyMZNn+BL3VKdy1pARIXgRqDOQKCQQMLGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?W8hgkUBLGEBByIBAQl8gSdLknQxj2WCIYE1nhyBPgoog3WMIZU6GjOFW6URC?=
 =?us-ascii?q?5h9jgqWA02EaYFoPIFHCwdwFYMiCUoZD44sAQEKC4NggX+CCIEMNMkSJzILM?=
 =?us-ascii?q?gEBBwIHDgMLgWiQAYF9AQE?=
IronPort-Data: A9a23:oN/anKqoPEIPq5ERUXiX4C98R9peBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnVbKzZZWajeNF/O4y0/BhQsJDTx9VmSgA/+Cg3FnxB8uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8kI35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rpZLmp+z
 d8nEigyaB/dheyd3b+eRMA506zPLOGzVG8eknhkyTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtGYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9JY3UH5sOwB7Bz
 o7A12jlPUAgbe3H8jXb43iPgMjWkD/RaqtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwAiJzqyR50OSAXIJC2cbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:aTONI6rq38Zq4kYqVd4TUYoaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:DvP94mB5JHmuWhD6E3VJ20UkIuMaSGXiyniOIUGTFGtMRpTAHA==
X-Talos-MUID: 9a23:SMiajAh3dEzNa38qJeBk5cMpONtXsp73ORg2nssXseqCEjV9Jx2vpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="796263601"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:25:56 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 7B20A18000982;
	Wed, 29 Jul 2026 09:25:56 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 16A37CC12A9; Wed, 29 Jul 2026 02:25:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH 4/5] libdbi-perl: Fix CVE-2026-14739
Date: Wed, 29 Jul 2026 02:25:54 -0700
Message-Id: <20260729092556.45457-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260729092556.45457-1-hthakar@cisco.com>
References: <20260729092556.45457-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 09:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128556

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream hard limit for positional placeholders. This is
a follow-up to CVE-2026-10879 and depends on the allocation fix from
the preceding libdbi-perl commit.

Correct the upstream boundary check so that the documented maximum of
99999 placeholders is accepted and values above it are rejected. Add
focused regression coverage for the 99999 and 100000 boundaries.

[1] https://github.com/perl5-dbi/dbi/commit/2b77c88b655e9539a592c71a61fb965fc0075395
[2] https://github.com/perl5-dbi/dbi/commit/af79036c07aa9a457971c0f4136e37c85dc20978
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-14739
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-10879

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-14739.patch     | 170 ++++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |   1 +
 2 files changed, 171 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch
new file mode 100644
index 0000000000..b43e3a20ba
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch
@@ -0,0 +1,170 @@
+From 57d0a1f66b9ed1b54f11af661da4719c43409497 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Sat, 4 Jul 2026 11:38:24 +0200
+Subject: [PATCH] Set a hard limit of 99999 on '?' placeholders 
+ (CVE-2026-14739)
+
+CVE: CVE-2026-14739
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/2b77c88b655e9539a592c71a61fb965fc0075395]
+
+Backport Changes:
+ - Omit ChangeLog, dbixs_rev.h, lib/DBI/Changes.pm, and the DBI.pm version-number hunks because the target remains DBI 1.643.
+ - Omit regenerated doc/DBI.3, doc/DBI.html, doc/DBI.man, and doc/DBI.md files; retain the DBI.pm source-documentation and DBI.xs security changes unchanged.
+ - Correct the upstream boundary check to accept exactly 99999 placeholders and reject values above that documented limit; add t/60preparse.t regression coverage for 99999 and 100000 placeholders.
+
+(cherry picked from commit 2b77c88b655e9539a592c71a61fb965fc0075395)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ DBI.pm         |  6 ++++--
+ DBI.xs         | 53 +++++++++++++++++++++++++++++++++--------------------
+ t/60preparse.t | 13 ++++++++++++-
+ 3 files changed, 49 insertions(+), 23 deletions(-)
+
+diff --git a/DBI.pm b/DBI.pm
+index d62a32d..b988e40 100644
+--- a/DBI.pm
++++ b/DBI.pm
+@@ -7123,7 +7123,8 @@ a ref to an empty hash because they can't pre-determine the names.
+ It is possible that the keys in the hash returned by C<ParamValues>
+ are not exactly the same as those implied by the prepared statement.
+ For example, DBD::Oracle translates 'C<?>' placeholders into 'C<:pN>'
+-where N is a sequence number starting at 1.
++where N is a sequence number starting at C<1> with a hard limit of
++C<99999>.
+ 
+ * Values:
+ 
+@@ -7225,7 +7226,8 @@ integer.
+ It is also possible that the keys in the hash returned by
+ C<ParamArrays> are not exactly the same as those implied by the
+ prepared statement.  For example, DBD::Oracle translates 'C<?>'
+-placeholders into 'C<:pN>' where N is a sequence number starting at 1.
++placeholders into 'C<:pN>' where N is a sequence number starting at
++C<1> with a hard limit of C<99999>.
+ 
+ =head3 C<RowsInCache>
+ 
+diff --git a/DBI.xs b/DBI.xs
+index 8858e21..23ad34a 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4201,7 +4201,14 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+     }
+ 
+     /* XXX this allocation strategy won't work when we get to more advanced stuff */
+-    new_stmt_sv = newSV(strlen(statement) * 6 + 16);
++    /* The 7 is for length increase from '?' (length 1) to :p99999 (length 7)
++     * which imposes a limit of 99999 '?' placeholders POSIX style. Actual counts
++     * are a bit higher:
++     * using factor 5: :p1 .. :p1107
++     * using factor 6: :p1 .. :p11106
++     * using factor 7: :p1 .. :p111105
++     * and that count is insane already */
++    new_stmt_sv = newSV(strlen(statement) * 7 + 16);
+     sv_setpv(new_stmt_sv,"");
+     src  = statement;
+     dest = SvPVX(new_stmt_sv);
+@@ -4340,9 +4347,9 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+             continue;
+         }
+ 
+-       if (    !(*src==':' && (PS_accept(DBIpp_ph_cn) || PS_accept(DBIpp_ph_cs)))
+-           &&  !(*src=='?' &&  PS_accept(DBIpp_ph_qm))
+-       ){
++        if (    !(*src==':' && (PS_accept(DBIpp_ph_cn) || PS_accept(DBIpp_ph_cs)))
++            &&  !(*src=='?' &&  PS_accept(DBIpp_ph_qm))
++        ){
+             if (*src == '\'' || *src == '"')
+                 in_quote = *src;
+             *dest++ = *src++;
+@@ -4361,12 +4368,18 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+             if (PS_return(DBIpp_ph_qm))
+                 ;
+             else if (PS_return(DBIpp_ph_cn)) { /* '?' -> ':p1' (etc) */
++                if (idx > 99999) {
++                    char buf[99];
++                    sprintf(buf, "preparse found more than 99999 '?' placeholders. Limit exceeded.");
++                    set_err_char(dbh, imp_xxh, "1", 1, buf, 0, "preparse");
++                    return &PL_sv_undef;
++                }
+                 sprintf(start,":p%d", idx++);
+                 dest = start+strlen(start);
+             }
+             else if (PS_return(DBIpp_ph_sp)) { /* '?' -> '%s' */
+-                   *start  = '%';
+-                   *dest++ = 's';
++                *start  = '%';
++                *dest++ = 's';
+             }
+         }
+         else if (isDIGIT(*src)) {   /* :1 */
+@@ -4374,24 +4387,24 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+             style = ":1";
+ 
+             if (PS_return(DBIpp_ph_cn)) { /* ':1'->':p1'  */
+-                   idx = pln;
+-                   *dest++ = 'p';
+-                   while(isDIGIT(*src))
+-                       *dest++ = *src++;
++                idx = pln;
++                *dest++ = 'p';
++                while(isDIGIT(*src))
++                    *dest++ = *src++;
+             }
+             else if (PS_return(DBIpp_ph_qm) /* ':1' -> '?'  */
+                  ||  PS_return(DBIpp_ph_sp) /* ':1' -> '%s' */
+             ) {
+-                   PS_return(DBIpp_ph_qm) ? sprintf(start,"?") : sprintf(start,"%%s");
+-                   dest = start + strlen(start);
+-                   if (pln != idx) {
+-                        char buf[99];
+-                        sprintf(buf, "preparse found placeholder :%d out of sequence, expected :%d", pln, idx);
+-                        set_err_char(dbh, imp_xxh, "1", 1, buf, 0, "preparse");
+-                        return &PL_sv_undef;
+-                   }
+-                   while(isDIGIT(*src)) src++;
+-                   idx++;
++                PS_return(DBIpp_ph_qm) ? sprintf(start,"?") : sprintf(start,"%%s");
++                dest = start + strlen(start);
++                if (pln != idx) {
++                    char buf[99];
++                    sprintf(buf, "preparse found placeholder :%d out of sequence, expected :%d", pln, idx);
++                    set_err_char(dbh, imp_xxh, "1", 1, buf, 0, "preparse");
++                    return &PL_sv_undef;
++                }
++                while(isDIGIT(*src)) src++;
++                idx++;
+             }
+         }
+         else if (isALNUM(*src))         /* :name */
+diff --git a/t/60preparse.t b/t/60preparse.t
+index 6432feb..668dfa3 100755
+--- a/t/60preparse.t
++++ b/t/60preparse.t
+@@ -11,7 +11,7 @@ BEGIN {
+ 		plan skip_all => 'preparse not supported for DBI::PurePerl';
+ 	}
+ 	else {
+-		plan tests => 39;
++		plan tests => 43;
+ 	}
+ }
+ 
+@@ -71,6 +71,17 @@ is( pp($dbh, "a = :name",  DBIpp_ph_sp,	DBIpp_ph_cs), "a = %s" );
+ 
+ is( pp($dbh, "a = ? b = ? c = ?", DBIpp_ph_cn,	DBIpp_ph_XX), "a = :p1 b = :p2 c = :p3" );
+ 
++my $max_placeholders = pp(
++    $dbh, "?" x 99999, DBIpp_ph_cn, DBIpp_ph_qm
++);
++ok(defined $max_placeholders, "accepts the documented limit of 99999 placeholders");
++is(substr($max_placeholders, -7), ":p99999", "numbers the final allowed placeholder");
++
++is(pp($dbh, "?" x 100000, DBIpp_ph_cn, DBIpp_ph_qm), undef,
++   "rejects placeholders above the documented limit");
++is($DBI::errstr, "preparse found more than 99999 '?' placeholders. Limit exceeded.",
++   "reports the placeholder limit");
++
+ ## Placeholders inside comments (should be ignored where comments style is accepted):
+ 
+ is( pp( $dbh,
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index c604e46334..4733378700 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz \
            file://CVE-2026-14380_p2.patch \
            file://CVE-2026-14380_p3.patch \
            file://CVE-2026-14380_p4.patch \
+           file://CVE-2026-14739.patch \
            "
 SRC_URI[md5sum] = "352f80b1e23769c116082a90905d7398"
 SRC_URI[sha256sum] = "8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa"
-- 
2.35.6


