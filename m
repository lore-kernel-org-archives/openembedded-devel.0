Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5505ECDE006
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6999.1782378096336040872
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PlCTAjAm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378096; x=1813914096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p9gZaYQUDTo5u8QJAkbCHbI1tybY+vr913+qF8QrPHE=;
  b=PlCTAjAmlOLDz4qEI2K1tXUoN+2Wf5BYAKUkmtwRhVIH6FkG9UbyqvbN
   OHu4V2kEZgOuk8ZMNpXQuuyXNG1EWmpDB37HffX66qA5ZoyDS5eVPEO15
   zUE067ND4vxZS/uN0LGFaynkGaY0JN6XgvGI/PpTn1x9BZ/+z55Gtg1MA
   39p53z8d5AS++Rzhdgiu4kfuH6fI7364mpGCmztO784xRBtkzBIKi4n4N
   +3gqPFNYGKFQulgaRyZWMCXISZ5dl3bTGr7NRP1hdJMZZijkpigWs5eRy
   OH03+k8HV4uLo7iGcOeNmxKZjCrUdhB1+Ure/EBwO4QeQjzTlkKDw6oSc
   w==;
X-CSE-ConnectionGUID: Fdy2YjrDRD2j9VRRTxSL6w==
X-CSE-MsgGUID: vBLBibFkQJS/ZoNMbWlGoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245300782"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245300782"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:34 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 56E021002819
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:34 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 10F72C0075E
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 0D1F61017328;
	Thu, 25 Jun 2026 09:01:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/47] freerdp3: upgrade 3.26.0 -> 3.27.1
Date: Thu, 25 Jun 2026 17:00:42 +0800
Message-ID: <20260625090127.1563-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127735

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp3_3.26.0.bb => freerdp3_3.27.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.26.0.bb => freerdp3_3.27.1.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.26.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.27.1.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.26.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.27.1.bb
index 054d0e7aa3..f01fd5634b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.26.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.27.1.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "3f6d7cb1f8973cc84c66b258a9a61c4e2b2f30a6"
+SRCREV = "6099a8d64624458ebce20e185a6d02a3ea791842"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
            file://run-ptest"
 
-- 
2.43.0


