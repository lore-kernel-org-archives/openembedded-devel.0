Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA9FD58B31
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:02 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28887.1773581759159923967
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZBs5olYu;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1224; q=dns/txt;
  s=iport01; t=1773581759; x=1774791359;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=f21XCDig4SEDoE6C68ToW0ZnnZNu/wZbtyp0D9q2n10=;
  b=ZBs5olYuHRQmG/UffV0ifnT8GEjbUgxMDNDQLiqiPKnMiCqwHlZb5R+k
   c+vxb38V+JEkpzY7K6Oaufn3jrhs/177JpFpXDAL6gFqG/kicrOheND0E
   tEY2B6QCqoc3sQyEiY2yjQY9NKJhuqV6PvkJm9NlJTP86ZFJ09YX/gFtE
   aBIMOxEpvN8sYsq6QAvFOxpuyo4kKWxV9pjAPat5ylfZFFP9Pdgvfxh7K
   okK8tVEKrLqZJ+m6IHYAwsz6+etkvbpsh8s/N5lkrP3TveQidDG2JAVvA
   5yFONLJxDulBR1yrc1kvzyecOgs/U7LRjchE8HzBKPINaU5PSFWbHRx2d
   g==;
X-CSE-ConnectionGUID: 65AUIZlfTRaWl9jz18uR8A==
X-CSE-MsgGUID: oe9bfQXYQsiuVoPs60u/bQ==
X-IPAS-Result: =?us-ascii?q?A0AlBwAatbZp/4z/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAmCysrGYMCAYJzAgERsWyCLIEBgygB3?=
 =?us-ascii?q?HkBCxQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6Bf5EtSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB416PYIzAT1RAYFGaAGmHKEOCiiDdIwelToaM6prmQakWYRogWoCOIFZc?=
 =?us-ascii?q?BWDIglJGQ+OX8x9IzUCOwEBBwIHDQMLgWiRfQEB?=
IronPort-Data: A9a23:wGkmIamyXkRi4NxQrhXfU67o5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMW26Ab/+OamHwe4hxYdu1p0MP7ZaByoRlHQY5/iA0FFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpPsv/b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdNF09tWM2VAy
 cYRFzRcbALa1/+MkJvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKLK4TSGJsFxB7wS
 mTu+GmoCB8jBO2m0juYzHWUnbGXgGTxYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:4LcFfaGopWAEZGfEpLqE6ceALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltK0Ec
 xbAs5D4BqaNykcsfrH
X-Talos-CUID: 9a23:v/SKz202YCHrcchEMszqY7xfRJ0MT1zvyHnsGUaHDTdrWuTFVGXA0fYx
X-Talos-MUID: 9a23:eXFHuwUZlGydMVvq/Djh1TtsDfdZ2r+vFX4KqY5Y49TDPxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690056820"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:56 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 7A53F18000612
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 24BC2CBEF7B; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 04/24] iscsi-initiator-utils: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:21 -0700
Message-Id: <20260315133441.3034831-5-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125240

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require iscsi-initiator-utils to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
index db4a4313a4..00ea4f8d7f 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.11.bb
@@ -115,3 +115,4 @@ INITSCRIPT_NAME = "iscsid"
 INITSCRIPT_PARAMS = "start 30 1 2 3 4 5 . stop 70 0 1 2 3 4 5 6 ."
 
 FILES:${PN} += "${nonarch_libdir}/iscsi"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


