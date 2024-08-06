Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A066FC54740
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.2883.1722934017677000776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WHNl34hN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934019; x=1754470019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vA+hFBzuCXUikJESXVcwkAjYyjoUsCr2sVzLM0yqH6c=;
  b=WHNl34hNWoRssyqBoT5lXzYlWDod+LAvY5NzjQrJAoDk/3avKCKHfFGm
   DnmZ6uX9GuaaULuBwQyLs0EXH0uW0wmGjXCfu81AHHHokYQKnyfbUaYhg
   cRmO3EpzAnoW4utLYf50zz7wTGjz+F2PcbBKUt/eI+2ZHnRT0WiqymgT1
   udMBClVdaWQCIMjPUAbRaCqckislDlzmbmk9CWghHVRv0YyIpAfPvdhBb
   Ktp/k0qi7pKpWdTp1XLh0MqT21aKK18Q9o9DuQLwVVwjq8on9snq+NEFB
   TlLhQpWWA8nKtNVP1MeCKI0lLDNbSpN7DlXjZIwdrGOxwXDbdRhTC7Cmr
   A==;
X-CSE-ConnectionGUID: TV1q4mBVTcqSzWoZ5a2Csw==
X-CSE-MsgGUID: CLZC/xfATDmt1ImOCnWong==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169165581"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169165581"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:58 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 42500C3F94
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 841E4D50E2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 184DD20076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B98021A0002;
	Tue,  6 Aug 2024 16:46:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 20/60] libtdb: upgrade 1.4.10 -> 1.4.11
Date: Tue,  6 Aug 2024 16:45:54 +0800
Message-Id: <1722933994-32549-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--0.225100-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGPvwmMFLImuhngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDWkA4sIz3PejDEpRn1DT9wbJVaoGiJ8wILyaT2dDoxy3TOa7w/pryCH886TyV/t8Wh/0t
	bgp0umLlqaIyTQaun2lwP9msmbRbTyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111535

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtdb/{libtdb_1.4.10.bb => libtdb_1.4.11.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.10.bb => libtdb_1.4.11.bb} (96%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.11.bb
similarity index 96%
rename from meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.4.11.bb
index bd3f9f63a..091d7977c 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.11.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "02338e33c16c21c9e29571cef523e76b2b708636254f6f30c6cf195d48c62daf"
+SRC_URI[sha256sum] = "4e8ba6d93f383565bbd061be4deee15318232d1bbcca7212f18e17f56bb975a8"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
-- 
2.34.1


