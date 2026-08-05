Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4488CC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:02:21 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33571.1785906136901436695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E406vRy8;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1618; q=dns/txt;
  s=iport01; t=1785906136; x=1787115736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sMWINYKBtecjGDR4l9XNcuo1278llV6pKJdnVtmzb/I=;
  b=E406vRy8sXJGluAGLwrd0N1Uziq5fGLa+K+U4lRFzOLHnwEdOFvYbgGi
   oGHfwq0gNlH0uQWQTb1faT1n2sWaNN/8ZHIMCUEOMDndlZC1fpPZLbNAX
   0xhGxCJ6T+qr5OOO/bH9L8xkNxvFGW8L3fMebjhqbE2Uwbf4qA7cuuFvV
   INB1sFa2ghta3ZzXGjWJSJBvfycGXoej8DaE9YgBeLNvstdhtV12ysY3N
   b3dMr0XgPrh0DZZGDNz1EaXd4VN5LfQOr+8W/5WRwZz+4t/iEl+TBvaQs
   iaJ4CsiiOT5usLGHbo4EVykU0nk4PhGR8YTM1hXa68Rhd/KkWK45SFCsP
   g==;
X-CSE-ConnectionGUID: 8fF8hqV4T7KC+sK0TufBRA==
X-CSE-MsgGUID: wcUCJT3kRqCn7Mov1OPEDw==
X-IPAS-Result: =?us-ascii?q?A0BFAgBrw3Jq/5UQJK1aglmCV3ReQ0mVXm+eGxSBag8BA?=
 =?us-ascii?q?QEPNxoEAQGFBQKNZgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZbAgEDJwsBGAEtECAxKysZgwIBgnQDvGyBeTOBAYMoAd0CAQsUA?=
 =?us-ascii?q?QWBM4U/iCF1AYR8JxsbgXKEfoQGgQqFeASCInoSklFIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQ0bBwWBHYEohG0jGTZ8gQlegS0qZAESF4EJgnsCg?=
 =?us-ascii?q?npvCxgNSBEsNxQZBD5uB41oIIFOcoEOLIEFlSGRfKEPCiiDdYwhlToaM4QEp?=
 =?us-ascii?q?miZCIJZogGEaYFoPIFZcBWDIglKGQ+OLhWIc8cmJzICOwEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:4WaC4KhEei1jPdHvXEAkvKg7X161ZxEKZh0ujC45NGQN5FlHY01je
 htvXGzSM62MNGDxfdpxPNi18U8D7J/Um95lSwFtqXthQShjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/rf8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVI9MgnAXhwq
 cBHCxtOdTPbu/+46oiSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWaGePB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTaz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIWEJo3UGZoIzy50o
 ErZ9FnSIC1BN+aG4jza13Wy38j3sA/kDdd6+LqQs6QCbEeo7nMaDhITRHO1vPu4llWjHdlYL
 iQ8/TIjq6U3/kGnQtTxGhG1vnOAlhodQMZLVeoi5QeAz6DZ7wqUCi4DVDEpQN8mucpwXzUo/
 liShJXwGDVru7qQTDSW8bL8kN+pESERKWlHYWoPShEIpoC55ooylRnICN1kFcZZk+HIJN05+
 BjSxABWulnZpZ9jO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:9yDgu61uX6nIMX4+4jo3WgqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: 9a23:Sm4OCm29Jo/2DKfHSTawzrxfSs4LIn3E8ivsfGyTSn1KEIGIR3Wq0fYx
X-Talos-MUID: 9a23:G4aCFwjdYlfSlfCRg1xJOsMpK8xVyIaSU0M3iL4A5OyDK3VXAxqxk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,205,1779148800"; 
   d="scan'208";a="794964759"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 05:02:10 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 9F52B18000162;
	Wed,  5 Aug 2026 05:02:10 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 3ED0FCD144F; Tue,  4 Aug 2026 22:02:10 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-python][wrynose][PATCH 2/2] python3-twisted: upgrade 25.5.0 -> 26.4.0
Date: Tue,  4 Aug 2026 21:59:19 -0700
Message-Id: <20260805045919.233514-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805045919.233514-1-hthakar@cisco.com>
References: <20260805045919.233514-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128790

From: Wang Mingyu <wangmy@fujitsu.com>

Upgrade Twisted to 26.4.0 to address CVE-2026-42304.

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 8ae0b005d24355945a4cc756d16eecc9b402cc3c)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../{python3-twisted_25.5.0.bb => python3-twisted_26.4.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_25.5.0.bb => python3-twisted_26.4.0.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb b/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
index 8ce5740e0b..7d7f5d3053 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_25.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
@@ -4,9 +4,9 @@ Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of p
 HOMEPAGE = "https://twisted.org"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5316a448a61a38d722c291f78d915d11"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ff950f7bafa004a86f478dc9eaf8106f"
 
-SRC_URI[sha256sum] = "1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316"
+SRC_URI[sha256sum] = "dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9"
 
 CVE_PRODUCT = "twisted"
 
-- 
2.35.6


