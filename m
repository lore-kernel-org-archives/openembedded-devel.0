Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36199.1795584014492685300
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Sogi+x2h;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1919; q=dns/txt;
  s=iport01; t=1795584014; x=1796793614;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qzcFsEoDF+F6fb+eDjK1HF94gFstdy8PDfOtYlMsxX0=;
  b=Sogi+x2h9zpMrqH1UnldeTNXQ3STuj9g6nkMD3z3IZAQt4er1hsEjhD/
   w/YY3Y+elaR3RwMoyJiM/66cynySV1WUGB93nrgoI74UCijm3wTyHCn1o
   q/8er66rgceJEiqA9sWgH6x6ir3d6piklxwimhW/YQUujzTWQMuQSU243
   NjfigxlQZLJc1/T7oqDNF19vnzW+6EYxyvszstja3BDVKutGgvuwssP/U
   FiKmB3893TtOxr2nfwp1VG4bGv8MvcGXs7petAUElHEYLJQKqZEw2rWi9
   aCwHMUj4s5yl8Fk1MMTdqfdFpX6EyZs+89G3zNH6hlPHPpVilcLoZDgyw
   A==;
X-CSE-ConnectionGUID: 9/ZhPuqST42RR959Wknwsw==
X-CSE-MsgGUID: ELHxQJmbTu6fv4sdKBLU7A==
X-IPAS-Result: =?us-ascii?q?A0BGAgAhbQZr/8tK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9KBwQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEwIBAzIBGAE9IDErKxmDAgGCdAIBEQa5fYIsgQGDKQGBV?=
 =?us-ascii?q?NszAQsUAYE4hUKIJXUBhH4nGxuBcoEVg2qBBYFcAQECgiuFeQSCIoEMjmeKH?=
 =?us-ascii?q?UiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErK?=
 =?us-ascii?q?F4hgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnC?=
 =?us-ascii?q?xoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhCzQYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geUE4MUBwE8USwEHIEAgQyldaERCiiDeYwklToaM6pyC5h9jgqVaGmEaoFoP?=
 =?us-ascii?q?IFZcBWDIglKGQ+OOYNrzlsjNQIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:JKqws6zZtFiD9Kdeddl6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkUAm
 DBMWm6FM/nbYjP2c9FzaI/gpEJUsJaHmtYyQQprq1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaD9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBBxD40g5/9MPT0Uz
 8ZJdWEybRacnP3jldpXSsE07igiBMDmJsYb/3pn1zycVaxgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkybC/FMEg9/5JYWlfywj2P6eidwo1OOrq1x6G/WpOB0+Oa1a4GFJoDTLSlTtmu8h
 nL/3WHzPgxEOsLD0jam2FaR2caayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1zfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:9ENcTamJ54lcq/W0jVIVc+LLpr3pDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3A4OiF0mhn0WpXFcpZSarfp59gtTJuIzrvzE/NOnS?=
 =?us-ascii?q?EVTxTcuzIGGCT/rx/jJ87?=
X-Talos-MUID: 9a23:7xYRgQbfHYfYsOBTmhvMlAhAMc1U/vqgFhwWnbYsn/TbHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60338441"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:12 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 4DCF918000A64
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:12 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 85988CBF230; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 08/10] python3-aiohttp: ignore CVE-2026-128131
Date: Tue, 24 Nov 2026 21:20:04 -0800
Message-Id: <20261125052006.3116497-9-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052006.3116497-1-asparmar@cisco.com>
References: <20261125052006.3116497-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132978
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

The current sources do not include the concatenated gzip/deflate or
Zstandard member iteration that introduces this issue [1]. Both
decompressors pass the input to a single decompressor without the
loops introduced by [2] and [3]. The existing recipe patches do not
add those loops.

Use not-applicable-config for the absent implementation; OE-Core maps
this status to the vulnerableCodeNotPresent VEX justification [4].
The aiohttp:aiohttp product identifies the correct component, so
cpe-incorrect does not describe this case.

[1] https://github.com/aio-libs/aiohttp/security/advisories/GHSA-h4cc-hm5h-fmm9
[2] https://github.com/aio-libs/aiohttp/commit/2049ba85701586fb065378787a74f99eb2b91108
[3] https://github.com/aio-libs/aiohttp/commit/374fb1dc29baa5e5b11a113ce1a5d0d04116f8e3
[4] https://github.com/openembedded/openembedded-core/blob/16a03ed6c2db2fa1d7edac4f288a74958a00eb9f/meta/conf/cve-check-map.conf#L29-L31

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
index 1ddfec27aa..91d11cf124 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
@@ -43,6 +43,7 @@ SRC_URI += " \
 "
 
 CVE_PRODUCT = "aiohttp:aiohttp"
+CVE_STATUS[CVE-2026-128131] = "not-applicable-config: The current sources and recipe patches lack concatenated-member iteration in ZLibDecompressor and ZSTDDecompressor."
 CVE_STATUS_GROUPS = "CVE_AIOHTTP_FIX_3_13_4"
 CVE_AIOHTTP_FIX_3_13_4[status] = "fixed-version: fixed in 3.13.4"
 CVE_AIOHTTP_FIX_3_13_4 = "CVE-2026-22815 CVE-2026-34513 CVE-2026-34514 \
-- 
2.35.6

