Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27110.1793853140359009096
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 20:32:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e87MR1+i;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1436; q=dns/txt;
  s=iport01; t=1793853140; x=1795062740;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L9E4Y+PR5+0bz9KrRTr+/UOBFy6UUyVV3KxPXmTQnS8=;
  b=e87MR1+iUSki8keVYVzwnC7LY8E5NZGW/VVbHAjepUdxON5UlusNvRJf
   JpZTzxf9PQGybFpMVi7WOwoOrZp7gfwWuQfg1p/PAhx0MzolIpJt12Iex
   rdpSaHlxDUKKdGETmgi6fPBH6DQFND7TKAHgJMybMw2LblZs3dyN/i3mv
   cUPmQTFclSxMEANlKhy7HZxeLPbbkHV5tK8Yk4aE3hnHhxX0nDkvjLN9r
   6jIBNt1FP2I8em92VBFtP4im1sxkVnw1udF3iFKjNL6tGD1/8HCmRPo6Z
   h5A7MXPry47I9IjVFnjAKO0yOMR9QzyZpXPpeTx7j49FAgNUb62mPte9v
   w==;
X-CSE-ConnectionGUID: CANeh64kT6Go+ZM67kAcTg==
X-CSE-MsgGUID: RVH5c4dtRdKn/CZovmJfFg==
X-IPAS-Result: =?us-ascii?q?A0AzAwBmBuxq/5D/Ja1aglmCV3VgQ0mTWgFPgiGLaJQ6D?=
 =?us-ascii?q?wEBAQ89FAQBAZMjAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZBACwEYAV1RC0SDAgGCOgM3AxEGvF6BeTOBAYMpAUNBUNhMDYJaA?=
 =?us-ascii?q?QsUAYE4hUCCf4UkdQGEfScbG4FyhH6CH0IDgSaBBoV5BIMcEo5yiERIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyheIYEIg?=
 =?us-ascii?q?XYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZAsaBWEIA?=
 =?us-ascii?q?g0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MRYS0qAoI9k2qRe6Agc?=
 =?us-ascii?q?Qoog3iMJI8+hXwaM6pxmQiOCoQKkkeEaYF+JoFZcBWDIglKGQ+XN8lEJjICA?=
 =?us-ascii?q?QE5AQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:2IKytK2S1QbX6Ws9q/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2ACn
 GQZDzrXOf/fazfxcosgO9uy/R8Dv8DTn943Hgs43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJ2gQMI1GpuVLX05Jt
 s49dm8ORxu/iLfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjeOzaoSNIozULSlTtnymh
 j/No2jlOB05Mpu0+z2b91CiqOCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:g2zbtalWbG1IYX2CIPlorXkZIE3pDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: 9a23:6GtqzGAWpYbNiRz6EwJO0kMURJwmTiPyyzTiBhHnCk9idLLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3Ab1Pgyw7T8cs3icSIe32CiKHZxoxS3YTzAxwBja8?=
 =?us-ascii?q?KmM/DHh53JTK/ghq4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="536260086"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 04:32:17 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 674B518000206
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Nov 2026 04:32:17 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 10660CC1611; Wed,  4 Nov 2026 20:32:17 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] wireshark: upgrade 4.6.8 -> 4.6.9
Date: Wed,  4 Nov 2026 20:32:17 -0800
Message-Id: <20261105043217.106970-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 04:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131851
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.6.9.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 650ced113c1219cecafb8f3084988abaaab49904)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../wireshark/{wireshark_4.6.8.bb => wireshark_4.6.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.8.bb => wireshark_4.6.9.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
index dd839f081a..1a10eb08e8 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
@@ -31,7 +31,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "c0f1ccf217bc0d3b51a9c03ea178b0f7df682e475da26a2d21cd4a1bdd9579d0"
+SRC_URI[sha256sum] = "d062d416a1ab3a49975aafe3a671c882dde0562ccd71b078808ceb59d465fc0f"
 
 PE = "1"
 
-- 
2.35.6

