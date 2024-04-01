Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5003CD129D
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.39361.1711983107514078672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oyoG+6ju;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983108; x=1743519108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hv1NL1nOJ+hDO+pd4wlDatPeRpkqVT2ciCZqk1qocBI=;
  b=oyoG+6ju9R9d+Ny6Ws/zOS+lYfFQBMQHnmAkZUNL7r3QbqPpKcLFXSBi
   OBYL8YMSQ1WQiXOelzPRI9DhhygR+Rwzu420CVSHBTM++hVUN9swd97rf
   WyhAbd3oDodQ/T04wDtI92OyVBkSFm93HhswKED0OdNNo81GcvpOijrAT
   53OOpklAneeAj1xSCssea1QazzNJ46B+3+/hYVHfxaAl/jbXt+AQ8rayr
   8Hm0yP6yZX7f3woNyoyjtBol4rxWzE9PhufsG7SBYLlnc8/IlupV2IayU
   /AQgVytkU8B55rHTTmaIYoLhNU+r0A5cZQBt/3g8RA2G3mZ2CmI70gXId
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="156148782"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="156148782"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:46 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 304E7E36E6
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 75690CF7C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E8C9120093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:42 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9F0D41A000A;
	Mon,  1 Apr 2024 22:51:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/47] python3-tox: upgrade 4.14.1 -> 4.14.2
Date: Mon,  1 Apr 2024 22:51:11 +0800
Message-Id: <1711983079-16849-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-3.172100-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxf181XISobII3E
	akIoHWNdOizVMXf88OpI14TN17L2LtmWkVk6JGUgEhGH3CRdKUVUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiDAixBlu3NnC5x7uAXGEprQFA6pSxaDHmAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMWeMpVNhsMwMRB0bsfrpPIcSqbxBgG0w7czxrEUXDwj6IK2
	vjlaQfEV4UWcbRy/4iWr4JkYCmRG1zkA7oetI7i1NCQQtqGOjwfz6ck54WCy05SJovikNvCD4w1
	eJ6B7AOCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109755

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Add provision arguments to ToxParser to fix crash when provisioning new tox
 environment without list-dependencies
-Removed unused line from the 'fresh_subprocess' documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.14.1.bb => python3-tox_4.14.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.14.1.bb => python3-tox_4.14.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.14.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.14.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.14.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.14.2.bb
index 10eab8db8..f451de321 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.14.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "f0ad758c3bbf7e237059c929d3595479363c3cdd5a06ac3e49d1dd020ffbee45"
+SRC_URI[sha256sum] = "0defb44f6dafd911b61788325741cc6b2e12ea71f987ac025ad4d649f1f1a104"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


