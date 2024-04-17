Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5D6C04FF6
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2730.1713318110626488650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A+SymU+9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318111; x=1744854111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OYOuR5GaPUfG00/AqTT0vbQHZ/LBxOPoF2Ujr+I4Au4=;
  b=A+SymU+9pz3PEjsXFV4k1Mes5tfiw8OHI49Uom+TmLzcRGujN4TWLvQ6
   Ea+AA8+Rf7KcDmMOCs1xOASNMeEiHjpU6rh42oNoQPoRxOCSb8BaotAkN
   zZ0TIL6coxQPdcJOX87MVUmR3fS3skjJxMrabWDU8eSQ05f9LVJtohXs7
   5NKaQ/xDkgxfGmWCcNadmKkuL/owivZTOI6BBlENpISUS5sT1bYomfppM
   hecljyAVSfHMngdyc7NhFMyQyUwbpz6XaI59cXiR97zfMwe38ccvbMXCb
   NrXhIroHT5pxOLeNfm5H1rzO6QJAnF3+KAysQctdiAfuKntT8w3hUafU5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155837389"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155837389"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:49 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 80E86D3ED4
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C32D056F79
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 44DC92007473D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E57731A0002;
	Wed, 17 Apr 2024 09:41:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 46/49] tcsh: upgrade 6.24.11 -> 6.24.12
Date: Wed, 17 Apr 2024 09:40:58 +0800
Message-Id: <1713318061-17128-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-5.370400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/dcKHrnYNovyia
	SqRpkfBtrRbN1C0n1GuysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl0fyM5VfgjG2Oiw
	t/WQfkJ+SvQWuoJ9vsj21HGsfcKEM5UcZtwNsCroURSScn+QSXpjDMT0TyDk5+gtHj7OwNO2oWE
	e3+NERqT66Xbm1L93Pu8b9fGhvUPSyeTXZNx8t6GCRB4vr3hpoYOO/0MLZzMRECxRfphVl3thPA
	GG0/vU7V3/e879zBcGdVXlWkTsV9w==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110032

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Remove kinetic and trusty
-Fix history merging

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-shells/tcsh/{tcsh_6.24.11.bb => tcsh_6.24.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.24.11.bb => tcsh_6.24.12.bb} (94%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.24.11.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
similarity index 94%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.24.11.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
index d04ba1611..058fe6a7c 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.24.11.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.24.12.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-SRC_URI[sha256sum] = "b5a7b627abb3ef2e8d3a869bb675d0e927d850704447a1b2c77946c0d324799d"
+SRC_URI[sha256sum] = "e3270ce9667fd5bd2a046687659fcf5fd6a6781326f806ebd724f1e1c9cd4185"
 
 EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
 inherit autotools
-- 
2.34.1


