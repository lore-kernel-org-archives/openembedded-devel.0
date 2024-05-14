Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89214C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:40 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.10750.1715677830448233513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nlxDjGAs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677831; x=1747213831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VcL9beU8ahd1dFtf9vtqZuXLoFb3jk9gPA0bGI9mMww=;
  b=nlxDjGAsOWR1xyQ5snGg/eYytJfBlhi3neR+ELTl++R5YzWSg+RbfhzF
   MtyF4KT6r979sCSdnfnJYkgnOI92gtXA4iL4q/wSns072FYgHHcA/NAqy
   EcKZ1EIlfxbxU9iPwOxsm7rgNY7uyWBNAsK4fvoa0yStKYf6clWeLxRWu
   m+jkMaWnwU1DgNh0pOzxFCyDbbEYH4DMP7lLGZqxmDhpBAMYuSktyETUQ
   PHRn7SglrWxlHuveMUSAJ+9Gxi5D6bzxxkzW4KKK8oBFVLTR1QN67U2xb
   mZjpgHNBNz4ZWAdS61HJI2Zix5tXKBpkMpxGToGE9x0vdrfubOWSmXbM3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="158143124"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="158143124"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:28 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AE67EDC14E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DD0A5D9469
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 68E7270BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 169D91A000B;
	Tue, 14 May 2024 17:10:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/44] libbpf: upgrade 1.4.0 -> 1.4.2
Date: Tue, 14 May 2024 17:09:37 +0800
Message-Id: <1715677817-2223-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--3.298000-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7+1ZeIgEYZihp/b
	umQx78u3XSUTHwU7DvjPvYbB7cp8R3zl0x7mtvufMB2m5K0KuIlUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmmb0vbxK6KD+LFSIkwwwvT7L/tBTZzO5Q25x7uAXGEprZiQDIJsDspXsp5O052MzLomJd
	JlMmu463GITP0bwYEQLmth8cTQ473lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07UXA0
	ioI+iBtczUKGRfVtup3Vf+HXISAX/JC3QU7/ku0KLr3jTPZkO2bCGcoiY40gPrnnxxzfmiTvOig
	cKV0TQ0d99JBtCE5fXtVr9Q6tQbn8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110351

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- remove unnecessary struct_ops prog validity check
- handle yet another corner case of nulling out struct_ops program
- fix libbpf_strerror_r() handling unknown errors
- libbpf: improve early detection of doomed-to-fail BPF program loading

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbpf/{libbpf_1.4.0.bb => libbpf_1.4.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.0.bb => libbpf_1.4.2.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.0.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
index f2ec48f39..928482ba3 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
-SRCREV = "20ea95b4505c477af3b6ff6ce9d19cee868ddc5d"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.2"
+SRCREV = "1b357586a7a62db7fe27af4ebe4bdefe6986cfd6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
-- 
2.34.1


