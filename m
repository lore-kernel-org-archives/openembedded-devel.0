Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDB4C6FA9E
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:10:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.7010.1677928240931028857
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JApKhqa2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928239; i=@fujitsu.com;
	bh=LkLlribwzjNJ/ukw+1TyR0P0AJWUJzOtU/mi+g4eBfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JApKhqa2cycR/Nf19Wgq8I2d5v8TGhpv7GAmVVrlF45evrHh8LWw8pEZQHgp5/bVQ
	 ia3Mlu/GBnUF9udO60hzWl6frWe5zGXRXy1SNWn1qY+HMKSCvdiLGlnHY3rGF8cycM
	 sVWrgk2W5sZlXDZZfemcwvNjIVVnMNZ9d8w04gm/rlRQUdDjOIKZpe2buCx0C4jEHN
	 f+5REcnkk1qInHhnkOzaqIiQVpgy1zkpaLeEma6Tmajx6KUsnHkF+/vY9y7/lYIRGL
	 k8SS1ELXvpIXibjzhfsdWGi+7G43o7sRzh9DNlTNWIT7cV9q1MQL4ZpwIId5J3+1k4
	 2InHN+3YWoIMg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSVdPnTn
  FoOcYn8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFk9xSWgq2cFZfvPWdtYLzH0cXIxSEk8IRR
  Yv7EhcxdjJxAzg0mifNrnSESexglnr5vZwJJsAlISdy4/58NxBYR0JdYOnsPWAOzgIrEi9897
  CC2sICfxLM3SxlBbBag+L9zW8HqeQWcJN61HGQFsSUEFCSmPHwP1ssp4Cxx9ugJVojFThJzll
  1jgagXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka6mXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvCnFyWd3MB7t+6t3iFGSg0lJlHcSK0OKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQleG
  VXmFCHBotT01Iq0zBxgJMGkJTh4lER4t4gApXmLCxJzizPTIVKnGBWlxHkFlIESAiCJjNI8uD
  ZY9F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7RQVoCk9mXgnc9FdAi5mAFmucZgBZXJK
  IkJJqYJq26/OOGb9yPrsc4IiIduCoP+iTYFG3w2/15cBPz3fZl26cIM/EsoW1Qsrn8c5oteVc
  Wx8cXvqD6diPLTx6v+L++JgXSy660WHxJGU3b6hJkhPD6p/mbYHHuRpWSgXYTgg/WX/JuunI+
  ySbkgPzJW8nH7kaPdWRfzcna7VFiPapaXE9CSX8qVM6bWY6dNcpXb/d0/Jnp2FfqZvVujMOUz
  rrk1hmeBR82r173abSHoUGhVkX+KdZvy8RzU5+bbqtW8isfUGuqlkF78fddn5PTz+baMK3mzk
  l8JvSvvht96YUHg/XNM7bbXZ765QglkxF6YXRrnd86n71VEYst7FtYxBb0Z93SHLGf3bWLZqP
  lFiKMxINtZiLihMBillRLFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-728.messagelabs.com!1677928237!137498!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1631 invoked from network); 4 Mar 2023 11:10:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:10:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9BFC21000D2
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:37 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 906221000F5
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:10:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:10:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-nocaselist: Upgrade 1.1.0 -> 1.1.1
Date: Sat, 4 Mar 2023 19:10:20 +0800
Message-ID: <1677928222-23049-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928222-23049-1-git-send-email-wangmy@fujitsu.com>
References: <1677928222-23049-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101373

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocaselist_1.1.0.bb => python3-nocaselist_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_1.1.0.bb => python3-nocaselist_1.1.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.1.0.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.1.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-nocaselist_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_1.1.1.bb
index 4b93ca98f..89a44ea53 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a99384abc700c409e9def7143763e18dfad332fdff7e30fae1f6d1a30b372772"
+SRC_URI[sha256sum] = "5272b232e08246696ab26fe0ebbd28b8989dac9ee5732b50264950323b513d23"
 
 inherit pypi setuptools3
 
-- 
2.34.1


