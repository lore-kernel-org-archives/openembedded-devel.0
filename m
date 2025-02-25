Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18589C282C9
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2206.1740525900980157654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M5mIWMse;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525902; x=1772061902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xcEeHEzhx6T9OWIGDESoWfE411BYT1XwTEGYto5Kfq0=;
  b=M5mIWMse8vXwg2XuoN42VGBYmOakwyhmZNFbbUKbS+pimXNTBMt5QVoJ
   vg70lQN1m5U9eVeVnw1KqtSz5oUktMZ4MW15DP6kxg+ef/eHx/IjcMo0t
   3+UcjLPyDM/tmbufwYGD/1RDCVsUVF8MjKN3G00/nhmGfe7h0IIJqPjgv
   HjJRr5q0RBq5RfNCkPDFVBknYEOWUhu/dmCbL+CfrSS+w0BnDw9QBUQkV
   78m9DacZHQ9SH5T8hOJY9pEfQj3LTQtSqc8PVktyxg+CL/mS8b4QdMR8Q
   sRK8OxINgGodyi2+lVBM2KcIW6KVh7H6hRjZTMwsfgbj7uyr3WHh6NGzU
   Q==;
X-CSE-ConnectionGUID: dugX0MCIRfKnwz72jz0Asw==
X-CSE-MsgGUID: C20ftIa2TbimdbNPXWx88Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191419387"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191419387"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 188E2D6EA7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D527BC8BF7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 993D11A0073;
	Wed, 26 Feb 2025 07:24:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/51] python3-jsbeautifier: upgrade 1.15.1 -> 1.15.3
Date: Wed, 26 Feb 2025 07:24:23 +0800
Message-Id: <1740525881-21103-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115630

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-jsbeautifier_1.15.1.bb => python3-jsbeautifier_1.15.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsbeautifier_1.15.1.bb => python3-jsbeautifier_1.15.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb
rename to meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.3.bb
index 8390a8f78a..f3c568a96b 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ebd733b560704c602d744eafc839db60a1ee9326e30a2a80c4adb8718adc1b24"
+SRC_URI[sha256sum] = "5f1baf3d4ca6a615bb5417ee861b34b77609eeb12875555f8bbfabd9bf2f3457"
 
 PYPI_PACKAGE = "jsbeautifier"
 
-- 
2.43.0


