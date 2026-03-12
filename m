Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681EE1125867
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:27 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18762.1773312803689470156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KhkzvsKF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312803; x=1804848803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xYO60hMGagPOuwojNq2w9+IcdkxEmHRIc2Z2USLTGfM=;
  b=KhkzvsKFHW5+DDVtAge2Q39xfAype8CiokfpJ++PYOlXHTcbru0ca1CO
   2VHkX30wnA73Ylo/H4luAygcWV4WBELUuJFNQUlStmDDOHduzQsqMqmz9
   Pk1GSIMpyoYPHheMTVO2Nf+LlYSQcZV3/7qfflCZgDzDEsVXAyfTKbq8O
   byLB9i2dxa5kG4k487we4Tgh60Ik+NrwlzIk6yVV0Q2s+uyRp0K9hx/zc
   pQD42whvZAnysHpV53KiL8gY6WnX5xflDlw4mMoVhaQy7zFkGIU8eLV4U
   38xIOes83FqTS8LGKqTC1YQPeGR9l5NGZGQf46AYnPekDTHRVdlOBGIqh
   g==;
X-CSE-ConnectionGUID: HYKZO1wVT8uePOsdfPSorA==
X-CSE-MsgGUID: zUicxehMS5mlkSQqsPFSvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="233021511"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="233021511"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:22 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 27DD0820C0D
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:24 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D0BF714042CE
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E131E1801925;
	Thu, 12 Mar 2026 10:53:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/64] python3-bumble: upgrade 0.0.225 -> 0.0.226
Date: Thu, 12 Mar 2026 18:51:43 +0800
Message-ID: <20260312105220.1856-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125127

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Bump bytes from 1.5.0 to 1.11.1 in /rust in the cargo group across 1 directory
- Connecting multiple times to a LE device is working correctly again
- Replace long if-else with match-case
- AVRCP: More delegation and bugfix
- Migrate most enums
- Remove bumble.gap
- Controller: Use new return parameter types and add _send_hci_command_status
- use tomllib from standard library on Python3.11+
- HFP: Fix response handling
- Emulation: Support LE Read features

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bumble_0.0.225.bb => python3-bumble_0.0.226.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bumble_0.0.225.bb => python3-bumble_0.0.226.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.225.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.226.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bumble_0.0.225.bb
rename to meta-python/recipes-devtools/python/python3-bumble_0.0.226.bb
index a5f5ffc020..d5cc66f74d 100644
--- a/meta-python/recipes-devtools/python/python3-bumble_0.0.225.bb
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.226.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/bumble"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
 
-SRC_URI[sha256sum] = "a69455e9b35a80e4b9ac555b749c9371039fd0a7aa88116bb3fea07204199ed8"
+SRC_URI[sha256sum] = "e96f62c282a7376ab56b2f799e232d0985a8965e049030c50a59c4ff0b10f592"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


