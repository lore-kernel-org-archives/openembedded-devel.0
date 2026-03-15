Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E381ED58B2D
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:01 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28710.1773581757445980601
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y7wIGgTY;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1281; q=dns/txt;
  s=iport01; t=1773581759; x=1774791359;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9qh4v+gz9YpCIRV5gn3BctA+K9SVzdeQKxom7+2yEn8=;
  b=Y7wIGgTYV9vrocgNpuSI9JLB6pZhWa9LpBhEsdJ5LR6bRSmS9uonHoie
   u7AJ4UGxPTmVauIza2QqAYfZfhnpu4n6w9MNiiLmabIPbIE1W3ap33IWU
   8V41TkdNuU+LsxOCo2xojvNWWXundIH7SLiatgSfPfm3uZfPXUWEPvM2r
   bx+/W+w/vo8sTO3s8AEVXnesZa+euxFjiRfmPXDpoQPsO5bKArexDkWdZ
   IAKoswkpuCEQjQuvXUDBJA/Diy2dxNlgyGF8eis+mDnKc2LbUEAPbzlkY
   6B2OMGcCLhyjiDURAVBap1Kwy4k7ylqh2hEBKVwXUYz68nbCILCt1SSNm
   A==;
X-CSE-ConnectionGUID: gSUKVxlpThq+5+bNQ8mqrw==
X-CSE-MsgGUID: IEZSFU2XSlu1Rb7wwFCA1w==
X-IPAS-Result: =?us-ascii?q?A0DaBQAatbZp/5L/Ja1aglmCSA9xX0JJlCqCJJ4agX8PA?=
 =?us-ascii?q?QEBDz0UBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThhUGQYZbAgEDMgEYAT0gJgsrKxmDAgGCcwIBEbFsgiyBAYMoA?=
 =?us-ascii?q?dx5AQsUAYE4hTyIGXSEeicbG4FyhAd2hRCFdwSCIoEOkyxIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQsbBwWFGg+IcnRtgRODLQMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjXo9gjMBPVGBR2gBphyhDgoog3SMHpU6GjOqa5kGpFmEaIFoPIFZcBWDI?=
 =?us-ascii?q?glJGQ+MMYF9FRzMfSM1AgE6AQEHAgcNAwuBaJF9AQE?=
IronPort-Data: A9a23:Pw9/bKP6WLIcKcnvrR31lsFynXyQoLVcMsEvi/4bfWQNrUomgzdVn
 2tNDDiHMvrYYGKkcth/OYy28x9U6pKGmIUyHXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gmMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/pVMWIILYkAxuZuQjwN/
 9oheDUUdA/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQvgeC3bIeEII3iqcN9v2uqn
 Uz7pVTCBgxDDtbA1iWr2Vv1mbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1ffDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:VgVp6qGfPryqVMP6pLqE6ceALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltK0Ec
 xbAs5D4BqaNykcsfrH
X-Talos-CUID: 9a23:VsTjaG99esDC9agM/lyVv0EvJ+MbYnnF8HfJYBL7A0BQGLiMU0DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AuctOpQ2qnAiRKrG8FOxZbe//eTUjwomcM24wy6U?=
 =?us-ascii?q?9v9TdDyYvJCizpx3uXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690245929"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 452511800049F
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 72BFCCC8D70; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 23/24] python3-types-python-dateutil: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:40 -0700
Message-Id: <20260315133441.3034831-24-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125242

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-types-python-dateutil to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../python/python3-types-python-dateutil_2.9.0.20241003.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
index 09d919dd82..2149f02178 100644
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
@@ -6,3 +6,4 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462
 SRC_URI[sha256sum] = "58cb85449b2a56d6684e41aeefb4c4280631246a0da1a719bdbe6f3fb0317446"
 
 inherit pypi setuptools3
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


