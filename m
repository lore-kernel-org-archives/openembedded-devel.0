Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4C6C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:16:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7605.1745900154233605117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T+kn9EIw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900155; x=1777436155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1UAMzBRzAAlHCQ5FesbbJTQGYOf0yxQoQYZOIfLOWZw=;
  b=T+kn9EIw+3zOUXxsoO0vbAbUfrwQIHXjHyqHrrlycXVOYffKYoI7KlZ0
   CSiYEvFU7Aem1M4ds2KVu+hUMdjkYp+p4w1Zqng2H5A4j2+E6YATurLe+
   LKeg2vQ3yTNG+AaRSI3S8T33STYP79RT9HHdJQ0bUSJR2XnPpgVqF1P0B
   ALIks0fcj2TpEU3TVBJspl6gT1TpH8i8zfzfYMnzQoIo6C1Zewi4yvYE9
   GGYjj4X260/a1fkQCgYCm6TgnE8Xtmk0mZ4TLrQuBydS+wWT6vmjdfp14
   5ujVqt8qHxC6nCL6Mz/pm4CEp5NFNbSMC72xF2J04HGJjP4MxWTUUco9T
   A==;
X-CSE-ConnectionGUID: oz0M+/UwQpmFZeWJl5/vWw==
X-CSE-MsgGUID: ejULtswbT+WEMrkhFfxs+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="197966429"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="197966429"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 838D4D4C4A
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 41238BF4AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00A691A009A;
	Tue, 29 Apr 2025 12:15:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/23] python3-grpcio-reflection: upgrade 1.71.0 -> 1.72.0
Date: Tue, 29 Apr 2025 12:15:29 +0800
Message-Id: <1745900138-26424-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117224

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.71.0.bb => python3-grpcio-reflection_1.72.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.71.0.bb => python3-grpcio-reflection_1.72.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.0.bb
index 5453cd204e..77c0ec4bbe 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.72.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "51504e977057ffabe66d1ed55557b15e969c42bb3a1f28ee45d730dd5f983bb5"
+SRC_URI[sha256sum] = "75c4bc9accf8458c635ebfd408317bfb61368424e1219642a20332adf5570dff"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


