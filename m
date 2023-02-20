Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4859DC05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:44:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.7950.1676879051034512239
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jdABw9PP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676879049; i=@fujitsu.com;
	bh=S3n766YUUnhPsn9Llf9Wzv6XqxLyPRjED0TC26CfHCM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jdABw9PPCaCjCKk7wHKB3g6YdYKjZjWQR0HYo6hueIabxsp6ud0d4m4cr8BCOaJZe
	 1l/GYJ+KXPBWI+d5KWtjusq+Ev6PZ56dWU8Ki554e7zTXZsQCeu32MBIXEJlZluU+7
	 zlYkEI3whSfsLdQKW+JuJpSfOQ2DbAeXSUHmfzJX6P5CRjzawh+F5P5+hfloQPJzMx
	 BEhhHV0ElNJINIsFfryC4+8IPX1n2VvuCS4k2SWBqvEhm4yFlnhldq444FBVAT8Iei
	 +4+h9f02r6vSQzZxQyPF1jSsXSTl34aYJl+IT5OQDmkFM6uqw3UVyov/K7bCzeYwvW
	 JTaO58YlQW/SQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWfeEyud
  kg+52eYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePX7162gkmcFZ131jI1MC7i6GLk5BASeMgo
  Ma29rouRC8i+wiRxafZdFghnL6PEz7VH2UCq2ASkJG7c/w9miwjoSyydvYcZxGYWUJF48buHH
  cQWFrCT+PrnBCOIzSKgKrHm1XoWEJtXwEni+61/YL0SAgoSUx6+B+vlFHCWmLPkGQvEFU4Sh5
  vvsULUC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0K04tKkst0jU00EsqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDN6UYsbkHYxX+/7qHWKU5GBSEuXdJPw5WYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb
  5UiUE6wKDU9tSItMwcYSTBpCQ4eJRFeaWmgNG9xQWJucWY6ROoUo6KUOK+CMlBCACSRUZoH1w
  aL3kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmPg2znycwrgZv+CmgxE9Bi9x8fQBaXJCK
  kpBqY5B8ftZ6Q8OzUpCjzm1vDltyU/F4qbDdrwbLAD97z/pidC2u72NU41/bqRIGC/bXXOH0l
  yqp//177iTMm8N2zaZpbuWOLNvN3Tr2V+a9h0cE7moEyzEtZt1dqPgs4E1d6YoYOT+QUvvdz1
  789/tLnmWniQ2fNi0tPLPB+I3bkkLTpfPvL3zlPzAs7qlC8JWShbALzfLsDOu1SL/pnz+Ut8j
  qc/duwxTF5SbF3xsXyZy4Myf1fli4/uJvBmUVj1Y4Hkvv6rCecUlwcP2HWLK8rPHKv+5Z6WIm
  xLNyw7bpjuf+y421ZWoxfHlwq39+Q+PH8k83PfKN7LRc4rWlZoZhm5T9fTdHBZcXjwJNsIUcq
  2ZVYijMSDbWYi4oTAftnDMlZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1676879048!163597!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18624 invoked from network); 20 Feb 2023 07:44:08 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:44:08 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 2C758154
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:44:08 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 137EA7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:44:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:44:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zabbix: upgrade 6.2.6 -> 6.2.7
Date: Mon, 20 Feb 2023 15:43:50 +0800
Message-ID: <1676879030-15591-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676879030-15591-1-git-send-email-wangmy@fujitsu.com>
References: <1676879030-15591-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101166

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zabbix/{zabbix_6.2.6.bb => zabbix_6.2.7.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.6.bb => zabbix_6.2.7.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.6.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.2.6.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
index bafde3134..8708852ce 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.6.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.7.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.2/${BPN}-${PV}.tar.gz
     file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "ae40c8cd4b24159466a7483e65f85836a8c963a0bc394a3dd890142aaf30ac17"
+SRC_URI[sha256sum] = "6d423810667b948ed22052d9aa84a035e2d4b92cbe8efdb669cac529806b722d"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.34.1


