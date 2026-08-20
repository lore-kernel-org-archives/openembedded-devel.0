Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137DBC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 12:39:52 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6216.1787229582913784770
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 05:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=i4Kprf0x;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2629; q=dns/txt;
  s=iport01; t=1787229582; x=1788439182;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KWl/3SqGAeoYVjus8bLSKdDzHcJvOjHREUJZZCaRVD4=;
  b=i4Kprf0xhbQpNA5uU312mpJvhtudcb6rcUDn7pWUqKpNqaelViQRWD3d
   r/ly0FwnjMvxlOvxBzKDYQx0Mk70Jf0d4LsJTqdlZ5gezJ/2DIUdcHxSe
   tPoFMxtAd70Dxe2Z1OYlHFezVVETYaFiC9ieA+BMe02ezrwWwTKCI9aP/
   MCRE4BgNLmsJtHPKBXnPKow9gCCjQeOD1kX+24ryORcF4cYpTm4Ks8DYy
   xRNrb7s72bULwK4TVS5aUM4cR3P4L2u3wUd16ylEAwpG5fRbWss8ujcnJ
   MSW51OjUeVm5xukR0t+2Kxc9enf80l45crWpzFCB3d2WygKKUoP25T46e
   g==;
X-CSE-ConnectionGUID: YM/atvyIQPK7Fu7x8etGmw==
X-CSE-MsgGUID: N7Vuy+tNTSquUvJ5sAl7Rw==
X-IPAS-Result: =?us-ascii?q?A0D2AgCr9IZq/4wQJK1aglmCV3ReQ0mTWQFPgiGeHoF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAZJyAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhxMBGAFdXESDAgGCdAMRwkqCLIEBgygBgVTbMAELFAGBOIU/iCKFc?=
 =?us-ascii?q?icbG4FyhH6CYQQYghOFeASCIoEMgXiRUkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKypiEheBCYIKAoJwggYCAUlFD?=
 =?us-ascii?q?gkXCxgNSBEsNxQZBD5uB45RIIJKAT1RASsFgRZiQKVloQ8KKIN2jCGIBAeNL?=
 =?us-ascii?q?xozqUaBJpkIjgqWUIRpgW8OJ4FZcBWDIglKGQ+XNoFdxUknMgIJMgIHAgcOA?=
 =?us-ascii?q?wuGS40bAQE?=
IronPort-Data: A9a23:IlsHOagG+frFs1Bl6Jxt8QLqX161NxEKZh0ujC45NGQN5FlHY01je
 htvDGuPaaqKZWHxetsnOoXjoUkOu5LTnYNqSgdtrno3HntjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jb8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUp36F+HX9f1
 MUgC28jc0+T1++q77ekH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYj/7C7pm9Ausrnn9ejFfrnqepLE85C7YywkZPL3FYIOII4fQFJ4E9qqej
 kSZwXnoQQ08COeG1Aeb0C+3r+uQpzyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:1sGV1q6IvBgwj+8FlgPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:Yc7aZ2xz3INfM2ixZA0OBgUlP4csbmPM7U7oABCWFDl5GLCJZlqPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A3CtW/AxpjBHjK792T8Oc6iYVWQeaqILxNl0c0ok?=
 =?us-ascii?q?gh/KdKBFuGWqGpTDoeJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="815132939"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 12:39:41 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id BFAE0180001E5
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 12:39:41 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 4DAA8CC1611; Thu, 20 Aug 2026 05:39:41 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][master][PATCH] samba, libldb: add package conflicts
Date: Thu, 20 Aug 2026 05:39:32 -0700
Message-Id: <20260820123932.2335696-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 12:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129391

From: Himanshu Jadon <hjadon@cisco.com>

samba package also installs LDB command line tools and python LDB
module. libldb package installs the same tools and pyldb module from
standalone LDB source.

pkgdata shows the conflict clearly:

  samba: /usr/bin/ldbadd
  libldb: /usr/bin/ldbadd
  samba-python3: site-packages/ldb.so
  pyldb: site-packages/ldb.so

So when both samba and libldb are added in same image, rootfs can fail
because package manager sees same files from two different packages.
Both package sets are not expected to be installed together.

Add RCONFLICTS for samba/libldb and samba-python3/pyldb. This makes the
conflict explicit during dependency resolution instead of failing later
as file install conflict.

Older meta-networking had similar conflict handling for samba/libldb in
commit: https://git.openembedded.org/meta-openembedded/commit/?id=8e641e28f630dac61a03373ad70c72a2370ad11e

This change adds the same handling again with current python3 package names.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.23.11.bb | 3 +++
 meta-networking/recipes-support/libldb/libldb_2.9.2.bb      | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
index 67c2646011..e498b30bcb 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
@@ -50,6 +50,9 @@ CVE_STATUS[CVE-2011-2411] = "not-applicable-platform: vulnerable only on HP NonS
 # remove default added RDEPENDS on perl
 RDEPENDS:${PN}:remove = "perl"
 
+RCONFLICTS:${PN} = "libldb"
+RCONFLICTS:${PN}-python3 = "pyldb"
+
 DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libaio libpam libtasn1 libtasn1-native jansson libparse-yapp-perl-native gnutls cmocka ngtcp2 bison-native"
 
 inherit features_check
diff --git a/meta-networking/recipes-support/libldb/libldb_2.9.2.bb b/meta-networking/recipes-support/libldb/libldb_2.9.2.bb
index a212b6d2ef..c5699ad189 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.9.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.9.2.bb
@@ -5,6 +5,8 @@ LICENSE = "GPL-3.0-or-later AND LGPL-2.1-or-later AND LGPL-3.0-or-later"
 
 DEPENDS += "libtdb libtalloc libtevent popt cmocka"
 RDEPENDS:pyldb += "python3"
+RCONFLICTS:${PN} = "samba"
+RCONFLICTS:pyldb = "samba-python3"
 
 export PYTHONHASHSEED = "1"
 export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.35.6


