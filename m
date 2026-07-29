Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5789DC54F52
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:26:00 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7527.1785317157538721519
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aTYsMlgJ;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3369; q=dns/txt;
  s=iport01; t=1785317157; x=1786526757;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F534kOnfo9Mrk19iuP1s/rrixLdnyaKW7yNfpYkmC48=;
  b=aTYsMlgJqaLXM+KdfJ4LYSyCGDOPLmkJSgjijPFonFWkdamp3LB88Hp+
   7NIfJ5zuQcQhllGU+Ru8q05uhpOc2ittGrp74kkIGZNhCE9NHVYTN1Uzn
   GURrSTnGPN/xscb4D9I1FVbXI7ECJ6+r4SY21UUiBZeOgwC/A5h/96ISR
   jz8ZYFVXye5te8a7TYa1PCd79SrCxIw0sYztWV1hLqMjBOI9hZwL0e57O
   hgQsmcJL96MnXBodmyMu3Yds2Z6H7PJoranNsoiKJMSrLIY9feVko4i5M
   FYPZVjGKo1odr3AFtKSwf+zoF6P/ZBChsTNgTr68eq2cvHFnqyYXtZ6zR
   g==;
X-CSE-ConnectionGUID: J3nSmcb8Sa2Pi4V3A8au7w==
X-CSE-MsgGUID: 7NblN7VpTWOrui1WWAhpIg==
X-IPAS-Result: =?us-ascii?q?A0BFAgC9xmlq/5UQJK1aglmCV3ReQ0mVXmyBFp0IgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQWNaAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECATUBRiwDAQJaIyGDAgGCdAMRviiCLIEBg1oFCQJDUNsuA?=
 =?us-ascii?q?QsUAQWBM4U/iCBcGAGEfCcbG4FygRWCc3aBBYE+HgEBiCUEgiKBDIFaHpA3S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BLD+EVyMZNn+BL?=
 =?us-ascii?q?3VKdy1pARIXgRqDOQKCQQMLGA1IESw3FBkEPm4HjW8hgkQBgQ4BKgEgggyTL?=
 =?us-ascii?q?pJIgTWfWgoog3WMIZU6GjOEBIFXpRGZCIJZizGWGTeEaYFoPIFHCwdwFYMiC?=
 =?us-ascii?q?UoZD44uCguDYIF/gxQuBskSJzILMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:3h4yUa0i+UU+iVF/1fbD5YVwkn2cJEfYwER7XKvMYLTBsI5bpzwCz
 2sYWWrUaf2JZjOne4olaN6w90sDuZ7VydJrSAJo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4EjxYtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuYzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLhowBogT8LZMCDt29
 KAmcxldZw3cmLfjqF67YrEEasULJc3vOsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEWojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQhiOe9b4OFJ43iqcN9wWCSo
 kSZwXzFPTYAKd3G9gWs8mqNibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:VAse+6yH8IhBjesnnSi3KrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:FjbL928/iB6hqCwJ3SWVv2xPHPsgeXeN936KG07kNz1AGLSIFkDFrQ==
X-Talos-MUID: 9a23:IU4+ugafE+/mKOBT6BnmgBc9Ct9U3IO0FUFUrqovu9GlOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="807871859"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:25:56 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 69AB41800016A;
	Wed, 29 Jul 2026 09:25:56 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 0ADA9CC12A6; Wed, 29 Jul 2026 02:25:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][scarthgap][PATCH 1/5] libdbi-perl: Fix CVE-2026-9698
Date: Wed, 29 Jul 2026 02:25:51 -0700
Message-Id: <20260729092556.45457-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128557

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/perl5-dbi/dbi/commit/bfe5d73c162d2d1f761a639a0aa33aad6a9eb54e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-9698

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-9698.patch      | 43 +++++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch
new file mode 100644
index 0000000000..28540c51f4
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch
@@ -0,0 +1,43 @@
+From 216bf2cce660265bf7035610fbc67978d65a4ab3 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Wed, 27 May 2026 11:16:50 +0200
+Subject: [PATCH] Fix possible stack overflow (old issue already noted by Tim)
+
+CVE: CVE-2026-9698
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/bfe5d73c162d2d1f761a639a0aa33aad6a9eb54e]
+
+Backport Changes:
+ - Omit ChangeLog, dbixs_rev.h, and lib/DBI/Changes.pm release metadata because the target remains DBI 1.643.
+ - Omit the unrelated Makefile.PL documentation-generation update; the DBI.xs security hunk is unchanged.
+
+(cherry picked from commit bfe5d73c162d2d1f761a639a0aa33aad6a9eb54e)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ DBI.xs | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index 2cea4ac..c549d15 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -3998,7 +3998,6 @@ XS(XS_DBI_dispatch)
+         SV **statement_svp = NULL;
+         const int is_warning = (!SvTRUE(err_sv) && strlen(SvPV_nolen(err_sv))==1);
+         const char *err_meth_name = meth_name;
+-        char intro[200];
+ 
+         if (meth_type == methtype_set_err) {
+             SV **sem_svp = hv_fetch((HV*)SvRV(h), "dbi_set_err_method", 18, GV_ADDWARN);
+@@ -4006,10 +4005,8 @@ XS(XS_DBI_dispatch)
+                 err_meth_name = SvPV_nolen(*sem_svp);
+         }
+ 
+-        /* XXX change to vsprintf into sv directly */
+-        sprintf(intro,"%s %s %s: ", HvNAME(DBIc_IMP_STASH(imp_xxh)), err_meth_name,
+-            SvTRUE(err_sv) ? "failed" : is_warning ? "warning" : "information");
+-        msg = sv_2mortal(newSVpv(intro,0));
++        msg = sv_2mortal(newSVpvf("%s %s %s: ", HvNAME(DBIc_IMP_STASH(imp_xxh)), err_meth_name,
++            SvTRUE(err_sv) ? "failed" : is_warning ? "warning" : "information"));
+         if (SvOK(DBIc_ERRSTR(imp_xxh)))
+             sv_catsv(msg, DBIc_ERRSTR(imp_xxh));
+         else
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index 1fee83a8fd..88d5aa3294 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz \
            file://CVE-2014-10402.patch \
+           file://CVE-2026-9698.patch \
            "
 SRC_URI[md5sum] = "352f80b1e23769c116082a90905d7398"
 SRC_URI[sha256sum] = "8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa"
-- 
2.35.6


