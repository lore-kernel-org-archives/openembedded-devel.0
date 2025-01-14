Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBDEC0218A
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.40589.1736843356665693668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fBKing4z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843357; x=1768379357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bkAE2L5GLat3NX54FPZJ1XV5xiZx8fzJsr6dhbqOTzk=;
  b=fBKing4z/C7yLwqavCGGDPzMizScpYLw0SLQE8/RscRK89iMgsxRZhn8
   2cQPISkGxTmEa2zoXwdc/8Ul9mdEf2n7V9L9HAduqcbGq6pVq2+TEKHDY
   l5lA0pe9VPJnEAtPwed/osCPs3BA7chghk7OUgySgxNBoz5rsOUVSaxx3
   Nq+Me0NUBnduSpxQd550Z79jaF57PtJMBeq06EWIF5JQM+QaE7nxf5LRe
   fuER75zNACH5NzPl00LiWx/xK1AF9svDtQNrAEutaBpZ0AvYaS40OgwSu
   JNnxKSwD+Vcqn20FbzQNIHTWTiIpUdR+d2H2FtTCdFIAZBz/GfCa4Tr6K
   w==;
X-CSE-ConnectionGUID: SmIu6nz3Qg+RwiQyKFfweA==
X-CSE-MsgGUID: XbRYSSIxS3uzPeQ8J/4rMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="165944744"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="165944744"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:15 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E9AE8D500F
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BAF52D5093
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5289620074739
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:11 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 011DA1A000B;
	Tue, 14 Jan 2025 16:29:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/30] python3-pdm: upgrade 2.22.1 -> 2.22.2
Date: Tue, 14 Jan 2025 16:28:41 +0800
Message-Id: <1736843329-4131-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--0.420600-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrn5nfR7I2dFPWJ46n79OHuQim
	Mt6TSXWlvnCllUJsUcvrjryeBg9FBn79V6z8JYH8uLt50vtxBA6Uq+GQ/zyJdHhh5KUdlgWisHj
	E9OXcNYfLSrmLIdgButvBCsqcK5TY7M7ipjZrAVk4hD0Y/Y/a7xtuGFXrmRpjLz0RRYXFoWDMcC
	EoMjU3SDAhOMhrMDNMDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4Ixtofra
	Cyyl8ERgZBEjCNOXeLrixWWWJYrHx8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFJgLPXj4LEpi+dC7
	gSkWhrTi8LHanjFywkI2dqNPhyz6i8TWjbDR1kRoATNwgN6p24gnRfmOrVXNV9WTH+wObnvWij6
	N29rqkOx9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114867

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Write installer metadata like INSTALLER and REQUESTED to dist-info directory
  when installing packages.
- Respect .python-version file in the project root directory when selecting the
  Python interpreter. By default, it will be written when running pdm use command.
- Fix a problem of missing dependencies when adding to dev dependencies if both
  editable and non-editable dependencies exist.
- Use stdlib for URL <-> Path conversions.
- shellingham.detect_shell() returns ('tcsh', '/bin/tcsh') for tcsh on FreeBSD,
  so the current code tries to use the Bash venv activation script and fails due
  to syntax error. This change fixes the issue.
- Fix a performance issue because pypi source credentials were being queried
  many times from keyring.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.22.1.bb => python3-pdm_2.22.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.22.1.bb => python3-pdm_2.22.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.22.1.bb b/meta-python/recipes-devtools/python/python3-pdm_2.22.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm_2.22.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.22.2.bb
index b089307aac..53c0828bcb 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.22.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.22.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "6d3276ed8efc7d118a1667a871570b50d84025b2ad461598b7a2558610999330"
+SRC_URI[sha256sum] = "907dbaa1659f07c763902f8429c1573aa32b5ef2d99b3b123b5f1e38015c917b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


