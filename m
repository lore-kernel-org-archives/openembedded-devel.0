Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3283.1794374983856874227
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 21:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IvP93J3x;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1692; q=dns/txt;
  s=iport01; t=1794374984; x=1795584584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KDYSz17B6S2htjGwkxrzV5iSWtA7cMdSi3GstFA9Kfk=;
  b=IvP93J3xR4ap4sbA8iXIqNV/F+o8DWnIhFCDsZCq6pzY/SpTkWTTBupG
   xQFCwMDsNzgm2xw7WHrO13l0RyNmpxaTSrnELgJZ8V9VICx5VG1h5wj1L
   RdhVpryhfa3RbS5gMo5Ey4mxT5Bq9zWo9Gvn5nbxvvxeMAPNRAV+Xiyxc
   mQxVOknPEtK+23b45sqZpNz61h8YeUcT9jQtcF/F0RiqPIKH9CQl1gTPt
   Gwy9z8KjxMzrIHihFgCpkEZp2+DiYIvx5dGf+6W+KfA+QVtf7/K5KFDdi
   ILL6/5Jh+H8rVNF6klGD+ipxXCoRRZ0bAe6YstNcpmuqdOGgclRb72Js9
   A==;
X-CSE-ConnectionGUID: /aTpxtcORgWK8Cu509qnCQ==
X-CSE-MsgGUID: Qt3l+y9FRbuyQ8kzYQcKGg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBQ/PNq/5H/Ja1aHgEBCxIMggULgld1YENJA5ZIA?=
 =?us-ascii?q?4ETnQ8UgWoPAQEBD0QNBAEBhD9GAo4eAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZATAgEDMgEYAS0QIBgZKx0BDRmDAgGCdAMRu?=
 =?us-ascii?q?ViCLIEBgykBPwJDUNszAQsUAYE4hUKIJHUBhH0nGxuBcoEVgnN2gQWBXAEBg?=
 =?us-ascii?q?RmBBg6FVyIEgiKBDIJjjBGIdkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEcgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCn4YDUgRL?=
 =?us-ascii?q?DcVGQQ+bgeSboMVgQ4BKwQcggyldqERCiiDeIwkg12RXRozqnILmH2OCpZRh?=
 =?us-ascii?q?GqBaDyBRwsHcBWDIglKGQ+OOYNrgX/MXCYyAgwvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:2FT0VKtqhmQOSmmGBht4WYlm0+fnVAZfMUV32f8akzHdYApBsoF/q
 tZmKWiAPfrcZGT9e9klb4Xg9BkFuJ+BzN8wQFBpriEwRiIbgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvva8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwve9LGXFS/
 tsiJw8uPjue2rrn2bSQc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtKYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHWG54NwRjI+
 goq+UzAHkoed83O5wCP72OV1uzdrBrwe60dQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:hQDxlql/hpY0oqy7UtKBSRbnLdXpDfIO3DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3Anh0bk2ozXHmbT88TcB+KLgzmUYcsTmXN0Hz3GUC?=
 =?us-ascii?q?HKjZCVeDNGEaW05oxxg=3D=3D?=
X-Talos-MUID: 9a23:sbrIdQX3+xUP8/Lq/Abw3zUhJZZG2a6zGXldkoc3gsKnGiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546307684"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 05:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 744E11800044B;
	Wed, 11 Nov 2026 05:29:43 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id CE44ECBEFAB; Tue, 10 Nov 2026 21:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH 9/9] python3-filelock: ignore CVE-2026-112913
Date: Tue, 10 Nov 2026 21:29:38 -0800
Message-Id: <20261111052938.3691463-10-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111052938.3691463-1-dkelaiya@cisco.com>
References: <20261111052938.3691463-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 05:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132114
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- Upstream scopes this issue to Windows ReadWriteLock and
  AsyncReadWriteLock in directories writable by another account. [1]
- Attacker-controlled SQLite side files can cause acquisition
  failures or unsafe hot-journal recovery on Windows. [1][2]
- The advisory tracks the Linux/macOS issue separately; this series
  addresses that issue as CVE-2026-112940. [1][3]
- Mark this Windows-only CVE as not applicable to the Linux target.

Reference:
[1] https://github.com/tox-dev/filelock/security/advisories/GHSA-9vhv-jxww-xfm5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-112913
[3] https://github.com/tox-dev/filelock/security/advisories/GHSA-v4x8-3wr5-3wq8

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
index 40c4fe9427..9617d82b31 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.25.2.bb
@@ -9,6 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 CVE_STATUS[CVE-2026-112907] = "not-applicable-platform: Windows oplock handling is not used on Linux"
 CVE_STATUS[CVE-2026-112910] = "not-applicable-platform: Windows ACL inheritance is affected; Linux uses POSIX file permissions"
+CVE_STATUS[CVE-2026-112913] = "not-applicable-platform: The CVE affects SQLite side-file handling on Windows only"
 
 SRC_URI += " file://run-ptest \
     file://CVE-2026-112939.patch \
-- 
2.35.6
