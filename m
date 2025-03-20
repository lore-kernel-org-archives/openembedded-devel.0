Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509A6C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:57:57 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.3051.1742461076163488027
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c2eiQf9S;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742461076; x=1773997076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=M9xOk9PyQIwSpC1zbh13R5Ad4vwph3e5eVTwGpjvZX8=;
  b=c2eiQf9Sf5r0SStI3Jhx1jpM6GgbaHKkXdM+tBF93jFRrzFkB+SedAHs
   sDsbHYfgRVxIOrzRzkw5x3n8cyefCCv8YQW4NqTGWl//VcukOsP/tPZ9U
   zpb2HmVRjzPt+skHXlHTKN6247p87FzAOQX69ISawXV0EluUU2ck21vGo
   OrP4vN0sLZXAa30+DcjIh7w9yoJpMHQ+lKh4Gy75wOIeyAXTdXe7vwH5Z
   62tXhdXu5bI1ZRCGm4VqW0ZJvsj2+/9kP1Nnb5vkv0UCsixqAfsJURyER
   RSUfKOeDx392m+Xae2ZT2lJSVKC/2BCxytLkoXdl1MGnA5u6E46ms3zzP
   w==;
X-CSE-ConnectionGUID: qpBaK09GSkCr2rz02k//Yg==
X-CSE-MsgGUID: dMRYj2hZRvilIJ6Xb0Sq1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="172561182"
X-IronPort-AV: E=Sophos;i="6.14,261,1736780400"; 
   d="scan'208";a="172561182"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 17:57:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C1C0CEA890
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83A6C1382A
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0F86E1A009A;
	Thu, 20 Mar 2025 16:57:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 3/5] evolution-data-server: upgrade 3.54.3 -> 3.56.0
Date: Thu, 20 Mar 2025 16:57:41 +0800
Message-Id: <1742461063-20828-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742461063-20828-1-git-send-email-wangmy@fujitsu.com>
References: <1742461063-20828-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 08:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116127

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Set project-wide emacs formatting rules

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc      | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 4e6c90f943..512ba7f9c5 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -4,11 +4,12 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
-                    file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1 \
-                    file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543"
+                    file://src/camel/camel.h;endline=24;md5=4150eec6c74e359401d8ed7f266984b9 \
+                    file://src/libedataserver/e-data-server-util.h;endline=20;md5=fa7fca32c1bf07f87a52094b414fe7a8 \
+                    "
 
 GNOMEBASEBUILDCLASS = "cmake"
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "5108dc38ee5cc1f8ef9155e87f6c4129f9644550a0962c5ae23ff807b57cb8d0"
-PV = "3.54.3"
+SRC_URI[archive.sha256sum] = "7ae5482aa4ee2894467716c5be982500e1d511dddf4ab29b68fdb107d7f8a8ff"
+PV = "3.56.0"
-- 
2.43.0


