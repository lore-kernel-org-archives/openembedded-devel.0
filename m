Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7658D10A1E9E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:23 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46417.1774526242685511781
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BmfD7kRg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526243; x=1806062243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7zGW4cJkRqM4JuvHHzx1hlQDugksutCMFvY3aCOAoig=;
  b=BmfD7kRgbcXP2Qx5ykekAHS4r+DbxgCEknjHL+S/HNCblTqOjbES9dVI
   w0hUFEx5fHd6+s6aKGc/LaE3oaUxjta534UqMCpad7yvzaq7xJj5z4dIE
   1PDNWiSnZD6M6Lc3EHQLeefhNJgnJ68DQA8KZGXuAVh3ABCiZzDG3UEwO
   GnlUTw/o4JLrqN3Z/vcKpdI14301fuETC8MbmTd3NZeZCiv1EF5YaJ+EY
   Twukou3P5KZrcjBfBtxi7d2bL315vk/5Q0mvwnnl74bFiMGpvRh6bRFID
   jnf5g9N04XCEnEOXdsv2fx9BrWjxFktlGusGRr1mcubpIWuLifn8WSPbu
   w==;
X-CSE-ConnectionGUID: 7aUiYX1BSmGBDGa4FmEDow==
X-CSE-MsgGUID: GWWDrrd8QlaYO/JRCp40tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234718855"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234718855"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:21 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 25BE41C166CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:21 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D484A14003CF
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 78CBC1807148;
	Thu, 26 Mar 2026 11:57:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/63] python3-aenum: upgrade 3.1.16 -> 3.1.17
Date: Thu, 26 Mar 2026 19:55:55 +0800
Message-ID: <20260326115634.1199-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125680

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-aenum_3.1.16.bb => python3-aenum_3.1.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.16.bb => python3-aenum_3.1.17.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.16.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.17.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.16.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.17.bb
index feeee18e34..b6c292c268 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.16.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "bfaf9589bdb418ee3a986d85750c7318d9d2839c1b1a1d6fe8fc53ec201cf140"
+SRC_URI[sha256sum] = "a969a4516b194895de72c875ece355f17c0d272146f7fda346ef74f93cf4d5ba"
 
 inherit pypi setuptools3
 
-- 
2.43.0


