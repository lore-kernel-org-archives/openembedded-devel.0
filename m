Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C78FC25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:31:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.24423.1660703454291447962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bXmJAPTC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703452; i=@fujitsu.com;
	bh=ju7z+VWdTcsjXXI+wpgsZRwZk6EIfawwaZhTRbRlv0M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bXmJAPTCewdYQ/BNTZ9pY0j2wkcteINVaZfbiMYn8jKvVx+WLJxjnD3n8RtqE71Rz
	 4fw0/Clp+lbpvJtJj7UjmWPxsipwLtRbPZzXb9ZhaMxYjoVW49XPGUyZQXLKxzlGwF
	 h2vXMD20jIXHCAr651Cezgc2y0vXn836Etehn6a/cItgE4GO9Rfddurj9DJYJC30vJ
	 I9KIHFGkJRlVcMuV8WwaJm3JY//PaKUUXud3+8Sslph4G4nC9kyvXtlaI1R+PXH63X
	 rDx23OyuFkwWJYWmILYJuFCZmt3bsBfcds9nQINGjuCePk4S4v7iYx3fzUIuhffNW/
	 7pmhxsSXpPGmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSfd20J8
  kg4czmC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxrV34wFrzkqPi1fgt7A+NUji5GLg4hgSeM
  EjffNLFDONeZJI53PWGCcA4AZSY0AzmcHGwCuhIvfixmAbFFBPQlls7ewwxiCwt4Slw9fIgRx
  GYRUJW4cOcnWJxXwEPi9b0msLiEgILElIfvoeKCEidnPgGbwywgIXHwxQugOAdQjaLE7OnyEO
  UVEq8PX2KGsNUkrp7bxDyBkW8Wku5ZSLoXMDKtYrROKspMzyjJTczM0TU0MNA1NDTVtTTTNTT
  TS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAy/lOIEgR2Me/f90jvEKMnB
  pCTK28/0J0mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO89f6CcYFFqempFWmYOMBZg0hIcPEoiv
  LIBQGne4oLE3OLMdIjUKUZdjrsL9+5lFmLJy89LlRLnfesDVCQAUpRRmgc3AhaXlxhlpYR5GR
  kYGIR4ClKLcjNLUOVfMYpzMCoJ8+7zBprCk5lXArfpFdARTEBHHLv4G+SIkkSElFQDk8TvsyW
  bZ+rnvdx7gPuNsNxMdeHi46anHzUWbPuwQP1iK8OTyBfST3hUlk7n/S9w8T/zbk7uhphydtHH
  z5Za+197vIiDU1TbZNqZmzo7stiNeHbaLpp8Toz7U8e9xP/KeVJFFx5f+/T05/GW0yfXii7aM
  DG39QET/1NzTqvCBX2Pju566+yycl5pUXz8y4rLE/nVObf3VN8NNDd+22h3lklXubLHZkKtuo
  eE+6xNMQvmPU+dmZg5yfWt+tNVuvvOPGrKDPzNZye7/e9KpcitB3kMr2rZtDU6pSy49EtTJfz
  hbZO7t3iORF+skDq/z3uSXKQc159ojQe7+YL7gjnev5jSw5D/c1XVcofLs8O3T1RiKc5INNRi
  LipOBABmaDtRRgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-745.messagelabs.com!1660703450!307269!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23375 invoked from network); 17 Aug 2022 02:30:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:30:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 77E341000C1
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:30:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6B51F1000C0
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:30:50 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:30:49 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flask: upgrade 2.1.3 -> 2.2.2
Date: Fri, 12 Aug 2022 04:17:11 +0800
Message-ID: <1660249031-20217-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:31:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98273

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-flask_2.1.3.bb => python3-flask_2.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.1.3.bb => python3-flask_2.2.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.1.3.bb b/meta-python/recipes-devtools/python/python3-flask_2.2.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-flask_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.2.2.bb
index 95abddfd95..cceab72ede 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.2.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "15972e5017df0575c3d6c090ba168b6db90259e620ac8d7ea813a396bad5b6cb"
+SRC_URI[sha256sum] = "642c450d19c4ad482f96729bd2a8f6d32554aa1e231f4f6b4e7e5264b16cca2b"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.25.1


