Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8127AC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 02:02:13 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.26186.1641780131877488338
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jan 2022 18:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UDm+d3Rd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641780130; i=@fujitsu.com;
	bh=sMphX1ZkFD3+KG5drX1JDkWeNCFKQuy4h+FEfxtojCY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UDm+d3RdkDzgCDQOsovDM+eruW7/4EzgpQtNHZcW9EyCGYED0AXzSIJ92g1d4pURn
	 VZCOFzdmcZp8OjNguHxFgK+vkl51i6Vb2h0Hsu96sO3JbrNnpxL1xqpprp3Umi+yFN
	 LeozBHL8XLunw/ndYuNkyBTDHhNYgX6KOkTEVi9b9+ZOlN16JxCALjk1c6ase8cN7k
	 WloK7w7ct6DairJwSmG0KiQbi9pzN8B2eLl5Mr7YcE1CnbXVNmERhlqTELWR5lrGiD
	 mKD8N39Asu78k0NbKTqthh0AnYq0QkT8xZMzI1zdN9RQz4ITX2uN8tw0puv+s92IzW
	 3EQm4a+yUBoGQ==
Received: from [100.115.65.216] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 51/9B-06990-1A39BD16; Mon, 10 Jan 2022 02:02:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8MxRXfh5Nu
  JBsuXy1pcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBmLHhxhLWjnqtj1IbeB8RdHFyMXh5DATCaJ
  hveTGSGcE4wSt95dZuti5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8edhBbWMBVYsHCF
  2D1LAKqEltn9YPV8Ao4SfQcesIIYksIKEhMefgeKi4ocXLmExaIORISB1+8YIaoUZSYfbmZBc
  KukJg1q41pAiPvLCQts5C0LGBkWsVol1SUmZ5RkpuYmaNraGCga2hoqmtmpmtoaqqXWKWbqJd
  aqpucmldSlAiU1kssL9ZLLS7WK67MTc5J0ctLLdnECAy1lGKn2TsYd/T91DvEKMnBpCTKW///
  RqIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV6BibcThQSLUtNTK9Iyc4BhD5OW4OBREuH93AeU5
  i0uSMwtzkyHSJ1ijOV4s3bJImaOt2Cy7d5dINkOJmcuOLiamWMWmLzffghIPgCTr1t+7mAWYs
  nLz0uVEud9AbJTAGRoRmke3EpYjF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMx7YxLQFJ7
  MvBK4y14BHc0EdHQyB9jRJYkIKakGpviCgxvtOxad8VzcHf7H4uz9XXfUuG8Y7Nxyco7Y15vu
  M/L9XTdxpG86YVYgzZOlFenfeL7pQJTSq9D44BvKEyR+bPB1mhdkc2bHfkPjSNsUwSuvPm9py
  w5dFVXh3/TwweUna5vN/rlYRDfNNHGTsD7OtVnxwdepc/XLZ64LOZd4crGLS05tyGTeRTqunS
  pZh342FZRN8YmcePNsJP879tCs+7bVIr/ZjnTyZ0mKvI9UtriWYHdvujfX5quNwdvT38yY+mH
  XF4Hyz45XWZnUzkmwf49aNCFvqtkvxqbz+bnLdlxbmfKgSfeo6sEnpnbtcwUexvyYzXLH+8IH
  u49p/W+S+o7fOhTnEHTZcgL/GyWW4oxEQy3mouJEAAr7oS1sAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-528.messagelabs.com!1641780129!148871!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29849 invoked from network); 10 Jan 2022 02:02:09 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-19.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 02:02:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20A222or031693
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 02:02:09 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 02:02:00 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] dnfdragora: upgrade 1.1.2 -> 2.1.2
Date: Mon, 10 Jan 2022 10:01:52 +0800
Message-ID: <1641780112-61178-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 02:02:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94707

Changelog:
Bugs fixed for this release <https://github.com/manatools/dnfdragora/issues/#####>
=========
Fixed wrong access to manatools.service module (issue #202)
Fixed issue #189 "No line break to fit the width of the window in dnfdragora"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnfdragora/{dnfdragora_git.bb => dnfdragora_2.1.2.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/dnfdragora/{dnfdragora_git.bb => dnfdragora_2.1.2.bb} (94%)

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
similarity index 94%
rename from meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
rename to meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
index fdc164d56..c32165150 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
@@ -9,8 +9,7 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=master;protocol=http
            file://0001-To-fix-error-when-do_package.patch \
            "
 
-PV = "1.1.2+git${SRCPV}"
-SRCREV = "19e123132cfd4efd860e5204261c3c228bfe80a8"
+SRCREV = "5cbbc07c9d015af284a424a172a379b385f05b6f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


