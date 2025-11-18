Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 063D7CED24D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8433.1763456966071924585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pesJz4jN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456966; x=1794992966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2WJfIO1WDOWyg+RlkdR2gLT+/0PgxSqorPupA2HvXVI=;
  b=pesJz4jNhuRje/wRfIGn7fMVS85lWbCcbV38qUqziExPpjW4BA+Tf9Yv
   8REwPM2H4vok5eWniObMMn4Vlg4RAYyu8xKkF4oELnCUKJA4x7C3v80h6
   j1H1GTsRnglxR+DMuWWWKHa2AOoiq+1yeOaupU0WQy0mwZO1gkfrjAQW+
   4GzdX0dX2bjiQ8+nwUFffBtp5vVUd1WUJhlGtAOoL1ZhD8Eruh7jtg0vu
   2ASqvI0s2yrnzohLIRzeM3vYIKqIgUAJ8oOLdOlliE7eXD0xIyiA9qC2n
   b7t85r750UlrbY0jhC0H3hwQZR0zsvoLuQTzH6OEzme7F00DJQPnstfc5
   g==;
X-CSE-ConnectionGUID: U+yqMKFORaaUy9Be7gM7ew==
X-CSE-MsgGUID: fbsNevE5QTKijJ2Ud/cTNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="208179120"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="208179120"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:24 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 927C81000353
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:24 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4372F1801983
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B2064140024E;
	Tue, 18 Nov 2025 09:09:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/29] python3-execnet: upgrade 2.1.1 -> 2.1.2
Date: Tue, 18 Nov 2025 17:08:36 +0800
Message-ID: <20251118090846.1484-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121830

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-execnet_2.1.1.bb => python3-execnet_2.1.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-execnet_2.1.1.bb => python3-execnet_2.1.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb b/meta-python/recipes-devtools/python/python3-execnet_2.1.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-execnet_2.1.2.bb
index 54c102bec7..34f0a1f670 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_2.1.2.bb
@@ -11,7 +11,7 @@ DEPENDS += "\
     python3-hatch-vcs-native \
 "
 
-SRC_URI[sha256sum] = "5189b52c6121c24feae288166ab41b32549c7e2348652736540b9e6e7d4e72e3"
+SRC_URI[sha256sum] = "63d83bfdd9a23e35b9c6a3261412324f964c2ec8dcd8d3c6916ee9373e0befcd"
 
 inherit ptest-python-pytest pypi python_hatchling
 
-- 
2.43.0


