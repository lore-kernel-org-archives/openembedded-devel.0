Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336E8C48BCD
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.26465.1650872194934979684
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QHYx1BuS;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872193; i=@fujitsu.com;
	bh=8DIwuozxUfOD/EVCi8c0xVLeFymIIeYvNISX1EnMQfE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QHYx1BuSdT/KPeRsL+L8JTZMvlvkB6wATOXQlg8AKahelooPPMWKnxjORF6VLVpq+
	 1i++IgeHiV4rFRv2CTXvd3hgtULHa5LhlmwqArUhKC/hcjwzHHYhN5EUuiRbxB6RS1
	 CRkv3+ERC5FuHGjTBwHGyiu+JxMSXNlgPm9TvNvXkySR9Y87tdoNgXdsyPQVNpCH43
	 Bl8h03p1XyxwaC7d/YJBUzaZbQLyW04/5dr0ZIhiF1KFAoOKx4ZA2QiSvw5fpQE4Y1
	 Da1dg3nRG6cJ/uS6FBFsy1+ekrsxiNYsdNOlgxWa7mrsE+68eMw/EGHWIFMDfA2P6h
	 APZVdFlivtsfA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxRbfBPy3
  J4MgCA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePpjw2sBS0cFVPWdrA1MC5l72Lk4hASmM0k
  sWX5YmYIZw+jxPeZj4AcTg42ATWJ6bdusILYIgL6Ektn7wGLMwuoSLz43QPUzcEhLOAh0b7QA
  STMIqAqseh2A1g5r4CTxIXTr9lAbAkBBYkpD9+DtXIKOEs8ePGFCcQWAqqZfOcJC0S9oMTJmR
  A2s4CExMEXL5ghehUlZl9uZoGwKyRmzWpjmsDIPwtJyywkLQsYmVYxWicVZaZnlOQmZuboGho
  Y6BoamuoaWwCZlnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIFBmVKslruD
  ccrKn3qHGCU5mJREee+ZpCUJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDd7QuUEyxKTU+tSMvMA
  UYITFqCg0dJhDfdGyjNW1yQmFucmQ6ROsWoy3H1ypW9zEIsefl5qVLivHf9gIoEQIoySvPgRs
  Ci9RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd50H6ApPJl5JXCbXgEdwQR0xKfaVJAjShI
  RUlINTNv2lZXM/hCynGfP8c65RRtd2uaUS13/H7K6vezJ1QvzfRMn3fB496Kzu+hcVqZ6X/4P
  H+N9k76ZeB5gfLZr3obGpgLZ3yxLFn49qFgbcGTTat3y8m+PNkzb/ehM7BlPYXPFhqtBhwvCN
  qgp9EmZFTzccD3Cn+md+tqLfrYblX4Yqne2qZUoTk7Z/XHnzLA30YZTle2bp209Nu9C61x2/n
  mZqe2/WC4K+nE88JWPD+YRj5/B3/g+P0T5Us2NXKGuL8Krpn+t+O7CP9/U5vJOObFwcVlV/s7
  Lwcev7Tgo6qqq89XHfY+QwxW9xqVTJ1/rTuKrNLh09CT3XOt5NU/ue2tFxb/ueBNbqux1z/vo
  XyWW4oxEQy3mouJEAPJ12zRRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1650872192!70078!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16600 invoked from network); 25 Apr 2022 07:36:32 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:36:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23P7aNcK007665
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:36:32 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:36:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.30.2 -> 1.31.1
Date: Mon, 25 Apr 2022 15:36:15 +0800
Message-ID: <1650872176-31497-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650872176-31497-1-git-send-email-wangmy@fujitsu.com>
References: <1650872176-31497-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96772

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.30.2.bb => nbdkit_1.31.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.30.2.bb => nbdkit_1.31.1.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.1.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.1.bb
index da24b1efd6..1fea2f5935 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.30.2.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
 
-SRCREV = "b59380e061fdf0f114c13c226ea2a508f2c067d0"
+SRCREV = "ff4bc950c336477de1765ab1f0826c199f013ffd"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


