Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723B4C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 02:16:44 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.28191.1658974602433222853
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 19:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d/tL8r6e;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658974600; i=@fujitsu.com;
	bh=bHwNqd7ht90hKUhiZ8WqoQieYdJQNN+WFc+258iiRZw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=d/tL8r6eIQ2TvR19ZU3dn6uI3IwihkdN08ebaStqV3y1CORE0UV+h0Z62Prg3C5el
	 +El8FZz3bEOfjci70fyUQ4nz4Moza6bot/Xmj/z+mSb4C/E958SUYr1IE/olbvjEer
	 JFeK2GOlU09M9FdzDPYDqPZ4tGvlxtEYLVmcGgrFHQjhDFLrCuL52wFFbjNt3c/iP0
	 /6FSfuBt/ESbjsjA4TjddfkPXcNff0HUJzbMlJt2opdUGcAjSthI7GgxqtG/lc5Ix3
	 rZh0FNX+K+y5IuDBqO7sQTsryyb3sWd4z2CWt/CjgMH9SmZB/NhxrVpH84IaMUxaIJ
	 4K0oKqR8fYEnQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8OxWbf948M
  kg+brehYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bz7RvZC85zVey9sZa5gfEAZxcjF4eQwANG
  ib//T7N1MXICOZeZJC7sSoFI7GGUaG3uZwVJsAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLBAosfHYYjCbRUBVovPsYkYQm1fASeL89BlgcQkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYFRIzZmxjg7DVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TCrKTM8oyU3MzNE1NDD
  QNTQ01TXWtTDTS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMmUYuawHYx/
  en/qHWKU5GBSEuWdufBhkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3k2vgHKCRanpqRVpmTnA+
  IBJS3DwKInwPngLlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDhvxQegIgGQoozSPLgRsF
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYVxBkCk9mXgncpldARzABHbFF4QHIESWJCCm
  pBialphXX2o94tPwvDVVfbavE8HBq+ftHmwqubbCrmpW/dXJ7zjY2yek33sbmVefVlVw+uu+0
  05dzUUt5FJ6rzrf7UXfVhe+22buM7Zfy7vdNmfpn8t31eyLfvfg7peqRQ/xaa6HEw0+tfjQ95
  5vBv3zBmz/TdZmX8NoJK7xJfnb01GSRpRLeG+xNXkQZ/f93OmIZ8/4l/3yOndvNKPVR9/exuo
  QexoSD1i0HvlvOq43eExSts3DH9bAuf6WwjW8YlllLFGxS3Oh5emZ/GGfgATmXnaefSPRWNV3
  kWyU75cH+hh6XTT7sRxuL7khta3/p9uXdm0llT46c2DdXed1tlaaZ/eGhj5dv67E7yyEtIGva
  q8RSnJFoqMVcVJwIAFXIivhQAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1658974599!53362!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28215 invoked from network); 28 Jul 2022 02:16:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Jul 2022 02:16:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 655997B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:16:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 592C175
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:16:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Jul 2022 03:16:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-sh: upgrade 1.14.2 ->
  1.14.3
Date: Thu, 28 Jul 2022 10:16:27 +0800
Message-ID: <1658974589-10681-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 02:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98026

bugfix where Command was not aware of default call args when wrapping the module

Add dependence python3-fcntl

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sh_1.14.2.bb => python3-sh_1.14.3.bb}      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sh_1.14.2.bb => python3-sh_1.14.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_1.14.2.bb b/meta-python/recipes-devtools/python/python3-sh_1.14.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-sh_1.14.2.bb
rename to meta-python/recipes-devtools/python/python3-sh_1.14.3.bb
index f8cecfdfcb..317f648dcd 100644
--- a/meta-python/recipes-devtools/python/python3-sh_1.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_1.14.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "9d7bd0334d494b2a4609fe521b2107438cdb21c0e469ffeeb191489883d6fe0d"
+SRC_URI[sha256sum] = "e4045b6c732d9ce75d571c79f5ac2234edd9ae4f5fa9d59b09705082bdca18c7"
 
 PYPI_PACKAGE = "sh"
 
@@ -19,4 +19,5 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-terminal \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-fcntl \
 "
-- 
2.25.1


