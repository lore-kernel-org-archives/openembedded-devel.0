Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685B5CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:41 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63553.1790617415702148386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HuIyvXha;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3636; q=dns/txt;
  s=iport01; t=1790617416; x=1791827016;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XsbfobmdnMQlult0r9Dco9hRb6aWPvWhCnXi0EnLmN4=;
  b=HuIyvXhaUCg6/HJIRfkQQSn5xjCi8wzEt6LS0EzKe6kSalnhm06LaWKO
   bAdclYkGBaV3/nR6AABX3YhLBICwnWZFmt14f1VcPTTyHvXhUKa7zLCw8
   /JDb7rgEMq3bFtGWkpLn2HQWyJbvYhGIWqTcCOaFzC2Tj9xxxBhZ2rsr4
   FdfpO6enSapusdA8qtayJRBPrZw/fbFrFSYA70DDJPfEpvKNS5YRvLAof
   L56GfqFdy06ogKLVvQXldi9F0SNSkz1YrSqPEhYGbwJCMYWMcmeMzBgYm
   2obGElI5pcbIRMx/mhaC1bTT4QG7wxVZPxlhTI19MqrTllS6UVOkWh7Ol
   g==;
X-CSE-ConnectionGUID: JwnvsxFIS4maVVvaSynMDQ==
X-CSE-MsgGUID: uyS8ZPtqTl6cIZWc8KRzTw==
X-IPAS-Result: =?us-ascii?q?A0BbAwC9prpq/4z/Ja1aglmDTGBDSZNZAYJwnh2Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY4LAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZckBU2ARgBLTBcRIMCAYJ0A8JWgiyBAYMpAYFU2z4VgTiFQIgjdoR8J?=
 =?us-ascii?q?xsbgXKEfoQ0hlQEgiJ6EpUdSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BIIIZIxk2eoEJXoErKWABEBeBB4IHAoJUggECAUlDDgdFUwklQ?=
 =?us-ascii?q?QoSRyYiCBIJARMaMAuBIThBCSgRGA1IESw3FRkEPm4HkC4egmWBDzB2IIERG?=
 =?us-ascii?q?KVeoQ8KKIN2jCKVOhozqm+ZCKQNTYRpgWg8gVlwFYMiCUoZD95dJzICOwIHA?=
 =?us-ascii?q?gcOAwuRai2BTwEB?=
IronPort-Data: A9a23:TPgEIKKeYhSr1TqqFE+RgpQlxSXFcZb7ZxGr2PjKsXjdYENS12BWz
 mUYDTyPP66CNDemLt1+PIi38RkCuZ6Ey4RnSwId+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH9imQkajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1ME0coJp02290rBGhwy
 +IREyELSzy60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEyojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeK1bICPJIbaLSlTtluJn
 TL0x3jgPhVEP/2t9jHV0Ui+uvCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSvHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:43PC8K8cHLwNYekAiSduk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3A53FxpGsnDmdKgpAYDtuP20At6IsHbXvD12f+AnT?=
 =?us-ascii?q?kDG9XdqOcck6W3Y9dxp8=3D?=
X-Talos-MUID: 9a23:ippq/QXzBpqI5ZPq/CL9v2FQDNtx36DwA2E/rp5WmPOWCTMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,128,1787011200"; 
   d="scan'208";a="520422628"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Sep 2026 17:43:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 7A6BC180001F5;
	Mon, 28 Sep 2026 17:43:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 211F6CC1611; Mon, 28 Sep 2026 10:43:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][scarthgap][PATCH 00/13] python3-aiohttp: fix multiple CVEs
Date: Mon, 28 Sep 2026 10:43:10 -0700
Message-Id: <20260928174323.1810308-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130457

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport thirteen upstream aiohttp security fixes to the 3.9.5 recipe on
scarthgap.

The corresponding fixes are available in aiohttp 3.14.0 and 3.14.1.
Carry them as focused backports instead of upgrading the recipe because
the 3.14 release also introduces new APIs, deprecations, and
backward-incompatible behavior outside the security scope.

The individual commits retain the upstream fix provenance and public
advisory references for each CVE.

Testing:
- Applied the thirteen layer commits to the upstream scarthgap baseline.
- Applied all fifteen embedded patches to aiohttp 3.9.5 in series order
  with no conflicts or fuzz.
- Package build and image build validation completed successfully.

Darsh Kelaiya (13):
  python3-aiohttp: fix CVE-2026-34519
  python3-aiohttp: fix CVE-2026-34516
  python3-aiohttp: fix CVE-2026-34517
  python3-aiohttp: fix CVE-2026-34520
  python3-aiohttp: fix CVE-2026-34525
  python3-aiohttp: fix CVE-2026-47265
  python3-aiohttp: fix CVE-2026-50269
  python3-aiohttp: fix CVE-2026-54274
  python3-aiohttp: fix CVE-2026-54275
  python3-aiohttp: fix CVE-2026-54277
  python3-aiohttp: fix CVE-2026-54278
  python3-aiohttp: fix CVE-2026-54279
  python3-aiohttp: fix CVE-2026-54273

 .../python3-aiohttp/CVE-2026-34516.patch    | 356 +++++++
 .../python3-aiohttp/CVE-2026-34517.patch    |  65 ++
 .../python3-aiohttp/CVE-2026-34519.patch    | 638 ++++++++++++
 .../python3-aiohttp/CVE-2026-34520.patch    | 121 +++
 .../python3-aiohttp/CVE-2026-34525_p1.patch | 128 +++
 .../python3-aiohttp/CVE-2026-34525_p2.patch | 331 +++++++
 .../python3-aiohttp/CVE-2026-47265.patch    |  61 ++
 .../python3-aiohttp/CVE-2026-50269.patch    | 166 ++++
 .../python3-aiohttp/CVE-2026-54273_p1.patch | 798 ++++++++++++++++
 .../python3-aiohttp/CVE-2026-54273_p2.patch | 181 ++++
 .../python3-aiohttp/CVE-2026-54274.patch    | 195 ++++
 .../python3-aiohttp/CVE-2026-54275.patch    | 124 +++
 .../python3-aiohttp/CVE-2026-54277.patch    |  96 ++
 .../python3-aiohttp/CVE-2026-54278.patch    | 209 ++++
 .../python3-aiohttp/CVE-2026-54279.patch    | 317 ++++++
 .../python/python3-aiohttp_3.9.5.bb         |  15 +
 16 files changed, 3801 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34516.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34517.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34519.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34520.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch

-- 
2.35.6

