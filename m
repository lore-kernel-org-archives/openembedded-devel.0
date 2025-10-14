Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2B0CCD18F
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.11103.1760433617558189930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QnJRsyc4;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433617; x=1791969617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D6rh/IPJaa5mG7vhV+6nNHVskQph3Vi/xoYWnKKM3Zg=;
  b=QnJRsyc4JgHlEn0dSVrvhZ5R7tV84BU0SrCNiOQowBG3SVrlg16SlOfu
   EcHE3te70bvijs56ND00hnDJVyHISq0zUwxXRYztoBXE4mT4pp7DMSd+P
   0gsTvsGzge9a+sWqjIR19X32rIOWVz/g1Rf+p1I6sTi4edmqcXxY1vbvL
   XRXU9B1ivTP6Wuuki6QE+gRzX1KFUeUyKtG7iVsoUr9mYj3/X0E7uDuCR
   qYTYYcYZ55Isui+q1SKIyHRAaiLdIOyyMEM/XtErNIRg6Tzm9TSf5mU0t
   7E1mvZlymzBVZKXLRaJ+yZM/Kg5lQBGO2/881Hpr2zYj7e1MAMRmjbPu5
   A==;
X-CSE-ConnectionGUID: dYaK7AHkTLCPK3CeaLhU1Q==
X-CSE-MsgGUID: 8DPXvZf6TkKQBUrHHmOwxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194812674"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194812674"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 28FF41C0008E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:16 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D3B8C1C00158
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6A51B101BB78;
	Tue, 14 Oct 2025 09:20:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/44] python3-invoke: upgrade 2.2.0 -> 2.2.1
Date: Tue, 14 Oct 2025 17:19:07 +0800
Message-ID: <20251014091927.493-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120581

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Python 3.14 tweaked the behavior of fcntl to raise SystemError on buffer
  overflows, which our interpretation of termios.TIOCGWINSZ technically was

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-invoke_2.2.0.bb => python3-invoke_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-invoke_2.2.0.bb => python3-invoke_2.2.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb b/meta-python/recipes-devtools/python/python3-invoke_2.2.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-invoke_2.2.1.bb
index 3f2e6232d6..bcff343480 100644
--- a/meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-invoke_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.pyinvoke.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8815068973f31b78c328dc067e297ab"
 
-SRC_URI[sha256sum] = "ee6cbb101af1a859c7fe84f2a264c059020b0cb7fe3535f9424300ab568f6bd5"
+SRC_URI[sha256sum] = "515bf49b4a48932b79b024590348da22f39c4942dff991ad1fb8b8baea1be707"
 
 inherit pypi setuptools3
 
-- 
2.43.0


