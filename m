Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17A4C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:22:16 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.1802.1668396131252361023
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:22:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kfymJdaB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668396129; i=@fujitsu.com;
	bh=wf+B+F35FlkHtC4ytMEDVQYPeffBHoudCP9czii1QaY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kfymJdaB47cmp0oHg0SnFHrKOCjQEMu/eRuw9SjgHCO39pSu5dKXj6/cZBKlcNmyh
	 3PlkWOHf2EH7jL7+co4Ng+CsUSReQO+eFqCOz2nMF56p5hZ2XYbIM+JiQZwW4RarT7
	 kKl3UDluU0L0RMwmMWcSlSjXYMyH3bvHBHMIN0KDfFH5XkxTm/jsS1oP26mKFhFZ0n
	 z7+aOSRmdTYwW94AbcW/SG7mp1eOen/tr9s8LAMHAdfMsKl6E6wHif6airLLPIZ8+e
	 bEGn36LvxTJCTbs3QhHHjYT5uRs+JC8x94ZXlG/Hy7iyGYhIN4totJzq7DEy1iS3qx
	 Sc/d5f6M6/AMg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8ORqJuwpTD
  ZYF+PtsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrGt4x5jwWn2iqXPbjI2ML5i62Lk4hASeMIo
  MWf5HWYI5zqTxO6VJ6AyBxglNrZdY+xi5ORgE1CQWLj1DCuILSKgL7F09h5mEFtYwFnib/t1J
  hCbRUBVYun2ZqAaDg5eAQ+JS9uSQcISQK1THr4HK+cVEJQ4OfMJC4jNLCAhcfDFC2aQcgkBRY
  nZ0+UhyiskZs1qY4Kw1SSuntvEPIGRbxaS7llIuhcwMq1iNC9OLSpLLdI1NNFLKspMzyjJTcz
  M0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMupTi9JgdjL+X/dE7xCjJ
  waQkysu/vjBZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvhc1AOcGi1PTUirTMHGAEwKQlOHiUR
  HhLNwGleYsLEnOLM9MhUqcYLTmmzv63n5ljOZic+bXtALMQS15+XqqUOK8KyDwBkIaM0jy4cb
  AovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPcOyFqezLwSuK2vgA5iAjroe2QeyEEliQg
  pqQamLabHvy4/pH7Q0ttz4fMu7enevovM9jn8WPw51iRi2f1UTokp8pXxZxcEb9/FcuL4uR8r
  /7ZM4f+v9Opz2OvKNVuuPBS8Zu92V+Humk+FE9aFG+k1Fat9qFy5zOrjw8Mnqi/E+8u+22b2Z
  +mxo3bTDWXmLDvGf4qxUkdpkdfrBU45V/lCcs9eOzoxuzM1Z7Lz4yXrk7/Yef7WqvpUxnzxWf
  79jz3c7G7SGqtmb3deZSX2MdlGamNkmrGpXs3F2VqLYl9fzoo1atp/8M6l9LueavkHBL7ViJ6
  QuBlzL0rlwn2RM2eTigPFmk0fPqjuZrjR02e7NvTYxqcFpxZ1BCxm/rFCLlc2PU67wa8pzODt
  CiWW4oxEQy3mouJEAFk174JNAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1668396128!371058!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6399 invoked from network); 14 Nov 2022 03:22:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:22:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3597E100194
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:22:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 29AA2100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:22:08 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:22:06 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] yelp-tools: upgrade 42.0 -> 42.1
Date: Mon, 14 Nov 2022 11:21:58 +0800
Message-ID: <1668396118-24543-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99583

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../yelp/{yelp-tools_42.0.bb => yelp-tools_42.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp-tools_42.0.bb => yelp-tools_42.1.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/yelp/yelp-tools_42.0.bb
rename to meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
index a5da8590f..28ba39288 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
@@ -16,7 +16,7 @@ DEPENDS += " \
     yelp-xsl \
 "
 
-SRC_URI[archive.sha256sum] = "2cd43063ffa7262df15dd8d379aa3ea3999d42661f07563f4802daa1149f7df4"
+SRC_URI[archive.sha256sum] = "3e496a4020d4145b99fd508a25fa09336a503a4e8900028421e72c6a4b11f905"
 
 RDEPENDS:${PN} += "python3-core yelp-xsl"
 
-- 
2.25.1


