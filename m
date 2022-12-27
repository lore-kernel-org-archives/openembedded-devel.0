Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF41C10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:47:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.153584.1672123623657866272
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m9H1Pw82;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123621; i=@fujitsu.com;
	bh=lJsBU/B+nHjGKaowBDoj+pBJSDZQ1p5jX53QWnljmGU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=m9H1Pw825Yvq1SlcpIsk8OndbANHH3RP8NOEB3OFEJWVZnTEjDjAGewBTKqp7Ts1g
	 VtVyaBqMDhVgI/LwJr4IHvlk/+LxFb8g3X7FS4NrKo3bPKuyD9ItImsYPh5giUsit/
	 oapvCP9NTUbBwkSiUzVVn1xuq8uYp4YWCcAgojvExFroVM/94oZFZogWvr8Jgr/xu7
	 j6Et+YSy8Zsk/3IVUSrcJ/6kqU3yTAbl/mLg4i1wSmh9BeaVE12O6vR11P1yem6zmh
	 gTpe2A/X97+V7W2iEZt2ZeOR2Jl0TWVDOqaNseBCcZm0D9HiZR2TNx+1cyzHFX5G1U
	 TZVUF4Z1yHFeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSffJlFX
  JBj8/m1hcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBmHVs1jKnjJVbF90SW2BsZPnF2MXBxCAk8Y
  JRpa/rNAONeZJN4tvgLl7AHKtF5n72Lk5GATkJK4cf8/G4gtIqAvsXT2HmYQm1lAReLF7x6wG
  mEBX4lpz6cygtgsAqoS947PA6vnFXCSmHvuMCuILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkaz4tSistQiXUMzvaSizPS
  MktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzAcEwpVty6g/HGsj96
  hxglOZiURHmlulclC/El5adUZiQWZ8QXleakFh9ilOHgUJLgLZ0ElBMsSk1PrUjLzAHGBkxag
  oNHSQSilbe4IDG3ODMdInWKUVFKnPcrSJ8ASCKjNA+uDRaPlxhlpYR5GRkYGIR4ClKLcjNLUO
  VfMYpzMCoJ86qDjOfJzCuBm/4KaDET0OIPh1aCLC5JREhJNTA52IvLOHVNDQktqrgqM/3dn/z
  dVUWBocwhsa51Se5TzhkINezOWWwyOUB3apb2ldL4JS7PS09xvL2psfuIu+/3V5vNNrt25H9d
  eMYq6IFp3FWZCRfnsb+RjNpvnKS7M1pt57sDMRU7MrObl3J/PLyx7sPSVU2znd4E5Ir6mIWfn
  2MV90O65m1yEWN2oPKEX1eTgzM2qv11VRK12zLv+JKHEe9NXBunrvqpKLBzLe9z/Uli6hsfm2
  5M9D7id0b/99a9i6b7OSUrlpffYxHbuCT74kSNh0INMe8sT85yf25+2zIz8OmGi1+5s773brk
  jcKLfaXlKxK1tvyxKP7Y0vl7xuK7Bo/hoybUSC45/8fuUWIozEg21mIuKEwFqb8vuQgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1672123620!20739!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3728 invoked from network); 27 Dec 2022 06:47:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:47:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8CAE51000D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 803A51000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:46:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-multidict: upgrade 6.0.3 -> 6.0.4
Date: Tue, 27 Dec 2022 14:46:22 +0800
Message-ID: <1672123586-32004-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100270

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fixed a type annotations regression introduced in v6.0.2 under Python
 versions <3.10. It was caused by importing certain types only available in
 newer versions. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-multidict_6.0.3.bb => python3-multidict_6.0.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.0.3.bb => python3-multidict_6.0.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.0.3.bb b/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-multidict_6.0.3.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
index d54a673b4..4869e846b 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84c63e2bcd84e619d249af5181e2147f"
 
-SRC_URI[sha256sum] = "2523a29006c034687eccd3ee70093a697129a3ffe8732535d3b2df6a4ecc279d"
+SRC_URI[sha256sum] = "3666906492efb76453c0e7b97f2cf459b0682e7402c0489a95484965dbc1da49"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


