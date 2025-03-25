Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E03C36014
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.61110.1742893331453657027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PMEwsWEu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893331; x=1774429331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bhQjHOPyLa7+hefpjdrxYXb+1UtFPI39+DNJdZs84rw=;
  b=PMEwsWEu4xfT0BwPY1y9KJeTZLDhwqBGAm77tXOaqwfuqe8eKuqlznVk
   ZNh32tdBskcLUg8i7faozfWFUxZnqK+GlVB3HOU38RLidjAlaSnhaZV+8
   PpcgtwYD1ubmtFVabaJCLgSSVgK/fMfAgQwmdkfq/fGuX2+N1WpBPRXqE
   /t4zKjrNUFIWyJXKTjF9pD+abv3MMSZUM3qnx9PDLXaVlJSyChnEUchvR
   mfhmRi0JOIF2Qzx4snYcr500MLWimy5ZBqi28h/g6yVRZwreVjllOPW6X
   Se1G486yW7RKwGEuDSBIt0JMqZbEN9a+hPDjAS1A9MVL6X6tQ9BQud2cd
   Q==;
X-CSE-ConnectionGUID: 2ThgVM6jTOetDQq2i8PMbw==
X-CSE-MsgGUID: Eq5g50TeQkKKSwvIL6jd1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="173638006"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="173638006"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A2C77E681E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A2B9D8AF4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 050441A0078;
	Tue, 25 Mar 2025 17:02:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/45] jwt-cpp: upgrade 0.7.0 -> 0.7.1
Date: Tue, 25 Mar 2025 17:01:15 +0800
Message-Id: <1742893312-3809-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116232

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jwt-cpp/{jwt-cpp_0.7.0.bb => jwt-cpp_0.7.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jwt-cpp/{jwt-cpp_0.7.0.bb => jwt-cpp_0.7.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb
rename to meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
index 19424337f7..57a9cbade1 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.0.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
 SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https \
             "
 
-SRCREV = "08bcf77a687fb06e34138e9e9fa12a4ecbe12332"
+SRCREV = "e71e0c2d584baff06925bbb3aad683f677e4d498"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


