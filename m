Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCEAE77192
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.30513.1735032447879890117
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WQepSahG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032453; x=1766568453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pluSuzlXbV/dCLpoa3/q/dJLOJCsl9+scYOZaTBGUvI=;
  b=WQepSahGZY7hqLi570YjKOUuXwqz0e5wx4enXNM0t2PfeHK3/nGjw17D
   kyOdkiZc3NbnvL+/1Zs5wjvPBZA0TikOE4ZHogQO5ah91+njNGExWXorB
   wb4Mtc4+u+W3+MIlCcvw8CQDaaS3yG7pZXFYy2TJo0TbiHp94ExMeNbMi
   i6k27gACSkd+rf6OuMMYib+eBB0CZPOyCy6dO86l0AAmBZoV4FgyDAs2Q
   9kJVmHnTZkDhQcEuNzdgUZ/6DKlbi0W18/eyZuItedotzJiINmO3HCxof
   itIaDI66XavnRV0CY7cl4lUjb5rkUXmph2fFw4Ohp81+u8CwLeQzybUP0
   Q==;
X-CSE-ConnectionGUID: yn7tfL8TSKOQ57xP2T+sZw==
X-CSE-MsgGUID: LxjTIkG1QZmhdIxV1M/Naw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184809922"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184809922"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 81C96E8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 44DDDD96A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D5BC16B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7D3D21A0071;
	Tue, 24 Dec 2024 17:27:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 64/67] sip: upgrade 6.9.0 -> 6.9.1
Date: Tue, 24 Dec 2024 17:26:58 +0800
Message-Id: <1735032421-13513-64-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.465800-10.000000
X-TMASE-MatchedRID: H5Av6D5hHuG7qz8f6326on1zro62qhdCN5dqZcIK7VgwcMedHxxRAiFL
	Sh+QCTPZIvrftAIhWmLy9zcRSkKatYgrKnsJ1GRgOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrYot9gndKjSeWn0+RdaX9m5XaUqHmcIpyt5vfloDLxkj0omqm8NBrz1D/O
	qRxEDps+kZT/RmMkqhOjIS9IWiytGwzS5whSlQgR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114534

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.9.0.bb => sip_6.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.9.0.bb => sip_6.9.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.9.0.bb b/meta-oe/recipes-devtools/sip/sip_6.9.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.9.0.bb
rename to meta-oe/recipes-devtools/sip/sip_6.9.1.bb
index 4a3c2f7be2..c076929b94 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.9.0.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.9.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
 inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "093fd0e15d99ae2f8a83dd7f7dbaa3ff250c582a77eb8e0845cd9acadb1f0934"
+SRC_URI[sha256sum] = "7904be5190d7879952563b78a3af0e58fa27d9525af7f53f93eac7a83b433e7b"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


