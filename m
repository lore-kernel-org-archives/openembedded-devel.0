Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED4BC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:09:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.9022.1678352947584477844
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DSZ8r8Up;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678352945; i=@fujitsu.com;
	bh=x9PU0FOSdzbjjjQTa3pnuz+nirnc9obg96g0jduZ/LA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DSZ8r8UpR9O+5GoavSlJ7bEfhSk4Df2hbST0okAhzSG5H1uVzl657JECpMd2m2KDZ
	 LZ/kh671PFaFDCoFOL9gYefea+0V3WCfaLfnAH8ixHs69RssCnzURvROGQjXuCKcJI
	 +OogzZzv6i5/yw80gVJ0ITufOuWQE1k6G8EYkBVHvBsQTFR5CwDbUa7e7x7EE+p2SR
	 04ItD28xi9mIWmsW5gIhvOc+EOvdaly5rIHOpuqABQdmdnSHHKbNgFxzn6WSbI+LQu
	 YOA+EICgLAuvRenaexS2E2Fa5PVwAJsF3qCbl0egjh1ONtlExIwpKj/RDuMMOZCheE
	 qo+BCvMl5RR6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpGu4iDP
  FoH+3gsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHzzDyWgm1cFa3T29gbGPdwdjFycQgJPGSU
  eHhtCTOEc5VJ4sSuh+wQzh5GiecfvrJ2MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQJDFr+1ImEJsFKL595SlGEJtXwEli7oQ9YDUSAgoSUx6+B+vlFHCWuL+9DWy+EFDNgX
  sfWCHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2JUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFqcWlaUW6ZroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgQGb0qx4rEdjP96/+odYpTkYFIS5e1m40wR4kvKT6nMSCzOiC8qzUktPsQow8GhJMG7d
  D5QTrAoNT21Ii0zBxhJMGkJDh4lEd7+2UBp3uKCxNzizHSI1ClGRSlx3lKQPgGQREZpHlwbLH
  ovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmdZ4DNIUnM68EbvoroMVMQIt3beEAWVySiJC
  SamBq+vv/fv5/vXy+OXskGouWS6Zu2llrkvVMIUcm8M7xtGObl0wQdD6Z+bXh8cIds/grJGZy
  3PDLWuY+fWpY5uwViyMv1n54qT91dUT066mrXhn6bi5PSlpsxptrV1qaY3l65+bF5U8u8Szf3
  e7dw2a5bEGFX0ys9pKlS74kxtycPkvI4PN2m4vzW5r8Ou/41WTyarbMCY0o77tvlpXSKarat0
  vZIcHyVYDdskW7xBbvuh8kfnDBu1U7lyw56nnhf/HsR/s2J6of8O0tapl5a+KhS5cnmrDmXyw
  7tHJTgoZQdOTbegPWN3d0eU7xV/eZCVZvblc+vNGNlc1xgYrGgqmpWxblzI4TexRxb+Jn7sgu
  JZbijERDLeai4kQADrQMJVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1678352945!245604!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4104 invoked from network); 9 Mar 2023 09:09:05 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:09:05 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3BADB1B4
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:09:05 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 303A91AE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:09:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:09:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 01/11] python3-alembic: upgrade 1.9.4 -> 1.10.2
Date: Thu, 9 Mar 2023 17:08:33 +0800
Message-ID: <1678352916-32505-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678352916-32505-1-git-send-email-wangmy@fujitsu.com>
References: <1678352916-32505-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101447

From: Wang Mingyu <wangmy@fujitsu.com>

bugfix:
=======
[bug] [ops] Fixed regression where Alembic would not run with older SQLAlchemy 1.3
versions prior to 1.3.24 due to a missing symbol. Workarounds have been
applied for older 1.3 versions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.9.4.bb => python3-alembic_1.10.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.9.4.bb => python3-alembic_1.10.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.9.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.10.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.9.4.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.10.2.bb
index 7f9ac2ec9..3b3c9a546 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.10.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "4d3bd32ecdbb7bbfb48a9fe9e6d6fd6a831a1b59d03e26e292210237373e7db5"
+SRC_URI[sha256sum] = "457eafbdc0769d855c2c92cbafe6b7f319f916c80cf4ed02b8f394f38b51b89d"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


