Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFB5C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:13:23 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.48567.1671538401342467266
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=efulLURw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538399; i=@fujitsu.com;
	bh=1Megm2RN0xEQNSlB+FgWl/b5dBOCWnS61HSwJT5OxzU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=efulLURwlRIuA8tV7EhbKf1pTPXfE9AzDjSenxo0KZbCs74PiL8rXcI2X0/GVUSXg
	 Zo7jSWNgD9z8YSojjGOsrbEzxR8B3EdL3dzYhpCM/e+ep4RLdIt1K3iYFT0NU3mbeL
	 kUxf8m/B5exlpTfueKJNnAMiuf/MKo3wljbzpKBN18xxjdrGSjaRxx/xXCNaXAyd3n
	 bzeDqEx0g2KvId1j0k4gdrrUSYet70r2zT2DnBaYCFEZ7ybDdOhpLm2weOlQNZv6TK
	 3R5nRaCnzwQH0sMOGH2ECbe69Irbg8/DQ7HEvG+6p0cudKV80KWMBxbUe0kG5rt/2w
	 nBUlH/mZWxMCA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8ORpHtv2cJ
  kg43nDC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy1nw4zFlzjqLj0ZCZ7A+Nf9i5GLg4hgYeM
  ElPvzGGGcK4wSbyZ+Yeli5ETyNnDKNH5VQnEZhOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAX+L+m9VgNouAqsSqy3PBangFHCVuTFoFFpcQUJCY8vA9VFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNZcWpRWWqRrpleUlFmekZ
  JbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgMKYUJ3HuYJyz7I/e
  IUZJDiYlUd6w8IXJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4ZywCygkWpaanVqRl5gAjAyYtw
  cGjJMLbMxsozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd7mpUBFAiBFGaV5cCNgUXqJUV
  ZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvF8gUnsy8ErhNr4COYAI64tCluSBHlCQipKQamPR
  9tOQq4gXfifpcPCDqUXwlvL5vtiSPklNi5FK+pwE7wr4Ibf3MeadI3/3TB2ZWh/aN3tdCF1Rm
  2MsKFNsYHYl/MpVbsvpF8R5PV+NTt18GnI1WzxFi993UXMhSy+A0++TVCW/E7mTst9sbpzBps
  oFQxGOxQ/6vs4oj1Bhesn7XCAq3kSj7nLb9h8OBA14KM95oTPk1N3Fyfo3O0pIGK71/5p6Vt2
  0ct54RTVG9ck359zf98+cmWG15/uaC220hLbtJ6+eJpv0wDW2Y4OQ6L/z0vnU1yxo2cj07fO+
  /1781nz9vf76ALc/x3hKL71+VhT6c3bH/qmPTXrnDUu5HJJrnPfYQZHh7uZHFc+OhpUosxRmJ
  hlrMRcWJAMIZfOBNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-745.messagelabs.com!1671538398!380542!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27971 invoked from network); 20 Dec 2022 12:13:18 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:13:18 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 426861B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 374E31AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:13:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20221204.0 -> 6.0.20221218.0
Date: Tue, 20 Dec 2022 20:12:39 +0800
Message-ID: <1671538363-7066-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100130

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20221204.0.bb => ctags_6.0.20221218.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221204.0.bb => ctags_6.0.20221218.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221204.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20221218.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221204.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20221218.0.bb
index a3720b56c..84ba97cc0 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221204.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20221218.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "60cc214ba5f24feb6921087389fe1c53e241aba9"
+SRCREV = "3af413544a0ed0a4c52200894cfd6391f06d2e94"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


