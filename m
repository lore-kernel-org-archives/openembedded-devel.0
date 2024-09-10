Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9709DECE582
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.18595.1725959009457886496
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RJSNLRO/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959009; x=1757495009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tT3KFjVBfIy+Wv5Ps1Bc2zMuVA9sHd/edT0qjZHKUNo=;
  b=RJSNLRO/BRUzeeDWsnZX5iIiQ6G2clRM2d4ok1SCe58jvkQO845TVAsr
   +HT6XbsONq2xf9jc4Ypf5I6rEhSUjp46vhjhh2lsBW2OHTDotekRVoHxa
   A08BMYoWHZbl++OVGcmA/yxiiDCSGZr2+OnZ0n844W32wo243HDO8RNMH
   7hnWzqCO5CMVXv7io3/YzToGuyFkFOgeiaZexfDA8WfL8vzMjeUKbRDH5
   Bq05J7JmfnWoA2cup9HiCMebjAlHuXCKjtyCK/utscJY20QHBRqI+vZZU
   6LA60ojQYq9PW14gB9mlYmLgUQHf6OrXvcO9d1d852vcL3ZZgRhoAYjuj
   Q==;
X-CSE-ConnectionGUID: zABm/v7WS+mtHcKRrTV6MA==
X-CSE-MsgGUID: zYEOCKxgTqa8mdtDGXhUyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152237303"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152237303"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A0647DB3C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E371910283
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70CD46BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 246371A01E9;
	Tue, 10 Sep 2024 17:03:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/42] nano: upgrade 8.1 -> 8.2
Date: Tue, 10 Sep 2024 17:02:44 +0800
Message-Id: <1725958990-5719-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-5.291400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrbGOU4q4GiaAkt9BigJAcViRG
	4HmxKEplYjLHbepDqHDGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat05499RlPzeVuQQNBd
	ORIzcI4YOd31b2++g2+zQOv59zBlnIly/lfs5uYmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNX/D98W5l1jxaNsHHY2u3s4EDBkyuiYU5MSmoayfIj9Wv8Ilfelbt4ggz11MWK4mwXaHK
	kWKtWrnFwySpMk9rIGPA7SnQhAXdQkrYwrjkf4Y
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112203

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- At a Yes-No prompt, beside Y and the localized initial for "Yes",
  also ^Y is accepted.  Similarly, ^N for "No", and ^A for "All".
- A text-highlighting bug with Alt+Home/Alt+End is fixed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_8.1.bb => nano_8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.1.bb => nano_8.2.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_8.1.bb b/meta-oe/recipes-support/nano/nano_8.2.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_8.1.bb
rename to meta-oe/recipes-support/nano/nano_8.2.bb
index b060da3ff..46e5a15c1 100644
--- a/meta-oe/recipes-support/nano/nano_8.1.bb
+++ b/meta-oe/recipes-support/nano/nano_8.2.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "93b3e3e9155ae389fe9ccf9cb7ab380eac29602835ba3077b22f64d0f0cbe8cb"
+SRC_URI[sha256sum] = "d5ad07dd862facae03051c54c6535e54c7ed7407318783fcad1ad2d7076fffeb"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.34.1


