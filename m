Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A068C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:07:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.8961.1678889253880141783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ewfbBBn1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889252; i=@fujitsu.com;
	bh=A6gpHJIeJ7IZN8oXJW6jvjo5vy33mwU00E3ozfl413o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ewfbBBn1yMQn7MZfgWp49hGIsgDJvr4fu72O+IWWvGq4xj+2Aeegv7LRrSfKYVW+V
	 +JYy8xqLDArXUFfj+oYFabGcx7CTJjO29eNpyO/duM300SUgD4Lw5OFuZxgmBIk4ql
	 1cW5rJf+nPY9zu8U5igKHToejDFF/uZ2rVqRV16fDyViLQ8OvrEg5cwV+sQqnWWrP3
	 eVm9BRQCUOPcxUdrYUrRrPPer/sXq3bKpGQB1jviy+0oJvEQwmYNBy8UaKAZc6o4l4
	 uZsc+KMBk4mpRVv8DWuvZQAfxe92xEFXTZHpd3pG19sIW/BPmEiDkdRqYkVskGZ/3g
	 /m+2GSEZS15Wg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqKt8UTD
  FYMMxTYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePYii3MBcu5Kq4ues7ewLiNs4uRi0NI4Amj
  xJ6PqxghnOtMEuuu32SHcPYwSky5fYqti5GTg01ASuLG/f9gtoiAvsTS2XuYQWxmARWJF7972
  EFsYQEfiRlvDoLZLAKqEm+enwGzeQWcJHbvv8cCYksIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25Gaq+QqJx+iEmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbT4tSistQiXXO9pKLM9Iy
  S3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMBgTClmereDcXnfX71D
  jJIcTEqivH/WCKQI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuD9d0YwRUiwKDU9tSItMwcYGTBpC
  Q4eJRHe1PNAad7igsTc4sx0iNQpRkUpcd6/IAkBkERGaR5cGywaLzHKSgnzMjIwMAjxFKQW5W
  aWoMq/YhTnYFQS5l0Gsp0nM68EbvoroMVMQIt55wmALC5JREhJNTAJPt3f9P/6Ea2IqV63Q65
  +cn3944WbYLyyrZ6Afv6qSQWfg37/ddA67zTt+S73p9Ic9h6br3/k9zDI2HrrXoQKj8Zt33z+
  Q04x3wTTNm2Uq5lkWVjtvz1WmllUmzHi/6Rdx6w6uKXP/1Vj7tgS5aFsrXL9W+u5vf23xVztD
  rlp69hHLTdULsp2t+H5seP+rdmXLOz8b1vEbPySvI1falcxZ6dsyb3fbmbz9j1csCnE/kuhpk
  RU7mQdy8qojEeOkcuOLt7rZltrqaG2U6uvy2+C0fdbAtxMthqF+3auzlC2vzJhxu2+0K07va/
  X6V3IOXNjp5aKQTd7lYTmx4JVZ/JDp7VPEjh+Kkmh7s17TiWW4oxEQy3mouJEAKHagrFBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1678889251!71233!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5840 invoked from network); 15 Mar 2023 14:07:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:07:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4B9761001A5
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:31 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3FBAE1001A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:07:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-openpyxl: upgrade 3.1.1 -> 3.1.2
Date: Wed, 15 Mar 2023 22:07:14 +0800
Message-ID: <1678889238-20738-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101548

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 #1963 Cannot read worksheets in read-only mode with locally scoped definitions
 #1974 Empty custom properties cause invalid files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-openpyxl_3.1.1.bb => python3-openpyxl_3.1.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.1.1.bb => python3-openpyxl_3.1.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.1.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb
index a0a4b6dc9..a88921061 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.1.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f06d44e2c973781068bce5ecf860a09bcdb1c7f5ce1facd5e9aa82c92c93ae72"
+SRC_URI[sha256sum] = "a6f5977418eff3b2d5500d54d9db50c8277a368436f4e4f8ddb1be3422870184"
 
 RDEPENDS:${PN} += "\
 	${PYTHON_PN}-compression \
-- 
2.34.1


