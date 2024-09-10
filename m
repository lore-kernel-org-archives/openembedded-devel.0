Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2629DEDE9A2
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.18331.1725959004373178377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PDzgwNSS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959005; x=1757495005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f4PPORnkFGApjhJAGMEb7uU6hfMmZ3SpZVFzoDMLNd4=;
  b=PDzgwNSSYrlVy24g+byYqSpr7fc39pEhKeocQf8C9WLJI0MqRP1SUS6T
   Ip39gniCRkMybOVXttgjL6rMmkAlLMZSxy3jKvj1zzOePg/lij6wqJiPL
   xyE7U51Qj67xYphUN0f6zol+ocmUTx8pY6S+QBjtk0+csRAOHpEcAcOjv
   xG7t6K5abDuN1oz3Uz18yYG9hYihwyqfbvCmCu+br38JI3HlWe2kJ9Dkv
   gvqKGRoLDafL0elhjjUJD2NUIwrcQ1IDgYNjjQCRI2KLjIKhmy5GrcL6U
   4jQsGoCQustz7XHD00Clq5eayS44LM6xotdJYz/Q1OcRdMOGrElYFbCSg
   A==;
X-CSE-ConnectionGUID: Zq2jbgfATfWIwYN1pXHA7g==
X-CSE-MsgGUID: iL6u9bbtTP6m30+hTPxJHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173214173"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173214173"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:24 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F148716B909
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F62FD3F0F
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C24626BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7526A1A000B;
	Tue, 10 Sep 2024 17:03:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 08/42] libcompress-raw-bzip2-perl: upgrade 2.212 -> 2.213
Date: Tue, 10 Sep 2024 17:02:36 +0800
Message-Id: <1725958990-5719-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.427800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy+WtdtaO3wUEOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8Krf7pZzd/Q1U9DZ3cSNCiaoL+H1XMX6K2WSJ327TmEmutsSx03JtDaltcfn
	BU9yXnrxB0RGyNB0mgNmieidX9/xl323AaSlY4Oh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112194

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-bzip2-perl_2.212.bb => libcompress-raw-bzip2-perl_2.213.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-bzip2-perl_2.212.bb => libcompress-raw-bzip2-perl_2.213.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.212.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.212.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
index 712073041..63706d8f7 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.212.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.213.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=cd551ef796cc7fa3435
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "6caeee843c428f45fa9646ea98dc675470db63dbac0ee3e2d8e9ee4eb58a856d"
+SRC_URI[sha256sum] = "8d75d3d366c9101ca18061b00d438d3da39478c06159147dea3c666770577c7b"
 
 DEPENDS += "bzip2"
 
-- 
2.34.1


