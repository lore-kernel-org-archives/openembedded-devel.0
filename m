Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FC4D2444C
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 17:26:47 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49292.1764869205428063896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 09:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=l0wFbMO1;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3175; q=dns/txt;
  s=iport01; t=1764869205; x=1766078805;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xckbq6ilje5usboFCngIXAXvubCUTDGOLrmIDDdfPdg=;
  b=l0wFbMO1C9FieAraOI3HM9aWGwQDhT64+J95Nz0jZ9Bt47mSvv1wQ3NO
   aBHH9pLePJgTwUd27QN7eiJ/mIwme3MCEHQRC42mgvvq+91KBRaxIoKf6
   QX5vPvjZPN6Zp4pcSjhVRNcUTOkKffis0+HG7641WGdUGXFuhbmZPUd1a
   5IUJTUcrAC/9KRsQdV50uM9ntK4ij4q3ffWbPyzS+NWf78B+gSxFzqUBn
   yb0DyJqT76EntJnXtaY9S76sV1dMs1MzzskWPf0TvAc5GNqmrrwstn5zE
   7/ZWqTLcu9ZLRwro31qPRXNkoe0s3pAJ+3s0jamncj6JCuWYJP23jfmeP
   g==;
X-CSE-ConnectionGUID: 62eDu9lyRFCtr5YebB/0FA==
X-CSE-MsgGUID: Qca+gGnhTNaTqLgRbwVkPA==
X-IPAS-Result: =?us-ascii?q?A0AMBACnwzFp/5P/Ja1aglmCR39fQkmUJ6A+gX8PAQEBD?=
 =?us-ascii?q?0QNBAEBkW8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhxMBGAFdXESDAgGCcwIBEbF0GjeCLIEBgygBMQMCCQJDT9ssgUuFO?=
 =?us-ascii?q?4gWcYR4JxsbgXKEfYEFgVwBBIghBIIigQ6GH4IjA0qQS0iBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWMDNQwLKhVuMh2BIz4Xc4RdHmcPBoERg0+JFg+KOCkDCxgNSBEsNxQbB?=
 =?us-ascii?q?j5uB5QeT4NrASCBOpQbkiuhDgoog3SMHpU5GjOEBIFXpRCZBoJYizCVZ2mEa?=
 =?us-ascii?q?IFoPIFHCwdwFYMiCUkZD444g2mBf2WCL7gQIjUCCTECBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:XpjtwKMSugFxGQ/vrR31lsFynXyQoLVcMsEvi/4bfWQNrUohhmEAy
 GccWDvTM6mMZzT9edB+bNmw804G6pDQzIVhT3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVvlV
 e/a+ZWFZQb/g2IsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66s0AW0rbIkJwMhcHXsTx
 PESAndVQDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzM3wsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQtiuaxbIOIKo3iqcN9p02R5
 W3p+WTFJBgmLfiQ8zCazHGUr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:2MCLlqEI6rMxpip+pLqE/ceALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhDo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL2LKeDZslnd8+qUzJ856Z
 td
X-Talos-CUID: 9a23:flWDTGH7xQs/BF/iqmI5rkM4B5EhY0fz52vKfn61A0wuEJO8HAo=
X-Talos-MUID: 9a23:pdhiJws59t3bMxBTss2nvTprd8hH5aSSLkkxiLEJgcObCy9IEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758585600"; 
   d="scan'208";a="426441589"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 17:26:42 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id C4672180000F5
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Dec 2025 17:26:42 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 55438CC12B5; Thu,  4 Dec 2025 09:26:40 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe] [master] [PATCH] redis: Refine CVE-2022-0543 status description
Date: Thu,  4 Dec 2025 09:25:10 -0800
Message-ID: <20251204172632.3277988-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 17:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122327

From: Deepak Rathore <deeratho@cisco.com>

Refine the CVE_STATUS description for CVE-2022-0543 to provide
a more precise explanation of this Debian-specific vulnerability.

The vulnerability originates from Debian's packaging methodology,
which loads system-wide Lua libraries (lua-cjson, lua-cmsgpack),
enabling Lua sandbox escape. Upstream Redis builds, including
those built by Yocto/OpenEmbedded, utilize embedded Lua from the
deps/ directory and are therefore not affected by this issue.

It is also fixed in Debian with this commit:
https://salsa.debian.org/lamby/pkg-redis/-/commit/c7fd665150dc4769402cae97d1152b3c6e4366f0

References:
- https://www.ubercomp.com/posts/2022-01-20_redis_on_debian_rce
- https://nvd.nist.gov/vuln/detail/CVE-2022-0543

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
index 6166769ffa..0466e34000 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -21,7 +21,12 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
 SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e9b6d5f"
 
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
-CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged version"
+# The vulnerability originates from Debian's packaging methodology,
+# which loads system-wide Lua libraries (lua-cjson, lua-cmsgpack),
+# enabling Lua sandbox escape. Upstream Redis builds, including
+# those built by Yocto/OpenEmbedded, utilize embedded Lua from the
+# deps/ directory and are therefore not affected by this issue.
+CVE_STATUS[CVE-2022-0543] = "not-applicable-config: Debian-specific packaging issue caused by loading system-wide Lua libraries; upstream builds use embedded Lua and are not affected"
 CVE_STATUS[CVE-2022-3734] = "not-applicable-config: only affects Windows"
 
 inherit update-rc.d systemd useradd
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index 6527fb6996..0989ed5e8d 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -78,4 +78,9 @@ INITSCRIPT_PARAMS = "defaults 87"
 SYSTEMD_SERVICE:${PN} = "redis.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
-CVE_STATUS[CVE-2022-0543] = "not-applicable-platform: Debian-specific CVE"
+# The vulnerability originates from Debian's packaging methodology,
+# which loads system-wide Lua libraries (lua-cjson, lua-cmsgpack),
+# enabling Lua sandbox escape. Upstream Redis builds, including
+# those built by Yocto/OpenEmbedded, utilize embedded Lua from the
+# deps/ directory and are therefore not affected by this issue.
+CVE_STATUS[CVE-2022-0543] = "not-applicable-config: Debian-specific packaging issue caused by loading system-wide Lua libraries; upstream builds use embedded Lua and are not affected"
-- 
2.44.1


