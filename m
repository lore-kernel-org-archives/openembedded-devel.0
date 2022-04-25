Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273E9C4743E
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.26610.1650871901051831155
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nCatYWv6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871899; i=@fujitsu.com;
	bh=W9Wy4YEAgTYdD4iyAJkjSevEcXk8LACWubny7lcbPFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nCatYWv6AWnfXokb7ch9Misl/Y1fm51WWmbBWLBDcyyF5kfRVQchpIDhC50OGDrYu
	 GQlApGOJ+ifNiLwJ6+ifeQhON9+o5EbZFTPMEZhFqrof5jz5zTBOp8zxlF4k20o5dO
	 9M515qNFIDA+zW2x/ij07ggtxazkYemV0Q/jvjl024oV/+UqPXQHKl1mnDOe967Joq
	 OnbmB+NVrjn24hNFZNG9DmlBUkCjEyfGbpgu7LOw2gfXfbDHWsaPhxVDJJEmMFH5My
	 AVw77P9R3od41r+6CkiKWnPtaAM5N3OxjtJ3H0h/3Ph6lDK3UxlsXrPvJb1Mnrri7X
	 fqA0oMSWCuGmQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqBvll5Z
  k8KLD0uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXi79CZbQQ9XxeUDjWwNjJM5uxg5OYQEnjBK
  XO1W7WLkArIvMEk8+XCSBcLZwyix7vstNpAqNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQXcJZY2bAKLswioSvzY8w2sl1fASeLf9yuMILaEgILElIfvwWo4BZwlLi5/yAZxhZPE3o
  bXLBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsY7ZKKMtMzSnITM3N0DQ0MdA0NTXXNzHQNTU31Eqt0E/VSS3WTU/NKihKB0nqJ5cV6qcXF
  esWVuck5KXp5qSWbGIHBnFLsNHsH446+n3qHGCU5mJREee+ZpCUJ8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuDd7QuUEyxKTU+tSMvMAUYWTFqCg0dJhDfdGyjNW1yQmFucmQ6ROsWoKCXO+94HKC
  EAksgozYNrg0XzJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvOkgU3gy80rgpr8CWswEtPh
  TbSrI4pJEhJRUA9Psr2Wzr7qYdhoELuL8Zb81RcV234R/0wXDpcwFPjncCf/cN3OqovSTmn8m
  7S7Fiw8bBdi+nXj1S+HO+PgrIku4fsTJGWgfNizZycP+7fafvJV1+U+rXqyQWLDyJW/AtGDeI
  /lificvCN36qGohZTs/4duJ68mxRoc4S87bLbvtYr1jq+Yf3UPtQSX3FM9/fdU1b8Ip77UBH0
  PaphrqsNuyH1n4X6/x1zezHZlCv1lzPe2EloWe8rv7lbfB/N/F1xIaHAfCL1ft1Tkd2uk847j
  svHPmC7+H5O0IzDxfJBKTWLP/0m2ha6FlG370/J26o91kp/F3hsPb2+Xs7x1rZwrZv+OX1x8X
  3uIGvlf3oq4psRRnJBpqMRcVJwIALbJlbmEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-532.messagelabs.com!1650871898!131211!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27364 invoked from network); 25 Apr 2022 07:31:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:31:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 43C3C1001A1
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2559B100190
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:31:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] htpdate: upgrade 1.3.3 -> 1.3.4
Date: Mon, 25 Apr 2022 15:31:13 +0800
Message-ID: <1650871876-31392-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650871876-31392-1-git-send-email-wangmy@fujitsu.com>
References: <1650871876-31392-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96770

Changes in 1.3.4
----------------

- fix small memory leak in strdup
- fix free in case of DNS lookup failure
- other minor updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../htpdate/{htpdate_1.3.3.bb => htpdate_1.3.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.3.3.bb => htpdate_1.3.4.bb} (92%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.3.3.bb b/meta-networking/recipes-support/htpdate/htpdate_1.3.4.bb
similarity index 92%
rename from meta-networking/recipes-support/htpdate/htpdate_1.3.3.bb
rename to meta-networking/recipes-support/htpdate/htpdate_1.3.4.bb
index d0cc414a64..d25600645e 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.3.3.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.3.4.bb
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=2b6cdb94bd5349646d7e33f9f501eef7"
 
 SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.gz"
-SRC_URI[sha256sum] = "74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7"
+SRC_URI[sha256sum] = "744f9200cfd3b008a5516c5eb6da727af532255a329126a7b8f49a5623985642"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.25.1


