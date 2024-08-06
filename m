Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA96AC53211
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2886.1722934020649367662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FSZK1zxU;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934020; x=1754470020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CrGov2Ju4PFu+s+VvVOb+JfhLNVLlopYewH72caZ4Co=;
  b=FSZK1zxUxmrJnCAYMmauicLy4NXeYVqqLxBBsYkC/qTUHBv7PH8Tavo6
   EshABrOfG/4r5gfN5mu8mjX25TOYfWQtyIQQFZdZ0azyKwwy4EfA23e9L
   UivIxcjU5Ic5elE84kBnzWEEJ0ggSFIn4Rb005blo7HOu8htGFv8j8Yer
   IhnSFrZvj/Iiu5/qMg1Skx4bxuBYt3K5KaZ+kEGVw7iHAIGhQGMcJqqq7
   JrFzjWWj6Y/WdOhqK1h3x+MgFD1TnOr+M5UimCnaCNdF2DjuvGEA3Lrq7
   JdPP+3qimRuddFhx5IobMgOZcEbLX21RjPg81gs2P/iDxT4zwU6G1CRxV
   w==;
X-CSE-ConnectionGUID: QAAFk1GuTEuHQmIUhWotag==
X-CSE-MsgGUID: 0yvX9mRFQwapnfjJUMBkdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="148947957"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="148947957"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 052E8DB3C3
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 44130F766
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B754220076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 66B011A0002;
	Tue,  6 Aug 2024 16:46:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/60] logwatch: upgrade 7.10 -> 7.11
Date: Tue,  6 Aug 2024 16:45:57 +0800
Message-Id: <1722933994-32549-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-4.177300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z71Wx2uUbPLdlRzZAkKRGDd+uQPjixeS2o8W
	MkQWv6iV3LAytsQR4e5rSTaF7k3C43QfwsVk0UbvqwGfCk7KUs/pP0tfHOBfxUhmJitaliPsW2F
	8GraMV38YKcKD5JLyMdFi8FA9VIb9aEtt5QDmEi2Bf6suYictmzn7V8viRHposbvARyZ0Mdogep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111545

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logwatch/{logwatch_7.10.bb => logwatch_7.11.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.10.bb => logwatch_7.11.bb} (96%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.10.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.11.bb
similarity index 96%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.10.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.11.bb
index 2efaa2b3c..89012f885 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.10.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.11.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "329df0991b879764ed7e50a869de5b6bfa70d241eb254397a5659d1ff5f2588f"
+SRC_URI[sha256sum] = "5eb42d983a9667003368b572149fce788c0d7e13daaf1f28ad1bf3a140b865cf"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.34.1


