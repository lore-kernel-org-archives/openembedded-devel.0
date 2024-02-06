Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB77C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:37:04 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.16836.1707205014579743538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nyFo3mRg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707205015; x=1738741015;
  h=from:to:cc:subject:date:message-id;
  bh=YzgyMFLAYcace40Npu8/5NbiA/glRcRPo/+sM6cGI80=;
  b=nyFo3mRge83nA5WYWza5YzxNYBvtl7leo8Ut73Tn/ye9ue5nMWPK1WJb
   68wVJbgXGc9sHcYQ4YcXpjTNdnJwkGgc4IojrsIF4uJwxQvwvUO+kcSMw
   jA1IeWu0Z0WyDhnLrvU+QIuhv3PNYk3KdgZ0tzxgNkEWUvBLeHb6Q1sV7
   K3ELSHiFz3Y4q60o44bFbixup/jVhrUbRNlymvRhn/ZFzD5WPzdDAcpbN
   xXMI1kwL8zjnFSJVTABsKCBTlal7Vu5t5l5kQCT5tt6VSJ3/yuoWmmw5r
   HzxRV/mohEZmhMyrfXcWhluVVMmmPKAegNA62Ovc1SNiT47qw90DQarUl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148007048"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148007048"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:36:52 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 33C58D9B0B
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:36:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6387ED6149
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:36:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0E3170B3A
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:36:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 94AF31A006A;
	Tue,  6 Feb 2024 15:36:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libgsf: upgrade 1.14.51 -> 1.14.52
Date: Tue,  6 Feb 2024 15:36:02 +0800
Message-Id: <1707204962-4868-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--2.386400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45g61lvmEwqsxkYD8wAZKsSCYl0NWKpLt0+63p3Evo7CYnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFOVKyfCjHvdHJEmEzCCHJgzUrL
	i/NjrBqWkbDkIr9CzaOsl2JOKB+cTzzWsvK9IWv3G+/AuQJJ1zqiHe+tp5R7jyJA+3uAKEWux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108600

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgsf/{libgsf_1.14.51.bb => libgsf_1.14.52.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.51.bb => libgsf_1.14.52.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
index 5ee73f563..7e1842b1a 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.51.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.52.bb
@@ -9,7 +9,7 @@ DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "f0b83251f98b0fd5592b11895910cc0e19f798110b389aba7da1cb7c474017f5"
+SRC_URI[archive.sha256sum] = "9181c914b9fac0e05d6bcaa34c7b552fe5fc0961d3c9f8c01ccc381fb084bcf0"
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
-- 
2.34.1


