Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9AAFD7F7E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92752.1772187321425541676
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ojT0Ri8K;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187321; x=1803723321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BObPi+GSFMmJnJVseFobI5g+z6045HhzDCfXc9EE7q8=;
  b=ojT0Ri8KAHJfGyJ6OH4KX7obDbehJ8A5YKJTxnquCywnk/pSh4MIQ0W4
   542sAIJajsX7wvKZ/isAEPNEYboR/AG+KCCD09mJKAtzutw7qi1ZzybF1
   2g8mU+JKyN1VRmccfyiJVLTUei1IIubIwR0C40W1LN/hFOx+7nSA2r1P9
   9OxPI2ariAl0ML3wWpKQS/fRpCh/tTx5xwRae5Aiy7glQKvo/l5bHMRMr
   he5Xfdm7++uR9hjlS3nbOkJ5+sHGchVBDzWjMbHKx/ZhZ8XMcXNRz503r
   JYAH7x18LOK2Um1UQ49nwbRq/iaeQPSgcoGb6xRY2xlNQ2EDbjQnUGjm9
   w==;
X-CSE-ConnectionGUID: kWL9APxhTbe5EEh/qS1kwQ==
X-CSE-MsgGUID: QpgvitbmQlC/wCvfydfk1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="235523493"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="235523493"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id ED96F8203D5
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:19 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A655D926753
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id C45AC18005A1;
	Fri, 27 Feb 2026 10:15:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 38/52] rdfind: upgrade 1.7.0 -> 1.8.0
Date: Fri, 27 Feb 2026 18:13:13 +0800
Message-ID: <20260227101327.1432-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124738

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/rdfind/{rdfind_1.7.0.bb => rdfind_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/rdfind/{rdfind_1.7.0.bb => rdfind_1.8.0.bb} (79%)

diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.7.0.bb b/meta-oe/recipes-support/rdfind/rdfind_1.8.0.bb
similarity index 79%
rename from meta-oe/recipes-support/rdfind/rdfind_1.7.0.bb
rename to meta-oe/recipes-support/rdfind/rdfind_1.8.0.bb
index 1472ca94ea..71ee7871c4 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.7.0.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fa22e16ebbe6638b2bd253338fbded9f"
 DEPENDS = "nettle autoconf-archive"
 
 SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz"
-SRC_URI[sha256sum] = "78c463152e1d9e4fd1bfeb83b9c92df5e7fc4c5f93c7d426fb1f7efa2be4df29"
+SRC_URI[sha256sum] = "0a2d0d32002cc2dc0134ee7b649bcc811ecfb2f8d9f672aa476a851152e7af35"
 
 inherit autotools
 
-- 
2.43.0


