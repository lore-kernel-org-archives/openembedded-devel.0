Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE52EC3065F
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.13620.1719816256089043092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XxFkpZJj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816256; x=1751352256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7f4JbwMd9aoUt5Tm53Dx0eZ2QFB8q0o5Vg/yWtdMtt4=;
  b=XxFkpZJjmWkQ23PqJonNUQy9OFKRh3AN+cJSeG94sUU5dCNi6OG/XvDS
   69DMhxV6XhKA9pYsURZEZgN5cCweqT3OxtAVnk8B55R8Jly2c848A20n1
   Dm2yQrPulvTBTHZn50GIdM/DQt+IZmlzJTLBElB7J0f/sxzmHQVOwmDVl
   PqLtZkN3F3ThcMgB8IhmEK4ffoji1XiOljaove1z5WBceVs2UrjHmujKK
   tC/BqspUR0OJUJWYqeoswYBoO+gCBsAHthW2VZO62O2GVWdTGROCJzBsz
   dwjL3RJys8Zpdl/LLixN7EWS7JBZxA/P7rK9Yh1jIWr27c/k/sAAfPR4U
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165585896"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165585896"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:13 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A10A9CA1E6
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E2EFDD8B00
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83EAA6B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33F1D1A000A;
	Mon,  1 Jul 2024 14:44:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/25] gexiv2: upgrade 0.14.2 -> 0.14.3
Date: Mon,  1 Jul 2024 14:43:40 +0800
Message-Id: <1719816242-11839-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--3.508500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrC5HdxA3MwSftrvVsQ0WdM2Uz
	B7Xp5yOC3WhgsWJsCXCysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl0fyM5VfgjG2/9T
	DS4zEk/xehQf6tJm39GRGSnUqeCO9GAdnzrnkM48URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHVjRfm1foA2zwy0VNcBj7w0HmgROC6PFAK4zxHneQM3EM/TFZllNJMIJ7/5T2ajkjB0F4
	S+xYH8AS9sPruYFVAHRqWseNAlsxPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111170

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 * Prevent std::exception escaping from exiv2
 * Declare gexiv2_metadata_open_stream and _save_stream as deprecated
 * Documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gexiv2/{gexiv2_0.14.2.bb => gexiv2_0.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.14.2.bb => gexiv2_0.14.3.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.3.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.3.bb
index 8fd658310..83bc9c6ad 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.3.bb
@@ -8,7 +8,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc python3native vala
 
-SRC_URI[archive.sha256sum] = "2a0c9cf48fbe8b3435008866ffd40b8eddb0667d2212b42396fdf688e93ce0be"
+SRC_URI[archive.sha256sum] = "21e64d2c56e9b333d44fef3f2a4b25653d922c419acd972fa96fab695217e2c8"
 
 EXTRA_OEMESON = " \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)} \
-- 
2.34.1


