Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11C6C021A4
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.46456.1739178113774934251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gD+BfvQq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178114; x=1770714114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EnR4DswKb61Da10bk3TEh0wFiNSNzbCIg9GdYIRMBuo=;
  b=gD+BfvQqB0XvXDXmtHL4TUuXuiXaC75h2/mwSrTa83FnkX038Il97jXS
   RUKdYG5B9Y3tmYHF8RIGZyRY8tzF4gCIrb8Ow+J1TqFBsXKjLOEPR8HTV
   EkyN8nm4RNSb2ch14wpd/L7Ue+KQplf8Q2F3A8y81oE3Slw/MjUvWvw+O
   0+AspwLiBd8aACFt2E4w1S47zwbQGPCtd644XCNRCJ9qGshVLKATXXnhF
   ddKZTwI05JZu3rNhEkbikc+LGkJ/diLS9vYBCpE845lpkUOmZmhC8hXSa
   5lj6yndxRX3l+KmH0cAkCrNgq5mOAm+8wDeXUxnhNV3RBGQMhl1Jb03CA
   g==;
X-CSE-ConnectionGUID: IAl1aCqYRf+7RyaYEG8ktA==
X-CSE-MsgGUID: yOpsiIMzTnCsQjCBa0vjTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168394085"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168394085"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:51 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 43F4596741
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B8B215569
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A1D341A006C;
	Mon, 10 Feb 2025 17:01:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 10/66] libmozilla-ca-perl: upgrade 20240924 -> 20250202
Date: Mon, 10 Feb 2025 17:00:39 +0800
Message-Id: <1739178095-26432-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115339

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...zilla-ca-perl_20240924.bb => libmozilla-ca-perl_20250202.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20240924.bb => libmozilla-ca-perl_20250202.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240924.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250202.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240924.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250202.bb
index a5de4f2269..0c12b46519 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240924.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250202.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "c4b1412bbc37dff8cf29af6f92cb47defbe90eebcbc29e407a98638f7a31bcd0"
+SRC_URI[sha256sum] = "32d43ce8cb3b201813898f0c4c593a08df350c1e47484e043fc8adebbda60dbf"
 
 S = "${WORKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0


