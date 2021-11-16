Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9041C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:36:18 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.5198.1637033777103532063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uqZW7uvt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637033775; i=@fujitsu.com;
	bh=VBBliI5BO/nA0IwG0bsBg0fexjRm4bdutp9Xcrd+n+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uqZW7uvtMgM2D19Tto2Vb7/3+9/Bo3ABYEPsclSl/7kP7uUH8PlfdbdcpGInlgPem
	 lgC7PoNQkRYDOuy8j2R5BVulSdqtKwlkwzln4ZQSrcg43OL2WtSoeHK2RQdJVxkOET
	 +Hy7VypO7pYyK71qCBbLrZwKNxqs1w0kae6UhbXhXaSrecB99s631B9ugqjrJ/nD2F
	 mLwgCXtPvD6NCK9QTs3dzhqfFd+juXMd6IweP8uw99YEgZ4RsXmDg8CuIvEhl+uLVE
	 HaonsV8IXsrLTAU6d6CV/GvSgrbixO+aEWbFEAkS7r7sDv5AKXcCHJxHr1Gule1KFV
	 OcnjoutLQ2zBA==
Received: from [100.113.2.75] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id A3/49-29929-E2723916;
 Tue, 16 Nov 2021 03:36:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRVdPfXK
  iwd71qhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b5HYsYC7ZwVszYMpO1gfEMRxcjF4eQwEwm
  iYMz21khnBOMEht7ljJ3MXJysAmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8edhBbWMBbYmfLF
  jCbRUBVomNZC1g9r4CTxNEZX8HiEgIKElMevgfr5RRwlti8cAETiC0EVHNz2UxGiHpBiZMzn7
  BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MExj5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBxdQwM
  DXUNDY10jXVNDvcQq3US91FLd5NS8kqJEoKReYnmxXnFlbnJOil5easkmRmBAphQyGe9gvPb6
  g94hRkkOJiVR3rhFkxKF+JLyUyozEosz4otKc1KLDzHKcHAoSfA+UpmcKCRYlJqeWpGWmQOMD
  pi0BAePkgivnCJQmre4IDG3ODMdInWKUVFKnPexCFBCACSRUZoH1waLyEuMslLCvIwMDAxCPA
  WpRbmZJajyrxjFORiVhHnnqwJN4cnMK4Gb/gpoMRPQYvt7/SCLSxIRUlINTJamLUHzN96Ywhc
  aUTetzzly+Q6jC/mq67uuikcLzLnb0nFZfBr7xDl1J6eXP9qY5FXKYfKr8Lv99QVLzLy+GcW/
  3C1ftfP/5NNPCplvlT70cKq+8uNDanfI+dKcjA1HlvinsShJ8CzkPLBTbkqRxIISp2uLLUO/L
  Nc5eFpA8vfXK5yr5S739+1asWbDDjkpx4KF6xzlvaoSz9zJnlEe6ji7dnkz+/6maQ+2tx3LCP
  waus6pc/3S5UvF2j14lmy+Y7xQO0I6Mc1MsuCRxDz3i/Zai13z7Xbx2m7cFyvOcts312XStPD
  dluYS938ouLvW+e2eXrXB9nikmIJdf/pp9bJVZxzVWW5emZa8P9+0XYmlOCPRUIu5qDgRAFYd
  gupDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-226.messagelabs.com!1637033774!64332!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24573 invoked from network); 16 Nov 2021 03:36:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 03:36:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AG3a6iQ025393
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:36:14 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 03:36:07 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.7.4 -> 1.7.5
Date: Tue, 16 Nov 2021 11:35:54 +0800
Message-ID: <1637033756-81253-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637033756-81253-1-git-send-email-wangmy@fujitsu.com>
References: <1637033756-81253-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 03:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93964

bug fix:
Adjustments to the test suite to accommodate for error message changes
occurring as of SQLAlchemy 1.4.27.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.7.4.bb => python3-alembic_1.7.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.7.4.bb => python3-alembic_1.7.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.7.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.7.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.7.4.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.7.5.bb
index 17e9e533cd..131d5d43a0 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.7.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9d33f3ff1488c4bfab1e1a6dfebbf085e8a8e1a3e047a43ad29ad1f67f012a1d"
+SRC_URI[sha256sum] = "7c328694a2e68f03ee971e63c3bd885846470373a5b532cf2c9f1601c413b153"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.25.1


