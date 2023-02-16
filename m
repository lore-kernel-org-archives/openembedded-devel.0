Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BB1C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:33:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.5798.1676536420677008836
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J/iuZaDH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676536418; i=@fujitsu.com;
	bh=KKTX6UEpvTx81iNZEuXfaoquSZuGMwoUKsxt9MBMUXs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=J/iuZaDHjk2dVkXolY3M5dpALkraX+88R2+dezbDv5ecJJoX77ckOGfdqwChBJ9w0
	 OTkLG0f+Nco+vXxOFznhzZEtiuc0LG0VcgeeX7aYBMsEqqshdUaCGk78DH7g1ac1sO
	 w3JzEH+MxqywPQqDMR9LyKnmJQlzWHqtGOXsV097z7dl7Mzodfg/jEQM7GY6121Sld
	 v8pZGyrftovyUqF1VZQZf2o4K+A7CMILKrj85472ezQRZPw7OcGCrXCCpruRVYxYZk
	 cY8MEYth3p/7mMqNHYa7gQFm5TSjwb3QY6wGro9gEsI4nwxsxm6FBc6uDVj8ShPD6X
	 iYY22VDsHHftA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORqJv06m2
  ywYzbPBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bTP9+CY9wVaz7uZGxg3M/VxcjFISTwhFFi
  xt42xi5GTiDnBpPEypflEIm9jBKnuvezgSTYBKQkbtz/D2aLCOhLLJ29hxnEZhZQkXjxu4e9i
  5GdQ1jAXeIVL0iURUBV4si5eewgNq+Ak8Sx73/BbAkBBYkpD98zQ8QFJU7OfMICMUVC4uCLF8
  wQNYoSsy83s0DYlRKtH35B2WoSV89tYp7AyD8LSfssJO0LGJlWMZoVpxaVpRbpWuolFWWmZ5T
  kJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGYUpx8tkdjEf7/uod
  YpTkYFIS5S3WfZssxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3wzOgnGBRanpqRVpmDjAmYNISH
  DxKIryCV4DSvMUFibnFmekQqVOMilLivEtfACUEQBIZpXlwbbA4vMQoKyXMy8jAwCDEU5BalJ
  tZgir/ilGcg1FJmDcaZApPZl4J3PRXQIuZgBYvYAZbXJKIkJJqYBL5/Ffumf+8vpvzX71I48x
  0+hn6sWFC0+3HWxmmztTexPbQZYYCz6S/j6sOd16Z26eiIiKXwb5WRdQ95jc7ayFj2P3G4EL3
  qxcb7nyRvnZAoaFAx6LjlWaB5qXA3zKc4QFzTje335u0Y+ramX86A9vtugWnLN3J+Sottebgx
  cVBogu/l799ZrnlZFBLZbD8km/X11xOkeZr25dYn2O+W0ete0HyzO4MMa2/T3x8Pd4e6j+qcT
  r26UX9ovyFvr3zjlpETihLf5t780JP1QnbxCOfH0vePfQtr1tNce2ZrYlW57/s+JXf5WI0zX6
  GU8xVpzVh59S3/LXPFlm85/9WmyMMl624XV3l9uboOHRttFNiKc5INNRiLipOBACKkbJVPgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-745.messagelabs.com!1676536417!89967!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31740 invoked from network); 16 Feb 2023 08:33:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Feb 2023 08:33:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7E33F100188
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:37 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7B5D1100182
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Feb 2023 08:33:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] htpdate: upgrade 1.3.6 -> 1.3.7
Date: Thu, 16 Feb 2023 16:33:19 +0800
Message-ID: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101090

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- bugfix: wrong default portnumber for proxy was used
- bugfix: https://bugs.launchpad.net/ubuntu/+source/htpdate/+bug/1850740
- improvement: Avoid bouncing between upper/lower limit when (almost) in sync
- improvement: Set SSL server hostname on SSL object

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../htpdate/{htpdate_1.3.6.bb => htpdate_1.3.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.3.6.bb => htpdate_1.3.7.bb} (92%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.3.6.bb b/meta-networking/recipes-support/htpdate/htpdate_1.3.7.bb
similarity index 92%
rename from meta-networking/recipes-support/htpdate/htpdate_1.3.6.bb
rename to meta-networking/recipes-support/htpdate/htpdate_1.3.7.bb
index a4389ce7e..b6dfab085 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.3.6.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.3.7.bb
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=2b6cdb94bd5349646d7e33f9f501eef7"
 
 SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3cdc558ec8e53ef374a42490b2f28c0b23981fa8754a6d7182044707828ad1e9"
+SRC_URI[sha256sum] = "88c52fe475308ee95f560fd7cf68c75bc6e9a6abf56be7fed203a7f762fe7ab2"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.34.1


