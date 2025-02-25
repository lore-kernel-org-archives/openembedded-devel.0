Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1420C1B0D9
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2203.1740525898314938418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jPNYTV8H;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525898; x=1772061898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TYkz/esqA0AgZan5awhtvphDlFNSrcNJSXjxhHKcJWY=;
  b=jPNYTV8HKBE0LdvsPkQRB+Srtn4adnvuid8gtuMhcOlx4/vVLQSGXlQj
   tvfx9o8lsEnraUL/1P9ajaGRMFEQ4JSLTHv6lFaE1JMkRqJryyqJ5MJta
   NEeSR2hsstFUqH+U1K6La63g2b7R2Nt5ZnqZ7htON6h+tJSBCo2LQM7GO
   q+jxj0gan6zTMfahx6XpvLY9srC7PPcrOV2Io6aGE9hVZJMfSEz8pNiUg
   abnwmLv8i+1QYWHecbjJ2UEy5EPZM1eJI9dN6uyn1BeOYR1A30mR3/hwO
   BV1Pyrr7GzXOcUXtU3bZ/A4CMgLEbrsQRVQpfH17BG7tgmYFnzkXkqxzV
   g==;
X-CSE-ConnectionGUID: hYjWQw1GSTaQL1y/ddshTA==
X-CSE-MsgGUID: 6tptcFQDRuGgLB75khzUfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179142874"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179142874"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 54C78DBB8F
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C517D8B3F
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D7FDA1A000B;
	Wed, 26 Feb 2025 07:24:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/51] jsoncons: upgrade 1.1.0 -> 1.2.0
Date: Wed, 26 Feb 2025 07:24:02 +0800
Message-Id: <1740525881-21103-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115609

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- jsonpath length function with recursive select argument gives wrong result
- Support nested JSON to CSV. Add flat, column_mapping, and max_nesting_depth options to basic_csv_options
- Add raw_tag() accessor to basic_cbor_cursor. Add functions begin_object_with_tag,
  begin_array_with_tag, uint64_value_with_tag etc. to basic_cbor_encoder to support encoding values with
  raw CBOR tags.
- Support custom JSON Schema error messages with errorMessage keyword. Add
  enable_custom_error_message option to evaluation_options.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.1.0.bb => jsoncons_1.2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.1.0.bb => jsoncons_1.2.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.1.0.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.2.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.1.0.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.2.0.bb
index bafbbd2042..9e43d42051 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.1.0.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.2.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master"
-SRCREV = "eee098be8f774f64527281d5beb9e90aa9b73e06"
+SRCREV = "072d106130fd5d89a405a78b6b0e4f2efc45010d"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


