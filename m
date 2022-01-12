Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7788C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 09:36:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.21215.1641980212742162977
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 01:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eTmdOlc9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641980210; i=@fujitsu.com;
	bh=s+wHxwueXkttYJ1j/pBt+jhWMhwpANarzQhGFfsqqvs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eTmdOlc9PiO6NnumASDArVXTsKXZoRsfa3FhmgGdJ0BrPUgLN9RKRMgV0vFPhO/Zp
	 jPaQmYQY8u/PQYjGebpoxvxhmheLF9KnMONFP/DPBzLWA4/FKm9YQeUGp7vUor4zQB
	 Sv/T2qJ+r2QqKiM5vYntn7/6SxcmeU3qIz+q3l9WkTV9qFRDIhkZG6jkMCugg7t8hD
	 DqibPy8TEBgRzTaIw2qGvzTD5ELfiLihDKAjvRiOK2OrAvcB26XmW3YTGTxbmi3M/d
	 QM3I5NrShEBqPlJEE91oSS1b/d9qoiu/hE40RUl+4vvMNJzrIhH3BvuARwbJ9j9ALn
	 tBWA1R5hhHscA==
Received: from [100.115.37.212] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 23/AE-28974-231AED16;
 Wed, 12 Jan 2022 09:36:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqGu08F6
  iwfStPBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b0RpOCl1wVCz4XNzA2cHUxcnEICTxhlFh5
  bx8LhHOBSeLK/j+MXYycQM5JRolHR7NAbDYBdYnHN1+DxUUE9CWWzt7DDGIzC6hKdF9cww5iC
  wv4SnTsm8MEYrMAxX8f3ApWwyvgLrGtfRtYXEJAQWLKw/dQcUGJkzOfsEDMkZA4+OIFM0SNks
  SJFR+h6iskXh++BBVXk7h6bhPzBEb+WUjaZyFpX8DItIrROqkoMz2jJDcxM0fX0MBA19DQVNf
  YUtfIwEAvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwJFOK1U/sYHy68qfe
  IUZJDiYlUd6c3nuJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4o+YD5QSLUtNTK9Iyc4DxAZOW4
  OBREuHNmwuU5i0uSMwtzkyHSJ1iVJQS5z0C0icAksgozYNrg8XkJUZZKWFeRgYGBiGegtSi3M
  wSVPlXjOIcjErCvNELgKbwZOaVwE1/BbSYCWhxMsdtkMUliQgpqQYmUSml6pAthQETHFxtru/
  yuLRu1TZnW5a/XJLHelrfnBHyWH9OIVko52zPE/+LB7hqHBkNZqfN8wq8+P+6wPN/prs21TKf
  O7Mz6F/n+ke3H5gteflud4eWWdzGKa+sdc9WiC9k/LniZHv+whlz58aa/2duz+bq5f08WeadU
  d52nwvvT+b9zrPjeBl7X0bwqUG02eGWuhgra+W9HEtPMnC7L+BWe9Rz6+K+tMqctn4ZrjhHaf
  nv9dbdmle0m3fsPXJl+8F776/v/HwrqFHi1vYL0wIrV8+O/9A698PFXyd2zDqymVFMborpxi3
  bgzVmZLa8PJPBL/11EW+8h8Rj2ZydN7Zra7jZPa55NZu/aTmnrBJLcUaioRZzUXEiAMfYyKdE
  AwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1641980210!8359!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16760 invoked from network); 12 Jan 2022 09:36:50 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jan 2022 09:36:50 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CBE5D100196
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:36:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BF80D100182
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:36:49 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 09:36:32 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 3.19.0 ->3.19.3
Date: Wed, 12 Jan 2022 17:36:20 +0800
Message-ID: <1641980182-11598-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 09:36:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94785

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
==================================================================
  * Fix missing Windows wheel for Python 3.10 on PyPI

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-protobuf_3.19.0.bb => python3-protobuf_3.19.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.19.0.bb => python3-protobuf_3.19.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.19.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.19.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.19.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.19.3.bb
index 4ef51c6c20..5e0ee7cb26 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.19.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6a1dc6584d24ef86f5b104bcad64fa0fe06ed36e5687f426e0445d363a041d18"
+SRC_URI[sha256sum] = "d975a6314fbf5c524d4981e24294739216b5fb81ef3c14b86fb4b045d6690907"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


