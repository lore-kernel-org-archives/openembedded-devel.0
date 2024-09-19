Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C6BCE8D45
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.11283.1726716762494441925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tlmj2zuK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716762; x=1758252762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MH9EBKkDyTs6Wf/Iz2fw7w8rPbrrfROJmeoyapGx4zU=;
  b=tlmj2zuK9DFRfck3roKY8XKttkmI4W/UTzsknyRdHOsulchI4avw+Len
   vLfzynber7yFmppPwQHjO1rt+pG2Qff4fhkmz8f1N53lEVvjDTyuSs4tH
   4lDLXWUdYqtipV+4eUKTXiqQWooe2vht9SZghBn2VqFzyLN/4fBpK3z6Q
   Y6FKCJojEiaRtXArn946HwHU50StYufYJQ0Q1imbJBNUj4bdlvJz117c/
   SYmkp9zc00Vn956mSCvHSIVrxl2s71VEn+0bwxKtpgYAByseusViy26/X
   CKDOA2+080zZ0tPbXmIrQShqjQDGLpx+BWDdb5ekpFyNZ6n0Tvw4zt3ti
   A==;
X-CSE-ConnectionGUID: CbtNDhz8T1qB71mV70RQjQ==
X-CSE-MsgGUID: dN2IwnHjTE+kSVo5DwZ2nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174141261"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174141261"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B035DB3C7
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F633D9681
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 131F621FC6A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B44511A01E9;
	Thu, 19 Sep 2024 11:32:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/28] python3-virtualenv: upgrade 20.26.4 -> 20.26.5
Date: Thu, 19 Sep 2024 11:32:08 +0800
Message-Id: <1726716733-14548-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SnLHPzs/YfpMA1GH2RWd1IaWTohDsIYF3J7FJSPKp0uEGBt
	X9ZerYFg2GwnheFgg1Cbw3KfThfABCSujJwM78iHQ+eY0jtQZLS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112381

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Use uv over pip

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.26.4.bb => python3-virtualenv_20.26.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.26.4.bb => python3-virtualenv_20.26.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.4.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.26.4.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.26.5.bb
index aadef0e94..82d60aeaa 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.26.4.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.26.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "c17f4e0f3e6036e9f26700446f85c76ab11df65ff6d8a9cbfad9f71aabfcf23c"
+SRC_URI[sha256sum] = "ce489cac131aa58f4b25e321d6d186171f78e6cb13fafbf32a840cee67733ff4"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


