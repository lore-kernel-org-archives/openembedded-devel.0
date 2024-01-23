Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0388C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:59:54 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.1767.1705975189811664999
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="126338739"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="126338739"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:59:48 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A5057A3125
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:59:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB0D2F937
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:59:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 73B3D2007912E
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:59:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DD9E1A006A;
	Tue, 23 Jan 2024 09:59:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] qpdf: upgrade 11.7.0 -> 11.8.0
Date: Tue, 23 Jan 2024 09:58:30 +0800
Message-Id: <1705975110-26429-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--4.415600-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytD0XHWdCmZPJgU
	Ly4zAbFB1WWolw9/jvAQS1IvrrqoTN/uRefkpDDTDOs94g784gcJlr1xKkE5uaCjQPEjtbB0XFx
	o8bkiqTzk4ZouquPSwHVUSbHuxOT/9zYU6zlEINs/QdUh6LEl0DeXamXCCu1YwLkNMQzGl5DfZL
	rUlw8HxwHzuo+f6dKqJwnf/22m3cU2uyAbjj7YRG9OepgphdNGVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDWiAYy9AkNkRDIIdEQcrjRAEVviRke9CpuAss5vvtElT/M6Cslj661smDYq
	DNJq94PjDtzjn3VK724IFhWluBCk3iwjnskiK0yCV7SgdjlG21PJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108425

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Bug fix: treat references to older generations of objects as null.
* When recovering a file's xref table, attempt to find xref streams if a
 traditional trailer dictionary is not found.
* Add --set-page-labels command-line argument and supporting API.
  - QPDFJob::Config::setPageLabels
  - pdf_page_label_e enumerated type
  - QPDFPageLabelDocumentHelper::pageLabelDict
* Support comma-separated numeric values with --collate to select
 different group sizes from different files.
* Support "x" before a group in a numeric range to exclude a group
 from the previous group. Details are in the manual.
* When flattening annotations, preserve annotations without any appearance
 information at all, such as types /Link, /Popup, and /Projection.
* Detect overlong UTF-8 in the UTF-8 decoder, and fix detection of 8-bit
 characters in erroneous UTF-8 strings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_11.7.0.bb => qpdf_11.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_11.7.0.bb => qpdf_11.8.0.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_11.7.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.8.0.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_11.7.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_11.8.0.bb
index 92655e3c6..a13c9a023 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_11.7.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main"
-SRCREV = "986d2485784d57d7a84cc5af50e67bde827b0dc9"
+SRCREV = "452e1f5c20ec6adf62cd296cb9dddacbc06e6ffa"
 
 inherit cmake pkgconfig gettext
 
-- 
2.34.1


