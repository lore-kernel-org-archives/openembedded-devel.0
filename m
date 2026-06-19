Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BDDCD98E6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 04:13:18 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35922.1781842393653106744
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 21:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YvmOdZTY;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=890; q=dns/txt;
  s=iport01; t=1781842393; x=1783051993;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BvL3xzcTIaEqwo+voV5GXad1x/31tpSkM4gCUlalSjI=;
  b=YvmOdZTY8ue02DtwebbR9063tD9gip80JTb3QD1NGicvpDtLkRUGVh/y
   o0mQC97k7UP52sxqFkVvbmFXKkZOYmF/EmM6u/7YPfFnvqzEPdwqem4GA
   +WzRc+3HWDfnFk0o2hvPEARVtcuG/BGiyzcGseghbxXT6Ig8MKPyiIVAQ
   wW7XI/ETs3AxMtHU7d6GVC4aZ9UVDIs0yTd2kATmUx9d5nATlXIehAOfa
   giEkyBYN/MzLWohX7v2PWj8ZRsk5kLshCjV83eArsR+TN0RRJPCHSFCKp
   l4MQyCMDcLE03Vv2dfWc5BcqIFp3FLTSj5wo1fXhKNz0hkm0McIJY8jfj
   w==;
X-CSE-ConnectionGUID: U08cpHe6RwSBGlkgVl6SYQ==
X-CSE-MsgGUID: jPUktUOJSWS9v2sB3JuLRw==
X-IPAS-Result: =?us-ascii?q?A0BXAwBhwTRq/5T/Ja1aglmEKUNJk1oBoQ6Bfg8BAQEPU?=
 =?us-ascii?q?QQBAYUGjUoCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?IZdKwsBRjBcRIMCgnQDswmBeTOBAYR92zgVgTiFP4gfcwGEfCcbG4FyhH6EN?=
 =?us-ascii?q?FyFeASCInoShCqMfkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YEegXuBAoUDIx8DOX+BaIElZ2YVMDWBAQERHwqBJAMLGA1IESw3FBsEPm4Hj?=
 =?us-ascii?q?HcXD4V8JxeTY5F8oQ8KKIN1oVsaM6psmQikWoRogWg8gVlwFYMiUxkP1zUnM?=
 =?us-ascii?q?j0BAQcCBw4DC4FokAKBewEB?=
IronPort-Data: A9a23:ARL7rq7kYrx3axP/Vk3I7AxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jMWWmjTPayPYTP9fN5xa9nl8EIA7ZTRztEyHgc4qiE3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNu/rfwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eANVI8f5XDD906
 scyBzQOYS6H2dmH+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEfUrsUIMpWcOOAhnv2fzpegFmUvqEwpWPUyWSd1ZCxYYSMKoDWGZQ9ckCwp
 Fr7/HjEJTMhC+fO12Ce2CmOm8v1gnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:35Ysa6h+BcYgv6iQCEx/lZYf/3BQXuwji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: 9a23:w1J+a2Ek3dN161aXqmJarB4fAuAoLEfC913/J0y3N2I3c4ysHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Ai7T45g7AeJil8Fy1qqcwWKzmxoxq25mtFH0qs64?=
 =?us-ascii?q?5gJiabzdaYBWAqA6oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,212,1774310400"; 
   d="scan'208";a="496184449"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Jun 2026 04:13:12 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id A8A711800017C;
	Fri, 19 Jun 2026 04:13:12 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 16DDECC1611; Thu, 18 Jun 2026 21:13:12 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-networking][scarthgap][PATCH 0/4] samba: upgrade to 4.22.10
Date: Thu, 18 Jun 2026 21:13:04 -0700
Message-Id: <20260619041304.2585485-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 04:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127673

From: Himanshu Jadon <hjadon@cisco.com>

This series upgrades Samba on scarthgap from 4.19.9 to 4.22.10.

Samba 4.22.10 is a security release and addresses:
CVE-2026-1933, CVE-2026-2340, CVE-2026-3012,
CVE-2026-3238, CVE-2026-4408, and CVE-2026-4480.

The base 4.19.9 version is directly affected by CVE-2026-3012,
CVE-2026-3238, CVE-2026-4408, and CVE-2026-4480. Samba lists
CVE-2026-1933 as affecting versions since 4.21 and CVE-2026-2340
as affecting versions since 4.20, so those two are fixed by
4.22.10 but are not applicable to the base 4.19.9 version.

The Samba upgrade requires newer talloc, tdb, and tevent versions,
so those dependency upgrades are included first in the series.

Himanshu Jadon (4):
  libtalloc: upgrade 2.4.2 -> 2.4.3
  libtdb: upgrade 1.4.10 -> 1.4.13
  libtevent: upgrade 0.16.1 -> 0.16.2
  samba: upgrade 4.19.9 -> 4.22.10


-- 
2.35.6

