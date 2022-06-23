Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD802C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:08:16 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.4527.1655968093139516439
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vZnAd/fN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968091; i=@fujitsu.com;
	bh=R7aneBtViKKoPznpTEBJZi9XkMe9PhUNP5F57gGdjEg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vZnAd/fN8aHPlJbBCfnVwCnL85ANwAXgrlmE4xmDwuJTAcPpVwKI6RciJYOm59RQH
	 ZlKx94oS7PhBbJv0W+a4DoYn+KEt1yBuvFRcNVlui3iBCZ7HJYqsthXQD3vw+ItOL9
	 APcB9fatkq2VBjP2MKhXLLahVkwEOPbww764MYKopL/DRB2eIBWwo7ymdk3bDuLZpX
	 1zTpC/5Gc78wChWV+4kKEz6VUBJYq7PB3jEmID857LhBE3nGK3rElt1J5KlK3SKjpL
	 wSUvhrhGYP9eCSRvvl1GQB/f+8wPSDq1ox1HZHGnnLB+u6EdvQZrp3We30EbTaBvXL
	 yYzFNaFeVW9Pw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8ORqBsluCX
  J4Nwya4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPhw23MBSf4Klac+cjcwDiXt4uRk0NI4Amj
  xPfF6l2MXED2XSaJA9/+MkE4BxglHrX2s4BUsQnoSrz4sRjMFhHQl1g6ew8ziC0s4Cnx4fgi9
  i5GDg4WAVWJlwfBSngF3CUuT54LViIhoCAx5eF7Zoi4oMTJmU/AapgFJCQOvnjBDNIqIaAoMX
  u6PER5hcTrw5egWtUkrp7bxDyBkW8Wku5ZSLoXMDKtYrRKKspMzyjJTczM0TU0MNA1NDTVNdU
  1MjXVS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDLyUYtb/Oxi7+37qHWKU
  5GBSEuV9xrslSYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7yV+oJxgUWp6akVaZg4wCmDSEhw8S
  iK8c0DSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/Np2gFmIJS8/L1VKnLeBDahBAKQhozQPbh
  wsUi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub1BVnLk5lXArf1FdBBTEAHPVm+AeSgkkS
  ElFQD0wKP1xUGRVN8BfS9T+cqXd9gksllxCPVv3vPIvZQ+dcKn6yXZJy7lGS+NP63/2K3tIpj
  0SzJNWt973KcmVK+lneO6LlQxmvbP7BufnBj7v47b+zuKJlqvT0qH5KiIbqb78jhWNeld6wL/
  nxuPfIy32WV+0yPIO/qg7rX2+bMu6z17O0MVcXlSY+v6J5z95vd4Rr21Jz3nzC3RsrtV4GPzv
  9PnWjJtfHvhZOfet6qB7TIrN505v/Gsgf+W/YmOBx4l2swW1K2OjbsSMQEmQ6TTO9Ew96s20a
  MGxav2rGDIWFS8aKvedvlWFbtPL3sQ3+m8PpT1VqT/R6f+ZevcGFV6af9YvNYTL8VcJxK99dq
  TVViKc5INNRiLipOBADiI/EXTwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1655968090!40252!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4827 invoked from network); 23 Jun 2022 07:08:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:08:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 85AC2100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:08:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6E072100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:08:10 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:08:09 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-gnupg: upgrade 0.4.8 -> 0.4.9
Date: Thu, 23 Jun 2022 15:08:01 +0800
Message-ID: <1655968081-2436-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:08:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97575

License-Update: Copyright year updated to 2022.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-devtools/python/python3-gnupg_0.4.8.bb | 14 --------------
 .../recipes-devtools/python/python3-gnupg_0.4.9.bb | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-gnupg_0.4.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-gnupg_0.4.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.4.8.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.4.8.bb
deleted file mode 100644
index b42225b62..000000000
--- a/meta-python/recipes-devtools/python/python3-gnupg_0.4.8.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b0b7ac63b60085b23fa9f7e1951daa1d"
-
-PYPI_PACKAGE = "python-gnupg"
-SRC_URI[sha256sum] = "b64de1ae5cedf872b437201a566fa2c62ce0c95ea2e30177eb53aee1258507d7"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} +=  " \
-	gnupg-gpg \
-	python3-logging \
-"
diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.4.9.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.4.9.bb
new file mode 100644
index 000000000..9e13e4c26
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.4.9.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dabe659eadd6d97325b1582e41cfc11"
+
+PYPI_PACKAGE = "python-gnupg"
+SRC_URI[sha256sum] = "aaa748795572591aaf127b4ac8985684f3673ff82b39f370c836b006e68fc537"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} +=  " \
+	gnupg-gpg \
+	python3-logging \
+"
-- 
2.25.1


