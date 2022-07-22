Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D372BC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 01:41:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.3261.1658454068551341928
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 18:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cnZhQwqD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658454066; i=@fujitsu.com;
	bh=30K4GXPY1Ho7mJn3mHyyyJhLeOzWQeZdsNYdGwz6HOg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cnZhQwqDQtsT3YVrXJg5mKmuzd+WAqiDmV7yK4CtvFk+fL0LNpKQUIqwhbS3B+uIr
	 p9vyALDONUDzQlL94RDB24cbx+phlvPrkFttSfh+rp+aMYE5uBMunVVmcxhH6NF5ZO
	 2LAyU4t7uB377p2TYsh/OQcoyuq/+2tqSJyLOprUVg4JdVzQaFEjC85QbW2i0gN2mQ
	 K80Dp7YUYoiAs5o+2xzfVCEBtvUXXfz7cJTpvbrecaOQL4rFB/CHr4bvM0brlow9sn
	 xWeY05tyBpo6Kkh3hZq3yfuusZ0FIZ24YNw4Kb9NDyNPf2nxg9sne0NY5SxTWpAJ3z
	 Zg7ir9aKab1fA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8OxWdeQ4Va
  SQfNFTYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPqvKlsBS18FT8+H2VpYLzP08XIxSEk8IBR
  4vmK/cwQzmUmib1Hz7NBOAcYJfZMWsrUxcjJwSagK/Hix2IWEFtEQF9i6ew9QB0cHMICnhKHd
  4OVsAioSmya/4cNxOYV8JA4c66THcSWEFCQmPLwPTNEXFDi5MwnYGOYBSQkDr54ATZGQkBRYv
  Z0eYjyConXhy8xQ9hqElfPbWKewMg3C0n3LCTdCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hp
  b6BoZGuklVukm6qWW6panFpfoArnlxXqpxcV6xZW5yTkpenmpJZsYgcGXUqx2ZQfjnlU/9Q4x
  SnIwKYny7pt0M0mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG/BX6CcYFFqempFWmYOMBJg0hIcP
  EoivBZfgNK8xQWJucWZ6RCpU4yWHFNn/9vPzLEcTM782naAWYglLz8vVUqcd8lXoAYBkIaM0j
  y4cbBovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFf+N9AUnsy8Eritr4AOYgI6yNz8Bsh
  BJYkIKakGJn+29s3cR5Mtr5k9n5AjF3D/Xcqp3XPY2gznKaufmxdy5mvH3clTDfnyFghEs5R3
  BS3jfNm0I8t1Q/WtRUpnC2IT248vSHx6LXj+xm0rIyUj925TVjCYcq6nkcFm+gMJnuX5wYeXf
  IyWP/ONI1iojP3Y66hCE4Vsow7JtPJbz1YdlG2quWEzgTeO6UBGnvpho437273izT/EVhnfOj
  H7ff5b7r4FwdKSlxfO891/q3XTXuFVa9SmxVn8D3SK7DmqX3Ise+q8SJe5exTEn5ZMjfj6N8b
  x190X8zM7NeduyfK4sC94npV37We1uzP3zuU5sMNu5oV/X0Vb/r36FRFlaWT2TGWt66LH+l4H
  T/hbpimxFGckGmoxFxUnAgB35pZVUQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1658454065!132781!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14672 invoked from network); 22 Jul 2022 01:41:05 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 01:41:05 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 63A277C
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:41:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 56FE375
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:41:05 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 02:41:04 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-attr: upgrade 0.3.1 ->  0.3.2
Date: Fri, 22 Jul 2022 09:40:58 +0800
Message-ID: <1658454058-24194-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 01:41:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97933

License-Update: License check file changed to LICENSE.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-devtools/python/python3-attr_0.3.1.bb        | 9 ---------
 .../recipes-devtools/python/python3-attr_0.3.2.bb        | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-attr_0.3.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-attr_0.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-attr_0.3.1.bb b/meta-python/recipes-devtools/python/python3-attr_0.3.1.bb
deleted file mode 100644
index 22c5218c70..0000000000
--- a/meta-python/recipes-devtools/python/python3-attr_0.3.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "Simple decorator to set attributes of target function or class in a DRY way"
-HOMEPAGE = "https://github.com/denis-ryzhkov/attr"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=59805a0285f4d2b6abdedae73db4f5c1"
-
-SRC_URI[md5sum] = "68b9a503991241fb2df28488686b0e1e"
-SRC_URI[sha256sum] = "9091548058d17f132596e61fa7518e504f76b9a4c61ca7d86e1f96dbf7d4775d"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-attr_0.3.2.bb b/meta-python/recipes-devtools/python/python3-attr_0.3.2.bb
new file mode 100644
index 0000000000..0a77009e11
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-attr_0.3.2.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "Simple decorator to set attributes of target function or class in a DRY way"
+HOMEPAGE = "https://github.com/denis-ryzhkov/attr"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=02c113fb406eab0537c0cf4334f57c07"
+
+SRC_URI[sha256sum] = "1ceebca768181cdcce9827611b1d728e592be5d293911539ea3d0b0bfa1146f4"
+
+inherit pypi setuptools3
-- 
2.25.1


