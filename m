Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA47CCA463
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 02:57:12 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13635.1792119422946579441
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 19:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XAVpoRui;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1582; q=dns/txt;
  s=iport01; t=1792119422; x=1793329022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bG+cxk2HaGqlXhj9IXZ47t2RnDilxX3/Gb8IYfTZ+Rw=;
  b=XAVpoRuiA+YIIE1RQzpEXBSkAYxrmABN/aWSs86QvuzDvMEzq+ZmkyJX
   wgH9q7OAbc5drY88s/ARNUUV7kwJwaefZYGrnakhGSihEeOw69iQXNs+R
   ioLUYuXXFiAEuUKOtMxCTvpZAVdXo4ftbVvQ80OGLH/HWynim/ZOTs1lJ
   +RMAxdD+LLpb0pwE+U8lzJSp9H886ltQgfX/7n4mZ4PEXVXElth8eh+Dq
   jXvopyqco1REQSCjrSazEwELZqCVE4zpd5AT2bSLijPODs3+6tYEEeWO6
   LPo9pgMn7kA+Naaws8bOwmqo7CcwUbVqmOm/uQ55S76/64VJfinqcET4c
   g==;
X-CSE-ConnectionGUID: 838uR5ZTR5SF44JJYxHg1g==
X-CSE-MsgGUID: JoYDsU8eTJeb/QQyM3rcxA==
X-IPAS-Result: =?us-ascii?q?A0D8AgC8kdFq/43/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q89FAQBAYUFAo4VAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZATAgEDJwsBGAEtECAxKysZgwIBgnQDEQa8RIF5M4EBgykBQ0FQ2?=
 =?us-ascii?q?zIBCxQBBYEzhUCII3UBhHwnGxuBcoR+gmEDgSaBBoV4BIIiehKXIUiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylgA?=
 =?us-ascii?q?RAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzD?=
 =?us-ascii?q?B0FcggCDQkHKRgNSBEsNxUZBD5uB5ITHoJlYS0qAoIsEZNpkXuhDwoog3aMI?=
 =?us-ascii?q?pU6GjOqb5kIjgqWT4RpgW8GL4FZcBWDIglKGQ+XN8lHJzICAQE5AQEHAgcOA?=
 =?us-ascii?q?wuBaJAAgX4BAQ?=
IronPort-Data: A9a23:NbrasKKhQL1q6o6bFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENShTwOy
 DQZDGHSa/iMNDD8Lox2a4zlphsPsMLQxtcxSlcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0+VxErB9AqxtwqOk8Sq
 d46GSAtYUmM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+W8b4qNK43iqcN9vEGpi
 nn7r2nFIBwQc+Wm2B/e6Hm8r7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:NwhPsK3bInOkqOPP8bxaJwqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:UaTasW/QcRKW1gRjxgOVvx5PSt0fL0/h9irrDRPkK0RYWJ2aEFDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AmVrLIgy88nwYgV0VDqEHqWgNn0KaqIapOWwWrMU?=
 =?us-ascii?q?Lh+uJP2tJAia41y68UqZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535978099"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 02:57:02 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 10FD4180015C0;
	Fri, 16 Oct 2026 02:57:02 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id AE741CBF201; Thu, 15 Oct 2026 19:57:01 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-oe][wrynose][PATCH 1/1] wireshark: upgrade 4.6.4 -> 4.6.8
Date: Thu, 15 Oct 2026 19:57:01 -0700
Message-Id: <20261016025701.372513-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016025701.372513-1-hthakar@cisco.com>
References: <20261016025701.372513-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 02:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131022

From: Hetvi Thakar <hthakar@cisco.com>

Upgrade Wireshark to the latest 4.6 stable release. This brings
security and bug fixes from releases 4.6.5 through 4.6.8.

Release notes:
[1] https://www.wireshark.org/docs/relnotes/wireshark-4.6.5.html
[2] https://www.wireshark.org/docs/relnotes/wireshark-4.6.6.html
[3] https://www.wireshark.org/docs/relnotes/wireshark-4.6.7.html
[4] https://www.wireshark.org/docs/relnotes/wireshark-4.6.8.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../wireshark/{wireshark_4.6.4.bb => wireshark_4.6.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.4.bb => wireshark_4.6.8.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
index 7ecad4eda8..dd839f081a 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
@@ -31,7 +31,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "fbeab3d85c6c8a5763c8d9b7fe20b5c69ca9f9e7f2b824bedc73135bdca332e2"
+SRC_URI[sha256sum] = "c0f1ccf217bc0d3b51a9c03ea178b0f7df682e475da26a2d21cd4a1bdd9579d0"
 
 PE = "1"
 
-- 
2.35.6


