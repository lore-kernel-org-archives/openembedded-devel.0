Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CABC3DA7D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:36:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.152375.1672123008111317688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rM2DbP4V;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123008; i=@fujitsu.com;
	bh=9MrdV7Nt9qymd7Zn7kLGv3vYDFT+UgQh6pzByu3sozw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rM2DbP4VqflZD/tsvZkhjo6Ra4V1w7ztlzM3qPb9rFRO6twcogVljmsYa6hz6T1Se
	 8wD5m9wWtmkKOek/1m9rnB1PJo3pEtpwxZ0CmxAvj3HdCHqf9mthk6q7+nNfYs9sDs
	 8xK0TMJqvfhcT/8k5psNlbfWXytudOBLrBUaFoAVSsYnQq49BuDgGjOezmHn13WnUz
	 9DqeIXaKJ9ifZhI1DlkbRXnZEg7XnAvv5rA5TQmD+YTz78WyrRf2ORMM8pKSp8N/aU
	 i9qd2+7KhYgTNHxhJUvoQrlF3CrWTq7E1XxO1N14xsV+Qw7MK/jKns/ZZW4KyJnt8m
	 shhYkaV6Ye87w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqFs/aVW
  ywanl2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8akiz+ZC85yViz+voSpgfEBRxcjF4eQwBNG
  idXHLzNDONeZJHrP7WCBcPYwSuydsJmxi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBL4nFx5+A2SwCqhJPD3Yxgdi8Ak4SZ34tA7MlBBQkpjx8D9bLKeAssfLlHyCbA2iZk8
  T6JRkQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOwKiVmz2qBGqklcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFacWlSWWqRrppdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi8KcVJnDsY5yz7o3eIUZKDSUmUV6p7VbIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d7LIDnBotT01Iq0zBxgJMGkJTh4lEQgWnmLCxJzizPTIVKnGBWlxHk7JwIlBEASGaV5cG2w6L
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXHWQ8T2ZeCdz0V0CLmYAWfzi0EmRxSSJCSqq
  BSfHT/6R25VuWeRdiL74I7zol9fqeHkfS5F5Dq7eXlvBnvlB7cF0+5c7pi9aJ/lpZnD76rfrJ
  VyYterj6uufLidJuyZJt0ZFLbke3Pm/fobRbbFW8JcvSLQ5XmFf9XGH57WjuFMHpk9K2Td9v+
  6/x3q+44MiXstyZ367fOCDyLOdSyOkM9guhUguntwUoXhN3md+UcNE3Zeap0wtFb0lsDPjjfr
  KQg8HqylXP/7nGQnI+hh2L36Xw27ilNto8Dkj4r2mzNuPitHdb9m5d4v7wcNw+jif7sjO33yi
  +I7iywK0svODs1qDq99bfl1S1B5vrTVTwz9K0e5nO69G1d7r5nwO3si07ezQ4HLKbHXW7lViK
  MxINtZiLihMBZu8Y5FkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-728.messagelabs.com!1672123007!306040!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27557 invoked from network); 27 Dec 2022 06:36:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:36:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 26886100192
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:47 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1A8C0100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:36:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libmime-types-perl: upgrade 2.22 -> 2.23
Date: Tue, 27 Dec 2022 14:36:04 +0800
Message-ID: <1672122966-31746-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672122966-31746-1-git-send-email-wangmy@fujitsu.com>
References: <1672122966-31746-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100257

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmime-types-perl_2.22.bb => libmime-types-perl_2.23.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.22.bb => libmime-types-perl_2.23.bb} (93%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.22.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.23.bb
similarity index 93%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.22.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.23.bb
index 5f5c4958d..8bf383014 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.22.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.23.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "c2545eb30b094e942860ff8444f0f6cb54641caa8f7d386aaa2d925da4b02400"
+SRC_URI[sha256sum] = "a28df6319a3e8c5ce117fbe5dcdad0bc9eae8eef65c1a0a2f0c00e00e77d7e30"
 
 S = "${WORKDIR}/MIME-Types-${PV}"
 
-- 
2.25.1


