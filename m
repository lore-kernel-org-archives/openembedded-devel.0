Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FB8C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:19:20 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7433.1785316755279572630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lea74dU9;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6160; q=dns/txt;
  s=iport01; t=1785316755; x=1786526355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YqMNQ+lrI8CbFk5eqmuIPHhs4TNjjMrqmwYqtc+LFx0=;
  b=lea74dU966lF12MX0exJUbJcu/+EoI+1JbCAU3ELhdt4FTa99lZ8eOMG
   BB6KegGgpJEj/nV0N2R7jdRF62uts+2lT4QYwQAik3IiYIlhSQQ89eNMx
   naATEIrNB/Of6+pNzjqihhdfeKRH10pUB1EIYK2K6F3abgqnvCXKZUeuq
   uaScI82DejoW9OPfYnWwiX3sGqtFL1TsM2Q6yWXhwMVsQVNBC85a1DIbu
   wLUJc+9hcdpq2XkyKnpDpevh9JVAZm5vqqmwRn/KwqKnq4Tu115JxvTWU
   BWBwXpQdqR2R235Wo8KTQQIijUuKL15gs/SgCv7SXkbKNsqclnUyet8/V
   g==;
X-CSE-ConnectionGUID: hvrvCgxzSD6Bsc49vxpriw==
X-CSE-MsgGUID: PQljiHU2SXWzMy/c827j9A==
X-IPAS-Result: =?us-ascii?q?A0BGAgDMxGlq/48QJK1aglmCV3ReQ0mWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBRhAcAwECLysjCBmDAgGCdAMRvhSBeTOBAYNoAkNQ2?=
 =?us-ascii?q?y4BCxQBBYEzhT+IIFwYAYR8JxsbgXKBFYNpgQWBXAEBgS0Lhm0Egg0VehKBW?=
 =?us-ascii?q?h6QN0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsHBYEdgSw/hFcjG?=
 =?us-ascii?q?TZ/gS91SnctaQESF4EagzkCgkEDCxgNSBEsNxQZBD5uB41vIYJEARYXNisBK?=
 =?us-ascii?q?QIJgRKBEUuSbQeQFoIhoQ8KKIN1jCGVOhozhVulEQuYfY4KllCEaYFoPIFHC?=
 =?us-ascii?q?wdwFYMiCUoZD44tCwuDYIF/ggiBQMkTJzILMgEBBwIHDgMLgWiQAYF9AQE?=
IronPort-Data: A9a23:Vi/SEaDlToXGZhVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApGhx1TVRy
 DQZWWiAbPyKMTeneo10Ydm1/UxQu8WEztdjOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD/imYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEw+t0Emo5LZ8j1rhdGmoSp
 OIIMCoMcUXW7w626OrTpuhEj8AnKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWEHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCMnFwriOW2YIe9ltqiffxRnEe4m
 zj9z1vrJwBdP4zFljjU2yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvSS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH4dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:Affj5aFVxtpuwveqpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:Ok/WsWDEzI/3WXn6Eyl57lA/FdA3SVGD5mzbfx6mGX5zSaLAHA==
X-Talos-MUID: 9a23:f4nwJAnSz1CTihf+XP6qdnpaDcNq4oSTUns9rocjqo6PZXYvOWa02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="788205385"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:19:14 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 022781800059E;
	Wed, 29 Jul 2026 09:19:14 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 94946CD144F; Wed, 29 Jul 2026 02:19:13 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][wrynose][PATCH 4/5] libdbi-perl: Fix CVE-2026-14739
Date: Wed, 29 Jul 2026 02:18:39 -0700
Message-Id: <20260729091840.84531-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260729091840.84531-1-hthakar@cisco.com>
References: <20260729091840.84531-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 09:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128554

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/perl5-dbi/dbi/commit/2b77c88b655e9539a592c71a61fb965fc0075395
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-14739

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-14739.patch     | 124 ++++++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch
new file mode 100644
index 0000000000..84d8b8391a
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch
@@ -0,0 +1,124 @@
+From 99798054e18bc9653ce0e29b2de90288981b4ad4 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Sat, 4 Jul 2026 11:38:24 +0200
+Subject: [PATCH] Set a hard limit of 99999 on '?' placeholders 
+ (CVE-2026-14739)
+
+CVE: CVE-2026-14739
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/2b77c88b655e9539a592c71a61fb965fc0075395]
+
+Backport Changes:
+- Applied the complete DBI.xs security fix without functional changes.
+  This patch follows CVE-2026-10879 because the upstream fix updates
+  that earlier fix's buffer allocation and adds the 99,999-placeholder
+  limit.
+- Omitted ChangeLog and lib/DBI/Changes.pm because they contain only
+  DBI 1.650 release-note updates.
+- Omitted dbixs_rev.h because it is generated from upstream Git history.
+  The fix does not change the DBIXS or DBISTATE interface.
+- Omitted DBI.pm because its upstream hunks only bump the package from
+  1.649 to 1.650 and document the new placeholder limit; they do not
+  compile or activate the DBI.xs security fix.
+- Omitted generated doc/DBI.3, doc/DBI.html, doc/DBI.man, and doc/DBI.md
+  because they only reproduce the DBI.pm version and documentation
+  changes and are absent from the DBI 1.647 CPAN source.
+
+(cherry picked from commit 2b77c88b655e9539a592c71a61fb965fc0075395)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ DBI.xs | 53 +++++++++++++++++++++++++++++++++--------------------
+ 1 file changed, 33 insertions(+), 20 deletions(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index fbfe405..0f9ea9c 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4203,7 +4203,14 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
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
+@@ -4342,9 +4349,9 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
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
+@@ -4363,12 +4370,18 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
+             if (PS_return(DBIpp_ph_qm))
+                 ;
+             else if (PS_return(DBIpp_ph_cn)) { /* '?' -> ':p1' (etc) */
++                if (idx >= 99999) {
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
+@@ -4376,24 +4389,24 @@ preparse(SV *dbh, const char *statement, IV ps_return, IV ps_accept, void *foo)
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
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index a852dc276a..688b63d534 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -13,6 +13,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
            file://CVE-2026-9698.patch \
            file://CVE-2026-10879.patch \
            file://CVE-2026-14380.patch \
+           file://CVE-2026-14739.patch \
            "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
-- 
2.35.6


