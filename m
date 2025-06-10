Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D71C71155
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.78429.1749526421768345370
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MfLpBAqI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526422; x=1781062422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uk2rG8nFxKc2zUqTmilr9k3Gdq6xHbrKRQZajUOygkk=;
  b=MfLpBAqIUTBgSTkVsTIJYtafTc2Zp4f1wI7n7paYlUGXU1sBXzgTo4Rk
   6av2Fef+94Udzs2tY+3bA/aEGcXbxmoZHLa8OWXR6C0HCbH65R9s9zgT8
   /W2flBqmhtHqiErP7ASuM8VkSLWkdhmab6PIBUIdrsyMm5ACkB3XbJFkl
   SrBZpSS2RXA/c1ret9QQjEpXNWSPky7xIym9/k34sbVejXgaBRP8QyyN3
   aWVjty2uhwpZCbHo5FKmxf9MGP07DUcEXEt4F6t2wBe7F5+FbmedLFTWr
   uYdxvkZPtKwIHoTKJp0LhGCe6sjQKwZsFev98oZFQ8+2xfZCOPoD8EpAg
   g==;
X-CSE-ConnectionGUID: v3Jkx+g/QrGWlRP9JqNjYA==
X-CSE-MsgGUID: dZAHc40OTAqGkr84/QF9Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="201453580"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="201453580"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:40 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 875CED4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 24829D7624
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:37 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 538CD1A0071;
	Tue, 10 Jun 2025 11:33:36 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/64] gexiv2: upgrade 0.14.3 -> 0.14.5
Date: Tue, 10 Jun 2025 11:32:33 +0800
Message-ID: <20250610033330.924-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117801

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gexiv2/{gexiv2_0.14.3.bb => gexiv2_0.14.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.14.3.bb => gexiv2_0.14.5.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.3.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.3.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
index 83bc9c6ad8..c9307967de 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.3.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.5.bb
@@ -8,7 +8,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc python3native vala
 
-SRC_URI[archive.sha256sum] = "21e64d2c56e9b333d44fef3f2a4b25653d922c419acd972fa96fab695217e2c8"
+SRC_URI[archive.sha256sum] = "0913c53daabab1f1ab586afd55bb55370796f2b8abcc6e37640ab7704ad99ce1"
 
 EXTRA_OEMESON = " \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)} \
-- 
2.43.0


