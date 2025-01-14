Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED8BC02189
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:12 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.40064.1736843346670641287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OiiT+nbc;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843345; x=1768379345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XhKFy2rPvBcMiLKxWBDX3+UAYPf3Pgk0w5yl6l7irP4=;
  b=OiiT+nbcc54dhI793Akjk5pYGtjFZK1yUnrfrctCzykv7P1vxQI1Kuiz
   1oqcjMeMno1LNbVPLTSxrQ7Lk4IGcZ7gCii/KxLmyFGJuACKsdPutmKwV
   8irTvIvI3y5NlzQxlwX8YRLqxbz4Qn1xJ5cmW0tyE+v4DHj8Tum9PbeUx
   ltTvRDYzKohb/yGblrSRJvjFyw5ebP1YFzoBFrFHzL53cZvFE6xb1t1hS
   IKlJBxsnrssmwn9D3gnRAgLKxV/Kh4np0K2RaURHMDkJt7u++W5NH+Rmh
   twV0+KNXznrWxaXmAP/QIMCwyjm0JHfLB7ivCSQRRL5+sbKx763zpAZMn
   w==;
X-CSE-ConnectionGUID: 8ZCcEXiFQWmR0P7ytp+x6w==
X-CSE-MsgGUID: oAgBO/H4RJKrFlfaQcmsSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="174843744"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="174843744"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:02 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 67536D4812
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F860D4BC3
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C3B3C6B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 70BFC1A000B;
	Tue, 14 Jan 2025 16:29:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/30] libconfig-general-perl: upgrade 2.65 -> 2.67
Date: Tue, 14 Jan 2025 16:28:27 +0800
Message-Id: <1736843329-4131-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--1.461000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvPk6Qbi+9i6DwzK
	NF0GZctoA6C7KneFwLo76EG8K9nMWGJZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsNBDEhtWUzwVr78SC5iivxwURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrVROfgIYHC6Bhskp4+0FLEc+8q8qsLKxyLiffpQbMEy48mppRCRlQ5ZkG3pBSpXQw1GRI
	44Je3KARkcySlfSA+2Dq0VjPkQpzR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114852

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fixing tests (add missing file to dist tarball)
- created gitignore file.
- add support to quote values containing whitespace using the
  new flag -AlwaysQuoteOutput.
- fix exporter setup, use "our" where appropriate.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nfig-general-perl_2.65.bb => libconfig-general-perl_2.67.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{libconfig-general-perl_2.65.bb => libconfig-general-perl_2.67.bb} (87%)

diff --git a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
similarity index 87%
rename from meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb
rename to meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
index b2266394d6..9171cbc89c 100644
--- a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb
+++ b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.67.bb
@@ -8,7 +8,7 @@ SRCNAME = "Config-General"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "4d6d5754be3a9f30906836f0cc10e554c8832e14e7a1341efb15b05d706fc58f"
+SRC_URI[sha256sum] = "473d65127b23dac0e8039c01e28bc4072cb9a6e93e81a1ea4893cea08c698db0"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.43.0


