Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25FBC5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 18:15:35 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15139.1787076932485178118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 11:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EUeFJRaE;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2764; q=dns/txt;
  s=iport01; t=1787076932; x=1788286532;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W/d8Hoif7VcAvh6dgi4eKhPjpTNuqGsnfbRLpOlin8U=;
  b=EUeFJRaE+RMIZJwC7F2IZRaLRsOMZABmZF3OdY87cxH9loxNu1fZ8PiQ
   3LxMItZUCKAq/OokHUxobeF9SiEgjXrI0KzvtRKBAlb+mcvxjcje/qn+j
   Xge7TQXdu00zf/ZKnaeA+FLMuZwWGyTnS6mOT3mZ19JxjyGtsziSjuvJK
   MEral/qbXaIRB2eUl11dZrRjWP7RJogIgBJOTdhSh/yCjlU6DiQiD2U/X
   OwNsU4JIQHjVBSmFWB6uwkY1A2Dw+UzIR+exHBeXjhrY/pnMY5Gv88lIk
   RJGSODJPCu1c5CoWyWD/DbdenO0yTtB5qtNa5A1xDwjgbdM+jD6Z3DicX
   A==;
X-CSE-ConnectionGUID: 8y3caTbKSKKGycVsonGbyQ==
X-CSE-MsgGUID: FaRdmxD0Rm6UHKmi1OACEA==
X-IPAS-Result: =?us-ascii?q?A0BaAwDJn4Rq/4sQJK1aglmDS15DSZNZAYJwnh6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDxDCCLIEBgygBgVTbPBUFgTOFP4gidoR8J?=
 =?us-ascii?q?xsbgXKEfoQ0XIV4BIIiehKTMEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDRsGBYEdgSiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJRQ4LGA1IE?=
 =?us-ascii?q?Sw3FBkEPm4HjjgggkOBDzB2IIERGKVeoQ8KKIN2jCGVOhozqmyZCKQNTYRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD95cJzICOwIHAgcOAwuRai2BTwEB?=
IronPort-Data: A9a23:y7JBgaCWmhbiexVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDt00jQGx
 mQaCD+EPvuMM2Twf491at6z8U5Q7J7SzNQ3OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8hGYvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEk+Q1B0gKN64j2cVYEGpw7
 vseBzocV0XW7w626OrTpuhEj8AnKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxAMmsHgBfoO3WjPn8bC586lea5j1H0ciZTrxSeoq9fD237nFQgiOe8YIaNEjCMbetcpEqdt
 k6exWGnPzE5Md3G7hOu31v504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:LYHOUaq6FLlEJXtSGflr/TcaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A6m08imnkRh2PyXeYE0xP/OiXE8zXOS3Ml3zZH0W?=
 =?us-ascii?q?bMkVKZ6yed0SX/oxugvM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ArMV+Ow7tPIyEp3dhpSM+BtOnxoxG6p6iDVAhya8?=
 =?us-ascii?q?D5fSkFilxYhC0pxmeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="809079840"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Aug 2026 18:15:31 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 7FC01180001B8;
	Tue, 18 Aug 2026 18:15:31 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 1A6A7CCA79B; Tue, 18 Aug 2026 11:15:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 0/10] python3-aiohttp: fix multiple CVEs
Date: Tue, 18 Aug 2026 11:15:18 -0700
Message-Id: <20260818181528.3405276-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 18:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129233

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport ten upstream aiohttp security fixes to the 3.13.5 recipe on
wrynose.

The corresponding fixes are available in aiohttp 3.14.0 and 3.14.1.
Carry them as focused backports instead of upgrading the recipe because
the 3.14 release also introduces new APIs, deprecations, and
backward-incompatible behavior outside the security scope.

The individual commits retain the upstream fix provenance and public
advisory references for each CVE.

Testing:
- Applied the ten layer commits to the upstream wrynose baseline.
- Applied all ten embedded patches to aiohttp 3.13.5 in series order
  with no conflicts or fuzz.
- Package build and image build validation completed successfully.

Darsh Kelaiya (10):
  python3-aiohttp: fix CVE-2026-34993
  python3-aiohttp: fix CVE-2026-47265
  python3-aiohttp: fix CVE-2026-50269
  python3-aiohttp: fix CVE-2026-54274
  python3-aiohttp: fix CVE-2026-54275
  python3-aiohttp: fix CVE-2026-54276
  python3-aiohttp: fix CVE-2026-54277
  python3-aiohttp: fix CVE-2026-54278
  python3-aiohttp: fix CVE-2026-54279
  python3-aiohttp: fix CVE-2026-54280

 .../python3-aiohttp/CVE-2026-34993.patch      | 478 ++++++++++++++++++
 .../python3-aiohttp/CVE-2026-47265.patch      |  64 +++
 .../python3-aiohttp/CVE-2026-50269.patch      |  81 +++
 .../python3-aiohttp/CVE-2026-54274.patch      | 182 +++++++
 .../python3-aiohttp/CVE-2026-54275.patch      | 115 +++++
 .../python3-aiohttp/CVE-2026-54276.patch      | 287 +++++++++++
 .../python3-aiohttp/CVE-2026-54277.patch      | 249 +++++++++
 .../python3-aiohttp/CVE-2026-54278.patch      | 182 +++++++
 .../python3-aiohttp/CVE-2026-54279.patch      | 295 +++++++++++
 .../python3-aiohttp/CVE-2026-54280.patch      | 138 +++++
 .../python/python3-aiohttp_3.13.5.bb          |  13 +
 11 files changed, 2084 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54276.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54280.patch

-- 
2.35.6

