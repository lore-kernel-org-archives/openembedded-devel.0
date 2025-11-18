Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112B7CED247
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8435.1763456972671246225
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fzQ5UO0Z;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456972; x=1794992972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nmgGPdnK3aBp0BzfvGl0LiDb71RnzC3sBIgahu3gFNE=;
  b=fzQ5UO0ZpxX/0klFU9kzZdRyfOKADhqoo7OhJGu7Abv6qesFLc3cFJ8A
   k9NrFxPN9aA0jFqJOcfbPWUWhatmAAkeRZwxSyd96Dk0ibgjJaWCaQAJJ
   LvQhs81YGZc/S/dtQAyn6PuTTEkNE0OEtFftsVuY8kiiwDJpFdE+FhkMq
   f8cVe3wD65mp8JRMRxf6BggIOPPMqdkPN1vHVgAl2hziZQ8KKH48BE5yq
   NuNfhk1EqaoJv3cEUqTBI0Om3ZBsQGh3LSpqlwYU2Q/Hz5V+7GaspCM6t
   jnV94mGMu7xaZC6tUhC0I0SSMXsoqcMJ7LXOrsFt3f5pS8VEQVw0z3Gh9
   g==;
X-CSE-ConnectionGUID: P0LIq2cvTRmm9Jwx4MF2Tw==
X-CSE-MsgGUID: p/PnqWxZRNe3Dyw8Ke0p7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="223411696"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="223411696"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:31 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 30A358203C4
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:31 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D8B23C0182A
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7967914002E5;
	Tue, 18 Nov 2025 09:09:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/29] python3-pyais: upgrade 2.13.2 -> 2.13.3
Date: Tue, 18 Nov 2025 17:08:40 +0800
Message-ID: <20251118090846.1484-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121834

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* fixed: https://github.com/M0r13n/pyais/issues/194
* added missing line breaks for multi-part messages (ais-encode)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_2.13.2.bb => python3-pyais_2.13.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.13.2.bb => python3-pyais_2.13.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.13.2.bb b/meta-python/recipes-devtools/python/python3-pyais_2.13.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_2.13.2.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.13.3.bb
index 6f1723d3b8..4103eb916c 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.13.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
 
-SRCREV = "439783a1fa678cf18acfb75ccb9e02142cc72e2e"
+SRCREV = "f0b3e06c4f1a532ba75986bdcf999ad776f81908"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


