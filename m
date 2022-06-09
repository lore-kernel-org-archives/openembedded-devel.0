Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DF4C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:59:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.7960.1654761535086606581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Vdi2wonr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654761533; i=@fujitsu.com;
	bh=kEw+tA4rrXFRc/W6qrcdMkGy8BC+8ZtqeGdas+QlNEk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Vdi2wonrKNoFH+tQbB7dyW1fPqr3f30rSgDJhiBnitb+Q0KJRaTlOwD+iQUoTQ8HE
	 dwTRPy0wS+6U4C7A6Pq0zLnoifcaEi0mftSRSoTyiguC+xbgCBWwMHRlxWQIMefcj2
	 Eiw+gGeu/ojXUTVi9W4vxTgk6R6GSPHcXdG1WztDus9N0mTiBdJusieesMYNww6+VL
	 TN/VweFIWv/0Wz+WbQ8O+3uDlRahkS5kJlEjh8TBEokKJ+HAY8EJeVf+ey4wB53Wde
	 N71jlk1GL36IuYZLklkMvSp6GUqXtn77/GLBq6tqdE8yvsFrWtnw95hrQD98YTrenJ
	 ACH8zzdgr9NYA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8ORqGu7YmG
  Swc90i4uHlzI7MHqc27iCMYAxijUzLym/IoE1o+nXOuaCRxwVn39ENjA2cXQxcnIICTxhlFj5
  I6SLkQvIvsAkMXvtYiaIxG5GiZNrrUBsNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexh
  QV8JC70NTCC2CxA8QMXV4PZvAJOEncbT4P1SggoSEx5+J4ZIi4ocXLmExaIORISB1+8YIaoUZ
  SYfbmZBcKukJgxYxsbhK0mcfXcJuYJjPyzkLTPQtK+gJFpFaN1UlFmekZJbmJmjq6hgYGuoaG
  prrGRrqGFpV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmBAphQr7N3BeHnl
  T71DjJIcTEqivCcXLkwS4kvKT6nMSCzOiC8qzUktPsQow8GhJMG7djlQTrAoNT21Ii0zBxgdM
  GkJDh4lEV7bZUBp3uKCxNzizHSI1ClGXY6ZX9sOMAux5OXnpUqJ884AmSEAUpRRmgc3Ahaplx
  hlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8zaBTOHJzCuB2/QK6AgmoCN+XVkAckRJIkJKqoH
  Jv/uEq/Si7vxba/Q9tv6NXrbBfP9SDtnjEefYZrywUVb4dv7Vbsl4NUWRpUw6/8Qmu/Is/9//
  cd3dqB29id0BN3JnfzV9dCeM+3DeGiaRmUnNjfu6kuebSWzLClFUO9TFIvX24GprFrbXjBsM3
  gZyGkxsdduyR+6b3+Qp5qUpe37PMD5hGrZ53o8Tz76XC77LnqDOuuudi5NGyq25zH9m5Ryac2
  DXJd1YHhXf4qCvKmm7dnieXTHlt2mGclrV1qTST5t2/dI9vV888nXuvakrnZ5siy/ecFqk+tb
  nf5fiLB0+N6zXiDSPTREtvvHJaufPl8/91/wKTOaQ7p2rcsfsvH+X9E8X+TwHZ2fn8ykflFiK
  MxINtZiLihMBV0f84U8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1654761532!51140!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27869 invoked from network); 9 Jun 2022 07:58:53 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:58:53 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9B65E100195
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:58:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8ECEB100189
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:58:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:58:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-waitress: upgrade 2.1.1 -> 2.1.2
Date: Thu, 9 Jun 2022 15:58:29 +0800
Message-ID: <1654761510-29680-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:59:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97461

Remove change of default for clear_untrusted_proxy_headers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-waitress_2.1.1.bb => python3-waitress_2.1.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_2.1.1.bb => python3-waitress_2.1.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb b/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
index b7f809979..061586b5d 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
@@ -10,6 +10,6 @@ RDEPENDS:${PN} += " \
         python3-logging \
 "
 
-SRC_URI[sha256sum] = "e2e60576cf14a1539da79f7b7ee1e79a71e64f366a0b47db54a15e971f57bb16"
+SRC_URI[sha256sum] = "780a4082c5fbc0fde6a2fcfe5e26e6efc1e8f425730863c04085769781f51eba"
 
 inherit python_setuptools_build_meta pypi
-- 
2.25.1


