Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAD8C5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:36:24 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1943.1787160977366108130
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eWhkgguj;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1530; q=dns/txt;
  s=iport01; t=1787160977; x=1788370577;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x/+mVPlXuN/aQZy7PqXhiWVRIYBzFxFiA2SIdZ8GekY=;
  b=eWhkggujkqtVA+zuODlLvYjwDx4BMiJGAoJfHgy9GkpdNeI/OKkF5c20
   C8pRn5/h7UtxNOyJSBmwKqYRcuHoHSBBr2Pu/hOeCJ8gl1WSiERGTiFzT
   mRTh42puLq/bOTPJOAC1qFUSpIztaAPpomzFu9wXtF/Vm9U0AJJchLJQs
   I8dCExfVUn9+hSf8VlPuCNWagQyXpgJ3pUrzaUroKC49phV2sESttO7bY
   +JkRd0Busxpkj33gBV9MqnqWIpHLuWZMAnpxS8Du+kqoULXZ6r5wWlfd8
   LWxTQLxUJOi1khUNEo3zMGZn8ZJU9RMF87vwfp8FmAWhfT9Twe+fF+sgR
   g==;
X-CSE-ConnectionGUID: FJq5Bba7Qdy50kzS9epIcA==
X-CSE-MsgGUID: TIEQnf+kTuKuySx/Jeu9xA==
X-IPAS-Result: =?us-ascii?q?A0BCAgDM6IVq/5MQJK1aglmCV3ReQ0mTWQGCBJ8KgX4PA?=
 =?us-ascii?q?QEBDzcaBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl0rCwEYAS0wXESDAgGCdAMRxAWBeTOBAYMoAd0EAQsUAYE4hT+II?=
 =?us-ascii?q?nUBhHwnGxuBcoR+hAoQdoV4BIIiehKTQ0iBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJR?=
 =?us-ascii?q?Q4JDAsYDUgRLDcUGQQ+bgeOSiCCS4EOe4Fuk2mRfJ9ugSEKKIN2jCGVOhozq?=
 =?us-ascii?q?myZCKRahGmBaDyBWXAVgyIJShkPji4V0BknMgI7AgcCBw4DC5FogX4BAQ?=
IronPort-Data: A9a23:tdF8nak59nsEqPhGAS2NL5no5gyHJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCGuCO66IY2f9KoxxaIzg9EgBvp/Ty99mHgs6+StnE1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsvPb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FaM647tdC2gRz
 PAJdWgOfCvSivqXy5vuH4GAhux7RCXqFIobvnclyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEQUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIqMIITUFZ8Kwy50o
 Er63knABB9ZN+CC6ieUyWLrpOLSzDPSDdd6+LqQs6QCbEeo7nMaDhITRHO1vPu4llWjHdlYL
 iQ8/TIjq6U3/kGnQtTxGhG1vnOAlhodQMZLVeoi5QeAz6DZ7wqUCi4DVDEpQN8mucpwXzUo/
 liShJXwGDVru7qQTDSW8bL8kN+pESERKWlHYWoPShEIpoC75ooylRnICN1kFcZZk+HIJN05+
 BjSxABWulnZpZdjO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:2i5Qr6lTfRWBUd5CSwkcSRm7QcLpDfIa3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHNuQ8bpE0dKz2DrMpbnmBENjo=
X-Talos-CUID: 9a23:wfbHLGPlo0DFEu5Ddgt+qWQeE58cfmyAlHTCGB61EUdiYejA
X-Talos-MUID: 9a23:vD7+OAjThrsNonciKrvYnMMpCOZF2qKgS0MxjLYbqvKUcg59JmaNpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="812068275"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 17:36:16 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 4F0021800017D;
	Wed, 19 Aug 2026 17:36:16 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id D9646CCA79B; Wed, 19 Aug 2026 10:36:15 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH] python3-httplib2: upgrade 0.31.2 -> 0.32.0
Date: Wed, 19 Aug 2026 10:36:13 -0700
Message-Id: <20260819173613.824473-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 17:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129365

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Python support 3.8+ only
- decompression limited by size and ratio
- decoder foundation to support more compression algorithms

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 69b5baba2780667914b9c327bb9a633ca655b75e)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../{python3-httplib2_0.31.2.bb => python3-httplib2_0.32.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.31.2.bb => python3-httplib2_0.32.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
index 073818a7f9..4c1d0539e4 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.31.2.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "385e0869d7397484f4eab426197a4c020b606edd43372492337c0b4010ae5d24"
+SRC_URI[sha256sum] = "48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.35.6


