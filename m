Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0757EC49EA4
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.26504.1649663183201750667
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 00:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XfwXhXHd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649663181; i=@fujitsu.com;
	bh=nYtaV/abVltoyuiz8+sy4K3kXb0COfBNmnpW65wuyWc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XfwXhXHdjrwozF+2EA+1ZYYcPQfmYlH+Lhxwwhq8dnkStgSJlpbqUd8MHbHo7bJHd
	 u8z7O0LTDbqX0zUYCLqLuxNO/crZTHpGk8c048Sma0Gr9VNEHXqnb15MZ5qcF4+Xqq
	 /fx28LD7v5Kk+dnIn0YPQsDr/m22OsduwfrKNKPuKoO8USbQCOu1cF2kmxC0fNThFS
	 n47qTK2YviAZkG1tuEUGS632slyY1d+vyawe3pFaQAXeAsmjQvksbMiJfPrRAN2HGQ
	 K+ubXjwJji7O/pKloBqw1K6VjHaOrnlrnFgdR95MKDoZl/cMVjurqMdjrp51+Qv3fl
	 5mYPdgF5hrucA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqHvmTnC
  Swb4fGhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bqKZtYC6azV9x7cpKlgfEIWxcjF4eQwBNG
  id2TZ7NAOBeYJK6cnMQO4exhlOhdsBHI4eRgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphAUuJ6zMWAY3l4GABil+5rwFi8go4SfQeUQGpkBBQkJjy8D1YJ6eAs8SJV/vAbCGgkmf/Tj
  CB2LwCghInZz5hgZguIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXUNdI1MjPUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQJDOKWY4fMOxgV9P/UOMUpyMCmJ8q6/FJwkxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYL3w22gnGBRanpqRVpmDjCeYNISHDxKIrwcIGne4oLE3OLMdIjUKUZFKXHezSAJAZBERm
  keXBsshi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubtAZnCk5lXAjf9FdBiJqDFodsCQRa
  XJCKkpBqYsia4lVuWLbwbEsF2/Mfb2Ls69o5frtw7qvUiw85i+d8XYXcf/RDUj7r9Ysbure+5
  680k0tSvV/XNezXhuptw/PfJ1xsOv38y5VNDjHtY18PEWZ2b/tvtK5Hff2bTnpr0c+1WsWuN+
  7SXud0+q7dGreTTWRWtGSfmVcWHd6jdZr56N3VHsPt1rR01N5rXXj0ikqCRcqTS/GxtYT237I
  Npx/IbpbVqzPjKvxu7CyQn513aI/3242pmrw2SokrzhR3KH/2XzDA4uqNj27XHh014TA9anFr
  jezigjL9XtPTk+6NyAoqV4XV61yTjJc7OmrfBxXThu4653TEVRYIOKgJRYeF9+847mX6axSx5
  QemXEktxRqKhFnNRcSIA2XoikFwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1649663180!213027!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32348 invoked from network); 11 Apr 2022 07:46:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Apr 2022 07:46:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0CFCC100230
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:46:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BD7CF1001BB
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:46:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Apr 2022 08:46:13 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fio: upgrade 3.29 -> 3.30
Date: Fri, 8 Apr 2022 22:42:45 +0800
Message-ID: <1649428965-30248-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649428965-30248-1-git-send-email-wangmy@fujitsu.com>
References: <1649428965-30248-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96549

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.29.bb => fio_3.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.29.bb => fio_3.30.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.29.bb b/meta-oe/recipes-benchmark/fio/fio_3.30.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.29.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.30.bb
index 72479ce503..f97a1b899d 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.29.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.30.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "9b46661c289d01dbfe5182189a7abea9ce2f9e04"
+SRCREV = "a3e48f483db27d20e02cbd81e3a8f18c6c5c50f5"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master \
 "
 
-- 
2.25.1


