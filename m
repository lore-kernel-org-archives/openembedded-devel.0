Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E62ACD98E6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 04:14:28 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35666.1781842460192056445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 21:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WpLIKNrm;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1285; q=dns/txt;
  s=iport01; t=1781842460; x=1783052060;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yZ6rMijSfhjUXuWq+DwH5u6xJ23715RumtfdeObjm/s=;
  b=WpLIKNrm61f2PbRuvN5JfvmUVSIQZn+wupajeTKhkRW+fMBZN/eksOjH
   QdtgSxFzztGaP+Lh3nkpWWR9CiG5/7hC7fgW2OEY3yZCmZoNEBBmEwgh8
   yUVaeAfIT1uHmoEog4OFdIrLeBCEe4jEnDNURrXbgtPHhPUonTGxR8Spe
   9Lxn4/HTJRtdNXAokDKV0RWN4/jc6mj7ChVAhJtH6Hy3lNnr3R2PAK8O2
   FmoVMuz+sglcobjtra1WAyEXQDVilZcGWhWoGAUt9nLL7tpsBjx8wluXk
   cENtWWInURhfEWaEtNFEayf8fRD9glzxK5g+7edETeNr6xd1p2NlkUncN
   g==;
X-CSE-ConnectionGUID: l9aT8EHcRUy8Ycvgak6Qzg==
X-CSE-MsgGUID: ODiIIPsbSNa+3FdjSU7NOQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgC+wTRq/5D/Ja1aglmCV3ReQ0mTWgGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUGjUoCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GXSsLARgBLTBcRIMCAYJzA7MIgXkzgQGDKAGBVNssAQsUAYE4hT+IH?=
 =?us-ascii?q?3MBhHwnGxuBcoR+hAoqXIV4BIIigQyBeI8wSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EMGwcFgR6Be4EChQMjHwM5f4FogSVnZhUwNYEBAREfCoEkA?=
 =?us-ascii?q?wsYDUgRLDcUGwQ+bgeMdxcPgj2BDiyCPQeTYpF8oQ8KKIN1jCGVOhozhASma?=
 =?us-ascii?q?JkIglmLMZZQhGiBaDyBWXAVgyIJShkPlzbAAicyAjsBAQcCBw4DC4FokAACJ?=
 =?us-ascii?q?oFVAQE?=
IronPort-Data: A9a23:tc9sPaiJ0eneTj1ubxu91AZzX161NhEKZh0ujC45NGQN5FlHY01je
 htvDWmHMvmON2T9eotxYI+xoEgH78CEmIJmQAVrrHsxEXhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeDULOZ82QsaDxMtfvT8E8HUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUcq+9LUUxu/
 sYlOWA8ZQ6MjuHo+aC0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgt/5JEWxI9EglH/cTRUr1S9rqss6G+Vxwt0uFToGIaFKobbH58NwC50o
 Erh02XYIykBPue5wHne3H6uvdKQuwTCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:XnlP464UlvP4GR4c6wPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3AWYDx7Wjg14Y+ZYe7D9aI/0Cs1jJudizU8Cf9A0S?=
 =?us-ascii?q?CNHc5ebaLRlaTppp2nJ87?=
X-Talos-MUID: 9a23:X57PywkUGKJqNM/qYVwRdnpFGMZJwpy1AnsrmNZdlcWGDhEvHRCk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,212,1774310400"; 
   d="scan'208";a="488292206"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Jun 2026 04:14:17 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 6473B1800049A;
	Fri, 19 Jun 2026 04:14:17 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id E3C05CC1611; Thu, 18 Jun 2026 21:14:16 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-networking][scarthgap][PATCH 2/4] libtdb: upgrade 1.4.10 -> 1.4.13
Date: Thu, 18 Jun 2026 21:14:12 -0700
Message-Id: <20260619041412.2621468-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 04:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127675

From: Himanshu Jadon <hjadon@cisco.com>

Update tdb to the version used with newer Samba releases
in upstream meta-openembedded.

This is a prerequisite for upgrading Samba to 4.22.10 on
Scarthgap.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 .../libtdb/{libtdb_1.4.10.bb => libtdb_1.4.13.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.10.bb => libtdb_1.4.13.bb} (96%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
similarity index 96%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
index bd3f9f63a9..6342459154 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.13.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "02338e33c16c21c9e29571cef523e76b2b708636254f6f30c6cf195d48c62daf"
+SRC_URI[sha256sum] = "5ee276e7644d713e19e4b6adc00b440afb5851ff21e65821ffaed89e15a5e167"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.35.6


