Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27345.1793854576653952957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Tq3qxdiD;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1204; q=dns/txt;
  s=iport01; t=1793854577; x=1795064177;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EtUErMX/FFL3bcoGajubbov8Jy+n2JGbkUIZtlZ0/Ew=;
  b=Tq3qxdiDLc9xbWbdqY26tAPllXORZ1m4myUXAuHSTjp5ULhAcl163UV/
   C9/kJGxmQ8N40NXxU5bFkX1KZNXMg08EcfZEf7prJzoXDr5VEXS5TYWmG
   OohrAjWxsaDVnQciBvosy51MsCGeKXS367dLB9F1fkk8I25bZ/YSzWI5z
   r2yNEM7tOXvibqcRvsVZHlPBY8EDvJmW98yW6ypmf4uIqwmF7ox4bdgaC
   sousm2bju/mJUCwYn1ITSotwfQmz2wsxWZ+It89UQE1x7ihKmYK9rkA/s
   6eTYw/XGK3r/yQZ/mf6a4AFUpOg+te/OFwixX7Iy4+vXv4hmLQg4v0j9Z
   A==;
X-CSE-ConnectionGUID: yzn6MzWaS+GtsWg/DVst8A==
X-CSE-MsgGUID: RPmyyf57TraBJcJXLq2z+A==
X-IPAS-Result: =?us-ascii?q?A0BEAgCOCuxq/5D/Ja1aglmCV3VhQkmUKoIkniGBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEwIBAycLAVYgMSsrGYMCAYJ0AgERvEeBeTOBAYR+2zMBBQYUA?=
 =?us-ascii?q?YE4hUCII3aEfScbG4FyhH6BBQqBUgKBJ4EGhXkEgiKBDI5yiERIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyheIYEIgXYCg?=
 =?us-ascii?q?lGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIAg0Mc?=
 =?us-ascii?q?jkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MRgQ4sgWymNqERCiiDeIwkl?=
 =?us-ascii?q?ToaM6pxmQiOCpZRhGmBaDyBWXAVgyJTGQ+OKw4LHINEzlMjNQsyAQEHAgcOA?=
 =?us-ascii?q?wuBaJAAgX4BAQ?=
IronPort-Data: A9a23:QJAW66i/tw1jAIr8rdkMqBQrX161MREKZh0ujC45NGQN5FlHY01je
 htvUWqOPvqMMDPzcoolOYi29E1U7ZDXzd9jTlY5qH08Qi1jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvrf8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUJ6OApJHNx/
 MdbBywWUR/Eq9yt3OKSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgt/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIJoDQHpsKxBnwS
 mTuxVz8EwAUaYOj0zOv0HmOtsvWxzG4cddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmEHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:dMwFbK0s6HgCStU+/uG1sgqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:X/mUOW9ei2GA00i8RViVv18GHJ4AYELU9zT/P1SHBiFFdqaJGXbFrQ==
X-Talos-MUID: 9a23:0c5+oApyRlheP5HDB/QezwtaMdZ57fnxNFoEu7cNmfmgLHZieB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544236727"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:56:15 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id C3B0A180003DC
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 04:56:15 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 26BA3CC2EF3; Wed,  4 Nov 2026 20:56:15 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 8/8] python3-pyjwt: fix CVE-2026-32597 test indentation
Date: Wed,  4 Nov 2026 20:56:14 -0800
Message-Id: <20261105045614.2677776-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105045614.2677776-1-hthakar@cisco.com>
References: <20261105045614.2677776-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 04:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131859
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Correct the indentation of the unknown critical-header regression test
in the CVE-2026-32597 backport [1]. The malformed method definition
prevents pytest from collecting tests/test_api_jws.py and blocks the JWS
regression suite.

[1] https://github.com/jpadilla/pyjwt/commit/051ea341b5573fe3edcd53042f347929b92c2b92

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
index c38628d0b3..20e25aa911 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
+++ b/meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
@@ -99,7 +99,7 @@ index 3385716..434874b 100644
          assert len(record) == 1
          assert "foo" in str(record[0].message)
 +
-+        def test_decode_rejects_unknown_crit_extension(
++    def test_decode_rejects_unknown_crit_extension(
 +        self, jws: PyJWS, payload: bytes
 +    ) -> None:
 +        secret = "secret"
-- 
2.35.6

