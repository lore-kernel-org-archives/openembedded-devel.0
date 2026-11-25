Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36132.1795583897000547374
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YjX0q46E;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3619; q=dns/txt;
  s=iport01; t=1795583897; x=1796793497;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cs89PQsmOPcG5rLP9bk6nrU2eIrPI4IUCSN23yLTZwc=;
  b=YjX0q46E6wQJ29yHAGPvlTAcEGoQc9ME52FyyAeQl7EKNUa5kJpI00LP
   QmgZ5DWNgUjeg/jy6/O6jORGBwYsWIjG9yM8VlC9h2MDNWGBThZDo56i1
   Bu9a6UewXapxAs9mmSpXSpVe9nUxiwlbxyrlFa3iee6m9UMLWypsS16AR
   yfMmZ+JlnslzshvQ4qIYrYSAYYYK1EA7JjXA8+pe36C+nbc9tYNvm5n/s
   mxoE0qvmJ1WqVhP0a/mW+TdYJ4NKwzy82XHS0Pvmx4o1WpqzJTr06Ds7C
   fa+ZqNttgAiG3VQqj6m785IbW+b9wWtBMO4Mb73LRf3wpGCS7xdnbX8Xy
   g==;
X-CSE-ConnectionGUID: 0A9w1rSCTSCbe9dp56rbQg==
X-CSE-MsgGUID: d3s+jQK/QryMIgEni43PcA==
X-IPAS-Result: =?us-ascii?q?A0BbAwAGbgZr/9BK/pBaglmDTGBDSZNaAYJwniyBfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY4kAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZckBU2ARgBGxIwXESDAgGCdAO6EoIsgQGDKQGBVNs/FYE4hUKIJXaEf?=
 =?us-ascii?q?icbG4FyhH+EG4ZuBIINFXoShHaJcYFLiFJIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyhdASGBCIF1AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8G?=
 =?us-ascii?q?wqBDCcdHhkOAikGFiELNBgNSBEsNxUZBD5uB5QTgxsBgQ4qgW5OkyY8CpF6g?=
 =?us-ascii?q?TWfXAoog3mMJJU6GjOqcpkIpAtQhGqBaDyBWXAVgyIJShkPjisZHNIfJjICO?=
 =?us-ascii?q?wIHAgcOAwuRaYF9AQE?=
IronPort-Data: A9a23:w7LrRa6sbbEL8ZLa763rpAxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mEfWGnXM/yNZGLwLo92btu0/UIFsZeBzdNnTFdl/3sxZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZaRJ5b9tOkpyz
 tcSJWEBdk3dneiPz+fuIgVsrpxLwMjDNY4F/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO00n1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FboKLI4PbG5s9ckCwq
 jndvGbAIVYjLs266DWo9HPw3dfEtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:OX962a+lduAVSil9Pj9uk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:Qd1uJWDe29ij2wn6E3FOpVFNAPsOTkb2xnqBL1flV3xjcbLAHA==
X-Talos-MUID: 9a23:VWt3fAbh8EWrVOBTu2T3xzNbF4BR+bWLKU8gl5Ra4PGPHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60617966"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:18:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id B3EB718000214;
	Wed, 25 Nov 2026 05:18:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 66ADECC1611; Tue, 24 Nov 2026 21:18:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 0/9] python3-aiohttp: backport fixes for ten CVEs
Date: Tue, 24 Nov 2026 21:18:02 -0800
Message-Id: <20261125051811.2524271-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 05:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132966
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport fixes for ten CVEs to aiohttp 3.9.5 on Scarthgap. The
series covers HTTP parsing, cookie handling, multipart resource limits,
and the initial request-header timeout.

Patch 8 carries CVE-2026-69243_p1.patch and CVE-2026-69243_p2.patch,
followed by CVE-2026-69243_CVE-2026-128129.patch. The shared patch
backports upstream commit 3d850ee9 to limit buffering while an
upgrade is pending and records both CVEs for cve-check.

All 44 recipe patches applied without fuzz or rejects. The C parser
built against native Python 3.12 and 69 focused tests passed.
Loopback tests cover idle and partial-header expiry, plus upgrade
requests with nonempty bodies and trailing HTTP bytes. Both parsers
handle Content-Length and chunked framing with combined and split
writes. The C parser rejects malformed status-line input and
includes the rejected line in its diagnostic.

Darsh Kelaiya (9):
  python3-aiohttp: fix CVE-2026-111750
  python3-aiohttp: fix CVE-2026-111749
  python3-aiohttp: fix CVE-2026-111748
  python3-aiohttp: fix CVE-2026-111066
  python3-aiohttp: fix CVE-2026-111065
  python3-aiohttp: fix CVE-2026-111064
  python3-aiohttp: fix CVE-2026-111063
  python3-aiohttp: fix CVE-2026-69243 and CVE-2026-128129
  python3-aiohttp: fix CVE-2026-69244

 .../python3-aiohttp/CVE-2026-111063_p1.patch  | 122 ++++
 .../python3-aiohttp/CVE-2026-111063_p2.patch  | 257 +++++++
 .../python3-aiohttp/CVE-2026-111064.patch     | 398 +++++++++++
 .../python3-aiohttp/CVE-2026-111065.patch     | 171 +++++
 .../python3-aiohttp/CVE-2026-111066_p1.patch  | 397 +++++++++++
 .../python3-aiohttp/CVE-2026-111066_p2.patch  |  59 ++
 .../python3-aiohttp/CVE-2026-111748_p1.patch  | 410 +++++++++++
 .../python3-aiohttp/CVE-2026-111748_p2.patch  | 259 +++++++
 .../python3-aiohttp/CVE-2026-111749.patch     | 197 +++++
 .../python3-aiohttp/CVE-2026-111750.patch     |  84 +++
 .../CVE-2026-69243_CVE-2026-128129.patch      | 673 ++++++++++++++++++
 .../python3-aiohttp/CVE-2026-69243_p1.patch   | 300 ++++++++
 .../python3-aiohttp/CVE-2026-69243_p2.patch   |  93 +++
 .../python3-aiohttp/CVE-2026-69244.patch      | 248 +++++++
 .../python/python3-aiohttp_3.9.5.bb           |  14 +
 15 files changed, 3682 insertions(+)
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
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_CVE-2026-128129.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch

-- 
2.35.6
