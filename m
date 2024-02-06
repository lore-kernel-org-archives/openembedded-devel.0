Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE72C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:31:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.16775.1707204670354529044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Bq2ORM4l;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707204670; x=1738740670;
  h=from:to:cc:subject:date:message-id;
  bh=8nVCzBzpVv51YUBTI/Sz9of8EHIhgmJ9qE9LkZyr+Ks=;
  b=Bq2ORM4laME01mLKE/S9Kej7UcOu75MBJ6T8ZxhsqzEjV1qFEBHCl24I
   uBFCgokp/pYw7uTPgFqx4t78BiVpMk/AtERY8Dl3Ym7hoXQipVPVA5blT
   rr9YdWyHcLNI/vPMvFtUq2VC6SCBqNEDTa0nUToF0TZUbesMa0Kh9FI+5
   P7eiYTwCsHsRhgwtm620+gsvYxbsZPhMGc1X4R6g7rK/c/YMuTZ2wjmbK
   NG4y4UnnmWKA1u7FRlTKPPAKrVznCOdUb0ZmgwVzqRJwrG9TCCNzkdHv1
   aGOiq8F5K2I73pZwDOvzjnVMJjHtaoUbEpIeXfwMBiN/pyCa8h9sajBQw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="136981163"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="136981163"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:31:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B50C527A7AA
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:31:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F005FCFBB4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:31:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 84E8B200936AC
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:31:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3CC7A1A006A;
	Tue,  6 Feb 2024 15:31:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] neatvnc: upgrade 0.7.1 -> 0.7.2
Date: Tue,  6 Feb 2024 15:27:58 +0800
Message-Id: <1707204478-4712-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-0.700800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr9v33UW8WNYA8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah9bJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5iwd
	G5UC0hXd5lcjFHyc+/OR+gebXCmqe+DZDFAoV0pQhNLdsTJQJqLJ77cpRySoHBrcciQ0NPXKwxV
	Au0Umi+ZJbbwfcJWRaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108598

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Clients are now allowed to request more than 32 encodings (#108)
-Zlib streams are now preserved when a client switches between encodings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../neatvnc/{neatvnc_0.7.1.bb => neatvnc_0.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.7.1.bb => neatvnc_0.7.2.bb} (95%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.1.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.2.bb
similarity index 95%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.1.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.2.bb
index 99e63318a..152409de1 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.1.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
 SRC_URI = "git://github.com/any1/neatvnc;branch=v0.7;protocol=https"
 
-SRCREV = "b5b330b22c6a0fdeb718a9e7ee0732cc406863fa"
+SRCREV = "14619e6281136a02e376ad23e3cfaedc8de00ffb"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


