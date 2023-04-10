Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D87C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:31:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.40264.1681115464271521643
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nIvl0enm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115462; i=@fujitsu.com;
	bh=rkT9OkzfP5I47bka3ws5SIvigJGbR8hMTmciFfODWoQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nIvl0enmr7klTxPoDez7PV1L9IJmdwI0yO/P72/KV3nYHMozSjMIZ8zjmqHLFLt6w
	 VM/0kFV7yLWIM4lidu7Aa3fFHCNrqcud0uNyBjsn8Kk5sQODedr67T70Ca8A5JSPqd
	 ZbfiOcOcDx3S/k57/a8YZ9kxrIGsTwSK9nFuBvbDbo1r3XN9TX+3hA2npOz+P2d+TG
	 y3nXRAu/wYa2V3vAvw7Es/nOsJRVjlPt+PuZWkMX2PX0EtqIx0LZtPbFTglyWEN42W
	 YUlQUhX4D/zLCYjSe+OLcv4JEEMhEFeLc2u0L+QvwU/h3Eo12dZ7mIvlL3FAbNYsTb
	 +xipJik9ml2YA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpOt60jj
  F4PsBM4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP//PCCQ5wVi/8sY21gfMjRxcjFISTwkFHi
  9rRVjBDOFSaJhsOvWCGcPYwS6/YsYe9i5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphAR+J11+bwOIsAqoS/9ufgMV5BZwkfkx+xwpiSwgoSEx5+J4ZIi4ocXLmExaIORISB1+8YI
  aoUZSYfbmZBcKukGicfogJwlaTuHpuE/MERv5ZSNpnIWlfwMi0itG8OLWoLLVI19BIL6koMz2
  jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBxTitPcdjD+7vur
  d4hRkoNJSZS3i8s4RYgvKT+lMiOxOCO+qDQntfgQowwHh5IE78IDQDnBotT01Iq0zBxgbMCkJ
  Th4lER4K44BpXmLCxJzizPTIVKnGBWlxHlbTwAlBEASGaV5cG2weLzEKCslzMvIwMAgxFOQWp
  SbWYIq/4pRnINRSZh322GgKTyZeSVw018BLWYCWszlYgCyuCQRISXVwGQ54UC7FOfh1//CNM0
  vrwty+lZUaMkYvp/9FW/Qzq26M3VW9uSVKyy9vS9xzxz+NRsWnJbfzNYu5bKA5emfnWvvcEl5
  hMTrd0aq/SjJ/XRWUEtZ47+n6ryNXc/KVsbaR8y+xfM7doH8Ot0s7nbhI7qBinzXwxX+rXjEs
  D5u9mzGKinRKNUI3rR7usJWvozqz5u2KBa/PqN8+PKq1n0bFH0TGw06Zxj59zHxmcSctu89/W
  JK/mHH6Nb86vM1fdZ6zMGb3a+7rE70f6ZfsU9ty9Md1TutM34nPulSvuJd2mf79uHH3wdyS4S
  d9j3vO6jybIpKZGTcT9X8aXKRZ/J1N81oXNZqNTn17evDP8pOK7EUZyQaajEXFScCAKwFAoNC
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-745.messagelabs.com!1681115461!189441!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28927 invoked from network); 10 Apr 2023 08:31:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-29.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:31:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 54F731C8
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:31:01 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 49DBE1C7
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:31:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:30:59 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imgtool: upgrade 1.9.0 -> 1.10.0
Date: Mon, 10 Apr 2023 16:30:44 +0800
Message-ID: <1681115447-24458-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102020

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imgtool_1.9.0.bb => python3-imgtool_1.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imgtool_1.9.0.bb => python3-imgtool_1.10.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_1.10.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-imgtool_1.10.0.bb
index 1e5efbe18..5282bccd0 100644
--- a/meta-python/recipes-devtools/python/python3-imgtool_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imgtool_1.10.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "MCUboot's image signing and key management tool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=9965f09ae52c04886a1f04e13ccdce57"
 
-SRC_URI[sha256sum] = "7fa7f6bd6bf069b5ffa07ea47478e16b6206bd2fc5b7607def999de0e9134a43"
+SRC_URI[sha256sum] = "03b34e75934ac3d96e7c42b6bcaf11ceaf4f453f7c6f26c17d726bd183104b40"
 
 inherit pypi setuptools3
 
-- 
2.34.1


