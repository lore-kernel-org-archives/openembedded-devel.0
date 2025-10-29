Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C5ACCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:52 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.27244.1761696950427738405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EQu94lX+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696950; x=1793232950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EmZkxUmEl/bdSKKNZuuodVzHPIu7RraZO6hR1gIcFAI=;
  b=EQu94lX+sc/Fz0FSUEgmiANaOzJm5LrZNVfb/MqyWW3gLK+naS9QIqaH
   rj1e17uk/HMDFTAQgcWKsWo0/9LqYPPQzNYxg/NDwyWpkNpo4AfuSaTAk
   hl95CPr08jwKQNTHj0/v/ZoSP4FfRPcej56CX94Kq7nXaOSj5P3oCY852
   OI2vfQkUSL2yWHyuF/5qQr84MfK1/dVq5ZXSyUbczV+kPUans6kTeMpmy
   sgEDqe9inyp+Vm1I3+g/AREEb150cZauHAM8O6JD5KY/IAGRqaMINrL1S
   EB0K5SsK+Koa0w5wcuX2OeeN2ZN3egMytOBd+ONfMpG3sh5Kvl8zLujcp
   Q==;
X-CSE-ConnectionGUID: ODvZVGHbSE6GJO2RITOhcQ==
X-CSE-MsgGUID: UPsYynr7S8CI2lDUocpT7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196243071"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="196243071"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:48 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id D24161002B8A
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:48 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 878CFC00233
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id C8FD282C0F2;
	Wed, 29 Oct 2025 00:15:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/32] python3-grpcio-tools: upgrade 1.75.1 -> 1.76.0
Date: Wed, 29 Oct 2025 08:14:50 +0800
Message-ID: <20251029001505.528-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121123

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.75.1.bb => python3-grpcio-tools_1.76.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.75.1.bb => python3-grpcio-tools_1.76.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
index 7627356ec9..29bf02f786 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.75.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.76.0.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "bb78960cf3d58941e1fec70cbdaccf255918beed13c34112a6915a6d8facebd1"
+SRC_URI[sha256sum] = "ce80169b5e6adf3e8302f3ebb6cb0c3a9f08089133abca4b76ad67f751f5ad88"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


