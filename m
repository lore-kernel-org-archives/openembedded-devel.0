Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11063C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 09:19:10 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7426.1785316740417422150
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 02:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MfDG3hJ8;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3814; q=dns/txt;
  s=iport01; t=1785316740; x=1786526340;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bLJ2ArFQwCbuGHCYgibrWiJV5tfrhtcqEixj/UfrytM=;
  b=MfDG3hJ8ePS6v96TxHkYAuWp93ffOaNLbka/9OeFqcj5kiQQatz9L9ea
   s1Lw4RAo4iTZZ8W7+yLqJ1BqJfAM/tdLZ6bOkFucBFNK8/STqOw7if1HV
   fQTQGjYzDreFFD0l593CAeZogVDyq2pGg/KDPYD/XRv1TZcstaXZhwh7K
   +xSUdB5y6Jkt35MV6E2hx24WBcKyn6w4X/yUJM66fyqlZY4cbYRWjub+E
   SRfDpR1eKH0fxtFpX/j5M2BPLlOYpzv1wVTX+3KD5rpLwE3CXWUWwpH0H
   zJM8ZzMLAMginiZCZ02FMfTjZ0ic9c7YUjeGjcjOg9snSCV0NSvoOjXYI
   Q==;
X-CSE-ConnectionGUID: 97CCdzNGRWiFSsRRwrFbcQ==
X-CSE-MsgGUID: GWPJlr7zT1agg1Jm3KRWdg==
X-IPAS-Result: =?us-ascii?q?A0BEAgB8xGlq/5UQJK1aglmCV3ReQ0mVXmyBFp0IgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQWNaAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBNQFGLAMBAlojIYMCAYJ0AxG+E4IsgQGDWgUJAkNQ2y4BC?=
 =?us-ascii?q?xQBBYEzhT+IIFwYAYR8JxsbgXKBFYJzdoEFgVwBAYEnhn4EgiJ6EoFaHpA3S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BLD+EVyMZNn+BL?=
 =?us-ascii?q?3VKdy1pARIXgRqDOQKCQQMLGA1IESw3FBkEPm4HjW8hgkQBgQ4BKyCBZCiTL?=
 =?us-ascii?q?pJIgTWfWgoog3WMIZU6GjOFW6URmQiOCpYZN4RpgWg8gUcLB3AVgyIJShkPj?=
 =?us-ascii?q?i4KC4NggX+DQgbJEycyCzIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:0OAzBK96HgpnKWqrlzIeDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2EXXDyOaP2NN2Ske98kPN+3pktU75aEmoAwQAU/pX9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbThFs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lnYqYz9vRRLltx9
 NIjMwo3cQqtjemPlefTpulE3qzPLeHiOIcZ/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cMnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oe8boCIJIDaHa25mG63m
 Vrk+36mEC1DPdOQkBiAqVGWuePAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:kaXaBamL4zoytPLHbavdxpN+0HzpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3A9rpf32kXTae7jAXY3SUuSXm7j+XXOSyC51zcMWm?=
 =?us-ascii?q?XM1loZoaOc2WP4o1umPM7zg=3D=3D?=
X-Talos-MUID: 9a23:rcDCRwmF/T/4wLy1P2lCdnpNC/9K577xGnxUmJoJ4uuBbg9KBDuS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,192,1779148800"; 
   d="scan'208";a="796256480"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jul 2026 09:18:59 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 3DDBD1800020B;
	Wed, 29 Jul 2026 09:18:59 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id CD17FCD1450; Wed, 29 Jul 2026 02:18:58 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-oe][wrynose][PATCH 1/5] libdbi-perl: Fix CVE-2026-9698
Date: Wed, 29 Jul 2026 02:18:36 -0700
Message-Id: <20260729091840.84531-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 09:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128551

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/perl5-dbi/dbi/commit/bfe5d73c162d2d1f761a639a0aa33aad6a9eb54e
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-9698

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../perl/libdbi-perl/CVE-2026-9698.patch      | 51 +++++++++++++++++++
 .../perl/libdbi-perl_1.647.bb                 |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch
new file mode 100644
index 0000000000..83df70de54
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch
@@ -0,0 +1,51 @@
+From 9a85c9bc1c1fafa42a223d3310f9c5a6305902f0 Mon Sep 17 00:00:00 2001
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Wed, 27 May 2026 11:16:50 +0200
+Subject: [PATCH] Fix possible stack overflow (old issue already noted by Tim)
+
+CVE: CVE-2026-9698
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/bfe5d73c162d2d1f761a639a0aa33aad6a9eb54e]
+
+Backport Changes:
+- Applied the DBI.xs security fix without functional changes.
+- Omitted ChangeLog and lib/DBI/Changes.pm because they contain only
+  DBI 1.648 release-note updates.
+- Omitted dbixs_rev.h because it is generated from upstream Git history
+  and its hunk depends on DBIXS_RELEASE and DBIXS_VERSION metadata added
+  after DBI 1.647. The fix does not change the DBIXS or DBISTATE
+  interface.
+- Omitted the Makefile.PL addition that runs dbixs_rev.pl from the doc
+  target. It only regenerates dbixs_rev.h and is not required to compile
+  or activate the DBI.xs security fix.
+
+(cherry picked from commit bfe5d73c162d2d1f761a639a0aa33aad6a9eb54e)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ DBI.xs | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index 97d9378..1f06d4d 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -4000,7 +4000,6 @@ XS(XS_DBI_dispatch)
+         SV **statement_svp = NULL;
+         const int is_warning = (!SvTRUE(err_sv) && strlen(SvPV_nolen(err_sv))==1);
+         const char *err_meth_name = meth_name;
+-        char intro[200];
+ 
+         if (meth_type == methtype_set_err) {
+             SV **sem_svp = hv_fetch((HV*)SvRV(h), "dbi_set_err_method", 18, GV_ADDWARN);
+@@ -4008,10 +4007,8 @@ XS(XS_DBI_dispatch)
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
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
index 00f8181065..f676f73d67 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.647.bb
@@ -9,7 +9,9 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65f65488c774efe1da488e36ad6c4a36"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/H/HM/HMBRAND/DBI-${PV}.tgz \
+           file://CVE-2026-9698.patch \
+           "
 SRC_URI[sha256sum] = "0df16af8e5b3225a68b7b592ab531004ddb35a9682b50300ce50174ad867d9aa"
 
 S = "${UNPACKDIR}/DBI-${PV}"
-- 
2.35.6


