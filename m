Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23EEC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:12:20 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3304.1787217138493034771
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Mx2ZFJpl;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1870; q=dns/txt;
  s=iport01; t=1787217138; x=1788426738;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wCqd4OhGRmz9qLiRFlRIQ+zEqf0CeBkUb78tWX+9PBo=;
  b=Mx2ZFJplv4EZ5lywbFnPwJxX8eWZ/6D2fT50HtkqfSI2ChQUzHpbGo54
   7j3A8vJC10M3FXg4l0i1oHNPmTsRAb0mzxMYr7mLBTXmU+mCkF+Vm2yPs
   IlsPd/sVU9G52eGnjhQ3c1y/LUxYmQVHYGZqCaTMMqDwcIqV4A6e9SYpp
   0Cr5BPrAMISkRKp/xV7H1TYwRzCtnsi51s6rMBJULih3GbmrckaRXL7Ts
   pvzHIN4oRC0O1b2E7J6hPgZ/VNneuWgIyPjFwF2nQTF4k+4RVHECHA36t
   bUUhObYloQhv+TK5uQnIwgMNbk+wPu2KcFEpC8h5u8o/YP82pSi0wz7Sm
   w==;
X-CSE-ConnectionGUID: KCKdmFG6SOmg4YTtnMyGoQ==
X-CSE-MsgGUID: ip3zX47JSe2SlwjdypmPYw==
X-IPAS-Result: =?us-ascii?q?A0BCAgCJxIZq/5T/Ja1aHgEBCxIMggULgld0X0JJk1kBT?=
 =?us-ascii?q?4Ihnh4UgWoPAQEBDzEgBAEBknICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGXIcTARgBKDVcPAiDAgGCdAPCboIsgQGDKAGBVNswAQsUA?=
 =?us-ascii?q?YE4hT+IIoVyJxsbgXKEfoQpZ4V4BIIiehKBcgZQkQJIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYhIXgQmCCgKCc?=
 =?us-ascii?q?IIGAgFJRQ4JFwsYDUgRLDcUGQQ+bgeOUSCCFzR7CQocYFATJ2OTAJJioRIKK?=
 =?us-ascii?q?IN2jCGVOhozqmyZCKRahGmBaDyBWXAVgyIJShkP3kQ8NQI7AgcCBw4DC5NmA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:yV2Jc6nwOLMXIgGjX0h5lrno5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKCjvTafaCNjagf4p0OYvgoBwD6pTWytUxSgdvqy80H1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsvPb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fa4z2epyL04Qz
 tsdJ2w8UgyFovOZx4vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKIIITXGJgPwx3wS
 mTu/nyiECFGa/6kxGC+9m2uiv7XmBvKR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:EN26ja5ukZaCVDSNigPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3Ammwcd2r4HaczXTJvNN7ygKDmUeMOUXHY4liOGGi?=
 =?us-ascii?q?9BjpYdKGTbE6//5oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AJUtu/w8VYFOh8aXkC3y7gYCQf8ZwuLaeVB8vqph?=
 =?us-ascii?q?cgM2bNyBhIzKlvSviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="520555253"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:12:17 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 4349818000244
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 09:12:17 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 5DFC9CC037D; Thu, 20 Aug 2026 14:42:15 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] redis: avoid LTO for clang builds
Date: Thu, 20 Aug 2026 14:41:15 +0530
Message-Id: <20260820091115.998503-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 09:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129384

From: Deepak Rathore <deeratho@cisco.com>

In Redis 8.0.x, the build system adds -flto by itself when clang is
used with the default optimization setting. In OE clang builds, the
final link still goes through the cross binutils linker path. That path
does not stage LLVMgold.so, so redis-benchmark link fails with:

  x86_64-oe-linux-ld: ../lib/LLVMgold.so: error loading plugin

The failure is not seen with gcc because Redis does not add clang LTO in
that path. Also, changing OPTIMIZATION from the recipe is not a good fit
because it replaces Redis defaults and drops -fno-omit-frame-pointer.

Use Redis documented OPT variable only for clang builds. This avoids
the clang LTO path and keeps the frame-pointer flag. The gcc/default
build is left unchanged.

This local workaround can be removed later if LLVMgold/binutils-plugin
support is available in the toolchain path used by clang LTO builds.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-oe/recipes-extended/redis/redis_8.0.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
index f6866747eb..fe31033328 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -40,6 +40,10 @@ PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "USE_SYSTEMD=yes,USE_SYSTEMD=no,systemd"
 
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
+# Redis adds -flto automatically to OPTIMIZATION when clang is used.
+# Pass OPT instead, which is the documented way to provide explicit flags
+# without Redis adding its own optimization defaults.
+EXTRA_OEMAKE:append:toolchain-clang = " OPT='-fno-omit-frame-pointer'"
 
 TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"
 
-- 
2.35.6


