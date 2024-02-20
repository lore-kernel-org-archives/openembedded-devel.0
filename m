Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC1EC48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9329.1708419294905917806
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZU217pnI;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419294; x=1739955294;
  h=from:to:cc:subject:date:message-id;
  bh=Q3iR9onSFYDRMVm/b/iJC1Zw0kYG7THypBnhtTMMT8g=;
  b=ZU217pnIDWHfseIv6xMy5I1Z9Oq9BOT+9lr35AgBi0aqv7N4czicVuYM
   sLard92FjhFO4CtNU/J3xBLCE+8ieuSEtO5fVMt3TdUtOJjAtz3QwpMNt
   2s8Gs3lrzjIsiHNa1z6ttIQ+T9CQHm5d4Xob5EZsK8bH2numta15mfzo8
   WjtRZYoiSBitmwvrhyfLFnG48kxL8FBcGdssyaSSMdbkoFmCFghYdlMV5
   7OLp1zIs2lMTLLUJ4Ndif4wERQ+jv0chGtIAfTUXIEKQvDYJTJrscdywc
   gTqSzvRzGzDIvU/LnKla+RIcPR4eoGInuX9NrBjHGFOgpL/e3KIs9YH/h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="129189746"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="129189746"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C529F2566
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 23494D3F62
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DB986C9D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1D75F1A006B;
	Tue, 20 Feb 2024 16:54:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 01/26] unbound: upgrade 1.19.0 -> 1.19.1
Date: Tue, 20 Feb 2024 16:54:16 +0800
Message-Id: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-0.884400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX3FXmAqsdcFcuce7gFxhKa2YkAyCbA7KV6B5jk2TXXjFlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzsEHuXGSIcAFOdE
	yOb9vVe9uxDeEoba0LszhZPpgxFhhhbTLxEJMdvWkbSTjYRCopzQvsiJS+e1KmvCGnlDHdmVYb7
	Ra5m3m8iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108921

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.19.0.bb => unbound_1.19.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.19.0.bb => unbound_1.19.1.bb} (95%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.0.bb b/meta-networking/recipes-support/unbound/unbound_1.19.1.bb
similarity index 95%
rename from meta-networking/recipes-support/unbound/unbound_1.19.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.19.1.bb
index ed8c5bd97..2b87de3d1 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.1.bb
@@ -9,8 +9,8 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master"
-SRCREV = "3352b1090ea1098883f6bf64236fa877e18e458b"
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.1"
+SRCREV = "c6dd1e116df75242a0c032295c152f06c721b3cd"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.34.1


