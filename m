Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287F2C624CC
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 04:57:52 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23002.1788152269150094967
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2026 21:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Rj7xclrw;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2673; q=dns/txt;
  s=iport01; t=1788152269; x=1789361869;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ck7pPZm8B/r6VlxA+PyOrvq51Q/aEZqWAsz2aK8agoM=;
  b=Rj7xclrw10VkoGIdXd+l46kk1SiQvPZemDn2NO/29iur3gNQqiJaGmmj
   heS02H8e1k53LJ9vhguoJgACzQcG/i7ZDlPpYuk7y1v+kdsM5sDAy9OIf
   bpPZwDFbswe2ACYdWI5owEy4vcNjMlba25KTTVcqUlLvSJ09GfrYbgilI
   nW/qRXyTPOCfUEv14Vxr+u/XFsCSlrpnFnbpyPg/H8n7OKlvG1SDKGTsI
   rq5tFmp2I+vkRZUYl3WYIXtlQmFfWgZx5VeCjqvbphRKWPZ7BW7UimIqh
   09es33EQgN+eLj31b5TMY9lKf8i7sU+qgscfeBTsmReeDjz0F6JUwlffM
   w==;
X-CSE-ConnectionGUID: dHt7qcdyQmOqk+aZlPh5XA==
X-CSE-MsgGUID: /OGkdAAuThmpMY8QXVhjDg==
X-IPAS-Result: =?us-ascii?q?A0BaAwCvCJVq/5UQJK1aglmDS15DSZNZAYJwnh6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY11AiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDwhSCLIEBgygBgVTbPBWBOIU/iCJ2hHwnG?=
 =?us-ascii?q?xuBcoR+hDRchXgEgiJ6EpN5SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4ENGwYFgR2BKIQPIxk2eoEJXoErKWABEheBCYIIAoJaggUCAUlDDgdHUwkEC?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB456H4JLgQ8wdiCBERiTH5I/oQ8KKIN2jCKVOhozqmyZC?=
 =?us-ascii?q?KQNTYRpgWg8gVlwFYMiCUoZD95cJzICOwIHAgcOAwuRai2BTwEB?=
IronPort-Data: A9a23:DhJzRa+WQwWE/A+rMkSaDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2sfCD+BafreNGvyf9siaIvipkIHv5ODzIQxSQpqqH1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjlMs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k6HZFH4+17EFhL0
 uUbazk/aiiD2tKflefTpulE3qzPLeHiOIcZ/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cMnWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZC9aoGKIozXHp09ckCw4
 UXp/GjQKwwmNNmH7AvVy0KShu3jknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:uhzueqBjejRpe+PlHema55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:YUGgqGHe0gjq4VZsqmJr1FJLA8spY0TY627TYEaKDV5pFY28HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AMv6p6A4gDeYRKqSCBHO7FQC/xowvxIutBGkkjKk?=
 =?us-ascii?q?GvtGhBHxJCwmdjhi4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208";a="823708530"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 04:57:48 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 2E40E1800014F;
	Mon, 31 Aug 2026 04:57:48 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C3043CCA79B; Sun, 30 Aug 2026 21:57:47 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 0/9] python3-aiohttp: fix multiple CVEs
Date: Sun, 30 Aug 2026 21:57:35 -0700
Message-Id: <20260831045744.3321483-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 04:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129601

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport nine upstream aiohttp security fixes to the 3.9.5 recipe on
scarthgap.

The corresponding fixes are available in aiohttp 3.14.0 and 3.14.1.
Carry them as focused backports instead of upgrading the recipe because
the 3.14 release also introduces new APIs, deprecations, and
backward-incompatible behavior outside the security scope.

The individual commits retain the upstream fix provenance and public
advisory references for each CVE.

Testing:
- Applied the nine layer commits to the upstream scarthgap baseline.
- Applied all nine embedded patches to aiohttp 3.9.5 in series order
  with no conflicts or fuzz.
- Package build and image build validation completed successfully.

Darsh Kelaiya (9):
 python3-aiohttp: fix CVE-2025-69224
 python3-aiohttp: fix CVE-2025-69227
 python3-aiohttp: fix CVE-2025-69229
 python3-aiohttp: fix CVE-2025-69223
 python3-aiohttp: fix CVE-2026-22815
 python3-aiohttp: fix CVE-2026-34514
 python3-aiohttp: fix CVE-2026-34513
 python3-aiohttp: fix CVE-2026-34993
 python3-aiohttp: fix CVE-2026-34518

 .../python3-aiohttp/CVE-2025-69224.patch      |  161 +
 .../python3-aiohttp/CVE-2025-69227.patch      |  163 +
 .../python3-aiohttp/CVE-2025-69229_p1.patch   |  113 +
 .../python3-aiohttp/CVE-2025-69229_p2.patch   |  256 +
 .../python3-aiohttp/CVE-2025-69223.patch      |  848 +
 .../python3-aiohttp/CVE-2026-22815.patch      | 1020 +
 .../python3-aiohttp/CVE-2026-34514.patch      |   65 +
 .../python3-aiohttp/CVE-2026-34513.patch      |  211 +
 .../python3-aiohttp/CVE-2026-34993.patch      |  364 +
 .../python3-aiohttp/CVE-2026-34518.patch      |   64 +
 .../python/python3-aiohttp_3.9.5.bb           |   19 +
 11 files changed, 3284 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69223.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-22815.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34514.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34513.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34518.patch

-- 
2.35.6

