Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44742C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:42:05 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.136482.1698104520526224186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137371476"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137371476"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:41:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B348CDDC7D
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:41:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5C72BF3DC
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:41:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EC106BA6C;
	Tue, 24 Oct 2023 08:41:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.1.3 -> 3.1.8
Date: Tue, 24 Oct 2023 07:41:38 +0800
Message-Id: <1698104498-32033-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-5.717200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyOVdQAiMmbZ6F2
	RIEczdLBBRMoMvvt96JbHZnywzKCMwobw5R7QfPo031Nfxfj2zO/4Zb7NS8bZpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3dCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07SjXf4udBIoMNe89qspBt22UPVRepsvnBY3YOoxAxMfYi9IH7nwZkT3abZEDMuZNCwrNe
	/lQ0opPGcWuKTe0esJN0zyEePZ9o+CzC5gM1BN/
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105703

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* Add support for formatting the data label in chart trendlines.
* Add the :func:'very_hidden()' method to hide a worksheet. This is similar to
  the :func:'hide()' method except that the worksheet cannot be unhidden in the
  the Excel user interface. The Excel worksheet "xlSheetVeryHidden" option can
  only be unset programmatically via VBA.
* Added fixes for column formulas in tables that were overridden by table data
  and which also didn't take future functions into account.
* Added support for chart leader lines for chart types other than Pie and Doughnut.
* Added support for adding signed VBA macros to workbooks via the via the
  :func:'add_signed_vba_project' method. See 'Working with VBA Macros'_.
* Added support for enabling the Excel "Show #N/A as an empty cell" chart option
  via the :func:'show_na_as_empty_cell' method.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.1.3.bb => python3-xlsxwriter_3.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.1.3.bb => python3-xlsxwriter_3.1.8.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.3.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.8.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.8.bb
index 6952d533da..06797f4857 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.8.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "696c16458d50712a3a5f902676c045ddb4c1bd1b54595f501e582d549abdbdb9"
+SRC_URI[sha256sum] = "059d0786fbfa3055588e81e9d5acf4ace28394bf09353a31ae2cae635740fc15"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


