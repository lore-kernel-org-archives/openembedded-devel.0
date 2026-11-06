Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1348.1793950037451418294
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Hg7Yga0y;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2636; q=dns/txt;
  s=iport01; t=1793950037; x=1795159637;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IcdhdHWb6SmIjrIFyJC6KN0vFrAPkkn2FhY+yoxaPcc=;
  b=Hg7Yga0yUQ27t84QKvAeQ0aWz/XEapmumySNLh5kXmAjkinaPNDLFARz
   MKdZtf94YR182/aMSCBVKyPTfOoMURmpeto4GfEoCi5HtzLtYxk0opcLc
   hgPwZOpST+WxgCB6sZsKQjAZSmGGP6Kc59BES/2eE8y3c+2J/e9gIqALL
   zUpNtIN738wKuNM+IfuAW4lPYXuGpQ6ZlP+iVj6OwLrMeU926G/jTJUej
   eqwCzPKrR5UNr7BDjRWodTl00LmMz8HsjlCnXddLdNLnFWNPZQGCa7hva
   SwFcymsnK/OhtEZdwwx2lGScdCD8KZQXkXfLGCwltvPcFlPNCgz/doJvk
   w==;
X-CSE-ConnectionGUID: DexYAIZaRgGXvtLwK+8EAQ==
X-CSE-MsgGUID: /gIt1BCzTD+SEuHh+yIPag==
X-IPAS-Result: =?us-ascii?q?A0BaAwBpgO1q/5D/Ja1aglmDTGBDSZNaAaEUgX4PAQEBD?=
 =?us-ascii?q?zcaBAEBhQWOHwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXJAVNgEYAS0wXESDAgGCdANXu02CLIEBgykBgVTbPxWBOIVAiCN2hH0nG?=
 =?us-ascii?q?xuBcoEVg2mFEIV5BIINFXoShH+Jc4FThnlIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+G?=
 =?us-ascii?q?wovGA1IESw3FRkEPm4Hkj2DEoEPglIFD6VnoREKKIN4jCSVOhozqnGZCKQLU?=
 =?us-ascii?q?IRpgWg8gVlwFYMiCUoZD1gJ3XQmMgI7AgcCBw4DC5FqLYFPAQE?=
IronPort-Data: A9a23:OGy3jq2WwueLaq5twPbD5YNwkn2cJEfYwER7XKvMYLTBsI5bpzEBz
 DMXDGuAbquLMGX3c912OtywpBxS65DWxtRkSwRp3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGIEwmDKQ5yO9NDk5+6
 +A8NxNOPj2qvrfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OWxbYeMIoDWHK25mG7fq
 UPapk7SEC02d+ey1BqFsWONvubAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:No3kmKCNkxXoOvvlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:18Ck8291i5I9bltMHIWVv2IZCvEMU0/U9nj/E1GkLXlKC+24YGbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3APPSC3g7Miw2Yhcj/Q21+BjaLxowv7IWyUWomg6k?=
 =?us-ascii?q?q+PKpKAxweCa8tD24F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545510441"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:27:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 74543180003DA;
	Fri,  6 Nov 2026 07:27:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 1E9B0CC1611; Thu,  5 Nov 2026 23:27:16 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 0/7] python3-aiohttp: Security fixes
Date: Thu,  5 Nov 2026 23:26:55 -0800
Message-Id: <20261106072702.502813-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2026 07:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131963
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport seven aiohttp security fixes to the 3.13.5 recipe on Wrynose.
The series follows the upstream fix order. The fixes and included
corrections are present in upstream 3.14.4.

The fixes cover multipart descriptor exhaustion, HEAD request body
framing, host-only cookie scope, Max-Age overflow and response cleanup,
request-scheme spoofing, Secure shared-cookie leakage, and the initial
idle-connection deadline.

Include the upstream descriptor-test, authority-validation and
trusted-origin corrections with their corresponding CVE fixes.

Darsh Kelaiya (7):
  python3-aiohttp: fix CVE-2026-111066
  python3-aiohttp: fix CVE-2026-111750
  python3-aiohttp: fix CVE-2026-111749
  python3-aiohttp: fix CVE-2026-111065
  python3-aiohttp: fix CVE-2026-111748
  python3-aiohttp: fix CVE-2026-111063
  python3-aiohttp: fix CVE-2026-111064

 .../python3-aiohttp/CVE-2026-111063_p1.patch       | 137 +++++++
 .../python3-aiohttp/CVE-2026-111063_p2.patch       | 244 +++++++++++++
 .../python/python3-aiohttp/CVE-2026-111064.patch   | 285 +++++++++++++++
 .../python/python3-aiohttp/CVE-2026-111065.patch   | 176 +++++++++
 .../python3-aiohttp/CVE-2026-111066_p1.patch       | 400 +++++++++++++++++++++
 .../python3-aiohttp/CVE-2026-111066_p2.patch       |  57 +++
 .../python3-aiohttp/CVE-2026-111748_p1.patch       | 376 +++++++++++++++++++
 .../python3-aiohttp/CVE-2026-111748_p2.patch       | 282 +++++++++++++++
 .../python/python3-aiohttp/CVE-2026-111749.patch   | 205 +++++++++++
 .../python/python3-aiohttp/CVE-2026-111750.patch   |  83 +++++
 .../python/python3-aiohttp_3.13.5.bb               |  10 +
 11 files changed, 2255 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch

-- 
2.35.6
