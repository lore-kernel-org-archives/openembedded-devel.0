Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470ECC54731
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2885.1722934018508117382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J+FNc6SU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PPaCbnGHxMU8XyDFD3HOX10dk38us/2biA4LmMG1uYQ=;
  b=J+FNc6SUo3cYUKiMrvSebb8uhVuYs26QsMQPUA8vt7POB4GoZNc+iHiK
   zP7aFdirh/T6CUxobuB0VxHh2yTChOsHYOzlcY5EGpDeWpArBX3+xYX6t
   olbdwuvoxZBFcn/uOLAgMW61M1qh4CnfTToj9PrZ4vEsOHBkmaxnuBqu/
   XtN3cL5YgQT8ZoEx3S7fKaXy4WCXcmpFKs3TJ6HZlWO1WjTsN8VDVMIh+
   AkNk+JL7/A7s1VxOpdeVFoTo0Pq8SdyvI9uWgkL5bd5LDLWRsBn5M/fst
   Ztx4lkEfwnQ+VzuCP8eKmyF8NFd+bcPJ7qbq4OZFaxuAQxl14QqaXlerA
   g==;
X-CSE-ConnectionGUID: Hzp5o7ZYSBeIJwfP6W76nw==
X-CSE-MsgGUID: Ix3wlWWURCKBPfnpZ0nRuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157332573"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157332573"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FCDECC15D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7565AD8AFE
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 15E4F20076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D4D631A006B;
	Tue,  6 Aug 2024 16:46:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/60] libnvme: upgrade 1.9 -> 1.10
Date: Tue,  6 Aug 2024 16:45:50 +0800
Message-Id: <1722933994-32549-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8Krf4bv+4blQQ9DXx9G53LbK0DZ6RUWzIOdg6LoRe+mKSF5UMuklYfrXsgB1
	Anfs4523ac+I7kLRiclhsBlVTxewq+505fgZwjhx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111534

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/libnvme/{libnvme_1.9.bb => libnvme_1.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.9.bb => libnvme_1.10.bb} (94%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.9.bb b/meta-oe/recipes-support/libnvme/libnvme_1.10.bb
similarity index 94%
rename from meta-oe/recipes-support/libnvme/libnvme_1.9.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.10.bb
index 1e03b4e7a..a05d1168e 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.9.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "80c5cf2aa45f4afc7571dc48850fae3fd62828af"
+SRCREV = "dd51fa8550564c93436423a4d8ed4be92ae50290"
 
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
-- 
2.34.1


