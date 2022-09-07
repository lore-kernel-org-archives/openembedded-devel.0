Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53429C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 11:23:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.6489.1662549822901023532
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 04:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ctgRF4RL;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662549820; i=@fujitsu.com;
	bh=rgmqP6YVoE3Z940+E6zTXrgcQf0slSZRn7TGGyAIx9I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ctgRF4RL+6jllrz5N6Ne6BX6189FSBn4wiujWLM6sj4T8ZbLIGx+yyvKsM16SeUON
	 xevQ3mfUXkdFYc5ikChrljYsBlUmTiOuBFfWruUN3Ou1WoX+aAsFHrl+3fMydq7h4y
	 nFD9I26ijxSBUh0bNz8QmX88FHdIRj34PJEo7HvjMdT9uECDdQ7H/dCgGJcE5t+1LM
	 yIBmTo28gj+nF2I8D5IAPUMNqoFs1VN8ga3ffTOc4BChRPz9Rwu6lGSHy+YC/UcfMj
	 jEJICtYDuwY9Vx5Hhj4QeZDTrzeO2+6+/kXwNEW58xSbM1yhFf3BPDlO62qzMg1wYC
	 wcvzX3rv0cmew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORpGtTL5F
  ssPSiosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHx/zTWgt/sFZtfNjE1MG5g72Lk4hASeMgo
  sXFLPxuEc4VJ4vvFU0AZTiBnN6PEw0sJIDabgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfveA1
  QsL+Eg8/d7DAmKzAMVn3PgBFucVcJI4ve4SG4gtIaAgMeXhe7BeTgFnia1z/7NB7HKSOD5hPR
  NEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtConH6ISYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRqukosz0jJLcxMwcXUMDA11DQ1NdY0tdCyO9xCrdRL3UUt3y1OISXSC3vFgvtbhYr7gyNzkn
  RS8vtWQTIzCIU4rVg3YwflvxU+8QoyQHk5Iob5yXRLIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  V6pGqCcYFFqempFWmYOMKJg0hIcPEoivM9qgdK8xQWJucWZ6RCpU4yKUuK8Z0ESAiCJjNI8uD
  ZYFF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLUAc0hSczrwRu+iugxUxAi7cGioMsLkl
  ESEk1MEnIfmuSUNQTPL7+RfzUyG0b991eXHT5aNw0jx0PZ8+7UTa36eejSdMDl62Jtt4rGbrs
  zH0f6TLZ2Pea8Z2/uU12SH4O4vx7e6GF3nsvftl71VEiT+LXL06S7bywe4/1Pubbn7YbyDSbt
  V966+LOpzWlR9zs8X6DZ4sEn/VG+HWb2B54sNyqQrnFncVff/b5g+2TY5NuXG5lWWKUtsHyj+
  G24o5JnTunPEpPZFNct8C44/xt9h1n446d+6/VNf3Gv2cPRHbOFrl/28j+gP+tJdMmX7MQjLB
  VXxpz5cFji+COBv+vZZzOlbqM03z9PfqDNBSWuJZ8ki6Y+njyv4vPX3v3XRF9m8VZ137sWjD/
  yRQlluKMREMt5qLiRACH2YbDXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-548.messagelabs.com!1662549820!124322!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24470 invoked from network); 7 Sep 2022 11:23:40 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 11:23:40 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 430311AD
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:23:40 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3817C1AC
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:23:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 12:23:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-colorlog: upgrade 6.6.0 -> 6.7.0
Date: Wed, 7 Sep 2022 19:23:16 +0800
Message-ID: <1662549799-17908-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662549799-17908-1-git-send-email-wangmy@fujitsu.com>
References: <1662549799-17908-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 11:23:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98682

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-colorlog_6.6.0.bb => python3-colorlog_6.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.6.0.bb => python3-colorlog_6.7.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.6.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.6.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
index 2f8a0e5ca8..84b67e784a 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.7.0.bb
@@ -7,4 +7,4 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "344f73204009e4c83c5b6beb00b3c45dc70fcdae3c80db919e0a4171d006fde8"
+SRC_URI[sha256sum] = "bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1a989e474f6e582e5"
-- 
2.25.1


