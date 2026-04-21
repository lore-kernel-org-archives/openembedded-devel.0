Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E89EF8925F
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 11:18:00 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23834.1776770278865839306
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 04:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LVnxB2Q8;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2061; q=dns/txt;
  s=iport01; t=1776770278; x=1777979878;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZAEB7Q+jeB4CnLItll+fuOKcXxJjrXdlICG/HVWvlzE=;
  b=LVnxB2Q8ZOyzBBS5s9t4+Ndc0srt8xje3ZCJSJeq8CzgkPyHISWz5LWU
   u6Awkm2u5W7DrgWpBegZDQw5jT8Zm3XnCKUgRcEZmUMsTUwHoN7Sopktb
   vxt6U34SzbYyTD7F1Wn5y8kuLxi2yB8/Knc9TT2ZuFMx7P+y4pxObYwQB
   Z6kIbNqGS+XqNnmi8ESqilu2lo0jADAPKl+6cBpLb2IXgiNu7vqpy8LF2
   GHcou+Tlhyr8K2HHx7fziX+LqZ1X0mWqth2lvO3y/faPBkIqP8qR76XZ/
   1ht36tA2K/B9hvLzoUdEBrJzqy7qTSsSoZ/WtQzTNavsDAqwJHVBF56vO
   w==;
X-CSE-ConnectionGUID: iAL9oGVvSHKheYU9XXo9aw==
X-CSE-MsgGUID: IDMEHhgXQkuSK4shmZ6GUg==
X-IPAS-Result: =?us-ascii?q?A0CyAwCqW+dp/4r/Ja1aglmCV3FeQ0mTWgGOV5I2gX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQaNLgImNQgOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIZdNgEYAS0wUQtEgwIBgjoDNgOxVIIsgQGDKAGBU9hHDYJSA?=
 =?us-ascii?q?QsUAYE4hT+CeYUjdIR6JxsbgXKEfYIfgnGFdwSCIoEOgX6FAAGCF4ViSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgUuENm1qgQuDMYE3AwsYD?=
 =?us-ascii?q?UgRLDcUGwQ+bgeKFiEQgiqBDgGWQBOReKAdcQoog3SMHo8+hXwaM6prLphYk?=
 =?us-ascii?q?hKSR4RogWoBOYFZcBWDIglKGQ/WeyYyAjsCBwIHDQMLk2UBAQ?=
IronPort-Data: A9a23:OGjyramYpF+x0IgtXyRM7eno5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOCjuOO/eNNGb8cth3aIqw8UsCsZDdz94xHgJsqXpmQ1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpIsfvb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYwx3rdwLl9Qz
 tw7KD08U0Gzt+Xnya3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaj/7C7pm9Ausrnn9ejFfrnqepLE85C7YywkZPL3Fb4CMIoHRHpgN9qqej
 kPq2knZAh4qDd+C8hnZ6XKptLHgoCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:7/MHhKhae72RjlFyhtbJALAHN3BQXuwji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AaNB+C2vB+2fi/VH1NhVJnzy16IskW1mMy1juPXS?=
 =?us-ascii?q?YKmZkeYDEeW+Xqap7xp8=3D?=
X-Talos-MUID: 9a23:Q5XoYgs/NW5T70E7Ic2npR1HGedo7JSXC102sskdu8y2awNNNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,191,1770595200"; 
   d="scan'208";a="721053350"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Apr 2026 11:17:58 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id ED7F1180001C7;
	Tue, 21 Apr 2026 11:17:57 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id 79D1ECC1288; Tue, 21 Apr 2026 04:17:57 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-python] [scarthgap] [PATCH] python3-tornado: set CVE_PRODUCT
Date: Tue, 21 Apr 2026 04:17:51 -0700
Message-Id: <20260421111751.2509916-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 11:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126529

From: Gyorgy Sarvari <skandigraun@gmail.com>

The default "python:tornado" CVE_PRODUCT doesn't match relevant CVEs, because
the project's CPE is "tornadoweb:tornado".

See cve db query (docmosis is an irrelevant vendor):

sqlite> select * from products where PRODUCT = 'tornado';
CVE-2012-2374|tornadoweb|tornado|||2.2|<=
CVE-2012-2374|tornadoweb|tornado|1.0|=||
CVE-2012-2374|tornadoweb|tornado|1.0.1|=||
CVE-2012-2374|tornadoweb|tornado|1.1|=||
CVE-2012-2374|tornadoweb|tornado|1.1.1|=||
CVE-2012-2374|tornadoweb|tornado|1.2|=||
CVE-2012-2374|tornadoweb|tornado|1.2.1|=||
CVE-2012-2374|tornadoweb|tornado|2.0|=||
CVE-2012-2374|tornadoweb|tornado|2.1|=||
CVE-2012-2374|tornadoweb|tornado|2.1.1|=||
CVE-2014-9720|tornadoweb|tornado|||3.2.2|<
CVE-2023-25264|docmosis|tornado|||2.9.5|<
CVE-2023-25265|docmosis|tornado|||2.9.5|<
CVE-2023-25266|docmosis|tornado|||2.9.5|<
CVE-2023-28370|tornadoweb|tornado|||6.3.2|<
CVE-2024-42733|docmosis|tornado|||2.9.7|<=
CVE-2024-52804|tornadoweb|tornado|||6.4.2|<
CVE-2025-47287|tornadoweb|tornado|||6.5.0|<
CVE-2025-67724|tornadoweb|tornado|||6.5.3|<
CVE-2025-67725|tornadoweb|tornado|||6.5.3|<
CVE-2025-67726|tornadoweb|tornado|||6.5.3|<

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 139cc15de304918edc0197346579162b12006faa)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
index 25f1b2a310..f513679b62 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
@@ -44,4 +44,6 @@ FILES:${PN}-test = " \
     ${PYTHON_SITEPACKAGES_DIR}/*/test \
 "
 
+CVE_PRODUCT = "tornadoweb:tornado"
+
 BBCLASSEXTEND  += "native nativesdk"
-- 
2.35.6


