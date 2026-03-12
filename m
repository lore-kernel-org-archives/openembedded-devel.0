Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A3511258BE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:37 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18533.1773312814017153810
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j9XEOaO8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312812; x=1804848812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=67nbRUulC1wzphcBxC32ItvytaEFRYYYhezyTGZkBLw=;
  b=j9XEOaO82yiegkkZAaxExyvvNjOBF55IonlZzHXzAKLqsLDvBkcG0FgH
   dDM4Y+KDyacW4q8wza2tJ8vq6DDfO4wz3a5m4Bnotq3PKRM9mdHLwZEhm
   mbxKbmn/8FFEcmnQyCbx2XfSJ4mwWGF3ytjpEFvVPMpOGC+OkVe/3GwQ7
   u+jGmY8WAz+iUSC/4DLqiTkaR0WPb87nvPTA3n/sXl/CFQg+t7020rwyw
   OsbTi6YBHTpIlmTrAQzeQXdA0GhipbafXiBizwcYMAKrGqxry8eHB0ZsB
   rwLx3kPcwFm1B1yth+PfZGvJq0l+eSCIUZRTQm6p/NpV3ritaswRDHjML
   g==;
X-CSE-ConnectionGUID: lfvpLZ+IS7W4AWrW1hdBLg==
X-CSE-MsgGUID: ZQtNY0yLSomN3m09umONtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="221636164"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="221636164"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:31 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 93EB3C01B37
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:32 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 45E9814042C9
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 53B8E18005B4;
	Thu, 12 Mar 2026 10:53:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/64] python3-cmd2: upgrade 3.2.2 -> 3.4.0
Date: Thu, 12 Mar 2026 18:51:47 +0800
Message-ID: <20260312105220.1856-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125131

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_3.2.2.bb => python3-cmd2_3.4.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_3.2.2.bb => python3-cmd2_3.4.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_3.2.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_3.4.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_3.4.0.bb
index 8da18f904c..2ed0bdc769 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_3.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "602a10c7ef79eae2b7c8b3874b8ac3a32d9278ceb90c997a2eeb9fc0041ab733"
+SRC_URI[sha256sum] = "fd43ef7540609469f055858146f2c592ca4c58e3c336b5efbc5502459ab0bdb2"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


