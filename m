Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67660CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:42:46 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16158.1792132955972226208
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RX8+zzls;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1464; q=dns/txt;
  s=iport01; t=1792132955; x=1793342555;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W+F771wx4E6cfK5VoNx+crRVCjajwFFP02LLuMDTPxc=;
  b=RX8+zzls//m2e0mHof5AUjJ34kI18eBjpMsKW+II25YG4Vv7N04/4Hzp
   CWOb2TOvzKGtfzxN6iA2u+okkc5O4AtKg0YY+JPe9nRvh3aAvQBkM58k+
   0yJbsotjk8L17X799GnF/fD2ot75nbyfwesym3x4uKxRCbZn1FYC/GZqX
   wfqo9FzLughCBCItbB3k9saCaoIPkdi6FEuu+bzWAFvqi/8SZdo27+wFn
   7s27evumYIUoNra7zjrU63BW8HuhFQE9Xxx7uPmY34v31ycUIja1BOTl5
   uNd+c3ft0kOUqHtxBIW/7QWkIFvtJ8aWCA4TeTT/yKrmv0LISYzzrliID
   w==;
X-CSE-ConnectionGUID: 8eTvSZ4LRJmj4N2cmkQC0g==
X-CSE-MsgGUID: X7fdx82gQtmLDirNwpBS2A==
X-IPAS-Result: =?us-ascii?q?A0BcAwDLxdFq/5X/Ja1aglmDTGBDSQSTVQGCcJ4fgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQWOFwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QFTYBGAEtMFxEgwIBgnQDEbx6giyBAYMpAYFU2z4VgTiFQIgjd?=
 =?us-ascii?q?oR8JxsbgXKEfoQbdYV4BIIiehKDJ5N6SIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3F?=
 =?us-ascii?q?RkEPm4HkhQegmV7FCoBe4Exk3AKkXuBNZ9aCiiDdowilToaM6pvmQiOCpV/A?=
 =?us-ascii?q?02EaYFoPIFZcBWCbgEBMgkKQBkPlzfJRycyAgE6AgcCBw4DC5FpgX0BAQ?=
IronPort-Data: A9a23:kDU7T6twN7FtzWYr3s0vQqwQsefnVAZfMUV32f8akzHdYApBsoF/q
 tZmKWqPM/zYMTb8KtF1bIjn/RkC757Uzt5kGlE5+SBkEyxAgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvra9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwqutLH1p8q
 dgiCjUPMjbZjOe1+ZnjRbw57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHQH50PwhfD+
 Aoq+UzJXR8WJIzFxgOZ91aAh/XpgjvRY9g7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:3Sq4pKiZ5qWKhZ4CyUq+crx7EHBQXuwji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: 9a23:1Ifm8WN05XCfhe5DCCRb6nUmRuQfUHjfkFGKKEq7ME0xR+jA
X-Talos-MUID: 9a23:m6U0sAZ0Dk/IYeBTh2DiiCEybshR/6GKJEEXt4oekfLeHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="522024936"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:42:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 1A971180001D3;
	Fri, 16 Oct 2026 06:42:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id B75E9CC1611; Thu, 15 Oct 2026 23:42:34 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 0/3] python3-aiohttp: fix multiple CVEs
Date: Thu, 15 Oct 2026 23:42:16 -0700
Message-Id: <20261016064219.3910025-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131065

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport three upstream aiohttp security fixes to the 3.13.5 recipe
on wrynose: CVE-2026-59881, CVE-2026-69243, and CVE-2026-69244.

The series fixes WebSocket compression handling, rejected WebSocket
upgrade request-body parsing, and bounded error messages in the C
HTTP parser.
The individual commits retain upstream fix and advisory references.

This series depends on the previously submitted Wrynose fix for
CVE-2026-54273, which has not merged yet. Apply that patch [1] before
this series. It provides the HTTP parser queue-limit changes and
recipe-time Cython regeneration used by these backports.

[1] https://patchwork.yoctoproject.org/project/oe/patch/20260928174806.1818191-1-dkelaiya@cisco.com/

Darsh Kelaiya (3):
  python3-aiohttp: fix CVE-2026-59881
  python3-aiohttp: fix CVE-2026-69243
  python3-aiohttp: fix CVE-2026-69244

 .../python3-aiohttp/CVE-2026-59881.patch      | 103 ++++++
 .../python3-aiohttp/CVE-2026-69243.patch      | 307 ++++++++++++++++++
 .../python3-aiohttp/CVE-2026-69244.patch      | 159 +++++++++
 .../python/python3-aiohttp_3.13.5.bb          |   3 +
 4 files changed, 572 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-59881.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch

-- 
2.35.6

