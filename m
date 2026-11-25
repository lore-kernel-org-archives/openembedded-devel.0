Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36199.1795584014492685300
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hYnpLuCJ;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1396; q=dns/txt;
  s=iport01; t=1795584015; x=1796793615;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=D4vtODZzi2Ys4lyDQItoKK5c2KrBQ4tUgrWV3eFoi8o=;
  b=hYnpLuCJzCnvPj1Wh7w3Ky3hsIQ8C2/i63H27GF1A9r4HZs+M4oqNMlI
   +8S+hc9TVxqowAerRyh0DVsjgieWSrcSBZnC6856nixW1oiDWjLgqGamH
   Dh+pCqR/9ybNkzWGTt2TNrcZjF045MHhfRS/8OWz3avWsBEcYkOLB70vl
   xxqElwnPF1lgnS7TQmjzRyM9SRMPHf68Rrs/friEfZ78pNFvDOq6GWO5e
   9Ufz1ZnNa5Cu3Um4KEA4Ehjm8p/JaNCtglO6xiETt3V5TF1ndoOabXlO7
   EZD6IyQfsjjtB/0cX1uixgA/xipGK2vWPLLT0G98hq6vFPy2DzNhsu+7c
   g==;
X-CSE-ConnectionGUID: JFS/FgVzS72k0rli6Swoog==
X-CSE-MsgGUID: jBAQ6O9rQHKx/6mkFHO6Jw==
X-IPAS-Result: =?us-ascii?q?A0BGAgAhbQZr/8xK/pBaglmCV3VhQkkDlCeCJJ4pgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAzIBViACLysjCBmDAgGCdAIBEboDgiyBAYR+2zMBB?=
 =?us-ascii?q?QYUAYE4hUKIJV0ZhH4nGxuBcoEVg2qBBYFcAoEngQaFeQSCInoSjmcCihtIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheI?=
 =?us-ascii?q?YEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaB?=
 =?us-ascii?q?WEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CKQYWIQs0GA1IESw3FRkEPm4Hl?=
 =?us-ascii?q?BODGwGBDSyCLKV1oREKKIN5jCSVOhozqnKZCI4KllGEaoFoPIFZcBWDIlMZD?=
 =?us-ascii?q?445J4NEzlsjNQsDLwEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:HiTtgKwOT1GNxshuR056t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVWm
 GIZDT2GO6uCMWL1fYoiaYXn9UME7JXdn9BnSFRupVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaD9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGMYBso29dhlOj4U9
 qQCLDFTVQ+EgO3jldpXSsE07igiBMDmJsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkycC/FMEg9/5JYWlfywj2P6eidwo1OOrq1x6G/WpOB0+Oa1a4GFJoDRLSlTtkSyj
 1uY2DXjOzE5JJvBzDmr0lXypPCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EhpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:WgWiYKlRZF/4PzQumWWexih4auHpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:Y0XoP2PIH+Fu0u5Degdcs2AbJNIeLSfelG3UIhGDFmFuR+jA
X-Talos-MUID: 9a23:06pVIwnn6dZMli8x0rJ8dnpgHu5RvYP/EnktsoVB5cyHGwxXZRWC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60338443"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:20:12 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 74E9118000855
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:20:12 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 8D60BCBF23C; Tue, 24 Nov 2026 21:20:09 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 10/10] python3-aiohttp: mark CVE-2026-128130 patched
Date: Tue, 24 Nov 2026 21:20:06 -0800
Message-Id: <20261125052006.3116497-11-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125052006.3116497-1-asparmar@cisco.com>
References: <20261125052006.3116497-1-asparmar@cisco.com>
MIME-Version: 1.0
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132980
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

The existing CVE-2026-54273_p2.patch backports aiohttp commit
47babd8c23ca79e2bae6cc8dcb5752b61e369fc7. The upstream
advisory also identifies that commit as the fix for
CVE-2026-128130. Its CVE: field names only CVE-2026-54273, so
cve-check does not credit the second CVE.

Add CVE-2026-128130 to the existing field. The source fix is already
present; this commit changes only patch metadata.

Reference: https://github.com/aio-libs/aiohttp/security/advisories/GHSA-28qf-cpwq-vmc2

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python/python3-aiohttp/CVE-2026-54273_p2.patch              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch
index c6a318798d..2267f0a44e 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch
+++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch
@@ -9,7 +9,7 @@ Subject: [PATCH] [PR #13356/72eaa429 backport][3.14] Stop handing back
 
 ---------
 
-CVE: CVE-2026-54273
+CVE: CVE-2026-54273 CVE-2026-128130
 Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/47babd8c23ca79e2bae6cc8dcb5752b61e369fc7]
 
 Backport Changes:
-- 
2.35.6

