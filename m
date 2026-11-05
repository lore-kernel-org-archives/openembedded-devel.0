Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28856.1793862501882047726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bbGyucgv;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2392; q=dns/txt;
  s=iport01; t=1793862501; x=1795072101;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bkdywBTR5V9mL4uUwF9YaQhanJK8IHhvwAvUaLpp2xc=;
  b=bbGyucgvrYfgLjsJtR7pO456E1NkTqjTjk+x33IRQNczM4ZMygtIw5CM
   RC0SViRJlqyVlFj9wM3Q58zI1s5I/BOiyVG2SgaUAgEVRHXO+YGEM+JT0
   JsOWVTvi8BNDLqpf9+JhxYGIvInt5iuy/TH/XUU4NS9uiZHjLexyeqZz/
   jGhxn7u4EzKUmhgYUkT6bgCWL6hD9y9XFqpiApMnUb5n77KwjWTGkfYLA
   2bMDKxxLaaKys+mfzqK7eg7kpcKGlqU/pTjqyP/le5lUUVWUICco4PpxM
   o3QaTVtfl7wrtVDT6te/oYBSv95/fWjBgIwYnO/W+7V8ylKVnIRrVzi8h
   g==;
X-CSE-ConnectionGUID: n0KsrB/VTQetybRQceN1rw==
X-CSE-MsgGUID: vEg7DPhITm2sIs3Yj2sjzQ==
X-IPAS-Result: =?us-ascii?q?A0BXAwDDKuxq/47/Ja1aglmDTGBDSZQqoEWBfg8BAQEPN?=
 =?us-ascii?q?xoEAQGTJAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?JBLARgBG4Eeg0YBgnQDvFCCLIEBgykBgVTZS4F0FYE4jWN2hH0nG4FJRIR+h?=
 =?us-ascii?q?RCFeQSDHBKQRoZxSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?i+DEYEPgleldqERhCqMJJU6GjOqcZkIpA5NhGmBaDyBWTMaCBsVgyIJShkP4?=
 =?us-ascii?q?H8mMgI7AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:eSHLbqxtranBjwF2iwZ6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUCy
 DQWXDiDaareYDenKdl2b4u3phxV68eAmIcwSABs+VhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEduHpYC0KFJPVhD6
 e0SEgkGYzbanf3jldpXSsE07igiBNPgMIVavjRryivUSK57B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOXWjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeSxa4KJK4zVLSlTtli1q
 T3qx2TYPhRAL/2EkguHqGmulNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:GWzOLK62c3R1eGeKAQPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:kS+252G9cuD+UnbyqmJhrG0PAOpiTEHkwWvBKXWBAmtPEaeKHAo=
X-Talos-MUID: 9a23:gpuavAQqUmMQinKnRXTyqT49GP9owpirUlssis43uZOfNz5JbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544304987"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:08:21 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id F39CE18000201
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 07:08:20 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 9B1C7CC12A6; Wed,  4 Nov 2026 23:08:20 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 0/6] python3-tornado: Security fixes
Date: Wed,  4 Nov 2026 23:08:13 -0800
Message-Id: <20261105070819.2086816-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131862
Content-Type: text/plain; charset="utf-8"

Backport 11 python3-tornado security fixes covering 6 CVEs to the python3-tornado
6.5.7 recipe on wrynose. The series adds the fixes as patches and updates
the recipe to apply them.

CVE-2026-103263 fix inclued dependent patch, CVE-2026-116577 and
CVE-2026-116578 fix is carried in three patches. The patches
retain upstream references.

Yogita Urade (6):
  python3-tornado: Fix CVE-2026-103261
  python3-tornado: Fix CVE-2026-103262
  python3-tornado: Fix CVE-2026-103263
  python3-tornado: Fix CVE-2026-115927
  python3-tornado: Fix CVE-2026-116577
  python3-tornado: Fix CVE-2026-116578

 .../python3-tornado/CVE-2026-103261.patch     |   98 ++
 .../python3-tornado/CVE-2026-103262.patch     | 1117 +++++++++++++++++
 .../CVE-2026-103263-dependent.patch           |  255 ++++
 .../python3-tornado/CVE-2026-103263.patch     |  422 +++++++
 .../python3-tornado/CVE-2026-115927.patch     |  397 ++++++
 .../python3-tornado/CVE-2026-116577_p1.patch  |  195 +++
 .../python3-tornado/CVE-2026-116577_p2.patch  |   99 ++
 .../python3-tornado/CVE-2026-116577_p3.patch  |  101 ++
 .../python3-tornado/CVE-2026-116578_p1.patch  |   62 +
 .../python3-tornado/CVE-2026-116578_p2.patch  |  106 ++
 .../python3-tornado/CVE-2026-116578_p3.patch  |  192 +++
 .../python/python3-tornado_6.5.7.bb           |   11 +
 12 files changed, 3055 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103261.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103262.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263-dependent.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-115927.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p3.patch

-- 
2.35.6

