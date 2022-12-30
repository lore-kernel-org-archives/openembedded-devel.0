Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFA6C4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:45:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.3794.1672803921297142031
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YTzJck1S;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803919; i=@fujitsu.com;
	bh=EqkLSfJS1/FPGdxcYrsj9uytwlbwiakqDgMUu7devng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YTzJck1SHjLpmAMOZJpWwtmE3QqlA5fXipPimUbpxieV80BEcVV6QiI1wWemWLJ1I
	 caHJksr9zB4bwyrlxe7Ul9hsOU9mNIl5PrpO6/yT6BM5R2OgSn3y3PPqEAZPfErhHz
	 TW83f23amrk+Xkg5zZ3ExfEqQZ8vKsBgJQQmLSYkiRcrZV14l0byB0deBODtxA6Y9c
	 6BWfN/upzKafzCfxYHx70IV1PjHEBMgUNOX6yMdXRf1MW8RwBWb5RtQTcflFhomFnp
	 Vj/6D2HPYXu51czn6MtmyTlEn+TfYLEexcLuut/DTyfPWSXhnNfTF0rOtn4HfHMLTy
	 k8ABTdSgF4lZw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8OxWdfv25Z
  kg5c/dSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxv08MLXnNUvHrygL2BsYeji5GLQ0jgIaNE
  1812NgjnCpPE1DPTmLoYOYGc3YwSz5+Lg9hsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC9hIvDx1lbGLkYODRUBV4u4aD5Awr4CTxPddnawgtoSAgsSUh+/BWjkFnCWuPl3MCLHKSe
  Ldp5PsEPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxhNi1OLylKLdI30kooy0zNKchMzc/QSq3QT9VJLdctTi0uAMonlxXqpxcV6xZW5yTkp
  enmpJZsYgWGbUqzwfQdj99I/eocYJTmYlER5Sz5vSRbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  av+CSgnWJSanlqRlpkDjCGYtAQHj5IIbxZIK29xQWJucWY6ROoUoy7H3YV79zILseTl56VKif
  Pe+gJUJABSlFGaBzcCFs+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzrgZZxZOZVwK36RX
  QEUxARySt2QhyREkiQkqqgcnc9nXmZa7rj+9nH25dEtUZwxjjZHd/hsLnvU37S57+c9854/8N
  6znrDD88fnlvinJ3pKzS7mW+W1SrLz4ts7xkvfO0f63owwNqyx2k9zdcvZKbyZ3aFbTmHq9M2
  9rcbTxn8vvMbF763Xn+Z835Ja+m3HQwCf7RIeuQFzrF+qSDs/ukL/WC1iYNV6p/CsV/1f7dVx
  jqtH33jxvTz3PbF7OqSBVzpJnveM2mcXRitHm7NF9rtH5OYdOdhKx2Pu7gs3d/PO25MV2xeP3
  ceiavA5HLfvpd32D8gPHBetbyiB3xbjGOTC8i9O27TPg3JEc9u8lWF9cY+35t9/4/C2dJKs8T
  E6swXq95c/vLjCdhHkosxRmJhlrMRcWJAClliVNiAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1672803918!382389!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30505 invoked from network); 4 Jan 2023 03:45:18 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:45:18 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 69E89152
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:45:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5D976151
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:45:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:45:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tree: upgrade 2.0.4 -> 2.1.0
Date: Fri, 30 Dec 2022 13:01:18 +0800
Message-ID: <1672376478-25626-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376478-25626-1-git-send-email-wangmy@fujitsu.com>
References: <1672376478-25626-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100389

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_2.0.4.bb => tree_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.0.4.bb => tree_2.1.0.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.0.4.bb b/meta-oe/recipes-support/tree/tree_2.1.0.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.0.4.bb
rename to meta-oe/recipes-support/tree/tree_2.1.0.bb
index 5ef533683..c867a3a7d 100644
--- a/meta-oe/recipes-support/tree/tree_2.0.4.bb
+++ b/meta-oe/recipes-support/tree/tree_2.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
-SRC_URI[sha256sum] = "b0ea92197849579a3f09a50dbefc3d4708caf555d304a830e16e20b73b4ffa74"
+SRC_URI[sha256sum] = "0160c535bff2b0dc6a830b9944e981e3427380f63e748da96ced7071faebabf6"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.25.1


