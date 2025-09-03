Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E04CA1013
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7934.1756890228119352621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q3LHcqiB;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890228; x=1788426228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CBZu1wTsXSSWt7S0jte3Rm/kW/S3QNViCb0DOCaBH5k=;
  b=q3LHcqiBmNTCL1mIVoVIbLESpPqP3yHEwAogv3V2yXPY0F9gvANcfgqi
   ZEPFAlp/38V6JpvTOmrB2ovntgNHcNXXkq98XFfM1nFDOlg0wUL5GHMHE
   KgrFEk4xZArRwE6nY8A+RmlK09pCnjS+ZPEp1ub031QQS69rFXt/VxPus
   1UFtUWbePhTVDZZDdnCWX2fHRvYx9KNW3d9GbgjuXrmOx35h17LluA8cZ
   ZlbfJg+JRjow9f4cac95gHv6nXjg35XUzoxZHzDroG1YL7dyIOnVzSyIG
   zGhE6dbXekqnKXHz0JFBxzFKRr/cryZmagf8oaMfoc7PNzkIBU1SDk/dR
   w==;
X-CSE-ConnectionGUID: 2lZPZSNaRh2BxDKZap3W+g==
X-CSE-MsgGUID: 2wocoLP2Tk+CRT9NbEer5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199446287"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199446287"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:46 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 8A7E7189F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3F87E1C2C20C
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:46 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 16BD0180226E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 06CD21A0071;
	Wed,  3 Sep 2025 17:03:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 18/56] nftables: upgrade 1.1.4 -> 1.1.5
Date: Wed,  3 Sep 2025 17:02:39 +0800
Message-ID: <20250903090317.2002-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119215

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nftables/{nftables_1.1.4.bb => nftables_1.1.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.1.4.bb => nftables_1.1.5.bb} (98%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.4.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
similarity index 98%
rename from meta-networking/recipes-filter/nftables/nftables_1.1.4.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
index eb119c6451..a1954c0814 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.4.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
@@ -14,7 +14,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "3444f0012af0472399eeae89a758b9c6dc5f311f6c67a48988fa1600fc4bac86"
+SRC_URI[sha256sum] = "1daf10f322e14fd90a017538aaf2c034d7cc1eb1cc418ded47445d714ea168d4"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.43.0


