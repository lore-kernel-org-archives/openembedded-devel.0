Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764B2C5478C
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.9330.1708419295801558947
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IZkUZrSv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419296; x=1739955296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HEonyn5ZlxDijSFb/3o5pIsoEPNRl75SakDzBlzKK+A=;
  b=IZkUZrSvPCY6d8E+ToSP5Ikr7Apx+EKKIWZoO4pbtpxdtzGjhLjJ8t0k
   loHJv7FIXCPPyOqidrocx4InYD4XVWZSfhDxBfRriwQub4TRFtZzs3OBr
   Dd5K30X2J+GNaBLtclCIwCVtt4PknuS1/1WgB2l4VOzR6runsTh0gb9Qd
   79zJfc8yPhTjArNx66dgOq/cECxl9+afCjIh5+uhTNH2sEUISwQGAj7E3
   pVj7DXBXuZcrK8RZcBUoaXuqD6vo9tPdatvgNDLEkNUr1bpWWcQAGYfUw
   kn/EVo+VTzjPfZVZF7H/34fV+g1iG583J6Src9XLQvXfEpVScWmLkgwMG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149872554"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149872554"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:53 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 31EF633CDC
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 63B88D52EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 050936C9D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A49E81A006B;
	Tue, 20 Feb 2024 16:54:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/26] protobuf: upgrade 4.25.2 -> 4.25.3
Date: Tue, 20 Feb 2024 16:54:18 +0800
Message-Id: <1708419281-26047-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--6.813800-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7+6BUPBkQtT69v9
	Yxcv46SLRRa406V/YwwwoTZ9+IItgMRBLZ5x+SkXP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFaU++uOchPRloMLOoNHsM9rSgyqRj33XJwSC6qIZ5nkmjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0Q7AFczfjr/7GsNFadrOXii0NtkwRv7aDkKlkYOuPKcZNQHL
	Cc/xsEJRtikKGOd/o0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108923

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Remove use of mach_absolute_time
[ObjC] Use a local to avoid warnings in 32bit builds.
Bump python version to 3.9 for gcloud 460.0.0
Update Ruby GHA to test against Ruby 3.3.
Pin bundler version to 2.4.22 for Ruby 2.7 support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../protobuf/{protobuf_4.25.2.bb => protobuf_4.25.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.2.bb => protobuf_4.25.3.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.2.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.2.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
index 6cd44a4e7..324134596 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.2.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib abseil-cpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "a9b006bddd52e289029f16aa77b77e8e0033d9ee"
+SRCREV = "4a2aef570deb2bfb8927426558701e8bfc26f2a4"
 
 SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
            file://run-ptest \
-- 
2.34.1


