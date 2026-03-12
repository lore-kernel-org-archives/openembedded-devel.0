Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80547105A585
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:00:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18640.1773313209576943023
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AkulbIqj;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313213; x=1804849213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1yKKO5gFLxzq+t9lqruDLACdAUdr/3SE4zQ5K0CWOrc=;
  b=AkulbIqj3gie74yb4NXS0+6VI2kfM3hcn504fbmZxJaevxQndJHXW0pa
   2VrDTpt2bmb58ie8CzSvBRpdIqOdEbF3udjg9K04fpkngBDR9vm/p23gn
   dLt+DRvaavPkyoa7MxRVGa5xdr5/dm2/nseWeml5TnSD9g07oJ3PN6OyX
   TZ/PrtfBAh1l66qnjFAo2rTaDN30WfiMQ+q7lYF1x6QN9f1yoztBSTL5i
   ZTSpLR9uLGBiJiDZL1njZxyr58WzKKuC+NbL9ChiPl24D444cly7fL3fH
   hvQEzMlcjD6o32cyZqB86gDvs3Ur+STU9rF67+hYVhEW4BqpZJzQYR6bD
   g==;
X-CSE-ConnectionGUID: GDa/hsU8Tsayq63lzlWjlw==
X-CSE-MsgGUID: vj+IN5Z0TuSFrlTSCWNI/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="221636624"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="221636624"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 20:00:13 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 907BE1C166D6
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 44FEAC00218
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4AC008288E7;
	Thu, 12 Mar 2026 11:00:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 64/64] weechat: upgrade 4.8.1 -> 4.8.2
Date: Thu, 12 Mar 2026 18:59:40 +0800
Message-ID: <20260312105940.1900-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125164

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_4.8.1.bb => weechat_4.8.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.8.1.bb => weechat_4.8.2.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.8.1.bb b/meta-networking/recipes-irc/weechat/weechat_4.8.2.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_4.8.1.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.8.2.bb
index 7642a88f71..458a8a317d 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.8.1.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.8.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e7ac1fbcc71458ed647aada8747990905cb5bfb93fd8ccccbc2a969673a4285a"
+SRC_URI[sha256sum] = "7e2f619d4dcd28d9d86864763581a1b453499f8dd0652af863b54045a8964d6c"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


