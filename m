Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE566C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 00:18:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.883.1648513113307745167
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 17:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AuWy0a1w;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648513111; i=@fujitsu.com;
	bh=68Z7Yqw3clPbXnCLZHd5b0KVzV0SzA9twM/0X/uwk2o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AuWy0a1wHcOjOqrrtDTiFBDqcU3CpjrdbM+5i/qRQLYOWfgsfe6fcZeP/rRyRBwsL
	 FOw8pTa0gTPhQmqVXGIEubIWDHQkr4AnPwhZmBxU/Z/E8OFi3IC2Aj0N72Iijatceu
	 3qh7vwN3gzpUcwIhQs6W6WITUSSw3nD0a8W3/ikJROP94xrdLY+6n6mFuR767Dbooq
	 fwK+1SFI7kCELOayRVsijok2cu7O+RwmcSjnUI1lLUpYeJRY+oCMmk4m5YcTFWcuAA
	 /oZod73AoiwvnOBOdZJU7P67686F7ioRTp/QhUCW86JHdhKy45TpoyNgTpNh9hwpjU
	 WloWNb0aP9NKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRWlGSWpSXmKPExsViZ8MRohsW4JR
  kMHuVocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtHx5BxbQS93xcJrZ5kbGGdydTFycQgJzGaS
  uHGviwXC2cMo8frRVMYuRk4ONgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexhQXCJbYfn
  wsWZxFQlXh09yTQIA4OXgEniW9PpEDCEgIKElMevgcr4RUQlDg58wkLxBgJiYMvXjBD1ChKzL
  7czAJhV0jMmtXGNIGRdxaSlllIWhYwMq1itEsqykzPKMlNzMzRNTQw0DU0NNU1M9c1NDPTS6z
  STdRLLdVNTs0rKUoESusllhfrpRYX6xVX5ibnpOjlpZZsYgSGWkqx87IdjO/6fuodYpTkYFIS
  5b2g6ZQkxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3gh9QTrAoNT21Ii0zBxj2MGkJDh4lEd4cb
  6A0b3FBYm5xZjpE6hSjopQ4b4E/UEIAJJFRmgfXBou1S4yyUsK8jAwMDEI8BalFuZklqPKvGM
  U5GJWEeaeCbOfJzCuBm/4KaDET0OK6x44gi0sSEVJSDUz29mc+TrkU/K9twvcjSeGfN798tSj
  vS0+ydoe5ts32LpugfSekF3lvY5iZ6vG2tW7ddP4m655JenP6JIJmtb45xNGV1nKNb4O2KOPU
  3l+tLk9P/rhQHnCDxUuZY/9TQWHnDfXCL6/v2+hf/Ec32UVl9aX5j5bWXpji/07ZiWuSdG2z7
  T5rw/aWSx8fzfxhU2h6RlxuPrvz7kPx+6VWmF7tCthbe8/igc9VJQ6Drpfbe1Zt/PTC/HbIOU
  fe3LtrOxQPlOxM8nl1wv3ord1Pzd9ffcq3dc0xjdNsWx/VpNtf7BNJPtcQdpdh74JjV3Rn3uu
  Lv/mmvqnd7kv3rWvHmqddEfiiky4pOtfqBdeKu9/7lFiKMxINtZiLihMBKZ2z+zADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-545.messagelabs.com!1648513110!85732!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28832 invoked from network); 29 Mar 2022 00:18:30 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 00:18:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22T0IOAQ013208
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:18:30 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 01:18:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-pytest-metadata: upgrade 1.11.0
 -> 2.0.1
Date: Tue, 29 Mar 2022 08:18:11 +0800
Message-ID: <1648513091-20394-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 00:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96246

Changelog from 1.11.0 to 2.0.1:
=========
Fix issues with switching to pyproject.toml
Drop support for python 2.7 and 3.6
Add support for python 3.9 and 3.10
Introduce pyproject.toml
Provide metadata via JSON file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...test-metadata_1.11.0.bb => python3-pytest-metadata_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.11.0.bb => python3-pytest-metadata_2.0.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.1.bb
index 060eee3a5a..35e8b7568f 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.1.bb
@@ -4,7 +4,7 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI[sha256sum] = "71b506d49d34e539cc3cfdb7ce2c5f072bea5c953320002c95968e0238f8ecf1"
+SRC_URI[sha256sum] = "5cdb6aeea8ba9109181cf9f149c8a3ae1430ff7e44506a8f866af8a98ca46301"
 
 PYPI_PACKAGE = "pytest-metadata"
 
-- 
2.25.1


