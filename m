Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9E1C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:20:12 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.191298.1673940003656483243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d58uClE3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940001; i=@fujitsu.com;
	bh=WTCqo1LIBva/PHgwUa6igf4QAcWvTRwHLBzXsZIsKBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=d58uClE3LNjSp7ecK3Wj1LpELio8//PkImPQz5k6nUNo41axscW0HuEgqohWdQTpb
	 8affRAnka1UZSmXePDZ8ZydVspPfE17jdkVTlMKaHq7wmqxR6zSKh8nfDR117SePy+
	 1HmgdQQ1FdmbkT0nHw6eF4CPZpENX6VJyZ5bKEablnRGPw0Ec03kma5JmwDuIHQrKp
	 j64Na27irpgO7VbDHv7D9HN5QjoMADG5+jc0i68ST5VwHWp1a/Y6fDPKK0Fs6D9P8y
	 xS/hn/i8jHuXD+9H/Bqa77rNwWgMWXeCtkAWG3O+ErmS6WCMf/rhjlVwpzu6hjMaQK
	 s8BVMep39FduQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWVfB51i
  ywZw5bBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8buw4vZCs5yVhy+cJu5gfEFRxcjJ4eQwANG
  iWe/+LoYuYDsK0wS/yedZINw9jJKLFjeygxSxSYgJXHj/n82EFtEQF9i6ew9YHFmARWJF7972
  EFsYQEPiRer/4HZLAKqEk3fNoPV8wo4SbTencMKYksIKEhMefgerJdTwFni4e37bBBXOEn8a1
  /MCFEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpRo/fALylaTuHpuE/MERsFZSNpnIWlfwMi
  0itG0OLWoLLVI10IvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzB0U4qZ3HcwHl32R+8QoyQHk5Io70nTY8lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhPe
  QHlBItS01Mr0jJzgHEEk5bg4FES4Q23BErzFhck5hZnpkOkTjEqSonzXgPpEwBJZJTmwbXBYv
  cSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeJx5AU3gy80rgpr8CWswEtNij5CjI4pJEhJR
  UA5PQqbjWdI3XBSErDHR8nR2cngYlF80K+Tjp8Cfu2V+4L1cueijwSNt//Uz732cWXdxgvnhn
  7Zqbbt/m3JCWDH51ZMaxt4JZ37Nzrgp83tr9T7PqrXOJaZ/Vi1Jx7jzPKrXAH+kJ6zg/+rja2
  PCXqVyzmHLwgdqpeNdZwntKvux1iL0qWCJwetFeOavT0/a7nTzP8cvg1bYln1N/NnwvCZo0jU
  24RNVl3+JtfLfEXLxVvt7O2JN4KHedxd4mO3ddR+uf85fedNpbuDRvgs2kJL4fj1Sms134HrQ
  8J+HquqvvzisqnXGwKY/tmyHRk1bRu2bfIpXLe37tfL16QZ3gCXvW3n8h9qJ/ZT77Lamw7+NW
  YinOSDTUYi4qTgQAtZDb+lgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1673939999!390279!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22191 invoked from network); 17 Jan 2023 07:20:00 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:20:00 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AD80B7C
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:59 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A173473
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:19:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-decouple: upgrade 3.6 -> 3.7
Date: Tue, 17 Jan 2023 15:19:30 +0800
Message-ID: <1673939970-20246-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939970-20246-1-git-send-email-wangmy@fujitsu.com>
References: <1673939970-20246-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100613

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix Csv cast hanging with default=None, now returning an empty list. (#149)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-decouple_3.6.bb => python3-decouple_3.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decouple_3.6.bb => python3-decouple_3.7.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-decouple_3.6.bb b/meta-python/recipes-devtools/python/python3-decouple_3.7.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-decouple_3.6.bb
rename to meta-python/recipes-devtools/python/python3-decouple_3.7.bb
index 772ee7faf..5238431bc 100644
--- a/meta-python/recipes-devtools/python/python3-decouple_3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-decouple_3.7.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a46375b26bb7d7603565d829a2a51782"
 
-SRC_URI[sha256sum] = "2838cdf77a5cf127d7e8b339ce14c25bceb3af3e674e039d4901ba16359968c7"
+SRC_URI[sha256sum] = "e88a8d6bdf3b07d471a854099e455e20a6fa7a4d6ecf8631b250e3db654336e6"
 
 PYPI_PACKAGE = "python-decouple"
 
-- 
2.25.1


