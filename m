Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CF1C7113E
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.78443.1749526438015429840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L0iyBsMV;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526438; x=1781062438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RUYtbB4c07uKef/SyxUVvpOhZjdVv+qGWbLU16ishHY=;
  b=L0iyBsMVaTqkfiUubobUN636StgobuyaQOtBwgFzaGMy7I5cKpf40NvQ
   2JueqLxvtKF/xbBwQ/1ZecaP/OmB15kUt9TfNUdAFEJndIEu6kCAXC7yp
   Xun2XiPW1b/ORKJYkAwb2s0WGcBORKoT19/TwK1eLASJohRH3ubIoxkh2
   KYPlfYHrY7PguHhvGc0CuvrYCeTXbKR3VGHLsO42zuzxCy5HGOaOVMzAC
   3eZxE42/p4yloN1C3ESo7Khxb3VnduyjmJvz2tj5ThQCJlC4ocShgtSOW
   NAB+e18fxbTz+1QIz73nfev+OSqqweA3SrHRmBEZJG7aBoXONCUR9A+D1
   Q==;
X-CSE-ConnectionGUID: Bh8a2VmzRBuJWDkRraGh/A==
X-CSE-MsgGUID: 3bsMaxlTQ1mNhELZco1Hvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181135337"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181135337"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA04DD5004
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 535CBD5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:53 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CC3631A009A;
	Tue, 10 Jun 2025 11:33:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/64] python3-thrift: upgrade 0.21.0 -> 0.22.0
Date: Tue, 10 Jun 2025 11:33:18 +0800
Message-ID: <20250610033330.924-52-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117844

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-thrift_0.21.0.bb => python3-thrift_0.22.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-thrift/{python3-thrift_0.21.0.bb => python3-thrift_0.22.0.bb} (85%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.21.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.22.0.bb
similarity index 85%
rename from meta-python/recipes-connectivity/python-thrift/python3-thrift_0.21.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python3-thrift_0.22.0.bb
index 6a22f2170d..2dba3d48a6 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.21.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.22.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
-SRC_URI[sha256sum] = "5e6f7c50f936ebfa23e924229afc95eb219f8c8e5a83202dd4a391244803e402"
+SRC_URI[sha256sum] = "42e8276afbd5f54fe1d364858b6877bc5e5a4a5ed69f6a005b94ca4918fe1466"
 
 inherit pypi setuptools3
 
-- 
2.43.0


