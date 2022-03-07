Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC457C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:49:46 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.25481.1646653785787815008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ekt/AFFE;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653784; i=@fujitsu.com;
	bh=91ceQUh8w7fz3hau5SQDKysNLPMx7gr8p++ICMyDiGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ekt/AFFEt7MPImQOKhl4cRY9XPt17E6aOzNNkM1FFgU4J54cqlHfE/DicZk5Pjmqv
	 eM2zlEvFtZWwkB5AtX88910zsSjqTqTbRPh5oHqf32GyaQ9g9xQNFG3X4ODbpRZQ45
	 GcKqkF5z6ZhC+Y9zCoKa312rab3FglBJUtINoKFPeoAnKRqZxqK+3Wiw7VBAmcHpOe
	 1Uq2rZsTq+c8cZjtYaF2nRUce7D+jQ0Ypw8GGs98qRpGT7TVNdsXxmSrulrlagACky
	 G5Cy8btc3VAf2Ynb4OlDCHu7APSjUXSmZl73vPsuK5RV1jP9rFHCU7laGPzvMjDNMC
	 SLngibIhOcPrA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqBv+UTX
  J4M4HbYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNf/1bGgjkCFXdbTzM3MJ7k62Lk4hASeMIo
  8fPwQWYI5wKTRNPzyUwQznFGiV2XL7N1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgK/G+4TETiM0CFG9qWg9kc3DwCjhJbDnqAhKWEFCQmPLwPVgrp4CzxNRL3SwgthBQSe
  /BJrDxvAKCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxitk4oy0zNKchMzc3QNDQx0DQ1NdY3NdQ3NjPQSq3QT9VJLdctTi0t0gdzyYr3U4mK9
  4src5JwUvbzUkk2MwDBOKVZdtINx/6qfeocYJTmYlER5UxaoJgnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4P30BignWJSanlqRlpkDjCmYtAQHj5II7/FLQGne4oLE3OLMdIjUKUZFKXFezg9ACQ
  GQREZpHlwbLI4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmlQaZwpOZVwI3/RXQYiagxVW
  2SiCLSxIRUlINTMEn2NzX2i7p8dy0hG1T/uFdPStenuff7MXuvo5Ftr16f/+qxytPLWDYaWST
  sobfKatVYEZW0T21jYdSPv6c+4X5QMKJqPkdBSvMZ2XtmltpZxL8ayWD9AoDZosTrN1reLyv9
  S+x1LDeOsnussgy87nP4itehTn8/se1Je2S2MMXs6r0d//yCN/Mk8d8qD38YU3z7zaL3dyup8
  +wvr6+O7Ek9YwXj6Xlp6WFmhtXa1r3J/htF7ouGmBekxo8e/EbNcEGp5Som+u4zhYwWjN6ng+
  3jEgpqF9/7rzdNYfdFn+/cH/74+bGKb83t+6rQfvhT/cf/lt1V43D+WmveoejSV+qwK2GaSfr
  PPPTTH4pK7EUZyQaajEXFScCAPgRb1xeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1646653783!125494!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7801 invoked from network); 7 Mar 2022 11:49:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:49:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 504D1100186
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:49:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 43FA4100182
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:49:43 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:49:21 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twisted: upgrade 22.1.0 -> 22.2.0
Date: Mon, 7 Mar 2022 19:49:03 +0800
Message-ID: <1646653744-55920-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653744-55920-1-git-send-email-wangmy@fujitsu.com>
References: <1646653744-55920-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95844

Changelog:
=========
Bugfixes
--------
- twisted.internet.gireactor.PortableGIReactor.simulate and
  twisted.internet.gtk2reactor.PortableGtkReactor.simulate no longer raises
  TypeError when there are no delayed called. This was a regression introduced
  with the migration to Python 3 in which the builtin 'min' function no longer
  accepts 'None' as an argument. (#9660)
- twisted.conch.ssh.transport.SSHTransportBase now disconnects the remote peer
  if the SSH version string is not sent in the first 4096 bytes.
  (#10284, CVE-2022-21716, GHSA-rv6r-3f5q-9rgx)

Improved Documentation
----------------------
- Add type annotations for twisted.web.http.Request.getHeader. (#10270)

Deprecations and Removals
-------------------------
- Support for Python 3.6, which is EoL as of 2021-09-04, has been deprecated. (#10303)

Bugfixes
--------
- _dist.test.test_workertrial now correctly compare strings via assertEqual() and pass on PyPy3 (#10302)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-twisted_22.1.0.bb => python3-twisted_22.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_22.1.0.bb => python3-twisted_22.2.0.bb} (99%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
similarity index 99%
rename from meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index 6af9b6b92..2cf5ccc65 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f8d67f84b6e178c92d471011b2245fc"
 
-SRC_URI[sha256sum] = "b7971ec9805b0f80e1dcb1a3721d7bfad636d5f909de687430ce373979d67b61"
+SRC_URI[sha256sum] = "57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba500b4f2"
 
 PYPI_PACKAGE = "Twisted"
 
-- 
2.25.1


