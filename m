Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF31CDE006
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7246.1782378161622588523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DGWtV9Xz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378162; x=1813914162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vXgPwqVB+PFVGja8vzbpPSJ9LzWuzxy41DSSw/bUgpE=;
  b=DGWtV9XzWvBsHqkho23uqaDMCozNvR1LZu/ygoVT2ucyFcTEiVg/+ldW
   EngklrP7oCGnB9KuZTedApyHlVfNVRiydPyPMr7C9yqTACMKYNXMQ1hLH
   gjnxUVA/kxHkHTZlGxxmjlYPp1ozttHeVMj6qq6zUZ1G9U7wrtQe5+DNe
   /BOkOzWzktnyDrpZEtMLkQ4L33xqqiEeixEVD0MdtxDLW/vlKTOV145sQ
   C7hvBWJ1fK0dcrXEEbJ+6g36G+rUT2FIPO8jVhPO480e6hsOOJPA1BnCj
   I64+aNj4iue3kD6+K31qWnHzaoDEF8RbXdwGw01Djl+LeBNHp1clFpMJ+
   w==;
X-CSE-ConnectionGUID: fK4//7AiTBOMiAcdIkWusg==
X-CSE-MsgGUID: +b7kWOfWQVKw8wNKu9vnkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245302411"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245302411"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:40 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E48131002B87
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:39 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9DCED1400123
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9A4961017328;
	Thu, 25 Jun 2026 09:02:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/47] python3-virtualenv: upgrade 21.5.0 -> 21.5.1
Date: Thu, 25 Jun 2026 17:01:23 +0800
Message-ID: <20260625090127.1563-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127775

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  fix(seed): refuse to seed unsupported Python versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-virtualenv_21.5.0.bb => python3-virtualenv_21.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.5.0.bb => python3-virtualenv_21.5.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.5.0.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.5.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.5.0.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.5.1.bb
index e21575ac16..b8662ea7dd 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.5.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "98847aadf5e2037e0e4d2e19528eb3aca6f23906422e59a510bff231a6d32fce"
+SRC_URI[sha256sum] = "dca3bf98275a59c652b69d68e73433e597d977c2da9198882479d1a7188009c8"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


