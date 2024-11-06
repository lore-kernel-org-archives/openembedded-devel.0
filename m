Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077B7D29F8E
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.40138.1730874689706286588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rPcaEXca;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874690; x=1762410690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NCrWbkKwsBx7RL6wpBxVoH+ZUyDuw6gn3sN+k2xlrlc=;
  b=rPcaEXcarTfmcrHa1g9WhujYydKJUukhShpf696Qp/SXYYVtMNNPUuHp
   ZnCT3wmw0nRi+ZBqrAFrcp1+Hv3IdiIf+vWI4ItBykojMWiB/ssYhC/Kx
   gJYr4aPUC75DcXChhTnIcnRHGWk5VI/iKjGpcmzvZI9CznDeoIUULv+MS
   DerEYYVcm1//0LUGx50gB7T42CLY9Ku4u8fgoKzHQxRa+/DBL+yoDC80p
   l50xb/JG2IpVog0sYjMWp9uvdFa9R7q4nSF/NMcXDBmMQ4d/8NWFPjwqU
   gTM7wVYLdmQAiuKcPghetqRA8MoKdlTYAA0zbIBUn3AT7vU7YE1EEHN5O
   g==;
X-CSE-ConnectionGUID: PnaXcLryQSy+YOI8KfVe3g==
X-CSE-MsgGUID: mCmjXy+qQ1KKjRz8FNDO3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179274386"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179274386"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:28 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A013BC6845
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E7412236A6
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A2966BA6D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 297A51A000A;
	Wed,  6 Nov 2024 14:31:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/46] python3-pychromecast: upgrade 14.0.4 -> 14.0.5
Date: Wed,  6 Nov 2024 14:30:46 +0800
Message-Id: <1730874660-2364-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--0.838500-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZjoyKzEmtrEcL//VMxXlyE/GmNQuSBG+Fo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJW3V5BHYchYYc1Nc9qpVu5XvxLPMxtizdFwA
	Z6mEpFUz6LP94U/vSxtctRXbd1AqYtk5/0BjI4oUtVxgXgMtOLFp2ilcIcciX+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113715

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_14.0.4.bb => python3-pychromecast_14.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.4.bb => python3-pychromecast_14.0.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.4.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb
index 6f06f53a1..5deb5e92f 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
 SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
-SRC_URI[sha256sum] = "1fc05d63db152fe6f71efdee77d14228dc4c55e99d734de4757455800b1f3ba4"
+SRC_URI[sha256sum] = "a8671ee4ea4a7095e2e0670e2215145ec1e3e0aa0737ff74d648ae4dc268b2b1"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.34.1


