Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83CEC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 07:03:04 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.5908.1634194983105427830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 00:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kg1AZOPn;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634194980; i=@fujitsu.com;
	bh=7X2PMzxy3M2XWoR8Pll9kusj+1/7UQ8M9TB217p9C1U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kg1AZOPnfPjyJOjd+4GckZKirMisBdBXboMlIklzHy6HjxPIo0OhpxQyTtbUwVTlc
	 kQrjV2Hl1kXZaoxZqZCMinp/jIHs9eft0DBKZzI7LWanZZNw972iM9qmmOsn9eJtwZ
	 Kq+FEeFra4wgcW9oU6yncEE8iayKiqRr3e+Hag/qNf6qoY8nK2YzcqRv1S+ErkSt78
	 32Xf22lyrHmJH8ManX7HZ50rhkv9FOQFE+y2s7yMqMSmZEw648DlJSFGyvsYX6mQSX
	 4j/QcFjaA7k9xb+3deb0qVQiEpc9seLpaZCcPLKhCkrhxfDbMvLXgOwgelg4fj50ad
	 ibAIRpKPEpKyg==
Received: from [100.113.3.109] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 1C/60-15394-426D7616;
 Thu, 14 Oct 2021 07:03:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYqqtyLT3
  RYO8UVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePkpussBc84Kr4uuMLawNjE0cXIxSEkMJtJ
  YsHW08wQzglGiVUXpjB1MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC9hLvL41kRXEZhFQlXiy7
  TBYDa+Am8TBE5vZQGwJAQWJKQ/fM0PEBSVOznwCVsMsICFx8MULZogaRYntO8+wQNgVEq8PX2
  KewMgzC0nLLCQtCxiZVjFaJhVlpmeU5CZm5ugaGhjoGhoa6xrqGhmY6yVW6SbqpZbqJqfmlRQ
  lAmX1EsuL9Yorc5NzUvTyUks2MQJDKaWQ8fwOxqlvPugdYpTkYFIS5d13Lj1RiC8pP6UyI7E4
  I76oNCe1+BCjDAeHkgSv4UWgnGBRanpqRVpmDjCsYdISHDxKIrxGV4DSvMUFibnFmekQqVOMi
  lLivD0gCQGQREZpHlwbLJYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmPQgyhSczrwRu+i
  ugxUxAiwOjUkAWlyQipKQamBivn5nz6tD/PwYdzUpaRzO8Krb90NoiV77CJpurtVN9TtnNrLd
  /eI1Yk7aaCjP4+C86l2EWbfj3yUnW63P0doVIWpSa3yq/WjR1w7LjHRyJSrInuX4v7DJUXKrC
  26vs7PL5cua7je6CN7Iuai8Ufah2YPK0J8IRvg8eZXd/Dfl2JrLYx3bmvCk5S+sZTY5JyrwQW
  y6g8P673LVHpo4Fyw+dsaxLc1xSXHazK/6m6ku99HPynhMSoyutDLxs5668/ubm6b+bGTXfqo
  k6bs93n2d1J7jr4ivmhbWHFE1aH9afCW/j7Yqt0u1YMFuUSyH5vXi/4fwJGidE2W2en18ZtCx
  sspSES3f6D/4fCcwJSizFGYmGWsxFxYkAZ0rVqSADAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-226.messagelabs.com!1634194979!82528!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3192 invoked from network); 14 Oct 2021 07:03:00 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-13.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 07:03:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19E72sW3017988
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 08:02:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 08:02:53 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.3 -> 4.3.4
Date: Fri, 15 Oct 2021 03:02:47 +0800
Message-ID: <1634238167-4971-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 07:03:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93286

Fix a few minor annoyances.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.3.bb => ser2net_4.3.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.3.bb => ser2net_4.3.4.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.3.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.4.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.3.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.4.bb
index 87b5b15b75..fcd2546472 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.4.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "f5be52033a690bd0dd711209a64ebaec024ee4542b1357350aad8489dc2bf720"
+SRC_URI[sha256sum] = "c714d6777849100b2ca3f216d1cfc36d4573639ececc91d5c7809dfe27c8428e"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1


