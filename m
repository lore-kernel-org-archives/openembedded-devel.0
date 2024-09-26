Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0359CCCF9E9
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 10:52:46 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.39880.1727347857952478488
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 03:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P5qjw7yx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: s-tokumoto@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727347858; x=1758883858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i2RWP9XUNElG/INvAv1QHPKu12Tb11lINjYmGFi+cm0=;
  b=P5qjw7yxuxuEXA8i7iFMH2uIEi2xKtESqjvy6fI9ZoxmdXLHN8bfMi4T
   9vUkIXLutx5YV55OAo+Ecmn0gWws1xE+MRVmLJpxXzv6HvDFgQzV8vwzB
   Dv4Uq/krNt3MNJSirpYaM3nDTAkZiu4dTdM5IRpeQgYVimFxEcXXeY42s
   BmSNGncApqhxSFdteROqXjAYEWTkEzKQwdlOj/E7RvtP6Dq2joxPZ1+sp
   akTyDQHjdbHW5457zdBp5xSx9XPSyTpYTUycGLiXlJDBFPe0F7k/a/Rwp
   aDq9ZeZBLCMXT3cX/T7frJkECSxZ3P/q32JEoiaf/ng9LMw5OrjVzN3S6
   Q==;
X-CSE-ConnectionGUID: 0fnbfiZ5R1q+4mfVK8rZtQ==
X-CSE-MsgGUID: fhHGXIo+QaGcWtLCxzqwzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="177016020"
X-IronPort-AV: E=Sophos;i="6.10,155,1719846000"; 
   d="scan'208";a="177016020"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 19:50:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 195C7D6EEE
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 19:50:53 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5018F10359
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 19:50:52 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1002)
	id 2C281D0E8; Thu, 26 Sep 2024 19:50:52 +0900 (JST)
From: "s-tokumoto" <s-tokumoto@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: s-tokumoto@fujitsu.com
Subject: [meta-oe][PATCH] capnproto: Add "capnp" to CVE_PRODUCT
Date: Thu, 26 Sep 2024 19:50:49 +0900
Message-Id: <20240926105049.29870-1-s-tokumoto@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 10:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112518

Vulnerabilities against capnproto are sometimes reported as "capnp",
so add "capnp" to CVE_PRODUCT.

https://nvd.nist.gov/vuln/detail/CVE-2022-46149

Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
index cb4aef522..daeeb975f 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}/git/c++"
 
 inherit cmake
 
+CVE_PRODUCT = "capnproto capnp"
+
 CXXFLAGS:append:mips = " -latomic"
 CXXFLAGS:append:powerpc = " -latomic"
 CXXFLAGS:append:riscv32 = " -latomic"
-- 
2.35.3


