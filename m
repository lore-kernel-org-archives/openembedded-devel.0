Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA70C5320C
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2885.1722934018508117382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rn6I1Mrf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934021; x=1754470021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=x023W1qmaMCKlIBfjdPkmiRgCEgGN0Ss4COBkwQ6okI=;
  b=Rn6I1Mrf5/9dnfPQ1MRVBt9LviIgtp69C/3V8cFDQDSHkJzOVnBgrt9k
   9EYSE/kd5brhNVcwiBZ7DAn2cnaRIq+tdCWmc2iYbeCI1mZc64A6m/Q9a
   kYGuIrX/2pwVbKzaDYlm5VUlZvtvfCnWzXDDiXFOiVIhEJn/kaWt6vjzT
   HsY8Y6HYZvj9oYaRWy7ptCjqNwuR7dTXW1EQzlvwLkRSTciKkjeTiBQ97
   eJkn+d61efAKkSCC5DzRvfXPDS4alBB+jgmnCg+/tRnPk4YFd4KbtIVYV
   8KJcyhBFEv6A8vSagPehOOS5kysTNZdy6IP0a8b+CKxnQ3uq9nfa8ZbKf
   Q==;
X-CSE-ConnectionGUID: MuCoODImQIytAdX4pyJgaA==
X-CSE-MsgGUID: M3MWksrmTealMt75b40Cjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157332583"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157332583"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:59 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 438F8D424D
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 94AE9D7465
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B44720050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B90391A0002;
	Tue,  6 Aug 2024 16:46:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 29/60] opentelemetry-cpp: upgrade 1.16.0 -> 1.16.1
Date: Tue,  6 Aug 2024 16:46:03 +0800
Message-Id: <1722933994-32549-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.365400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Zdp7mmIaF6MeC7C2rJeUToT+nYpRHtFlTo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJb7btDAWDhTLuwMRlzOfTuK2zEeVTr/l/YPw
	h+6+6uYH1/s+KaUhbadXs3BodufFykAOWOME6DmwJ6fDUt5ZckDN6wEtjbW+H+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111549

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{opentelemetry-cpp_1.16.0.bb => opentelemetry-cpp_1.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opentelemetry/{opentelemetry-cpp_1.16.0.bb => opentelemetry-cpp_1.16.1.bb} (95%)

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
similarity index 95%
rename from meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.0.bb
rename to meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
index f559295db..a52e7aef6 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.0.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 DEPENDS = "nlohmann-json"
 
 SRC_URI = "git://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main;"
-SRCREV = "fd57e7aa23ffc352f62e504f34fd1c6b7b2ecac3"
+SRCREV = "baecbb95bd63df53e0af16e87bc683967962c5f8"
 
 S = "${WORKDIR}/git"
 inherit cmake pkgconfig lib_package
-- 
2.34.1


