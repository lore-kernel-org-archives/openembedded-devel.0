Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C66C3065D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.167244.1719305852975534140
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=THEFTN1B;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305856; x=1750841856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f+1sCmh+TX6MoJemMA8PGJkKe2+Sg6oRGDHb6t2hYpM=;
  b=THEFTN1BVm3jTGXoFRVNSjpYotAGaxHqneRmNAMukMWcF18UxjtRpYbj
   ZhAl38j3iXA2qR4DT8ewMy664kXxH3PJqcDzLJoUS3Uqc7xsM0XmuZ7FU
   bvarx9ihcdts7kwDi0THxvYlNC78eI+AMNTcRzG1tEuoLlAHGMVLJMYkO
   jMwE1VABeTaju/zDd2uI4SQ/CryOJPLAhMpzPi5qqry3H91/fyZ9UR0D3
   l7aCSY+GwhVQg+S34ohGAP14kju22YvmHNdrn1K9AqsQi0hzimF9KQjc4
   HpBKEn/ySJp9AE6m5MC6t8c+nS1/FEgXFNwaHsk4Jl+Oc8uDsI/1oj7vM
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152254736"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152254736"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CA80D8003
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A73EAD8AF0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 366E12007CDD9
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 001B71A0002;
	Tue, 25 Jun 2024 16:57:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 55/57] qpdf: upgrade 11.9.0 -> 11.9.1
Date: Tue, 25 Jun 2024 16:56:28 +0800
Message-Id: <1719305790-11484-55-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--0.313400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrBPY4SegK3jw6FHRWx2FGsBRc
	qLOELivDgcoTHUsVekYdUetUKvcxGvc2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQ32S
	61JcPB8cB87qPn+nSqicJ3/9tpt3FNrsgG44+2ESeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNYrc9ghq+67q93UkHSUmaZCTBtH+WEuSNSu0kl8GeBDyYmNvxCUk/iVSfXuCwYuN1cyHo
	5HdMD3Xrq/2kMn3WHba9WE6vJWbLYJXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111066

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Rewrite a recursive function to be iterative in linearization to
  enable more complex files to be linearized, especially on Windows.
* Avoid non-standard use of 'std::basic_string_view'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_11.9.0.bb => qpdf_11.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_11.9.0.bb => qpdf_11.9.1.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_11.9.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.9.1.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_11.9.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_11.9.1.bb
index 4778be42b..f8b398c32 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_11.9.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.9.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main"
-SRCREV = "3b97c9bd266b7c32ea36d3536e22dab77412886d"
+SRCREV = "c03ee7aa663c4361e23ca32b596adf6e8be0e8ac"
 
 inherit cmake pkgconfig gettext
 
-- 
2.34.1


