Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E8AC35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:09 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.61102.1742893323853108014
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iic8IFTG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893323; x=1774429323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=s0EjdyN2latlochqhcfc7DBzokT1GpZg7zMTVk7tW9w=;
  b=iic8IFTGRfc5eVYl0EcvQHlnM25QQnA98g3UvzhzxUPOWkK2tJ4pMWkY
   C5A+8FFfpjJJkTlRfEOKmEZrhBNMBd5ImSIV2bp7DEgkmRH0FV+TfdkyG
   Fw6eXd4QUKFF36qojY1A9BUnFqfqjyDVZmGCvdiCcjR15NZF/S5eEQSu8
   w3OCR009yYdeLLP32foL7szUfVvKmk0Rkmv42BFM6dM1oP48YpnRtOEzN
   0ddTjTmaq4h/+aAkknZcS66Nz0jqp6v3WFvMS10Iyx/jK4/lOH+XcKsTZ
   2WmjO7S2C/P/aiooymMIMFdLaddEewxZ4ps000Te5fJZLmA7Jd2ZLatWC
   g==;
X-CSE-ConnectionGUID: 1jDtAIqFSPuH0VCUFImRIw==
X-CSE-MsgGUID: TsHoZSH3Skuy83VnVNbDrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194490682"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194490682"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:01 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BE3A7D4807
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:01:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 83E83D8B32
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:01:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE4111A0078;
	Tue, 25 Mar 2025 17:01:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/45] ddrescue: upgrade 1.29 -> 1.29.1
Date: Tue, 25 Mar 2025 17:01:10 +0800
Message-Id: <1742893312-3809-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116226

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- New option '--bad-sector-data'.
- main_common.cc (format_num3): New function.
- mapbook.cc (input_pos_error): Print pos and size aligned.
- ddrescue.texi: Document use of -p and -x with --domain-mapfile.
- block.h: Rename to mapfile.h.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ddrescue/{ddrescue_1.29.bb => ddrescue_1.29.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.29.bb => ddrescue_1.29.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.29.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.29.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.29.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.29.1.bb
index 2b11982d5c..99c7d06706 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.29.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.29.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
                     "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
-SRC_URI[sha256sum] = "01a414327853b39fba2fd0ece30f7bee2e9d8c8e8eb314318524adf5a60039a3"
+SRC_URI[sha256sum] = "ddd7d45df026807835a2ec6ab9c365df2ef19e8de1a50ffe6886cd391e04dd75"
 
 # This isn't already added by base.bbclass
 do_unpack[depends] += "lzip-native:do_populate_sysroot"
-- 
2.43.0


