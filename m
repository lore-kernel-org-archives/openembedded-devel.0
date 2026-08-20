Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B760C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 10:30:17 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4335.1787221808768924504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 03:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GwTozg25;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1068; q=dns/txt;
  s=iport01; t=1787221808; x=1788431408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/RHbL41y4x59nLQgJuNeaCUOo+y3DpBI/I5PqghGRqY=;
  b=GwTozg25zBzH+sKCk+orOf3V735LrrmOokCYfYgZNeDA5iyOLs9F8OLl
   4Li+Ogz9uMFg4lvGGa4Zb6uEYRRHpgSn1CMgwyZ52F5JV6MjLo9Kruv3c
   K/DnySfse+63ewNcI9htwIT3R8GjUX4Q0hWb889tXcVsfmYwMuQeNTjtY
   ONCvx5KxhzlsosJPSY9XyHz9VfSgyvjMhgqOp8PXpQ6rqP/idq3aLGZhP
   CTMYxKswjd9i5XTmQiCetAwAhTG9ecEdD9SLOpyaE43tMJQdy9DyIdz29
   sp7Po5UMKVind99SK5mKsnzeKkGxXZoeXi97y9Vpf1QfF0DW9Kwd5k200
   g==;
X-CSE-ConnectionGUID: 5z+wmA5JRiGYpV+PeYEXDw==
X-CSE-MsgGUID: BTZAYzzYQjyJHi++FHTfLg==
X-IPAS-Result: =?us-ascii?q?A0D4AgBG1oZq/5IQJK1QAQmCWYJXdF5DSZNZAYIEnwqBf?=
 =?us-ascii?q?g8BAQEPNxoEAQGFBY1tAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8Nhl02ARgBLTBcRIMCAYJ0AxHCWYIsgQGDKAGBVNswAQsUAQWBM?=
 =?us-ascii?q?4U/iCJ2hHwnGxuBcoR+hBYBeYVWIgSCIoEMk0pIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCB?=
 =?us-ascii?q?gIBSUUOCRcLGA1IESw3FBkEPm4HjlEggkuBDixzpy+hDwoog3aMIZU6GjOqb?=
 =?us-ascii?q?C6YWo4KllCEaYFuATWBWXAVgyIJShkPji4VhkTJVScyAjsCBwIHDgMLk2YBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:guPQt6ggrvLhngwCswO+h/RLX161MREKZh0ujC45NGQN5FlHY01je
 htvWj+CO6qDYGfwLtF+bd6190wCusTcn4Q3GlBtqSg9QyNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jb8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVF6KVoBEgT1
 8YZBwEVUFO7itOb8J6kH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTZD/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKFI4DbFJsExBnwS
 mTu1VjLKyAIJu2myyun0nPvxcHvoS3fV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm8HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:jXntyKsNmmDUtbGt9BIg7eNw7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:zuIXM2ADBAsEvbr6E3R1t1ERM50HSHzy/W/uYHe1OEtZZKLAHA==
X-Talos-MUID: 9a23:sdgnbwvbvSDX2jFrvM2nrg1QHfZ68ZWXClEvsZRF+OekCSJUNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="814996927"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 10:30:07 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id C4AE31800047B;
	Thu, 20 Aug 2026 10:30:07 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 61805CC12A6; Thu, 20 Aug 2026 03:30:07 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-python][PATCH] python3-filelock: set CVE_PRODUCT
Date: Thu, 20 Aug 2026 03:30:07 -0700
Message-Id: <20260820103007.22238-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 10:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129388

From: Devansh Patel <devanshp@cisco.com>

The inherited python:filelock mapping does not identify the tox-dev source packaged by this recipe, so filelock CVEs are missed.

Use tox-dev:filelock to match the source identity used by NVD and CNA.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb b/meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb
index 744a1b6aaf..ec9113721b 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb
@@ -5,6 +5,8 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
+CVE_PRODUCT = "tox-dev:filelock"
+
 SRC_URI += "file://run-ptest"
 
 SRC_URI[sha256sum] = "0ffa185a3540854c95caa7fa76b76cb219d907415e2c5dc9af25fd970563487f"
-- 
2.35.6

