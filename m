Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF0EC4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:17:06 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web12.1914.1666055826150988365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hKJ5pLLu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055824; i=@fujitsu.com;
	bh=xu7b63BiBeeBoStadN45Zf/bjQiUfkq8B0vAWlWDK6k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hKJ5pLLuGQt7f8PMO2svwH9ANnlPVG7COpPusy0Wb7kF2sSZjV7EhM06runHmKKU5
	 3fRWgKEkgxpWY+fLhZ+evAQQlRvGwVZhx6NFKLkXqhbaC4TNZbdRimNtTfbJxpTUTG
	 vFHijSpw+tLdRPMAk4oUeHHVWPu5M7k4t/r8+ZkTmDDNYNxNj4yBLdaWO2LLt6dDeL
	 wZBErsfE+JPkTY5uzFDQ/d33FiUz0Dt7/Ros0yf/gbkadGpg99IVNE8YZbJCEzG1F0
	 08sq6kc9FJNkWqKgNhLcV3bveFAEwfrgumDbP5Nk3NKyVmKXeQK0QBVgLC1Vot93tO
	 h1G6yV0A/uJ4w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORpNv/zzf
  ZYPNMCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN7bSd7QQNnxfXOVewNjAs4uhi5OIQEHjJK
  NF5czg7hXGGS+NLyghXCOcAocWLPKiCHk4NNQFfixY/FLCC2iIC+xNLZe5i7GDk4hAU8JRYv8
  QExWQRUJc40Z4BU8Aq4SzR87mMDsSUEFCSmPHzPDBEXlDg58wnYFGYBCYmDL16ATZEQUJSYPV
  0eorxCYtasNiYIW03i6rlNzBMY+WYh6Z6FpHsBI9MqRtPi1KKy1CJdE72kosz0jJLcxMwcvcQ
  q3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwHBLKWbz2cH4b+kfvUOMkhxMSqK8
  HTN8k4X4kvJTKjMSizPii0pzUosPMcpwcChJ8Gr9AcoJFqWmp1akZeYAQx8mLcHBoyTCG3UGK
  M1bXJCYW5yZDpE6xWjPcfXKlb3MHFNn/9vPzLEcTM782naAWYglLz8vVUqcN/4vUJsASFtGaR
  7cUFisXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzMsBchtPZl4J3O5XQGcxAZ2Vsd8L5Ky
  SRISUVAOT/9XelItbzjvIrA9fML8je0LgXJO+y+LaYYGPT6hV8nz701A+cytDtvHdYIec9Iux
  DWlfljbdtp6WoclS5xop8luTW8fifRtTz7G5bHNXKU6eoXHPk0eoZI3DnblP87vtzHaKGkUIL
  3W0ebpsj4avh8KFqeKHm5gM3P/LK2+f/fTgr7+lqS7SHClft6V27sy6aZt0/+3U+DdbdNx1P/
  kdOcjDKeWeF8BQPE/icQ/jyRiRL9FXl7vcc7zqJPfi59I1wryH+ZelH/x025NVRqK3xtXxdIf
  sIQvb/ZceHznhbL1xV1VJ9u/Ltw7GPCt4IKLTl31t2gP95NMaG8+9YJloK9nv65B/2JLxurDT
  /FlKLMUZiYZazEXFiQCWufIZUAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-585.messagelabs.com!1666055823!281205!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23708 invoked from network); 18 Oct 2022 01:17:03 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:17:03 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0BB471AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:17:03 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 009B01AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:17:03 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:17:01 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.16.3 -> 1.17.0
Date: Tue, 18 Oct 2022 09:16:54 +0800
Message-ID: <1666055814-2555-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99230

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../unbound/{unbound_1.16.3.bb => unbound_1.17.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.16.3.bb => unbound_1.17.0.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.16.3.bb b/meta-networking/recipes-support/unbound/unbound_1.17.0.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.16.3.bb
rename to meta-networking/recipes-support/unbound/unbound_1.17.0.bb
index 5e40d8c30c..0dd0ce8822 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.16.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.17.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master;protocol=https \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV = "137719522a8ea5b380fbb6206d2466f402f5b554"
+SRCREV = "d25e0cd9b0545ff13120430c94326ceaf14b074f"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1


