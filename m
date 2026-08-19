Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E9AC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:19:57 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4817.1787138392724181667
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GNAzt28Q;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1866; q=dns/txt;
  s=iport01; t=1787138392; x=1788347992;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PJOcgfU9VySOQNz4lH/LMbcoLYvu+9Pp1tZUdV2fYms=;
  b=GNAzt28QG+W0htFi+Lthmk2MW44509a91jLiHnK7b+/m7/OuveqlD9H6
   jMXf35kqfnvRXDank4E5BNWDEhlKczcsBUS/iHjQmDzlh4MnQF9MWaRNv
   /1GonoIU4wDoRA9mFmdtcdTLG4iz/Qo/0542LOueZdRwpiM7AERREPY2C
   NmDKATmaURB8+vT17FqTfiwrTjn4yKROGJIhIDjd5UW728EzJ4zuNsB4C
   aVF7AxAQWJHgIiXc6SEppkGt/FQzt04LbveAw84dczVnPOrwFPK4Q5TNG
   w5pH6lxbzs0HJKMnqoTUd50/iYfPZUV8pkgATVus7sUZREIAUaVO/BURI
   g==;
X-CSE-ConnectionGUID: PQ+6UZxtRdOVzxQA/x201w==
X-CSE-MsgGUID: bVY99dNDTMqWoY/uOgSL6g==
X-IPAS-Result: =?us-ascii?q?A0BCAgA0kIVq/5T/Ja1aHgEBCxIMggULgld0X0JJk1kBT?=
 =?us-ascii?q?4Ihnh4UgWoPAQEBDzEgBAEBknICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGXIcTARgBKDVcPAiDAgGCdAPDf4IsgQGDKAGBVNswAQsUA?=
 =?us-ascii?q?YE4hT+IIoVyJxsbgXKEfoQpZ4V4BIIiehKBcgZQkHdIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ6gQlegSsqYhIXgQmCCgKCc?=
 =?us-ascii?q?4IGAgFJRREKCwsYDUgRLDcUGQQ+bgeOSSCCEzR7CQocYFATJ2OTAJJioRIKK?=
 =?us-ascii?q?IN2jCGVOhozqmyZCKRahGmBaDyBWXAVgyIJShkP3kQ8NQI7AgcCBw4DC5NmA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:/Q9kNa+XH6XPm3sHDbmYDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WUaWjrVaazcYDb0fIwjbI6z8EkP7ZSExtZjQVRppSBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjtFs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kOBM5Gx9RnHVtC0
 sIKOAkkKQDZ37uplefTpulE3qzPLeHxN48Z/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP00n1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYCNKobVHJUE9qqej
 mj4zjWoDjc2CPmG9j20tW+LidTrwyyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:jZ9Doq8WEStSg2sVvlZuk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3AReXEXmsptTLkqkf/smWBeWTb6IsdSz6D8UXAP3W?=
 =?us-ascii?q?0Llh7WIS8Dk/KoPp7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ATXE6Sg2nJPdLoseZfvzeieMuZDUj6ZqfWREBt7k?=
 =?us-ascii?q?6ntC7Mh03JhCStxDpTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="520827189"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:19:51 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 6DC8118000249
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:19:51 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 98BD2CC037D; Wed, 19 Aug 2026 16:49:49 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] redis: avoid LTO for clang builds
Date: Wed, 19 Aug 2026 16:49:43 +0530
Message-Id: <20260819111943.4062560-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129353

From: Himanshu Jadon <hjadon@cisco.com>

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

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
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


