Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDB2C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:53:55 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.16125.1668844427603980731
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FrCROGU+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668844426; i=@fujitsu.com;
	bh=/Am16t9NO/FkIduf7FbG0rpn+KBe4dU3kNLui4jjVPM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FrCROGU+JQt1PNxpjBgguwmPIgMxWmpIwHJv/12Zd1jwBsBTEJJ57NSJkOhe+0Yp+
	 eKxtBelW6r3HsNdItsR98T5hcX6yo6tfuExqRT5VS8TxUPjNT73kef25ORbyJtFPRa
	 HmE3oDTq7Lpe6Ql/kZZL9S8aekRCiGZ8flwRYzJ+ZUqzUa1guo01bzTpq+qKnjtR/e
	 rjanoU3tbPGds4vYJdepXDt0f8LmxqfcYFPhRDhpaqql5iLmNNRZBksedoPy3pUDDM
	 m2S+jUwVzehLNrN279dCBqR6wC63Y1BVmdZJAiSFP9tVNrDvzMWQxKCUFs258vlNPG
	 OdzekQ1WfyVXw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSbejuyL
  Z4NtlI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPJi2tsBfM4K3a/PcLWwHiIo4uRk0NI4Amj
  xLn7ll2MXED2dSaJOW/2skA4exglts9axQpSxSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAt0TH/fdgNouAqsTSjauYQGxeAUeJ/U+7wHolBBQkpjx8D9bLKeAkMW/SN1aIKxwlZt
  /ZwwhRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0aw4tagstUjX0FwvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB4U4oVE3YwHlr2R+8QoyQHk5Io79728mQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rxxbRXJQoJFqempFWmZOcBIgklLcPAoifCK+ACleYsLEnOLM9MhUqcYdTlmfm07wCzEkpefly
  olzvuwA6hIAKQoozQPbgQsqi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubN6gSawpOZVwK
  36RXQEUxAR+Q4l4EcUZKIkJJqYIr9otnKm5QQp27udWXz1rOzA7jz9c6pTj/DW+qwanNLzY5n
  l6d78rT/+X/U9PLDL4uXJxwJuRQdZ6c3j9dTZnXVV+l0E82lq4/vVfN40rRN/b2xyLLkvbPTg
  nvuLNzwudZXqSzv9PP0t53GMeFO8UslnDg+LHBr9Q8rq5WfrDDrxp3vkxTvbhY6lXVnUeFD1g
  2XDev0ZroVhOxN61E7euDzqTyDWaIV0a5nEtOEDRb739BtmPmzX6x4/iJj12dbNbqkP6fdOFh
  0YNb7l0X2qxTeLH2xddUhQ3nbX9sM3O868+XFvxbW1ZeIrZZK1JulJhd39eFBXemWC3MfLjY3
  FpizbPlWthiZ8+oMWldau5VYijMSDbWYi4oTAQavxZdlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-548.messagelabs.com!1668844424!68181!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18047 invoked from network); 19 Nov 2022 07:53:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:53:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 85E141039DA
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:53:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 798E1101B80
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:53:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:53:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.3.2 -> 4.3.3
Date: Sat, 19 Nov 2022 15:53:10 +0800
Message-ID: <1668844391-3117-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668844391-3117-1-git-send-email-wangmy@fujitsu.com>
References: <1668844391-3117-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99638

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.3.2.bb => python3-pymongo_4.3.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.3.2.bb => python3-pymongo_4.3.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.3.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.3.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.3.3.bb
index fa43b7f40..c1bc39a45 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.3.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "95913659d6c5fc714e662533d014836c988cc1561684f07b6a0a8343651afa66"
+SRC_URI[sha256sum] = "34e95ffb0a68bffbc3b437f2d1f25fc916fef3df5cdeed0992da5f42fae9b807"
 
 inherit pypi setuptools3
 
-- 
2.25.1


